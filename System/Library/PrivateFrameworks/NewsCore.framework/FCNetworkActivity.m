@implementation FCNetworkActivity

+ (FCNetworkActivity)activityWithLabel:(unsigned int)a3
{
  return -[FCNetworkActivity initWithLabel:]([FCNetworkActivity alloc], "initWithLabel:", *(_QWORD *)&a3);
}

- (FCNetworkActivity)initWithLabel:(unsigned int)a3
{
  FCNetworkActivity *v4;
  FCNetworkActivity *v5;
  uint64_t v6;
  OS_nw_activity *activity;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCNetworkActivity;
  v4 = -[FCNetworkActivity init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_domain = 54;
    v4->_label = a3;
    v6 = nw_activity_create();
    activity = v5->_activity;
    v5->_activity = (OS_nw_activity *)v6;

  }
  return v5;
}

- (void)startActivity
{
  nw_activity_activate();
}

- (void)completeActivityWithSuccess:(BOOL)a3
{
  nw_activity_complete_with_reason();
}

- (void)setParentActivity:(id)a3
{
  nw_activity_set_parent_activity();
}

- (void)attachActivityToTask:(id)a3
{
  objc_msgSend(a3, "set_nw_activity:", self->_activity);
}

- (NSUUID)token
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  v3[1] = 0;
  nw_activity_get_token();
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v3);
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)setDomain:(unsigned int)a3
{
  self->_domain = a3;
}

- (unsigned)label
{
  return self->_label;
}

- (void)setLabel:(unsigned int)a3
{
  self->_label = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
