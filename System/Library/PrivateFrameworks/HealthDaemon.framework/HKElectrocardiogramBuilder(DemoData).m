@implementation HKElectrocardiogramBuilder(DemoData)

+ (id)builderFromDemoDataFile:()DemoData startDate:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB6648];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithDataFileName:", v7);

  v9 = (void *)objc_msgSend(v8, "newBuilderWithStartDate:", v6);
  return v9;
}

@end
