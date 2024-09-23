@implementation XRMobileAgentTeam

- (XRMobileAgentTeam)initWithMembers:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  XRMobileAgentTeam *v9;
  uint64_t v10;
  NSSet *members;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)XRMobileAgentTeam;
  v9 = -[XRMobileAgentTeam init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    members = v9->_members;
    v9->_members = (NSSet *)v10;

  }
  return v9;
}

- (XRMobileAgentTeam)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  XRMobileAgentTeam *v7;

  v3 = (void *)objc_opt_new();
  v7 = (XRMobileAgentTeam *)objc_msgSend_initWithMembers_(self, v4, (uint64_t)v3, v5, v6);

  return v7;
}

- (NSSet)members
{
  return self->_members;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_members, 0);
}

@end
