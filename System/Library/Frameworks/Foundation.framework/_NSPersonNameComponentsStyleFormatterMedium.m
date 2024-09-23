@implementation _NSPersonNameComponentsStyleFormatterMedium

- (id)keysOfInterest
{
  id result;

  result = self->super._keysOfInterest;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("givenName"), CFSTR("familyName"), 0);
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

@end
