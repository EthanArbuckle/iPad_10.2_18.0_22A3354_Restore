@implementation ISAppearanceEffect

- (ISAppearanceEffect)initWithAppearance:(int64_t)a3
{
  ISAppearanceEffect *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISAppearanceEffect;
  result = -[ISAppearanceEffect init](&v5, sel_init);
  if (result)
    result->_appearance = a3;
  return result;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a4;
  if (-[ISAppearanceEffect appearance](self, "appearance") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorControls"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("inputImage"));
    v7 = &unk_1E5816648;
    v8 = CFSTR("inputBrightness");
    v9 = v6;
  }
  else
  {
    if (-[ISAppearanceEffect appearance](self, "appearance") != 2)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIPhotoEffectNoir"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    v8 = CFSTR("inputImage");
    v7 = v5;
  }
  objc_msgSend(v9, "setValue:forKey:", v7, v8);
LABEL_7:

  return v6;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

@end
