@implementation CHSReplicatedDescriptorsBox

+ (BOOL)supportsSecureCoding
{
  return byte_1EFC8D390;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EFC8D390 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  CHSReplicatedDescriptorsBox *v6;
  void *v7;
  id v8;

  sub_1D2728FEC(0, &qword_1ED9566C0);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D29C5B74();
  swift_bridgeObjectRetain();
  v8 = (id)sub_1D29C59C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (CHSReplicatedDescriptorsBox)initWithCoder:(id)a3
{
  id v3;
  CHSReplicatedDescriptorsBox *v4;

  v3 = a3;
  v4 = (CHSReplicatedDescriptorsBox *)sub_1D27B60AC();

  return v4;
}

- (CHSReplicatedDescriptorsBox)init
{
  CHSReplicatedDescriptorsBox *result;

  result = (CHSReplicatedDescriptorsBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
