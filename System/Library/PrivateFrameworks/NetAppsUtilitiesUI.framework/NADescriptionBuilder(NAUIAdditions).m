@implementation NADescriptionBuilder(NAUIAdditions)

- (uint64_t)appendCGFloat:()NAUIAdditions withName:
{
  return objc_msgSend(a1, "appendCGFloat:withName:decimalPrecision:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)appendCGPoint:()NAUIAdditions withName:
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a2, 17, *(_QWORD *)&a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(a1, "appendObject:withName:", v9, v8);

  return a1;
}

- (void)appendCGSize:()NAUIAdditions withName:
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a2, 17, *(_QWORD *)&a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(a1, "appendObject:withName:", v9, v8);

  return a1;
}

- (void)appendCGRect:()NAUIAdditions withName:
{
  id v12;
  void *v13;
  id v14;

  v12 = a7;
  NAStringFromCGRect(a2, a3, a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(a1, "appendObject:withName:", v13, v12);

  return a1;
}

@end
