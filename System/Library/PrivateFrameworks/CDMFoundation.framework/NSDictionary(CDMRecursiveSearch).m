@implementation NSDictionary(CDMRecursiveSearch)

- (BOOL)_cdm_hasKey:()CDMRecursiveSearch withValue:
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__NSDictionary_CDMRecursiveSearch___cdm_hasKey_withValue___block_invoke;
    v12[3] = &unk_24DCAD128;
    v15 = &v16;
    v13 = v6;
    v14 = v7;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
    v10 = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v10;
}

@end
