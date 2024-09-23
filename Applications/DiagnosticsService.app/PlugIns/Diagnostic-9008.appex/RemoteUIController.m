@implementation RemoteUIController

- (void)registerPartsInfoViewWithComponentsMap:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  RemoteUIController *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  unint64_t v9;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v5 = qword_10001A1B0;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_10001A1B0, sub_100009EC0);
  v7 = *(void (**)(uint64_t))(*(_QWORD *)qword_10001A6C8 + 96);
  v8 = swift_bridgeObjectRetain(v4);
  v7(v8);
  v9 = sub_10000B544();
  RemoteUIController.registerViewType(_:named:)(&type metadata for PartsInfoView, v9, 0x666E497374726170, 0xE90000000000006FLL);

  swift_bridgeObjectRelease(v4);
}

@end
