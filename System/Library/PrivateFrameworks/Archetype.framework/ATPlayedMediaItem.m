@implementation ATPlayedMediaItem

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256432AA2;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256432AA2 = a3;
}

- (_TtC9Archetype17ATPlayedMediaItem)initWithTitle:(id)a3 artist:(id)a4 album:(id)a5 link:(id)a6 bundleID:(id)a7 mediaType:(id)a8 playTime:(double)a9
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  objc_super v35;

  v34 = sub_236A48E98();
  v12 = v11;
  v13 = sub_236A48E98();
  v15 = v14;
  v16 = sub_236A48E98();
  v18 = v17;
  v19 = sub_236A48E98();
  v21 = v20;
  v22 = sub_236A48E98();
  v24 = v23;
  v25 = sub_236A48E98();
  v26 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
  *v26 = v34;
  v26[1] = v12;
  v27 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist);
  *v27 = v13;
  v27[1] = v15;
  v28 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album);
  *v28 = v16;
  v28[1] = v18;
  v29 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link);
  *v29 = v19;
  v29[1] = v21;
  v30 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID);
  *v30 = v22;
  v30[1] = v24;
  v31 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  *v31 = v25;
  v31[1] = v32;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime) = a9;
  v35.receiver = self;
  v35.super_class = (Class)type metadata accessor for ATPlayedMediaItem();
  return -[ATPlayedMediaItem init](&v35, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  _TtC9Archetype17ATPlayedMediaItem *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_236A452DC(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_236A48F88();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9Archetype17ATPlayedMediaItem *v5;

  v4 = a3;
  v5 = self;
  sub_236A454D4(v4);

}

- (_TtC9Archetype17ATPlayedMediaItem)initWithCoder:(id)a3
{
  return (_TtC9Archetype17ATPlayedMediaItem *)ATPlayedMediaItem.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_236A46D64(self, (uint64_t)a2, (void (*)(void))sub_236A45BA4);
}

- (_TtC9Archetype17ATPlayedMediaItem)init
{
  _TtC9Archetype17ATPlayedMediaItem *result;

  result = (_TtC9Archetype17ATPlayedMediaItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
