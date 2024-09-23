@implementation CAMOverlayServiceSlider

- (CAMOverlayServiceSlider)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 rangeScale:(int64_t)a6 valueRange:(id)a7 primaryValues:(id)a8
{
  id v15;
  id v16;
  CAMOverlayServiceSlider *v17;
  CAMOverlayServiceSlider *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)CAMOverlayServiceSlider;
  v17 = -[CAMAbstractOverlayServiceControl _initWithIdentifier:title:imageName:](&v20, sel__initWithIdentifier_title_imageName_, a3, a4, a5);
  v18 = v17;
  if (v17)
  {
    v17->_rangeScale = a6;
    objc_storeStrong((id *)&v17->_valueRange, a7);
    objc_storeStrong((id *)&v18->_primaryValues, a8);
    v18->_sliderType = 0;
  }

  return v18;
}

- (id)initPhotoZoomSliderWithIdentifier:(id)a3 maximumZoomFactor:(double)a4 captureDeviceUniqueID:(id)a5
{
  double v7;
  id v8;
  id v9;
  CAMOverlayContinuousFloatRange *v10;
  id v11;

  v7 = fmax(a4, 1.0);
  v8 = a5;
  v9 = a3;
  v10 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:]([CAMOverlayContinuousFloatRange alloc], "initWithMinimum:maximum:", 1.0, v7);
  v11 = -[CAMOverlayServiceSlider _initWithIdentifier:sliderType:captureUniqueID:zoomRange:](self, "_initWithIdentifier:sliderType:captureUniqueID:zoomRange:", v9, 5, v8, v10);

  return v11;
}

- (id)initVideoZoomSliderWithIdentifier:(id)a3 maximumZoomFactor:(double)a4 captureDeviceUniqueID:(id)a5
{
  double v7;
  id v8;
  id v9;
  CAMOverlayContinuousFloatRange *v10;
  id v11;

  v7 = fmax(a4, 1.0);
  v8 = a5;
  v9 = a3;
  v10 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:]([CAMOverlayContinuousFloatRange alloc], "initWithMinimum:maximum:", 1.0, v7);
  v11 = -[CAMOverlayServiceSlider _initWithIdentifier:sliderType:captureUniqueID:zoomRange:](self, "_initWithIdentifier:sliderType:captureUniqueID:zoomRange:", v9, 6, v8, v10);

  return v11;
}

- (CAMOverlayServiceSlider)initWithIdentifier:(id)a3 sliderType:(int64_t)a4 captureUniqueID:(id)a5
{
  return (CAMOverlayServiceSlider *)-[CAMOverlayServiceSlider _initWithIdentifier:sliderType:captureUniqueID:zoomRange:](self, "_initWithIdentifier:sliderType:captureUniqueID:zoomRange:", a3, a4, a5, 0);
}

