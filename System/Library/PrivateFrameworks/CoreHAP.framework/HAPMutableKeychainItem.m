@implementation HAPMutableKeychainItem

- (HAPMutableKeychainItem)initWithPairingIdentity:(id)a3
{
  id v4;
  HAPMutableKeychainItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  HAPMutableKeychainItem *v16;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAPMutableKeychainItem;
  v5 = -[HAPMutableKeychainItem init](&v19, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setAccount:](v5, "setAccount:", v6);

  objc_msgSend(v4, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "privateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_retainAutorelease(v10);
  v18 = 0;
  LODWORD(v12) = _serializeKeyPairToData(v12, objc_msgSend(v13, "bytes"), &v18);
  v14 = v18;
  v15 = v14;
  if (!(_DWORD)v12)
  {
    -[HAPKeychainItem setValueData:](v5, "setValueData:", v14);

LABEL_5:
    v16 = v5;
    goto LABEL_6;
  }

  v16 = 0;
LABEL_6:

  return v16;
}

@end
