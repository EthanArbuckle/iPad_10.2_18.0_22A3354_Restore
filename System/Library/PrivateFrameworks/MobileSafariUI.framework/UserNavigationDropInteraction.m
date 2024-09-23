@implementation UserNavigationDropInteraction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationHandler, 0);
}

- (UserNavigationDropInteraction)initWithOpensNewTab:(BOOL)a3 tabOrder:(int64_t)a4 navigationHandler:(id)a5
{
  id v8;
  UserNavigationDropInteraction *v9;
  void *v10;
  id navigationHandler;
  UserNavigationDropInteraction *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UserNavigationDropInteraction;
  v9 = -[UIDropInteraction initWithDelegate:](&v14, sel_initWithDelegate_, self);
  if (v9)
  {
    v10 = _Block_copy(v8);
    navigationHandler = v9->_navigationHandler;
    v9->_navigationHandler = v10;

    v9->_opensNewTab = a3;
    v9->_tabOrder = a4;
    v12 = v9;
  }

  return v9;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0D4EF70], "canCreateNavigationIntentForDropSession:", a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 2);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = (void *)MEMORY[0x1E0D4EF70];
  v6 = a4;
  objc_msgSend(v5, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersOpenInNewTab:", self->_opensNewTab);
  objc_msgSend(v7, "setPreferredTabOrder:", self->_tabOrder);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__UserNavigationDropInteraction_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E9CF2D70;
  v8[4] = self;
  objc_msgSend(v7, "buildNavigationIntentForDropSession:completionHandler:", v6, v8);

}

uint64_t __61__UserNavigationDropInteraction_dropInteraction_performDrop___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(result + 32) + 80) + 16))();
  return result;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

@end
