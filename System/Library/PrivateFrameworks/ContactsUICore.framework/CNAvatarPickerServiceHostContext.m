@implementation CNAvatarPickerServiceHostContext

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

  -[CNAvatarPickerServiceHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)avatarPickerExtensionDidSelectItemWithImageData:(id)a3 memojiMetadata:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAvatarPickerServiceHostContext exportedObject](self, "exportedObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatarPickerExtensionDidSelectItemWithImageData:memojiMetadata:", v7, v6);

}

- (void)avatarPickerExtensionDidFinishWithImageData:(id)a3 memojiMetadata:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAvatarPickerServiceHostContext exportedObject](self, "exportedObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatarPickerExtensionDidFinishWithImageData:memojiMetadata:", v7, v6);

}

- (void)avatarPickerExtensionDidCancel
{
  id v2;

  -[CNAvatarPickerServiceHostContext exportedObject](self, "exportedObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarPickerExtensionDidCancel");

}

- (void)avatarPickerExtensionDidRequestMemojiEditorPresentationForRecordIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAvatarPickerServiceHostContext exportedObject](self, "exportedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarPickerExtensionDidRequestMemojiEditorPresentationForRecordIdentifier:", v4);

}

- (void)avatarPickerExtensionDidCreateAvatarWithRecordData:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAvatarPickerServiceHostContext exportedObject](self, "exportedObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatarPickerExtensionDidCreateAvatarWithRecordData:identifier:", v7, v6);

}

- (void)avatarPickerExtensionDidDeleteAvatarWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAvatarPickerServiceHostContext exportedObject](self, "exportedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarPickerExtensionDidDeleteAvatarWithIdentifier:", v4);

}

- (CNAvatarPickerServiceHostProtocol)exportedObject
{
  return (CNAvatarPickerServiceHostProtocol *)objc_loadWeakRetained((id *)&self->_exportedObject);
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
