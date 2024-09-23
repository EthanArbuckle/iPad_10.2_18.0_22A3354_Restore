@implementation DIOneshotTimer

- (NSString)description
{
  DIOneshotTimer *v2;
  void *v3;

  v2 = self;
  sub_23A765830();

  v3 = (void *)sub_23A769478();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (DIOneshotTimer)initWithInterval:(double)a3 queue:(id)a4 identifier:(id)a5 label:(id)a6 handler:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v10 = sub_23A76934C();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a7);
  sub_23A769334();
  v14 = sub_23A76949C();
  v16 = v15;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v13;
  v18 = a4;
  return (DIOneshotTimer *)OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(a4, (uint64_t)v12, v14, v16, (uint64_t)sub_23A766EB0, v17, a3);
}

- (void)dealloc
{
  DIOneshotTimer *v2;

  v2 = self;
  OneshotTimer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v3 = OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_6(v3);
  swift_unknownObjectRelease();
  v4 = sub_23A769424();
  OUTLINED_FUNCTION_6_6(v4);
  v5 = (char *)self + OBJC_IVAR___DIOneshotTimer_logger;
  v6 = sub_23A76937C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)cancelTimer
{
  DIOneshotTimer *v2;

  v2 = self;
  sub_23A766938();

}

- (DIOneshotTimer)init
{
  OneshotTimer.init()();
}

@end
