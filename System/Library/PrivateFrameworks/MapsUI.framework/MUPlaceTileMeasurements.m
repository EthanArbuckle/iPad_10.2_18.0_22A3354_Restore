@implementation MUPlaceTileMeasurements

+ (id)defaultMeasurements
{
  void *v2;
  double v3;
  double v4;
  MUPlaceTileMeasurements *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screenScale");
  v4 = v3;

  v5 = objc_alloc_init(MUPlaceTileMeasurements);
  v6 = *MEMORY[0x1E0DC4A90];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1448];
  objc_msgSend(v8, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", 150.0);
  -[MUPlaceTileMeasurements setTileWidth:](v5, "setTileWidth:");

  v11 = (void *)MEMORY[0x1E0DC3990];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_mapkit_fontWithWeight:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_mapsui_maximumHeightWithFont:numberOfLines:displayScale:", v14, 2, v4);
  -[MUPlaceTileMeasurements setMaxTitleHeight:](v5, "setMaxTitleHeight:");

  v15 = (void *)MEMORY[0x1E0DC3990];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_mapsui_maximumHeightWithFont:numberOfLines:displayScale:", v16, 2, v4);
  -[MUPlaceTileMeasurements setMaxSubtitleHeight:](v5, "setMaxSubtitleHeight:");

  v17 = (void *)MEMORY[0x1E0DC3990];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_mapsui_maximumHeightWithFont:numberOfLines:displayScale:", v19, 2, v4);
  -[MUPlaceTileMeasurements setMaxFooterHeight:](v5, "setMaxFooterHeight:");

  -[MUPlaceTileMeasurements setDeviceScale:](v5, "setDeviceScale:", v4);
  return v5;
}

- (double)tileWidth
{
  return self->_tileWidth;
}

- (void)setTileWidth:(double)a3
{
  self->_tileWidth = a3;
}

- (double)maxTitleHeight
{
  return self->_maxTitleHeight;
}

- (void)setMaxTitleHeight:(double)a3
{
  self->_maxTitleHeight = a3;
}

- (double)maxSubtitleHeight
{
  return self->_maxSubtitleHeight;
}

- (void)setMaxSubtitleHeight:(double)a3
{
  self->_maxSubtitleHeight = a3;
}

- (double)maxFooterHeight
{
  return self->_maxFooterHeight;
}

- (void)setMaxFooterHeight:(double)a3
{
  self->_maxFooterHeight = a3;
}

- (double)deviceScale
{
  return self->_deviceScale;
}

- (void)setDeviceScale:(double)a3
{
  self->_deviceScale = a3;
}

@end
