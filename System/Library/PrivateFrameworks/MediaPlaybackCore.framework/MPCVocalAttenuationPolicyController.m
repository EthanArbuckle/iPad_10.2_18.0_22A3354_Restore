@implementation MPCVocalAttenuationPolicyController

uint64_t __67__MPCVocalAttenuationPolicyController_initWithDelegate_parameters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupPoliciesWithParameters:", *(_QWORD *)(a1 + 40));
}

- (MPCVocalAttenuationPolicyController)initWithDelegate:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  MPCVocalAttenuationPolicyController *v8;
  MPCVocalAttenuationPolicyController *v9;
  uint64_t v10;
  NSMutableArray *policies;
  uint64_t v12;
  NSMutableArray *blockingPolicies;
  dispatch_queue_t v14;
  OS_dispatch_queue *accessQueue;
  NSObject *v16;
  _QWORD v18[4];
  MPCVocalAttenuationPolicyController *v19;
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MPCVocalAttenuationPolicyController;
  v8 = -[MPCVocalAttenuationPolicyController init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    policies = v9->_policies;
    v9->_policies = (NSMutableArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    blockingPolicies = v9->_blockingPolicies;
    v9->_blockingPolicies = (NSMutableArray *)v12;

    v14 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAPoliciesQueue", 0);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v14;

    v16 = v9->_accessQueue;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __67__MPCVocalAttenuationPolicyController_initWithDelegate_parameters___block_invoke;
    v18[3] = &unk_24CABA1D0;
    v19 = v9;
    v20 = v7;
    dispatch_async(v16, v18);

  }
  return v9;
}

- (void)_setupPoliciesWithParameters:(id)a3
{
  NSObject *accessQueue;
  id v5;
  NSMutableArray *policies;
  MPCVocalAttenuationThermalPressurePolicy *v7;
  void *v8;
  MPCVocalAttenuationThermalPressurePolicy *v9;
  NSMutableArray *v10;
  MPCVocalAttenuationLowPowerModePolicy *v11;
  MPCVocalAttenuationLowPowerModePolicy *v12;
  id v13;

  accessQueue = self->_accessQueue;
  v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  policies = self->_policies;
  v7 = [MPCVocalAttenuationThermalPressurePolicy alloc];
  objc_msgSend(v5, "thermalMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPCVocalAttenuationThermalPressurePolicy initWithThermalMonitor:calloutQueue:delegate:](v7, "initWithThermalMonitor:calloutQueue:delegate:", v8, self->_accessQueue, self);
  -[NSMutableArray addObject:](policies, "addObject:", v9);

  v10 = self->_policies;
  v11 = [MPCVocalAttenuationLowPowerModePolicy alloc];
  objc_msgSend(v5, "lowPowerModeMonitor");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = -[MPCVocalAttenuationLowPowerModePolicy initWithPowerModeMonitor:calloutQueue:delegate:](v11, "initWithPowerModeMonitor:calloutQueue:delegate:", v13, self->_accessQueue, self);
  -[NSMutableArray addObject:](v10, "addObject:", v12);

}

- (void)resetPolicies
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__MPCVocalAttenuationPolicyController_resetPolicies__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (id)blockingEvaluation
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9351;
  v10 = __Block_byref_object_dispose__9352;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__MPCVocalAttenuationPolicyController_blockingEvaluation__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_notifyDelegate
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MPCVocalAttenuationPolicyController__notifyDelegate__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)vocalAttenuationPolicy:(id)a3 didChangeEvaluation:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[MPCVocalAttenuationPolicyController blockingPolicies](self, "blockingPolicies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__MPCVocalAttenuationPolicyController_vocalAttenuationPolicy_didChangeEvaluation___block_invoke;
  v12[3] = &unk_24CAB4318;
  v11 = v5;
  v13 = v11;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v12);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL
    || (-[MPCVocalAttenuationPolicyController blockingPolicies](self, "blockingPolicies"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "objectAtIndexedSubscript:", v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    if (!objc_msgSend(v11, "shouldDisableVocalAttenuation"))
    {
      v9 = 0;
      goto LABEL_10;
    }
    -[MPCVocalAttenuationPolicyController blockingPolicies](self, "blockingPolicies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
    v9 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "shouldDisableVocalAttenuation")
    && (objc_msgSend(v11, "shouldDisableVocalAttenuation") & 1) == 0)
  {
    -[MPCVocalAttenuationPolicyController blockingPolicies](self, "blockingPolicies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v9);
LABEL_8:

    -[MPCVocalAttenuationPolicyController _notifyDelegate](self, "_notifyDelegate");
  }
LABEL_10:

}

- (MPCVocalAttenuationPolicyControllerDelegate)delegate
{
  return (MPCVocalAttenuationPolicyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableArray)policies
{
  return self->_policies;
}

- (void)setPolicies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)blockingPolicies
{
  return self->_blockingPolicies;
}

- (void)setBlockingPolicies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_blockingPolicies, 0);
  objc_storeStrong((id *)&self->_policies, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __82__MPCVocalAttenuationPolicyController_vocalAttenuationPolicy_didChangeEvaluation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend(a2, "policyType");
  v7 = objc_msgSend(*(id *)(a1 + 32), "policyType");
  if (v6 == v7)
    *a4 = 1;
  return v6 == v7;
}

void __54__MPCVocalAttenuationPolicyController__notifyDelegate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vocalAttenuationPolicyControllerDidChange:", *(_QWORD *)(a1 + 32));

}

void __57__MPCVocalAttenuationPolicyController_blockingEvaluation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "blockingPolicies");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__MPCVocalAttenuationPolicyController_resetPolicies__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "policies", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v6, "canBeReset"))
          objc_msgSend(v6, "reset");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

@end
