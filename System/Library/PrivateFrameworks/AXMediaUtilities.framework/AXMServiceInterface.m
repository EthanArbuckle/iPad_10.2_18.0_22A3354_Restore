@implementation AXMServiceInterface

void __AXMServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEDFF58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXMServiceInterface__Interface;
  AXMServiceInterface__Interface = v0;

  AXMSecureCodingClasses();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)AXMServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_visionEngine_evaluateSource_context_options_result_, 0, 0);
  objc_msgSend((id)AXMServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_visionEngine_evaluateSource_context_options_result_, 1, 0);
  objc_msgSend((id)AXMServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_visionEngine_evaluateSource_context_options_result_, 2, 0);
  objc_msgSend((id)AXMServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_visionEngine_evaluateSource_context_options_result_, 3, 0);
  objc_msgSend((id)AXMServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_visionEngine_evaluateSource_context_options_result_, 0, 1);
  objc_msgSend((id)AXMServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_visionEngine_evaluateSource_context_options_result_, 1, 1);

}

@end
