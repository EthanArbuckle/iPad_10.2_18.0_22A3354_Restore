@implementation AVAirMessageParts

void __68__AVAirMessageParts_AVAirMessages__registerClass_forMessageVersion___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_registeredMessageClasses;
  _registeredMessageClasses = (uint64_t)v0;

}

+ (void)registerClass:(Class)a3 forMessageVersion:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = registerClass_forMessageVersion__onceToken;
  v6 = a4;
  if (v5 != -1)
    dispatch_once(&registerClass_forMessageVersion__onceToken, &__block_literal_global_176);
  NSStringFromClass(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_registeredMessageClasses, "setObject:forKeyedSubscript:", v7, v6);

}

- (AVAirMessageParts)initWithVersion:(id)a3 headers:(id)a4 expectedBodyLength:(int64_t)a5 body:(id)a6 extra:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AVAirMessageParts *v16;
  uint64_t v17;
  NSString *version;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSData *rawBodyData;
  uint64_t v24;
  NSData *extraData;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)AVAirMessageParts;
  v16 = -[AVAirMessageParts init](&v27, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    version = v16->_version;
    v16->_version = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v16->_headers, v21);

    v22 = objc_msgSend(v14, "copy");
    rawBodyData = v16->_rawBodyData;
    v16->_rawBodyData = (NSData *)v22;

    v24 = objc_msgSend(v15, "copy");
    extraData = v16->_extraData;
    v16->_extraData = (NSData *)v24;

    v16->_isIncomplete = v14 == 0;
    v16->_expectedBodyLength = a5;
  }

  return v16;
}

- (void)_setIncomplete
{
  self->_isIncomplete = 1;
}

- (void)_identifyUniqueAndRepeatedHeadersIfNecessary
{
  NSDictionary *v3;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *uniqueHeaders;
  NSDictionary *v16;
  NSArray *repeatedHeaders;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_uniqueHeaders)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[AVAirMessageParts headers](self, "headers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "key");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[NSArray addObject:](v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(v10, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    uniqueHeaders = self->_uniqueHeaders;
    self->_uniqueHeaders = v3;
    v16 = v3;

    repeatedHeaders = self->_repeatedHeaders;
    self->_repeatedHeaders = v4;

  }
}

- (NSDictionary)uniqueHeaders
{
  -[AVAirMessageParts _identifyUniqueAndRepeatedHeadersIfNecessary](self, "_identifyUniqueAndRepeatedHeadersIfNecessary");
  return self->_uniqueHeaders;
}

- (NSArray)repeatedHeaders
{
  -[AVAirMessageParts _identifyUniqueAndRepeatedHeadersIfNecessary](self, "_identifyUniqueAndRepeatedHeadersIfNecessary");
  return self->_repeatedHeaders;
}

- (NSString)bodyAsUTF8Text
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (!-[AVAirMessageParts isIncomplete](self, "isIncomplete"))
  {
    -[AVAirMessageParts uncompressedBodyData](self, "uncompressedBodyData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[AVAirMessageParts rawBodyData](self, "rawBodyData");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;

    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    goto LABEL_8;
  }
  -[AVAirMessageParts rawBodyData](self, "rawBodyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[AVAirMessageParts rawBodyData](self, "rawBodyData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
LABEL_8:
    v3 = (void *)objc_msgSend(v6, "initWithData:encoding:", v5, 4);

  }
  return (NSString *)v3;
}

- (id)bodyAsJSON
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[AVAirMessageParts isIncomplete](self, "isIncomplete"))
    return 0;
  -[AVAirMessageParts uncompressedBodyData](self, "uncompressedBodyData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AVAirMessageParts rawBodyData](self, "rawBodyData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 4, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (!v8)
  {
    _avairlog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[AVAirMessageParts bodyAsJSON]";
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s JSON deserialization failed: %{public}@", buf, 0x16u);
    }

  }
  return v8;
}

- (NSDictionary)bodyAsJSONDictionary
{
  void *v2;
  id v3;

  -[AVAirMessageParts bodyAsJSON](self, "bodyAsJSON");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (id)decompressBodyUsingAlgorithm:(int64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[AVAirMessageParts isIncomplete](self, "isIncomplete"))
    return 0;
  -[AVAirMessageParts rawBodyData](self, "rawBodyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    objc_msgSend(v6, "decompressedDataUsingAlgorithm:error:", a3, &v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (!v8)
    {
      _avairlog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[AVAirMessageParts decompressBodyUsingAlgorithm:]";
        v14 = 2114;
        v15 = v9;
        _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data (%{public}@)", buf, 0x16u);
      }

    }
    v7 = (void *)v8;
  }
  return v7;
}

- (id)decompressBodyUsingNamedAlgorithm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[AVAirMessageParts isIncomplete](self, "isIncomplete"))
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length") && !objc_msgSend(v6, "isEqualToString:", CFSTR("none")))
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("lzfse")) & 1) != 0)
      {
        v8 = 0;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("lz4")) & 1) != 0)
      {
        v8 = 1;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("zlib")) & 1) != 0)
      {
        v8 = 3;
      }
      else
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("lzma")) & 1) == 0)
        {
          _avairlog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = 136315394;
            v12 = "-[AVAirMessageParts decompressBodyUsingNamedAlgorithm:]";
            v13 = 2114;
            v14 = v4;
            _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data; algorithm name '%{public}@' is not recognized",
              (uint8_t *)&v11,
              0x16u);
          }

          v5 = 0;
          goto LABEL_16;
        }
        v8 = 2;
      }
      -[AVAirMessageParts decompressBodyUsingAlgorithm:](self, "decompressBodyUsingAlgorithm:", v8);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AVAirMessageParts rawBodyData](self, "rawBodyData");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;
