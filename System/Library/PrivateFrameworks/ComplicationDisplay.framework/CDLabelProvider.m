@implementation CDLabelProvider

- (CDLabelProvider)initWithTextProvider:(id)a3 imageProvider:(id)a4
{
  id v7;
  id v8;
  CDLabelProvider *v9;
  CDLabelProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDLabelProvider;
  v9 = -[CDLabelProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textProvider, a3);
    objc_storeStrong((id *)&v10->_imageProvider, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CLKTextProvider *textProvider;
  id v5;

  textProvider = self->_textProvider;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", textProvider, CFSTR("textProvider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageProvider, CFSTR("imageProvider"));

}

- (CDLabelProvider)initWithCoder:(id)a3
{
  id v4;
  CDLabelProvider *v5;
  uint64_t v6;
  CLKTextProvider *textProvider;
  uint64_t v8;
  CLKImageProvider *imageProvider;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDLabelProvider;
  v5 = -[CDLabelProvider init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textProvider"));
    v6 = objc_claimAutoreleasedReturnValue();
    textProvider = v5->_textProvider;
    v5->_textProvider = (CLKTextProvider *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageProvider"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageProvider = v5->_imageProvider;
    v5->_imageProvider = (CLKImageProvider *)v8;

  }
  return v5;
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
