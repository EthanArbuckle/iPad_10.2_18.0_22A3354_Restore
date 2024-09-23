@implementation EMP_TSDImageColorAnalyzer

- (EMP_TSDImageColorAnalyzer)initWithImage:(id)a3
{
  id v4;
  EMP_TSDImageColorAnalyzer *v5;
  JCImageAnalyzer *v6;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *interestingColors;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMP_TSDImageColorAnalyzer;
  v5 = -[EMP_TSDImageColorAnalyzer init](&v10, sel_init);
  if (v5)
  {
    v6 = (JCImageAnalyzer *)operator new();
    JCImageAnalyzer::JCImageAnalyzer(v6);
    v5->_imageAnalyzer = v6;
    JCImageAnalyzer::AnalyzeImage(v6, (CGImage *)objc_msgSend(objc_retainAutorelease(v4), "CGImage"));
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    interestingColors = v5->_interestingColors;
    v5->_interestingColors = v7;

    -[EMP_TSDImageColorAnalyzer p_prepareInterestingColors](v5, "p_prepareInterestingColors");
  }

  return v5;
}

- (void)dealloc
{
  JCImageAnalyzer *imageAnalyzer;
  objc_super v4;

  imageAnalyzer = (JCImageAnalyzer *)self->_imageAnalyzer;
  if (imageAnalyzer)
  {
    JCImageAnalyzer::~JCImageAnalyzer(imageAnalyzer);
    MEMORY[0x1DF0D7BB4]();
  }
  v4.receiver = self;
  v4.super_class = (Class)EMP_TSDImageColorAnalyzer;
  -[EMP_TSDImageColorAnalyzer dealloc](&v4, sel_dealloc);
}

- (NSArray)dominantColors
{
  id v3;
  uint64_t *v4;
  const JCColor *v5;
  const JCColor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = JCImageAnalyzer::DominantColors((JCImageAnalyzer *)self->_imageAnalyzer);
  v5 = (const JCColor *)*v4;
  v6 = (const JCColor *)v4[1];
  if ((const JCColor *)*v4 != v6)
  {
    do
    {
      JCColor::JCColor((JCColor *)v18, v5);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v18[0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      JCColor::~JCColor((JCColor *)v18);
      v5 = (const JCColor *)((char *)v5 + 16);
    }
    while (v5 != v6);
  }
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    -[EMP_TSDImageColorAnalyzer backgroundColor](self, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[EMP_TSDImageColorAnalyzer backgroundColor](self, "backgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
      objc_msgSend(v13, "addObject:", v8);
    objc_msgSend(v13, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v16);

  }
  return (NSArray *)v3;
}

- (UIColor)backgroundColor
{
  void *v2;
  _QWORD v4[2];

  JCColor::JCColor((JCColor *)v4, (const JCColor *)((char *)self->_imageAnalyzer + 24));
  if (v4[0])
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  JCColor::~JCColor((JCColor *)v4);
  return (UIColor *)v2;
}

- (NSOrderedSet)interestingColors
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_interestingColors, "copy");
}

- (void)filterInterestingColorsUsingBlock:(id)a3
{
  id v4;
  id v5;
  NSMutableOrderedSet *interestingColors;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  interestingColors = self->_interestingColors;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__EMP_TSDImageColorAnalyzer_filterInterestingColorsUsingBlock___block_invoke;
  v8[3] = &unk_1EA711ED0;
  v7 = v4;
  v8[4] = v5;
  v9 = v7;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](interestingColors, "enumerateObjectsUsingBlock:", v8);
  -[NSMutableOrderedSet minusSet:](self->_interestingColors, "minusSet:", v5);

}

- (id)textColorForBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[2];
  CGColorRef v8[2];

  v4 = objc_retainAutorelease(a3);
  JCColor::JCColor((JCColor *)v8, (CGColorRef)objc_msgSend(v4, "CGColor"));
  JCImageAnalyzer::GetTextColorForBackgroundColor((JCImageAnalyzer *)self->_imageAnalyzer, v8, (JCColor *)v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v7[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  JCColor::~JCColor((JCColor *)v7);
  JCColor::~JCColor((JCColor *)v8);

  return v5;
}

- (id)textShadowColorForTextColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[2];
  CGColorRef v12[2];
  CGColorRef v13[2];

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  JCColor::JCColor((JCColor *)v13, (CGColorRef)objc_msgSend(v7, "CGColor"));
  v8 = objc_retainAutorelease(v6);
  JCColor::JCColor((JCColor *)v12, (CGColorRef)objc_msgSend(v8, "CGColor"));
  JCImageAnalyzer::GetTextShadowColor(v13, v12, (JCColor *)v11);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v11[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  JCColor::~JCColor((JCColor *)v11);
  JCColor::~JCColor((JCColor *)v12);
  JCColor::~JCColor((JCColor *)v13);

  return v9;
}

- (void)p_prepareInterestingColors
{
  NSMutableOrderedSet *interestingColors;
  id v4;
  NSMutableOrderedSet *v5;
  id v6;
  id v7;
  _QWORD v8[6];

  interestingColors = self->_interestingColors;
  -[EMP_TSDImageColorAnalyzer dominantColors](self, "dominantColors");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObjectsFromArray:](interestingColors, "addObjectsFromArray:");

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = self->_interestingColors;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__EMP_TSDImageColorAnalyzer_p_prepareInterestingColors__block_invoke;
  v8[3] = &unk_1EA711EF8;
  v8[4] = v4;
  v8[5] = v7;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v8);
  -[NSMutableOrderedSet minusSet:](self->_interestingColors, "minusSet:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestingColors, 0);
}

@end
