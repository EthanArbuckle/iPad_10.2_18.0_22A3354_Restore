@implementation LPARAssetAttachmentSubstitute

- (LPARAssetAttachmentSubstitute)initWithARAsset:(id)a3
{
  LPARAssetAttachmentSubstitute *v3;
  LPARAssetAttachmentSubstitute *v4;
  LPARAssetAttachmentSubstitute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPARAssetAttachmentSubstitute;
  v3 = -[LPARAsset _initWithARAsset:](&v7, sel__initWithARAsset_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (LPARAssetAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4;
  LPARAssetAttachmentSubstitute *v5;
  LPARAssetAttachmentSubstitute *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPARAssetAttachmentSubstitute;
  v5 = -[LPARAsset initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("richLinkARAssetAttachmentSubstituteIndex"));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPARAssetAttachmentSubstitute;
  -[LPARAsset encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_index, CFSTR("richLinkARAssetAttachmentSubstituteIndex"));

}

- (BOOL)_isSubstitute
{
  return 1;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

@end
