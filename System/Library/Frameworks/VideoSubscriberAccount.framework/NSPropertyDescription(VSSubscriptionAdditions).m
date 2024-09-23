@implementation NSPropertyDescription(VSSubscriptionAdditions)

- (void)vs_setUserInfoValue:()VSSubscriptionAdditions forKey:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v10)
  {
    objc_msgSend(v8, "setObject:forKey:", v10, v6);
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v8, "removeObjectForKey:", v6);
  }
  objc_msgSend(a1, "setUserInfo:", v8);

}

- (id)vs_subscriptionKeyPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("VSSubscriptionKeyPathUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)vs_setSubscriptionKeyPath:()VSSubscriptionAdditions
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, CFSTR("VSSubscriptionKeyPathUserInfoKey"));

}

- (uint64_t)vs_suitablePurposes
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("VSSubscriptionSuitablePurposesInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 7;

  return v3;
}

- (void)vs_setSuitablePurposes:()VSSubscriptionAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v2, CFSTR("VSSubscriptionSuitablePurposesInfoKey"));

}

- (BOOL)vs_isSuitableForPurpose:()VSSubscriptionAdditions
{
  return (objc_msgSend(a1, "vs_suitablePurposes") & a3) != 0;
}

- (id)vs_propertyListKey
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("VSPropertyListKeyUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)vs_setPropertyListKey:()VSSubscriptionAdditions
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, CFSTR("VSPropertyListKeyUserInfoKey"));

}

- (id)vs_propertyListValueTransformerName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("VSPropertyListValueTransformerUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)vs_setPropertyListValueTransformerName:()VSSubscriptionAdditions
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, CFSTR("VSPropertyListValueTransformerUserInfoKey"));

}

- (id)vs_propertyListValueTransformer
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "vs_propertyListValueTransformerName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)vs_JSONKey
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("VSJSONKeyUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)vs_setJSONKey:()VSSubscriptionAdditions
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, CFSTR("VSJSONKeyUserInfoKey"));

}

- (uint64_t)vs_isRequiredJSONValue
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("VSRequiredJSONValueUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)vs_setRequiredJSONValue:()VSSubscriptionAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v2, CFSTR("VSRequiredJSONValueUserInfoKey"));

}

- (id)vs_expectedJSONValueClasses
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("VSExpectedJSONValueClassUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = NSClassFromString(*(NSString **)(*((_QWORD *)&v12 + 1) + 8 * v9));
          if (v10)
            objc_msgSend(v2, "addObject:", v10, (_QWORD)v12);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  if (!objc_msgSend(v2, "count", (_QWORD)v12))
    objc_msgSend(v2, "addObject:", objc_opt_class());

  return v2;
}

- (void)vs_setExpectedJSONValueClasses:()VSSubscriptionAdditions
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        NSStringFromClass(*(Class *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copy", (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v13, CFSTR("VSExpectedJSONValueClassUserInfoKey"));

}

- (id)vs_JSONValueTransformerName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("VSJSONValueTransformerUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)vs_setJSONValueTransformerName:()VSSubscriptionAdditions
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, CFSTR("VSJSONValueTransformerUserInfoKey"));

}

- (id)vs_JSONValueTransformer
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "vs_JSONValueTransformerName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
