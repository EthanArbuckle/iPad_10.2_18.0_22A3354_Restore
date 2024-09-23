@implementation MUPlatterConfigurator

+ (void)configureView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "_setContinuousCornerRadius:", 10.0);
  +[MUInfoCardStyle cardBackgroundColor](MUInfoCardStyle, "cardBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapsui_setBackgroundColor:", v4);

}

@end
