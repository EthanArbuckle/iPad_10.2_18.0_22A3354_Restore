@implementation AVMobileImageConfiguration

- (id)imageName
{
  return self->_string;
}

- (BOOL)imageContainedInBundle
{
  return self->_imageContainedInBundle;
}

- (UIFont)font
{
  return self->_font;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_string, "hash");
  return -[UIFont hash](self->_font, "hash") ^ v3 ^ self->_imageContainedInBundle;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  _QWORD *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVMobileImageConfiguration;
  v5 = -[AVMobileImageConfiguration isEqual:](&v8, sel_isEqual_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v5 = -[NSString isEqualToString:](self->_string, "isEqualToString:", v6[2])
      && -[UIFont isEqual:](self->_font, "isEqual:", v6[3])
      && self->_imageContainedInBundle == *((unsigned __int8 *)v6 + 8);

  }
  return v5;
}

- (AVMobileImageConfiguration)initWithImageName:(id)a3 font:(id)a4 imageContainedInBundle:(BOOL)a5
{
  id v8;
  id v9;
  AVMobileImageConfiguration *v10;
  uint64_t v11;
  NSString *string;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVMobileImageConfiguration;
  v10 = -[AVMobileImageConfiguration init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    string = v10->_string;
    v10->_string = (NSString *)v11;

    objc_storeStrong((id *)&v10->_font, a4);
    v10->_imageContainedInBundle = a5;
  }

  return v10;
}

- (AVMobileImageConfiguration)initWithString:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  AVMobileImageConfiguration *v8;
  uint64_t v9;
  NSString *string;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVMobileImageConfiguration;
  v8 = -[AVMobileImageConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    string = v8->_string;
    v8->_string = (NSString *)v9;

    objc_storeStrong((id *)&v8->_font, a4);
    v8->_imageContainedInBundle = 0;
  }

  return v8;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
