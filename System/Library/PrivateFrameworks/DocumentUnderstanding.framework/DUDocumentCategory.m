@implementation DUDocumentCategory

+ (NSString)ticket
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x74656B636974, 0xE600000000000000);
}

+ (NSString)receipt
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x74706965636572, 0xE700000000000000);
}

+ (NSString)taxForm
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x6D726F46786174, 0xE700000000000000);
}

+ (NSString)form
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](1836216166, 0xE400000000000000);
}

+ (NSString)identification
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x696669746E656469, 0xEE006E6F69746163);
}

+ (NSString)book
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](1802465122, 0xE400000000000000);
}

+ (NSString)worksheet
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x656568736B726F77, 0xE900000000000074);
}

+ (NSString)recipe
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x657069636572, 0xE600000000000000);
}

+ (NSString)medical
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x6C61636964656DLL, 0xE700000000000000);
}

+ (NSString)presentation
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x61746E6573657270, 0xEC0000006E6F6974);
}

- (_TtC21DocumentUnderstanding18DUDocumentCategory)init
{
  return (_TtC21DocumentUnderstanding18DUDocumentCategory *)@objc DUDocumentCategory.init()(self, (uint64_t)a2, type metadata accessor for DUDocumentCategory);
}

@end
