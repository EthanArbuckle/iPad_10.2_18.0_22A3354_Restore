@implementation FTConstraintsToggle

- (UIView)view
{
  return (UIView *)(id)sub_100167854();
}

- (void)setView:(id)a3
{
  id v5;
  FTConstraintsToggle *v6;

  v5 = a3;
  v6 = self;
  sub_1001678AC(a3);

}

- (NSArray)constraintsStatePrimary
{
  return (NSArray *)sub_100167AC4((uint64_t)self, (uint64_t)a2, sub_1001678EC);
}

- (void)setConstraintsStatePrimary:(id)a3
{
  sub_100167B24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100167904);
}

- (NSArray)constraintsStateSecondary
{
  return (NSArray *)sub_100167AC4((uint64_t)self, (uint64_t)a2, sub_100167B0C);
}

- (void)setConstraintsStateSecondary:(id)a3
{
  sub_100167B24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100167B8C);
}

- (BOOL)usingSecondaryConstraints
{
  return sub_100167C18() & 1;
}

- (void)setUsingSecondaryConstraints:(BOOL)a3
{
  FTConstraintsToggle *v4;

  v4 = self;
  sub_100167C68(a3);

}

- (BOOL)_usingSecondaryConstraints
{
  return sub_100167C18() & 1;
}

- (void)set_usingSecondaryConstraints:(BOOL)a3
{
  sub_100167CC0(a3);
}

- (void)updateConstraints
{
  FTConstraintsToggle *v2;

  v2 = self;
  sub_100167CD0();

}

- (void)toggle
{
  FTConstraintsToggle *v2;

  v2 = self;
  sub_100167EA4();

}

- (FTConstraintsToggle)init
{
  return (FTConstraintsToggle *)sub_100167EF8();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___FTConstraintsToggle_view);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___FTConstraintsToggle_constraintsStatePrimary));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___FTConstraintsToggle_constraintsStateSecondary));
}

@end
