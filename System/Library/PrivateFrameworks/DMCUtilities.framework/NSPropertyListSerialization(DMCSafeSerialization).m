@implementation NSPropertyListSerialization(DMCSafeSerialization)

+ (id)DMCSafePropertyListWithData:()DMCSafeSerialization options:format:error:
{
  id v10;
  void *v11;

  v10 = a3;
  if (v10)
  {
    objc_msgSend(a1, "propertyListWithData:options:format:error:", v10, a4, a5, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
