@implementation LACDTOSensorRepairStateProviderNullAdapter

- (void)fetchRepairStateWithCompletion:(id)a3
{
  void (**v3)(id, LACDTOMutableSensorRepairState *, _QWORD);
  LACDTOMutableSensorRepairState *v4;

  v3 = (void (**)(id, LACDTOMutableSensorRepairState *, _QWORD))a3;
  v4 = objc_alloc_init(LACDTOMutableSensorRepairState);
  -[LACDTOMutableSensorRepairState setRepairFlag:](v4, "setRepairFlag:", 0);
  v3[2](v3, v4, 0);

}

@end