LABEL_16:

    goto LABEL_17;
  }
  v5 = 0;
LABEL_17:

  return v5;
}

- (BOOL)shouldCallReverseTransformerAgain
{
  BOOL v3;
  void *v4;

  if (-[AVAirMessageParts isIncomplete](self, "isIncomplete"))
    return 0;
  -[AVAirMessageParts extraData](self, "extraData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (BOOL)isIncomplete
{
  return self->_isIncomplete;
}

- (NSString)version
{
  return self->_version;
}

- (NSArray)headers
{
  return self->_headers;
}

- (int64_t)expectedBodyLength
{
  return self->_expectedBodyLength;
}

- (NSData)rawBodyData
{
  return self->_rawBodyData;
}

- (NSData)extraData
{
  return self->_extraData;
}

- (NSData)uncompressedBodyData
{
  return self->_uncompressedBodyData;
}

- (void)setUncompressedBodyData:(id)a3
{
  objc_storeStrong((id *)&self->_uncompressedBodyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncompressedBodyData, 0);
  objc_storeStrong((id *)&self->_extraData, 0);
  objc_storeStrong((id *)&self->_rawBodyData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_repeatedHeaders, 0);
  objc_storeStrong((id *)&self->_uniqueHeaders, 0);
}

+ (id)messagePartsWithData:(id)a3 lineSeparator:(id)a4 data:(id)a5 headerBodySeparator:(id)a6 data:(id)a7 bodyLengthKey:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  AVStringPair *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  objc_class *v57;
  void *v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = objc_msgSend(v13, "length");
  if (v18 >= 0x400)
    v19 = 1024;
  else
    v19 = v18;
  v20 = objc_msgSend(v13, "rangeOfData:options:range:", v15, 0, 0, v19);
  if (v21)
  {
    v22 = v20;
    v23 = v21;
    v57 = (objc_class *)a1;
    objc_msgSend(v13, "subdataWithRange:", 0, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v24, 4);
    if (objc_msgSend(v58, "length"))
    {
      v25 = objc_msgSend(v13, "rangeOfData:options:range:", v16, 0, v22, objc_msgSend(v13, "length") - v22);
      if (v26)
      {
        v54 = v26;
        v55 = v25;
        if (v25 <= v22 + v23)
        {
          v27 = 0;
        }
        else
        {
          objc_msgSend(v13, "subdataWithRange:", v22 + v23, v25 - (v22 + v23));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v27, 4);
        if (v29 || !objc_msgSend(v27, "length"))
        {
          v56 = v13;
          v53 = v14;
          objc_msgSend(v29, "componentsSeparatedByString:", v14, v29, v27, v24, v16, v15);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          obj = v30;
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v61;
            v35 = -1;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v61 != v34)
                  objc_enumerationMutation(obj);
                v37 = -[AVStringPair initWithString:separatedByString:]([AVStringPair alloc], "initWithString:separatedByString:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i), CFSTR(":"));
                objc_msgSend(v31, "addObject:", v37);
                if (-[AVStringPair keyEquals:](v37, "keyEquals:", v17))
                {
                  -[AVStringPair value](v37, "value");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v38, "integerValue");

                }
              }
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
            }
            while (v33);
          }
          else
          {
            v35 = -1;
          }

          v39 = v55 + v54;
          v40 = objc_msgSend(v56, "length");
          v41 = v40 - (v55 + v54);
          if (v35 >= 0)
            v42 = v35;
          else
            v42 = v40 - v39;
          if (v42 >= v41)
            v43 = v40 - v39;
          else
            v43 = v42;
          objc_msgSend(v56, "subdataWithRange:", v39, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41 <= v42)
          {
            v45 = 0;
          }
          else
          {
            objc_msgSend(v56, "subdataWithRange:", v43 + v39, v41 - v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v46 = (void *)objc_msgSend([v57 alloc], "initWithVersion:headers:expectedBodyLength:body:extra:", v58, v31, v35, v44, v45);
          v28 = v46;
          v14 = v53;
          if (v42 > v41)
            objc_msgSend(v46, "_setIncomplete");

          v13 = v56;
          v16 = v51;
          v15 = v52;
          v27 = v49;
          v24 = v50;
          v29 = v48;
        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        v28 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVersion:headers:expectedBodyLength:body:extra:", v58, 0, -1, 0, 0);
      }
    }
    else
    {
      v28 = 0;
    }

  }
  else if ((unint64_t)objc_msgSend(v13, "length") <= 0x400)
  {
    v28 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVersion:headers:expectedBodyLength:body:extra:", 0, 0, -1, 0, 0);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (Class)_matchingClass
{
  void *v2;
  NSString *v3;
  NSString *v4;
  void *v5;

  -[AVAirMessageParts version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)_registeredMessageClasses, "objectForKeyedSubscript:", v2);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      NSClassFromString(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

- (id)airMessage
{
  objc_class *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAirMessageParts _matchingClass](self, "_matchingClass");
  if (!v3)
  {
    _avairlog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[AVAirMessageParts version](self, "version");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[AVAirMessageParts(AVAirMessages) airMessage]";
      v12 = 2114;
      v13 = v7;
      v8 = "%s no class registered for version '%{public}@'";
LABEL_8:
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);

    }
LABEL_9:

    v5 = 0;
    return v5;
  }
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _avairlog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[AVAirMessageParts(AVAirMessages) airMessage]";
      v12 = 2114;
      v13 = v7;
      v8 = "%s class %{public}@ does not implement messageWithParts:";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[objc_class messageWithParts:](v4, "messageWithParts:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

@end
