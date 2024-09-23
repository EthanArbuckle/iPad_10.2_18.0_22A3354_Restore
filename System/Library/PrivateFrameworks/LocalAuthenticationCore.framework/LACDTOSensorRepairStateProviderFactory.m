@implementation LACDTOSensorRepairStateProviderFactory

+ (id)repairStateProviderWithReplyQueue:(id)a3 flags:(id)a4
{
  id v5;
  id v6;
  LACDTOSensorRepairStateProviderTaskDecorator *v7;
  id v8;
  id v9;
  void *v10;
  LACDTOSensorRepairStateProviderTaskDecorator *v11;
  uint64_t v13;
  uint64_t v14;
  LACDTOSensorRepairStateProviderDefaultsDecorator *(*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = [LACDTOSensorRepairStateProviderTaskDecorator alloc];
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke;
  v16 = &unk_2510C1AD8;
  v17 = v5;
  v18 = v6;
  v8 = v6;
  v9 = v5;
  __82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke((uint64_t)&v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LACDTOSensorRepairStateProviderTaskDecorator initWithProvider:replyQueue:](v7, "initWithProvider:replyQueue:", v10, v9, v13, v14, v15, v16);

  return v11;
}

LACDTOSensorRepairStateProviderDefaultsDecorator *__82__LACDTOSensorRepairStateProviderFactory_repairStateProviderWithReplyQueue_flags___block_invoke(uint64_t a1)
{
  LACDTOSensorRepairStateProviderDefaultsDecorator *v2;
  id v3;
  LACDTOSensorRepairStateProviderCRAdapter *v4;
  LACDTOSensorRepairStateProviderDefaultsDecorator *v5;

  v2 = [LACDTOSensorRepairStateProviderDefaultsDecorator alloc];
  v3 = *(id *)(a1 + 32);
  v4 = -[LACDTOSensorRepairStateProviderCRAdapter initWithReplyQueue:]([LACDTOSensorRepairStateProviderCRAdapter alloc], "initWithReplyQueue:", v3);
  v5 = -[LACDTOSensorRepairStateProviderDefaultsDecorator initWithStateProvider:flags:replyQueue:](v2, "initWithStateProvider:flags:replyQueue:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  return v5;
}

@end
