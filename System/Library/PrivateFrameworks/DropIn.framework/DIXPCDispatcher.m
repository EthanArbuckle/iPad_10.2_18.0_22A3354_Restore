@implementation DIXPCDispatcher

- (DIDeviceListDelegate)deviceListDelegate
{
  sub_23A7614AC();
}

- (void)setDeviceListDelegate:(id)a3
{
  DIXPCDispatcher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_23A761504();

}

- (DIDeviceStatusDelegate)deviceStatusDelegate
{
  sub_23A76159C();
}

- (void)setDeviceStatusDelegate:(id)a3
{
  DIXPCDispatcher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_23A7615F4();

}

- (DISessionStatusDelegate)sessionStatusDelegate
{
  sub_23A761688();
}

- (void)setSessionStatusDelegate:(id)a3
{
  DIXPCDispatcher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_23A7616E0();

}

- (DIAudioPowerDelegate)audioPowerDelegate
{
  sub_23A761774();
}

- (void)setAudioPowerDelegate:(id)a3
{
  DIXPCDispatcher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_23A7617CC();

}

- (DIAudioStatusDelegate)audioStatusDelegate
{
  sub_23A761860();
}

- (void)setAudioStatusDelegate:(id)a3
{
  DIXPCDispatcher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_23A7618F0();

}

- (DIXPCDispatcher)initWithClientContext:(id)a3
{
  return (DIXPCDispatcher *)XPCDispatcher.init(clientContext:)(a3);
}

- (void)fetchClientContextWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  DIXPCDispatcher *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_23A761D7C((uint64_t)&unk_2569B8430, v5);
}

- (void)didLoadDevices:(id)a3
{
  DIXPCDispatcher *v4;

  sub_23A761FF8();
  sub_23A7694F0();
  v4 = self;
  sub_23A761E58();
}

- (void)didAddDevice:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_23A762084(v4);
}

- (void)didRemoveDevice:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_23A7620F4(v4);
}

- (void)didUpdateDevice:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_23A762164(v4);
}

- (void)didAddSession:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_23A7621D4(v4);
}

- (void)didRemoveSession:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_23A762244(v4);
}

- (void)didUpdateSession:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_23A7622B4(v4);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  DIXPCDispatcher *v7;

  v6 = a3;
  a4;
  v7 = self;
  sub_23A7624B0(v6);
}

- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  sub_23A762738(v5);
}

- (void)didUpdateAudioPower:(float)a3
{
  self;
  sub_23A762908();
}

- (void)didUpdateUplinkMuteStatus:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self;
  sub_23A762A58(v3);
}

- (void)didUpdateDownlinkMuteStatus:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self;
  sub_23A762AAC(v3);
}

- (DIXPCDispatcher)init
{
  XPCDispatcher.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___DIXPCDispatcher_logger;
  v4 = sub_23A76937C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_16_6(OBJC_IVAR___DIXPCDispatcher_deviceListDelegate);
  OUTLINED_FUNCTION_16_6(OBJC_IVAR___DIXPCDispatcher_deviceStatusDelegate);
  OUTLINED_FUNCTION_16_6(OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate);
  OUTLINED_FUNCTION_16_6(OBJC_IVAR___DIXPCDispatcher_audioPowerDelegate);
  sub_23A7584F4((uint64_t)self + OBJC_IVAR___DIXPCDispatcher_audioStatusDelegate);
}

@end
