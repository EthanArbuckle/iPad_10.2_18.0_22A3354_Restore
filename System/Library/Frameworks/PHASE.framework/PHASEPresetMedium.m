@implementation PHASEPresetMedium

- (PHASEPresetMedium)init
{
  -[PHASEPresetMedium doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEPresetMedium)initWithEngine:(id)a3 preset:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHASEPresetMedium;
  return -[PHASEMedium initWithEngine:preset:](&v5, sel_initWithEngine_preset_, a3, a4);
}

- (PHASEPresetMedium)initWithEngine:(id)a3 privatePreset:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHASEPresetMedium;
  return -[PHASEMedium initWithEngine:privatePreset:](&v5, sel_initWithEngine_privatePreset_, a3, a4);
}

@end
