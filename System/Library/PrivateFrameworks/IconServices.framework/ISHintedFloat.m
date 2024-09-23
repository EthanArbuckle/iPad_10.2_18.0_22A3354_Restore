@implementation ISHintedFloat

- (void)addHintedFloat:(double)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  objc_super v8;

  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ISHintedFloat;
  -[ISHintedValue addHintedValue:forSize:](&v8, sel_addHintedValue_forSize_, v7, width, height);

}

- (double)hintedFloatForSize:(CGSize)a3
{
  double result;

  -[ISHintedFloat hintedFloatForSize:options:](self, "hintedFloatForSize:options:", -[ISHintedValue options](self, "options"), a3.width, a3.height);
  return result;
}

- (double)hintedFloatForSize:(CGSize)a3 options:(unint64_t)a4
{
  char v4;
  double height;
  double width;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  -[ISHintedValue hintedValueForIndex:](self, "hintedValueForIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  if ((v4 & 1) != 0)
  {
    if (-[ISHintedValue sizeOutsideHintedRange:](self, "sizeOutsideHintedRange:", width, height))
    {
      -[ISHintedValue scaleFactorForSize:](self, "scaleFactorForSize:", width, height);
      v11 = v11 * v12;
    }
    else
    {
      -[ISHintedValue interpolationFactorForSize:](self, "interpolationFactorForSize:", width, height);
      v14 = v13;
      -[ISHintedValue hintedValueForIndex:](self, "hintedValueForIndex:", v8 - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v11 = v16 + (v11 - v16) * v14;

    }
  }
  v17 = round(v11);
  if ((v4 & 2) != 0)
    v11 = v17;

  return v11;
}

@end
