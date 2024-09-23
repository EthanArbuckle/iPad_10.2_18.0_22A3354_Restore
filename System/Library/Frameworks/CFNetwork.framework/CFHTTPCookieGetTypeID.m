@implementation CFHTTPCookieGetTypeID

CFTypeID __CFHTTPCookieGetTypeID_block_invoke()
{
  CFTypeID result;
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  CFLog();
  v1[0] = CFSTR("Name");
  v1[1] = CFSTR("Value");
  v2[0] = CFSTR("name");
  v2[1] = CFSTR("value");
  v1[2] = CFSTR("Path");
  v1[3] = CFSTR("Domain");
  v2[2] = CFSTR("/");
  v2[3] = CFSTR("fake.com");
  result = CFGetTypeID(+[NSHTTPCookie cookieWithProperties:](NSHTTPCookie, "cookieWithProperties:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 4)));
  CFHTTPCookieGetTypeID::sResult = result;
  return result;
}

@end
