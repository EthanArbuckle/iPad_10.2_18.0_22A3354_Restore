@implementation APAirPlayAgentServicesClientSendCommand

void __APAirPlayAgentServicesClientSendCommand_block_invoke()
{
  __CFNotificationCenter *LocalCenter;
  const __CFString *DisconnectNotificationName;

  if (gLogCategory_APAirPlayAgentServices <= 50
    && (gLogCategory_APAirPlayAgentServices != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  DisconnectNotificationName = (const __CFString *)APSXPCClientGetDisconnectNotificationName();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)airplayAgentServicesClient_handleServerDisconnect, DisconnectNotificationName, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
