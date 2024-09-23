@implementation CertInfoDescriptionCellContentView

- (void)dealloc
{
  CGSize *sizes;
  objc_super v4;

  sizes = self->_sizes;
  if (sizes)
    free(sizes);
  v4.receiver = self;
  v4.super_class = (Class)CertInfoDescriptionCellContentView;
  -[CertInfoDescriptionCellContentView dealloc](&v4, sel_dealloc);
}

- (id)_labelFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 13.0);
}

- (id)_valueFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
}

- (void)_recalculateIdealHeight
{
  int v3;
  int v4;
  int sizesCount;
  CGSize *sizes;
  CGSize *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  CGFloat v19;
  double v20;
  CGSize *v21;
  unint64_t v22;
  double v23;
  float v24;
  id v25;

  v3 = -[NSArray count](self->_labelsAndValues, "count");
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = v3 + 1;
  sizesCount = v4 >> 1;
  self->_sizesCount = sizesCount;
  sizes = self->_sizes;
  if (sizes)
  {
    free(sizes);
    self->_sizes = 0;
    sizesCount = self->_sizesCount;
  }
  v7 = (CGSize *)malloc_type_malloc(16 * sizesCount, 0x1000040451B5BE8uLL);
  self->_sizes = v7;
  if (v7)
  {
    self->_idealHeight = 20.0;
    -[CertInfoDescriptionCellContentView _valueFont](self, "_valueFont");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[CertInfoDescriptionCellContentView bounds](self, "bounds");
    v9 = v8 + -106.0 + -10.0;
    objc_msgSend(CFSTR("test"), "_legacy_sizeWithFont:forWidth:lineBreakMode:", v25, 4, v9);
    if (self->_sizesCount)
    {
      v12 = v10;
      v13 = v11;
      v14 = 0;
      v15 = 0;
      v16 = v11 * 10.0;
      do
      {
        -[NSArray objectAtIndex:](self->_labelsAndValues, "objectAtIndex:", v14 * 2 + 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");
        v19 = v12;
        v20 = v13;
        if (v18)
          objc_msgSend(v17, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v25, 4, v9, v16);
        v21 = &self->_sizes[v14];
        v21->width = v19;
        v21->height = v20;
        self->_idealHeight = v20 + self->_idealHeight;

        ++v15;
        v22 = self->_sizesCount;
        ++v14;
      }
      while (v15 < v22);
      v23 = (double)((int)v22 - 1);
    }
    else
    {
      v23 = -1.0;
    }
    v24 = self->_idealHeight + v23 * 8.0;
    self->_idealHeight = rintf(v24) + 2.0;

  }
}

- (void)setLabelsAndValues:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_labelsAndValues != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_labelsAndValues, a3);
    -[CertInfoDescriptionCellContentView _recalculateIdealHeight](self, "_recalculateIdealHeight");
    -[CertInfoDescriptionCellContentView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (double)rowHeight
{
  return self->_idealHeight;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize *v17;
  double width;
  double height;
  CGFloat v20;
  double v21;
  __int128 v22;
  __int128 v23;
  CGFloat v24[2];
  __int128 v25;
  CGFloat components[2];
  __int128 v27;
  uint64_t v28;
  CGRect v29;

  v28 = *MEMORY[0x24BDAC8D0];
  CurrentContext = UIGraphicsGetCurrentContext();
  -[CertInfoDescriptionCellContentView _labelFont](self, "_labelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoDescriptionCellContentView _valueFont](self, "_valueFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSArray count](self->_labelsAndValues, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v22 = xmmword_20DB03FB0;
    v23 = xmmword_20DB03FA0;
    v10 = 8.0;
    do
    {
      -[NSArray objectAtIndex:](self->_labelsAndValues, "objectAtIndex:", v9, v22, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_labelsAndValues, "objectAtIndex:", v9 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_legacy_sizeWithFont:", v5);
      v15 = v14;
      if (v13 <= 86.0)
        v16 = v13;
      else
        v16 = 86.0;
      *(_OWORD *)components = xmmword_20DB03F80;
      v27 = xmmword_20DB03F90;
      CGContextSetFillColor(CurrentContext, components);
      objc_msgSend(v11, "_legacy_drawInRect:withFont:lineBreakMode:", v5, 4, 96.0 - v16, v10, v16, v15);
      v17 = &self->_sizes[v9 / 2];
      width = v17->width;
      height = v17->height;
      v29.origin.x = 96.0 - v16;
      v29.origin.y = v10;
      v29.size.width = v16;
      v29.size.height = v15;
      v20 = CGRectGetMaxX(v29) + 10.0;
      *(_OWORD *)v24 = v23;
      v25 = v22;
      CGContextSetFillColor(CurrentContext, v24);
      objc_msgSend(v12, "_legacy_drawInRect:withFont:lineBreakMode:", v6, 4, v20, v10, width, height);
      if (v15 >= height)
        v21 = v15;
      else
        v21 = height;
      v10 = v10 + v21 + 8.0;

      v9 += 2;
    }
    while (v9 < v8);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CertInfoDescriptionCellContentView;
  -[CertInfoDescriptionCellContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[CertInfoDescriptionCellContentView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsAndValues, 0);
}

@end
