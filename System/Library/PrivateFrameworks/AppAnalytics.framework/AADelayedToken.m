@implementation AADelayedToken

- (void)commit
{
  void (*v2)(void);
  AADelayedToken *v3;

  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR___AADelayedToken_sealed) & 1) == 0)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR___AADelayedToken_sealed) = 1;
    v2 = *(void (**)(void))((char *)&self->super.isa + OBJC_IVAR___AADelayedToken_block);
    v3 = self;
    v2();

  }
}

- (AADelayedToken)init
{
  AADelayedToken *result;

  result = (AADelayedToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
