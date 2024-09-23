@implementation PADPrintReplayS2ModelInput

- (NSSet)featureNames
{
  uint64_t inited;
  void *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D27EC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_213C14E40;
  *(_QWORD *)(inited + 32) = 0x6567616D69;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  sub_213C11BFC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3 = (void *)sub_213C12714();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (sub_213C1260C() == 0x6567616D69 && v4 == 0xE500000000000000 || (sub_213C12A14() & 1) != 0)
  {
    v5 = *(_QWORD *)self->image;
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
