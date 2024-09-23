@implementation MSVPropertyListEncoder

- (MSVPropertyListEncoder)initWithOutputFileHandle:(id)a3
{
  id v5;
  MSVPropertyListEncoder *v6;
  MSVPropertyListEncoder *v7;
  uint64_t v8;
  NSMutableData *outputBuffer;
  NSMutableArray *v10;
  NSMutableArray *containerStack;
  NSMutableString *v12;
  NSMutableString *tabPrefix;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSVPropertyListEncoder;
  v6 = -[MSVPropertyListEncoder init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputFileHandle, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 0x2000);
    outputBuffer = v7->_outputBuffer;
    v7->_outputBuffer = (NSMutableData *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    containerStack = v7->_containerStack;
    v7->_containerStack = v10;

    v12 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    tabPrefix = v7->_tabPrefix;
    v7->_tabPrefix = v12;

    objc_msgSend(CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n"), "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVPropertyListEncoder _writeData:](v7, "_writeData:", v14);

  }
  return v7;
}

- (MSVPropertyListEncoder)init
{
  return -[MSVPropertyListEncoder initWithOutputFileHandle:](self, "initWithOutputFileHandle:", 0);
}

- (void)startArray
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();

  if (v8 != (void *)v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 79, CFSTR("Can only start an array as the root object or if the current parent is an array. To stream an array into the value of a dictionary key use startArrayForKey:"));
LABEL_4:

  }
  -[MSVPropertyListEncoder _startArray](self, "_startArray");
}

- (void)startArrayForKey:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();

  if (v6 != (void *)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 85, CFSTR("Can only start an array for a key if the current parent is a dictionary"));

  }
  -[MSVPropertyListEncoder _writeDictionaryKey:](self, "_writeDictionaryKey:", v9);
  -[MSVPropertyListEncoder _startArray](self, "_startArray");

}

- (void)addObject:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();

  if (v6 != (void *)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 93, CFSTR("Can only add an object if the current parent is an array."));

  }
  -[MSVPropertyListEncoder _addObject:](self, "_addObject:", v9);

}

- (void)endArray
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  if (v5 != (void *)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 99, CFSTR("Can only end an array if the current parent is an array."));

  }
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeLastObject");

  -[MSVPropertyListEncoder _decrementTabPrefix](self, "_decrementTabPrefix");
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v8);

  -[MSVPropertyListEncoder arrayClosingTagData](self, "arrayClosingTagData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v10);

}

- (void)startDictionaryForKey:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();

  if (v6 != (void *)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 113, CFSTR("Can only start a dictionary for a key if the current parent is a dictionary"));

  }
  -[MSVPropertyListEncoder _writeDictionaryKey:](self, "_writeDictionaryKey:", v9);
  -[MSVPropertyListEncoder _startDictionary](self, "_startDictionary");

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a3;
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();

  if (v9 != (void *)v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 121, CFSTR("Can only set an object for a key if the current parent is a dictionary"));

  }
  -[MSVPropertyListEncoder _writeDictionaryKey:](self, "_writeDictionaryKey:", v12);
  -[MSVPropertyListEncoder _addObject:](self, "_addObject:", v7);

}

- (void)endDictionary
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  if (v5 != (void *)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 128, CFSTR("Can only end a dictionary if the current parent is a dictionary"));

  }
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeLastObject");

  -[MSVPropertyListEncoder _decrementTabPrefix](self, "_decrementTabPrefix");
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v8);

  -[MSVPropertyListEncoder dictionaryClosingTagData](self, "dictionaryClosingTagData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v10);

}

