@implementation _MXExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_161 != -1)
    dispatch_once(&_MergedGlobals_161, &__block_literal_global_80);
  return (id)qword_1ECE2DD00;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ECE2DD08 != -1)
    dispatch_once(&qword_1ECE2DD08, &__block_literal_global_53);
  return (id)qword_1ECE2DD10;
}

@end
