@implementation TUMetadataDestinationID

+ (id)metadataDestinationIDWithVoicemailMessage:(id)a3
{
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  id v7;

  swift_getObjCClassMetadata(a1);
  KeyPath = swift_getKeyPath(&unk_100076148);
  v5 = swift_getKeyPath(&unk_100076188);
  v6 = swift_unknownObjectRetain(a3);
  v7 = sub_1000505B4(v6, KeyPath, v5);
  swift_unknownObjectRelease(a3);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

+ (id)metadataDestinationIDsForVMVoicemails:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  Class isa;

  v5 = sub_100031408(&qword_1000916D0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  v7 = sub_100050800(v6);
  swift_bridgeObjectRelease(v6);
  sub_100050DA0();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return isa;
}

@end
