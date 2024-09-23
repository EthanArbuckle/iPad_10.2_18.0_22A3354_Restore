@implementation MFProgressiveMimeParser

- (MFProgressiveMimeParser)initWithBodyData:(id)a3 topLevelHeaders:(id)a4 headersToPreserve:(id)a5
{
  MFProgressiveMimeParser *v8;
  MFProgressiveMimeParser *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFProgressiveMimeParser;
  v8 = -[MFProgressiveMimeParser init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3 && a4)
    {
      v8->_data = (NSMutableData *)a3;
      v9->_lastLength = objc_msgSend(a3, "length");
      v9->_preserveHeaders = (NSArray *)a5;
      -[MFProgressiveMimeParser _initializeTopLevelPartWithHeaders:](v9, "_initializeTopLevelPartWithHeaders:", a4);
    }
    else
    {
      -[MFProgressiveMimeParser dealloc](v8, "dealloc");
      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFProgressiveMimeParser;
  -[MFProgressiveMimeParser dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  char v4;
  char v5;
  char v6;

  if (self->_delegate != a3)
  {
    self->_delegate = a3;
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xFD | v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xFB | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0xF7 | v6;
  }
}

- (void)setContext:(id)a3
{
  self->_context = a3;
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
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSArray *preserveHeaders;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char parserFlags;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_topLevelPart = (MFMimePart *)objc_alloc_init(MEMORY[0x1E0D460F0]);
  v5 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D1E558]);
  if (v5)
  {
    strlen((const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));
    if ((MFMimePartParseContentTypeHeader() & 1) != 0)
      goto LABEL_6;
    v6 = CFSTR("Unable to parse Content-type header in top-level part");
  }
  else
  {
    v6 = CFSTR("No Content-type header found in top-level part");
  }
  -[MFProgressiveMimeParser _reportError:](self, "_reportError:", v6);
LABEL_6:
  v7 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D1E550]);
  if (v7)
    -[MFMimePart setContentTransferEncoding:](self->_topLevelPart, "setContentTransferEncoding:", v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  preserveHeaders = self->_preserveHeaders;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](preserveHeaders, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(preserveHeaders);
        if (objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)))
          MFMimePartSetValueForPreservedHeader();
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](preserveHeaders, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
  -[MFMimePart setRange:](self->_topLevelPart, "setRange:", 0, 0);
  self->_currentPart = self->_topLevelPart;
  parserFlags = (char)self->_parserFlags;
  *(_BYTE *)&self->_parserFlags = parserFlags & 0x8F | 0x30;
  if ((parserFlags & 1) != 0)
    objc_msgSend(self->_delegate, "progressiveMimeParser:beganMimePart:", self);
}

- (void)_continueParsingStartOfPart
{
  uint64_t v3;
  unint64_t cursor;
  int v5;
  MFMimePart *v6;
  char parserFlags;

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

        self->_currentBoundary = 0;
      }
      self->_currentPart = (MFMimePart *)-[MFMimePart parentPart](self->_currentPart, "parentPart");
      *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0x8F | 0x40;
      return;
    }
  }
  v6 = (MFMimePart *)objc_alloc_init(MEMORY[0x1E0D460F0]);
  -[MFMimePart setRange:](v6, "setRange:", self->_cursor, 0);
  -[MFMimePart addSubpart:](self->_currentPart, "addSubpart:", v6);

  self->_currentPart = v6;
  parserFlags = (char)self->_parserFlags;
  *(_BYTE *)&self->_parserFlags = parserFlags & 0x8F | 0x20;
  if ((parserFlags & 1) != 0)
    objc_msgSend(self->_delegate, "progressiveMimeParser:beganMimePart:", self, v6);
}

