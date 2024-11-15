@implementation _NTKPickedPhoto

- (NTKPhoto)photo
{
  return self->_photo;
}

- (void)setPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_photo, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (unint64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (void)setSubsampleFactor:(unint64_t)a3
{
  self->_subsampleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_photo, 0);
}

@end
