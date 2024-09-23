@implementation MNNavigationServiceCallbackParameters

- (unint64_t)type
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: -[MNNavigationServiceCallbackParameters type] must be implemented by subclasses.", v3, 2u);
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNNavigationServiceCallbackParameters)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MNNavigationServiceCallbackParameters;
  return -[MNNavigationServiceCallbackParameters init](&v4, sel_init, a3);
}

@end