- (void)close
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v11 == objc_opt_class())
        {
          -[MSVPropertyListEncoder endArray](self, "endArray");
        }
        else if (v11 == objc_opt_class())
        {
          -[MSVPropertyListEncoder endDictionary](self, "endDictionary");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 147, CFSTR("Invalid container type: %@"), v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(CFSTR("</plist>\n"), "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v13);

  -[MSVPropertyListEncoder _flushOutputBuffer](self, "_flushOutputBuffer");
  -[MSVPropertyListEncoder outputFileHandle](self, "outputFileHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "closeFile");

}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  void *v5;
  void *v6;
  NSDateFormatter *v7;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("'<date>'yyyy-MM-dd'T'HH:mm:ss'Z</date>\n'"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v4, "setLocale:", v5);

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v4, "setTimeZone:", v6);

    v7 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (NSData)arrayOpeningTagData
{
  NSData *arrayOpeningTagData;
  NSData *v4;
  NSData *v5;

  arrayOpeningTagData = self->_arrayOpeningTagData;
  if (!arrayOpeningTagData)
  {
    objc_msgSend(CFSTR("<array>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_arrayOpeningTagData;
    self->_arrayOpeningTagData = v4;

    arrayOpeningTagData = self->_arrayOpeningTagData;
  }
  return arrayOpeningTagData;
}

- (NSData)arrayClosingTagData
{
  NSData *arrayClosingTagData;
  NSData *v4;
  NSData *v5;

  arrayClosingTagData = self->_arrayClosingTagData;
  if (!arrayClosingTagData)
  {
    objc_msgSend(CFSTR("</array>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_arrayClosingTagData;
    self->_arrayClosingTagData = v4;

    arrayClosingTagData = self->_arrayClosingTagData;
  }
  return arrayClosingTagData;
}

- (NSData)dictionaryOpeningTagData
{
  NSData *dictionaryOpeningTagData;
  NSData *v4;
  NSData *v5;

  dictionaryOpeningTagData = self->_dictionaryOpeningTagData;
  if (!dictionaryOpeningTagData)
  {
    objc_msgSend(CFSTR("<dict>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dictionaryOpeningTagData;
    self->_dictionaryOpeningTagData = v4;

    dictionaryOpeningTagData = self->_dictionaryOpeningTagData;
  }
  return dictionaryOpeningTagData;
}

- (NSData)dictionaryClosingTagData
{
  NSData *dictionaryClosingTagData;
  NSData *v4;
  NSData *v5;

  dictionaryClosingTagData = self->_dictionaryClosingTagData;
  if (!dictionaryClosingTagData)
  {
    objc_msgSend(CFSTR("</dict>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dictionaryClosingTagData;
    self->_dictionaryClosingTagData = v4;

    dictionaryClosingTagData = self->_dictionaryClosingTagData;
  }
  return dictionaryClosingTagData;
}

- (NSData)keyOpeningTagData
{
  NSData *keyOpeningTagData;
  NSData *v4;
  NSData *v5;

  keyOpeningTagData = self->_keyOpeningTagData;
  if (!keyOpeningTagData)
  {
    objc_msgSend(CFSTR("<key>"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_keyOpeningTagData;
    self->_keyOpeningTagData = v4;

    keyOpeningTagData = self->_keyOpeningTagData;
  }
  return keyOpeningTagData;
}

- (NSData)keyClosingTagData
{
  NSData *keyClosingTagData;
  NSData *v4;
  NSData *v5;

  keyClosingTagData = self->_keyClosingTagData;
  if (!keyClosingTagData)
  {
    objc_msgSend(CFSTR("</key>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_keyClosingTagData;
    self->_keyClosingTagData = v4;

    keyClosingTagData = self->_keyClosingTagData;
  }
  return keyClosingTagData;
}

- (NSData)stringOpeningTagData
{
  NSData *stringOpeningTagData;
  NSData *v4;
  NSData *v5;

  stringOpeningTagData = self->_stringOpeningTagData;
  if (!stringOpeningTagData)
  {
    objc_msgSend(CFSTR("<string>"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stringOpeningTagData;
    self->_stringOpeningTagData = v4;

    stringOpeningTagData = self->_stringOpeningTagData;
  }
  return stringOpeningTagData;
}

- (NSData)stringClosingTagData
{
  NSData *stringClosingTagData;
  NSData *v4;
  NSData *v5;

  stringClosingTagData = self->_stringClosingTagData;
  if (!stringClosingTagData)
  {
    objc_msgSend(CFSTR("</string>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stringClosingTagData;
    self->_stringClosingTagData = v4;

    stringClosingTagData = self->_stringClosingTagData;
  }
  return stringClosingTagData;
}

- (NSData)dataOpeningTagData
{
  NSData *dataOpeningTagData;
  NSData *v4;
  NSData *v5;

  dataOpeningTagData = self->_dataOpeningTagData;
  if (!dataOpeningTagData)
  {
    objc_msgSend(CFSTR("<data>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dataOpeningTagData;
    self->_dataOpeningTagData = v4;

    dataOpeningTagData = self->_dataOpeningTagData;
  }
  return dataOpeningTagData;
}

- (NSData)dataClosingTagData
{
  NSData *dataClosingTagData;
  NSData *v4;
  NSData *v5;

  dataClosingTagData = self->_dataClosingTagData;
  if (!dataClosingTagData)
  {
    objc_msgSend(CFSTR("</data>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dataClosingTagData;
    self->_dataClosingTagData = v4;

    dataClosingTagData = self->_dataClosingTagData;
  }
  return dataClosingTagData;
}

- (NSData)BOOLTrueTagData
{
  NSData *BOOLTrueTagData;
  NSData *v4;
  NSData *v5;

  BOOLTrueTagData = self->_BOOLTrueTagData;
  if (!BOOLTrueTagData)
  {
    objc_msgSend(CFSTR("<true/>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_BOOLTrueTagData;
    self->_BOOLTrueTagData = v4;

    BOOLTrueTagData = self->_BOOLTrueTagData;
  }
  return BOOLTrueTagData;
}

- (NSData)BOOLFalseTagData
{
  NSData *BOOLFalseTagData;
  NSData *v4;
  NSData *v5;

  BOOLFalseTagData = self->_BOOLFalseTagData;
  if (!BOOLFalseTagData)
  {
    objc_msgSend(CFSTR("<false/>\n"), "dataUsingEncoding:", 4);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_BOOLFalseTagData;
    self->_BOOLFalseTagData = v4;

    BOOLFalseTagData = self->_BOOLFalseTagData;
  }
  return BOOLFalseTagData;
}

- (void)_writeData:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MSVPropertyListEncoder outputBuffer](self, "outputBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(v8, "length") + v5;

  if (v6 > 0x2000)
    -[MSVPropertyListEncoder _flushOutputBuffer](self, "_flushOutputBuffer");
  -[MSVPropertyListEncoder outputBuffer](self, "outputBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v8);

}

- (void)_flushOutputBuffer
{
  void *v3;
  void *v4;
  id v5;

  -[MSVPropertyListEncoder outputFileHandle](self, "outputFileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder outputBuffer](self, "outputBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeData:", v4);

  -[MSVPropertyListEncoder outputBuffer](self, "outputBuffer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLength:", 0);

}

- (void)_addObject:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MSVPropertyListEncoder _encodeString:](self, "_encodeString:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MSVPropertyListEncoder _encodeNumber:](self, "_encodeNumber:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MSVPropertyListEncoder _encodeDate:](self, "_encodeDate:", v5);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[MSVPropertyListEncoder _encodeData:](self, "_encodeData:", v5);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[MSVPropertyListEncoder _startDictionary](self, "_startDictionary");
            v6 = v5;
            objc_msgSend(v6, "allKeys");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v9 = v8;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v26;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v26 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
                  objc_msgSend(v6, "objectForKey:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MSVPropertyListEncoder setObject:forKey:](self, "setObject:forKey:", v15, v14);

                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
              }
              while (v11);
            }

            -[MSVPropertyListEncoder endDictionary](self, "endDictionary");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVPropertyListEncoder.m"), 299, CFSTR("Cannot encode object of type %@"), objc_opt_class());

              goto LABEL_29;
            }
            -[MSVPropertyListEncoder _startArray](self, "_startArray");
            v6 = v5;
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v22;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v22 != v18)
                    objc_enumerationMutation(v6);
                  -[MSVPropertyListEncoder addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
                }
                v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              }
              while (v17);
            }
            -[MSVPropertyListEncoder endArray](self, "endArray");
          }

        }
      }
    }
  }
LABEL_29:

}

- (void)_encodeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v5);

  -[MSVPropertyListEncoder stringOpeningTagData](self, "stringOpeningTagData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v6);

  -[MSVPropertyListEncoder _writeString:](self, "_writeString:", v4);
  -[MSVPropertyListEncoder stringClosingTagData](self, "stringClosingTagData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v7);

}

- (void)_encodeNumber:(id)a3
{
  id v4;
  CFTypeID v5;
  double v6;
  __CFString *v7;
  void *v8;
  CFStringRef v9;
  double v10;
  const __CFString *v11;
  void *v12;
  double valuePtr;

  v4 = a3;
  v5 = CFGetTypeID(v4);
  if (v5 != CFBooleanGetTypeID())
  {
    if (CFNumberIsFloatType((CFNumberRef)v4))
    {
      valuePtr = 0.0;
      CFNumberGetValue((CFNumberRef)v4, kCFNumberFloat64Type, &valuePtr);
      v6 = valuePtr;
      if (valuePtr == 0.0)
      {
        v7 = CFSTR("<real>0.0</real>\n");
LABEL_18:
        -[__CFString dataUsingEncoding:](v7, "dataUsingEncoding:", 4, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      v10 = fabs(valuePtr);
      v11 = CFSTR("<real>-infinity</real>\n");
      if (valuePtr > 0.0)
        v11 = CFSTR("<real>+infinity</real>\n");
      if (v10 == INFINITY)
        v7 = (__CFString *)v11;
      else
        v7 = 0;
      if (v10 == INFINITY)
        goto LABEL_18;
      v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, CFSTR("<real>%.*g</real>\n"), 17, *(_QWORD *)&valuePtr);
    }
    else
    {
      v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, CFSTR("<integer>%@</integer>\n"), v4);
    }
    v7 = (__CFString *)v9;
    goto LABEL_18;
  }
  if (CFBooleanGetValue((CFBooleanRef)v4))
    -[MSVPropertyListEncoder BOOLTrueTagData](self, "BOOLTrueTagData");
  else
    -[MSVPropertyListEncoder BOOLFalseTagData](self, "BOOLFalseTagData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v12);

  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v8);
}

- (void)_encodeDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v5);

  -[MSVPropertyListEncoder dateFormatter](self, "dateFormatter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v7);

}

- (void)_encodeData:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;

  v20 = a3;
  -[MSVPropertyListEncoder tabPrefix](self, "tabPrefix");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[__CFString length](v4, "length") >= 9)
  {

    v4 = CFSTR("\t\t\t\t\t\t\t\t");
  }
  -[__CFString dataUsingEncoding:](v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  v7 = -[__CFString length](v4, "length");
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v8);

  -[MSVPropertyListEncoder dataOpeningTagData](self, "dataOpeningTagData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v9);

  objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  if (objc_msgSend(v10, "length"))
  {
    v12 = 0;
    v13 = 76 - 8 * v7;
    do
    {
      if (v13 >= v11)
        v14 = v11;
      else
        v14 = v13;
      objc_msgSend(v10, "substringWithRange:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v5);
      objc_msgSend(v15, "dataUsingEncoding:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v16);

      -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v6);
      v11 -= v14;

      v12 += v13;
    }
    while (v12 < objc_msgSend(v10, "length"));
  }
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v17);

  -[MSVPropertyListEncoder dataClosingTagData](self, "dataClosingTagData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v18);

}

- (void)_startArray
{
  void *v3;
  void *v4;
  void *v5;

  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v3);

  -[MSVPropertyListEncoder arrayOpeningTagData](self, "arrayOpeningTagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v4);

  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", objc_opt_class());

  -[MSVPropertyListEncoder _incrementTabPrefix](self, "_incrementTabPrefix");
}

- (void)_startDictionary
{
  void *v3;
  void *v4;
  void *v5;

  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v3);

  -[MSVPropertyListEncoder dictionaryOpeningTagData](self, "dictionaryOpeningTagData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v4);

  -[MSVPropertyListEncoder containerStack](self, "containerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", objc_opt_class());

  -[MSVPropertyListEncoder _incrementTabPrefix](self, "_incrementTabPrefix");
}

- (void)_incrementTabPrefix
{
  void *v3;
  void *v4;
  id v5;

  -[MSVPropertyListEncoder tabPrefix](self, "tabPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("\t"));

  -[MSVPropertyListEncoder tabPrefix](self, "tabPrefix");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder setTabPrefixData:](self, "setTabPrefixData:", v4);

}

- (void)_decrementTabPrefix
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MSVPropertyListEncoder tabPrefix](self, "tabPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder tabPrefix](self, "tabPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);

  -[MSVPropertyListEncoder tabPrefix](self, "tabPrefix");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder setTabPrefixData:](self, "setTabPrefixData:", v5);

}

- (void)_writeDictionaryKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MSVPropertyListEncoder tabPrefixData](self, "tabPrefixData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v5);

  -[MSVPropertyListEncoder keyOpeningTagData](self, "keyOpeningTagData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v6);

  -[MSVPropertyListEncoder _writeString:](self, "_writeString:", v4);
  -[MSVPropertyListEncoder keyClosingTagData](self, "keyClosingTagData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v7);

}

- (void)_writeString:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  MSVPropertyListEncoder *v24;
  UniChar buffer[8];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CFStringRef theString;
  const UniChar *v34;
  const char *v35;
  uint64_t v36;
  int64_t v37;
  int64_t v38;
  int64_t v39;
  unsigned __int16 v40[64];
  uint64_t v41;
  CFRange v42;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", -[__CFString length](v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](v4, "length");
  theString = v4;
  v36 = 0;
  v37 = v6;
  CharactersPtr = CFStringGetCharactersPtr(v4);
  CStringPtr = 0;
  v34 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  *(_OWORD *)buffer = 0u;
  v26 = 0u;
  v38 = 0;
  v39 = 0;
  v35 = CStringPtr;
  if (v6)
  {
    v24 = self;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 64;
    while (1)
    {
      if ((unint64_t)v10 >= 4)
        v13 = 4;
      else
        v13 = v10;
      if (v10 < 0 || (v14 = v37, v37 <= v10))
      {
        v15 = 0;
      }
      else
      {
        if (v34)
        {
          v15 = v34[v10 + v36];
        }
        else if (v35)
        {
          v15 = v35[v36 + v10];
        }
        else
        {
          if (v39 <= v10 || (v16 = v38, v38 > v10))
          {
            v17 = v13 + v9;
            v18 = v12 - v13;
            v19 = v10 - v13;
            v20 = v19 + 64;
            if (v19 + 64 >= v37)
              v20 = v37;
            v38 = v19;
            v39 = v20;
            if (v37 >= v18)
              v14 = v18;
            v42.length = v14 + v17;
            v42.location = v19 + v36;
            CFStringGetCharacters(theString, v42, buffer);
            v16 = v38;
          }
          v15 = buffer[v10 - v16];
        }
        if (v11 >= 62 && (v15 & 0xFC00) == 0xD800)
        {
          _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
          v11 = 0;
        }
        switch(v15)
        {
          case '&':
            if (v11)
              _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
            v21 = v5;
            v22 = "&amp;";
            v23 = 5;
LABEL_41:
            objc_msgSend(v21, "appendBytes:length:", v22, v23);
LABEL_42:
            v11 = 0;
            goto LABEL_43;
          case '>':
            if (v11)
              _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
            v21 = v5;
            v22 = "&gt;";
            goto LABEL_37;
          case '<':
            if (v11)
              _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
            v21 = v5;
            v22 = "&lt;";
LABEL_37:
            v23 = 4;
            goto LABEL_41;
        }
      }
      v40[v11++] = v15;
      if (v11 == 64)
      {
        _MSVPropertyListEncoderAppendCharacters(v5, v40, 0x40uLL);
        goto LABEL_42;
      }
LABEL_43:
      ++v10;
      --v9;
      ++v12;
      if (v6 == v10)
      {
        self = v24;
        if (v11)
          _MSVPropertyListEncoderAppendCharacters(v5, v40, v11);
        break;
      }
    }
  }

  -[MSVPropertyListEncoder _writeData:](self, "_writeData:", v5);
}

- (NSFileHandle)outputFileHandle
{
  return self->_outputFileHandle;
}

- (void)setOutputFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_outputFileHandle, a3);
}

- (NSMutableData)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setOutputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_outputBuffer, a3);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSMutableArray)containerStack
{
  return self->_containerStack;
}

- (void)setContainerStack:(id)a3
{
  objc_storeStrong((id *)&self->_containerStack, a3);
}

- (NSMutableString)tabPrefix
{
  return self->_tabPrefix;
}

- (void)setTabPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_tabPrefix, a3);
}

- (NSData)tabPrefixData
{
  return self->_tabPrefixData;
}

- (void)setTabPrefixData:(id)a3
{
  objc_storeStrong((id *)&self->_tabPrefixData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabPrefixData, 0);
  objc_storeStrong((id *)&self->_tabPrefix, 0);
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_outputBuffer, 0);
  objc_storeStrong((id *)&self->_outputFileHandle, 0);
  objc_storeStrong((id *)&self->_BOOLFalseTagData, 0);
  objc_storeStrong((id *)&self->_BOOLTrueTagData, 0);
  objc_storeStrong((id *)&self->_dataClosingTagData, 0);
  objc_storeStrong((id *)&self->_dataOpeningTagData, 0);
  objc_storeStrong((id *)&self->_stringClosingTagData, 0);
  objc_storeStrong((id *)&self->_stringOpeningTagData, 0);
  objc_storeStrong((id *)&self->_keyClosingTagData, 0);
  objc_storeStrong((id *)&self->_keyOpeningTagData, 0);
  objc_storeStrong((id *)&self->_dictionaryClosingTagData, 0);
  objc_storeStrong((id *)&self->_dictionaryOpeningTagData, 0);
  objc_storeStrong((id *)&self->_arrayClosingTagData, 0);
  objc_storeStrong((id *)&self->_arrayOpeningTagData, 0);
}

@end
