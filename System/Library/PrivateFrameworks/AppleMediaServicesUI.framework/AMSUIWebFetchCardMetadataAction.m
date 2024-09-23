@implementation AMSUIWebFetchCardMetadataAction

- (AMSUIWebFetchCardMetadataAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebFetchCardMetadataAction *v7;
  void *v8;
  NSNumber *v9;
  NSNumber *cardArtworkSize;
  void *v11;
  NSString *v12;
  NSString *passTypeIdentifier;
  void *v14;
  NSString *v15;
  NSString *serialNumber;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebFetchCardMetadataAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v18, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cardArtworkSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    cardArtworkSize = v7->_cardArtworkSize;
    v7->_cardArtworkSize = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passTypeIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    passTypeIdentifier = v7->_passTypeIdentifier;
    v7->_passTypeIdentifier = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serialNumber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    serialNumber = v7->_serialNumber;
    v7->_serialNumber = v15;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)AMSUIWebFetchCardMetadataAction;
  v3 = -[AMSUIWebAction runAction](&v33, sel_runAction);
  -[AMSUIWebAction context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE080B0], "shouldUseExtendedEnrollmentWithBag:", v5) & 1) != 0)
  {
    -[AMSUIWebFetchCardMetadataAction passTypeIdentifier](self, "passTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.AppleMediaServices.PassTypeIdentifier.AppleCard")))
    {
      +[AMSUICardMetadata appleCardIconString](AMSUICardMetadata, "appleCardIconString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v7)
      {
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_opt_class();
          AMSLogKey();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v11;
          v37 = 2114;
          v38 = v12;
          _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully retrieved the apple card icon.", buf, 0x16u);

        }
        v13 = objc_alloc_init(MEMORY[0x24BE080C0]);
        objc_msgSend(v13, "setCardArtwork:", v7);
        v14 = (void *)MEMORY[0x24BE08340];
        objc_msgSend(v13, "dictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "promiseWithResult:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = objc_opt_class();
          AMSLogKey();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v27;
          v37 = 2114;
          v38 = v28;
          _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for no apple card icon.", buf, 0x16u);

        }
        v29 = (void *)MEMORY[0x24BE08340];
        AMSError();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "promiseWithError:", v13);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v23 = objc_alloc_init(MEMORY[0x24BE08340]);
      -[AMSUIWebFetchCardMetadataAction serialNumber](self, "serialNumber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebFetchCardMetadataAction cardArtworkSize](self, "cardArtworkSize");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __44__AMSUIWebFetchCardMetadataAction_runAction__block_invoke;
      v31[3] = &unk_24CB511E0;
      v17 = v23;
      v32 = v17;
      +[AMSUICardMetadata metadataForPassTypeIdentifier:serialNumber:cardArtworkSize:completionHandler:](AMSUICardMetadata, "metadataForPassTypeIdentifier:serialNumber:cardArtworkSize:completionHandler:", v6, v24, v25, v31);

      v7 = v32;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v20;
      v37 = 2114;
      v38 = v21;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for feature not enabled.", buf, 0x16u);

    }
    v22 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "promiseWithError:", v6);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __44__AMSUIWebFetchCardMetadataAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "ams_mapWithTransform:", &__block_literal_global_24);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

uint64_t __44__AMSUIWebFetchCardMetadataAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionary");
}

- (NSNumber)cardArtworkSize
{
  return self->_cardArtworkSize;
}

- (void)setCardArtworkSize:(id)a3
{
  objc_storeStrong((id *)&self->_cardArtworkSize, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_cardArtworkSize, 0);
}

@end
