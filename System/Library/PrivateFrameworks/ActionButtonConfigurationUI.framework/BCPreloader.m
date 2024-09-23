@implementation BCPreloader

+ (BCPreloader)shared
{
  if (qword_2563854A8 != -1)
    swift_once();
  return (BCPreloader *)(id)qword_256386290;
}

- (BCPreloader)init
{
  _OWORD *v2;
  objc_super v4;

  v2 = (_OWORD *)((char *)self + OBJC_IVAR___BCPreloader_resourceLoadToken);
  *v2 = 0u;
  v2[1] = 0u;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCPreloader_cancellableBag) = (Class)MEMORY[0x24BEE4B08];
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Preloader();
  return -[BCPreloader init](&v4, sel_init);
}

- (void)preloadResourcesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(char);
  BCPreloader *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_235E41B20;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_235E26FB8((uint64_t)v7, v6);
  sub_235E34DD0((uint64_t)v7);

}

- (void).cxx_destruct
{
  sub_235E30A00((uint64_t)self + OBJC_IVAR___BCPreloader_resourceLoadToken, &qword_2563862A0);
  swift_bridgeObjectRelease();
}

@end
