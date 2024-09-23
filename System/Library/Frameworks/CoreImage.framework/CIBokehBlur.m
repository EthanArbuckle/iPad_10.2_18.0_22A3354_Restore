@implementation CIBokehBlur

- (void)dealloc
{
  NSMutableArray *recipe;
  objc_super v4;

  recipe = self->_recipe;
  if (recipe)

  self->_recipe = 0;
  v4.receiver = self;
  v4.super_class = (Class)CIBokehBlur;
  -[CIFilter dealloc](&v4, sel_dealloc);
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[9];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryBlur");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("11");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.13");
  v12[3] = CFSTR("inputRadius");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeMin");
  v10[0] = &unk_1E2F193C0;
  v10[1] = &unk_1E2F193D0;
  v9[2] = CFSTR("CIAttributeSliderMin");
  v9[3] = CFSTR("CIAttributeSliderMax");
  v10[2] = &unk_1E2F193D0;
  v10[3] = &unk_1E2F193E0;
  v9[4] = CFSTR("CIAttributeMax");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F193F0;
  v10[5] = CFSTR("CIAttributeTypeDistance");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v12[4] = CFSTR("inputRingAmount");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeMin");
  v8[0] = &unk_1E2F193D0;
  v8[1] = &unk_1E2F193D0;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F193D0;
  v8[3] = &unk_1E2F19400;
  v7[4] = CFSTR("CIAttributeMax");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F19400;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputRingSize");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = &unk_1E2F19410;
  v6[1] = &unk_1E2F193D0;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F193D0;
  v6[3] = &unk_1E2F19420;
  v5[4] = CFSTR("CIAttributeMax");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F19420;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v12[6] = CFSTR("inputSoftness");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = &unk_1E2F19400;
  v4[1] = &unk_1E2F193D0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19430;
  v4[3] = &unk_1E2F19440;
  v3[4] = CFSTR("CIAttributeMax");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19450;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  objc_super v7;

  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("inputImage")) & 1) == 0)
  {

    self->_recipe = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CIBokehBlur;
  -[CIBokehBlur setValue:forKey:](&v7, sel_setValue_forKey_, a3, a4);
}

- (id)outputImage
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  NSMutableArray *recipe;
  float v13;
  float v14;
  CGRect v15;

  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v15))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v5 = v4;
  if (v4 <= 0.0001)
    return self->inputImage;
  -[NSNumber floatValue](self->inputRingAmount, "floatValue");
  v7 = v6;
  -[NSNumber floatValue](self->inputRingSize, "floatValue");
  v9 = v8;
  -[NSNumber floatValue](self->inputSoftness, "floatValue");
  recipe = self->_recipe;
  if (!recipe)
  {
    v13 = v10;
    v14 = 500.0;
    if (v5 <= 500.0)
      v14 = v5;
    recipe = (NSMutableArray *)makeRecipe(v14, v7, 1.0 - v9, v13, v11);
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

@end
