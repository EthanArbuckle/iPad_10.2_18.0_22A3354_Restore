@implementation MonogramArtworkDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC7MusicUI25MonogramArtworkDataSource *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_21CFFF6E4(v7, v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);

}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  _TtC7MusicUI25MonogramArtworkDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_21D00000C();

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4;
  _TtC7MusicUI25MonogramArtworkDataSource *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_21D000078(v4);

  return v6;
}

- (_TtC7MusicUI25MonogramArtworkDataSource)init
{
  return (_TtC7MusicUI25MonogramArtworkDataSource *)sub_21D00052C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI25MonogramArtworkDataSource____lazy_storage___monogramRenderer));
  swift_unknownObjectRelease();

}

@end
