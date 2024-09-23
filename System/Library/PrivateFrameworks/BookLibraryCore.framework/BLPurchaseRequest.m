@implementation BLPurchaseRequest

+ (id)requestWithBuyParameters:(id)a3 storeIdentifier:(id)a4
{
  id v5;
  id v6;
  BLPurchaseRequest *v7;
  _BOOL8 v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(BLPurchaseRequest);
  -[BLPurchaseRequest setBuyParameters:](v7, "setBuyParameters:", v6);
  -[BLPurchaseRequest setStoreIdentifier:](v7, "setStoreIdentifier:", v5);

  v8 = +[BLUtilities isPreOrderFromBuyParameters:](BLUtilities, "isPreOrderFromBuyParameters:", v6);
  -[BLPurchaseRequest setPreOrder:](v7, "setPreOrder:", v8);
  -[BLPurchaseRequest setUserInitiated:](v7, "setUserInitiated:", 1);
  return v7;
}

+ (id)requestWithPermlink:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  BLPurchaseRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(BLPurchaseRequest);
  -[BLPurchaseRequest setPermlink:](v7, "setPermlink:", v6);

  -[BLPurchaseRequest setPermlinkTitle:](v7, "setPermlinkTitle:", v5);
  -[BLPurchaseRequest setUserInitiated:](v7, "setUserInitiated:", 1);
  return v7;
}

