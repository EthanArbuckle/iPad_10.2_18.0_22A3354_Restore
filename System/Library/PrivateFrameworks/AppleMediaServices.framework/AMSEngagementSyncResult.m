@implementation AMSEngagementSyncResult

+ (id)archiveClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementSyncResult actions](self, "actions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyActions"));

}

- (AMSEngagementSyncResult)initWithCoder:(id)a3
{
  id v4;
  AMSEngagementSyncResult *v5;
  void *v6;
  uint64_t v7;
  NSArray *actions;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSEngagementSyncResult;
  v5 = -[AMSEngagementSyncResult init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCodingKeyActions"));
    v7 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v7;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
