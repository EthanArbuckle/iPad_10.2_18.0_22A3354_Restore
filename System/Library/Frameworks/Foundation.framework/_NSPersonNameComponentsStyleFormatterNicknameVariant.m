@implementation _NSPersonNameComponentsStyleFormatterNicknameVariant

- (id)orderedTemplate
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("nickname");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (id)keysOfInterest
{
  id result;

  result = self->super._keysOfInterest;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("nickname"), 0);
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)abbreviatedKeys
{
  return 0;
}

@end
