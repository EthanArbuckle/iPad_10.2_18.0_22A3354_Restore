@implementation NTKComplicationModuleView

+ (int64_t)layoutOverride
{
  return 5;
}

+ (id)smallModuleViewForComplicationType:(unint64_t)a3
{
  objc_class *v3;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
  }
  return objc_alloc_init(v3);
}

+ (id)largeModuleViewForComplicationType:(unint64_t)a3
{
  objc_class *v3;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
  }
  return objc_alloc_init(v3);
}

- (void)setIsXL:(BOOL)a3
{
  _BOOL4 isXL;
  void *v5;

  isXL = self->_isXL;
  self->_isXL = a3;
  if (isXL != a3)
  {
    if (a3)
    {
      -[NTKModuleView device](self, "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKModuleView cornerRadiusForComplicationFamily:forDevice:](NTKModuleView, "cornerRadiusForComplicationFamily:forDevice:", 7, v5);
      -[NTKModuleView setHighlightCornerRadius:](self, "setHighlightCornerRadius:");

    }
    -[NTKComplicationModuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isXL
{
  return self->_isXL;
}

- (id)_newLabelSubview
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)off_1E6BCA6E0);
  -[NTKModuleView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  return v3;
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[NTKComplicationModuleView _newLabelSubview](self, "_newLabelSubview");
  objc_msgSend(v5, "setFont:", v4);

  return v5;
}

- (id)_newImageViewSubview
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)off_1E6BCA6D8);
  -[NTKModuleView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  return v3;
}

- (id)_attributeEnDashesWithinString:(id)a3 typographicTracking:(double)a4 baseFont:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
  objc_msgSend(v9, "CLKFontWithAlternativePunctuation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v12 = 0;
    do
    {
      if (objc_msgSend(v8, "characterAtIndex:", v12) == 8211)
      {
        v15 = v10;
        -[NTKComplicationModuleView _setTypographicTracking:andFont:onAttributedString:inRange:](self, "_setTypographicTracking:andFont:onAttributedString:inRange:", v11, &v15, v12, 1, a4);
        v13 = v15;

        v10 = v13;
      }
      ++v12;
    }
    while (v12 < objc_msgSend(v8, "length"));
  }

  return v10;
}

- (id)_attributedStringWithText:(id)a3 typographicTracking:(double)a4 baseFont:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;

  v8 = a3;
  objc_msgSend(a5, "CLKFontWithAlternativePunctuation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
  v11 = objc_msgSend(v8, "length");

  v14 = v10;
  -[NTKComplicationModuleView _setTypographicTracking:andFont:onAttributedString:inRange:](self, "_setTypographicTracking:andFont:onAttributedString:inRange:", v9, &v14, 0, v11, a4);
  v12 = v14;

  return v12;
}

- (void)_setTypographicTracking:(double)a3 andFont:(id)a4 onAttributedString:(id *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  length = a6.length;
  location = a6.location;
  v12 = a4;
  CLKKernValueForDesignSpecTrackingValue();
  v9 = *a5;
  v10 = *MEMORY[0x1E0DC1150];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:value:range:", v10, v11, location, length);

  objc_msgSend(*a5, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v12, location, length);
}

+ (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  CLKUIImageNamed();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_modularSmallAlarmImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_modularSmallAlarmImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_modularSmallAlarmImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_modularSmallAlarmImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_modularSmallAlarmImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_modularSmallAlarmImageProvider___cachedDevice);
    _modularSmallAlarmImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __60__NTKComplicationModuleView__modularSmallAlarmImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _modularSmallAlarmImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_modularSmallAlarmImageProvider___lock);
  return (id)_modularSmallAlarmImageProvider_glyphImageProvider;
}

