@implementation ICSGreenTea3PUIHardwareEventHandler

- (ICSGreenTea3PUIHardwareEventHandler)init
{
  return (ICSGreenTea3PUIHardwareEventHandler *)sub_10014FCB4();
}

- (void)handleDeviceLockEvent:(ICSGreenTea3PUIHardwareEventHandler *)self resultHandler:(SEL)a2 callAnalyticsLogger:(SBSUIInCallWindowSceneDeviceLockEvent *)a3 completionHandler:(id)a4
{
  void *v4;
  const void *v5;
  const void *v6;
  void *v7;
  void *v10;
  void *v11;
  _QWORD *v12;
  SBSUIInCallWindowSceneDeviceLockEvent *v13;
  id v14;
  ICSGreenTea3PUIHardwareEventHandler *v15;

  v6 = v5;
  v7 = v4;
  v10 = _Block_copy(a4);
  v11 = _Block_copy(v6);
  v12 = (_QWORD *)swift_allocObject(&unk_10028A9A8, 56, 7);
  v12[2] = a3;
  v12[3] = v10;
  v12[4] = v7;
  v12[5] = v11;
  v12[6] = self;
  v13 = a3;
  v14 = v7;
  v15 = self;
  sub_10018236C((uint64_t)&unk_1002D96C8, (uint64_t)v12);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___ICSGreenTea3PUIHardwareEventHandler_declineCallService));
}

@end
