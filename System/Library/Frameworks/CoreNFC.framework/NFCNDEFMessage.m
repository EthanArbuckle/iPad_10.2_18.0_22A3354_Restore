@implementation NFCNDEFMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCNDEFMessage)initWithCoder:(id)a3
{
  id v4;
  NFCNDEFMessage *v5;
  uint64_t v6;
  NSArray *records;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFCNDEFMessage;
  v5 = -[NFCNDEFMessage init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEDCD60], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("records"));
    v6 = objc_claimAutoreleasedReturnValue();
    records = v5->_records;
    v5->_records = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_records, CFSTR("records"));
}

- (NFCNDEFMessage)initWithNDEFRecords:(NSArray *)records
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  NFCNDEFMessage *v29;
  NFCNDEFMessage *v30;
  const char *Name;
  const char *v33;
  NFCNDEFMessage *v34;
  NSArray *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = records;
  if (!-[NSArray count](v5, "count"))
  {
    v30 = -[NFCNDEFMessage initWithEmptyNdefMessage](self, "initWithEmptyNdefMessage");
LABEL_23:
    self = v30;
    v29 = self;
    goto LABEL_24;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v5;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (!v7)
  {

LABEL_22:
    v30 = -[NFCNDEFMessage _initWithRecords:](self, "_initWithRecords:", v6);
    goto LABEL_23;
  }
  v8 = v7;
  v33 = a2;
  v34 = self;
  v35 = v5;
  v9 = 0;
  v10 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v37 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v12, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");
      objc_msgSend(v12, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");
      objc_msgSend(v12, "payload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += v14 + v16 + objc_msgSend(v17, "length");

    }
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  }
  while (v8);

  self = v34;
  v5 = v35;
  if (v9 <= 0x20000)
    goto LABEL_22;
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v34);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v34);
    Name = sel_getName(v33);
    v23 = 45;
    if (isMetaClass)
      v23 = 43;
    v19(3, "%c[%{public}s %{public}s]:%i Total size of all NDEF records exceeds the size limit", v23, ClassName, Name, 62);
  }
  NFSharedLogGetLogger();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = object_getClass(v34);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    v27 = object_getClassName(v34);
    v28 = sel_getName(v33);
    *(_DWORD *)buf = 67109890;
    v41 = v26;
    v42 = 2082;
    v43 = v27;
    v44 = 2082;
    v45 = v28;
    v46 = 1024;
    v47 = 62;
    _os_log_impl(&dword_215BBD000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Total size of all NDEF records exceeds the size limit", buf, 0x22u);
  }

  v29 = 0;
LABEL_24:

  return v29;
}

- (id)_initWithRecords:(id)a3
{
  id v4;
  NFCNDEFMessage *v5;
  uint64_t v6;
  NSArray *records;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFCNDEFMessage;
  v5 = -[NFCNDEFMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    records = v5->_records;
    v5->_records = (NSArray *)v6;

  }
  return v5;
}

- (NFCNDEFMessage)initWithNFNdefMessage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NFCNDEFPayload *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NFCNDEFPayload *v14;
  NFCNDEFMessage *v15;
  NFCNDEFMessage *v16;
  void *v18;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v3;
  objc_msgSend(v3, "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v9 = [NFCNDEFPayload alloc];
        v10 = objc_msgSend(v8, "typeNameFormat");
        objc_msgSend(v8, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NFCNDEFPayload initWithFormatType:type:identifier:payload:chunkSize:](v9, "initWithFormatType:type:identifier:payload:chunkSize:", v10, v11, v12, v13, 0);

        if (v14)
          objc_msgSend(v21, "addObject:", v14);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v21, "count"))
  {
    v15 = (NFCNDEFMessage *)-[NFCNDEFMessage _initWithRecords:](self, "_initWithRecords:", v21);
    v16 = v15;
  }
  else
  {
    v16 = 0;
    v15 = self;
  }

  return v16;
}

