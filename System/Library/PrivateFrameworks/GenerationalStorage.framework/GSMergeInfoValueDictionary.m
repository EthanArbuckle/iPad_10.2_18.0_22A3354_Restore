@implementation GSMergeInfoValueDictionary

void __GSMergeInfoValueDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v7, "removeObjectForKey:", v5);
  else
    objc_msgSend(v7, "setObject:forKey:", v8, v5);

}

@end
