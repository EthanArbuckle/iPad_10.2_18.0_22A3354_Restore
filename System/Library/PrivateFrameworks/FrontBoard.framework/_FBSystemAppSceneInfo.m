@implementation _FBSystemAppSceneInfo

- (FBSScene)FBSScene
{
  return self->FBSScene;
}

- (BOOL)hasSentFBSWorkspaceDelegateSceneCreate
{
  return self->hasSentFBSWorkspaceDelegateSceneCreate;
}

- (void)setFBSScene:(id)a3
{
  objc_storeStrong((id *)&self->FBSScene, a3);
}

- (BOOL)hasHandledSceneCreate
{
  return self->hasHandledSceneCreate;
}

- (void)setHasHandledSceneCreate:(BOOL)a3
{
  self->hasHandledSceneCreate = a3;
}

- (void)setHasSentFBSWorkspaceDelegateSceneCreate:(BOOL)a3
{
  self->hasSentFBSWorkspaceDelegateSceneCreate = a3;
}

- (FBSSceneTransitionContext)pendingTransitionContext
{
  return self->pendingTransitionContext;
}

- (void)setPendingTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->pendingTransitionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pendingTransitionContext, 0);
  objc_storeStrong((id *)&self->FBSScene, 0);
}

@end
