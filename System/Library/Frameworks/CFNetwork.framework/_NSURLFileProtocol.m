@implementation _NSURLFileProtocol

+ (const)_cf_internalImpl
{
  return (const InternalProtocolImplementation *)&FileURLProtocol::kCFFileProtocolCBs;
}

@end
