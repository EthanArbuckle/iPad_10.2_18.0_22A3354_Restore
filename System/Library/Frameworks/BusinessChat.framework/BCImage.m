@implementation BCImage

- (BCImage)initWithImageData:(id)a3 identifier:(id)a4 description:(id)a5
{
  id v9;
  id v10;
  id v11;
  BCImage *v12;
  BCImage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCImage;
  v12 = -[BCImage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageData, a3);
    objc_storeStrong((id *)&v13->_imageDescription, a5);
    objc_storeStrong((id *)&v13->_identifier, a4);
  }

  return v13;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_imageData, CFSTR("data"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_imageDescription, CFSTR("description"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (UIImage)image
{
  return (UIImage *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", self->_imageData);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
