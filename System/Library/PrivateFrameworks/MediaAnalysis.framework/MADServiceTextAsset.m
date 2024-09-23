@implementation MADServiceTextAsset

- (MADServiceTextAsset)initWithTextInputs:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v9;
  id v10;
  id v11;
  MADServiceTextAsset *v12;
  MADServiceTextAsset *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADServiceTextAsset;
  v12 = -[MADServiceTextAsset init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textInputs, a3);
    objc_storeStrong((id *)&v13->_clientBundleID, a4);
    objc_storeStrong((id *)&v13->_clientTeamID, a5);
  }

  return v13;
}

+ (MADServiceTextAsset)assetWithTextInputs:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTextInputs:clientBundleID:clientTeamID:", v9, v8, v7);

  return (MADServiceTextAsset *)v10;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientTeamID
{
  return self->_clientTeamID;
}

- (NSArray)textInputs
{
  return self->_textInputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputs, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end
