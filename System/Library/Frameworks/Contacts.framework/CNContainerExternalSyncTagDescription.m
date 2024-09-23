@implementation CNContainerExternalSyncTagDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF62F8];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setExternalSyncTag:", a3);
}

- (id)key
{
  return CFSTR("externalSyncTag");
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "externalSyncTag");
}

@end
