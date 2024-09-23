@implementation TKSimpleTLVRecord

- (TKSimpleTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value
{
  unsigned int v4;
  NSData *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TKSimpleTLVRecord *v10;
  objc_super v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v4 = tag;
  v6 = value;
  if (-[NSData length](v6, "length") > 0xFE)
  {
    if (-[NSData length](v6, "length") >= 0x10000)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("value for TKSimpleTLVRecord record too big (%lu)"), -[NSData length](v6, "length"));
    v13 = v4;
    v14 = -1;
    v15 = (unsigned __int16)-[NSData length](v6, "length") >> 8;
    v16 = -[NSData length](v6, "length");
    v7 = (void *)MEMORY[0x1E0C99DF0];
    v8 = 4;
  }
  else
  {
    v13 = v4;
    v14 = -[NSData length](v6, "length");
    v7 = (void *)MEMORY[0x1E0C99DF0];
    v8 = 2;
  }
  objc_msgSend(v7, "dataWithBytes:length:", &v13, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendData:", v6);
  v12.receiver = self;
  v12.super_class = (Class)TKSimpleTLVRecord;
  v10 = -[TKTLVRecord initWithTag:value:data:](&v12, sel_initWithTag_value_data_, v4, v6, v9);

  return v10;
}

+ (id)parseFromDataSource:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v5 = a3;
  if (!objc_msgSend(v5, "bytesSafeToRead:", 1))
    goto LABEL_10;
  v6 = objc_msgSend(v5, "ptr");
  v7 = objc_msgSend(v5, "fetchByte");
  if ((v7 + 1) < 2u)
    goto LABEL_10;
  v8 = v7;
  if (!objc_msgSend(v5, "bytesSafeToRead:", 1))
    goto LABEL_10;
  v9 = objc_msgSend(v5, "fetchByte");
  if (v9 == 255)
  {
    if (objc_msgSend(v5, "bytesSafeToRead:", 2))
    {
      v11 = objc_msgSend(v5, "fetchByte");
      v10 = objc_msgSend(v5, "fetchByte") | (unint64_t)(v11 << 8);
      goto LABEL_8;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v10 = v9;
LABEL_8:
  objc_msgSend(v5, "fetchDataWithLength:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_alloc((Class)a1);
    objc_msgSend(v5, "dataFromPtr:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTag:value:data:", v8, v12, v14);

  }
  else
  {
    v15 = 0;
  }

LABEL_11:
  return v15;
}

@end
