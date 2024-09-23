@implementation __NSCFCalendar

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("__NSCFCalendar should not be encoded directly"), 0));
}

- (__NSCFCalendar)initWithCoder:(id)a3
{

  return (__NSCFCalendar *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCoder:", a3);
}

@end
