@implementation CLRegion(HomeLocation)

- (id)hm_description
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  __CFString *v11;
  void *v12;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "radius");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(Radius:%f)"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E3AB7688;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v1, "notifyOnEntry");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyOnExit");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v1, "referenceFrame");
  if (v10 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown reference frame: %ld"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E3AB4528[v10];
  }
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-(notifyOnEntry:%@)-(notifyOnExit:%@)-(Ref:%@)-%@"), v1, v8, v9, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
