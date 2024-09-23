@implementation MOSuggestionAssetPhotoCropRect

- (MOSuggestionAssetPhotoCropRect)initWithCGRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MOSuggestionAssetPhotoCropRect *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)MOSuggestionAssetPhotoCropRect;
  result = -[MOSuggestionAssetPhotoCropRect init](&v8, sel_init);
  if (result)
  {
    result->_x = x;
    result->_y = y;
    result->_width = width;
    result->_height = height;
  }
  return result;
}

- (CGRect)cgRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_x;
  y = self->_y;
  width = self->_width;
  height = self->_height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)aspectRatio
{
  double height;
  double result;

  height = self->_height;
  result = 0.0;
  if (height > 0.0)
    return self->_width / height;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  id v5;

  x = self->_x;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kCoderKeyPhotoCropRectX"), x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kCoderKeyPhotoCropRectY"), self->_y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kCoderKeyPhotoCropRectWidth"), self->_width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kCoderKeyPhotoCropRectHeight"), self->_height);

}

- (MOSuggestionAssetPhotoCropRect)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetPhotoCropRect *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOSuggestionAssetPhotoCropRect;
  v5 = -[MOSuggestionAssetPhotoCropRect init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCoderKeyPhotoCropRectX"));
    v5->_x = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCoderKeyPhotoCropRectY"));
    v5->_y = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCoderKeyPhotoCropRectWidth"));
    v5->_width = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCoderKeyPhotoCropRectHeight"));
    v5->_height = v9;
  }

  return v5;
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

@end
