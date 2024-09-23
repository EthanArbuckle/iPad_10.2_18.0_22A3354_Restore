@implementation NSMutableDictionary(DNDSBackingStoreDictionaryContext)

- (void)setDictionaryRepresentationOfRecord:()DNDSBackingStoreDictionaryContext forKey:context:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v14 = (id)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v8, "healingSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHealingSource:", v12);

  objc_msgSend(v10, "dictionaryRepresentationWithContext:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, v9);
}

@end
