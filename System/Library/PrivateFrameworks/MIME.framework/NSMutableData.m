@implementation NSMutableData

void __71__NSMutableData_RFC2231Support__mf_appendRFC2231CompliantValue_forKey___block_invoke()
{
  __CFCharacterSet *Mutable;
  CFRange v1;

  Mutable = CFCharacterSetCreateMutable(0);
  v1.location = 32;
  v1.length = 95;
  CFCharacterSetAddCharactersInRange(Mutable, v1);
  CFCharacterSetInvert(Mutable);
  mf_appendRFC2231CompliantValue_forKey__specialCSet = (uint64_t)CFCharacterSetCreateCopy(0, Mutable);
  CFRelease(Mutable);
}

@end
