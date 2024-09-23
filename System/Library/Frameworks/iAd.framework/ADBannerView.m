@implementation ADBannerView

+ (CGSize)sizeFromBannerContentSizeIdentifier:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (ADBannerView)initWithAdType:(int64_t)a3
{

  return 0;
}

- (int64_t)adType
{
  return self->_adType;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)isBannerLoaded
{
  return self->_bannerLoaded;
}

- (BOOL)isBannerViewActionInProgress
{
  return self->_bannerViewActionInProgress;
}

- (id)advertisingSection
{
  return self->_advertisingSection;
}

- (void)setAdvertisingSection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (id)requiredContentSizeIdentifiers
{
  return self->_requiredContentSizeIdentifiers;
}

- (void)setRequiredContentSizeIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (id)currentContentSizeIdentifier
{
  return self->_currentContentSizeIdentifier;
}

- (void)setCurrentContentSizeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentContentSizeIdentifier, 0);
  objc_storeStrong(&self->_requiredContentSizeIdentifiers, 0);
  objc_storeStrong(&self->_advertisingSection, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
