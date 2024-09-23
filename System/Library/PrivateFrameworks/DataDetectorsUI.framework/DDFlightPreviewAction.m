@implementation DDFlightPreviewAction

+ (id)viewControllerProviderClass
{
  return CFSTR("DDRemoteFlightViewControllerProvider");
}

- (id)previewActions
{
  return 0;
}

- (BOOL)wantsCustomViewControllerCommit
{
  return 1;
}

- (id)expandViewController
{
  DDFlightAction *v3;
  void *v4;
  __DDResult *v5;
  void *v6;
  DDFlightAction *v7;
  void *v8;

  v3 = [DDFlightAction alloc];
  -[DDAction url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DDAction result](self, "result");
  -[DDAction context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DDAction initWithURL:result:context:](v3, "initWithURL:result:context:", v4, v5, v6);
  -[DDFlightAction viewController](v7, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)menuActionClasses
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDFlightPreviewAction previewActions](self, "previewActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = v3;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CGSize)suggestedContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 325.0;
  v3 = 325.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviewMode:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DDFlightPreviewAction;
  -[DDRemoteAction setPreviewMode:](&v8, sel_setPreviewMode_);
  if (!self->_previewModeSet && !a3)
  {
    self->_previewModeSet = 1;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C99748];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runMode:beforeDate:", v6, v7);

    usleep(0x7530u);
  }
}

@end
