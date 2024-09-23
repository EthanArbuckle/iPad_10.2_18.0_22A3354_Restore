@implementation CRSUIClusterPressBSActionsHandler

- (CRSUIClusterPressBSActionsHandler)initWithDelegate:(id)a3
{
  id v4;
  CRSUIClusterPressBSActionsHandler *v5;
  CRSUIClusterPressBSActionsHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRSUIClusterPressBSActionsHandler;
  v5 = -[CRSUIClusterPressBSActionsHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v7 = a3;
  objc_msgSend(v7, "objectsPassingTest:", &__block_literal_global_12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __99__CRSUIClusterPressBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
    v11[3] = &unk_24C769EE8;
    v11[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  }
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v8);

  return v9;
}

uint64_t __99__CRSUIClusterPressBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __99__CRSUIClusterPressBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "actionType");

  objc_msgSend(v5, "selectButtonPressedWithType:", v4);
}

- (CRSUIClusterPressBSActionActionDelegate)delegate
{
  return (CRSUIClusterPressBSActionActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
