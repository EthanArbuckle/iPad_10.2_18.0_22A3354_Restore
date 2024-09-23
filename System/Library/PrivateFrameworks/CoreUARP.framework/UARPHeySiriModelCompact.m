@implementation UARPHeySiriModelCompact

- (UARPHeySiriModelCompact)init
{
  -[UARPHeySiriModelCompact doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  _BOOL4 v4;
  char **v5;
  objc_super *v6;
  UARPHeySiriModelCompact *v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UARPHeySiriModelCompact;
  v4 = -[UARPHeySiriModelBase processDynamicAsset:](&v11, sel_processDynamicAsset_, a3);
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)UARPHeySiriModelCompact;
    -[UARPHeySiriModelBase setDelegate:](&v10, sel_setDelegate_, self);
    if ((-[UARPHeySiriModelBase engineType](self, "engineType") & 2) != 0)
    {
      v9.receiver = self;
      v5 = &selRef_checkCurrentJustSiriModel;
      v6 = &v9;
    }
    else
    {
      v8 = self;
      v5 = &selRef_checkCurrentHeySiriModel;
      v6 = (objc_super *)&v8;
    }
    v6->super_class = (Class)UARPHeySiriModelCompact;
    objc_msgSendSuper2(v6, *v5, v8);
  }
  return v4;
}

- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UARPAssetVersion *v12;
  objc_super v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[UARPHeySiriModelCompact tag](UARPHeySiriModelCompact, "tag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", 0, 0, 0, 0);
  v13.receiver = self;
  v13.super_class = (Class)UARPHeySiriModelCompact;
  -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:](&v13, sel_offerDownloadModel_fallbackModel_tag_assetVersion_error_, v10, v9, v11, v12, v8);

}

- (id)generateAsset:(id *)a3
{
  return 0;
}

+ (id)tag
{
  char *v2;

  v2 = (char *)uarpAssetTagStructHeySiriModel();
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v2, v2[1], v2[2], v2[3]);
}

@end
