@implementation ATArrayOfPlayedMediaItems

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256432AA3;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256432AA3 = a3;
}

- (_TtC9Archetype25ATArrayOfPlayedMediaItems)initWithPlayedMediaItems:(id)a3
{
  return (_TtC9Archetype25ATArrayOfPlayedMediaItems *)sub_236A467A4((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for ATPlayedMediaItem, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems);
}

- (id)copyWithZone:(void *)a3
{
  return sub_236A468A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems);
}

- (void)encodeWithCoder:(id)a3
{
  sub_236A469E8(self, (uint64_t)a2, a3, (uint64_t)&OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, (void (*)(void))type metadata accessor for ATPlayedMediaItem);
}

- (_TtC9Archetype25ATArrayOfPlayedMediaItems)initWithCoder:(id)a3
{
  return (_TtC9Archetype25ATArrayOfPlayedMediaItems *)sub_236A46C94(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for ATPlayedMediaItem, 0xD000000000000010, 0x8000000236A49BC0, (SEL *)&selRef_initWithPlayedMediaItems_);
}

- (NSString)description
{
  return (NSString *)sub_236A46D64(self, (uint64_t)a2, (void (*)(void))sub_236A46DBC);
}

- (_TtC9Archetype25ATArrayOfPlayedMediaItems)init
{
  _TtC9Archetype25ATArrayOfPlayedMediaItems *result;

  result = (_TtC9Archetype25ATArrayOfPlayedMediaItems *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
