@implementation __HMFActivityManager

- (__HMFActivityManager)init
{
  __HMFActivityManager *v2;
  uint64_t v3;
  NSMapTable *activitiesByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__HMFActivityManager;
  v2 = -[__HMFActivityManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 5);
    v3 = objc_claimAutoreleasedReturnValue();
    activitiesByIdentifier = v2->_activitiesByIdentifier;
    v2->_activitiesByIdentifier = (NSMapTable *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitiesByIdentifier, 0);
}

@end
