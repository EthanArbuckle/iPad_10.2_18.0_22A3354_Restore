@implementation NSMutableDictionary(FMAdditions)

- (void)fm_safeSetObject:()FMAdditions forKey:
{
  if (a3)
  {
    if (a4)
      return (void *)objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

- (id)fm_objectForKey:()FMAdditions withDefaultValue:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, v6);
  }

  return v8;
}

- (void)fm_safelySetObject:()FMAdditions forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
  {
    if (v7)
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, v6);
    else
      objc_msgSend(a1, "removeObjectForKey:", v6);
  }

}

- (void)fm_safelyMapKey:()FMAdditions toObject:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
  {
    if (v6)
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, v7);
    else
      objc_msgSend(a1, "removeObjectForKey:", v7);
  }

}

@end