- (id)_initWithIdentifier:(id)a3 sliderType:(int64_t)a4 captureUniqueID:(id)a5 zoomRange:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD *v18;
  CAMOverlayDiscreteFloatRange *v19;
  CAMOverlayFloatValueRange *valueRange;
  CAMOverlayDiscreteFloatRange *v21;
  CAMOverlayDiscreteFloatRange *primaryValues;
  NSString *v23;
  NSString *valueFormat;
  CAMOverlayContinuousFloatRange *v25;
  CAMOverlayContinuousFloatRange *v26;
  CAMOverlayContinuousFloatRange *v27;
  CAMOverlayFloatValueRange *v28;
  NSString *v29;
  NSString *v30;
  CAMOverlayContinuousFloatRange *v31;
  CAMOverlayFloatValueRange *v32;
  NSString *v33;
  NSString *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  switch(a4)
  {
    case 1:
      objc_storeStrong((id *)&self->_captureDeviceUniqueID, a5);
      v19 = -[CAMOverlayDiscreteFloatRange initWithMinimum:maximum:step:]([CAMOverlayDiscreteFloatRange alloc], "initWithMinimum:maximum:step:", -2.0, 2.0, 0.333333333);
      valueRange = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v19;

      v21 = -[CAMOverlayDiscreteFloatRange initWithMinimum:maximum:step:]([CAMOverlayDiscreteFloatRange alloc], "initWithMinimum:maximum:step:", -2.0, 2.0, 1.0);
      primaryValues = self->_primaryValues;
      self->_primaryValues = v21;

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EXPOSURE_BIAS_TEXT"), &stru_2508F9068, CFSTR("CameraOverlayServices"));
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      valueFormat = self->_valueFormat;
      self->_valueFormat = v23;

      v16 = CFSTR("plusminus");
      v17 = CFSTR("SLIDER_EXPOSURE");
      goto LABEL_9;
    case 2:
      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      v25 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:]([CAMOverlayContinuousFloatRange alloc], "initWithMinimum:maximum:", -1.0, 1.0);
      v13 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v25;
      v16 = CFSTR("swirl.circle.righthalf.filled");
      v17 = CFSTR("SLIDER_STYLE_COLOR");
      goto LABEL_9;
    case 3:
      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      v26 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:]([CAMOverlayContinuousFloatRange alloc], "initWithMinimum:maximum:", 0.0, 1.0);
      v13 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v26;
      v16 = CFSTR("lifepreserver");
      v17 = CFSTR("SLIDER_STYLE_INTENSITY");
      goto LABEL_9;
    case 4:
      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      v27 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:]([CAMOverlayContinuousFloatRange alloc], "initWithMinimum:maximum:", -1.0, 1.0);
      v28 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v27;

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TONE_TEXT"), &stru_2508F9068, CFSTR("CameraOverlayServices"));
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = self->_valueFormat;
      self->_valueFormat = v29;

      v16 = CFSTR("dot.grid.bottomrighthalf.app");
      v17 = CFSTR("SLIDER_STYLE_TONE");
      goto LABEL_9;
    case 5:
    case 6:
      objc_storeStrong((id *)&self->_captureDeviceUniqueID, a5);
      self->_rangeScale = 1;
      objc_storeStrong((id *)&self->_valueRange, a6);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ZOOM_FACTOR_TEXT"), &stru_2508F9068, CFSTR("CameraOverlayServices"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = self->_valueFormat;
      self->_valueFormat = v14;

      v16 = CFSTR("crosshair.viewfinder");
      v17 = CFSTR("SLIDER_ZOOM");
      goto LABEL_9;
    case 7:
      objc_storeStrong((id *)&self->_captureDeviceUniqueID, a5);
      v31 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:]([CAMOverlayContinuousFloatRange alloc], "initWithMinimum:maximum:", 1.0, 1.79769313e308);
      v32 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v31;

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ZOOM_FACTOR_TEXT"), &stru_2508F9068, CFSTR("CameraOverlayServices"));
      v33 = (NSString *)objc_claimAutoreleasedReturnValue();
      v34 = self->_valueFormat;
      self->_valueFormat = v33;

      v16 = CFSTR("camera.aperture");
      v17 = CFSTR("SLIDER_LENS");
LABEL_9:

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", v17, &stru_2508F9068, CFSTR("CameraOverlayServices"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38.receiver = self;
      v38.super_class = (Class)CAMOverlayServiceSlider;
      v18 = -[CAMAbstractOverlayServiceControl _initWithIdentifier:title:imageName:](&v38, sel__initWithIdentifier_title_imageName_, v10, v36, v16);

      v18[9] = a4;
      break;
    default:

      v18 = 0;
      break;
  }

  return v18;
}

- (id)displayValueRange
{
  return self->_displayValueRange;
}

- (id)displayValues
{
  return self->_displayValues;
}

- (id)values
{
  return self->_values;
}

