@implementation NSString

void __66__NSString_ABVCardAdditions__abStringByStrippingControlCharacters__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet"), "mutableCopy");
  objc_msgSend(v0, "invert");
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
  objc_msgSend(v0, "addCharactersInRange:", 8205, 1);
  objc_msgSend(v0, "invert");
  abStringByStrippingControlCharacters___invalidChars = objc_msgSend(v0, "copy");

}

@end
