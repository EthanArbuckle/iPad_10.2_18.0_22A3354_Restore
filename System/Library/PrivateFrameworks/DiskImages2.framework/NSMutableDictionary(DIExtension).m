@implementation NSMutableDictionary(DIExtension)

- (id)popObjectForKey:()DIExtension
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectForKey:", v4);

  return v5;
}

- (uint64_t)validateAndPopObjectForKey:()DIExtension className:isOptional:error:
{
  id v10;
  uint64_t v11;
  id v12;

  v10 = a3;
  v11 = objc_msgSend(a1, "validateObjWithKey:className:isOptional:error:", v10, a4, a5, a6);
  v12 = (id)objc_msgSend(a1, "popObjectForKey:", v10);

  return v11;
}

- (uint64_t)validateObjWithKey:()DIExtension className:isOptional:error:
{
  id v9;
  void *v10;
  void *v11;

  v9 = a3;
  objc_msgSend(a1, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    isKindOfClass = objc_opt_isKindOfClass();
  if (a6 && (isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Validation failed for dictionary key %@."), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError errorWithPOSIXCode:verboseInfo:](DIError, "errorWithPOSIXCode:verboseInfo:", 22, v11);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return isKindOfClass & 1;
}

@end
