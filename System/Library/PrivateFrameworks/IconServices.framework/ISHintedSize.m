@implementation ISHintedSize

- (void)addHintedSize:(CGSize)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  objc_super v8;

  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", a3.width, a3.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ISHintedSize;
  -[ISHintedValue addHintedValue:forSize:](&v8, sel_addHintedValue_forSize_, v7, width, height);

}

- (CGSize)hintedSizeForSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[ISHintedSize hintedSizeForSize:options:](self, "hintedSizeForSize:options:", -[ISHintedValue options](self, "options"), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)hintedSizeForSize:(CGSize)a3 options:(unint64_t)a4
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
  BOOL v14;
  int64_t v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  -[ISHintedValue hintedValueForIndex:](self, "hintedValueForIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeValue");
  v11 = v10;
  v13 = v12;
  if ((v4 & 1) != 0)
  {
    v14 = v8 < 1;
    v15 = v8 - 1;
    if (!v14)
    {
      -[ISHintedValue interpolationFactorForSize:](self, "interpolationFactorForSize:", width, height);
      v17 = v16;
      -[ISHintedValue hintedValueForIndex:](self, "hintedValueForIndex:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeValue");
      v11 = v19 + (v11 - v19) * v17;
      v13 = v20 + (v13 - v20) * v17;

    }
  }
  v21 = round(v11);
  v22 = round(v13);
  if ((v4 & 2) != 0)
  {
    v13 = v22;
    v11 = v21;
  }

  v23 = v11;
  v24 = v13;
  result.height = v24;
  result.width = v23;
  return result;
}

@end