void __60__NTKComplicationModuleView__modularSmallAlarmImageProvider__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  +[NTKComplicationModuleView _imageProviderForImageSymbolName:imageAssetNamePrefix:](NTKComplicationModuleView, "_imageProviderForImageSymbolName:imageAssetNamePrefix:", CFSTR("alarm"), CFSTR("modularAlarmActive"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_modularSmallAlarmImageProvider_glyphImageProvider;
  _modularSmallAlarmImageProvider_glyphImageProvider = v0;

  v2 = (void *)_modularSmallAlarmImageProvider_glyphImageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

+ (id)_extraLargeAlarmImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_extraLargeAlarmImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_extraLargeAlarmImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_extraLargeAlarmImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_extraLargeAlarmImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_extraLargeAlarmImageProvider___cachedDevice);
    _extraLargeAlarmImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __58__NTKComplicationModuleView__extraLargeAlarmImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _extraLargeAlarmImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_extraLargeAlarmImageProvider___lock);
  return (id)_extraLargeAlarmImageProvider_glyphImageProvider;
}

void __58__NTKComplicationModuleView__extraLargeAlarmImageProvider__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  +[NTKComplicationModuleView _imageProviderForImageSymbolName:imageAssetNamePrefix:](NTKComplicationModuleView, "_imageProviderForImageSymbolName:imageAssetNamePrefix:", CFSTR("alarm"), CFSTR("XLmodularAlarmActive"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extraLargeAlarmImageProvider_glyphImageProvider;
  _extraLargeAlarmImageProvider_glyphImageProvider = v0;

  v2 = (void *)_extraLargeAlarmImageProvider_glyphImageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

+ (id)_modularSmallStopwatchImageProviderForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_modularSmallStopwatchImageProviderForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&_modularSmallStopwatchImageProviderForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_modularSmallStopwatchImageProviderForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_modularSmallStopwatchImageProviderForDevice____cachedDevice, v3);
    _modularSmallStopwatchImageProviderForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __74__NTKComplicationModuleView__modularSmallStopwatchImageProviderForDevice___block_invoke();
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _modularSmallStopwatchImageProviderForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_modularSmallStopwatchImageProviderForDevice____lock);
  v10 = (id)_modularSmallStopwatchImageProviderForDevice__glyphImageProvider;

  return v10;
}

void __74__NTKComplicationModuleView__modularSmallStopwatchImageProviderForDevice___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  +[NTKComplicationModuleView _imageProviderForImageSymbolName:imageAssetNamePrefix:](NTKComplicationModuleView, "_imageProviderForImageSymbolName:imageAssetNamePrefix:", CFSTR("stopwatch"), CFSTR("modularStopwatch"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_modularSmallStopwatchImageProviderForDevice__glyphImageProvider;
  _modularSmallStopwatchImageProviderForDevice__glyphImageProvider = v0;

  v2 = (void *)_modularSmallStopwatchImageProviderForDevice__glyphImageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

+ (id)_extraLargeStopwatchImageProviderForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_extraLargeStopwatchImageProviderForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&_extraLargeStopwatchImageProviderForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_extraLargeStopwatchImageProviderForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_extraLargeStopwatchImageProviderForDevice____cachedDevice, v3);
    _extraLargeStopwatchImageProviderForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __72__NTKComplicationModuleView__extraLargeStopwatchImageProviderForDevice___block_invoke();
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _extraLargeStopwatchImageProviderForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_extraLargeStopwatchImageProviderForDevice____lock);
  v10 = (id)_extraLargeStopwatchImageProviderForDevice__glyphImageProvider;

  return v10;
}

void __72__NTKComplicationModuleView__extraLargeStopwatchImageProviderForDevice___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  +[NTKComplicationModuleView _imageProviderForImageSymbolName:imageAssetNamePrefix:](NTKComplicationModuleView, "_imageProviderForImageSymbolName:imageAssetNamePrefix:", CFSTR("stopwatch"), CFSTR("XLmodularStopwatch"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extraLargeStopwatchImageProviderForDevice__glyphImageProvider;
  _extraLargeStopwatchImageProviderForDevice__glyphImageProvider = v0;

  v2 = (void *)_extraLargeStopwatchImageProviderForDevice__glyphImageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

- (CDComplicationDisplayObserver)displayObserver
{
  return (CDComplicationDisplayObserver *)objc_loadWeakRetained((id *)&self->displayObserver);
}

- (void)setDisplayObserver:(id)a3
{
  objc_storeWeak((id *)&self->displayObserver, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->displayObserver);
}

@end
