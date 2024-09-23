@implementation ATXGuardedAppBlacklist

- (ATXGuardedAppBlacklist)init
{
  ATXGuardedAppBlacklist *v2;
  uint64_t v3;
  NSMutableSet *blacklist;
  uint64_t v5;
  NSMutableDictionary *prefsChangeHandlers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXGuardedAppBlacklist;
  v2 = -[ATXGuardedAppBlacklist init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    blacklist = v2->_blacklist;
    v2->_blacklist = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    prefsChangeHandlers = v2->_prefsChangeHandlers;
    v2->_prefsChangeHandlers = (NSMutableDictionary *)v5;

    v2->_nextPrefsChangeHandlerToken = 1;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefsChangeHandlers, 0);
  objc_storeStrong((id *)&self->_blacklist, 0);
}

@end
