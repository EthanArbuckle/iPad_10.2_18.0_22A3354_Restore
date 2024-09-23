@implementation HMISignpost

- (HMISignpost)initWithName:(id)a3
{
  return -[HMISignpost initWithName:deferred:](self, "initWithName:deferred:", a3, 0);
}

- (HMISignpost)initWithName:(id)a3 deferred:(BOOL)a4
{
  id v6;
  HMISignpost *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSUUID *identifier;
  NSUUID *v12;
  void *v13;
  unint64_t v14;
  objc_super v16;
  unint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMISignpost;
  v7 = -[HMISignpost init](&v16, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v10;

    v12 = v7->_identifier;
    v17 = 0;
    v18[0] = 0;
    v18[1] = 0;
    -[NSUUID getUUIDBytes:](v12, "getUUIDBytes:", v18);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v18, 16, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getBytes:range:", &v17, objc_msgSend(v13, "length") - 8, 8);

    v14 = v17;
    if (v17 + 1 < 2)
      v14 = 0xEEEEB0B5B2B2EEEELL;
    v7->_signpostIdentifier = v14;
    if (!a4)
      -[HMISignpost begin](v7, "begin");
  }

  return v7;
}

- (BOOL)shouldSignpost
{
  void *v3;
  BOOL v4;
  NSObject *v5;

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (objc_msgSend(v3, "BOOLPreferenceForKey:defaultValue:", CFSTR("enableSignposts"), 0))
  {
    -[HMISignpost signpostLog](self, "signpostLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_enabled(v5);

  }
  return v4;
}

- (BOOL)hasBegun
{
  void *v2;
  BOOL v3;

  -[HMISignpost beginDate](self, "beginDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)begin
{
  NSDate *v3;
  NSDate *beginDate;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[HMISignpost hasBegun](self, "hasBegun"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    beginDate = self->_beginDate;
    self->_beginDate = v3;

    if (-[HMISignpost shouldSignpost](self, "shouldSignpost"))
    {
      -[HMISignpost signpostLog](self, "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[HMISignpost signpostIdentifier](self, "signpostIdentifier");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          -[HMISignpost identifier](self, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "UUIDString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMISignpost name](self, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412546;
          v12 = v9;
          v13 = 2112;
          v14 = v10;
          _os_signpost_emit_with_name_impl(&dword_219D45000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HMISignpost", "Identifier = %@, Name = %@", (uint8_t *)&v11, 0x16u);

        }
      }

    }
  }
}

- (void)end
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[HMISignpost shouldSignpost](self, "shouldSignpost"))
  {
    -[HMISignpost signpostLog](self, "signpostLog");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = -[HMISignpost signpostIdentifier](self, "signpostIdentifier");
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        -[HMISignpost identifier](self, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUIDString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMISignpost name](self, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_signpost_emit_with_name_impl(&dword_219D45000, v3, OS_SIGNPOST_INTERVAL_END, v5, "HMISignpost", "Identifier = %@, Name = %@", (uint8_t *)&v9, 0x16u);

      }
    }

  }
}

- (id)logIdentifier
{
  void *v2;
  NSString *name;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  name = self->_name;
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@)"), name, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)beginDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
