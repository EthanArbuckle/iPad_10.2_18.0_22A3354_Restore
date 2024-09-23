@implementation StreamsBookmarkCollection

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256968191;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256968191 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection *v6;
  void *v7;
  id v8;

  type metadata accessor for StreamsBookmark();
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_23A317138();
  v8 = (id)sub_23A316F7C();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection)initWithCoder:(id)a3
{
  return (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection *)StreamsBookmarkCollection.init(coder:)(a3);
}

- (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection)init
{
  _TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection *result;

  result = (_TtC26DeepThoughtBiomeFoundation25StreamsBookmarkCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
