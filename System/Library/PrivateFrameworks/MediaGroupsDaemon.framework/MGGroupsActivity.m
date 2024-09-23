@implementation MGGroupsActivity

- (MGGroupsActivity)initWithName:(id)a3
{
  id v4;
  MGGroupsActivity *v5;
  uint64_t v6;
  NSString *name;
  NSDate *v8;
  NSDate *when;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  MGGroupsActivity *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MGGroupsActivity;
  v5 = -[MGGroupsActivity init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
    when = v5->_when;
    v5->_when = v8;

    MGLogForCategory(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v14 = v5;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_DEFAULT, "%p starting %@", buf, 0x16u);
    }

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  MGGroupsActivity *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroupsActivity when](self, "when");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  MGLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MGGroupsActivity name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_DEFAULT, "%p ending %@ (%g)", buf, 0x20u);

  }
  v9.receiver = self;
  v9.super_class = (Class)MGGroupsActivity;
  -[MGGroupsActivity dealloc](&v9, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroupsActivity name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroupsActivity when](self, "when");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ - %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)when
{
  return self->_when;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
