@implementation HDHeartRateRecoveryManager

- (HDHeartRateRecoveryManager)init
{
  HDHeartRateRecoveryManager *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  HDAssertionManager *v5;
  HDAssertionManager *assertionManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDHeartRateRecoveryManager;
  v2 = -[HDHeartRateRecoveryManager init](&v8, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v5;

    -[HDAssertionManager resumeBudgetConsumption](v2->_assertionManager, "resumeBudgetConsumption");
    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v2->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v2, CFSTR("HDWorkoutSessionAssertionIdentifierHeartRateRecovery"), v2->_queue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[HDPowerAssertion invalidate](self->_powerAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHeartRateRecoveryManager;
  -[HDHeartRateRecoveryManager dealloc](&v3, sel_dealloc);
}

- (id)createAndTakeAssertionForOwnerIdentifier:(id)a3 sessionStateController:(id)a4
{
  id v6;
  id v7;
  _HDHeartRateRecoveryAssertion *v8;
  id v9;
  HDHeartRateRecoveryManager *v10;
  _HDHeartRateRecoveryAssertion *v11;
  _HDHeartRateRecoveryAssertion *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = [_HDHeartRateRecoveryAssertion alloc];
  v9 = v6;
  if (v8)
  {
    v14.receiver = v8;
    v14.super_class = (Class)_HDHeartRateRecoveryAssertion;
    v10 = -[HDHeartRateRecoveryManager initWithAssertionIdentifier:ownerIdentifier:](&v14, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDWorkoutSessionAssertionIdentifierHeartRateRecovery"), v7);
    v8 = (_HDHeartRateRecoveryAssertion *)v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10[2]._assertionManager, v9);
      -[HDAssertion setBudget:](v8, "setBudget:", *MEMORY[0x1E0CB7830]);
    }
  }

  if (-[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v8))
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)assertionManager:(id)a3 assertionTaken:(id)a4
{
  HDPowerAssertion *v5;
  HDPowerAssertion *powerAssertion;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_powerAssertion)
  {
    +[HDPowerAssertion powerAssertionWithIdentifier:timeout:timeoutHandler:](HDPowerAssertion, "powerAssertionWithIdentifier:timeout:timeoutHandler:", CFSTR("Workout Heart Rate Recovery"), 0, *MEMORY[0x1E0CB7830] + 60.0);
    v5 = (HDPowerAssertion *)objc_claimAutoreleasedReturnValue();
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = v5;

  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  NSObject *queue;
  id *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  HDPowerAssertion *powerAssertion;

  queue = self->_queue;
  v6 = (id *)a4;
  dispatch_assert_queue_V2(queue);
  if (v6)
    WeakRetained = objc_loadWeakRetained(v6 + 10);
  else
    WeakRetained = 0;

  objc_msgSend(WeakRetained, "endHeartRateRecovery");
  if (self->_powerAssertion)
  {
    -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierHeartRateRecovery"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      -[HDPowerAssertion invalidate](self->_powerAssertion, "invalidate");
      powerAssertion = self->_powerAssertion;
      self->_powerAssertion = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
