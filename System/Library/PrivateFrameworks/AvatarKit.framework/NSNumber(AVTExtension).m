@implementation NSNumber(AVTExtension)

+ (id)avt_numberWithFloat:()AVTExtension roundingBehavior:
{
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  *(float *)&v7 = a1;
  objc_msgSend(v5, "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avt_numberByRoundingWithBehavior:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)avt_numberByRoundingWithBehavior:()AVTExtension
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BYTE v10[20];

  v4 = (objc_class *)MEMORY[0x1E0CB3598];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "decimalValue");
  v7 = (void *)objc_msgSend(v6, "initWithDecimal:", v10);
  objc_msgSend(v7, "decimalNumberByRoundingAccordingToBehavior:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
