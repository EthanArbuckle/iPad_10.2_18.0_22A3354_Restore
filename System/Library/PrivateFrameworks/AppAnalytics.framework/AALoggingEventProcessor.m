@implementation AALoggingEventProcessor

- (AALoggingEventProcessor)initWithFormat:(int64_t)a3 subsystem:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1A5F64130();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (AALoggingEventProcessor *)BridgingLoggingEventProcessor.init(format:subsystem:)(a3, (uint64_t)a4, v6);
}

- (AALoggingEventProcessor)initWithFormat:(int64_t)a3
{
  return -[AALoggingEventProcessor initWithFormat:subsystem:](self, sel_initWithFormat_subsystem_, a3, 0);
}

- (void)processEvent:(id)a3
{
  sub_1A5F6470C();
  __break(1u);
}

- (AALoggingEventProcessor)init
{
  AALoggingEventProcessor *result;

  result = (AALoggingEventProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
