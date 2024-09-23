@implementation SKPaymentQueueClient

- (SKPaymentQueueClient)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SKPaymentQueueClient *v6;
  CFDictionaryRef v8;
  NSString *bundleIdentifier;
  CFDictionaryRef v10;
  NSString *bundleVersion;
  CFDictionaryRef v12;
  NSString *receiptDirectoryPath;
  CFDictionaryRef v14;
  NSNumber *storeItemIdentifier;
  CFDictionaryRef v16;
  NSNumber *storeExternalVersion;
  CFDictionaryRef v18;
  NSString *vendorIdentifier;
  objc_super v20;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1AF43BC3C](v4) == MEMORY[0x1E0C812F8])
  {
    v20.receiver = self;
    v20.super_class = (Class)SKPaymentQueueClient;
    v6 = -[SKPaymentQueueClient init](&v20, sel_init);
    if (v6)
    {
      v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "5");
      objc_opt_class();
      v8 = SKXPCDictionaryCopyCFObjectWithClass(v5, "0");
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v8;

      objc_opt_class();
      v10 = SKXPCDictionaryCopyCFObjectWithClass(v5, "1");
      bundleVersion = v6->_bundleVersion;
      v6->_bundleVersion = (NSString *)v10;

      v6->_environmentType = xpc_dictionary_get_int64(v5, "A");
      v6->_hidesConfirmationDialogs = xpc_dictionary_get_BOOL(v5, "6");
      v6->_ignoresInAppPurchaseRestriction = xpc_dictionary_get_BOOL(v5, "7");
      objc_opt_class();
      v12 = SKXPCDictionaryCopyCFObjectWithClass(v5, "8");
      receiptDirectoryPath = v6->_receiptDirectoryPath;
      v6->_receiptDirectoryPath = (NSString *)v12;

      v6->_requiresAuthenticationForPayment = xpc_dictionary_get_BOOL(v5, "9");
      objc_opt_class();
      v14 = SKXPCDictionaryCopyCFObjectWithClass(v5, "2");
      storeItemIdentifier = v6->_storeItemIdentifier;
      v6->_storeItemIdentifier = (NSNumber *)v14;

      objc_opt_class();
      v16 = SKXPCDictionaryCopyCFObjectWithClass(v5, "3");
      storeExternalVersion = v6->_storeExternalVersion;
      v6->_storeExternalVersion = (NSNumber *)v16;

      objc_opt_class();
      v18 = SKXPCDictionaryCopyCFObjectWithClass(v5, "4");
      vendorIdentifier = v6->_vendorIdentifier;
      v6->_vendorIdentifier = (NSString *)v18;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "5", self->_allowsBootstrapCellularData);
  SKXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_bundleIdentifier);
  SKXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_bundleVersion);
  xpc_dictionary_set_int64(v3, "A", self->_environmentType);
  xpc_dictionary_set_BOOL(v3, "6", self->_hidesConfirmationDialogs);
  xpc_dictionary_set_BOOL(v3, "7", self->_ignoresInAppPurchaseRestriction);
  SKXPCDictionarySetCFObject(v3, "8", (__CFString *)self->_receiptDirectoryPath);
  xpc_dictionary_set_BOOL(v3, "9", self->_requiresAuthenticationForPayment);
  SKXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_storeItemIdentifier);
  SKXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_storeExternalVersion);
  SKXPCDictionarySetCFObject(v3, "4", (__CFString *)self->_vendorIdentifier);
  return v3;
}

