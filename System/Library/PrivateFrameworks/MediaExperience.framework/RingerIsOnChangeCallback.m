@implementation RingerIsOnChangeCallback

uint64_t __cmsmdevicestate_RingerIsOnChangeCallback_block_invoke()
{
  MXSessionManager *v0;

  v0 = +[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance");
  return -[MXSessionManager updateSilentModeState:untilTime:withReason:forClientType:updateForStartup:](v0, "updateSilentModeState:untilTime:withReason:forClientType:updateForStartup:", byte_1EE2B2A01 == 0, 0, CFSTR("MXSessionManager update from SB notification"), 1, 0);
}

@end
