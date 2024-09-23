@implementation NSMutableDictionary(BaseBoard)

- (void)intents_setIntegerIfNonZero:()BaseBoard forKey:
{
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    objc_msgSend(v6, "numberWithInteger:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v8, v7);

  }
}

- (void)intents_setPlistSafeObject:()BaseBoard forKey:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "absoluteString");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
    v6 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {

LABEL_13:
      objc_msgSend(a1, "setObject:forKey:", v6, v8);
      goto LABEL_14;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_13;
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315650;
      v13 = "-[NSMutableDictionary(BaseBoard) intents_setPlistSafeObject:forKey:]";
      v14 = 2114;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      _os_log_fault_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_FAULT, "%s Unsupported plistable type attempting to be encoded for key [%{public}@]: %@", (uint8_t *)&v12, 0x20u);
    }
  }
LABEL_14:

}

- (void)intents_setBoolIfTrue:()BaseBoard forKey:
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a4;
    objc_msgSend(v5, "numberWithBool:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v7, v6);

  }
}

- (uint64_t)intents_setWidgetPlistRepresentable:()BaseBoard forKey:error:
{
  return objc_msgSend(a1, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", a3, a4, 0, a5);
}

- (void)intents_setWidgetPlistRepresentable:()BaseBoard forKey:parameters:error:
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v10 = a4;
  v14 = 0;
  objc_msgSend(a3, "widgetPlistableRepresentationWithParameters:error:", a5, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  v13 = v12;
  if (v12)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v12);
  }
  else
  {
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v11, v10);
  }

}

- (uint64_t)intents_setArrayOfWidgetPlistRepresentable:()BaseBoard forKey:error:
{
  return objc_msgSend(a1, "intents_setArrayOfWidgetPlistRepresentable:forKey:parameters:error:", a3, a4, 0, a5);
}

- (void)intents_setArrayOfWidgetPlistRepresentable:()BaseBoard forKey:parameters:error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD *v19;
  id v20;

  v19 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "count");
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15, v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v16, "widgetPlistableRepresentationWithParameters:error:", v11, &v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;

      if (v18)
        break;
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v17, v15);

      if (v14 == ++v15)
        goto LABEL_5;
    }
    if (v19)
      *v19 = objc_retainAutorelease(v18);

  }
  else
  {
LABEL_5:
    objc_msgSend(a1, "intents_setPlistSafeObject:forKey:", v12, v10, v19);
  }

}

@end
