@implementation IOSurfaceWiringAssertion

- (IOSurfaceWiringAssertion)initWithIOSurface:(id)a3
{
  return -[IOSurfaceWiringAssertion initWithIOSurfaceClient:](self, "initWithIOSurfaceClient:", *((_QWORD *)a3 + 1));
}

- (void)dealloc
{
  mach_port_name_t mach_port;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  mach_port = self->_mach_port;
  if (mach_port)
  {
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], mach_port, 0, -1);
    self->_mach_port = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceWiringAssertion;
  -[IOSurfaceWiringAssertion dealloc](&v4, sel_dealloc);
}

- (IOSurfaceWiringAssertion)initWithIOSurfaceClient:(__IOSurfaceClient *)a3
{
  IOSurfaceWiringAssertion *v4;
  unsigned int MachPortWithOptions;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)IOSurfaceWiringAssertion;
  v4 = -[IOSurfaceWiringAssertion init](&v7, sel_init);
  MachPortWithOptions = IOSurfaceClientCreateMachPortWithOptions((uint64_t)a3, 1uLL);
  v4->_mach_port = MachPortWithOptions;
  if (!MachPortWithOptions)
  {

    return 0;
  }
  return v4;
}

@end
