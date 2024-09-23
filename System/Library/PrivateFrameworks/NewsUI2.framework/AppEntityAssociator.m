@implementation AppEntityAssociator

- (AppEntityAssociator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppEntityAssociator();
  return -[AppEntityAssociator init](&v3, sel_init);
}

- (void)associateAppEntityFromHeadline:(id)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  AppEntityAssociator *v14;
  uint64_t v15;

  sub_1D610F0E4(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D6E16F64();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain_n();
  v13 = a4;
  v14 = self;
  sub_1D6E16F58();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1D65CCBAC((uint64_t)v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    sub_1D65CCBE8();
    sub_1D6E27440();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  swift_unknownObjectRelease();

}

@end
