@implementation NSDictionary(INIntentImpl)

- (id)intents_safeObjectForKey:()INIntentImpl ofType:
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v1 = v2;
    else
      v1 = 0;
  }
  v3 = v1;

  return v3;
}

- (uint64_t)intents_BOOLForKey:()INIntentImpl
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (id)intents_stringForKey:()INIntentImpl
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "intents_makeFromWidgetPlistableRepresentation:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)intents_intForKey:()INIntentImpl
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "intents_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)intents_int64ForKey:()INIntentImpl
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "intents_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (double)intents_doubleForKey:()INIntentImpl
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "intents_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    v4 = v3;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (id)intents_numberForKey:()INIntentImpl
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)intents_urlForKey:()INIntentImpl
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_intents_widgetPlistRepresentableForKey:()INIntentImpl ofClass:error:
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;

  v8 = a3;
  objc_msgSend(a1, "intents_safeObjectForKey:ofType:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = 0;
    objc_msgSend(a4, "makeFromWidgetPlistableRepresentation:error:", v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v12 = v11;
    if (v11)
    {
      v13 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v11);
    }
    else
    {
      v13 = v10;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
