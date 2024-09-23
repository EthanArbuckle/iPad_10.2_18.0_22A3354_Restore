@implementation RBSAssertion(FBWorkspace)

- (void)fb_setWorkspaceAssertionState:()FBWorkspace
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_setAssociatedObject(a1, &__FBWorkspaceAssertionState, v4, (void *)1);

}

- (uint64_t)fb_workspaceAssertionState
{
  void *v1;
  unsigned __int8 v2;

  objc_getAssociatedObject(a1, &__FBWorkspaceAssertionState);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

@end
