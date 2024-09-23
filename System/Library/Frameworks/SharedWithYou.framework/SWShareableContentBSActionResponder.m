@implementation SWShareableContentBSActionResponder

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DA8888];
  v7 = a3;
  objc_msgSend(v6, "sharedActionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "respondToBSActions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (SWShareableContentBSActionResponder)sharedActionResponder
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SWShareableContentBSActionResponder_sharedActionResponder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedActionResponder_onceToken_0 != -1)
    dispatch_once(&sharedActionResponder_onceToken_0, block);
  return (SWShareableContentBSActionResponder *)(id)sharedActionResponder_shared_0;
}

void __60__SWShareableContentBSActionResponder_sharedActionResponder__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedActionResponder_shared_0;
  sharedActionResponder_shared_0 = (uint64_t)v1;

}

@end
