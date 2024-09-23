@implementation IDSAccount(MSPExtras)

- (id)_msp_validityDescription
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(a1, "accountType") == 1)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v4 = v3;
  if (objc_msgSend(a1, "isActive"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  if (objc_msgSend(a1, "canSend"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("isAppleID: %@, isActive: %@, canSend: %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
