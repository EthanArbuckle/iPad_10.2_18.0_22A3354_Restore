@implementation PHASETapRegistry

- (PHASETapRegistry)init
{
  -[PHASETapRegistry doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASETapRegistry)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASETapRegistry)initWithEngine:(id)a3
{
  id v4;
  PHASETapRegistry *v5;
  PHASETapRegistry *v6;
  uint64_t v7;
  NSMutableSet *descriptions;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASETapRegistry;
  v5 = -[PHASETapRegistry init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakEngine, v4);
    v7 = objc_opt_new();
    descriptions = v6->_descriptions;
    v6->_descriptions = (NSMutableSet *)v7;

  }
  return v6;
}

- (void)reset
{
  std::mutex *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    v2 = (std::mutex *)Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation") + 48), 16);
    if (!v2)
      std::terminate();
    Phase::Controller::ClientTapRegistryProxy::Reset(v2);
  }

}

- (BOOL)registerTapReceiverWithIdentifier:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation") + 48), 16);
    if (!v10)
      std::terminate();
    Phase::Controller::ClientTapRegistryProxy::RegisterTapReceiver(v10, v6, v7);
  }

  return 1;
}

- (void)unregisterTapReceiverWithIdentifier:(id)a3
{
  id WeakRetained;
  void *v5;
  Phase::Controller::ClientTapRegistryProxy *v6;
  NSString *v7;

  v7 = (NSString *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (Phase::Controller::ClientTapRegistryProxy *)Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation")+ 48), 16);
    if (!v6)
      std::terminate();
    Phase::Controller::ClientTapRegistryProxy::UnregisterTapReceiver(v6, v7);
  }

}

- (id)tapReceiverFormatForIdentifier:(id)a3
{
  NSString *v4;
  id WeakRetained;
  void *v6;
  std::mutex *v7;
  void *v8;

  v4 = (NSString *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (std::mutex *)Phase::Controller::TaskManager::GetService<Phase::Controller::ClientTapRegistryProxy>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation") + 48), 16);
    if (!v7)
      std::terminate();
    Phase::Controller::ClientTapRegistryProxy::GetTapReceiverFormat(v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)registerTapReceiverForDescription:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[NSMutableSet addObject:](self->_descriptions, "addObject:", v6);
  objc_msgSend(v6, "uidString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHASETapRegistry registerTapReceiverWithIdentifier:block:](self, "registerTapReceiverWithIdentifier:block:", v8, v7);

  return (char)self;
}

- (void)unregisterTapReceiverForDescription:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "uidString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASETapRegistry unregisterTapReceiverWithIdentifier:](self, "unregisterTapReceiverWithIdentifier:", v4);

  -[NSMutableSet removeObject:](self->_descriptions, "removeObject:", v5);
}

- (id)tapReceiverFormatForDescription:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uidString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASETapRegistry tapReceiverFormatForIdentifier:](self, "tapReceiverFormatForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_destroyWeak((id *)&self->_weakEngine);
}

@end
