@implementation CMSNetworkActivity

- (CMSNetworkActivity)initWithLabel:(unsigned int)a3 parentUUID:(id)a4
{
  id v6;
  CMSNetworkActivity *v7;
  CMSNetworkActivity *v8;
  uint64_t v9;
  OS_nw_activity *nwActivity;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CMSNetworkActivity;
  v7 = -[CMSNetworkActivity init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_label = a3;
    v9 = nw_activity_create();
    nwActivity = v8->_nwActivity;
    v8->_nwActivity = (OS_nw_activity *)v9;

    nwActivityFromUUID(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      nw_activity_set_parent_activity();
    nw_activity_activate();

  }
  return v8;
}

- (CMSNetworkActivity)initWithLabel:(unsigned int)a3 parentActivity:(id)a4
{
  id v6;
  CMSNetworkActivity *v7;
  CMSNetworkActivity *v8;
  uint64_t v9;
  OS_nw_activity *nwActivity;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSNetworkActivity;
  v7 = -[CMSNetworkActivity init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_label = a3;
    v9 = nw_activity_create();
    nwActivity = v8->_nwActivity;
    v8->_nwActivity = (OS_nw_activity *)v9;

    objc_msgSend(v6, "nwActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "nwActivity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      nw_activity_set_parent_activity();

    }
    nw_activity_activate();
  }

  return v8;
}

- (CMSNetworkActivity)initWithRetry:(id)a3
{
  id v4;
  CMSNetworkActivity *v5;
  void *v6;
  uint64_t retry;
  OS_nw_activity *nwActivity;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMSNetworkActivity;
  v5 = -[CMSNetworkActivity init](&v10, sel_init);
  if (v5)
  {
    v5->_label = objc_msgSend(v4, "label");
    objc_msgSend(v4, "nwActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    retry = nw_activity_create_retry();
    nwActivity = v5->_nwActivity;
    v5->_nwActivity = (OS_nw_activity *)retry;

    nw_activity_activate();
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CMSNetworkActivity completeActivity:](self, "completeActivity:", 1);
  v3.receiver = self;
  v3.super_class = (Class)CMSNetworkActivity;
  -[CMSNetworkActivity dealloc](&v3, sel_dealloc);
}

- (void)associateWithTask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CMSNetworkActivity nwActivity](self, "nwActivity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_nw_activity:", v5);

}

- (void)completeActivity:(int)a3
{
  id v3;

  if (!self->_completed)
  {
    self->_completed = 1;
    -[CMSNetworkActivity nwActivity](self, "nwActivity");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    nw_activity_complete_with_reason();

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSNetworkActivity)initWithCoder:(id)a3
{
  id v4;
  CMSNetworkActivity *v5;
  void *v6;
  uint64_t v7;
  OS_nw_activity *nwActivity;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMSNetworkActivity;
  v5 = -[CMSNetworkActivity init](&v10, sel_init);
  if (v5)
  {
    v5->_label = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("label"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nwActivityUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    nwActivityFromUUID(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    nwActivity = v5->_nwActivity;
    v5->_nwActivity = (OS_nw_activity *)v7;

    v5->_completed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completed"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[CMSNetworkActivity label](self, "label"), CFSTR("label"));
  -[CMSNetworkActivity nwActivity](self, "nwActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = 0;
    v7[1] = 0;
    nw_activity_get_token();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v7);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nwActivityUUID"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_completed, CFSTR("completed"));
}

- (unsigned)label
{
  return self->_label;
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwActivity, 0);
}

@end
