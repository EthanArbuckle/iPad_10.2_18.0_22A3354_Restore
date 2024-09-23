@implementation CAFMediaItemImage

- (CAFMediaItemImage)initWithDictionary:(id)a3
{
  id v4;
  CAFMediaItemImage *v5;
  id v6;
  NSString *v7;
  NSString *identifier;
  id v9;
  NSData *v10;
  NSData *imageData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAFMediaItemImage;
  v5 = -[CAFMediaItemImage init](&v13, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSString *)v6;
    else
      v7 = 0;

    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("imageData"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
      v10 = (NSData *)v9;
    else
      v10 = 0;

    imageData = v5->_imageData;
    v5->_imageData = v10;

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("identifier");
  -[CAFMediaItemImage identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("imageData");
  v10[0] = v4;
  -[CAFMediaItemImage imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return (NSDictionary *)v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFMediaItemImage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMediaItemImage imageData](self, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@: %@, %@: %@ }>"), v4, self, CFSTR("identifier"), v5, CFSTR("imageData"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
