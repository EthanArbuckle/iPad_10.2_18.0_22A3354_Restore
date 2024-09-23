@implementation GKLoadableContentStateMachine

- (GKLoadableContentStateMachine)init
{
  GKLoadableContentStateMachine *v2;
  GKLoadableContentStateMachine *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  objc_super v12;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  const __CFString *v18;
  _QWORD v19[6];
  _QWORD v20[8];

  v20[6] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)GKLoadableContentStateMachine;
  v2 = -[_GKStateMachine init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_GKStateMachine setCurrentState:](v2, "setCurrentState:", CFSTR("Initial"));
    v18 = CFSTR("LoadingState");
    v19[0] = CFSTR("Initial");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = CFSTR("LoadingState");
    v17[0] = CFSTR("LoadedState");
    v17[1] = CFSTR("NoContentState");
    v17[2] = CFSTR("ErrorState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v4;
    v19[2] = CFSTR("RefreshingState");
    v16[0] = CFSTR("LoadedState");
    v16[1] = CFSTR("NoContentState");
    v16[2] = CFSTR("ErrorState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v5;
    v19[3] = CFSTR("LoadedState");
    v15[0] = CFSTR("RefreshingState");
    v15[1] = CFSTR("NoContentState");
    v15[2] = CFSTR("ErrorState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v6;
    v19[4] = CFSTR("NoContentState");
    v14[0] = CFSTR("RefreshingState");
    v14[1] = CFSTR("LoadedState");
    v14[2] = CFSTR("ErrorState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v7;
    v19[5] = CFSTR("ErrorState");
    v13[0] = CFSTR("RefreshingState");
    v13[1] = CFSTR("NoContentState");
    v13[2] = CFSTR("LoadedState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GKStateMachine setValidTransitions:](v3, "setValidTransitions:", v9);

  }
  return v3;
}

@end
