@implementation PUPhotoPickerAbstractExtensionContext

- (id)proxy
{
  void *v2;
  void *v3;

  -[PUPhotoPickerAbstractExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_111);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)invalidateContext
{
  id v2;

  -[PUPhotoPickerAbstractExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)principalObject
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerAbstractExtensionContext;
  -[PUPhotoPickerAbstractExtensionContext _principalObject](&v3, sel__principalObject);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)firstPayloadFromExtensionItems:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)*MEMORY[0x24BDF8430], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachments");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v7))
        {
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __83__PUPhotoPickerAbstractExtensionContext_firstPayloadFromExtensionItems_completion___block_invoke;
          v15[3] = &unk_24C62BFA8;
          v16 = v6;
          objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v7, 0, v15);

          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_12:

}

uint64_t __83__PUPhotoPickerAbstractExtensionContext_firstPayloadFromExtensionItems_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46__PUPhotoPickerAbstractExtensionContext_proxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "localizedDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("PhotoPicker extension context error getting proxy - %@"), v2);

}

+ (id)_allowedItemPayloadClasses
{
  if (_allowedItemPayloadClasses_onceToken != -1)
    dispatch_once(&_allowedItemPayloadClasses_onceToken, &__block_literal_global_152);
  return (id)_allowedItemPayloadClasses_allowedItemPayloadClasses;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_36);
  return (id)_extensionAuxiliaryVendorProtocol_interface;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_89);
  return (id)_extensionAuxiliaryHostProtocol_interface;
}

void __72__PUPhotoPickerAbstractExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CA918);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

  objc_msgSend((id)_extensionAuxiliaryHostProtocol_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_dismissCurrentViewControllerFromPhotoPickerAnimated_, 0, 0);
  objc_msgSend((id)_extensionAuxiliaryHostProtocol_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didDisplayPhotoPickerSourceType_, 0, 0);
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryHostProtocol_interface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_didSelectMediaWithInfoDictionary_, 0, 0);
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryHostProtocol_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_didSelectMultipleMediaItemsWithInfoDictionaries_, 0, 0);
  objc_msgSend((id)_extensionAuxiliaryHostProtocol_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performTraitCollectionUpdateUsingData_completion_, 0, 0);
  objc_msgSend((id)_extensionAuxiliaryHostProtocol_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performTraitCollectionUpdateUsingData_completion_, 0, 1);

}

uint64_t __74__PUPhotoPickerAbstractExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D2BF0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performTraitCollectionUpdateUsingData_completion_, 0, 0);
  return objc_msgSend((id)_extensionAuxiliaryVendorProtocol_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_performTraitCollectionUpdateUsingData_completion_, 0, 1);
}

void __67__PUPhotoPickerAbstractExtensionContext__allowedItemPayloadClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_allowedItemPayloadClasses_allowedItemPayloadClasses;
  _allowedItemPayloadClasses_allowedItemPayloadClasses = v2;

}

@end
