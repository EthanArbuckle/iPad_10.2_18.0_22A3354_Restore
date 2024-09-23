@implementation _EXExtensionIdentity(MKRemoteUIExtras)

+ (id)mkRemoteUIIdentity
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CAA560], "extensionPointIdentifierQuery:", CFSTR("com.apple.mapkit.private.RemoteUI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CAA568], "executeQueries:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
