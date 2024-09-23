@implementation AADataEventTraits

- (AADataEventTraits)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___AADataEventTraits_onlyOnce) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___AADataEventTraits_unique) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___AADataEventTraits_discardWhenPresent) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BridgedDataEventTraits();
  return -[AADataEventTraits init](&v3, sel_init);
}

- (BOOL)onlyOnce
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_onlyOnce;
  swift_beginAccess();
  return *v2;
}

- (void)setOnlyOnce:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_onlyOnce;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)unique
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_unique;
  swift_beginAccess();
  return *v2;
}

- (void)setUnique:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_unique;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)discardWhenPresent
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_discardWhenPresent;
  swift_beginAccess();
  return *v2;
}

- (void)setDiscardWhenPresent:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AADataEventTraits_discardWhenPresent;
  swift_beginAccess();
  *v4 = a3;
}

@end
