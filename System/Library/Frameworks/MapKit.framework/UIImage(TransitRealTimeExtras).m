@implementation UIImage(TransitRealTimeExtras)

+ (id)_mapkit_liveTransitIndicatorImageApplyingColorForStatus:()TransitRealTimeExtras darkMode:
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_mapkit_liveTransitIndicatorImageUsingDarkMode:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MKTransitLiveDepartureColorForLiveStatus(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_flatImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_mapkit_liveTransitIndicatorImageUsingDarkMode:()TransitRealTimeExtras
{
  MKTransitShield *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = -[MKTransitShield initWithShieldType:text:color:]([MKTransitShield alloc], "initWithShieldType:text:color:", 320002, 0, 0);
  +[MKTransitArtwork artworkWithShield:accessibilityText:](MKTransitArtwork, "artworkWithShield:accessibilityText:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[MKArtworkDataSourceCache sharedInstance](MKArtworkDataSourceCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    objc_msgSend(v6, "imageForArtwork:size:featureType:scale:nightMode:", v5, 8, 0, a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (MKTransitArtworkDataSourceAllowMasking(v5))
    {
      objc_msgSend(v10, "imageWithRenderingMode:", 2);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
