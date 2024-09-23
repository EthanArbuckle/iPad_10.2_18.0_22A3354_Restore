@implementation IMDXMSUtilities

+ (id)calculateFallbackHashFragmentFor:(id)a3
{
  __CFString *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = IMDCTPartDictionaryContentLocationKey;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SMSCopySanitizedContentLocation(v5);

  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", IMDCTPartDictionaryContentDataKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("|%@(%llu)"), v7, objc_msgSend(v8, "length") / 0x64uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
