@implementation PHASESoundAsset

- (PHASESoundAsset)init
{
  -[PHASESoundAsset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESoundAsset)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESoundAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  -[PHASESoundAsset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (PHASESoundAsset)initWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 normalizationMode:(int64_t)a6 soundAssetInfo:()unique_ptr<Phase:(std:(id)a8 :default_delete<Phase::Controller::SoundAssetInfo>>)a7 :Controller::SoundAssetInfo assetRegistry:
{
  id v15;
  PHASESoundAsset *v16;
  PHASESoundAsset *v17;
  NSData *data;
  void **var0;
  SoundAssetInfo *value;
  objc_super v22;

  v15 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PHASESoundAsset;
  v16 = -[PHASEAsset initWithUID:assetRegistry:](&v22, sel_initWithUID_assetRegistry_, a4, a8);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_url, a3);
    data = v17->_data;
    v17->_data = 0;

    v17->_type = a5;
    v17->_normalizationMode = a6;
    var0 = a7.__ptr_.__value_->var0;
    a7.__ptr_.__value_->var0 = 0;
    value = v17->_soundAssetInfo.__ptr_.__value_;
    v17->_soundAssetInfo.__ptr_.__value_ = (SoundAssetInfo *)var0;
    if (value)
      (*((void (**)(SoundAssetInfo *))value->var0 + 1))(value);
  }

  return v17;
}

- (PHASESoundAsset)initWithData:(id)a3 uid:(id)a4 normalizationMode:(int64_t)a5 soundAssetInfo:()unique_ptr<Phase:(std:(id)a7 :default_delete<Phase::Controller::SoundAssetInfo>>)a6 :Controller::SoundAssetInfo assetRegistry:
{
  id v13;
  PHASESoundAsset *v14;
  PHASESoundAsset *v15;
  NSURL *url;
  void **var0;
  SoundAssetInfo *value;
  objc_super v20;

  v13 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PHASESoundAsset;
  v14 = -[PHASEAsset initWithUID:assetRegistry:](&v20, sel_initWithUID_assetRegistry_, a4, a7);
  v15 = v14;
  if (v14)
  {
    url = v14->_url;
    v14->_url = 0;

    objc_storeStrong((id *)&v15->_data, a3);
    v15->_type = 0;
    v15->_normalizationMode = a5;
    var0 = a6.__ptr_.__value_->var0;
    a6.__ptr_.__value_->var0 = 0;
    value = v15->_soundAssetInfo.__ptr_.__value_;
    v15->_soundAssetInfo.__ptr_.__value_ = (SoundAssetInfo *)var0;
    if (value)
      (*((void (**)(SoundAssetInfo *))value->var0 + 1))(value);
  }

  return v15;
}

- (SoundAssetInfo)getAssetInfo
{
  return self->_soundAssetInfo.__ptr_.__value_;
}

- (unint64_t)sizeInBytes
{
  return (*((uint64_t (**)(SoundAssetInfo *))self->_soundAssetInfo.__ptr_.__value_->var0 + 4))(self->_soundAssetInfo.__ptr_.__value_);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (PHASEAssetType)type
{
  return self->_type;
}

- (int64_t)normalizationMode
{
  return self->_normalizationMode;
}

- (void).cxx_destruct
{
  SoundAssetInfo *value;

  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_owningDataBundleIdentifer, 0);
  value = self->_soundAssetInfo.__ptr_.__value_;
  self->_soundAssetInfo.__ptr_.__value_ = 0;
  if (value)
    (*((void (**)(SoundAssetInfo *))value->var0 + 1))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
