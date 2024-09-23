@implementation SWCollaborationCoordinatorSceneComponent

+ (void)load
{
  +[SWCollaborationCoordinatorSceneComponent _registerWithUIKit](SWCollaborationCoordinatorSceneComponent, "_registerWithUIKit");
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

+ (void)_registerWithUIKit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerWithUIKit_onceToken != -1)
    dispatch_once(&_registerWithUIKit_onceToken, block);
}

- (SWCollaborationCoordinatorSceneComponent)initWithScene:(id)a3
{
  id v4;
  SWCollaborationCoordinatorSceneComponent *v5;
  SWCollaborationCoordinatorSceneComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationCoordinatorSceneComponent;
  v5 = -[SWCollaborationCoordinatorSceneComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

void __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD aBlock[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 == objc_opt_class())
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v3 = (void (**)(_QWORD))_Block_copy(aBlock);
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
      v3[2](v3);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v3);

  }
}

- (id)_actionRespondersForScene:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[SWCollaborationCoordinatorBSActionResponder sharedActionResponder](SWCollaborationCoordinatorBSActionResponder, "sharedActionResponder", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  +[SWShareableContentBSActionResponder sharedActionResponder](SWShareableContentBSActionResponder, "sharedActionResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __62__SWCollaborationCoordinatorSceneComponent__registerWithUIKit__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = (void *)MEMORY[0x1E0DC3BC0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_registerSceneComponentClass:withKey:predicate:", v2, CFSTR("SWCollaborationCoordinatorSceneComponent"), v3);

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
