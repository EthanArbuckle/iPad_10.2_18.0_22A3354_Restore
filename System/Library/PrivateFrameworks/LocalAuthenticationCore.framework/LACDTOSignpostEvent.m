@implementation LACDTOSignpostEvent

LACSignpostEvent *__49__LACDTOSignpostEvent_environmentUpdateWillStart__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_3);
}

void __49__LACDTOSignpostEvent_environmentUpdateWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTOEnvironmentUpdate", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

LACSignpostEvent *__49__LACDTOSignpostEvent_environmentUpdateDidFinish__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_6);
}

void __49__LACDTOSignpostEvent_environmentUpdateDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTOEnvironmentUpdate", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

LACSignpostEvent *__51__LACDTOSignpostEvent_locationStatusQueryWillStart__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_9_0);
}

void __51__LACDTOSignpostEvent_locationStatusQueryWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTOLocationStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

LACSignpostEvent *__51__LACDTOSignpostEvent_locationStatusQueryDidFinish__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_12);
}

void __51__LACDTOSignpostEvent_locationStatusQueryDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTOLocationStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

LACSignpostEvent *__45__LACDTOSignpostEvent_lostModeQueryWillStart__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_15);
}

void __45__LACDTOSignpostEvent_lostModeQueryWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTOLostModeQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

LACSignpostEvent *__45__LACDTOSignpostEvent_lostModeQueryDidFinish__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_18);
}

void __45__LACDTOSignpostEvent_lostModeQueryDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTOLostModeQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

LACSignpostEvent *__49__LACDTOSignpostEvent_repairStatusQueryWillStart__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_21);
}

void __49__LACDTOSignpostEvent_repairStatusQueryWillStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DTORepairStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

LACSignpostEvent *__49__LACDTOSignpostEvent_repairStatusQueryDidFinish__block_invoke()
{
  return -[LACSignpostEvent initWithSendBlock:]([LACSignpostEvent alloc], "initWithSendBlock:", &__block_literal_global_24);
}

void __49__LACDTOSignpostEvent_repairStatusQueryDidFinish__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  LACLogDTO();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v4 = 138543362;
    v5 = v2;
    _os_signpost_emit_with_name_impl(&dword_2409DC000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DTORepairStateQuery", "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

@end
