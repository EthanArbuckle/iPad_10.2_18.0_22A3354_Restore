@implementation NSMutableDictionary(EmailFoundationAdditions)

- (void)ef_setOptionalObject:()EmailFoundationAdditions forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

- (void)ef_removeObjectsPassingTest:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__NSMutableDictionary_EmailFoundationAdditions__ef_removeObjectsPassingTest___block_invoke;
  v8[3] = &unk_1E62A6418;
  v7 = v4;
  v9 = v7;
  objc_msgSend(a1, "keysOfEntriesPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "removeObjectsForKeys:", v6);
}

@end
