@implementation NSString(MedicationVision)

- (id)normalizeForType:()MedicationVision
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByFoldingWithOptions:locale:", 128, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("abcdefghijklmnopqrstuvwxyz0123456789");
  if (a3 == 2)
    v7 = CFSTR("abcdefghijklmnopqrstuvwxyz0123456789 ");
  if (a3 == 1)
    v8 = CFSTR("abcdefghijklmnopqrstuvwxyz0123456789%");
  else
    v8 = v7;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", &stru_24EC1A5E0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
