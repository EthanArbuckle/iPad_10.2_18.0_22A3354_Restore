@implementation VOTCustomSliderCell

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCustomSliderCell specifier](self, "specifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "propertyForKey:", CFSTR("VOSSettingsItem")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForSettingsItem:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "formattedValue:withItem:", v5, v3));

  return v7;
}

- (void)accessibilityIncrementOrDecrement:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  void *v18;
  objc_super v19;
  objc_super v20;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCustomSliderCell specifier](self, "specifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "propertyForKey:", CFSTR("VOSSettingsItem")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCustomSliderCell control](self, "control"));
  v9 = objc_opt_class(UISlider, v8);
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsItem Volume](VOSSettingsItem, "Volume"));

    if (v6 == v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCustomSliderCell control](self, "control"));
      objc_msgSend(v12, "value");
      v14 = -0.05;
      if (v3)
        v14 = 0.05;
      *(float *)&v13 = *(float *)&v13 + v14;
      v15 = *(float *)&v13;
      objc_msgSend(v12, "setValue:animated:", 0, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance"));
      *(float *)&v17 = v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
      objc_msgSend(v16, "setValue:forSettingsItem:", v18, v6);

    }
    else if (v3)
    {
      -[VOTCustomSliderCell accessibilityIncrement](&v20, "accessibilityIncrement", v19.receiver, v19.super_class, self, VOTCustomSliderCell);
    }
    else
    {
      -[VOTCustomSliderCell accessibilityDecrement](&v19, "accessibilityDecrement", self, VOTCustomSliderCell, v20.receiver, v20.super_class);
    }
  }

}

- (void)accessibilityIncrement
{
  -[VOTCustomSliderCell accessibilityIncrementOrDecrement:](self, "accessibilityIncrementOrDecrement:", 1);
}

- (void)accessibilityDecrement
{
  -[VOTCustomSliderCell accessibilityIncrementOrDecrement:](self, "accessibilityIncrementOrDecrement:", 0);
}

@end
