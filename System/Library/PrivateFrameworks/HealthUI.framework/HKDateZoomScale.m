@implementation HKDateZoomScale

- (HKDateZoomScale)initWithCurrentCalendar:(id)a3
{
  id v5;
  HKDateZoomScale *v6;
  HKDateZoomScale *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDateZoomScale;
  v6 = -[HKDateZoomScale init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currentCalendar, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKDateZoomScale *v4;
  uint64_t v5;
  char v6;
  HKDateZoomScale *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (HKDateZoomScale *)a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (v4 == self)
    {
      v6 = 1;
    }
    else
    {
      v7 = v4;
      -[HKDateZoomScale unitZoomScaleValueRange](self, "unitZoomScaleValueRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDateZoomScale unitZoomScaleValueRange](v7, "unitZoomScaleValueRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        v6 = 1;
      }
      else
      {
        -[HKDateZoomScale unitZoomScaleValueRange](v7, "unitZoomScaleValueRange");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[HKDateZoomScale unitZoomScaleValueRange](self, "unitZoomScaleValueRange");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKDateZoomScale unitZoomScaleValueRange](v7, "unitZoomScaleValueRange");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v11, "isEqual:", v12);

        }
        else
        {
          v6 = 0;
        }

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKDateZoomScale *v4;
  uint64_t v5;
  HKValueRange *unitZoomScaleValueRange;

  v4 = -[HKDateZoomScale init](+[HKDateZoomScale allocWithZone:](HKDateZoomScale, "allocWithZone:", a3), "init");
  v5 = -[HKValueRange copy](self->_unitZoomScaleValueRange, "copy");
  unitZoomScaleValueRange = v4->_unitZoomScaleValueRange;
  v4->_unitZoomScaleValueRange = (HKValueRange *)v5;

  return v4;
}

- (id)minDate
{
  void *v2;
  void *v3;

  -[HKDateZoomScale unitZoomScaleValueRange](self, "unitZoomScaleValueRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)maxDate
{
  void *v2;
  void *v3;

  -[HKDateZoomScale unitZoomScaleValueRange](self, "unitZoomScaleValueRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)zoomForZoomScale:(double)a3
{
  int64_t result;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  if (HKUIEqualCGFloats(a3, self->_previousZoomScale))
    return self->_previousZoom;
  -[HKDateZoomScale minDate](self, "minDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  -[HKDateZoomScale maxDate](self, "maxDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  v12 = 0;
  v13 = (v11 - v8) / a3;
  do
  {
    +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "zoomLevelThreshold");
    v16 = v15;

    if (v13 >= v16)
      break;
    ++v12;
  }
  while (v12 != 8);
  if (v12 >= 7)
    result = 7;
  else
    result = v12;
  self->_previousZoom = result;
  self->_previousZoomScale = a3;
  return result;
}

- (double)zoomScaleForRange:(HKRange)a3
{
  double var1;
  double var0;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  var1 = a3.var1;
  var0 = a3.var0;
  -[HKDateZoomScale minDate](self, "minDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  -[HKDateZoomScale maxDate](self, "maxDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  return (v11 - v8) / (var0 + var1 - var0);
}

- (id)unitZoomScaleValueRange
{
  return self->_unitZoomScaleValueRange;
}

- (void)setUnitZoomScaleValueRangeForTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKValueRange *v9;
  HKValueRange *unitZoomScaleValueRange;

  -[HKDateZoomScale currentCalendar](self, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateWithDurationSinceReferenceDate:calendarUnit:", 16, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDateZoomScale currentCalendar](self, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_dateWithDurationSinceReferenceDate:calendarUnit:", 16, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v6, v8);
  v9 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  unitZoomScaleValueRange = self->_unitZoomScaleValueRange;
  self->_unitZoomScaleValueRange = v9;

  self->_previousZoomScale = 0.0;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_unitZoomScaleValueRange, 0);
}

@end
