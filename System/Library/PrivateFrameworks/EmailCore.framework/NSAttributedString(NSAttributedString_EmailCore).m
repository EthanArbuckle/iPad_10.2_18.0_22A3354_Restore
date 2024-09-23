@implementation NSAttributedString(NSAttributedString_EmailCore)

+ (id)ec_emailAttributedStringWithString:()NSAttributedString_EmailCore andEmailAddress:
{
  __CFString *v5;
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    v14 = CFSTR("ECEmailAddressAttributedStringKey");
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v9 = v5;
    else
      v9 = &stru_1E7123500;
    v10 = (void *)objc_msgSend(v7, "initWithString:attributes:", v9, v8);

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v5)
      v12 = v5;
    else
      v12 = &stru_1E7123500;
    v10 = (void *)objc_msgSend(v11, "initWithString:", v12);
  }

  return v10;
}

@end
