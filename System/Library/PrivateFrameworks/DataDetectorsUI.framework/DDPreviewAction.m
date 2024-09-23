@implementation DDPreviewAction

- (void)dealloc
{
  UIViewController *viewController;
  objc_super v4;

  viewController = self->super._viewController;
  self->super._viewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)DDPreviewAction;
  -[DDAction dealloc](&v4, sel_dealloc);
}

+ (id)previewActionForURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __objc2_class *v12;
  int Category;
  const __CFString *Type;
  DDTimeLineAction *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __objc2_class *v19;

  v7 = (uint64_t)a3;
  v8 = a5;
  v9 = v8;
  if (v7 | (unint64_t)a4)
  {
    if (a4)
    {
      Category = DDResultGetCategory();
      switch(Category)
      {
        case 0:
        case 5:
          Type = (const __CFString *)DDResultGetType();
          if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CBA0], 0) == kCFCompareEqualTo
            || CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAF0], 0) == kCFCompareEqualTo)
          {
            v19 = DDURLPreviewAction;
            goto LABEL_49;
          }
          if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAB8], 0) == kCFCompareEqualTo)
          {
            v19 = DDFlightPreviewAction;
            goto LABEL_49;
          }
          if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB38], 0) == kCFCompareEqualTo)
          {
            v19 = DDParsecPreviewAction;
            goto LABEL_49;
          }
          if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CA38], 0) == kCFCompareEqualTo
            || CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB28], 0) == kCFCompareEqualTo)
          {
            goto LABEL_46;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            +[DDPreviewAction previewActionForURL:result:context:].cold.2((uint64_t)Type, v7);
          break;
        case 1:
          if (+[DDNewsPreviewAction handlesUrl:result:](DDNewsPreviewAction, "handlesUrl:result:", v7, a4))
          {
            goto LABEL_29;
          }
          if (+[DDURLPreviewAction handlesUrl:result:](DDURLPreviewAction, "handlesUrl:result:", v7, a4))
            goto LABEL_31;
          if (+[DDChatBotAction handlesUrl:result:](DDChatBotAction, "handlesUrl:result:", v7, a4))
            goto LABEL_43;
          if (+[DDPersonAction handlesUrl:result:](DDPersonAction, "handlesUrl:result:", v7, a4))
            goto LABEL_45;
          break;
        case 2:
          v19 = DDPersonAction;
          goto LABEL_49;
        case 3:
          v19 = DDMapAction;
          goto LABEL_49;
        case 4:
          v19 = DDTimeLineAction;
          goto LABEL_49;
        default:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            +[DDPreviewAction previewActionForURL:result:context:].cold.1((uint64_t)a4, v7, Category);
          break;
      }
    }
    if (+[DDNewsPreviewAction handlesUrl:result:](DDNewsPreviewAction, "handlesUrl:result:", v7, a4))
    {
LABEL_29:
      v19 = DDNewsPreviewAction;
    }
    else if (+[DDURLPreviewAction handlesUrl:result:](DDURLPreviewAction, "handlesUrl:result:", v7, a4))
    {
LABEL_31:
      v19 = DDURLPreviewAction;
    }
    else if (+[DDMapAction handlesUrl:result:](DDMapAction, "handlesUrl:result:", v7, a4))
    {
      v19 = DDMapAction;
    }
    else if (+[DDChatBotAction handlesUrl:result:](DDChatBotAction, "handlesUrl:result:", v7, a4))
    {
LABEL_43:
      v19 = DDChatBotAction;
    }
    else
    {
      if (!+[DDPersonAction handlesUrl:result:](DDPersonAction, "handlesUrl:result:", v7, a4))
      {
LABEL_46:
        v15 = 0;
        goto LABEL_50;
      }
LABEL_45:
      v19 = DDPersonAction;
    }
