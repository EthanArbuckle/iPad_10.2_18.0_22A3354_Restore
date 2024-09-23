@implementation UILabel(ClipServicesUIExtras)

+ (id)cps_labelWithText:()ClipServicesUIExtras textColor:fontSize:fontWeight:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = objc_alloc_init(a1);
  objc_msgSend(v12, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", a2, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scaledFontForFont:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v15);

  objc_msgSend(v12, "setText:", v11);
  if (v10)
  {
    objc_msgSend(v12, "setTextColor:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v16);

  }
  return v12;
}

@end
