@implementation FBSMutableProcessExecutionStrategy

- (id)copyWithZone:(_NSZone *)a3
{
  FBSProcessExecutionStrategy *v4;
  void *v5;

  v4 = -[FBSProcessExecutionStrategy init](+[FBSProcessExecutionStrategy allocWithZone:](FBSProcessExecutionStrategy, "allocWithZone:", a3), "init");
  -[FBSProcessExecutionStrategy setSchedulingPolicy:](v4, "setSchedulingPolicy:", -[FBSProcessExecutionStrategy schedulingPolicy](self, "schedulingPolicy"));
  -[FBSProcessExecutionStrategy setGraphicsPolicy:](v4, "setGraphicsPolicy:", -[FBSProcessExecutionStrategy graphicsPolicy](self, "graphicsPolicy"));
  -[FBSProcessExecutionStrategy setJetsamPolicy:](v4, "setJetsamPolicy:", -[FBSProcessExecutionStrategy jetsamPolicy](self, "jetsamPolicy"));
  -[FBSProcessExecutionStrategy setReason:](v4, "setReason:", -[FBSProcessExecutionStrategy reason](self, "reason"));
  -[FBSProcessExecutionStrategy setFlags:](v4, "setFlags:", -[FBSProcessExecutionStrategy flags](self, "flags"));
  -[FBSProcessExecutionStrategy setCustomPolicy:](v4, "setCustomPolicy:", -[FBSProcessExecutionStrategy isCustomPolicy](self, "isCustomPolicy"));
  -[FBSProcessExecutionStrategy strategyName](self, "strategyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSProcessExecutionStrategy setStrategyName:](v4, "setStrategyName:", v5);

  return v4;
}

@end
