@implementation _WDSelectedRangeIcon

+ (id)_iconCache
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_iconCache__cache;
  if (!_iconCache__cache)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v4 = (void *)_iconCache__cache;
    _iconCache__cache = (uint64_t)v3;

    v2 = (void *)_iconCache__cache;
  }
  return v2;
}

+ (id)iconForData:(id)a3 foregroundColor:(id)a4 compatibleWithFont:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_cacheKeyForData:foregroundColor:font:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_iconCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
    goto LABEL_24;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  v16 = objc_msgSend(v8, "statisticsType");
  if (v16 == 6)
  {
    v17 = 1;
  }
  else
  {
    if (v16 != 7)
      goto LABEL_8;
    v17 = 0;
  }
  +[_WDSelectedRangeIcon _dataLabelImageForPlusSign:foregroundColor:dimension:strokeOffset:strokeWidth:](_WDSelectedRangeIcon, "_dataLabelImageForPlusSign:foregroundColor:dimension:strokeOffset:strokeWidth:", v17, v9, 10.0, 1.0, 1.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v18);

LABEL_8:
  v19 = objc_msgSend(v8, "dataType");
  switch(v19)
  {
    case 1:
      +[HKBloodPressureSeries systolicImageCompatibleWithFont:withColor:](HKBloodPressureSeries, "systolicImageCompatibleWithFont:withColor:", v10, v9);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 2:
      +[HKBloodPressureSeries diastolicImageCompatibleWithFont:withColor:](HKBloodPressureSeries, "diastolicImageCompatibleWithFont:withColor:", v10, v9);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 3:
    case 4:
      goto LABEL_12;
    case 5:
    case 6:
    case 7:
    case 8:
      goto LABEL_21;
    case 9:
      +[HKSleepPeriodSeries inBedImageCompatibleWithFont:withColor:](HKSleepPeriodSeries, "inBedImageCompatibleWithFont:withColor:", v10, v9);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 10:
      +[HKSleepPeriodSeries asleepImageCompatibleWithFont:withColor:](HKSleepPeriodSeries, "asleepImageCompatibleWithFont:withColor:", v10, v9);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_reproductiveHealthKeyColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 4.0;
      v24 = v22;
      v25 = 0;
      goto LABEL_19;
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_reproductiveHealthKeyColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 4.0;
      v24 = v22;
      v25 = 1;
LABEL_19:
      +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v24, v25, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImage:", v26);

      goto LABEL_20;
    default:
      if (v19 != 28 && v19 != 29)
        goto LABEL_21;
LABEL_12:
      objc_msgSend(v10, "capHeight");
      +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v9, 0, v21 * 0.5);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v22 = (void *)v20;
      objc_msgSend(v15, "setImage:", v20);
LABEL_20:

LABEL_21:
      objc_msgSend(v15, "image");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v15);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_iconCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v14, v11);

      }
      break;
  }
LABEL_24:

  return v14;
}

+ (id)_cacheKeyForData:(id)a3 foregroundColor:(id)a4 font:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v9, "statisticsType");
  v11 = objc_msgSend(v9, "dataType");

  v12 = objc_msgSend(v8, "hash");
  v13 = objc_msgSend(v7, "hash");

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 ^ v12 ^ v15 ^ (v11 + (v11 + v10 + (v11 + v10) * (v11 + v10)) / 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_dataLabelImageForPlusSign:(BOOL)a3 foregroundColor:(id)a4 dimension:(double)a5 strokeOffset:(double)a6 strokeWidth:(double)a7
{
  _BOOL4 v10;
  id v11;
  CGContext *CurrentContext;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  CGSize v22;

  v10 = a3;
  v11 = a4;
  v22.width = a5;
  v22.height = a5;
  UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v13 = a5 * 0.5 - a7 * 0.5;
  v14 = a5 + a6 * -2.0;
  +[HKBarSeries barSeriesRoundedRect:cornerRadius:](HKBarSeries, "barSeriesRoundedRect:cornerRadius:", a6, v13, v14, a7, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v11);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v16, "CGColor"));
  v17 = objc_retainAutorelease(v15);
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v17, "CGPath"));
  CGContextFillPath(CurrentContext);
  if (v10)
  {
    +[HKBarSeries barSeriesRoundedRect:cornerRadius:](HKBarSeries, "barSeriesRoundedRect:cornerRadius:", v13, a6, a7, v14, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v16), "CGColor"));
    v19 = objc_retainAutorelease(v18);
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v19, "CGPath"));
    CGContextFillPath(CurrentContext);

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v20;
}

@end
