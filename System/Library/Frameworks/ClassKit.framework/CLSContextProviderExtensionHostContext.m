@implementation CLSContextProviderExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1ED0FB400 != -1)
    dispatch_once(&qword_1ED0FB400, &unk_1E97499B0);
  return (id)qword_1ED0FB408;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ED0FB410 != -1)
    dispatch_once(&qword_1ED0FB410, &unk_1E9749CF0);
  return (id)qword_1ED0FB418;
}

@end
