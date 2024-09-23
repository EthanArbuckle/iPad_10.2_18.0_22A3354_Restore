@implementation NFCNDEFPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCNDEFPayload)initWithCoder:(id)a3
{
  id v4;
  NFCNDEFPayload *v5;
  uint64_t v6;
  NSData *type;
  uint64_t v8;
  NSData *identifier;
  uint64_t v10;
  NSData *payload;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFCNDEFPayload;
  v5 = -[NFCNDEFPayload init](&v13, sel_init);
  if (v5)
  {
    v5->_typeNameFormat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("typeNameFormat"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v10 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;

    v5->_chunkSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("chunkSize"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t typeNameFormat;
  id v5;

  typeNameFormat = self->_typeNameFormat;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", typeNameFormat, CFSTR("typeNameFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("payload"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_chunkSize, CFSTR("chunkSize"));

}

- (NFCNDEFPayload)initWithFormat:(NFCTypeNameFormat)format type:(NSData *)type identifier:(NSData *)identifier payload:(NSData *)payload
{
  return -[NFCNDEFPayload initWithFormatType:type:identifier:payload:chunkSize:](self, "initWithFormatType:type:identifier:payload:chunkSize:", format, type, identifier, payload, 0);
}

- (NFCNDEFPayload)initWithFormatType:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  NFCNDEFPayload *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  NFCNDEFPayload *v30;
  uint64_t v31;
  NSData *type;
  uint64_t v33;
  NSData *identifier;
  uint64_t v35;
  NSData *payload;
  unint64_t v37;
  const char *Name;
  objc_super v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v40.receiver = self;
  v40.super_class = (Class)NFCNDEFPayload;
  v16 = -[NFCNDEFPayload init](&v40, sel_init);
  if (!v16)
  {
LABEL_25:
    v30 = v16;
    goto LABEL_26;
  }
  v17 = objc_msgSend(v13, "length");
  v18 = objc_msgSend(v14, "length") + v17;
  if ((unint64_t)(v18 + objc_msgSend(v15, "length")) <= 0x20000)
  {
    v16->_typeNameFormat = a3;
    if (v13)
      v31 = objc_msgSend(v13, "copy");
    else
      v31 = objc_opt_new();
    type = v16->_type;
    v16->_type = (NSData *)v31;

    if (v14)
      v33 = objc_msgSend(v14, "copy");
    else
      v33 = objc_opt_new();
    identifier = v16->_identifier;
    v16->_identifier = (NSData *)v33;

    if (v15)
      v35 = objc_msgSend(v15, "copy");
    else
      v35 = objc_opt_new();
    payload = v16->_payload;
    v16->_payload = (NSData *)v35;

    v37 = 0xFFFFFFFFLL;
    if (a7 - 0x100000000 >= 0xFFFFFFFF00000001)
      v37 = a7;
    v16->_chunkSize = v37;
    goto LABEL_25;
  }
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v20 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v16);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v16);
    Name = sel_getName(a2);
    v24 = 45;
    if (isMetaClass)
      v24 = 43;
    v20(3, "%c[%{public}s %{public}s]:%i NDEF payload exceeds the size limit", v24, ClassName, Name, 78);
  }
  NFSharedLogGetLogger();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = object_getClass(v16);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(v16);
    v29 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v42 = v27;
    v43 = 2082;
    v44 = v28;
    v45 = 2082;
    v46 = v29;
    v47 = 1024;
    v48 = 78;
    _os_log_impl(&dword_215BBD000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i NDEF payload exceeds the size limit", buf, 0x22u);
  }

  v30 = 0;
LABEL_26:

  return v30;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("TNF=%d, Payload Type=%@, Payload ID=%@, Payload=%@, ChunkSize=%zu"), self->_typeNameFormat, self->_type, self->_identifier, self->_payload, self->_chunkSize);
}

- (id)asData
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  const char *Name;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  objc_msgSend(MEMORY[0x24BEDCD70], "recordsWithTNF:type:identifier:payload:chunkSize:outError:", self->_typeNameFormat, self->_type, self->_identifier, self->_payload, self->_chunkSize, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "asData");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v15 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v19 = 45;
              if (isMetaClass)
                v19 = 43;
              v15(3, "%c[%{public}s %{public}s]:%i Record serialization error", v19, ClassName, Name, 110, (_QWORD)v27);
            }
            NFSharedLogGetLogger();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = object_getClass(self);
              if (class_isMetaClass(v21))
                v22 = 43;
              else
                v22 = 45;
              v23 = object_getClassName(self);
              v24 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v33 = v22;
              v34 = 2082;
              v35 = v23;
              v36 = 2082;
              v37 = v24;
              v38 = 1024;
              v39 = 110;
              _os_log_impl(&dword_215BBD000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Record serialization error", buf, 0x22u);
            }

            v5 = 0;
            goto LABEL_22;
          }
          v13 = (void *)v12;
          objc_msgSend(v6, "appendData:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
        if (v9)
          continue;
        break;
      }
    }

    v5 = v6;
