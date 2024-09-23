@implementation _BlastDoorLPVideoAttachmentSubstitute

- (_BlastDoorLPVideoAttachmentSubstitute)initWithVideo:(id)a3
{
  _BlastDoorLPVideoAttachmentSubstitute *v3;
  _BlastDoorLPVideoAttachmentSubstitute *v4;
  _BlastDoorLPVideoAttachmentSubstitute *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPVideoAttachmentSubstitute;
  v3 = -[_BlastDoorLPVideo _initWithVideo:](&v7, sel__initWithVideo_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (_BlastDoorLPVideoAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPVideoAttachmentSubstitute *v5;
  _BlastDoorLPVideoAttachmentSubstitute *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPVideoAttachmentSubstitute;
  v5 = -[_BlastDoorLPVideo initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("richLinkVideoAttachmentSubstituteIndex"));
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
  v5.super_class = (Class)_BlastDoorLPVideoAttachmentSubstitute;
  v4 = a3;
  -[_BlastDoorLPVideo encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_index, CFSTR("richLinkVideoAttachmentSubstituteIndex"));

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
