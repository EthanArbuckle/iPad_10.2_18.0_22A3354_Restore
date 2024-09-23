@implementation LSDDeviceIdentifierService

void __43___LSDDeviceIdentifierService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCDEA00);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;
  +[_LSDDeviceIdentifierService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;
  if (+[_LSDDeviceIdentifierService XPCInterface]::result
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("LSDDeviceIdentifierService.mm"), 287, CFSTR("Failed to create XPC interface object.")), v5, (v4 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result) != 0))
  {
    objc_msgSend(v4, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getIdentifierOfType_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_generateIdentifiersWithVendorName_bundleIdentifier_, 0, 0);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_generateIdentifiersWithVendorName_bundleIdentifier_, 1, 0);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier_, 0, 0);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier_, 1, 0);
    objc_msgSend((id)+[_LSDDeviceIdentifierService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_urlContainsDeviceIdentifierForAdvertising_completionHandler_, 0, 0);
  }
}

@end
