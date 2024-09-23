@implementation IFImageSpecification

- (IFImageSpecification)initWithSize:(CGSize)a3 scale:(double)a4 tags:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  IFImageSpecification *v10;
  IFImageSpecification *v11;
  uint64_t v12;
  NSSet *tags;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IFImageSpecification;
  v10 = -[IFImageSpecification init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_size.width = width;
    v10->_size.height = height;
    v10->_scale = a4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    tags = v11->_tags;
    v11->_tags = (NSSet *)v12;

  }
  return v11;
}

- (double)scale
{
  return self->_scale;
}

- (double)dimension
{
  double v3;
  double v4;
  double v5;
  double v6;
  double result;
  double v8;

  -[IFImageSpecification size](self, "size");
  v4 = v3;
  -[IFImageSpecification size](self, "size");
  v6 = v5;
  -[IFImageSpecification size](self, "size");
  if (v4 >= v6)
    return v8;
  return result;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSmallerSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_smallerSpecification, a3);
}

- (void)setLargerSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_largerSpecification, a3);
}

- (IFImageSpecification)largerSpecification
{
  return self->_largerSpecification;
}

- (IFImageSpecification)smallerSpecification
{
  return self->_smallerSpecification;
}

- (BOOL)isEqualToImageSpecification:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  -[IFImageSpecification size](self, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "size");
  if (v6 == v10 && v8 == v9)
  {
    -[IFImageSpecification scale](self, "scale");
    v14 = v13;
    objc_msgSend(v4, "scale");
    v12 = v14 == v15;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  IFImageSpecification *v4;
  BOOL v5;
  objc_super v7;

  v4 = (IFImageSpecification *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)IFImageSpecification;
    v5 = -[IFImageSpecification isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IFImageSpecification isEqualToImageSpecification:](self, "isEqualToImageSpecification:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size.width);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scale);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  IFImageSpecification *smallerSpecification;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  IFImageSpecification *largerSpecification;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;

  smallerSpecification = self->_smallerSpecification;
  if (smallerSpecification)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[IFImageSpecification dimension](smallerSpecification, "dimension");
    v6 = v5;
    -[IFImageSpecification scale](self->_smallerSpecification, "scale");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("smaller: %.1lf@%.0lfx"), v6, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E97698A0;
  }
  largerSpecification = self->_largerSpecification;
  if (largerSpecification)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[IFImageSpecification dimension](largerSpecification, "dimension");
    v12 = v11;
    -[IFImageSpecification scale](self->_largerSpecification, "scale");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("larger: %.1lf@%.0lfx"), v12, v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E97698A0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image {%.1lf,%.1lf} @%.0lfx %@ %@"), *(_QWORD *)&self->_size.width, *(_QWORD *)&self->_size.height, *(_QWORD *)&self->_scale, v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CGSize)pixelSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[IFImageSpecification size](self, "size");
  v4 = v3;
  v6 = v5;
  -[IFImageSpecification scale](self, "scale");
  v8 = v6 * v7;
  v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)pixelsSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_pixelsSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSSet)tags
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largerSpecification, 0);
  objc_storeStrong((id *)&self->_smallerSpecification, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

- (CGSize)minimumSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[IFImageSpecification smallerSpecification](self, "smallerSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;
  -[IFImageSpecification scale](self, "scale");
  v7 = v6;

  if (v5 == v7)
  {
    -[IFImageSpecification smallerSpecification](self, "smallerSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;

    v13 = v10 + 1.0;
    v14 = v12 + 1.0;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v14;
  result.width = v13;
  return result;
}

@end
