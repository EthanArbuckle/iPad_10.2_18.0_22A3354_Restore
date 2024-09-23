@implementation NSMutableDictionary(AVCaptureMovieFileOutputAdditions)

- (uint64_t)mfo_addEntriesFromDictionaryWithRecursion:()AVCaptureMovieFileOutputAdditions
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (void *)objc_msgSend(a3, "keyEnumerator");
  result = objc_msgSend(v5, "nextObject");
  if (result)
  {
    v7 = result;
    do
    {
      v8 = (void *)objc_msgSend(a1, "objectForKey:", v7);
      v9 = (void *)objc_msgSend(a3, "objectForKey:", v7);
      if (v8
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v8, "mfo_addEntriesFromDictionaryWithRecursion:", v9);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = (id)objc_msgSend(v9, "mutableCopy");
          v11 = a1;
        }
        else
        {
          v11 = a1;
          v10 = v9;
        }
        objc_msgSend(v11, "setObject:forKey:", v10, v7);
      }
      result = objc_msgSend(v5, "nextObject");
      v7 = result;
    }
    while (result);
  }
  return result;
}

@end
