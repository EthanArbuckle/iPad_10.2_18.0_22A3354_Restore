@implementation MonogramArtworkToken

- (id)copyWithZone:(void *)a3
{
  _TtC7MusicUI20MonogramArtworkToken *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_21D4B0FEC(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_21D7C5D6C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (id)stringRepresentation
{
  _TtC7MusicUI20MonogramArtworkToken *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_21D4B112C();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_21D7C50C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (_TtC7MusicUI20MonogramArtworkToken)init
{
  sub_21D4B1228();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
