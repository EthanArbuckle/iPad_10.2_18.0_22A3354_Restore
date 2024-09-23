@implementation CIDiscBlur

- (void)dealloc
{
  NSMutableArray *recipe;
  objc_super v4;

  recipe = self->_recipe;
  if (recipe)

  self->_recipe = 0;
  v4.receiver = self;
  v4.super_class = (Class)CIDiscBlur;
  -[CIFilter dealloc](&v4, sel_dealloc);
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.5");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F193D0;
  v4[2] = &unk_1E2F193D0;
  v4[3] = &unk_1E2F193E0;
  v3[4] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F19460;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  objc_super v7;

  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("inputImage")) & 1) == 0)
  {

    self->_recipe = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CIDiscBlur;
  -[CIDiscBlur setValue:forKey:](&v7, sel_setValue_forKey_, a3, a4);
}

- (id)outputImage
{
  float v4;
  float v5;
  NSMutableArray *recipe;
  CGRect v7;

  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v7))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  if (v4 <= 0.0001)
    return self->inputImage;
  recipe = self->_recipe;
  if (!recipe)
  {
    if (v4 > 500.0)
      v4 = 500.0;
    recipe = (NSMutableArray *)makeRecipe(v4, 0.0, 0.0, 1.0, v5);
    self->_recipe = recipe;
  }
  return applyRecipe(&recipe->super, self->inputImage);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
