@implementation BlastDoorNickname

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for Nickname, &OBJC_IVAR___BlastDoorNickname_nickname);
}

- (NSString)firstName
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorNickname_nickname);
}

- (NSString)lastName
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorNickname_nickname);
}

- (BlastDoorAvatarImage)avatar
{
  BlastDoorNickname *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BC044();

  return (BlastDoorAvatarImage *)v3;
}

- (BlastDoorWallpaper)wallpaper
{
  BlastDoorNickname *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4BC164();

  return (BlastDoorWallpaper *)v3;
}

- (BlastDoorMorphology)pronouns
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  char *v10;
  BlastDoorNickname *v11;
  objc_super v13;

  v2 = (char *)self + OBJC_IVAR___BlastDoorNickname_nickname;
  v3 = &v2[*(int *)(type metadata accessor for Nickname(0) + 32)];
  v4 = *((_QWORD *)v3 + 1);
  if (v4)
  {
    v5 = *(_QWORD *)v3;
    v6 = *(_QWORD *)v3 >> 8;
    v7 = *(_QWORD *)v3 >> 16;
    v8 = (objc_class *)type metadata accessor for _ObjCMorphologyWrapper();
    v9 = (char *)objc_allocWithZone(v8);
    v10 = &v9[OBJC_IVAR___BlastDoorMorphology_morphology];
    *v10 = v5;
    v10[1] = v6;
    v10[2] = v7;
    *((_QWORD *)v10 + 1) = v4;
    v13.receiver = v9;
    v13.super_class = v8;
    swift_bridgeObjectRetain();
    v11 = -[BlastDoorNickname init](&v13, sel_init);
  }
  else
  {
    v11 = 0;
  }
  return (BlastDoorMorphology *)v11;
}

- (BlastDoorNickname)init
{
  BlastDoorNickname *result;

  result = (BlastDoorNickname *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorNickname_nickname, type metadata accessor for Nickname);
}

@end