- (NSString)logUUID
{
  NSString *logUUID;

  logUUID = self->_logUUID;
  if (!logUUID)
  {
    if (qword_254B61C80 != -1)
      dispatch_once(&qword_254B61C80, &unk_24CE8B968);
    logUUID = (NSString *)qword_254B61C78;
  }
  return logUUID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLPurchaseRequest)initWithCoder:(id)a3
{
  id v4;
  BLPurchaseRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BLPurchaseRequest;
  v5 = -[BLPurchaseRequest init](&v32, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audiobook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setAudiobook:](v5, "setAudiobook:", objc_msgSend(v7, "BOOLValue"));

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preOrder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setPreOrder:](v5, "setPreOrder:", objc_msgSend(v9, "BOOLValue"));

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setRestore:](v5, "setRestore:", objc_msgSend(v11, "BOOLValue"));

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementalContent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setSupplementalContent:](v5, "setSupplementalContent:", objc_msgSend(v13, "BOOLValue"));

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suppressNetworkEvaluatorDialogs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setSuppressNetworkEvaluatorDialogs:](v5, "setSuppressNetworkEvaluatorDialogs:", objc_msgSend(v15, "BOOLValue"));

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInitiated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setUserInitiated:](v5, "setUserInitiated:", objc_msgSend(v17, "BOOLValue"));

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setPresentingSceneIdentifier:](v5, "setPresentingSceneIdentifier:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setStoreIdentifier:](v5, "setStoreIdentifier:", v20);

    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("storeIdentifiersToDownload"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setStoreIdentifiersToDownload:](v5, "setStoreIdentifiersToDownload:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buyParameters"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setBuyParameters:](v5, "setBuyParameters:", v25);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permlink"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setPermlink:](v5, "setPermlink:", v26);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permlinkTitle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setPermlinkTitle:](v5, "setPermlinkTitle:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setAccountIdentifier:](v5, "setAccountIdentifier:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logUUID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setLogUUID:](v5, "setLogUUID:", v29);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentSheetListenerEndpoint"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseRequest setPaymentSheetListenerEndpoint:](v5, "setPaymentSheetListenerEndpoint:", v30);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[BLPurchaseRequest isAudiobook](self, "isAudiobook"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("audiobook"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BLPurchaseRequest isPreOrder](self, "isPreOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("preOrder"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BLPurchaseRequest isRestore](self, "isRestore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("restore"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BLPurchaseRequest isSupplementalContent](self, "isSupplementalContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("supplementalContent"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BLPurchaseRequest shouldSuppressNetworkEvaluatorDialogs](self, "shouldSuppressNetworkEvaluatorDialogs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("suppressNetworkEvaluatorDialogs"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BLPurchaseRequest isUserInitiated](self, "isUserInitiated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("userInitiated"));

  -[BLPurchaseRequest presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("presentingSceneIdentifier"));

  -[BLPurchaseRequest storeIdentifier](self, "storeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("storeIdentifier"));

  -[BLPurchaseRequest storeIdentifiersToDownload](self, "storeIdentifiersToDownload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("storeIdentifiersToDownload"));

  -[BLPurchaseRequest buyParameters](self, "buyParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("buyParameters"));

  -[BLPurchaseRequest permlink](self, "permlink");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("permlink"));

  -[BLPurchaseRequest permlinkTitle](self, "permlinkTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("permlinkTitle"));

  -[BLPurchaseRequest accountIdentifier](self, "accountIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("accountIdentifier"));

  -[BLPurchaseRequest logUUID](self, "logUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("logUUID"));

  -[BLPurchaseRequest paymentSheetListenerEndpoint](self, "paymentSheetListenerEndpoint");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("paymentSheetListenerEndpoint"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v4, "setAudiobook:", -[BLPurchaseRequest isAudiobook](self, "isAudiobook"));
    -[BLPurchaseRequest storeIdentifier](self, "storeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStoreIdentifier:", v5);

    -[BLPurchaseRequest storeIdentifiersToDownload](self, "storeIdentifiersToDownload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStoreIdentifiersToDownload:", v6);

    -[BLPurchaseRequest buyParameters](self, "buyParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBuyParameters:", v7);

    -[BLPurchaseRequest permlink](self, "permlink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPermlink:", v8);

    -[BLPurchaseRequest permlinkTitle](self, "permlinkTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPermlinkTitle:", v9);

    objc_msgSend(v4, "setPreOrder:", -[BLPurchaseRequest isPreOrder](self, "isPreOrder"));
    objc_msgSend(v4, "setRestore:", -[BLPurchaseRequest isRestore](self, "isRestore"));
    objc_msgSend(v4, "setSupplementalContent:", -[BLPurchaseRequest isSupplementalContent](self, "isSupplementalContent"));
    objc_msgSend(v4, "setSuppressNetworkEvaluatorDialogs:", -[BLPurchaseRequest shouldSuppressNetworkEvaluatorDialogs](self, "shouldSuppressNetworkEvaluatorDialogs"));
    objc_msgSend(v4, "setUserInitiated:", -[BLPurchaseRequest isUserInitiated](self, "isUserInitiated"));
    -[BLPurchaseRequest presentingSceneIdentifier](self, "presentingSceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPresentingSceneIdentifier:", v10);

    -[BLPurchaseRequest accountIdentifier](self, "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccountIdentifier:", v11);

    -[BLPurchaseRequest logUUID](self, "logUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLogUUID:", v12);

    -[BLPurchaseRequest paymentSheetListenerEndpoint](self, "paymentSheetListenerEndpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPaymentSheetListenerEndpoint:", v13);

  }
  return v4;
}

- (void)setLogUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAudiobook
{
  return self->_audiobook;
}

- (void)setAudiobook:(BOOL)a3
{
  self->_audiobook = a3;
}

- (BOOL)isPreOrder
{
  return self->_preOrder;
}

- (void)setPreOrder:(BOOL)a3
{
  self->_preOrder = a3;
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeIdentifier, a3);
}

- (NSURL)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
  objc_storeStrong((id *)&self->_permlink, a3);
}

- (NSString)permlinkTitle
{
  return self->_permlinkTitle;
}

- (void)setPermlinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)analyticsInfo
{
  return self->_analyticsInfo;
}

- (void)setAnalyticsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsInfo, a3);
}

- (BOOL)isRestore
{
  return self->_restore;
}

- (void)setRestore:(BOOL)a3
{
  self->_restore = a3;
}

- (BOOL)shouldSuppressNetworkEvaluatorDialogs
{
  return self->_suppressNetworkEvaluatorDialogs;
}

- (void)setSuppressNetworkEvaluatorDialogs:(BOOL)a3
{
  self->_suppressNetworkEvaluatorDialogs = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, a3);
}

- (NSSet)storeIdentifiersToDownload
{
  return self->_storeIdentifiersToDownload;
}

- (void)setStoreIdentifiersToDownload:(id)a3
{
  objc_storeStrong((id *)&self->_storeIdentifiersToDownload, a3);
}

- (BOOL)isSupplementalContent
{
  return self->_supplementalContent;
}

- (void)setSupplementalContent:(BOOL)a3
{
  self->_supplementalContent = a3;
}

- (NSXPCListenerEndpoint)paymentSheetListenerEndpoint
{
  return self->_paymentSheetListenerEndpoint;
}

- (void)setPaymentSheetListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSheetListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_storeIdentifiersToDownload, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsInfo, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_permlinkTitle, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
}

@end
