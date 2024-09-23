@implementation FBDisplayLayoutTransition

- (void)beginTransition
{
  FBMainDisplayLayoutPublisher *publisher;
  BSInvalidatable *v4;
  BSInvalidatable *transition;

  publisher = self->_publisher;
  if (publisher && !self->_transition)
  {
    -[FBMainDisplayLayoutPublisher transitionAssertionWithReason:](publisher, "transitionAssertionWithReason:", self->_transitionReason);
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    transition = self->_transition;
    self->_transition = v4;

    if (self->_interfaceOrientation)
      -[FBMainDisplayLayoutPublisher setInterfaceOrientation:](self->_publisher, "setInterfaceOrientation:");
    if (self->_backlightLevel != -1)
      -[FBMainDisplayLayoutPublisher setBacklightLevel:](self->_publisher, "setBacklightLevel:");
  }
}

- (void)endTransition
{
  FBMainDisplayLayoutPublisher *publisher;
  BSInvalidatable *transition;

  publisher = self->_publisher;
  if (publisher && self->_transition)
  {
    if (self->_interfaceOrientation)
      -[FBMainDisplayLayoutPublisher setInterfaceOrientation:](publisher, "setInterfaceOrientation:");
    if (self->_backlightLevel != -1)
      -[FBMainDisplayLayoutPublisher setBacklightLevel:](self->_publisher, "setBacklightLevel:");
    -[BSInvalidatable invalidate](self->_transition, "invalidate");
    transition = self->_transition;
    self->_transition = 0;

  }
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (BOOL)isTransitioning
{
  return self->_transition != 0;
}

+ (id)layoutForDisplayType:(int64_t)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    +[FBMainDisplayLayoutPublisher sharedInstance](FBMainDisplayLayoutPublisher, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (void)flushLayoutForDisplayType:(int64_t)a3
{
  id v3;

  if (!a3)
  {
    +[FBMainDisplayLayoutPublisher sharedInstance](FBMainDisplayLayoutPublisher, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flush");

  }
}

- (FBDisplayLayoutTransition)init
{
  return -[FBDisplayLayoutTransition initWithDisplayType:name:](self, "initWithDisplayType:name:", 7, 0);
}

- (FBDisplayLayoutTransition)initWithDisplayType:(int64_t)a3 name:(id)a4
{
  id v6;
  FBDisplayLayoutTransition *v7;
  FBDisplayLayoutTransition *v8;
  FBMainDisplayLayoutPublisher *publisher;
  uint64_t v10;
  uint64_t v11;
  NSString *name;
  NSString *transitionReason;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBDisplayLayoutTransition;
  v7 = -[FBDisplayLayoutTransition init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      publisher = v7->_publisher;
      v7->_publisher = 0;
    }
    else
    {
      +[FBMainDisplayLayoutPublisher sharedInstance](FBMainDisplayLayoutPublisher, "sharedInstance");
      v10 = objc_claimAutoreleasedReturnValue();
      publisher = v8->_publisher;
      v8->_publisher = (FBMainDisplayLayoutPublisher *)v10;
    }

    v11 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

    transitionReason = v8->_transitionReason;
    v8->_transitionReason = 0;
    v8->_displayType = a3;

    *(_OWORD *)&v8->_interfaceOrientation = xmmword_1A3619910;
  }

  return v8;
}

- (void)dealloc
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBDisplayLayoutTransition.m");
  v16 = 1024;
  v17 = 61;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  int64_t backlightLevel;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_name, CFSTR("name"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_transitionReason, CFSTR("transitionReason"), 1);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[FBDisplayLayoutTransition isTransitioning](self, "isTransitioning"), CFSTR("transitioning"));
  if (self->_interfaceOrientation)
  {
    BSInterfaceOrientationDescription();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("interfaceOrientation"));

  }
  backlightLevel = self->_backlightLevel;
  if (backlightLevel != -1)
    v10 = (id)objc_msgSend(v3, "appendInteger:withName:", backlightLevel, CFSTR("backlightLevel"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)transitionReason
{
  return self->_transitionReason;
}

- (void)setTransitionReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)backlightLevel
{
  return self->_backlightLevel;
}

- (void)setBacklightLevel:(int64_t)a3
{
  self->_backlightLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_transitionReason, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end
