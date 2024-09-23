@implementation LACDTOSensorRepairStateProviderDefaultsDecorator

- (LACDTOSensorRepairStateProviderDefaultsDecorator)initWithStateProvider:(id)a3 flags:(id)a4 replyQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACDTOSensorRepairStateProviderDefaultsDecorator *v12;
  LACDTOSensorRepairStateProviderDefaultsDecorator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOSensorRepairStateProviderDefaultsDecorator;
  v12 = -[LACDTOSensorRepairStateProviderDefaultsDecorator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stateProvider, a3);
    objc_storeStrong((id *)&v13->_flags, a4);
    objc_storeStrong((id *)&v13->_replyQueue, a5);
  }

  return v13;
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  dispatch_time_t v14;
  NSObject *replyQueue;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[5];

  v4 = a3;
  if (os_variant_allows_internal_security_policies()
    && (-[LACFlagsProvider valueForFlagDTOSecureRepairMockRepairType](self->_flags, "valueForFlagDTOSecureRepairMockRepairType"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke;
    v20[3] = &unk_2510C1BA8;
    v20[4] = self;
    __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke((uint64_t)v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACFlagsProvider valueForFlagDTOSecureRepairMockRepairTypeQueryLatency](self->_flags, "valueForFlagDTOSecureRepairMockRepairTypeQueryLatency");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_2510F6B20;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    replyQueue = self->_replyQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke_2;
    block[3] = &unk_2510C13A8;
    v18 = v7;
    v19 = v4;
    v16 = v7;
    dispatch_after(v14, replyQueue, block);

  }
  else
  {
    -[LACDTOSensorRepairStateProvider fetchRepairStateWithCompletion:](self->_stateProvider, "fetchRepairStateWithCompletion:", v4);
  }

}

LACDTOMutableSensorRepairState *__83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  LACDTOMutableSensorRepairState *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "valueForFlagDTOSecureRepairMockRepairType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  v3 = objc_alloc_init(LACDTOMutableSensorRepairState);
  -[LACDTOMutableSensorRepairState setRepairFlag:](v3, "setRepairFlag:", v2);
  return v3;
}

uint64_t __83__LACDTOSensorRepairStateProviderDefaultsDecorator_fetchRepairStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
}

@end