LABEL_49:
    v15 = (DDTimeLineAction *)objc_msgSend([v19 alloc], "initWithURL:result:context:", v7, a4, v9);
    goto LABEL_50;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Contact"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (DDContactHasNameInfo(v10)
      || !+[DDMapAction actionAvailableForContact:](DDMapAction, "actionAvailableForContact:", v11))
    {
      v12 = DDPersonAction;
    }
    else
    {
      v12 = DDMapAction;
    }
    v15 = (DDTimeLineAction *)objc_msgSend([v12 alloc], "initWithURL:result:context:", 0, 0, v9);
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ICS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length")
      && ((objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E4259480),
           (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
       || (+[DDAddEventAction cachedEventForICSString:](DDAddEventAction, "cachedEventForICSString:", v16),
           (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", v17, 0x1E4259480, v9);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = -[DDAction initWithURL:result:context:]([DDTimeLineAction alloc], "initWithURL:result:context:", 0, 0, v18);
      v9 = (void *)v18;
    }
    else
    {
      v15 = 0;
    }

  }
LABEL_50:

  return v15;
}

- (id)createViewController
{
  return 0;
}

- (id)viewController
{
  UIViewController *viewController;
  UIViewController *v4;
  UIViewController *v5;

  viewController = self->super._viewController;
  if (!viewController)
  {
    -[DDPreviewAction createViewController](self, "createViewController");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._viewController;
    self->super._viewController = v4;

    viewController = self->super._viewController;
  }
  return viewController;
}

- (id)previewViewController
{
  int isDeviceLocked;
  void *v4;
  void *v5;
  id v6;

  isDeviceLocked = dd_isDeviceLocked();
  -[DDPreviewAction viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (isDeviceLocked)
  {
    if (objc_msgSend(v4, "_canShowWhileLocked"))
      v6 = v5;
    else
      v6 = 0;

    v5 = v6;
  }
  return v5;
}

- (id)commitURL
{
  return 0;
}

- (BOOL)wantsSeamlessCommit
{
  return 0;
}

- (id)expandViewController
{
  -[DDPreviewAction setPreviewMode:](self, "setPreviewMode:", 0);
  return -[DDPreviewAction viewController](self, "viewController");
}

- (BOOL)prefersActionMenuStyle
{
  return 0;
}

- (BOOL)requiresEmbeddingNavigationController
{
  return 0;
}

- (id)platterTitle
{
  return 0;
}

- (id)platterSubtitle
{
  return 0;
}

- (BOOL)showMenuTitle
{
  return 1;
}

- (id)menuActions
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  objc_class *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[DDPreviewAction menuActionClasses](self, "menuActionClasses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  v3 = 0;
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v18 = v4;
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v4);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(v6);
              v11 = *(objc_class **)(*((_QWORD *)&v19 + 1) + 8 * i);
              if (-[objc_class isAvailable](v11, "isAvailable"))
              {
                v12 = (void *)objc_msgSend([v11 alloc], "initWithURL:result:context:", self->super._url, self->super._result, self->super._context);
                if (v12)
                {
                  if (!v3)
                    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v27 = v12;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "addObject:", v13);

                }
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
          }
          while (v8);
        }

        v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v17);
  }

  return v3;
}

- (id)menuActionClasses
{
  return 0;
}

- (CGSize)suggestedContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)menuHasHeaderView
{
  return 0;
}

- (id)menuHeaderView
{
  return 0;
}

+ (void)previewActionForURL:(uint64_t)a1 result:(uint64_t)a2 context:(int)a3 .cold.1(uint64_t a1, uint64_t a2, int a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109634;
  v3[1] = a3;
  v4 = 2112;
  v5 = a1;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown DDResult category %d for result %@; could not find any actions for URL %@",
    (uint8_t *)v3,
    0x1Cu);
}

+ (void)previewActionForURL:(uint64_t)a1 result:(uint64_t)a2 context:.cold.2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown result type %@ in the Misc category; no actions found (URL %@)",
    (uint8_t *)&v2,
    0x16u);
}

@end
