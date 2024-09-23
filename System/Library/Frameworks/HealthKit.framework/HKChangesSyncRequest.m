@implementation HKChangesSyncRequest

- (HKChangesSyncRequest)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKChangesSyncRequest)initWithPush:(BOOL)a3 pull:(BOOL)a4 lite:(BOOL)a5
{
  HKChangesSyncRequest *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKChangesSyncRequest;
  result = -[HKChangesSyncRequest init](&v9, sel_init);
  if (result)
  {
    result->_push = a3;
    result->_pull = a4;
    result->_lite = a5;
  }
  return result;
}

- (id)requestByMergingRequest:(id)a3
{
  id v4;
  HKChangesSyncRequest *v5;
  _BOOL8 v6;
  HKChangesSyncRequest *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  HKChangesSyncRequest *v10;

  v4 = a3;
  if (v4)
  {
    v5 = [HKChangesSyncRequest alloc];
    v6 = (objc_msgSend(v4, "push") & 1) != 0 || self->_push;
    v8 = (objc_msgSend(v4, "pull") & 1) != 0 || self->_pull;
    v9 = (objc_msgSend(v4, "lite") & 1) != 0 || self->_lite;
    v7 = -[HKChangesSyncRequest initWithPush:pull:lite:](v5, "initWithPush:pull:lite:", v6, v8, v9);
  }
  else
  {
    v7 = self;
  }
  v10 = v7;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_push == objc_msgSend(v4, "push")
    && self->_pull == objc_msgSend(v4, "pull")
    && self->_lite == objc_msgSend(v4, "lite");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 push;
  id v5;

  push = self->_push;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", push, CFSTR("push"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pull, CFSTR("pull"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lite, CFSTR("lite"));

}

- (HKChangesSyncRequest)initWithCoder:(id)a3
{
  id v4;
  HKChangesSyncRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKChangesSyncRequest;
  v5 = -[HKChangesSyncRequest init](&v7, sel_init);
  if (v5)
  {
    v5->_push = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("push"));
    v5->_pull = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pull"));
    v5->_lite = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lite"));
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p Push: %d, Pull: %d, Lite: %d"), objc_opt_class(), self, -[HKChangesSyncRequest push](self, "push"), -[HKChangesSyncRequest pull](self, "pull"), -[HKChangesSyncRequest lite](self, "lite"));
}

- (BOOL)push
{
  return self->_push;
}

- (BOOL)pull
{
  return self->_pull;
}

- (BOOL)lite
{
  return self->_lite;
}

@end
