@implementation NSKeyedUnarchiver(Intents)

+ (id)_in_safeUnarchivedObjectOfClasses:()Intents fromData:error:
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0CB3710];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initForReadingFromData:error:", v8, a5);

  objc_msgSend(v10, "_allowDecodingCyclesInSecureMode");
  objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "finishDecoding");
  return v11;
}

+ (id)_in_safeUnarchivedObjectOfClass:()Intents fromData:error:
{
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x1E0CB3710];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initForReadingFromData:error:", v8, a5);

  objc_msgSend(v9, "_allowDecodingCyclesInSecureMode");
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", a3, *MEMORY[0x1E0CB2CD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishDecoding");

  return v10;
}

@end
