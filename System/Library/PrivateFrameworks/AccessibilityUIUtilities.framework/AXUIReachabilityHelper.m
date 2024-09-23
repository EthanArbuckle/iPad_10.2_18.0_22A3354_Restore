@implementation AXUIReachabilityHelper

+ (id)sharedHelper
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AXUIReachabilityHelper_sharedHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHelper_onceToken != -1)
    dispatch_once(&sharedHelper_onceToken, block);
  return (id)sharedHelper_SharedHelper;
}

void __38__AXUIReachabilityHelper_sharedHelper__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedHelper_SharedHelper;
  sharedHelper_SharedHelper = (uint64_t)v1;

}

- (double)reachabilityOffsetForPayload:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("offset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)animateForReachability:(id)a3 payload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  AXUIReachabilityAnimationBehaviorSettings *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v12 = -[AXUIReachabilityAnimationBehaviorSettings initWithPayload:]([AXUIReachabilityAnimationBehaviorSettings alloc], "initWithPayload:", v9);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke;
  v18[3] = &unk_1E76ABEE0;
  v18[4] = self;
  v19 = v9;
  v20 = v8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke_2;
  v16[3] = &unk_1E76ABF08;
  v17 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v11, "_animateUsingSpringBehavior:tracking:animations:completion:", v12, 0, v18, v16);

}

uint64_t __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reachabilityOffsetForPayload:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __68__AXUIReachabilityHelper_animateForReachability_payload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
