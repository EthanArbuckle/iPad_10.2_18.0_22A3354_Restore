@implementation MADServiceVideoAsset

- (MADServiceVideoAsset)initWithClientBundleID:(id)a3 clientTeamID:(id)a4
{
  id v7;
  id v8;
  MADServiceVideoAsset *v9;
  MADServiceVideoAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADServiceVideoAsset;
  v9 = -[MADServiceVideoAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientBundleID, a3);
    objc_storeStrong((id *)&v10->_clientTeamID, a4);
  }

  return v10;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)trimTimeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (NSDictionary)scoresForLabels
{
  return 0;
}

- (NSNumber)isSensitive
{
  return 0;
}

+ (MADServiceVideoAsset)assetWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MADServiceURLVideoAsset *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[MADServiceURLVideoAsset initWithURL:identifier:clientBundleID:clientTeamID:]([MADServiceURLVideoAsset alloc], "initWithURL:identifier:clientBundleID:clientTeamID:", v12, v11, v10, v9);

  return (MADServiceVideoAsset *)v13;
}

+ (MADServiceVideoAsset)assetWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v7;
  id v8;
  id v9;
  MADServicePhotosVideoAsset *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MADServicePhotosVideoAsset initWithPhotosAsset:clientBundleID:clientTeamID:]([MADServicePhotosVideoAsset alloc], "initWithPhotosAsset:clientBundleID:clientTeamID:", v9, v8, v7);

  return (MADServiceVideoAsset *)v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientTeamID
{
  return self->_clientTeamID;
}

- (NSURL)url
{
  return self->_url;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (BOOL)userSafetyEligible
{
  return self->_userSafetyEligible;
}

- (void)setUserSafetyEligible:(BOOL)a3
{
  self->_userSafetyEligible = a3;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