- (void)_continueParsingHeaders
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *StringFromHeaderBytes;
  NSArray *preserveHeaders;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      v19 = 0;
      v20 = 0;
      v5 = -[NSMutableData bytes](self->_data, "bytes");
      v6 = -[MFMimePart range](self->_currentPart, "range");
      v7 = self->_cursor - v6;
      if (MFMimeDataGetRangeOfHeader(&v19, 0, *MEMORY[0x1E0D1E558], self->_data, v6, v7))
      {
        if (*(_BYTE *)(v19 + v20 + v5 - 1) == 13)
          --v20;
        MFMimePartParseContentTypeHeader();
      }
      if (MFMimeDataGetRangeOfHeader(&v19, 0, *MEMORY[0x1E0D1E530], self->_data, v6, v7))
      {
        if (*(_BYTE *)(v19 + v20 + v5 - 1) == 13)
          --v20;
        MFMimePartParseContentDispositionHeader();
      }
      if (MFMimeDataGetRangeOfHeader(&v19, 0, *MEMORY[0x1E0D1E550], self->_data, v6, v7))
      {
        if (*(_BYTE *)(v19 + v20 + v5 - 1) == 13)
          --v20;
        StringFromHeaderBytes = (void *)MFMimeDataCreateStringFromHeaderBytes(0xFFFFFFFFLL, v5 + v19);
        -[MFMimePart setContentTransferEncoding:](self->_currentPart, "setContentTransferEncoding:", StringFromHeaderBytes);

      }
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      preserveHeaders = self->_preserveHeaders;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](preserveHeaders, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(preserveHeaders);
            if (MFMimeDataGetRangeOfHeader(&v19, 0, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), self->_data, v6, v7))
            {
              if (*(_BYTE *)(v19 + v20 + v5 - 1) == 13)
                --v20;
              v14 = (void *)MFMimeDataCreateStringFromHeaderBytes(0xFFFFFFFFLL, v5 + v19);
              MFMimePartSetValueForPreservedHeader();

            }
          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](preserveHeaders, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v11);
      }
      -[MFMimePart setRange:](self->_currentPart, "setRange:", self->_cursor, 0);
      *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0x8F | 0x30;
      if (objc_msgSend((id)-[MFMimePart type](self->_currentPart, "type"), "isEqualToString:", CFSTR("multipart")))
      {

        self->_currentBoundary = 0;
      }
    }
  }
}

- (id)_currentBoundary
{
  NSData *currentBoundary;
  void *v4;
  const char *v5;
  size_t v6;

  currentBoundary = self->_currentBoundary;
  if (!currentBoundary)
  {
    v4 = (void *)-[MFMimePart bodyParameterForKey:](self->_currentPart, "bodyParameterForKey:", CFSTR("boundary"));
    if (!v4)
    {
      currentBoundary = self->_currentBoundary;
      if (currentBoundary)
        return currentBoundary;
      goto LABEL_4;
    }
    v5 = (const char *)objc_msgSend(v4, "cStringUsingEncoding:", 1);
    v6 = strlen(v5);
    currentBoundary = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v6 + 4);
    -[NSData mf_appendCString:](currentBoundary, "mf_appendCString:", "\r\n--");
    -[NSData appendBytes:length:](currentBoundary, "appendBytes:length:", v5, v6);
    self->_currentBoundary = currentBoundary;
    if (!currentBoundary)
    {
LABEL_4:
      currentBoundary = (NSData *)(id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      self->_currentBoundary = currentBoundary;
    }
  }
  return currentBoundary;
}

