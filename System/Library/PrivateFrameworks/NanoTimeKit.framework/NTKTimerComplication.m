@implementation NTKTimerComplication

+ (double)_durationFromComplication:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v3 = a3;
  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "complicationDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("Duration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "doubleValue");
        v4 = v10;
      }

    }
  }

  return v4;
}

+ (int64_t)compareComplication:(id)a3 toComplication:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_durationFromComplication:", v6);
  v8 = v7;

  objc_msgSend((id)objc_opt_class(), "_durationFromComplication:", v5);
  v10 = v9;

  v11 = -1;
  if (v8 >= v10)
    v11 = 1;
  if (v8 == v10)
    return 0;
  else
    return v11;
}

@end
