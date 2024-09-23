@implementation _PHCropInfo

- (_PHCropInfo)initWithAsset:(id)a3 cropScore:(double)a4
{
  id v7;
  _PHCropInfo *v8;
  _PHCropInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PHCropInfo;
  v8 = -[_PHCropInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_asset, a3);
    v9->_cropScore = a4;
  }

  return v9;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
