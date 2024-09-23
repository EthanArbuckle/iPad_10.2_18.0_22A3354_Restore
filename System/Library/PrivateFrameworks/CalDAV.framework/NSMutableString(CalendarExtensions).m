@implementation NSMutableString(CalendarExtensions)

- (void)replaceOccurrencesOfString:()CalendarExtensions withString:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(a1, "length"));

}

- (void)searchAndReplaceInString:()CalendarExtensions withString:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
  if (objc_msgSend(v8, "scanString:intoString:", v6, 0))
    objc_msgSend(v9, "appendString:", v7);
  v15 = 0;
  v10 = objc_msgSend(v8, "scanUpToString:intoString:", v6, &v15);
  v11 = v15;
  v12 = v11;
  if (v10)
  {
    do
    {
      objc_msgSend(v9, "appendString:", v12);
      if (objc_msgSend(v8, "scanString:intoString:", v6, 0))
        objc_msgSend(v9, "appendString:", v7);
      v15 = v12;
      v13 = objc_msgSend(v8, "scanUpToString:intoString:", v6, &v15);
      v14 = v15;

      v12 = v14;
    }
    while ((v13 & 1) != 0);
  }
  else
  {
    v14 = v11;
  }
  objc_msgSend(a1, "setString:", v9);

}

@end
