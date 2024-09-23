@implementation HKSummarySharingSyncRequest

- (HKSummarySharingSyncRequest)init
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

- (HKSummarySharingSyncRequest)initWithPush:(BOOL)a3 pull:(BOOL)a4
{
  HKSummarySharingSyncRequest *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKSummarySharingSyncRequest;
  result = -[HKSummarySharingSyncRequest init](&v7, sel_init);
  if (result)
  {
    result->_push = a3;
    result->_pull = a4;
  }
  return result;
}

- (id)requestByMergingRequest:(id)a3
{
  id v4;
  HKSummarySharingSyncRequest *v5;
  _BOOL8 v6;
  HKSummarySharingSyncRequest *v7;
  char v8;
  _BOOL8 v9;

  if (a3)
  {
    v4 = a3;
    v5 = [HKSummarySharingSyncRequest alloc];
    v6 = (objc_msgSend(v4, "push") & 1) != 0 || self->_push;
    v8 = objc_msgSend(v4, "pull");

    v9 = (v8 & 1) != 0 || self->_pull;
    v7 = -[HKSummarySharingSyncRequest initWithPush:pull:](v5, "initWithPush:pull:", v6, v9);
  }
  else
  {
    v7 = self;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_push == objc_msgSend(v4, "push")
    && self->_pull == objc_msgSend(v4, "pull");

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

}

- (HKSummarySharingSyncRequest)initWithCoder:(id)a3
{
  id v4;
  HKSummarySharingSyncRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKSummarySharingSyncRequest;
  v5 = -[HKSummarySharingSyncRequest init](&v7, sel_init);
  if (v5)
  {
    v5->_push = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("push"));
    v5->_pull = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pull"));
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p Push: %d, Pull: %d"), objc_opt_class(), self, self->_push, self->_pull);
}

- (BOOL)push
{
  return self->_push;
}

- (BOOL)pull
{
  return self->_pull;
}

@end
