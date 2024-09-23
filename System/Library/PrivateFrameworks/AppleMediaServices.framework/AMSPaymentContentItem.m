@implementation AMSPaymentContentItem

- (AMSPaymentContentItem)initWithCoder:(id)a3
{
  id v4;
  AMSPaymentContentItem *v5;
  uint64_t v6;
  NSAttributedString *title;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSAttributedString *label;
  uint64_t v13;
  NSString *accessibilityIdentifier;
  const __CFData *v15;
  const __CFData *v16;
  CGImageSource *v17;
  CGImageSource *v18;
  CGImageRef ImageAtIndex;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AMSPaymentContentItem;
  v5 = -[AMSPaymentContentItem init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSAttributedString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("label"));
    v11 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSAttributedString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessiblityIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    accessibilityIdentifier = v5->_accessibilityIdentifier;
    v5->_accessibilityIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && -[__CFData length](v15, "length") && (v17 = CGImageSourceCreateWithData(v16, 0)) != 0)
    {
      v18 = v17;
      if (CGImageSourceGetCount(v17))
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v18, 0, 0);
      else
        ImageAtIndex = 0;
      CFRelease(v18);
    }
    else
    {
      ImageAtIndex = 0;
    }
    v5->_image = ImageAtIndex;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accessibilityIdentifier;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_label, CFSTR("label"));
  accessibilityIdentifier = self->_accessibilityIdentifier;
  if (accessibilityIdentifier)
    objc_msgSend(v6, "encodeObject:forKey:", accessibilityIdentifier, CFSTR("accessiblityIdentifier"));
  if (self->_image)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCGImage:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("image"));

  }
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)AMSPaymentContentItem;
  -[AMSPaymentContentItem dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImage:(CGImage *)a3
{
  CGImage *image;

  image = self->_image;
  if (image != a3)
  {
    CGImageRelease(image);
    self->_image = CGImageRetain(a3);
  }
}

- (CGImage)image
{
  return self->_image;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSAttributedString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
