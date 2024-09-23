@implementation DAAsset

- (DAAsset)initWithDictionary:(id)a3
{
  id v4;
  DAAsset *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  objc_super v20;
  char v21;

  v4 = a3;
  v21 = 0;
  v20.receiver = self;
  v20.super_class = (Class)DAAsset;
  v5 = -[DASpecification initWithDictionary:](&v20, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("name"), 100, &v21));
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("frameHeight"), &off_100011290, &off_1000112A0, &v21));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("frameWidth"), &off_100011290, &off_1000112A0, &v21));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v14, "scale");
    v16 = v13 * v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v17, "scale");
    v5->_size.width = v16;
    v5->_size.height = v10 * v18;

    if (v21)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
