@implementation HMBLocalZoneMirrorInput(FirewallRuleManager)

- (uint64_t)frmSyncCommitWithOptions:()FirewallRuleManager error:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "frmSyncCommitWithMirrorInput:options:error:", a1, v6, a4);

  return v7;
}

+ (uint64_t)frmSyncCommitWithMirrorInput:()FirewallRuleManager options:error:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a3, "commitWithOptions:error:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "blockAndWaitForCompletionWithError:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "mirrorOutputResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10
        || (objc_msgSend(v9, "mirrorOutputResult"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "blockAndWaitForCompletionWithError:", a5),
            v12 = objc_claimAutoreleasedReturnValue(),
            v11,
            (id)v12,
            v12))
      {
        v12 = 1;
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
