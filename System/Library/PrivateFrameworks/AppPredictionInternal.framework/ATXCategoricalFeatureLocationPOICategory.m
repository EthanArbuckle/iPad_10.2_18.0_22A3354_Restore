@implementation ATXCategoricalFeatureLocationPOICategory

+ (BOOL)ignorePoiCategoryForUsersCurrentLOI:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "type"))
      v5 = objc_msgSend(v4, "type") == 1;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v4 = a3;
  objc_msgSend(v4, "poiCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationMotionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentLOI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)objc_opt_class(), "ignorePoiCategoryForUsersCurrentLOI:", v7) & 1) != 0)
  {
    v8 = CFSTR("POI Category Ignored");
  }
  else if (v5)
  {
    v8 = v5;
  }
  else
  {
    v8 = CFSTR("POI Category NA");
  }

  return v8;
}

@end
