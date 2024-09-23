@implementation BWFormat

+ (id)formatByResolvingRequirements:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("BWFormat is an abstract base class, you can't instantiate it directly"), 0));
}

+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("BWFormat is an abstract base class, you can't instantiate it directly"), 0));
}

- (unsigned)mediaType
{
  return 0;
}

- (opaqueCMFormatDescription)formatDescription
{
  return 0;
}

@end
