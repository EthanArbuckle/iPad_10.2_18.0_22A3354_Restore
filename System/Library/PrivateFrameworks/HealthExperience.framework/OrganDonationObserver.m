@implementation OrganDonationObserver

- (OrganDonationObserver)init
{
  OrganDonationObserver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OrganDonationObserver;
  result = -[OrganDonationObserver init](&v3, sel_init);
  if (result)
    result->_organDonationChangedToken = -1;
  return result;
}

- (void)startObservingChanges
{
  const char *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)*MEMORY[0x1E0D2F4D0];
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__OrganDonationObserver_startObservingChanges__block_invoke;
  v6[3] = &unk_1E752DDD0;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_organDonationChangedToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__OrganDonationObserver_startObservingChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "organDonationDidChange");

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  int organDonationChangedToken;
  objc_super v4;

  organDonationChangedToken = self->_organDonationChangedToken;
  if (organDonationChangedToken != -1)
    notify_cancel(organDonationChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)OrganDonationObserver;
  -[OrganDonationObserver dealloc](&v4, sel_dealloc);
}

- (OrganDonationObserverDelegate)delegate
{
  return (OrganDonationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
