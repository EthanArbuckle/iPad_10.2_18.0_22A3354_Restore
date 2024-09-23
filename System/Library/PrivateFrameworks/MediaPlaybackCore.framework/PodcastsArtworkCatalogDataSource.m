@implementation PodcastsArtworkCatalogDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  id v4;
  _TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_210D0CDB8(v4);

  return self & 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  _TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_210D0CEAC(v4);
  v7 = v6;

  return v7;
}

- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  MPArtworkCatalog *v8;
  _TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_210C336D8((uint64_t)&unk_254A801D8, (uint64_t)v7);
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4;
  _TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_210D0DAC4(v4);
  v7 = v6;

  return v7;
}

- (_TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource)init
{
  _TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource *result;

  sub_210D0DF3C();
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource_artworkLoader;
  v4 = sub_210E925FC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource_storeArtworkDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource_cache));
}

@end
