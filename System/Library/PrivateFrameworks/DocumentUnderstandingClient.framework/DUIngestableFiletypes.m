@implementation DUIngestableFiletypes

+ (NSArray)supportedUTTypes
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for supportedUTTypes);
}

+ (NSArray)wrappedSupportedUTTypes
{
  Class isa;

  if (one-time initialization token for wrappedSupportedUTTypes != -1)
    swift_once();
  type metadata accessor for UTType();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

+ (NSArray)supportedFileExtensions
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for supportedFileExtensions);
}

+ (BOOL)isFileURLSupported:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  Swift::String v7;
  char v8;
  uint64_t v10;

  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  URL.pathExtension.getter();
  v7 = String.lowercased()();
  swift_bridgeObjectRelease();
  if (one-time initialization token for supportedFileExtensions != -1)
    swift_once();
  v8 = specialized Sequence<>.contains(_:)(v7._countAndFlagsBits, (uint64_t)v7._object, (_QWORD *)static DUIngestableFiletypes.supportedFileExtensions);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8 & 1;
}

+ (NSString)icloudFileExtension
{
  return (NSString *)(id)MEMORY[0x23B853DBC](0x64756F6C6369, 0xE600000000000000);
}

+ (NSArray)officeFileExtensions
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for officeFileExtensions);
}

+ (NSArray)iWorkFileExtensions
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for iWorkFileExtensions);
}

+ (NSArray)pdfFileExtensions
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for pdfFileExtensions);
}

+ (NSArray)jsonFileExtensions
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for jsonFileExtensions);
}

+ (NSArray)txtFileExtensions
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for txtFileExtensions);
}

+ (NSArray)emlFileExtensions
{
  return (NSArray *)@objc static DUIngestableFiletypes.supportedUTTypes.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for emlFileExtensions);
}

- (_TtC27DocumentUnderstandingClient21DUIngestableFiletypes)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DUIngestableFiletypes();
  return -[DUIngestableFiletypes init](&v3, sel_init);
}

@end
