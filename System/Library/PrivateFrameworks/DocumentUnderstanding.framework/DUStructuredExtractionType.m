@implementation DUStructuredExtractionType

+ (NSString)title
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x656C746974, 0xE500000000000000);
}

+ (NSString)phone
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x656E6F6870, 0xE500000000000000);
}

+ (NSString)url
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](7107189, 0xE300000000000000);
}

+ (NSString)address
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x73736572646461, 0xE700000000000000);
}

+ (NSString)calendarEvent
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x7261646E656C6163, 0xED0000746E657645);
}

+ (NSString)liveText
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x747865546576696CLL, 0xE800000000000000);
}

+ (NSString)person
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x6E6F73726570, 0xE600000000000000);
}

+ (NSString)hmHome
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x656D6F486D68, 0xE600000000000000);
}

+ (NSString)hmRoom
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x6D6F6F526D68, 0xE600000000000000);
}

+ (NSString)hmAccessory
{
  return (NSString *)(id)MEMORY[0x22E2AF8EC](0x7373656363416D68, 0xEB0000000079726FLL);
}

- (_TtC21DocumentUnderstanding26DUStructuredExtractionType)init
{
  return (_TtC21DocumentUnderstanding26DUStructuredExtractionType *)@objc DUDocumentCategory.init()(self, (uint64_t)a2, type metadata accessor for DUStructuredExtractionType);
}

@end
