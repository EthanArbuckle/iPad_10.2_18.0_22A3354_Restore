@implementation _MKCompassDirectionImageKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headingString, 0);
}

- (unint64_t)hash
{
  unint64_t width;

  width = (unint64_t)self->_size.width;
  return width + -[NSString characterAtIndex:](self->_headingString, "characterAtIndex:", 0) + self->_compassViewStyle;
}

- (_MKCompassDirectionImageKey)initWithSize:(CGSize)a3 headingString:(id)a4 compassViewStyle:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  _MKCompassDirectionImageKey *v11;
  _MKCompassDirectionImageKey *v12;
  _MKCompassDirectionImageKey *v13;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MKCompassDirectionImageKey;
  v11 = -[_MKCompassDirectionImageKey init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_size.width = width;
    v11->_size.height = height;
    objc_storeStrong((id *)&v11->_headingString, a4);
    v12->_compassViewStyle = a5;
    v13 = v12;
  }

  return v12;
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

- (BOOL)isEqual:(id)a3
{
  _MKCompassDirectionImageKey *v4;
  _MKCompassDirectionImageKey *v5;
  NSString *headingString;
  void *v7;
  double v8;
  BOOL v9;
  double v10;
  int64_t compassViewStyle;

  v4 = (_MKCompassDirectionImageKey *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      headingString = self->_headingString;
      -[_MKCompassDirectionImageKey headingString](v5, "headingString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](headingString, "isEqual:", v7))
      {
        -[_MKCompassDirectionImageKey size](v5, "size");
        v9 = 0;
        if (self->_size.width == v10 && self->_size.height == v8)
        {
          compassViewStyle = self->_compassViewStyle;
          v9 = compassViewStyle == -[_MKCompassDirectionImageKey compassViewStyle](v5, "compassViewStyle");
        }
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)headingString
{
  return self->_headingString;
}

- (int64_t)compassViewStyle
{
  return self->_compassViewStyle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSize:headingString:compassViewStyle:", self->_headingString, self->_compassViewStyle, self->_size.width, self->_size.height);
}

@end