- (id)plist
{
  id v3;
  NSString *productsRequestBundleIdentifier;
  NSString *v5;
  NSString *bundleVersion;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  void *v15;
  NSNumber *storeExternalVersion;
  NSNumber *storeItemIdentifier;
  NSString *vendorIdentifier;
  uint8_t v20[16];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  productsRequestBundleIdentifier = self->_productsRequestBundleIdentifier;
  if (productsRequestBundleIdentifier)
  {
    v5 = productsRequestBundleIdentifier;
  }
  else
  {
    v5 = self->_bundleIdentifier;
    if (!v5)
      goto LABEL_5;
  }
  objc_msgSend(v3, "setObject:forKey:", v5, SKClientOverridesKeyRequestBundleID);
LABEL_5:
  bundleVersion = self->_bundleVersion;
  if (bundleVersion)
    objc_msgSend(v3, "setObject:forKey:", bundleVersion, SKClientOverridesKeyRequestBundleVersion);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsBootstrapCellularData);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, 0x1E5B2E3E0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_environmentType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, SKClientOverridesKeyServer);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidesConfirmationDialogs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, 0x1E5B2E4C0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ignoresInAppPurchaseRestriction);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, 0x1E5B2E4E0);

  if (self->_receiptDirectoryPath)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", self->_receiptDirectoryPath, 1, 0, 0);

    -[NSString UTF8String](self->_receiptDirectoryPath, "UTF8String");
    v12 = (_BYTE *)sandbox_extension_issue_file();
    if (v12 && (v13 = v12, *v12))
    {
      objc_msgSend(v3, "setObject:forKey:", self->_receiptDirectoryPath, 0x1E5B2E560);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, 0x1E5B2E1C0);

      free(v13);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Cannot create sandbox token for custom receipt path", v20, 2u);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresAuthenticationForPayment);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, 0x1E5B2E580);

  storeExternalVersion = self->_storeExternalVersion;
  if (storeExternalVersion)
    objc_msgSend(v3, "setObject:forKey:", storeExternalVersion, SKClientOverridesKeyStoreExternalVersion);
  storeItemIdentifier = self->_storeItemIdentifier;
  if (storeItemIdentifier)
    objc_msgSend(v3, "setObject:forKey:", storeItemIdentifier, SKClientOverridesKeyStoreItemID);
  vendorIdentifier = self->_vendorIdentifier;
  if (vendorIdentifier)
    objc_msgSend(v3, "setObject:forKey:", vendorIdentifier, SKClientOverridesKeyVendorID);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id WeakRetained;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setProductsRequestBundleIdentifier:", self->_productsRequestBundleIdentifier);
  objc_msgSend(v4, "setAllowsBootstrapCellularData:", self->_allowsBootstrapCellularData);
  objc_msgSend(v4, "setBundleIdentifier:", self->_bundleIdentifier);
  objc_msgSend(v4, "setBundleVersion:", self->_bundleVersion);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "setDelegate:", WeakRetained);

  objc_msgSend(v4, "setEnvironmentType:", self->_environmentType);
  objc_msgSend(v4, "setHidesConfirmationDialogs:", self->_hidesConfirmationDialogs);
  objc_msgSend(v4, "setIgnoresInAppPurchaseRestriction:", self->_ignoresInAppPurchaseRestriction);
  objc_msgSend(v4, "setReceiptDirectoryPath:", self->_receiptDirectoryPath);
  objc_msgSend(v4, "setRequiresAuthenticationForPayment:", self->_requiresAuthenticationForPayment);
  objc_msgSend(v4, "setStoreExternalVersion:", self->_storeExternalVersion);
  objc_msgSend(v4, "setStoreItemIdentifier:", self->_storeItemIdentifier);
  objc_msgSend(v4, "setVendorIdentifier:", self->_vendorIdentifier);
  return v4;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)productsRequestBundleIdentifier
{
  return self->_productsRequestBundleIdentifier;
}

- (void)setProductsRequestBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)environmentType
{
  return self->_environmentType;
}

- (void)setEnvironmentType:(int64_t)a3
{
  self->_environmentType = a3;
}

- (BOOL)hidesConfirmationDialogs
{
  return self->_hidesConfirmationDialogs;
}

- (void)setHidesConfirmationDialogs:(BOOL)a3
{
  self->_hidesConfirmationDialogs = a3;
}

- (BOOL)ignoresInAppPurchaseRestriction
{
  return self->_ignoresInAppPurchaseRestriction;
}

- (void)setIgnoresInAppPurchaseRestriction:(BOOL)a3
{
  self->_ignoresInAppPurchaseRestriction = a3;
}

- (NSString)receiptDirectoryPath
{
  return self->_receiptDirectoryPath;
}

- (void)setReceiptDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)requiresAuthenticationForPayment
{
  return self->_requiresAuthenticationForPayment;
}

- (void)setRequiresAuthenticationForPayment:(BOOL)a3
{
  self->_requiresAuthenticationForPayment = a3;
}

- (NSNumber)storeExternalVersion
{
  return self->_storeExternalVersion;
}

- (void)setStoreExternalVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SKPaymentQueueClientDelegate)delegate
{
  return (SKPaymentQueueClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_productsRequestBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_storeExternalVersion, 0);
  objc_storeStrong((id *)&self->_receiptDirectoryPath, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
