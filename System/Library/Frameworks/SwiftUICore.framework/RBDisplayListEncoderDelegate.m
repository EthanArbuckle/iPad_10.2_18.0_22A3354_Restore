@implementation RBDisplayListEncoderDelegate

- (RBEncoderSet)encoderSet
{
  return (RBEncoderSet *)(id)ProtobufEncoder.rbEncoderSet.getter();
}

- (id)encodedImageData:(id)a3 error:(id *)a4
{
  void *var1;
  uint64_t v5;
  _TtC7SwiftUI28RBDisplayListEncoderDelegate *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Class isa;

  var1 = a3.var1;
  v5 = *(_QWORD *)&a3.var0;
  v6 = self;
  v7 = specialized static ProtobufEncoder.encoding(_:)((uint64_t)v6, v5, (uint64_t)var1);
  v9 = v8;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v7, v9);
  return isa;
}

- (id)encodedCGFontData:(CGFont *)a3 error:(id *)a4
{
  _TtC7SwiftUI28RBDisplayListEncoderDelegate *v5;
  CGFont *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Class isa;

  v5 = self;
  v6 = a3;
  v7 = specialized static ProtobufEncoder.encoding(_:)((uint64_t)v5, v6);
  v9 = v8;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v7, v9);
  return isa;
}

- (BOOL)shouldEncodeFontSubset:(CGFont *)a3
{
  _BYTE v4[2];

  ProtobufEncoder.archiveOptions.getter(v4);
  return (v4[0] & 0x14) != 4;
}

- (id)encodedFontData:(id)a3 cgFont:(CGFont *)a4 error:(id *)a5
{
  id v7;
  CGFont *v8;
  _TtC7SwiftUI28RBDisplayListEncoderDelegate *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC7SwiftUI28RBDisplayListEncoderDelegate *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  Class isa;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13 = v9;
  outlined copy of Data._Representation(v10, v12);
  v14 = specialized static ProtobufEncoder.encoding(_:)((uint64_t)v13, v10, v12);
  v16 = v15;
  outlined consume of Data._Representation(v10, v12);

  outlined consume of Data._Representation(v10, v12);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v14, v16);
  return isa;
}

- (_TtC7SwiftUI28RBDisplayListEncoderDelegate)init
{
  _TtC7SwiftUI28RBDisplayListEncoderDelegate *result;

  result = (_TtC7SwiftUI28RBDisplayListEncoderDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
