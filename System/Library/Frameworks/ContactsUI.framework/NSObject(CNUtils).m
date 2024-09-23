@implementation NSObject(CNUtils)

- (void)cn_updateDictionaryForKey:()CNUtils withChanges:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a4;
  v6 = a3;
  objc_msgSend(a1, "valueForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__NSObject_CNUtils__cn_updateDictionaryForKey_withChanges___block_invoke;
  v11[3] = &unk_1E204EC60;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(a1, "setValue:forKey:", v9, v6);

}

@end
