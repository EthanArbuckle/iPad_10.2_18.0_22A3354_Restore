@implementation GKPlaceholderContentStateMachine

- (GKPlaceholderContentStateMachine)init
{
  GKPlaceholderContentStateMachine *v2;
  GKPlaceholderContentStateMachine *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[6];
  _QWORD v20[8];

  v20[6] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)GKPlaceholderContentStateMachine;
  v2 = -[_GKStateMachine init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_GKStateMachine setCurrentState:](v2, "setCurrentState:", CFSTR("Initial"));
    v19[0] = CFSTR("Initial");
    v18[0] = CFSTR("LoadingState");
    v18[1] = CFSTR("LoadedState");
    v18[2] = CFSTR("NoContentState");
    v18[3] = CFSTR("ErrorState");
    v18[4] = CFSTR("RefreshingState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = CFSTR("LoadingState");
    v17[0] = CFSTR("Initial");
    v17[1] = CFSTR("LoadedState");
    v17[2] = CFSTR("NoContentState");
    v17[3] = CFSTR("ErrorState");
    v17[4] = CFSTR("RefreshingState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v10;
    v19[2] = CFSTR("RefreshingState");
    v16[0] = CFSTR("Initial");
    v16[1] = CFSTR("LoadedState");
    v16[2] = CFSTR("NoContentState");
    v16[3] = CFSTR("ErrorState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v4;
    v19[3] = CFSTR("LoadedState");
    v15[0] = CFSTR("Initial");
    v15[1] = CFSTR("RefreshingState");
    v15[2] = CFSTR("NoContentState");
    v15[3] = CFSTR("ErrorState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v5;
    v19[4] = CFSTR("NoContentState");
    v14[0] = CFSTR("Initial");
    v14[1] = CFSTR("RefreshingState");
    v14[2] = CFSTR("LoadedState");
    v14[3] = CFSTR("ErrorState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v6;
    v19[5] = CFSTR("ErrorState");
    v13[0] = CFSTR("Initial");
    v13[1] = CFSTR("RefreshingState");
    v13[2] = CFSTR("NoContentState");
    v13[3] = CFSTR("LoadedState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GKStateMachine setValidTransitions:](v3, "setValidTransitions:", v8);

  }
  return v3;
}

- (BOOL)isInPlaceholderState
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  BOOL v6;

  -[_GKStateMachine currentState](self, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("LoadingState"))
  {
    v6 = 1;
  }
  else
  {
    -[_GKStateMachine currentState](self, "currentState");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4 == CFSTR("NoContentState"))
    {
      v6 = 1;
    }
    else
    {
      -[_GKStateMachine currentState](self, "currentState");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = v5 == CFSTR("ErrorState");

    }
  }

  return v6;
}

@end
