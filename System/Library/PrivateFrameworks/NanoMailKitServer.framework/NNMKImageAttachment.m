@implementation NNMKImageAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKImageAttachment)initWithCoder:(id)a3
{
  id v4;
  NNMKImageAttachment *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NNMKImageAttachment;
  v5 = -[NNMKAttachment initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyRenderOnClient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_renderOnClient = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyImageSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGSizeValue");
    v5->_imageSize.width = v8;
    v5->_imageSize.height = v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NNMKImageAttachment;
  v4 = a3;
  -[NNMKAttachment encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_renderOnClient, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kNSCodingKeyRenderOnClient"));

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", self->_imageSize.width, self->_imageSize.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeyImageSize"));

}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL8 renderOnClient;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NNMKImageAttachment;
  -[NNMKAttachment description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  renderOnClient = self->_renderOnClient;
  NSStringFromCGSize(self->_imageSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", Render On Client: %d, Size: %@"), renderOnClient, v6);

  return v4;
}

- (BOOL)renderOnClient
{
  return self->_renderOnClient;
}

- (void)setRenderOnClient:(BOOL)a3
{
  self->_renderOnClient = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

@end
