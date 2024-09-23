@implementation CNPolicy(UIAdditions)

- (uint64_t)_cnui_maximumNumberOfValuesForProperty:()UIAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("birthdays")))
  {
    v5 = objc_msgSend(a1, "maximumCountOfValuesForContactProperty:", *MEMORY[0x1E0C96670]);
    v6 = objc_msgSend(a1, "maximumCountOfValuesForContactProperty:", *MEMORY[0x1E0C967A8]) + v5;
  }
  else
  {
    v6 = objc_msgSend(a1, "maximumCountOfValuesForContactProperty:", v4);
  }

  return v6;
}

@end
