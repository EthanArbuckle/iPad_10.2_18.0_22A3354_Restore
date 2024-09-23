@implementation NSKeyedUnarchiver(HMFoundation)

+ (id)hmf_unarchivedObjectOfClass:()HMFoundation fromClassName:fromData:error:
{
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0CB3710];
  v11 = a5;
  v12 = (void *)objc_msgSend([v10 alloc], "initForReadingFromData:error:", v11, a6);

  if (v12)
  {
    objc_msgSend(v12, "setDecodingFailurePolicy:", 1);
    if (v9)
      objc_msgSend(v12, "setClass:forClassName:", a3, v9);
    objc_msgSend(v12, "decodeTopLevelObjectOfClass:forKey:error:", a3, *MEMORY[0x1E0CB2CD0], a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishDecoding");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
