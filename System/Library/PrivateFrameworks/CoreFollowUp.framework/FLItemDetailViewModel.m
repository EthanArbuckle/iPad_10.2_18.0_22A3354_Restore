@implementation FLItemDetailViewModel

- (FLItemDetailViewModel)initWithIdentifier:(id)a3
{
  id v4;
  FLItemDetailViewModel *v5;
  FLFollowUpController *v6;
  FLFollowUpController *controller;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLItemDetailViewModel;
  v5 = -[FLItemDetailViewModel init](&v9, sel_init);
  if (v5)
  {
    v6 = -[FLFollowUpController initWithClientIdentifier:]([FLFollowUpController alloc], "initWithClientIdentifier:", v4);
    controller = v5->_controller;
    v5->_controller = v6;

  }
  return v5;
}

- (FLItemDetailViewModel)initWithItems:(id)a3
{
  id v5;
  FLItemDetailViewModel *v6;
  FLItemDetailViewModel *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *originalItemIdentifiers;

  v5 = a3;
  v6 = -[FLItemDetailViewModel initWithIdentifier:](self, "initWithIdentifier:", 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalItems, a3);
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[NSArray fl_map:](v7->_originalItems, "fl_map:", &__block_literal_global_9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    originalItemIdentifiers = v7->_originalItemIdentifiers;
    v7->_originalItemIdentifiers = (NSSet *)v10;

  }
  return v7;
}

uint64_t __39__FLItemDetailViewModel_initWithItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (id)allPendingItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[FLFollowUpController pendingFollowUpItems:](self->_controller, "pendingFollowUpItems:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__FLItemDetailViewModel_allPendingItems__block_invoke;
  v7[3] = &unk_1E6F1E750;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __40__FLItemDetailViewModel_allPendingItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)setItemChangeHandler:(id)a3
{
  id v4;
  NSObject *v5;
  FLItemChangeObserver *v6;
  FLItemChangeObserver *observer;
  uint8_t v8[16];

  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8D53000, v5, OS_LOG_TYPE_DEFAULT, "FLItemDetailViewModel: setItemChangeHandler", v8, 2u);
  }

  +[FLItemChangeObserver observerWithChangeHandler:](FLItemChangeObserver, "observerWithChangeHandler:", v4);
  v6 = (FLItemChangeObserver *)objc_claimAutoreleasedReturnValue();

  observer = self->_observer;
  self->_observer = v6;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_originalItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_originalItems, 0);
}

@end
