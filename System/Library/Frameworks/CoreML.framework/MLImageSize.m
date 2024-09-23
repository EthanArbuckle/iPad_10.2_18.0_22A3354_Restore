@implementation MLImageSize

- (MLImageSize)initWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4
{
  MLImageSize *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLImageSize;
  result = -[MLImageSize init](&v7, sel_init);
  if (result)
  {
    result->_pixelsWide = a3;
    result->_pixelsHigh = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_pixelsHigh
       + (self->_pixelsWide
        + self->_pixelsHigh
        + (self->_pixelsWide + self->_pixelsHigh) * (self->_pixelsWide + self->_pixelsHigh))
       / 2;
}

- (BOOL)isEqualToImageSize:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "pixelsWide") == self->_pixelsWide && objc_msgSend(v4, "pixelsHigh") == self->_pixelsHigh;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MLImageSize *v4;
  BOOL v5;

  v4 = (MLImageSize *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MLImageSize isEqualToImageSize:](self, "isEqualToImageSize:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_pixelsWide);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_pixelsHigh);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ x %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageSize pixelsWide](self, "pixelsWide"), CFSTR("pixelsWide"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageSize pixelsHigh](self, "pixelsHigh"), CFSTR("pixelsHigh"));

}

- (MLImageSize)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelsWide"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelsHigh"));

  return -[MLImageSize initWithPixelsWide:pixelsHigh:](self, "initWithPixelsWide:pixelsHigh:", v5, v6);
}

- (NSInteger)pixelsWide
{
  return self->_pixelsWide;
}

- (NSInteger)pixelsHigh
{
  return self->_pixelsHigh;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