LABEL_22:

  }
  return v5;
}

- (unint64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(unint64_t)a3
{
  self->_chunkSize = a3;
}

- (NFCTypeNameFormat)typeNameFormat
{
  return self->_typeNameFormat;
}

- (void)setTypeNameFormat:(NFCTypeNameFormat)typeNameFormat
{
  self->_typeNameFormat = typeNameFormat;
}

- (NSData)type
{
  return self->_type;
}

- (void)setType:(NSData *)type
{
  objc_setProperty_nonatomic_copy(self, a2, type, 24);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSData *)identifier
{
  objc_setProperty_nonatomic_copy(self, a2, identifier, 32);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(NSData *)payload
{
  objc_setProperty_nonatomic_copy(self, a2, payload, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (NFCNDEFPayload)wellKnownTypeURIPayloadWithString:(NSString *)uri
{
  NSString *v5;
  uint64_t v6;
  unint64_t v7;
  __CFString *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NFCNDEFPayload *v15;
  NSObject *v16;
  void *v17;
  NFCNDEFPayload *v18;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  const char *v34;
  uint64_t v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  const char *Name;
  const char *v42;
  char v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = uri;
  v6 = 0;
  while (1)
  {
    v7 = -[NSString length](v5, "length");
    v8 = UrlPrefixMapping[v6];
    if (v7 >= -[__CFString length](v8, "length")
      && -[NSString compare:options:range:](v5, "compare:options:range:", v8, 2, 0, -[__CFString length](v8, "length")) == NSOrderedSame)
    {
      break;
    }
    if (++v6 == 35)
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  -[NSString substringFromIndex:](v5, "substringFromIndex:", -[__CFString length](v8, "length"));
  v10 = objc_claimAutoreleasedReturnValue();

  v9 = v6 + 1;
  v5 = (NSString *)v10;
LABEL_7:
  v11 = (void *)objc_opt_new();
  v43 = v9;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v43, 1);
  objc_msgSend(v11, "appendData:", v12);

  if (!-[NSString length](v5, "length"))
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v24 = 45;
      if (isMetaClass)
        v24 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i Missing URI field", v24, ClassName, Name, 161);
    }
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v25 = object_getClass(a1);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    v27 = object_getClassName(a1);
    v28 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v45 = v26;
    v46 = 2082;
    v47 = v27;
    v48 = 2082;
    v49 = v28;
    v50 = 1024;
    v51 = 161;
    v29 = "%c[%{public}s %{public}s]:%i Missing URI field";
    goto LABEL_28;
  }
  -[NSString dataUsingEncoding:allowLossyConversion:](v5, "dataUsingEncoding:allowLossyConversion:", 4, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v30 = NFLogGetLogger();
    if (v30)
    {
      v31 = (void (*)(uint64_t, const char *, ...))v30;
      v32 = object_getClass(a1);
      v33 = class_isMetaClass(v32);
      v34 = object_getClassName(a1);
      v42 = sel_getName(a2);
      v35 = 45;
      if (v33)
        v35 = 43;
      v31(3, "%c[%{public}s %{public}s]:%i Invalid UTF8 URI string", v35, v34, v42, 157);
    }
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v36 = object_getClass(a1);
    if (class_isMetaClass(v36))
      v37 = 43;
    else
      v37 = 45;
    v38 = object_getClassName(a1);
    v39 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v45 = v37;
    v46 = 2082;
    v47 = v38;
    v48 = 2082;
    v49 = v39;
    v50 = 1024;
    v51 = 157;
    v29 = "%c[%{public}s %{public}s]:%i Invalid UTF8 URI string";
LABEL_28:
    _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_ERROR, v29, buf, 0x22u);
LABEL_29:
    v18 = 0;
    goto LABEL_30;
  }
  v14 = (void *)v13;
  objc_msgSend(v11, "appendData:", v13);

  v15 = [NFCNDEFPayload alloc];
  objc_msgSend(CFSTR("U"), "dataUsingEncoding:", 4);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v18 = -[NFCNDEFPayload initWithFormat:type:identifier:payload:](v15, "initWithFormat:type:identifier:payload:", 1, v16, v17, v11);

LABEL_30:
  return v18;
}

+ (NFCNDEFPayload)wellKnownTypeURIPayloadWithURL:(NSURL *)url
{
  void *v4;
  void *v5;

  -[NSURL absoluteString](url, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wellKnownTypeURIPayloadWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NFCNDEFPayload *)v5;
}

+ (NFCNDEFPayload)wellKnowTypeTextPayloadWithString:(NSString *)text locale:(NSLocale *)locale
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", text, locale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NFCNDEFPayload.m"), 178, CFSTR("Please use -wellKnownTypeTextPayloadWithString:locale: replacement"));

  return 0;
}

