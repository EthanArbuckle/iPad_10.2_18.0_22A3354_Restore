@implementation _ATXDistributedNotification

- (_ATXDistributedNotification)initWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  _ATXDistributedNotification *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSDictionary *userInfo;
  double v13;
  _ATXDistributedNotification *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_ATXDistributedNotification;
  v8 = -[_ATXDistributedNotification init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    userInfo = v8->_userInfo;
    v8->_userInfo = (NSDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8->_timestamp = v13;
    v14 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_ATXDistributedNotification name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_ATXDistributedNotification userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _ATXDistributedNotification *v4;
  _ATXDistributedNotification *v5;
  BOOL v6;

  v4 = (_ATXDistributedNotification *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_ATXDistributedNotification isEqualTo_ATXDistributedNotification:](self, "isEqualTo_ATXDistributedNotification:", v5);

  return v6;
}

- (BOOL)isEqualTo_ATXDistributedNotification:(id)a3
{
  id *v4;
  NSString *name;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSDictionary *v11;
  NSDictionary *v12;

  v4 = (id *)a3;
  name = self->_name;
  v6 = (NSString *)v4[1];
  if (name == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = name;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_userInfo;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSDictionary isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
