@implementation MFProgressiveMimeParser

- (MFProgressiveMimeParser)initWithBodyData:(id)a3 topLevelHeaders:(id)a4 headersToPreserve:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFProgressiveMimeParser *v12;
  MFProgressiveMimeParser *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFProgressiveMimeParser;
  v12 = -[MFProgressiveMimeParser init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    if (v9 && v10)
    {
      objc_storeStrong((id *)&v12->_data, a3);
      v13->_lastLength = objc_msgSend(v9, "length");
      objc_storeStrong((id *)&v13->_preserveHeaders, a5);
      -[MFProgressiveMimeParser _initializeTopLevelPartWithHeaders:](v13, "_initializeTopLevelPartWithHeaders:", v10);
    }
    else
    {

      v13 = 0;
    }
  }

  return v13;
}

- (void)setDelegate:(id)a3
{
  id v5;
  char v6;
  char v7;
  char v8;
  id v9;

  v5 = a3;
  if (self->_delegate != v5)
  {
    v9 = v5;
    objc_storeStrong(&self->_delegate, a3);
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xF7 | v8;
    v5 = v9;
  }

}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (id)context
{
  return self->_context;
}

- (void)noteDataLengthChanged:(unsigned int)a3
{
  unint64_t v4;

  if (self->_lastLength < a3)
  {
    v4 = a3;
    if (-[NSMutableData length](self->_data, "length") >= a3)
    {
      self->_lastLength = v4;
      -[MFProgressiveMimeParser _continueParsing](self, "_continueParsing");
    }
    else
    {
      -[MFProgressiveMimeParser _reportError:](self, "_reportError:", CFSTR("Data is not as long as reported"));
    }
  }
}

- (id)topLevelPart
{
  return self->_topLevelPart;
}

- (id)currentPart
{
  return self->_currentPart;
}

- (id)data
{
  return self->_data;
}

- (void)_initializeTopLevelPartWithHeaders:(id)a3
{
  id v4;
  MFMimePart *v5;
  MFMimePart *topLevelPart;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  uint64_t v15;
  char parserFlags;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (MFMimePart *)objc_alloc_init(MEMORY[0x1E0D460F0]);
  topLevelPart = self->_topLevelPart;
  self->_topLevelPart = v5;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1E558]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    strlen((const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4));
    if ((MFMimePartParseContentTypeHeader() & 1) == 0)
      -[MFProgressiveMimeParser _reportError:](self, "_reportError:", CFSTR("Unable to parse Content-type header in top-level part"));
  }
  else
  {
    -[MFProgressiveMimeParser _reportError:](self, "_reportError:", CFSTR("No Content-type header found in top-level part"));
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1E550]);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    -[MFMimePart setContentTransferEncoding:](self->_topLevelPart, "setContentTransferEncoding:", v9);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_preserveHeaders;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    v13 = (void *)v9;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
        if (v15)
          MFMimePartSetValueForPreservedHeader();
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  else
  {
    v13 = (void *)v9;
  }

  -[MFMimePart setRange:](self->_topLevelPart, "setRange:", 0, 0);
  objc_storeStrong((id *)&self->_currentPart, self->_topLevelPart);
  parserFlags = (char)self->_parserFlags;
  *(_BYTE *)&self->_parserFlags = parserFlags & 0x8F | 0x30;
  if ((parserFlags & 1) != 0)
    objc_msgSend(self->_delegate, "progressiveMimeParser:beganMimePart:", self, self->_topLevelPart);

}

- (void)_continueParsingStartOfPart
{
  uint64_t v3;
  unint64_t cursor;
  int v5;
  NSData *currentBoundary;
  MFMimePart *v7;
  MFMimePart *currentPart;
  char parserFlags;
  id obj;

  v3 = -[NSMutableData bytes](self->_data, "bytes");
  cursor = self->_cursor;
  v5 = *(unsigned __int8 *)(v3 + cursor);
  if ((v5 | 0x20) == 0x2D)
  {
    if (cursor - self->_lastLength < 2)
      return;
    if (v5 == 13)
    {
      if (*(_BYTE *)(cursor + v3 + 1) == 10)
        self->_cursor = cursor + 2;
    }
    else if (v5 == 45 && *(_BYTE *)(cursor + v3 + 1) == 45)
    {
      self->_cursor = cursor + 2;
      if ((*(_BYTE *)&self->_parserFlags & 2) != 0)
      {
        objc_msgSend(self->_delegate, "progressiveMimeParser:finishedMimePart:", self, self->_currentPart);
        currentBoundary = self->_currentBoundary;
        self->_currentBoundary = 0;

      }
      -[MFMimePart parentPart](self->_currentPart, "parentPart");
      v7 = (MFMimePart *)objc_claimAutoreleasedReturnValue();
      currentPart = self->_currentPart;
      self->_currentPart = v7;

      *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0x8F | 0x40;
      return;
    }
  }
  obj = objc_alloc_init(MEMORY[0x1E0D460F0]);
  objc_msgSend(obj, "setRange:", self->_cursor, 0);
  -[MFMimePart addSubpart:](self->_currentPart, "addSubpart:", obj);
  objc_storeStrong((id *)&self->_currentPart, obj);
  parserFlags = (char)self->_parserFlags;
  *(_BYTE *)&self->_parserFlags = parserFlags & 0x8F | 0x20;
  if ((parserFlags & 1) != 0)
    objc_msgSend(self->_delegate, "progressiveMimeParser:beganMimePart:", self, self->_currentPart);

}

