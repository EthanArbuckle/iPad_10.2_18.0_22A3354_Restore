@implementation NTKGreenfieldEncodedRecipe

- (NTKGreenfieldEncodedRecipe)initWithWatchFaceDataUrl:(id)a3 watchFaceImage:(id)a4 watchFaceName:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKGreenfieldEncodedRecipe *v12;
  NTKGreenfieldEncodedRecipe *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldEncodedRecipe;
  v12 = -[NTKGreenfieldEncodedRecipe init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_watchFaceDataUrl, a3);
    objc_storeStrong((id *)&v13->_watchFaceImage, a4);
    objc_storeStrong((id *)&v13->_watchFaceName, a5);
  }

  return v13;
}

- (NSURL)watchFaceDataUrl
{
  return self->_watchFaceDataUrl;
}

- (void)setWatchFaceDataUrl:(id)a3
{
  objc_storeStrong((id *)&self->_watchFaceDataUrl, a3);
}

- (UIImage)watchFaceImage
{
  return self->_watchFaceImage;
}

- (void)setWatchFaceImage:(id)a3
{
  objc_storeStrong((id *)&self->_watchFaceImage, a3);
}

- (NSString)watchFaceName
{
  return self->_watchFaceName;
}

- (void)setWatchFaceName:(id)a3
{
  objc_storeStrong((id *)&self->_watchFaceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchFaceName, 0);
  objc_storeStrong((id *)&self->_watchFaceImage, 0);
  objc_storeStrong((id *)&self->_watchFaceDataUrl, 0);
}

@end
