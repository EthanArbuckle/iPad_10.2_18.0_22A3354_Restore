@implementation IMActionComposeAudio

- (NSString)phoneNumber
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (IMActionComposeAudio)initWithPhoneNumber:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  objc_super v8;

  v4 = sub_19E36F888();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionComposeAudio_phoneNumber);
  *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)IMActionComposeAudio;
  return -[IMActionComposeAudio init](&v8, sel_init);
}

- (IMActionComposeAudio)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionComposeAudio *)IMActionComposeAudio.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  uint64_t inited;
  IMActionComposeAudio *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  sub_19E247E74(&qword_1EE5019B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19E381BA0;
  *(_QWORD *)(inited + 32) = 0x6D754E656E6F6870;
  *(_QWORD *)(inited + 40) = 0xEB00000000726562;
  v4 = self;
  v5 = -[IMActionComposeAudio phoneNumber](v4, sel_phoneNumber);
  v6 = sub_19E36F888();
  v8 = v7;

  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 56) = v8;
  sub_19E32D864(inited);

  v9 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v9;
}

- (IMActionComposeAudio)init
{
  IMActionComposeAudio *result;

  result = (IMActionComposeAudio *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
