@implementation FBProcessState

- (BOOL)isRunning
{
  return self->_running;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (int64_t)taskState
{
  return self->_taskState;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FBProcessState *v4;

  v4 = -[FBProcessState initWithPid:]([FBProcessState alloc], "initWithPid:", -[FBProcessState pid](self, "pid"));
  -[FBProcessState setTaskState:](v4, "setTaskState:", -[FBProcessState taskState](self, "taskState"));
  -[FBProcessState setVisibility:](v4, "setVisibility:", -[FBProcessState visibility](self, "visibility"));
  -[FBProcessState setDebugging:](v4, "setDebugging:", -[FBProcessState isDebugging](self, "isDebugging"));
  return v4;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isDebugging
{
  return self->_debugging;
}

- (void)setTaskState:(int64_t)a3
{
  if (self->_taskState != a3)
  {
    self->_taskState = a3;
    self->_running = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
}

- (void)setDebugging:(BOOL)a3
{
  self->_debugging = a3;
}

- (void)setVisibility:(int64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    self->_foreground = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
}

- (FBProcessState)initWithPid:(int)a3
{
  FBProcessState *result;
  int64_t v5;

  result = -[FBProcessState init](self, "init");
  if (result)
  {
    result->_pid = a3;
    result->_visibility = 0;
    if (a3 < 1)
    {
      v5 = 0;
    }
    else
    {
      result->_running = 1;
      v5 = 2;
    }
    result->_taskState = v5;
  }
  return result;
}

- (FBProcessState)init
{
  FBProcessState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBProcessState;
  result = -[FBProcessState init](&v3, sel_init);
  if (result)
    result->_pid = -1;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  FBProcessState *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (FBProcessState *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && self->_pid == v4->_pid
      && self->_taskState == v4->_taskState
      && self->_visibility == v4->_visibility
      && self->_debugging == v4->_debugging;
  }

  return v6;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)description
{
  return (NSString *)-[FBProcessState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBProcessState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  unint64_t taskState;
  __CFString *v6;
  id v7;
  unint64_t visibility;
  __CFString *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", self->_pid, CFSTR("pid"));
  taskState = self->_taskState;
  if (taskState > 3)
    v6 = 0;
  else
    v6 = off_1E4A140F0[taskState];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("taskState"));
  visibility = self->_visibility;
  if (visibility > 3)
    v9 = 0;
  else
    v9 = off_1E4A14110[visibility];
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("visibility"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_debugging, CFSTR("debugging"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBProcessState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