- (id)sliderUnpackingDisplayValuesIfNeeded
{
  CAMOverlayServiceSlider *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *values;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  CAMOverlayServiceSlider *v18;
  CAMOverlayDiscreteFloatRange *v19;
  CAMOverlayFloatValueRange *valueRange;
  CAMOverlayDiscreteFloatRange *v21;
  CAMOverlayValueRange *displayValueRange;
  NSArray *v23;
  CAMOverlayContinuousFloatRange *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  uint64_t v30;
  CAMOverlayFloatValueRange *v31;
  CAMOverlayContinuousFloatRange *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CAMOverlayContinuousFloatRange *v38;
  CAMOverlayValueRange *v39;
  CAMOverlayContinuousFloatRange *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSArray *displayValues;
  NSArray *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  -[CAMOverlayServiceSlider displayValuesByValue](v2, "displayValuesByValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v7 = v5;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v11), (_QWORD)v48);
          values = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray count](v6, "count"))
          {
            objc_msgSend(values, "doubleValue");
            v14 = v13;
            -[NSArray lastObject](v6, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "doubleValue");
            v17 = v16;

            if (v14 < v17)
            {

              v23 = v7;
              goto LABEL_18;
            }
          }
          -[NSArray addObject:](v6, "addObject:", values);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (v6)
    {
      v18 = (CAMOverlayServiceSlider *)-[CAMOverlayServiceSlider copy](v2, "copy");

      if (-[CAMOverlayServiceSlider sliderType](v2, "sliderType") == 7)
      {
        v19 = -[CAMOverlayDiscreteFloatRange initWithValues:]([CAMOverlayDiscreteFloatRange alloc], "initWithValues:", v7);
        valueRange = v18->_valueRange;
        v18->_valueRange = (CAMOverlayFloatValueRange *)v19;

        v21 = -[CAMOverlayDiscreteFloatRange initWithValues:]([CAMOverlayDiscreteFloatRange alloc], "initWithValues:", v6);
        displayValueRange = v18->_displayValueRange;
        v18->_displayValueRange = (CAMOverlayValueRange *)v21;

      }
      else
      {
        v24 = [CAMOverlayContinuousFloatRange alloc];
        -[NSArray firstObject](v7, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;
        -[NSArray lastObject](v7, "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v30 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:](v24, "initWithMinimum:maximum:", v27, v29);
        v31 = v18->_valueRange;
        v18->_valueRange = (CAMOverlayFloatValueRange *)v30;

        v32 = [CAMOverlayContinuousFloatRange alloc];
        -[NSArray firstObject](v6, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        v35 = v34;
        -[NSArray lastObject](v6, "lastObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v38 = -[CAMOverlayContinuousFloatRange initWithMinimum:maximum:](v32, "initWithMinimum:maximum:", v35, v37);

        v39 = v18->_displayValueRange;
        v18->_displayValueRange = (CAMOverlayValueRange *)v38;
        v40 = v38;

        -[CAMOverlayContinuousFloatRange maximum](v40, "maximum");
        v42 = v41;
        -[CAMOverlayContinuousFloatRange minimum](v40, "minimum");
        v44 = v43;

        if (v42 - v44 <= 5.0)
          v18->_rangeScale = 0;
      }
      displayValues = v18->_displayValues;
      v18->_displayValues = v6;
      v23 = v6;

      v46 = v7;
      values = v18->_values;
      v18->_values = v46;
      v2 = v18;
LABEL_18:

    }
  }

  return v2;
}

- (CAMOverlayServiceSlider)sliderWithPrimaryValues:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[CAMOverlayServiceSlider copy](self, "copy");
  v6 = (void *)v5[14];
  v5[14] = v4;

  return (CAMOverlayServiceSlider *)v5;
}

- (int64_t)controlType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = -[CAMOverlayServiceSlider sliderType](self, "sliderType", a3);
  v5 = objc_alloc((Class)objc_opt_class());
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = -[CAMOverlayServiceSlider sliderType](self, "sliderType");
    -[CAMOverlayServiceSlider captureDeviceUniqueID](self, "captureDeviceUniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (_QWORD *)objc_msgSend(v5, "initWithIdentifier:sliderType:captureUniqueID:", v6, v7, v8);
    }
    else
    {
      -[CAMOverlayServiceSlider captureSessionUniqueID](self, "captureSessionUniqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (_QWORD *)objc_msgSend(v5, "initWithIdentifier:sliderType:captureUniqueID:", v6, v7, v15);

    }
    -[CAMOverlayServiceSlider primaryValues](self, "primaryValues");
    v16 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v9[14];
    v9[14] = v16;
  }
  else
  {
    -[CAMAbstractOverlayServiceControl title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAbstractOverlayServiceControl imageName](self, "imageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CAMOverlayServiceSlider rangeScale](self, "rangeScale");
    -[CAMOverlayServiceSlider valueRange](self, "valueRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMOverlayServiceSlider primaryValues](self, "primaryValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)objc_msgSend(v5, "initWithIdentifier:title:imageName:rangeScale:valueRange:primaryValues:", v6, v10, v11, v12, v13, v14);

  }
  -[CAMOverlayServiceSlider displayValuesByValue](self, "displayValuesByValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisplayValuesByValue:", v17);

  -[CAMOverlayServiceSlider valueFormat](self, "valueFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValueFormat:", v18);

  objc_msgSend(v9, "setEnabled:", -[CAMOverlayServiceSlider isEnabled](self, "isEnabled"));
  return v9;
}

- (void)setValueFormat:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSString *v7;
  NSObject *valueFormat;
  NSString *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  CAMOverlayServiceSlider *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v10, CFSTR("test"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v5)
    {
      v7 = (NSString *)objc_msgSend(v4, "copy");
      valueFormat = self->_valueFormat;
      self->_valueFormat = v7;
    }
    else
    {
      valueFormat = os_log_create("com.apple.camera.overlay", "Client");
      if (os_log_type_enabled(valueFormat, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v12 = v4;
        v13 = 2114;
        v14 = self;
        v15 = 2112;
        v16 = v6;
        _os_log_error_impl(&dword_237707000, valueFormat, OS_LOG_TYPE_ERROR, "Invalid value format %{public}@ for %{public}@: %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v9 = self->_valueFormat;
    self->_valueFormat = 0;

  }
}

- (BOOL)isEnabled
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMOverlayServiceSlider;
  v3 = -[CAMAbstractOverlayServiceControl isEnabled](&v5, sel_isEnabled);
  if (v3)
  {
    if (-[CAMOverlayFloatValueRange isDiscrete](self->_valueRange, "isDiscrete"))
      LOBYTE(v3) = -[CAMOverlayFloatValueRange count](self->_valueRange, "count") != 0;
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (CAMOverlayServiceSlider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  CAMOverlayServiceSlider *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  NSDictionary *v72;
  NSDictionary *displayValuesByValue;
  CAMOverlayServiceSlider *v74;
  void *v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("sliderType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v4, "decodeIntegerForKey:", v8);

  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), v11, CFSTR("rangeScale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v4, "decodeIntegerForKey:", v12);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, v17);
  v82 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD17C8];
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%@"), v21, CFSTR("title"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, v22);
  v81 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD17C8];
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.%@"), v26, CFSTR("imageName"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, v27);
  v80 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BDD17C8];
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@.%@"), v31, CFSTR("captureDeviceUniqueID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, v32);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x24BDD17C8];
  v35 = (objc_class *)objc_opt_class();
  NSStringFromClass(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.%@"), v36, CFSTR("captureSessionUniqueID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, v37);
  v79 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x24BDD17C8];
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("%@.%@"), v41, CFSTR("primaryValues"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, v42);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x24BDD17C8];
  v45 = (objc_class *)objc_opt_class();
  NSStringFromClass(v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("%@.%@"), v46, CFSTR("valueFormat"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)MEMORY[0x24BDBCF20];
  v50 = objc_opt_class();
  objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)MEMORY[0x24BDD17C8];
  v53 = (objc_class *)objc_opt_class();
  NSStringFromClass(v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "stringWithFormat:", CFSTR("%@.%@"), v54, CFSTR("valueRange"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v57 = v56;
  else
    v57 = 0;
  v58 = v57;
  switch(v78)
  {
    case 0:
      v59 = (void *)v82;
      v60 = (void *)v80;
      if (!v82)
        goto LABEL_22;
      v61 = (void *)v81;
      v62 = (void *)v79;
      if (v81 && v80 && v56 && v83)
      {
        v74 = -[CAMOverlayServiceSlider initWithIdentifier:title:imageName:rangeScale:valueRange:primaryValues:](self, "initWithIdentifier:title:imageName:rangeScale:valueRange:primaryValues:", v82, v81, v80, v77, v56);
        goto LABEL_21;
      }
      break;
    case 1:
      v59 = (void *)v82;
      v60 = (void *)v80;
      if (!v82)
        goto LABEL_22;
      v61 = (void *)v81;
      v62 = (void *)v79;
      if (v84)
      {
        v63 = self;
        v64 = v82;
        goto LABEL_20;
      }
      break;
    case 2:
    case 3:
    case 4:
      v59 = (void *)v82;
      v60 = (void *)v80;
      if (!v82)
      {
LABEL_22:
        v61 = (void *)v81;
        goto LABEL_25;
      }
      v61 = (void *)v81;
      v62 = (void *)v79;
      if (v79)
      {
        v63 = self;
        v64 = v82;
LABEL_20:
        v74 = -[CAMOverlayServiceSlider initWithIdentifier:sliderType:captureUniqueID:](v63, "initWithIdentifier:sliderType:captureUniqueID:", v64);
LABEL_21:
        self = v74;
      }
      break;
    case 5:
    case 6:
    case 7:
      v59 = (void *)v82;
      if (v82 && v84)
      {
        self = -[CAMOverlayServiceSlider _initWithIdentifier:sliderType:captureUniqueID:zoomRange:](self, "_initWithIdentifier:sliderType:captureUniqueID:zoomRange:", v82);
        v65 = (void *)MEMORY[0x24BDBCF20];
        v66 = objc_opt_class();
        objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)MEMORY[0x24BDD17C8];
        v69 = (objc_class *)objc_opt_class();
        NSStringFromClass(v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringWithFormat:", CFSTR("%@.%@"), v70, CFSTR("displayValuesByValue"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, v71);
        v72 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        displayValuesByValue = self->_displayValuesByValue;
        self->_displayValuesByValue = v72;

      }
      goto LABEL_24;
    default:
      v59 = (void *)v82;
LABEL_24:
      v60 = (void *)v80;
      v61 = (void *)v81;
LABEL_25:
      v62 = (void *)v79;
      break;
  }
  if (v48)
    -[CAMOverlayServiceSlider setValueFormat:](self, "setValueFormat:", v48);
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v75)
  {

    self = 0;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)CAMOverlayServiceSlider;
  v4 = a3;
  -[CAMAbstractOverlayServiceControl encodeWithCoder:](&v45, sel_encodeWithCoder_, v4);
  v5 = -[CAMOverlayServiceSlider sliderType](self, "sliderType");
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("sliderType"), v45.receiver, v45.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v9);

  v10 = -[CAMOverlayServiceSlider rangeScale](self, "rangeScale");
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, CFSTR("rangeScale"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v10, v14);

  -[CAMOverlayServiceSlider valueRange](self, "valueRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), v18, CFSTR("valueRange"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v19);

  -[CAMOverlayServiceSlider primaryValues](self, "primaryValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), v23, CFSTR("primaryValues"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, v24);

  -[CAMOverlayServiceSlider displayValuesByValue](self, "displayValuesByValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x24BDD17C8];
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@.%@"), v28, CFSTR("displayValuesByValue"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v29);

  -[CAMOverlayServiceSlider captureDeviceUniqueID](self, "captureDeviceUniqueID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x24BDD17C8];
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%@.%@"), v33, CFSTR("captureDeviceUniqueID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, v34);

  -[CAMOverlayServiceSlider captureSessionUniqueID](self, "captureSessionUniqueID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x24BDD17C8];
  v37 = (objc_class *)objc_opt_class();
  NSStringFromClass(v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@.%@"), v38, CFSTR("captureSessionUniqueID"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, v39);

  -[CAMOverlayServiceSlider valueFormat](self, "valueFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD17C8];
  v42 = (objc_class *)objc_opt_class();
  NSStringFromClass(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@.%@"), v43, CFSTR("valueFormat"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, v44);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)sliderType
{
  return self->_sliderType;
}

- (CAMOverlayFloatValueRange)valueRange
{
  return self->_valueRange;
}

- (NSDictionary)displayValuesByValue
{
  return self->_displayValuesByValue;
}

- (void)setDisplayValuesByValue:(id)a3
{
  objc_storeStrong((id *)&self->_displayValuesByValue, a3);
}

- (NSString)captureDeviceUniqueID
{
  return self->_captureDeviceUniqueID;
}

- (NSString)captureSessionUniqueID
{
  return self->_captureSessionUniqueID;
}

- (CAMOverlayDiscreteFloatRange)primaryValues
{
  return self->_primaryValues;
}

- (int64_t)rangeScale
{
  return self->_rangeScale;
}

- (NSString)valueFormat
{
  return self->_valueFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFormat, 0);
  objc_storeStrong((id *)&self->_primaryValues, 0);
  objc_storeStrong((id *)&self->_captureSessionUniqueID, 0);
  objc_storeStrong((id *)&self->_captureDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_displayValuesByValue, 0);
  objc_storeStrong((id *)&self->_valueRange, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_displayValues, 0);
  objc_storeStrong((id *)&self->_displayValueRange, 0);
}

- (id)updateWithStyleDictionary:(id)a3
{
  id v4;
  CAMOverlayServiceControlUpdate *v5;
  void *v6;
  id v7;

  v4 = a3;
  if ((unint64_t)(-[CAMOverlayServiceSlider sliderType](self, "sliderType") - 2) > 2)
  {
    v7 = 0;
  }
  else
  {
    v5 = [CAMOverlayServiceControlUpdate alloc];
    -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:styleDictionary:](v5, "_initWithControlIdentifier:styleDictionary:", v6, v4);

  }
  return v7;
}

- (id)updateWithFloatValue:(float)a3
{
  CAMOverlayServiceControlUpdate *v5;
  void *v6;
  double v7;
  id v8;

  v5 = [CAMOverlayServiceControlUpdate alloc];
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  v8 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:floatValue:](v5, "_initWithControlIdentifier:floatValue:", v6, v7);

  return v8;
}

- (id)updateWithRecording:(BOOL)a3
{
  _BOOL8 v3;
  CAMOverlayServiceControlUpdate *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = [CAMOverlayServiceControlUpdate alloc];
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:isRecording:](v5, "_initWithControlIdentifier:isRecording:", v6, v3);

  return v7;
}

@end
