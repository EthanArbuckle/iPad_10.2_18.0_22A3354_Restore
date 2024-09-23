@implementation STKAnimatedImage

- (STKAnimatedImage)initWithData:(id)a3 maxCount:(int64_t)a4 maxDimension:(double)a5 identifier:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  STKAnimatedImage *v20;
  uint64_t v22;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2561716C0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3;
  v14 = a6;
  v15 = sub_234715A08();
  v17 = v16;

  if (v14)
  {
    sub_234715A80();

    v18 = sub_234715A98();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 0, 1, v18);
  }
  else
  {
    v19 = sub_234715A98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v12, 1, 1, v19);
  }
  v20 = (STKAnimatedImage *)sub_2345CCA00(a5, v15, v17, a4, (uint64_t)v12);
  sub_2345B5D04(v15, v17);
  return v20;
}

- (STKAnimatedImage)initWithImages:(id)a3 durations:(id)a4 identifier:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2561716C0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2345B0BE8(0, (unint64_t *)&unk_256172A18);
  v9 = sub_2347178BC();
  sub_2345B0BE8(0, &qword_256170D00);
  v10 = sub_2347178BC();
  if (a5)
  {
    sub_234715A80();
    v11 = sub_234715A98();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 0, 1, v11);
  }
  else
  {
    v12 = sub_234715A98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  }
  return (STKAnimatedImage *)AnimatedImage.init(images:durations:identifier:)(v9, v10, (uint64_t)v8);
}

- (STKAnimatedImage)initWithURL:(id)a3 maxCount:(int64_t)a4 maxDimension:(double)a5 identifier:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2561716C0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2347159D8();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715990();
  if (a6)
  {
    sub_234715A80();
    v15 = sub_234715A98();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 0, 1, v15);
  }
  else
  {
    v16 = sub_234715A98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  }
  return (STKAnimatedImage *)AnimatedImage.init(url:maxCount:maxDimension:identifier:)((uint64_t)v14, a4, (uint64_t)v11, a5);
}

- (STKAnimatedImage)init
{
  STKAnimatedImage *result;

  result = (STKAnimatedImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2345CCD00((uint64_t)self + OBJC_IVAR___STKAnimatedImage_identifier);
}

@end
