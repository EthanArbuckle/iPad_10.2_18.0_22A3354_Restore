@implementation TKCompactTLVRecord

- (TKCompactTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value
{
  uint64_t v4;
  NSData *v6;
  _QWORD *v7;
  void *v8;
  TKCompactTLVRecord *v9;
  objc_super v11;
  char v12;

  v4 = tag;
  v6 = value;
  v7 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v4 >= 0x10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("bad tag value for TKCompactTLVRecord (%u)"), v4);
  if (-[NSData length](v6, "length") >= 0x10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("value for TKCompactTLVRecord too big (%lu)"), -[NSData length](v6, "length"));
  v12 = -[NSData length](v6, "length") | (16 * v4);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v6);
  v11.receiver = self;
  v11.super_class = (Class)TKCompactTLVRecord;
  v9 = -[TKTLVRecord initWithTag:value:data:](&v11, sel_initWithTag_value_data_, v4, v6, v8);

  return v9;
}

+ (id)parseFromDataSource:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "bytesSafeToRead:", 1))
  {
    v5 = objc_msgSend(v4, "ptr");
    v6 = objc_msgSend(v4, "fetchByte");
    v7 = v6;
    objc_msgSend(v4, "fetchDataWithLength:", v6 & 0xF);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___TKCompactTLVRecord;
      v9 = objc_msgSendSuper2(&v13, sel_alloc);
      objc_msgSend(v4, "dataFromPtr:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithTag:value:data:", v7 >> 4, v8, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
