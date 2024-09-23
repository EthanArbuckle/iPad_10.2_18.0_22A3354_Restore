@implementation CNUICoreRemoteApplicationIconLoader

- (id)iconOfApplictionWithBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

@end
