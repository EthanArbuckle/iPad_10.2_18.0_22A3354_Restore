@implementation MADMultiModalResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalResult)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MADMultiModalResult;
  return -[MADMultiModalResult init](&v4, sel_init, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>"), v5, self);

  return v3;
}

@end
