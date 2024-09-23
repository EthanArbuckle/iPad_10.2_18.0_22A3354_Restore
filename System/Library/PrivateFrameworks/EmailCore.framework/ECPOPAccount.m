@implementation ECPOPAccount

- (int64_t)bigMessageWarningSize
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BigMessageWarningSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setBigMessageWarningSize:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (int64_t)daysAfterDownloadToDeleteMessagesFromServer
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DaysAfterDownloadToDeleteMessagesFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setDaysAfterDownloadToDeleteMessagesFromServer:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)daysAfterDownloadToDeleteMessagesFromServerIsSet
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DaysAfterDownloadToDeleteMessagesFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)deletionPolicy
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DeletionPolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setDeletionPolicy:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)hasNotFinishedFirstTimeSync
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HasNotFinishedFirstTimeSync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setHasNotFinishedFirstTimeSync:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

+ (id)standardPorts
{
  return &unk_1E7135EB8;
}

+ (id)standardSSLPorts
{
  return &unk_1E7135ED0;
}

- (int64_t)defaultPortNumber
{
  return 110;
}

- (int64_t)defaultSecurePortNumber
{
  return 995;
}

@end
