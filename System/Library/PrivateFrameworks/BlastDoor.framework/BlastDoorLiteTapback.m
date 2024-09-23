@implementation BlastDoorLiteTapback

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for LiteTapback, &OBJC_IVAR___BlastDoorLiteTapback_liteTapback);
}

- (NSUUID)associatedMessageUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v3 = sub_1AD63B084();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR___BlastDoorLiteTapback_liteTapback, v3);
  v7 = (void *)sub_1AD63B060();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v7;
}

- (int64_t)associatedMessageType
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t result;
  char v6;

  v2 = (char *)self + OBJC_IVAR___BlastDoorLiteTapback_liteTapback;
  v3 = v2[*(int *)(type metadata accessor for LiteTapback(0) + 20)];
  if ((_DWORD)v3 == 15)
    v4 = 0;
  else
    v4 = v3 - 1;
  result = sub_1AD4D9B8C(v4);
  if ((v6 & 1) != 0)
    __break(1u);
  return result;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)sub_1AD4B4E7C((uint64_t)self, (uint64_t)a2, type metadata accessor for LiteTapback, &OBJC_IVAR___BlastDoorLiteTapback_liteTapback);
}

- (BlastDoorLiteTapback)init
{
  BlastDoorLiteTapback *result;

  result = (BlastDoorLiteTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorLiteTapback_liteTapback, type metadata accessor for LiteTapback);
}

@end
