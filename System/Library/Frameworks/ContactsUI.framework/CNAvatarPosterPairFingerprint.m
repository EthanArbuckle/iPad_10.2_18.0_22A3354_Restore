@implementation CNAvatarPosterPairFingerprint

- (BOOL)isEqual:(id)a3
{
  _TtC10ContactsUI29CNAvatarPosterPairFingerprint *v4;
  _TtC10ContactsUI29CNAvatarPosterPairFingerprint *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_18ACCE1C0((uint64_t)v8);

  sub_18ACD1810((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC10ContactsUI29CNAvatarPosterPairFingerprint *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_18ACCE5A0();

  return v3;
}

- (_TtC10ContactsUI29CNAvatarPosterPairFingerprint)init
{
  _TtC10ContactsUI29CNAvatarPosterPairFingerprint *result;

  result = (_TtC10ContactsUI29CNAvatarPosterPairFingerprint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairFingerprint_avatarFingerprint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairFingerprint_posterFingerprint));
}

@end
