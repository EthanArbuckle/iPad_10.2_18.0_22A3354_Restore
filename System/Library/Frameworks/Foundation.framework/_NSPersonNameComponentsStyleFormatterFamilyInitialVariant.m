@implementation _NSPersonNameComponentsStyleFormatterFamilyInitialVariant

- (int64_t)shortNameFormat
{
  return 1;
}

- (id)keysOfInterest
{
  id result;

  result = self->super.super._keysOfInterest;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("familyName"), CFSTR("givenName"), 0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)abbreviatedKeys
{
  id result;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  result = self->super.super._abbreviatedKeys;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5[0] = CFSTR("familyName");
    result = (id)objc_msgSend(v4, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
    self->super.super._abbreviatedKeys = (NSSet *)result;
  }
  return result;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  uint64_t v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_NSPersonNameComponentsStyleFormatterFamilyInitialVariant;
  LODWORD(v4) = -[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](&v6, sel_fullComponentsAreValid_);
  if ((_DWORD)v4)
  {
    v4 = objc_msgSend(a3, "familyName");
    if (v4)
      LOBYTE(v4) = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "givenName"), "length") > 1;
  }
  return v4;
}

@end
