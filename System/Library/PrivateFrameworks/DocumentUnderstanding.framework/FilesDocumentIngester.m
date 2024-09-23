@implementation FilesDocumentIngester

+ (id)ingestDocumentFromFileWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.ingestDocumentFromFile(fileURL:));
}

+ (id)getEffectiveFileExtensionForURLWithFileURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  Swift::String v10;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v13;
  BOOL v14;
  void (*v15)(char *, uint64_t);
  Swift::String v16;
  void *v17;
  uint64_t v19;

  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v19 - v8;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  URL.pathExtension.getter();
  v10 = String.lowercased()();
  countAndFlagsBits = v10._countAndFlagsBits;
  object = v10._object;
  swift_bridgeObjectRelease();
  v13 = DUIngestableFiletypes.icloudFileExtension.unsafeMutableAddressor();
  v14 = v10._countAndFlagsBits == *(_QWORD *)v13 && v10._object == *(void **)(v13 + 8);
  if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    URL.deletingPathExtension()();
    URL.pathExtension.getter();
    v15 = *(void (**)(char *, uint64_t))(v4 + 8);
    v15(v7, v3);
    v16 = String.lowercased()();
    countAndFlagsBits = v16._countAndFlagsBits;
    object = v16._object;
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  }
  v15(v9, v3);
  v17 = (void *)MEMORY[0x22E2AF8EC](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  return v17;
}

+ (id)readFromJsonWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.readFromJson(fileURL:));
}

+ (id)readFromEMLWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.readFromEML(fileURL:));
}

+ (id)readFromPDFWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.readFromPDF(fileURL:));
}

+ (id)readFromOfficeWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.readFromOffice(fileURL:));
}

+ (id)readFromiWorkWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.readFromiWork(fileURL:));
}

+ (id)openiWorkFileWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.openiWorkFile(fileURL:));
}

+ (id)readFromTextWithFileURL:(id)a3
{
  return @objc static FilesDocumentIngester.ingestDocumentFromFile(fileURL:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))specialized static FilesDocumentIngester.readFromText(fileURL:));
}

- (_TtC21DocumentUnderstanding21FilesDocumentIngester)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FilesDocumentIngester();
  return -[FilesDocumentIngester init](&v3, sel_init);
}

@end
