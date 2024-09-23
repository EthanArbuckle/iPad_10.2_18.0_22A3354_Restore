@implementation NSArray(CNFRegUtilities)

- (id)CNFRegArrayPassingTests:()CNFRegUtilities
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v4 && (v6 = v5, objc_msgSend(v4, "count")) && v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__NSArray_CNFRegUtilities__CNFRegArrayPassingTests___block_invoke;
    v12[3] = &unk_24D0752F8;
    v13 = v4;
    v8 = v7;
    v14 = v8;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
    v9 = v14;
    v10 = v8;

  }
  else
  {
    v10 = a1;
  }

  return v10;
}

- (id)CNFRegArrayPassingTest:()CNFRegUtilities
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDBCE30];
    v5 = a3;
    v6 = [v4 alloc];
    v7 = (void *)MEMORY[0x2199B8E98](v5);

    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);
    objc_msgSend(a1, "CNFRegArrayPassingTests:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
