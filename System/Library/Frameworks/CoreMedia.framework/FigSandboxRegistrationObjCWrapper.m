@implementation FigSandboxRegistrationObjCWrapper

- (FigSandboxRegistrationObjCWrapper)initWithRegistration:(FigOpaqueSandboxRegistration *)a3
{
  FigSandboxRegistrationObjCWrapper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigSandboxRegistrationObjCWrapper;
  v4 = -[FigSandboxRegistrationObjCWrapper init](&v6, sel_init);
  v4->sandboxreg = (FigOpaqueSandboxRegistration *)CFRetain(a3);
  return v4;
}

- (FigOpaqueSandboxRegistration)_sandboxRegistration
{
  return self->sandboxreg;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->sandboxreg);
  self->sandboxreg = 0;
  v3.receiver = self;
  v3.super_class = (Class)FigSandboxRegistrationObjCWrapper;
  -[FigSandboxRegistrationObjCWrapper dealloc](&v3, sel_dealloc);
}

@end
