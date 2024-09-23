@implementation IAUtility

+ (id)lookupAppBundle:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (qword_256DFC308 != -1)
    dispatch_once(&qword_256DFC308, &unk_250F8F318);
  if (objc_msgSend_hasPrefix_(v6, v3, (uint64_t)CFSTR("com.apple."), v4, v5))
  {
    v10 = (__CFString *)v6;
  }
  else
  {
    objc_msgSend_valueForKey_((void *)qword_256DFC300, v7, (uint64_t)v6, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v10 = v11;
    else
      v10 = CFSTR("Other");

  }
  return v10;
}

+ (unint64_t)getSPIVersion
{
  return 9;
}

@end
