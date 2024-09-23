@implementation ATXScreenLogUnlockSessionContext

- (ATXScreenLogUnlockSessionContext)init
{
  void *v3;
  ATXScreenLogUnlockSessionContext *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXScreenLogUnlockSessionContext initWithUnlockSessionManager:](self, "initWithUnlockSessionManager:", v3);

  return v4;
}

- (ATXScreenLogUnlockSessionContext)initWithUnlockSessionManager:(id)a3
{
  id v5;
  ATXScreenLogUnlockSessionContext *v6;
  ATXScreenLogUnlockSessionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScreenLogUnlockSessionContext;
  v6 = -[ATXScreenLogUnlockSessionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_unlockSessionManager, a3);

  return v7;
}

- (void)updateWithUIEvent:(id)a3
{
  -[ATXHomeScreenLogUnlockSessionManager updateSessionStateWithUIEvent:](self->_unlockSessionManager, "updateSessionStateWithUIEvent:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_unlockSessionManager, CFSTR("sessionManager"));
}

- (ATXScreenLogUnlockSessionContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ATXScreenLogUnlockSessionContext *v9;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  __atxlog_handle_metrics();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("sessionManager"), v5, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSessionContext"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[ATXScreenLogUnlockSessionContext initWithUnlockSessionManager:](self, "initWithUnlockSessionManager:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)self->_unlockSessionManager;
}

- (BOOL)isEqual:(id)a3
{
  ATXScreenLogUnlockSessionContext *v4;
  ATXScreenLogUnlockSessionContext *v5;
  BOOL v6;

  v4 = (ATXScreenLogUnlockSessionContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXScreenLogUnlockSessionContext isEqualToATXScreenLogUnlockSessionContext:](self, "isEqualToATXScreenLogUnlockSessionContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXScreenLogUnlockSessionContext:(id)a3
{
  ATXHomeScreenLogUnlockSessionManager *v4;
  ATXHomeScreenLogUnlockSessionManager *v5;
  char v6;

  v4 = self->_unlockSessionManager;
  v5 = v4;
  if (v4 == *((ATXHomeScreenLogUnlockSessionManager **)a3 + 1))
    v6 = 1;
  else
    v6 = -[ATXHomeScreenLogUnlockSessionManager isEqual:](v4, "isEqual:");

  return v6;
}

- (ATXHomeScreenLogUnlockSessionManager)unlockSessionManager
{
  return self->_unlockSessionManager;
}

- (void)setUnlockSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_unlockSessionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockSessionManager, 0);
}

@end
