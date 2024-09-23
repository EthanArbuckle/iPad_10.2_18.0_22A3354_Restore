@implementation _BlastDoorLPARAssetAttachmentSubstitute

- (_BlastDoorLPARAssetAttachmentSubstitute)initWithARAsset:(id)a3
{
  _BlastDoorLPARAssetAttachmentSubstitute *v3;
  _BlastDoorLPARAssetAttachmentSubstitute *v4;
  _BlastDoorLPARAssetAttachmentSubstitute *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPARAssetAttachmentSubstitute;
  v3 = -[_BlastDoorLPARAsset _initWithARAsset:](&v7, sel__initWithARAsset_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (_BlastDoorLPARAssetAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPARAssetAttachmentSubstitute *v5;
  _BlastDoorLPARAssetAttachmentSubstitute *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPARAssetAttachmentSubstitute;
  v5 = -[_BlastDoorLPARAsset initWithCoder:](&v8, sel_initWithCoder_, v4);
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
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_BlastDoorLPARAssetAttachmentSubstitute;
  v4 = a3;
  -[_BlastDoorLPARAsset encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_index, CFSTR("richLinkARAssetAttachmentSubstituteIndex"));

}

- (BOOL)_shouldEncodeData
{
  return 0;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
