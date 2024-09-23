@implementation PHImageResourceChooserRequestInfo

- (PHImageRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredSize.width;
  height = self->_desiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)allowedResourceVersions
{
  return self->_allowedResourceVersions;
}

- (double)fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable
{
  return self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable;
}

- (PHResourceChooserAsset)asset
{
  return self->_asset;
}

- (float)requestedScale
{
  return self->_requestedScale;
}

- (PHImageResourceChooserRequestInfo)initWithAsset:(id)a3 desiredSize:(CGSize)a4 requestedScale:(float)a5 allowedResourceVersions:(id)a6 behaviorSpec:(id)a7 cloudSharedMode:(BOOL)a8 fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:(double)a9 loggingPrefix:(id)a10
{
  CGFloat height;
  CGFloat width;
  id v20;
  id v21;
  id v22;
  id v23;
  PHImageResourceChooserRequestInfo *v24;
  PHImageResourceChooserRequestInfo *v25;
  objc_super v27;

  height = a4.height;
  width = a4.width;
  v20 = a3;
  v21 = a6;
  v22 = a7;
  v23 = a10;
  v27.receiver = self;
  v27.super_class = (Class)PHImageResourceChooserRequestInfo;
  v24 = -[PHImageResourceChooserRequestInfo init](&v27, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_asset, a3);
    v25->_desiredSize.width = width;
    v25->_desiredSize.height = height;
    v25->_requestedScale = a5;
    objc_storeStrong((id *)&v25->_allowedResourceVersions, a6);
    objc_storeStrong((id *)&v25->_behaviorSpec, a7);
    v25->_isCloudShared = a8;
    v25->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable = a9;
    objc_storeStrong((id *)&v25->_loggingPrefix, a10);
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_allowedResourceVersions, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (BOOL)isCloudShared
{
  return self->_isCloudShared;
}

- (NSString)loggingPrefix
{
  return self->_loggingPrefix;
}

- (void)setLoggingPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
