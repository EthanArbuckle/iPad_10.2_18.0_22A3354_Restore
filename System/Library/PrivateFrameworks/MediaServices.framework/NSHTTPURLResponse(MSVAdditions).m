@implementation NSHTTPURLResponse(MSVAdditions)

- (CFStringRef)msv_protocolVersion
{
  __CFHTTPMessage *HTTPResponse;

  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
  return (id)CFHTTPMessageCopyVersion(HTTPResponse);
}

@end
