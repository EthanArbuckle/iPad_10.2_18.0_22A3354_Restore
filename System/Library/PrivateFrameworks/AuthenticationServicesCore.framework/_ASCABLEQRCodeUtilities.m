@implementation _ASCABLEQRCodeUtilities

- (_TtC26AuthenticationServicesCore23_ASCABLEQRCodeUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[_ASCABLEQRCodeUtilities init](&v3, sel_init);
}

+ (BOOL)isPasskeyURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v14;

  v3 = sub_20E6E9BC0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E6E9B78();
  sub_20E6E9BA8();
  if (v7)
  {
    v8 = sub_20E6EA214();
    v10 = v9;
    swift_bridgeObjectRelease();
    if (v8 == 1868851558 && v10 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      v12 = 1;
    }
    else
    {
      v12 = sub_20E6EA8EC();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v12 & 1;
}

+ (BOOL)isPasskeyRegistrationURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  uint64_t v9;

  v3 = sub_20E6E9BC0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E6E9B78();
  v7 = _s26AuthenticationServicesCore23_ASCABLEQRCodeUtilitiesC13passkeURLType4fromSo010_ASPasskeyG0V10Foundation3URLV_tFZ_0((uint64_t)v6) == 2;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (int64_t)passkeyURLTypeFromURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int64_t v7;
  uint64_t v9;

  v3 = sub_20E6E9BC0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E6E9B78();
  v7 = _s26AuthenticationServicesCore23_ASCABLEQRCodeUtilitiesC13passkeURLType4fromSo010_ASPasskeyG0V10Foundation3URLV_tFZ_0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

@end
