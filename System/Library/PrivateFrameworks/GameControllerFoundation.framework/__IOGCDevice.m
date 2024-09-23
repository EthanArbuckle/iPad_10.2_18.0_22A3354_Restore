@implementation __IOGCDevice

- (__IOGCDevice)initWithPort:(unsigned int)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__IOGCDevice;
  return -[GCIOService initWithPort:error:](&v5, sel_initWithPort_error_, *(_QWORD *)&a3, a4);
}

- (void)dealloc
{
  qword_1F039F7F8 = (uint64_t)"BUG IN IOGCDevice: Removal notification is still active.";
  __break(1u);
}

@end
