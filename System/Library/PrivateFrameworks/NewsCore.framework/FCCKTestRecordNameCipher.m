@implementation FCCKTestRecordNameCipher

- (id)encryptRecordName:(id)a3 withKey:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithData:encoding:", v6, 4);

  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decryptRecordName:(id)a3 withKey:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithData:encoding:", v6, 4);

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v8, &stru_1E464BC40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
