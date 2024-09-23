@implementation ArtworkLoader

- (void)resourceLoaderDidBeginLoadingForReason:(id)a3
{
  sub_1D81DA700((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D81E5514);
}

- (void)resourceLoaderDidFinishLoadingForReason:(id)a3
{
  sub_1D81DA700((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1D81E5220);
}

- (void)resourceLoaderDidIdle
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);

  v3 = &self->assetObserver[7];
  swift_beginAccess();
  if (MEMORY[0x1D82AAB98](v3))
  {
    v4 = *(_QWORD *)&self->assetObserver[15];
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 24);
    swift_retain();
    v6(ObjectType, v4);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)resourceLoaderDidLoadAllForReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;

  v4 = sub_1D8215370();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D8215358();
  swift_retain();
  if (sub_1D81E5718() && (swift_beginAccess(), MEMORY[0x1D82AAB98](&self->assetObserver[7])))
  {
    v8 = *(_QWORD *)&self->assetObserver[15];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)resourceLoaderDidBeginLoading
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);

  v3 = &self->assetObserver[7];
  swift_beginAccess();
  if (MEMORY[0x1D82AAB98](v3))
  {
    v4 = *(_QWORD *)&self->assetObserver[15];
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_retain();
    v6(ObjectType, v4);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)imageRequest:(id)a3 didLoadImage:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_retain();
  sub_1D81E49D0(v5, a4, 0);

  swift_release();
}

- (void)imageRequest:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_retain();
  ArtworkLoader.imageRequest(_:didFailWithError:)(v5, v6);

  swift_release();
}

@end
