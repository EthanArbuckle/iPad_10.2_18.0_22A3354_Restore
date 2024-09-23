@implementation NSDictionary(DESExtensions)

- (id)_fides_objectByReplacingValue:()DESExtensions withValue:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__NSDictionary_DESExtensions___fides_objectByReplacingValue_withValue___block_invoke;
  v15[3] = &unk_1E706EA98;
  v9 = v8;
  v16 = v9;
  v17 = v6;
  v18 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v18;
  v13 = v9;

  return v13;
}

@end
