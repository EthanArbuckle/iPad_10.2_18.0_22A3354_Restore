@implementation _MPCQCBMSessionTypeInfo

- (BOOL)supported
{
  return self->_supported;
}

- (NSString)supportedReason
{
  return self->_supportedReason;
}

- (BOOL)exportable
{
  return self->_exportable;
}

- (NSString)exportableReason
{
  return self->_exportableReason;
}

- (MPCPlaybackAccount)account
{
  return self->_account;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)infoWithIdentifier:(id)a3 account:(id)a4 supported:(BOOL)a5 supportedReason:(id)a6 exportable:(BOOL)a7 exportableReason:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  _MPCQCBMSessionTypeInfo *v17;

  v8 = a7;
  v10 = a5;
  v13 = a8;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(_MPCQCBMSessionTypeInfo);
  -[_MPCQCBMSessionTypeInfo setIdentifier:](v17, "setIdentifier:", v16);

  -[_MPCQCBMSessionTypeInfo setAccount:](v17, "setAccount:", v15);
  -[_MPCQCBMSessionTypeInfo setSupported:](v17, "setSupported:", v10);
  -[_MPCQCBMSessionTypeInfo setSupportedReason:](v17, "setSupportedReason:", v14);

  -[_MPCQCBMSessionTypeInfo setExportable:](v17, "setExportable:", v8);
  -[_MPCQCBMSessionTypeInfo setExportableReason:](v17, "setExportableReason:", v13);

  return v17;
}

- (void)setSupportedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setExportableReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setExportable:(BOOL)a3
{
  self->_exportable = a3;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportableReason, 0);
  objc_storeStrong((id *)&self->_supportedReason, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
