@implementation CNUIVCardUtilities

+ (id)fileNameForContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VCARD_DEFAULT_FILE_NAME"), &stru_1E20507A8, CFSTR("Localized"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.vcf"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
