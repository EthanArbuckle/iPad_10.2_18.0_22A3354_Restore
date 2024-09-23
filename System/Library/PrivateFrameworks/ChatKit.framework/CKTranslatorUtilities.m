@implementation CKTranslatorUtilities

+ (BOOL)shouldShowTranslateMenuOption:(id)a3
{
  uint64_t v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "transcriptText");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(MEMORY[0x1E0DC0910], "isAvailable");

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (BOOL)chatItemIsFromSomeoneElse:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  if (CKIsRunningInMacCatalyst() || (objc_msgSend(v3, "isFromMe") & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end
