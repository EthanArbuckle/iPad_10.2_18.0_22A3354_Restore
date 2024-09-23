@implementation RBDisplayListDecoderDelegate

- (id)decodedImageContentsWithData:(id)a3 type:(int *)a4 error:(id *)a5
{
  id v7;
  _TtC7SwiftUI28RBDisplayListDecoderDelegate *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  Class v12;

  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  v12 = RBDisplayListDecoderDelegate.decodedImageContents(data:type:)(v9, v11, a4);
  outlined consume of Data._Representation(v9, v11);
  return v12;
}

- (CGFont)decodedCGFontWithData:(id)a3 error:(id *)a4
{
  id v5;
  _TtC7SwiftUI28RBDisplayListDecoderDelegate *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  CGFontRef v11;
  void *v12;
  _QWORD v14[7];

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  outlined copy of Data._Representation(v7, v9);
  ProtobufDecoder.init(_:)(v7, v9);
  v10 = *(_QWORD *)&v6->decoder[OBJC_IVAR____TtC7SwiftUI28RBDisplayListDecoderDelegate_decoder + 40];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14[6] = v10;
  v11 = specialized CodableCGFont.init(from:)((uint64_t)v14);
  v12 = (void *)v14[0];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined consume of Data._Representation(v7, v9);
  return v11;
}

- (_TtC7SwiftUI28RBDisplayListDecoderDelegate)init
{
  _TtC7SwiftUI28RBDisplayListDecoderDelegate *result;

  result = (_TtC7SwiftUI28RBDisplayListDecoderDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI28RBDisplayListDecoderDelegate_decoder);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
