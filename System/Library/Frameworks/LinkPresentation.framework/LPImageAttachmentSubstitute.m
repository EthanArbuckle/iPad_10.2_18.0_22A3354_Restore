@implementation LPImageAttachmentSubstitute

- (LPImageAttachmentSubstitute)initWithImage:(id)a3
{
  LPImageAttachmentSubstitute *v3;
  LPImageAttachmentSubstitute *v4;
  LPImageAttachmentSubstitute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPImageAttachmentSubstitute;
  v3 = -[LPImage _initWithImage:](&v7, sel__initWithImage_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (LPImageAttachmentSubstitute)initWithCoder:(id)a3
{
  id v4;
  LPImageAttachmentSubstitute *v5;
  LPImageAttachmentSubstitute *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPImageAttachmentSubstitute;
  v5 = -[LPImage initWithCoder:](&v8, sel_initWithCoder_, v4);
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

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPImageAttachmentSubstitute;
  -[LPImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_index, CFSTR("richLinkImageAttachmentSubstituteIndex"));

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
