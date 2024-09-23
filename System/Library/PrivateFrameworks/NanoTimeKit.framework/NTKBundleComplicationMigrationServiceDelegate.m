@implementation NTKBundleComplicationMigrationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_requireEntitlement
    && (objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.nanotimekit.BundleComplicationMigrationService")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "BOOLValue"),
        v9,
        !v10))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E72D58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v11);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v8, "setExportedObject:", v12);
    objc_msgSend(v8, "resume");

    v13 = 1;
  }

  return v13;
}

- (BOOL)requireEntitlement
{
  return self->_requireEntitlement;
}

- (void)setRequireEntitlement:(BOOL)a3
{
  self->_requireEntitlement = a3;
}

@end
