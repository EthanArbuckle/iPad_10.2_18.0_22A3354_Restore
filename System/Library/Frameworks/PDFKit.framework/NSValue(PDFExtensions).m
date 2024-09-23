@implementation NSValue(PDFExtensions)

+ (uint64_t)PDFKitValueWithPDFRect:()PDFExtensions
{
  return objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:");
}

+ (uint64_t)PDFKitValueWithPDFPoint:()PDFExtensions
{
  return objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
}

@end
