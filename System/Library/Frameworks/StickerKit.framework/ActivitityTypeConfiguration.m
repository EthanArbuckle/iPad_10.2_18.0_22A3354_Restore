@implementation ActivitityTypeConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_TtC10StickerKit27ActivitityTypeConfiguration)initWithBSXPCCoder:(id)a3
{
  _TtC10StickerKit27ActivitityTypeConfiguration *v4;
  _TtC10StickerKit27ActivitityTypeConfiguration *v5;

  swift_unknownObjectRetain();
  sub_23467C758(a3);
  v5 = v4;
  swift_unknownObjectRelease();
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  _TtC10StickerKit27ActivitityTypeConfiguration *v5;
  void *v6;
  void *v7;

  swift_beginAccess();
  swift_unknownObjectRetain();
  v5 = self;
  swift_bridgeObjectRetain();
  v6 = (void *)sub_234717730();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_234717730();
  objc_msgSend(a3, sel_encodeObject_forKey_, v6, v7);
  swift_unknownObjectRelease();

}

- (BOOL)isEqual:(id)a3
{
  _TtC10StickerKit27ActivitityTypeConfiguration *v4;
  _TtC10StickerKit27ActivitityTypeConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_234717ED4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = ActivitityTypeConfiguration.isEqual(_:)((uint64_t)v8);

  sub_2345B0988((uint64_t)v8, &qword_256176510);
  return v6 & 1;
}

- (_TtC10StickerKit27ActivitityTypeConfiguration)init
{
  _TtC10StickerKit27ActivitityTypeConfiguration *result;

  result = (_TtC10StickerKit27ActivitityTypeConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
