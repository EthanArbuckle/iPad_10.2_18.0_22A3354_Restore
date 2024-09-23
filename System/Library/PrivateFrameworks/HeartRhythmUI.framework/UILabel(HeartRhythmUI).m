@implementation UILabel(HeartRhythmUI)

+ (id)hrui_fontAdjustingLabel
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v0, "setNumberOfLines:", 0);
  return v0;
}

@end
