@implementation APSMultiUserMode

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__APSMultiUserMode_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

void __34__APSMultiUserMode_sharedInstance__block_invoke()
{
  uint64_t v0;
  APSMultiUserMode *v1;
  void *v2;

  v0 = objc_msgSend((id)objc_opt_class(), "_getMultiUserMode");
  v1 = -[APSMultiUserMode initWithIsMultiUserMode:loggedInUser:]([APSMultiUserMode alloc], "initWithIsMultiUserMode:loggedInUser:", v0, objc_msgSend((id)objc_opt_class(), "_getIsCurrentlyLoggedIn"));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (APSMultiUserMode)initWithIsMultiUserMode:(BOOL)a3 loggedInUser:(BOOL)a4
{
  APSMultiUserMode *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APSMultiUserMode;
  result = -[APSMultiUserMode init](&v7, sel_init);
  if (result)
  {
    result->_isMultiUser = a3;
    result->_isLoggedInUser = a4;
  }
  return result;
}

+ (BOOL)_getMultiUserMode
{
  void *v2;
  char v3;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  return v3;
}

+ (BOOL)_getIsCurrentlyLoggedIn
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoginUser") ^ 1;

  return v4;
}

- (BOOL)isMultiAndLoggedIn
{
  return self->_isMultiUser && self->_isLoggedInUser;
}

- (BOOL)isLoggedInUser
{
  return self->_isLoggedInUser;
}

@end
