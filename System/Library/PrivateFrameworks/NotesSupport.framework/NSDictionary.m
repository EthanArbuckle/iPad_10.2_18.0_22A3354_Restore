@implementation NSDictionary

void __53__NSDictionary_IC__ic_prettyDescriptionWithTabLevel___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  ICDynamicCast(v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = (void *)a1[4];
  v10 = a1[5];
  if (v7)
  {
    objc_msgSend(v7, "ic_prettyDescriptionWithTabLevel:", a1[6] + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("%@%@ = %@\n"), v10, v12, v11);

  }
  else
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("%@%@ = %@\n"), v10, v12, v5);
  }

}

@end
