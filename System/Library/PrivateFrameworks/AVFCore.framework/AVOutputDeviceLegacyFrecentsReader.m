@implementation AVOutputDeviceLegacyFrecentsReader

- (id)frecencyInfoForDeviceWithID:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.avfoundation.frecents"));
}

+ (id)defaultFrecentsReader
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)deviceIDs
{
  return (NSArray *)CFPreferencesCopyKeyList(CFSTR("com.apple.avfoundation.frecents"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

@end
