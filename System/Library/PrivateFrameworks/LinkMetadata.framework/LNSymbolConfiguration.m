@implementation LNSymbolConfiguration

- (LNSymbolConfiguration)initWithPointSize:(double)a3 scale:(int64_t)a4 weight:(int64_t)a5
{
  LNSymbolConfiguration *v8;
  LNSymbolConfiguration *v9;
  LNSymbolConfiguration *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LNSymbolConfiguration;
  v8 = -[LNSymbolConfiguration init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_pointSize = a3;
    v8->_scale = a4;
    v8->_weight = a5;
    v10 = v8;
  }

  return v9;
}

- (LNSymbolConfiguration)initWithCoder:(id)a3
{
  id v4;
  float v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pointSize"));
  v6 = v5;
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scale"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weight"));

  return -[LNSymbolConfiguration initWithPointSize:scale:weight:](self, "initWithPointSize:scale:weight:", v7, v8, v6);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[LNSymbolConfiguration pointSize](self, "pointSize");
  *(float *)&v4 = v4;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("pointSize"), v4);
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSymbolConfiguration scale](self, "scale"), CFSTR("scale"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSymbolConfiguration weight](self, "weight"), CFSTR("weight"));

}

- (double)pointSize
{
  return self->_pointSize;
}

- (int64_t)scale
{
  return self->_scale;
}

- (int64_t)weight
{
  return self->_weight;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