- (NFCNDEFMessage)initWithEmptyNdefMessage
{
  NFCNDEFPayload *v3;
  void *v4;
  void *v5;
  void *v6;
  NFCNDEFPayload *v7;
  void *v8;
  NFCNDEFMessage *v9;

  v3 = [NFCNDEFPayload alloc];
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[NFCNDEFPayload initWithFormatType:type:identifier:payload:chunkSize:](v3, "initWithFormatType:type:identifier:payload:chunkSize:", 0, v4, v5, v6, 0);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, 0);
  v9 = -[NFCNDEFMessage initWithNDEFRecords:](self, "initWithNDEFRecords:", v8);

  return v9;
}

+ (NFCNDEFMessage)ndefMessageWithData:(NSData *)data
{
  void *v4;
  NSData *v5;
  void *v6;
  char v7;
  void *v8;
  NFCNDEFMessage *v9;
  NFCNDEFMessage *v10;
  NFCNDEFMessage *v11;

  v4 = (void *)MEMORY[0x24BEDCD70];
  v5 = objc_retainAutorelease(data);
  objc_msgSend(v4, "recordsFromBytes:length:", -[NSData bytes](v5, "bytes"), -[NSData length](v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "_validateRecords:fromOriginal:", v6, v5);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(a1, "_getPayloadsFromNDEFRecords:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [NFCNDEFMessage alloc];
  }
  else
  {
    v10 = [NFCNDEFMessage alloc];
    v8 = (void *)objc_opt_new();
    v9 = v10;
  }
  v11 = -[NFCNDEFMessage initWithNDEFRecords:](v9, "initWithNDEFRecords:", v8);

  return v11;
}

- (id)description
{
  return -[NSArray description](self->_records, "description");
}

- (id)asData
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *obj;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEDCD68]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_records;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v18 = 0;
        v9 = (void *)MEMORY[0x24BEDCD70];
        v10 = objc_msgSend(v8, "typeNameFormat");
        objc_msgSend(v8, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordsWithTNF:type:identifier:payload:chunkSize:outError:", v10, v11, v12, v13, objc_msgSend(v8, "chunkSize"), &v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {

          v15 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v3, "addRecordArray:", v14);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "asData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v15;
}

- (NSUInteger)length
{
  void *v2;
  NSUInteger v3;

  -[NFCNDEFMessage asData](self, "asData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

+ (BOOL)_validateRecords:(id)a3 fromOriginal:(id)a4
{
  id v5;
  int v6;
  uint64_t i;
  void *v8;
  id v9;
  char *v10;
  char v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  unsigned int v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v30)
  {
    v6 = 0;
    v29 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v31, "subdataWithRange:", v6, 2);
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (char *)objc_msgSend(v9, "bytes");
        v11 = *v10;
        v12 = v10[1];
        v13 = v6 + 2;
        if ((*v10 & 0x10) != 0)
        {
          objc_msgSend(v31, "subdataWithRange:", v13, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_retainAutorelease(v18);
          v16 = *(unsigned __int8 *)objc_msgSend(v15, "bytes");
          v17 = 3;
        }
        else
        {
          objc_msgSend(v31, "subdataWithRange:", v13, 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_retainAutorelease(v14);
          v16 = bswap32(*(_DWORD *)objc_msgSend(v15, "bytes"));
          v17 = 6;
        }
        v19 = v6 + v17;
        if ((v11 & 8) != 0)
        {
          objc_msgSend(v31, "subdataWithRange:", v19, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_retainAutorelease(v21);
          v20 = *(unsigned __int8 *)objc_msgSend(v15, "bytes");
          ++v19;
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v8, "type");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "length") != v12)
          goto LABEL_19;
        objc_msgSend(v8, "payload");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length") != v16)
        {

LABEL_19:
LABEL_20:
          objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], &stru_24D451DF0, 0);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v27);
        }
        objc_msgSend(v8, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length") == v20;

        if (!v25)
          goto LABEL_20;

        v6 = v16 + v12 + v20 + v19;
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v30);
  }

  return 1;
}

