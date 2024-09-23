@implementation PodcastsArtworkDataSourceVisualIdenticalityToken

- (id)copyWithZone:(void *)a3
{
  _TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_210D0E108(v6);

  __swift_project_boxed_opaque_existential_0Tm(v6, v6[3]);
  v4 = (void *)sub_210E9352C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken *v4;
  _TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_210E93274();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_210D0E1F0((uint64_t)v8);

  sub_210C33270((uint64_t)v8, (uint64_t (*)(_QWORD))sub_210C51228);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_210D0E340();

  return v3;
}

- (id)stringRepresentation
{
  uint64_t v2;
  void *v3;

  sub_210D0E394();
  if (v2)
  {
    v3 = (void *)sub_210E92B84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken)init
{
  sub_210D0E410();
}

- (void).cxx_destruct
{
  sub_210C33270((uint64_t)self + OBJC_IVAR____TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken_artworkModel, (uint64_t (*)(_QWORD))MEMORY[0x24BE73310]);
}

@end
