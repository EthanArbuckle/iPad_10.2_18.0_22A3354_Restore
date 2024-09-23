@implementation LPVideoAttachmentSubstitute

- (LPVideoAttachmentSubstitute)initWithVideo:(id)a3
{
  LPVideoAttachmentSubstitute *v3;
  LPVideoAttachmentSubstitute *v4;
  LPVideoAttachmentSubstitute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPVideoAttachmentSubstitute;
  v3 = -[LPVideo _initWithVideo:](&v7, sel__initWithVideo_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (LPVideoAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4;
  LPVideoAttachmentSubstitute *v5;
  LPVideoAttachmentSubstitute *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPVideoAttachmentSubstitute;
  v5 = -[LPVideo initWithCoder:](&v8, sel_initWithCoder_, v4);
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

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPVideoAttachmentSubstitute;
  -[LPVideo encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_index, CFSTR("richLinkVideoAttachmentSubstituteIndex"));

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
