@implementation ANAnnouncementDataItem

- (ANAnnouncementDataItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ANAnnouncementDataItem;
  return -[ANAnnouncementDataItem init](&v3, sel_init);
}

- (ANAnnouncementDataItem)initWithData:(id)a3 type:(unint64_t)a4
{
  id v7;
  ANAnnouncementDataItem *v8;
  ANAnnouncementDataItem *v9;

  v7 = a3;
  v8 = -[ANAnnouncementDataItem init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v9->_type = a4;
    v9->_flags = 0;
  }

  return v9;
}

+ (id)strictSecureDecodeFromData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDBD1A8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = a3;
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnnouncementDataItem strictSecureDecodeFromData:classList:decodingFailurePolicy:](ANAnnouncementDataItem, "strictSecureDecodeFromData:classList:decodingFailurePolicy:", v5, v8, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      v3 = (void *)v9;

  }
  return v3;
}

+ (id)strictSecureDecodeFromData:(id)a3 classList:(id)a4 decodingFailurePolicy:(int64_t)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD1620];
  v9 = a3;
  v19 = 0;
  v10 = (void *)objc_msgSend([v8 alloc], "initForReadingFromData:error:", v9, &v19);

  v11 = v19;
  if (v11)
  {
    v12 = v11;
    ANLogHandleAnnouncementDataItem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = &stru_24D370F00;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_2156FF000, v13, OS_LOG_TYPE_ERROR, "%@Failed to init unarchiver for reading AnnouncementDataItems. error = %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v10, "_enableStrictSecureDecodingMode");
    objc_msgSend(v10, "setDecodingFailurePolicy:", a5);
    v14 = *MEMORY[0x24BDD0E88];
    v18 = 0;
    objc_msgSend(v10, "decodeTopLevelObjectOfClasses:forKey:error:", v7, v14, &v18);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (!v12)
    {
      v13 = v13;
      v16 = v13;
      goto LABEL_9;
    }
    ANLogHandleAnnouncementDataItem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = &stru_24D370F00;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_2156FF000, v15, OS_LOG_TYPE_ERROR, "%@Failed to unarchive data for AnnouncementDataItems. error = %@", buf, 0x16u);
    }

  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (id)copy
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  v3 = (_QWORD *)objc_opt_new();
  -[ANAnnouncementDataItem data](self, "data");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[2];
  v3[2] = v4;

  v3[1] = -[ANAnnouncementDataItem type](self, "type");
  v3[3] = -[ANAnnouncementDataItem flags](self, "flags");
  return v3;
}

- (NSDictionary)info
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[ANAnnouncementDataItem _stringForDataType:](self, "_stringForDataType:", -[ANAnnouncementDataItem type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("DataType"));

  -[ANAnnouncementDataItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("Data"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANAnnouncementDataItem flags](self, "flags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("Flags"));

  return (NSDictionary *)v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[ANAnnouncementDataItem info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ANAnnouncementDataItem)initWithMessage:(id)a3
{
  id v4;
  ANAnnouncementDataItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSData *data;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[ANAnnouncementDataItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("DataType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v6 = (void *)objc_msgSend(v6, "unsignedIntegerValue");
    v5->_type = (unint64_t)v6;
    objc_msgSend(v4, "objectForKey:", CFSTR("Data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("Flags"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v10 = (void *)objc_msgSend(v10, "unsignedIntegerValue");
    v5->_flags = (unint64_t)v10;

  }
  return v5;
}

- (id)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANAnnouncementDataItem type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("DataType"));

  -[ANAnnouncementDataItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("Data"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANAnnouncementDataItem flags](self, "flags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("Flags"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[ANAnnouncementDataItem type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("DataType"));

  -[ANAnnouncementDataItem data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("Data"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANAnnouncementDataItem flags](self, "flags"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("Flags"));

}

- (ANAnnouncementDataItem)initWithCoder:(id)a3
{
  id v4;
  ANAnnouncementDataItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSData *data;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANAnnouncementDataItem;
  v5 = -[ANAnnouncementDataItem init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Data"));
    v9 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v11 = (void *)objc_msgSend(v11, "unsignedIntegerValue");
    v5->_type = (unint64_t)v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Flags"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v13 = (void *)objc_msgSend(v13, "unsignedIntegerValue");
    v5->_flags = (unint64_t)v13;

  }
  return v5;
}

- (id)_stringForDataType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_24D370560[a3];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
