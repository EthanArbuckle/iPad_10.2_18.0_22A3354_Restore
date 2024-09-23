@implementation HKCorrelation(WDExtensions)

- (void)deleteObjectWithHealthStore:()WDExtensions options:completion:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "objects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObject:", a1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_deleteObjects:options:completion:", v12, a4, v8);
}

@end
