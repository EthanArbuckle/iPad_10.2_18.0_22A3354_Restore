@implementation MFMailIntentTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D46DE0]);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setLaunchId:", *MEMORY[0x1E0D4D878]);
  if (v5)
    objc_msgSend(v4, "setSender:", v5);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTo:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCc:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBcc:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubject:", v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D46CD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserTypedContent:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0D46DE8]);
  objc_msgSend(v12, "stringForObjectValue:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedInvocationPhrase:", v13);

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D46CB8]);

  objc_msgSend(v3, "to");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D46CC8]);

  objc_msgSend(v3, "cc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D46CA8]);

  objc_msgSend(v3, "bcc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D46CA0]);

  objc_msgSend(v3, "subject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D46CC0]);

  objc_msgSend(v3, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D46CB0]);

  return v4;
}

@end
