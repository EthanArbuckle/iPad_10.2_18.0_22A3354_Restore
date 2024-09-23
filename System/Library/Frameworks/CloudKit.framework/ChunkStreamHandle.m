@implementation ChunkStreamHandle

- (_TtC8CloudKit17ChunkStreamHandle)init
{
  sub_18A63CF98();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8CloudKit17ChunkStreamHandle_downloadURL;
  v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_18A60FBA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8CloudKit17ChunkStreamHandle_key), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC8CloudKit17ChunkStreamHandle_key]);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
