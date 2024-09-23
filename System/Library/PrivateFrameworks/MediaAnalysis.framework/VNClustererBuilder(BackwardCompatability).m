@implementation VNClustererBuilder(BackwardCompatability)

- (id)vcp_updateModelByAddingFaces:()BackwardCompatability error:
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "updateModelByAddingFaces:andRemovingFaces:canceller:error:", v6, 0, 0, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "updateModelByAddingFaces:error:", v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

@end
