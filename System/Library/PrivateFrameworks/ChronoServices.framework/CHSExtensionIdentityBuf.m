@implementation CHSExtensionIdentityBuf

void __63___CHSExtensionIdentityBuf_deepCopyUsingBufferBuilder_changes___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (a1[4])
    objc_msgSend(v3, "setTokenString:");
  if (a1[5])
    objc_msgSend(v3, "setExtensionBundleIdentifier:");
  if (a1[6])
    objc_msgSend(v3, "setContainerBundleIdentifier:");
  if (a1[7])
    objc_msgSend(v3, "setDeviceIdentifier:");

}

@end
