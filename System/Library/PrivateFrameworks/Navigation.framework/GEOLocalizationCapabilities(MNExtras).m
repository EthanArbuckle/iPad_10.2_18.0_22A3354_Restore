@implementation GEOLocalizationCapabilities(MNExtras)

+ (id)supportedPhoneticTypesForPhoneticLocaleID:()MNExtras
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("fr-FR")))
    objc_msgSend(v4, "addObject:", &unk_1E620EF00);
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("en-IN")))
    v5 = &unk_1E620EF00;
  else
    v5 = &unk_1E620EF18;
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(v4, "addObject:", &unk_1E620EF30);

  return v4;
}

@end
