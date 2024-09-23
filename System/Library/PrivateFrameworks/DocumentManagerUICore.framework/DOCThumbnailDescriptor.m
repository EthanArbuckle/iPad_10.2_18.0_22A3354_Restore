@implementation DOCThumbnailDescriptor

- (unint64_t)hash
{
  double v2;
  unint64_t v3;

  v2 = (double)(31
              * (unint64_t)(self->_minimumSize
                                 + (double)(31
                                          * (unint64_t)(self->_size.height
                                                             + (double)(31 * (unint64_t)self->_size.width)))))
     + self->_scale * 100.0;
  v3 = 100 * self->_style - (unint64_t)v2 + 32 * (unint64_t)v2;
  return 100 * self->_interactive - v3 + 32 * v3;
}

- (DOCThumbnailDescriptor)initWithSize:(CGSize)a3 minimumSize:(double)a4 scale:(double)a5 style:(unint64_t)a6 isFolded:(BOOL)a7 isInteractive:(BOOL)a8 isFolder:(BOOL)a9
{
  _BOOL4 v9;
  CGFloat height;
  CGFloat width;
  DOCThumbnailDescriptor *result;
  unint64_t v18;
  objc_super v19;

  v9 = a9;
  height = a3.height;
  width = a3.width;
  v19.receiver = self;
  v19.super_class = (Class)DOCThumbnailDescriptor;
  result = -[DOCThumbnailDescriptor init](&v19, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_minimumSize = a4;
    result->_scale = a5;
    result->_folded = a7;
    result->_interactive = a8;
    if (v9)
      v18 = a6;
    else
      v18 = 1;
    result->_style = v18;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  DOCThumbnailDescriptor *v4;
  BOOL v5;
  BOOL v6;

  v4 = (DOCThumbnailDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0
      && (self->_size.width == v4->_size.width ? (v5 = self->_size.height == v4->_size.height) : (v5 = 0),
          v5
       && self->_minimumSize == v4->_minimumSize
       && self->_scale == v4->_scale
       && self->_style == v4->_style
       && self->_folded == v4->_folded)
      && self->_interactive == v4->_interactive;
  }

  return v6;
}

- (unint64_t)style
{
  return self->_style;
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

- (double)scale
{
  return self->_scale;
}

- (double)minimumSize
{
  return self->_minimumSize;
}

- (BOOL)isFolded
{
  return self->_folded;
}

- (DOCThumbnailDescriptor)initWithSize:(CGSize)a3 scale:(double)a4 style:(unint64_t)a5 isFolded:(BOOL)a6 isInteractive:(BOOL)a7 isFolder:(BOOL)a8
{
  return -[DOCThumbnailDescriptor initWithSize:minimumSize:scale:style:isFolded:isInteractive:isFolder:](self, "initWithSize:minimumSize:scale:style:isFolded:isInteractive:isFolder:", a5, a6, a7, a8, a3.width, a3.height, 0.0, a4);
}

- (DOCThumbnailDescriptor)initWithScale:(double)a3 style:(unint64_t)a4 isFolded:(BOOL)a5 isInteractive:(BOOL)a6 isFolder:(BOOL)a7
{
  return -[DOCThumbnailDescriptor initWithSize:scale:style:isFolded:isInteractive:isFolder:](self, "initWithSize:scale:style:isFolded:isInteractive:isFolder:", a4, a5, a6, a7, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)DOCThumbnailDescriptor;
  -[DOCThumbnailDescriptor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_size);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ size=%@, minimumSize=%f, scale=%f, style=%lu, folded=%d, interactive=%d"), v4, v5, *(_QWORD *)&self->_minimumSize, *(_QWORD *)&self->_scale, self->_style, self->_folded, self->_interactive);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

@end
