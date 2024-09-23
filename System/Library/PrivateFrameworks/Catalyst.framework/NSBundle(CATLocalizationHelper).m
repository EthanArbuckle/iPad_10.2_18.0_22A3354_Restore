@implementation NSBundle(CATLocalizationHelper)

- (id)cat_localizedStringsForKey:()CATLocalizationHelper value:table:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CATLocalizationHelper helperForBundle:](CATLocalizationHelper, "helperForBundle:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringsForKey:value:table:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
