@implementation AVAirMessage

void __37__AVAirMessage_isAirMessagingEnabled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("YES");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(a1 + 56))
      v3 = CFSTR("NO");
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 136316162;
    v8 = "+[AVAirMessage isAirMessagingEnabled]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "%s isAirMessageEnabled %@; global %@; app %@; environ %{public}@",
      (uint8_t *)&v7,
      0x34u);
  }

}

+ (BOOL)isAirMessagingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  void *v21;
  void *v22;
  void *v23;
  char v24;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.avkit"));
  objc_msgSend(v2, "objectForKey:", CFSTR("airmessaging"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("airmessaging"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("airmessaging"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v9 = objc_msgSend(v3, "BOOLValue");
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (v5)
LABEL_3:
    v9 = objc_msgSend(v5, "BOOLValue");
LABEL_4:
  if (v8)
    v10 = objc_msgSend(v8, "BOOLValue");
  else
    v10 = v9 != 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __37__AVAirMessage_isAirMessagingEnabled__block_invoke;
  v20[3] = &unk_1E5BB2208;
  v24 = v10;
  v21 = v3;
  v22 = v5;
  v23 = v8;
  v11 = isAirMessagingEnabled_onceToken;
  v12 = v8;
  v13 = v5;
  v14 = v3;
  v15 = v14;
  if (v11 == -1)
  {
    v16 = v14;
    v17 = v13;
    v18 = v12;
  }
  else
  {
    dispatch_once(&isAirMessagingEnabled_onceToken, v20);
    v17 = v22;
    v18 = v23;
    v16 = v21;
  }

  return v10;
}

- (AVAirMessage)initWithMessageType:(unsigned int)a3 itemIdentifier:(id)a4
{
  id v6;
  AVAirMessage *v7;
  AVAirMessage *v8;
  uint64_t v9;
  NSString *itemIdentifier;
  AVAirMessage *v11;
  objc_super v13;

  v6 = a4;
  if (+[AVAirMessage isAirMessagingEnabled](AVAirMessage, "isAirMessagingEnabled"))
  {
    v13.receiver = self;
    v13.super_class = (Class)AVAirMessage;
    v7 = -[AVAirMessage init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_type = a3;
      v9 = objc_msgSend(v6, "copy");
      itemIdentifier = v8->_itemIdentifier;
      v8->_itemIdentifier = (NSString *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (AVAirMessage)initWithMessageType:(unsigned int)a3 itemIdentifier:(id)a4 dictionaryRepresentation:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  AVAirMessage *v10;
  AVAirMessage *v11;
  void *v12;
  void *v13;
  unsigned int *p_type;
  int v15;
  void *v16;
  uint64_t v17;
  NSString *itemIdentifier;
  void *v19;
  char isKindOfClass;
  void *v21;
  uint64_t v22;
  NSValue *value;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  NSArray *array;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  NSDictionary *dictionary;
  id v34;
  NSData *v35;
  NSData *v36;
  NSData *rawData;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSDictionary *initialRepresentation;
  AVAirMessage *v51;
  NSObject *v53;
  unsigned int v54;
  AVAirMessage *v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v6 = *(_QWORD *)&a3;
  v68 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v62.receiver = self;
  v62.super_class = (Class)AVAirMessage;
  v10 = -[AVAirMessage init](&v62, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_61:
    v51 = v11;
    goto LABEL_62;
  }
  if ((_DWORD)v6 == 999)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_type = objc_msgSend(v13, "integerValue");
      p_type = &v11->_type;

    }
    else
    {
      v11->_type = 999;
      p_type = &v11->_type;
    }

    v6 = *p_type;
  }
  else
  {
    v10->_type = v6;
    p_type = &v10->_type;
  }
  if ((int)v6 <= 299)
  {
    if ((_DWORD)v6 != 100 && (_DWORD)v6 != 200 && (_DWORD)v6 != 210)
      goto LABEL_63;
    goto LABEL_19;
  }
  if ((int)v6 > 499)
  {
    if ((_DWORD)v6 != 500 && (_DWORD)v6 != 999)
      goto LABEL_63;
LABEL_19:
    if (v8)
    {
      v15 = 0;
      v16 = v8;
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item"));
      v6 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 1;
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
    }
    v17 = objc_msgSend(v16, "copy");
    itemIdentifier = v11->_itemIdentifier;
    v11->_itemIdentifier = (NSString *)v17;

    if (v15)
    if (!v8)

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("v"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("v"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v22 = objc_msgSend(v21, "copy");
    value = v11->_value;
    v11->_value = (NSValue *)v22;

    if ((isKindOfClass & 1) != 0)
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("a"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = objc_opt_isKindOfClass();
    if ((v25 & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("a"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v27 = objc_msgSend(v26, "copy");
    array = v11->_array;
    v11->_array = (NSArray *)v27;

    if ((v25 & 1) != 0)
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("d"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = objc_opt_isKindOfClass();
    if ((v30 & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("d"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v32 = objc_msgSend(v31, "copy");
    dictionary = v11->_dictionary;
    v11->_dictionary = (NSDictionary *)v32;

    if ((v30 & 1) != 0)
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("raw"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = (NSData *)v34;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v36 = 0;
        goto LABEL_49;
      }
      v35 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v34, 0);
    }
    v36 = v35;
LABEL_49:

    rawData = v11->_rawData;
    v11->_rawData = v36;

    v38 = (void *)objc_msgSend(v9, "mutableCopy");
    v39 = (void *)MEMORY[0x1E0C99E60];
    v55 = v11;
    -[AVAirMessage allRecognizedKeysForDictionaryRepresentation](v11, "allRecognizedKeysForDictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = v9;
    objc_msgSend(v9, "allKeys");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v59 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          if ((objc_msgSend(v41, "containsObject:", v47) & 1) == 0)
          {
            _avairlog();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v64 = "-[AVAirMessage initWithMessageType:itemIdentifier:dictionaryRepresentation:]";
              v65 = 2114;
              v66 = v47;
              _os_log_impl(&dword_1AC4B1000, v48, OS_LOG_TYPE_DEFAULT, "%s removing unrecognized key '%{public}@'", buf, 0x16u);
            }

            objc_msgSend(v38, "setObject:forKeyedSubscript:", 0, v47);
          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v44);
    }

    v49 = objc_msgSend(v38, "copy");
    v11 = v55;
    initialRepresentation = v55->_initialRepresentation;
    v55->_initialRepresentation = (NSDictionary *)v49;

    v9 = v56;
    v8 = v57;
    goto LABEL_61;
  }
  if ((_DWORD)v6 == 300 || (_DWORD)v6 == 400)
    goto LABEL_19;
LABEL_63:
  _avairlog();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = *p_type;
    *(_DWORD *)buf = 136315394;
    v64 = "-[AVAirMessage initWithMessageType:itemIdentifier:dictionaryRepresentation:]";
    v65 = 1024;
    LODWORD(v66) = v54;
    _os_log_impl(&dword_1AC4B1000, v53, OS_LOG_TYPE_DEFAULT, "%s incoming message type %d is unrecognized!", buf, 0x12u);
  }

  v51 = 0;
LABEL_62:

  return v51;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend((id)objc_opt_class(), "dictionaryRepresentationCommon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AVAirMessage type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  -[AVAirMessage itemIdentifier](self, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("item"));

  -[AVAirMessage value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("v"));

  -[AVAirMessage array](self, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVAirMessage array](self, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], CFSTR("a"));
      goto LABEL_9;
    }
    -[AVAirMessage array](self, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_class();

    LOBYTE(v11) = objc_opt_respondsToSelector();
    -[AVAirMessage array](self, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v12, "airRepresentationForArray:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("a"));

    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_9;
      -[AVAirMessage array](self, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("a"));
    }

  }
LABEL_9:
  -[AVAirMessage dictionary](self, "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("d"));

  -[AVAirMessage rawData](self, "rawData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[AVAirMessage rawData](self, "rawData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "base64EncodedStringWithOptions:", 32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("raw"));
  }
  return (NSDictionary *)v3;
}

- (id)allRecognizedKeysForDictionaryRepresentation
{
  void *v2;
  void *v3;

  +[AVAirMessage commonDictionaryRepresentationKeys](AVAirMessage, "commonDictionaryRepresentationKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", &unk_1E5BF3FA8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAirMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(__CFString **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB3940];
        if (-[__CFString length](v11, "length"))
          v13 = v11;
        else
          v13 = CFSTR("''");
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@: %@"), v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("{\n%@\n}"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSData)jsonDataRepresentation
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  AVAirMessage *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AVAirMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      _avairlog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v10 = "-[AVAirMessage jsonDataRepresentation]";
        v11 = 2114;
        v12 = self;
        v13 = 2114;
        v14 = v5;
        _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s failed to serialize %{public}@ to JSON (%{public}@)", buf, 0x20u);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return (NSData *)v4;
}

- (id)headerTextRepresenationForBodyDataLength:(unint64_t)a3 extraHeaders:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("AVKitAir/1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v38[0] = CFSTR("length");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v10;
  v38[1] = CFSTR("messagetype");
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AVAirMessage type](self, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v13;
  v38[2] = CFSTR("item");
  -[AVAirMessage itemIdentifier](self, "itemIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("nil");
  if (v14)
    v16 = (const __CFString *)v14;
  v39[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v8, "initWithDictionary:", v17);

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "airMessageCanonicalForm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v19);

  }
  v32 = v11;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@:%@"), v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v28);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v22);
  }

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringByAppendingString:", CFSTR("\n\n"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)shouldUseJSONForBody
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[AVAirMessage rawData](self, "rawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVAirMessage array](self, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
    }
    else
    {
      -[AVAirMessage dictionary](self, "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v5 = 1;
      }
      else
      {
        -[AVAirMessage value](self, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v7 != 0;

      }
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)messageDataRepresentation
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  _QWORD v26[3];
  _QWORD v27[3];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[AVAirMessage shouldUseJSONForBody](self, "shouldUseJSONForBody"))
  {
    v3 = 0;
  }
  else
  {
    -[AVAirMessage MIMEType](self, "MIMEType");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = CFSTR("application/octet-stream");
    if (v4)
      v6 = (__CFString *)v4;
    v3 = v6;

  }
  if (-[AVAirMessage shouldUseJSONForBody](self, "shouldUseJSONForBody"))
    -[AVAirMessage jsonDataRepresentation](self, "jsonDataRepresentation");
  else
    -[AVAirMessage rawData](self, "rawData");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[AVAirMessage _nameForDataCompressionAlgorithm:](AVAirMessage, "_nameForDataCompressionAlgorithm:", 0);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v25 = 0;
    -[__CFString compressedDataUsingAlgorithm:error:](v7, "compressedDataUsingAlgorithm:error:", 0, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v25;
    if (v9)
    {
      v11 = v9;
      v12 = v7;
      v7 = v11;
    }
    else
    {
      _avairlog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v29 = "-[AVAirMessage messageDataRepresentation]";
        v30 = 2048;
        v31 = 0;
        v32 = 2114;
        v33 = v8;
        v34 = 2114;
        v35 = v10;
        _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s failed to compress data (%ld/%{public}@): %{public}@", buf, 0x2Au);
      }

      v12 = v8;
      v8 = 0;
    }

  }
  v14 = -[__CFString length](v7, "length");
  if (v8)
    v15 = v8;
  else
    v15 = &stru_1E5BB5F88;
  v27[0] = v15;
  v26[0] = CFSTR("compression");
  v26[1] = CFSTR("languagetag");
  -[AVAirMessage extendedLanguageTag](self, "extendedLanguageTag");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1E5BB5F88;
  v26[2] = CFSTR("mimetype");
  if (v3)
    v19 = v3;
  else
    v19 = &stru_1E5BB5F88;
  v27[1] = v18;
  v27[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAirMessage headerTextRepresenationForBodyDataLength:extraHeaders:](self, "headerTextRepresenationForBodyDataLength:extraHeaders:", v14, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  objc_msgSend(v23, "appendData:", v7);
  return v23;
}

- (id)number
{
  void *v3;
  void *v4;

  -[AVAirMessage value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVAirMessage value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setMIMEType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)extendedLanguageTag
{
  return self->_extendedLanguageTag;
}

- (void)setExtendedLanguageTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (NSArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (NSDictionary)initialRepresentation
{
  return self->_initialRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialRepresentation, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_extendedLanguageTag, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

+ (id)currentOSIdentifier
{
  return CFSTR("iOS");
}

+ (id)currentAppIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)buildVersion
{
  if (buildVersion_onceToken != -1)
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_8965);
  return (id)buildVersion__build;
}

+ (id)dictionaryRepresentationCommon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.avkit"), CFSTR("sender"));
  objc_msgSend((id)objc_opt_class(), "currentOSIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("os"));

  objc_msgSend((id)objc_opt_class(), "buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("build"));

  objc_msgSend((id)objc_opt_class(), "currentAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("app"));

  return v2;
}

+ (id)commonDictionaryRepresentationKeys
{
  if (commonDictionaryRepresentationKeys_onceToken != -1)
    dispatch_once(&commonDictionaryRepresentationKeys_onceToken, &__block_literal_global_39_8956);
  return (id)commonDictionaryRepresentationKeys__keys;
}

+ (id)_decompressBodyData:(id)a3 forCompressionAlgorithm:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length") || (objc_msgSend(v7, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    v9 = v5;
    goto LABEL_17;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("lzfse")) & 1) != 0)
  {
    v8 = 0;
LABEL_12:
    v14 = 0;
    objc_msgSend(v5, "decompressedDataUsingAlgorithm:error:", v8, &v14);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (!v9)
    {
      _avairlog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "+[AVAirMessage _decompressBodyData:forCompressionAlgorithm:]";
        v17 = 2114;
        v18 = v6;
        v19 = 2114;
        v20 = v10;
        _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data (%{public}@ algorithm): %{public}@", buf, 0x20u);
      }

    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("lz4")) & 1) != 0)
  {
    v8 = 1;
    goto LABEL_12;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("zlib")) & 1) != 0)
  {
    v8 = 3;
    goto LABEL_12;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("lzma")) & 1) != 0)
  {
    v8 = 2;
    goto LABEL_12;
  }
  _avairlog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[AVAirMessage _decompressBodyData:forCompressionAlgorithm:]";
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data; algorithm name '%{public}@' is not recognized",
      buf,
      0x16u);
  }

  v9 = 0;
LABEL_17:

  return v9;
}