+ (id)_getPayloadsFromNDEFRecords:(id)a3
{
  id v3;
  void *v4;
  NFCNDEFPayload *v5;
  char v6;
  NFCNDEFPayload *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NFCNDEFPayload *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NFCNDEFPayload *v23;
  NFCNDEFPayload *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NFCNDEFPayload *v32;
  uint64_t v33;
  id v34;
  unsigned __int8 v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v37 = (id)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  v4 = 0;
  if (!v40)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_36;
  }
  v36 = 0;
  LOBYTE(v5) = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v39 = *(_QWORD *)v43;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v43 != v39)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v10);
      if ((v5 & 1) != 0)
      {
        LODWORD(v5) = 1;
        if ((v6 & 1) == 0)
          goto LABEL_8;
      }
      else
      {
        LODWORD(v5) = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v10), "messageBegin");
        if ((v6 & 1) == 0)
        {
LABEL_8:
          v6 = objc_msgSend(v11, "messageEnd");
          goto LABEL_11;
        }
      }
      v6 = 1;
LABEL_11:
      v12 = objc_msgSend(v11, "chunked");
      if (v12)
      {
        v41 = (int)v5;
        v5 = v7;
        v13 = objc_msgSend(v11, "typeNameFormat");
        v14 = v13;
        if ((v9 & 1) != 0)
        {
          if (v13 != 6)
            goto LABEL_21;
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
            goto LABEL_20;
          objc_msgSend(v11, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "length");

          if (v17)
            goto LABEL_21;
          objc_msgSend(v11, "payload");
          v18 = (NFCNDEFPayload *)objc_claimAutoreleasedReturnValue();
          v7 = v5;
          -[NFCNDEFPayload appendData:](v5, "appendData:", v18);
        }
        else
        {
          objc_msgSend(v11, "type");
          v19 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "identifier");
          v20 = objc_claimAutoreleasedReturnValue();

          v21 = objc_alloc(MEMORY[0x24BDBCEC8]);
          objc_msgSend(v11, "payload");
          v18 = (NFCNDEFPayload *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "initWithData:", v18);

          v4 = (void *)v19;
          v36 = v14;
          v23 = (NFCNDEFPayload *)v22;
          v8 = (void *)v20;
          v7 = v23;
        }
      }
      else
      {
        if ((v9 & 1) == 0)
        {

          v24 = [NFCNDEFPayload alloc];
          v25 = objc_msgSend(v11, "typeNameFormat");
          objc_msgSend(v11, "type");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "payload");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[NFCNDEFPayload initWithFormatType:type:identifier:payload:chunkSize:](v24, "initWithFormatType:type:identifier:payload:chunkSize:", v25, v26, v27, v28, 0);

          objc_msgSend(v37, "addObject:", v18);
          v4 = 0;
          v7 = 0;
          v8 = 0;
          goto LABEL_25;
        }
        v41 = (int)v5;
        v5 = v7;
        if (objc_msgSend(v11, "typeNameFormat") != 6)
          goto LABEL_21;
        objc_msgSend(v11, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
LABEL_20:

LABEL_21:
          v4 = 0;
          v7 = 0;
          v8 = 0;
          v9 = 0;
          LOBYTE(v5) = v41;
          goto LABEL_27;
        }
        objc_msgSend(v11, "type");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "length");

        if (v30)
          goto LABEL_21;
        objc_msgSend(v11, "payload");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFCNDEFPayload appendData:](v5, "appendData:", v31);

        if (-[NFCNDEFPayload length](v5, "length"))
        {
          v32 = -[NFCNDEFPayload initWithFormatType:type:identifier:payload:chunkSize:]([NFCNDEFPayload alloc], "initWithFormatType:type:identifier:payload:chunkSize:", v36, v4, v8, v5, 0);
          objc_msgSend(v37, "addObject:", v32);

        }
        v4 = 0;
        v8 = 0;
        v18 = v5;
        v7 = 0;
      }
      LODWORD(v5) = v41;
LABEL_25:

      v9 = v12;
      if ((_DWORD)v5 && (v6 & 1) != 0)
        goto LABEL_36;
LABEL_27:
      ++v10;
    }
    while (v40 != v10);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    v40 = v33;
  }
  while (v33);
LABEL_36:

  v34 = v37;
  return v34;
}

- (id)_getURLsFromNDEFMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "records", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "wellKnownTypeURIPayload");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(NSArray *)records
{
  objc_setProperty_nonatomic_copy(self, a2, records, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
}

@end
