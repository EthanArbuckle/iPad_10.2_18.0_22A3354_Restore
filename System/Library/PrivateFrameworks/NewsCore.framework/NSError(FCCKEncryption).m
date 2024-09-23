@implementation NSError(FCCKEncryption)

+ (uint64_t)fc_encryptionErrorWithCode:()FCCKEncryption
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.encryption"), a3, 0);
}

+ (id)fc_encryptionErrorWithCode:()FCCKEncryption description:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.encryption"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fc_encryptionErrorWithCode:()FCCKEncryption descriptionFormat:
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v17 = *MEMORY[0x1E0CB2D50];
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.encryption"), a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
