@implementation ASDClipService

+ (id)interface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE391F50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38BAD0), sel_boostSessionUsingChannel_forRequest_withReplyHandler_, 0, 0);
  return v2;
}

@end
