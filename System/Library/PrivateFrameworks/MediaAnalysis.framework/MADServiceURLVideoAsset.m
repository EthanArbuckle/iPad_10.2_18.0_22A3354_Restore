@implementation MADServiceURLVideoAsset

- (MADServiceURLVideoAsset)initWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6
{
  id v11;
  id v12;
  MADServiceURLVideoAsset *v13;
  MADServiceURLVideoAsset *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MADServiceURLVideoAsset;
  v13 = -[MADServiceVideoAsset initWithClientBundleID:clientTeamID:](&v16, sel_initWithClientBundleID_clientTeamID_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v14->_identifier, a4);
  }

  return v14;
}

- (unint64_t)assetType
{
  return 5;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)url
{
  return self->_url;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime
{
  void *v5;
  void *v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  v5 = (void *)MEMORY[0x1BCCA1B2C](self, a3);
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", self->_url);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "vcp_livePhotoStillDisplayTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
