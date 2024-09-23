@implementation FeatureProvider

- (NSSet)featureNames
{
  void *v2;

  sub_227327E18((uint64_t)&unk_24EF9A0F8);
  swift_arrayDestroy();
  v2 = (void *)sub_22758E5A4();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  if (sub_22758E1E4() == 0x6567616D69 && v4 == 0xE500000000000000 || (sub_22758EE50() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)self->image;
    v7 = (void *)objc_opt_self();
    swift_retain();
    v5 = objc_msgSend(v7, sel_featureValueWithPixelBuffer_, v6);
    swift_release();
  }
  swift_bridgeObjectRelease();
  return v5;
}

@end