- (void)_continueParsingHeaders
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSData *currentBoundary;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_lastLength - self->_cursor >= 4)
  {
    v3 = -[NSMutableData mf_rangeOfCString:options:range:](self->_data, "mf_rangeOfCString:options:range:", "\r\n\r\n", 0);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_cursor = self->_lastLength;
    }
    else
    {
      self->_cursor = v3 + v4;
      v22 = 0xAAAAAAAAAAAAAAAALL;
      v23 = 0xAAAAAAAAAAAAAAAALL;
      v17 = -[NSMutableData bytes](self->_data, "bytes");
      v5 = -[MFMimePart range](self->_currentPart, "range");
      v6 = self->_cursor - v5;
      if (MFMimeDataGetRangeOfHeader(&v22, 0, *MEMORY[0x1E0D1E558], self->_data, v5, v6))
      {
        if (*(_BYTE *)(v22 + v23 + v17 - 1) == 13)
          --v23;
        MFMimePartParseContentTypeHeader();
      }
      if (MFMimeDataGetRangeOfHeader(&v22, 0, *MEMORY[0x1E0D1E530], self->_data, v5, v6))
      {
        if (*(_BYTE *)(v22 + v23 + v17 - 1) == 13)
          --v23;
        MFMimePartParseContentDispositionHeader();
      }
      if (MFMimeDataGetRangeOfHeader(&v22, 0, *MEMORY[0x1E0D1E550], self->_data, v5, v6))
      {
        if (*(_BYTE *)(v22 + v23 + v17 - 1) == 13)
          --v23;
        MFMimeDataCreateStringFromHeaderBytes();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMimePart setContentTransferEncoding:](self->_currentPart, "setContentTransferEncoding:", v7);

      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = self->_preserveHeaders;
      v9 = 0;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            if (MFMimeDataGetRangeOfHeader(&v22, 0, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), self->_data, v5, v6))
            {
              if (*(_BYTE *)(v22 + v23 + v17 - 1) == 13)
                --v23;
              MFMimeDataCreateStringFromHeaderBytes();
              v13 = objc_claimAutoreleasedReturnValue();

              v9 = (void *)v13;
              MFMimePartSetValueForPreservedHeader();
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v10);
      }

      -[MFMimePart setRange:](self->_currentPart, "setRange:", self->_cursor, 0);
      *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0x8F | 0x30;
      -[MFMimePart type](self->_currentPart, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("multipart"));

      if (v15)
      {
        currentBoundary = self->_currentBoundary;
        self->_currentBoundary = 0;

      }
    }
  }
}

- (id)_currentBoundary
{
  NSData *currentBoundary;
  MFMimePart *v4;
  void *v5;
  void *v6;
  const char *v7;
  size_t v8;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  NSData *v12;

  currentBoundary = self->_currentBoundary;
  if (!currentBoundary)
  {
    v4 = self->_currentPart;
    -[MFMimePart bodyParameterForKey:](v4, "bodyParameterForKey:", CFSTR("boundary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", 1);
      v8 = strlen(v7);
      v9 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v8 + 4);
      -[NSData mf_appendCString:](v9, "mf_appendCString:", "\r\n--");
      -[NSData appendBytes:length:](v9, "appendBytes:length:", v7, v8);
      v10 = self->_currentBoundary;
      self->_currentBoundary = v9;

    }
    if (!self->_currentBoundary)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (NSData *)objc_claimAutoreleasedReturnValue();
      v12 = self->_currentBoundary;
      self->_currentBoundary = v11;

    }
    currentBoundary = self->_currentBoundary;
  }
  return currentBoundary;
}

