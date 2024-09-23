@implementation HFActivityLogCoordinator

- (HFActivityLogCoordinator)initWithHome:(id)a3
{
  id v5;
  HFActivityLogCoordinator *v6;
  HFActivityLogCoordinator *v7;
  HFActivityLogCoordinator_Swift *v8;
  HFActivityLogCoordinator_Swift *coordinator;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFActivityLogCoordinator;
  v6 = -[HFActivityLogCoordinator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = -[HFActivityLogCoordinator_Swift initWithHome:]([HFActivityLogCoordinator_Swift alloc], "initWithHome:", v5);
    coordinator = v7->_coordinator;
    v7->_coordinator = v8;

    v7->_eventsExist = 0;
  }

  return v7;
}

- (void)checkIfEventsExist
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HFActivityLogCoordinator coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__HFActivityLogCoordinator_checkIfEventsExist__block_invoke;
  v4[3] = &unk_1EA73C948;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "eventsExistWithCompletionHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__HFActivityLogCoordinator_checkIfEventsExist__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3 && WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "setEventsExist:", a2);
    objc_msgSend(v7, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityLogCoordinator:didDetermineEventsExist:", v7, a2);

    WeakRetained = v7;
  }

}

- (HMHome)home
{
  return self->_home;
}

- (HFActivityLogCoordinatorDelegate)delegate
{
  return (HFActivityLogCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)eventsExist
{
  return self->_eventsExist;
}

- (void)setEventsExist:(BOOL)a3
{
  self->_eventsExist = a3;
}

- (HFActivityLogCoordinator_Swift)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
