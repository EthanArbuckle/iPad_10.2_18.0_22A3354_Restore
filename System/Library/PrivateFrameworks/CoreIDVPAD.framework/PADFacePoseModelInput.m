@implementation PADFacePoseModelInput

- (NSSet)featureNames
{
  void *v2;

  sub_213C11BFC((uint64_t)&unk_24D0CF510);
  swift_arrayDestroy();
  v2 = (void *)sub_213C12714();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (sub_213C1260C() == 0xD000000000000011 && v4 == 0x8000000213C17450 || (sub_213C12A14() & 1) != 0)
  {
    v5 = *(_QWORD *)self->image_Placeholder;
    v6 = (void *)objc_opt_self();
    swift_retain();
    v7 = objc_msgSend(v6, sel_featureValueWithPixelBuffer_, v5);
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

@end
