@implementation CFPDSourceLookUpKey

- (void)dealloc
{
  __CFString *uncanonicalizedPath;
  __CFString *cloudPath;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  uncanonicalizedPath = self->uncanonicalizedPath;
  if (uncanonicalizedPath)
    CFRelease(uncanonicalizedPath);
  cloudPath = self->cloudPath;
  if (cloudPath)
    CFRelease(cloudPath);
  v5.receiver = self;
  v5.super_class = (Class)CFPDSourceLookUpKey;
  -[CFPDSourceLookUpKey dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  return _CFPrefsEqualKeyOrSource(self, a3);
}

@end
