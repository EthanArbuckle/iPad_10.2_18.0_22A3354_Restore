@implementation NSObject(NFAdditions)

+ (uint64_t)nf_object:()NFAdditions isEqualToObject:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    if (v5)
    {
      v6 = v5;
      v8 = v7;
    }
    else
    {
      if (!v6)
      {
        v9 = 0;
        goto LABEL_8;
      }
      v8 = 0;
    }
    v9 = objc_msgSend(v6, "isEqual:", v8);
  }
LABEL_8:

  return v9;
}

+ (uint64_t)nf_compareObject:()NFAdditions toObject:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 0;
  }
  else if (v5)
  {
    if (v6)
      v8 = objc_msgSend(v5, "compare:", v6);
    else
      v8 = 1;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

@end
