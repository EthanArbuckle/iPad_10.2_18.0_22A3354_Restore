@implementation HDRBSProcessStateProvider

- (id)stateForProcessIdentifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", a3, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