+ (NFCNDEFPayload)wellKnownTypeTextPayloadWithString:(NSString *)text locale:(NSLocale *)locale
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NFCNDEFPayload *v10;
  void *v11;
  void *v12;
  NFCNDEFPayload *v13;
  char v15;

  v5 = text;
  -[NSLocale languageCode](locale, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "length") & 0x3F | 0x80;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &v15, 1);
  objc_msgSend(v6, "dataUsingEncoding:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v8);

  if (-[NSString length](v5, "length"))
  {
    -[NSString dataUsingEncoding:](v5, "dataUsingEncoding:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v9);

  }
  v10 = [NFCNDEFPayload alloc];
  objc_msgSend(CFSTR("T"), "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v13 = -[NFCNDEFPayload initWithFormat:type:identifier:payload:](v10, "initWithFormat:type:identifier:payload:", 1, v11, v12, v7);

  return v13;
}

- (NSURL)wellKnownTypeURIPayload
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v14;

  objc_msgSend(CFSTR("U"), "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_typeNameFormat == 1
    && -[NSData isEqualToData:](self->_type, "isEqualToData:", v3)
    && (v14 = 0, -[NSData length](self->_payload, "length")))
  {
    -[NSData getBytes:length:](self->_payload, "getBytes:length:", &v14, 1);
    if ((unint64_t)(char)v14 > 0x23)
      v14 = 0;
    v4 = (void *)objc_opt_new();
    v5 = v4;
    if ((char)v14 >= 1)
      objc_msgSend(v4, "appendString:", UrlPrefixMapping[v14 - 1]);
    v6 = -[NSData length](self->_payload, "length") - 1;
    if (v6 < 1)
    {
      v12 = 0;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[NSData subdataWithRange:](self->_payload, "subdataWithRange:", 1, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithData:encoding:", v8, 4);

      objc_msgSend(v5, "appendString:", v9);
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10 || (objc_msgSend(v10, "URL"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[NFCNDEFPayload resolveURIString:](self, "resolveURIString:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return (NSURL *)v12;
}

- (NSString)wellKnownTypeTextPayloadWithLocale:(NSLocale *)locale
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  NSUInteger v25;
  id v26;
  void *v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *v30;
  _BOOL4 v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  const char *Name;
  const char *v40;
  char v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(CFSTR("T"), "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_typeNameFormat != 1 || !-[NSData isEqualToData:](self->_type, "isEqualToData:", v6))
  {
LABEL_17:
    v20 = 0;
    *locale = 0;
    goto LABEL_18;
  }
  v41 = 0;
  -[NSData getBytes:length:](self->_payload, "getBytes:length:", &v41, 1);
  v7 = v41 & 0x3F;
  if (v41 < 0)
    v8 = 10;
  else
    v8 = 4;
  if (-[NSData length](self->_payload, "length") < v7)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Invalid payload length", v14, ClassName, Name, 266);
    }
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(self);
      v19 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v43 = v17;
      v44 = 2082;
      v45 = v18;
      v46 = 2082;
      v47 = v19;
      v48 = 1024;
      v49 = 266;
      _os_log_impl(&dword_215BBD000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v22 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NSData subdataWithRange:](self->_payload, "subdataWithRange:", 1, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithData:encoding:", v23, 1);

  if (objc_msgSend(v24, "length"))
  {
    if (locale)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v24);
      *locale = (NSLocale *)(id)objc_claimAutoreleasedReturnValue();
    }
    v25 = -[NSData length](self->_payload, "length") + ~v7;
    if (v25)
    {
      v26 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[NSData subdataWithRange:](self->_payload, "subdataWithRange:", v7 + 1, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v26, "initWithData:encoding:", v27, v8);

    }
    else
    {
      v28 = NFLogGetLogger();
      if (v28)
      {
        v29 = (void (*)(uint64_t, const char *, ...))v28;
        v30 = object_getClass(self);
        v31 = class_isMetaClass(v30);
        v32 = object_getClassName(self);
        v40 = sel_getName(a2);
        v33 = 45;
        if (v31)
          v33 = 43;
        v29(4, "%c[%{public}s %{public}s]:%i Empty string", v33, v32, v40, 284);
      }
      NFSharedLogGetLogger();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = object_getClass(self);
        if (class_isMetaClass(v35))
          v36 = 43;
        else
          v36 = 45;
        v37 = object_getClassName(self);
        v38 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v43 = v36;
        v44 = 2082;
        v45 = v37;
        v46 = 2082;
        v47 = v38;
        v48 = 1024;
        v49 = 284;
        _os_log_impl(&dword_215BBD000, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Empty string", buf, 0x22u);
      }

      v20 = (void *)objc_opt_new();
    }
  }
  else
  {
    v20 = 0;
  }

LABEL_18:
  return (NSString *)v20;
}

- (id)resolveURIString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCF48];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:encodingInvalidCharacters:", v4, 1);

  return v5;
}

@end
