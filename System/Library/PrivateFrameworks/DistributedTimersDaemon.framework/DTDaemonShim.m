@implementation DTDaemonShim

- (void)activate
{
  DTDaemonShim *v2;

  v2 = self;
  sub_23A598F00();

}

- (DTDaemonShim)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTDaemonShim__daemon) = 0;
  v3.receiver = self;
  v3.super_class = (Class)DTDaemonShim;
  return -[DTDaemonShim init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
