@implementation FamilyMemberAccountDetailsViewModel

- (_TtC14FamilyCircleUI35FamilyMemberAccountDetailsViewModel)init
{
  _QWORD *v3;
  uint64_t v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC14FamilyCircleUI35FamilyMemberAccountDetailsViewModel_hearbeatTokenKey);
  *v3 = 0xD000000000000014;
  v3[1] = 0x800000020E09DE90;
  v4 = OBJC_IVAR____TtC14FamilyCircleUI35FamilyMemberAccountDetailsViewModel_familyDependentPasswordResetApi;
  type metadata accessor for FamilyDependentPasswordResetApi();
  v5 = (objc_class *)swift_allocObject();
  *((_QWORD *)v5 + 2) = 0;
  *(Class *)((char *)&self->super.isa + v4) = v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FamilyMemberAccountDetailsViewModel();
  return -[FamilyMemberAccountDetailsViewModel init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
