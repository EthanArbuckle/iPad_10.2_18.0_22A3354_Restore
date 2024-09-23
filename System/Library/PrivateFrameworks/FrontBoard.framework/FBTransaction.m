@implementation FBTransaction

- (FBTransaction)init
{
  FBTransaction *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBTransaction;
  v2 = -[FBTransaction init](&v5, sel_init);
  if (v2)
  {
    FBWorkspaceLogTransaction();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBTransaction _addDebugLogCategory:](v2, "_addDebugLogCategory:", v3);

  }
  return v2;
}

@end
