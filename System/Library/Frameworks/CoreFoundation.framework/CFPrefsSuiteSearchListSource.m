@implementation CFPrefsSuiteSearchListSource

- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)a4
{
  os_unfair_lock_assert_owner(&self->super.super._lock);
}

- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__CFPrefsSuiteSearchListSource_handleChangeNotificationForDomainIdentifier_isRemote___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  v5 = a4;
  -[CFPrefsSource forEachObserver:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __85__CFPrefsSuiteSearchListSource_handleChangeNotificationForDomainIdentifier_isRemote___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleChangeNotificationForDomainIdentifier:isRemote:", objc_msgSend(a2, "domainIdentifier"), *(unsigned __int8 *)(a1 + 32));
}

- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5
{
  abort();
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  os_unfair_lock_assert_owner(&self->super.super._lock);
}

@end
