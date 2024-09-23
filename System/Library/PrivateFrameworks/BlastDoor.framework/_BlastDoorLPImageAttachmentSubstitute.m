@implementation _BlastDoorLPImageAttachmentSubstitute

- (_BlastDoorLPImageAttachmentSubstitute)initWithImage:(id)a3
{
  _BlastDoorLPImageAttachmentSubstitute *v3;
  _BlastDoorLPImageAttachmentSubstitute *v4;
  _BlastDoorLPImageAttachmentSubstitute *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPImageAttachmentSubstitute;
  v3 = -[_BlastDoorLPImage _initWithImage:](&v7, sel__initWithImage_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (_BlastDoorLPImageAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPImageAttachmentSubstitute *v5;
  _BlastDoorLPImageAttachmentSubstitute *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPImageAttachmentSubstitute;
  v5 = -[_BlastDoorLPImage initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("richLinkImageAttachmentSubstituteIndex"));
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
  v5.super_class = (Class)_BlastDoorLPImageAttachmentSubstitute;
  v4 = a3;
  -[_BlastDoorLPImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_index, CFSTR("richLinkImageAttachmentSubstituteIndex"));

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
