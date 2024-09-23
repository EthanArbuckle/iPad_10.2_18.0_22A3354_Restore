@implementation DMCManagedAppPayload

+ (id)typeStrings
{
  return &unk_24D548738;
}

+ (id)localizedSingularForm
{
  return DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APPS_SINGULAR"));
}

+ (id)localizedPluralForm
{
  return DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APPS_PLURAL"));
}

- (DMCManagedAppPayload)initWithManagedAppID:(id)a3 profile:(id)a4
{
  id v6;
  DMCManagedAppPayload *v7;
  DMCManagedAppPayload *v8;

  v6 = a3;
  v7 = -[DMCManagedAppPayload init](self, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_managedAppID, a3);

  return v8;
}

- (NSString)managedAppID
{
  return self->_managedAppID;
}

- (void)setManagedAppID:(id)a3
{
  objc_storeStrong((id *)&self->_managedAppID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedAppID, 0);
}

@end
