@implementation BWFormatRequirements

- (BOOL)isEmpty
{
  return -[BWFormatRequirements isEqual:](self, "isEqual:", objc_alloc_init((Class)objc_opt_class()));
}

- (BWFormatRequirements)init
{
  objc_super v4;

  if (-[BWFormatRequirements isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("BWFormatRequirements is an abstract base class, you can't instantiate it directly"), 0));
  }
  v4.receiver = self;
  v4.super_class = (Class)BWFormatRequirements;
  return -[BWFormatRequirements init](&v4, sel_init);
}

- (unsigned)mediaType
{
  return 0;
}

- (Class)formatClass
{
  if (!-[BWFormatRequirements isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("BWFormatRequirements is an abstract base class, subclasses must implement formatClass"), 0));
  return (Class)objc_opt_class();
}

@end
