@implementation NSDictionary(Safe)

- (id)getStringForKey:()Safe
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "getKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getNumberForKey:()Safe
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "getKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)getBoolForKey:()Safe
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "getKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (id)getDictionaryForKey:()Safe
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "getKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getArrayForKey:()Safe
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "getKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getKey:()Safe ofType:
{
  void *v1;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)alwaysGetStringForKey:()Safe default:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "alwaysGetKey:ofType:default:", v7, objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)alwaysGetNumberForKey:()Safe default:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "alwaysGetKey:ofType:default:", v7, objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)alwaysGetDictionaryForKey:()Safe default:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "alwaysGetKey:ofType:default:", v7, objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)alwaysGetArrayForKey:()Safe default:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "alwaysGetKey:ofType:default:", v7, objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)alwaysGetKey:()Safe ofType:default:
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a1, "getKey:ofType:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)alwaysGetKey:()Safe ofType:
{
  id v5;

  objc_msgSend(a1, "getKey:ofType:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = objc_alloc_init(a4);
  return v5;
}

@end
