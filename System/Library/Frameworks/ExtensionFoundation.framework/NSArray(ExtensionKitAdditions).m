@implementation NSArray(ExtensionKitAdditions)

- (id)_EX_objectAtIndex:()ExtensionKitAdditions ofClass:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)_EX_dictionaryAtIndex:()ExtensionKitAdditions
{
  return objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, objc_opt_class());
}

- (uint64_t)_EX_arrayAtIndex:()ExtensionKitAdditions
{
  return objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, objc_opt_class());
}

- (uint64_t)_EX_stringAtIndex:()ExtensionKitAdditions
{
  return objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, objc_opt_class());
}

- (uint64_t)_EX_BOOLAtIndex:()ExtensionKitAdditions
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)_EX_BOOLAtIndex:()ExtensionKitAdditions defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_EX_objectAtIndex:ofClass:", a3, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

@end
