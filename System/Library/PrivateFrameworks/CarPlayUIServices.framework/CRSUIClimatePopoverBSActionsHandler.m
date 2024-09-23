@implementation CRSUIClimatePopoverBSActionsHandler

- (CRSUIClimatePopoverBSActionsHandler)initWithDelegate:(id)a3
{
  id v4;
  CRSUIClimatePopoverBSActionsHandler *v5;
  CRSUIClimatePopoverBSActionsHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRSUIClimatePopoverBSActionsHandler;
  v5 = -[CRSUIClimatePopoverBSActionsHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[5];

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
      v18[3] = &unk_24C769FF8;
      v18[4] = self;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);
    }
    else if (objc_msgSend(v9, "conformsToProtocol:", &unk_2549E2A88))
    {
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3;
      v16 = &unk_24C769FF8;
      v17 = v9;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v13);

    }
  }
  v11 = (void *)objc_msgSend(v8, "mutableCopy", v13, v14, v15, v16);
  objc_msgSend(v11, "minusSet:", v10);

  return v11;
}

uint64_t __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
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

void __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleTapOutsidePopoverFrames");

}

uint64_t __101__CRSUIClimatePopoverBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTapOutsidePopoverFrames");
}

- (CRSUIClimatePopoverActionDelegate)delegate
{
  return (CRSUIClimatePopoverActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
