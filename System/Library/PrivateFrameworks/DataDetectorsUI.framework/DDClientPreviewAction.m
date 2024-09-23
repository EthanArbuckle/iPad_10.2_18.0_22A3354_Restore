@implementation DDClientPreviewAction

+ (void)setClientActionsDelegate:(id)a3
{
  id v4;
  id obj;

  obj = a1;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak(&_clientActionsDelegate_0, v4);

  objc_sync_exit(obj);
}

+ (id)clientActionsDelegate
{
  id v2;
  id WeakRetained;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&_clientActionsDelegate_0);
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (BOOL)clientCanPerformActionWithUrl:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("x-apple-data-detectors-clientdefined"));

  if (!v5)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v6, "canHandleClientActionFromUrl:", v3) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[DDClientPreviewAction clientCanPerformActionWithUrl:].cold.1(v3);

    goto LABEL_9;
  }

  v7 = 1;
LABEL_10:

  return v7;
}

- (id)localizedName
{
  NSURL **p_url;
  void *v4;
  void *v5;
  uint64_t v6;

  p_url = &self->super.super._url;
  if (self->super.super._url)
  {
    +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "localizedTitleForClientActionFromUrl:context:", *p_url, self->super.super._context);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  if (!objc_msgSend(v5, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDClientPreviewAction localizedName].cold.1((id *)p_url);
    DDLocalizedString(CFSTR("Action"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)iconName
{
  void *v3;
  void *v4;

  if (self->super.super._url)
  {
    +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "glyphForClientActionFromUrl:", self->super.super._url);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)performFromView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self->super.super._url)
  {
    +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "handleClientActionFromUrl:context:", self->super.super._url, self->super.super._context);

      goto LABEL_8;
    }

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[DDClientPreviewAction performFromView:].cold.1((id *)&self->super.super._url);
LABEL_8:

}

- (id)viewController
{
  void *v3;
  void *v4;

  if (self->super.super._url)
  {
    +[DDAction clientActionsDelegate](DDAction, "clientActionsDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "previewForClientActionFromUrl:", self->super.super._url);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)menuActions
{
  void *v2;
  void *v3;
  DDClientPreviewAction *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)clientCanPerformActionWithUrl:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "The custom action delegate answered that it could not handle url %p (%@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)localizedName
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "The custom action delegate did not return a title for url %p (%@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)performFromView:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "The custom action delegate did not handle url %p (%@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

@end
