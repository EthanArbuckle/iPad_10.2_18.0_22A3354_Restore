@implementation UILabel(MobileSafariFrameworkExtras)

+ (id)sf_startPageBannerTitleLabelWithFont:()MobileSafariFrameworkExtras
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(a1);
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  return v5;
}

@end
