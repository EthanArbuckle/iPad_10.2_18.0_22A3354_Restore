@implementation CNPRUISPosterConfigurationUtilities

+ (id)titleStyleAttributesForCNConfiguration:(id)a3 error:(id *)a4
{
  Class (__cdecl *v5)();
  id v6;
  Class v7;
  void *v8;
  void *v9;
  CNPRUISPosterTitleStyleAttributes *v10;

  v5 = (Class (__cdecl *)())getPRUISPosterConfigurationUtilitiesClass[0];
  v6 = a3;
  v7 = v5();
  objc_msgSend(v6, "wrappedPosterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class titleStyleAttributesForConfiguration:error:](v7, "titleStyleAttributesForConfiguration:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = -[CNPRUISPosterTitleStyleAttributes initWithPosterTitleStyleAttributes:]([CNPRUISPosterTitleStyleAttributes alloc], "initWithPosterTitleStyleAttributes:", v9);
  else
    v10 = 0;

  return v10;
}

@end