- (void)_continueParsingBody
{
  unint64_t cursor;
  unint64_t lastLength;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  int v8;
  BOOL v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char parserFlags;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  id v29;

  v29 = -[MFProgressiveMimeParser _currentBoundary](self, "_currentBoundary");
  cursor = self->_cursor;
  lastLength = self->_lastLength;
  v5 = -[NSMutableData bytes](self->_data, "bytes");
  if (!v29)
  {
    v29 = 0;
    goto LABEL_12;
  }
  v6 = v5;
  v7 = lastLength - cursor;
  v8 = objc_msgSend(v29, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  if (cursor)
    v9 = 0;
  else
    v9 = v7 >= 3;
  if (v9)
    v10 = v8;
  else
    v10 = 1;
  if ((v10 & 1) != 0)
  {
    if ((v8 & 1) == 0)
    {
      v11 = v29;
      goto LABEL_14;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_24;
  }
  v13 = objc_msgSend(v29, "bytes");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v13 + 2, objc_msgSend(v29, "length") - 2, 0);
LABEL_14:
  v29 = v11;
  v14 = objc_msgSend(v11, "length");
  if (v7 >= v14)
  {
    v15 = -[NSMutableData mf_rangeOfData:options:range:](self->_data, "mf_rangeOfData:options:range:", v29, 0, cursor, lastLength - cursor);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = v15;
      v25 = v16;
      v26 = -[MFMimePart range](self->_currentPart, "range");
      if (v24 == v26 || v24 == 0)
        v28 = 0;
      else
        v28 = v24 - v26;
      -[MFMimePart setRange:](self->_currentPart, "setRange:", v26, v28);
      if ((*(_BYTE *)&self->_parserFlags & 0x74) == 0x34)
        objc_msgSend(self->_delegate, "progressiveMimeParser:beganDataForMimePart:", self, self->_currentPart);
      if ((objc_msgSend((id)-[MFMimePart type](self->_currentPart, "type"), "isEqualToString:", CFSTR("multipart")) & 1) == 0)
      {
        if ((*(_BYTE *)&self->_parserFlags & 2) != 0)
          objc_msgSend(self->_delegate, "progressiveMimeParser:finishedMimePart:", self, self->_currentPart);
        self->_currentPart = (MFMimePart *)-[MFMimePart parentPart](self->_currentPart, "parentPart");
      }
      self->_cursor = v24 + v25;
      *(_BYTE *)&self->_parserFlags = *(_BYTE *)&self->_parserFlags & 0x8F | 0x10;
      if ((v10 & 1) == 0)
        goto LABEL_28;
      return;
    }
  }
  v12 = v10 ^ 1;
  if (v14 < v7)
    v7 = v14;
  v17 = objc_msgSend(v29, "bytes");
  if (-(uint64_t)v7 < 0)
  {
    v18 = (const void *)v17;
    v19 = v6 + lastLength;
    v20 = (char *)(v6 + lastLength - v7);
    while (memcmp(v20, v18, v7))
    {
      ++v20;
      --v7;
      if ((unint64_t)v20 >= v19)
        goto LABEL_22;
    }
    v21 = self->_lastLength - v7;
  }
  else
  {
LABEL_22:
    v21 = self->_lastLength;
  }
  self->_cursor = v21;
LABEL_24:
  v22 = -[MFMimePart range](self->_currentPart, "range");
  -[MFMimePart setRange:](self->_currentPart, "setRange:", v22, self->_cursor - v22);
  parserFlags = (char)self->_parserFlags;
  if ((parserFlags & 0x70) == 0x30)
  {
    *(_BYTE *)&self->_parserFlags = parserFlags & 0x8F | 0x40;
    if ((parserFlags & 4) != 0)
      objc_msgSend(self->_delegate, "progressiveMimeParser:beganDataForMimePart:", self, self->_currentPart);
  }
  if (v12)
LABEL_28:

}

- (void)_continueParsing
{
  int v3;
  int v4;

  if (self->_cursor < self->_lastLength)
  {
    v3 = 0;
    do
    {
      v4 = v3;
      v3 = (*(_BYTE *)&self->_parserFlags >> 4) & 7;
      if (v4 == v3)
        break;
      if ((v3 - 3) < 2)
      {
        -[MFProgressiveMimeParser _continueParsingBody](self, "_continueParsingBody");
      }
      else if (v3 == 2)
      {
        -[MFProgressiveMimeParser _continueParsingHeaders](self, "_continueParsingHeaders");
      }
      else if (v3 == 1)
      {
        -[MFProgressiveMimeParser _continueParsingStartOfPart](self, "_continueParsingStartOfPart");
      }
      else
      {
        -[MFProgressiveMimeParser _reportError:](self, "_reportError:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parser state (%d)"), (*(_BYTE *)&self->_parserFlags >> 4) & 7));
      }
    }
    while (self->_cursor < self->_lastLength);
  }
}

- (void)_reportError:(id)a3
{
  if ((*(_BYTE *)&self->_parserFlags & 8) != 0)
    objc_msgSend(self->_delegate, "progressiveMimeParser:failedWithError:", self, +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("ProgressiveMimeParseErrorDomain"), -1, a3));
}

@end
