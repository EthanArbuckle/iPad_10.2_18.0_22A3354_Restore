@implementation SGCuratedChangeNotificationsCalendarListener

- (void)startListening
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *notificationCenterToken;
  _QWORD v7[4];
  id v8;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CA9F88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SGCuratedChangeNotificationsCalendarListener_startListening__block_invoke;
  v7[3] = &unk_1E7DADE20;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  notificationCenterToken = self->_notificationCenterToken;
  self->_notificationCenterToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)stopListening
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationCenterToken);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenterToken, 0);
}

void __62__SGCuratedChangeNotificationsCalendarListener_startListening__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fire");

}

@end
