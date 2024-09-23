@implementation CNAvatarPickerServiceExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F03DEA00);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F03DE798);
}

- (id)remoteProxy
{
  void *v2;
  void *v3;

  -[CNAvatarPickerServiceExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSelectedRecordIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAvatarPickerServiceExtensionContext exportedObject](self, "exportedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedRecordIdentifier:", v4);

}

- (void)setCurrentMemojiMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAvatarPickerServiceExtensionContext exportedObject](self, "exportedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentMemojiMetadata:", v4);

}

- (void)overrideUserInterfaceStyle:(int64_t)a3
{
  id v4;

  -[CNAvatarPickerServiceExtensionContext exportedObject](self, "exportedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideUserInterfaceStyle:", a3);

}

- (void)setSetupUserAvatarRecords:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAvatarPickerServiceExtensionContext exportedObject](self, "exportedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetupUserAvatarRecords:", v4);

}

- (CNAvatarPickerServiceExtensionProtocol)exportedObject
{
  return (CNAvatarPickerServiceExtensionProtocol *)objc_loadWeakRetained((id *)&self->_exportedObject);
}

- (void)setExportedObject:(id)a3
{
  objc_storeWeak((id *)&self->_exportedObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportedObject);
}

@end