- (void)_continueParsingBody
{
  unint64_t cursor;
  unint64_t lastLength;
  uint64_t v5;
  void *v6;
  char v7;
  size_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  char parserFlags;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  char v28;
  MFMimePart *v29;
  MFMimePart *currentPart;
  id v31;
  id v32;

  -[MFProgressiveMimeParser _currentBoundary](self, "_currentBoundary");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  cursor = self->_cursor;
  lastLength = self->_lastLength;
  v5 = -[NSMutableData bytes](self->_data, "bytes");
  if (!v31)
  {
    v31 = 0;
LABEL_23:
    v21 = -[MFMimePart range](self->_currentPart, "range");
    -[MFMimePart setRange:](self->_currentPart, "setRange:", v21, self->_cursor - v21);
    parserFlags = (char)self->_parserFlags;
    if ((parserFlags & 0x70) == 0x30)
    {
      *(_BYTE *)&self->_parserFlags = parserFlags & 0x8F | 0x40;
      if ((parserFlags & 4) != 0)
        objc_msgSend(self->_delegate, "progressiveMimeParser:beganDataForMimePart:", self, self->_currentPart);
    }
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v31, "isEqual:", v6);
  v8 = lastLength - cursor;

  if (cursor)
    v9 = 0;
  else
    v9 = v8 >= 3;
  if (v9)
    v10 = v7;
  else
    v10 = 1;
  if ((v10 & 1) != 0)
  {
    if ((v7 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
    v32 = objc_retainAutorelease(v31);
    v11 = objc_msgSend(v32, "bytes");
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v11 + 2, objc_msgSend(v32, "length") - 2, 0);

    v31 = (id)v12;
  }
  v13 = objc_msgSend(v31, "length");
  if (v8 < v13
    || (v15 = -[NSMutableData mf_rangeOfData:options:range:](self->_data, "mf_rangeOfData:options:range:", v31, 0, cursor, lastLength - cursor), v15 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v31 = objc_retainAutorelease(v31);
    v16 = objc_msgSend(v31, "bytes");
    if (v13 < v8)
      v8 = v13;
    if ((uint64_t)v8 <= 0)
    {
LABEL_21:
      v20 = self->_lastLength;
    }
    else
    {
      v17 = (const void *)v16;
      v18 = v5 + lastLength;
      v19 = (char *)(v5 + lastLength - v8);
      while (memcmp(v19, v17, v8))
      {
        ++v19;
        --v8;
        if ((unint64_t)v19 >= v18)
          goto LABEL_21;
      }
      v20 = self->_lastLength - v8;
    }
    self->_cursor = v20;
    goto LABEL_23;
  }
  v23 = v14;
  v24 = -[MFMimePart range](self->_currentPart, "range");
  if (v15 == v24 || v15 == 0)
    v26 = 0;
  else
    v26 = v15 - v24;
  -[MFMimePart setRange:](self->_currentPart, "setRange:", v24, v26);
  if ((*(_BYTE *)&self->_parserFlags & 0x74) == 0x34)
    objc_msgSend(self->_delegate, "progressiveMimeParser:beganDataForMimePart:", self, self->_currentPart);
  -[MFMimePart type](self->_currentPart, "type");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("multipart"));

  if ((v28 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_parserFlags & 2) != 0)
      objc_msgSend(self->_delegate, "progressiveMimeParser:finishedMimePart:", self, self->_currentPart);
    -[MFMimePart parentPart](self->_currentPart, "parentPart");
    v29 = (MFMimePart *)objc_claimAutoreleasedReturnValue();
    currentPart = self->_currentPart;
    self->_currentPart = v29;

  }
  self->_cursor = v15 + v23;
  *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0x8F | 0x10;
LABEL_39:

}

- (void)_continueParsing
{
  unint64_t v3;
  unint64_t v4;
  void *v5;

  if (self->_cursor < self->_lastLength)
  {
    v3 = 0;
    do
    {
      v4 = v3;
      v3 = ((unint64_t)*(_BYTE *)&self->_parserFlags >> 4) & 7;
      if (v4 == v3)
        break;
      if ((v3 - 3) < 2)
      {
        -[MFProgressiveMimeParser _continueParsingBody](self, "_continueParsingBody");
      }
      else if ((_DWORD)v3 == 2)
      {
        -[MFProgressiveMimeParser _continueParsingHeaders](self, "_continueParsingHeaders");
      }
      else if ((_DWORD)v3 == 1)
      {
        -[MFProgressiveMimeParser _continueParsingStartOfPart](self, "_continueParsingStartOfPart");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parser state (%d)"), ((unint64_t)*(_BYTE *)&self->_parserFlags >> 4) & 7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFProgressiveMimeParser _reportError:](self, "_reportError:", v5);

      }
    }
    while (self->_cursor < self->_lastLength);
  }
}

- (void)_reportError:(id)a3
{
  id v4;
  id delegate;
  void *v6;
  id v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_parserFlags & 8) != 0)
  {
    delegate = self->_delegate;
    v7 = v4;
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("ProgressiveMimeParseErrorDomain"), -1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(delegate, "progressiveMimeParser:failedWithError:", self, v6);

    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBoundary, 0);
  objc_storeStrong((id *)&self->_currentPart, 0);
  objc_storeStrong((id *)&self->_topLevelPart, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_preserveHeaders, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
