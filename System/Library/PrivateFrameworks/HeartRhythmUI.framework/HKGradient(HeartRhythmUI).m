@implementation HKGradient(HeartRhythmUI)

+ (id)hrui_resultsSeparatorGradient
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.949019611, 0.949019611, 0.949019611, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A648]), "initWithTopColor:bottomColor:", v0, v1);

  return v2;
}

@end
