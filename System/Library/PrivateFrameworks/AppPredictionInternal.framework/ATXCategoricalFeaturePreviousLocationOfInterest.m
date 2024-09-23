@implementation ATXCategoricalFeaturePreviousLocationOfInterest

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  objc_msgSend(a3, "locationMotionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousLOI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("Previous LOI NA");

  return v8;
}

@end
