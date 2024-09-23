@implementation UILabel(_HKElectrocardiogramInfoView)

+ (id)_hkecg_heartRateLabel
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v0, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v0, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTextColor:", v2);

  return v0;
}

+ (id)_hkecg_bodyLabel
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v0, "setNumberOfLines:", 0);
  objc_msgSend(v0, "setTextAlignment:", 4);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTextColor:", v2);

  return v0;
}

@end
