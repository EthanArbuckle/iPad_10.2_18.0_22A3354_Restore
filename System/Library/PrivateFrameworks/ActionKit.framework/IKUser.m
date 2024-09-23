@implementation IKUser

- (IKUser)init
{
  IKUser *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKUser;
  result = -[IKUser init](&v3, sel_init);
  if (result)
  {
    result->_userID = 0x7FFFFFFFFFFFFFFFLL;
    result->_username = 0;
    result->_subscribed = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ (%lu), subscribed:%d>"), NSStringFromClass(v4), -[IKUser username](self, "username"), -[IKUser userID](self, "userID"), -[IKUser isSubscribed](self, "isSubscribed"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKUser;
  -[IKUser dealloc](&v3, sel_dealloc);
}

- (unint64_t)userID
{
  return self->_userID;
}

- (void)setUserID:(unint64_t)a3
{
  self->_userID = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

@end
