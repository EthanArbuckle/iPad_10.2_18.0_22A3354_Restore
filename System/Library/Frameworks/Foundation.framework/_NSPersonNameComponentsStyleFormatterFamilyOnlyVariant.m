@implementation _NSPersonNameComponentsStyleFormatterFamilyOnlyVariant

- (int64_t)shortNameFormat
{
  return 4;
}

- (id)keysOfInterest
{
  id result;

  result = self->super.super._keysOfInterest;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("familyName"), 0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)abbreviatedKeys
{
  return 0;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  _BOOL4 v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_NSPersonNameComponentsStyleFormatterFamilyOnlyVariant;
  v4 = -[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](&v6, sel_fullComponentsAreValid_);
  if (v4)
    LOBYTE(v4) = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "familyName"), "length") > 1;
  return v4;
}

@end
