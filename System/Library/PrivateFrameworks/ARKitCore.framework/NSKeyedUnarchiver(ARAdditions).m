@implementation NSKeyedUnarchiver(ARAdditions)

+ (id)ar_unarchivedObjectOfClasses:()ARAdditions fromData:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend([a1 alloc], "initForReadingFromData:error:", v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setRequiresSecureCoding:", 1);
    objc_msgSend(v11, "setDecodingFailurePolicy:", 0);
    objc_msgSend(v11, "decodeTopLevelObjectOfClasses:forKey:error:", v8, *MEMORY[0x1E0CB2CD0], a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)ar_unarchivedObjectOfClass:()ARAdditions fromData:error:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ar_unarchivedObjectOfClasses:fromData:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