+ (id)_nameForDataCompressionAlgorithm:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 4)
    return off_1E5BB2228[a3];
  if (a3 < 0)
    return CFSTR("none");
  _avairlog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[AVAirMessage _nameForDataCompressionAlgorithm:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s This code has not been updated to handle algorithm %ld!", (uint8_t *)&v6, 0x16u);
  }

  return 0;
}

+ (id)messageWithRequiresLinearPlayback:(BOOL)a3 itemIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageType:itemIdentifier:", 100, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v8);

  return v7;
}

+ (id)messageWithUserScrubToAssetTime:(double)a3 itemIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageType:itemIdentifier:", 500, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v8);

  return v7;
}

+ (id)messageWithExternalMetadata:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageType:itemIdentifier:", 200, v6);

  objc_msgSend(v8, "setArray:", v7);
  return v8;
}

+ (id)messageWithPosterArtworkMetadata:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageType:itemIdentifier:", 210, v6);

  objc_msgSend(v7, "dataValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRawData:", v9);

  objc_msgSend(v7, "extendedLanguageTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setExtendedLanguageTag:", v10);
  return v8;
}

+ (id)messageWithParts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  AVAirMessage *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  AVAirMessage *v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "expectedBodyLength") & 0x8000000000000000) == 0
    && (objc_msgSend(v3, "isIncomplete") & 1) == 0)
  {
    objc_msgSend(v3, "uncompressedBodyData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "bodyAsJSONDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uncompressedBodyData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        objc_msgSend(v3, "rawBodyData");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v8;

      objc_msgSend(v3, "rawBodyData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13 && !v5 && !v11)
      {
        _avairlog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 136315138;
          v28 = "+[AVAirMessage messageWithParts:]";
          _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s error: json deserialization failed", (uint8_t *)&v27, 0xCu);
        }

        v9 = 0;
        goto LABEL_24;
      }
      objc_msgSend(v3, "uniqueHeaders");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("messagetype"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      if (v17)
        v18 = v17;
      else
        v18 = 999;
      objc_msgSend(v3, "uniqueHeaders");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("item"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "uniqueHeaders");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("response-status"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        +[AVAirMessageResponse responseWithParts:](AVAirMessageResponse, "responseWithParts:", v3);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = [AVAirMessage alloc];
        if (!v5)
        {
          v9 = -[AVAirMessage initWithMessageType:itemIdentifier:](v24, "initWithMessageType:itemIdentifier:", v18, v20);
          -[AVAirMessage setRawData:](v9, "setRawData:", v11);
          objc_msgSend(v3, "uniqueHeaders");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("mimetype"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVAirMessage setMIMEType:](v9, "setMIMEType:", v26);

          goto LABEL_23;
        }
        v23 = -[AVAirMessage initWithMessageType:itemIdentifier:dictionaryRepresentation:](v24, "initWithMessageType:itemIdentifier:dictionaryRepresentation:", v18, v20, v5);
      }
      v9 = (AVAirMessage *)v23;
LABEL_23:

LABEL_24:
      goto LABEL_7;
    }
  }
  v9 = 0;
LABEL_7:

  return v9;
}

void __50__AVAirMessage_commonDictionaryRepresentationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[AVAirMessage dictionaryRepresentationCommon](AVAirMessage, "dictionaryRepresentationCommon");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonDictionaryRepresentationKeys__keys;
  commonDictionaryRepresentationKeys__keys = v0;

}

void __28__AVAirMessage_buildVersion__block_invoke()
{
  BOOL v0;
  void *v1;
  uint64_t v2;
  void *v3;
  size_t size;

  size = 0;
  if (sysctlbyname("kern.osversion", 0, &size, 0, 0))
    v0 = 1;
  else
    v0 = size == 0;
  if (!v0)
  {
    v1 = malloc_type_malloc(size, 0x100004077774924uLL);
    sysctlbyname("kern.osversion", v1, &size, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)buildVersion__build;
    buildVersion__build = v2;

    free(v1);
  }
}

@end
