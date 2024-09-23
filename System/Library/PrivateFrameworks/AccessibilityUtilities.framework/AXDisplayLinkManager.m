@implementation AXDisplayLinkManager

+ (id)currentDisplayLinkManager
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (void *)objc_opt_new();
      if (v6)
        objc_msgSend(v5, "setObject:forKey:", v6, v3);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_releaseCurrentDisplayLinkManager
{
  objc_class *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeObjectForKey:", v5);
  }

}

- (AXDisplayLinkManager)init
{
  AXDisplayLinkManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXDisplayLinkManager;
  v2 = -[AXDisplayLinkManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v4 = objc_opt_new();
    v5 = (void *)v4;
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (v6)
    {

      v2 = 0;
    }
    else
    {
      -[AXDisplayLinkManager setActiveTargetActions:](v2, "setActiveTargetActions:", v3);
      -[AXDisplayLinkManager setUpdatedTargetActions:](v2, "setUpdatedTargetActions:", v5);
    }

  }
  return v2;
}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[AXDisplayLinkManager storedDisplayLink](self, "storedDisplayLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaused");

  return v3;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[AXDisplayLinkManager storedDisplayLink](self, "storedDisplayLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[AXDisplayLinkManager storedDisplayLink](self, "storedDisplayLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (CADisplayLink)displayLink
{
  void *v3;
  void *v4;

  -[AXDisplayLinkManager storedDisplayLink](self, "storedDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayDidRefresh_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addToRunLoop:forMode:", v4, *MEMORY[0x1E0C99748]);

    objc_msgSend(v3, "setPaused:", 1);
    -[AXDisplayLinkManager setStoredDisplayLink:](self, "setStoredDisplayLink:", v3);
  }
  return (CADisplayLink *)v3;
}

- (void)setDisplayLink:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[AXDisplayLinkManager storedDisplayLink](self, "storedDisplayLink");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
  {
    objc_msgSend(v4, "invalidate");
    -[AXDisplayLinkManager setStoredDisplayLink:](self, "setStoredDisplayLink:", v5);
  }

}

- (void)addTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  AXDisplayLinkManagerTargetAction *v9;

  v6 = a3;
  v9 = -[AXDisplayLinkManagerTargetAction initWithTarget:actionSelector:]([AXDisplayLinkManagerTargetAction alloc], "initWithTarget:actionSelector:", v6, a4);

  if (-[AXDisplayLinkManager isHandlingDisplayRefresh](self, "isHandlingDisplayRefresh"))
  {
    -[AXDisplayLinkManager _prepareUpdatedTargetActionsForModification](self, "_prepareUpdatedTargetActionsForModification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);
  }
  else
  {
    -[AXDisplayLinkManager activeTargetActions](self, "activeTargetActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "addObject:", v9);
    if (!v8)
      -[AXDisplayLinkManager _didAddFirstTargetAction](self, "_didAddFirstTargetAction");
  }

}

- (void)removeTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  AXDisplayLinkManagerTargetAction *v9;

  v6 = a3;
  v9 = -[AXDisplayLinkManagerTargetAction initWithTarget:actionSelector:]([AXDisplayLinkManagerTargetAction alloc], "initWithTarget:actionSelector:", v6, a4);

  if (-[AXDisplayLinkManager isHandlingDisplayRefresh](self, "isHandlingDisplayRefresh"))
  {
    -[AXDisplayLinkManager _prepareUpdatedTargetActionsForModification](self, "_prepareUpdatedTargetActionsForModification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v9);
  }
  else
  {
    -[AXDisplayLinkManager activeTargetActions](self, "activeTargetActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "removeObject:", v9);
    if (v8 && !objc_msgSend(v7, "count"))
      -[AXDisplayLinkManager _didRemoveLastTargetAction](self, "_didRemoveLastTargetAction");
  }

}

- (id)_prepareUpdatedTargetActionsForModification
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AXDisplayLinkManager updatedTargetActions](self, "updatedTargetActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[AXDisplayLinkManager hasUpdatedTargetActions](self, "hasUpdatedTargetActions"))
  {
    -[AXDisplayLinkManager activeTargetActions](self, "activeTargetActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    -[AXDisplayLinkManager setHasUpdatedTargetActions:](self, "setHasUpdatedTargetActions:", 1);

  }
  return v3;
}

- (void)_didAddFirstTargetAction
{
  id v2;

  -[AXDisplayLinkManager displayLink](self, "displayLink");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPaused:", 0);

}

- (void)_didRemoveLastTargetAction
{
  void *v3;

  -[AXDisplayLinkManager storedDisplayLink](self, "storedDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaused:", 1);

  if (!-[AXDisplayLinkManager isWarmUpModeEnabled](self, "isWarmUpModeEnabled"))
  {
    -[AXDisplayLinkManager setDisplayLink:](self, "setDisplayLink:", 0);
    objc_msgSend((id)objc_opt_class(), "_releaseCurrentDisplayLinkManager");
  }
}

- (BOOL)isWarmUpModeEnabled
{
  return -[AXDisplayLinkManager warmUpModeRequirementsCount](self, "warmUpModeRequirementsCount") != 0;
}

- (void)beginRequiringWarmUpMode
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[AXDisplayLinkManager warmUpModeRequirementsCount](self, "warmUpModeRequirementsCount");
  -[AXDisplayLinkManager setWarmUpModeRequirementsCount:](self, "setWarmUpModeRequirementsCount:", v3 + 1);
  if (!v3 && !-[AXDisplayLinkManager isHandlingDisplayRefresh](self, "isHandlingDisplayRefresh"))
  {
    if (-[AXDisplayLinkManager hasUpdatedTargetActions](self, "hasUpdatedTargetActions"))
      _AXAssert();
    -[AXDisplayLinkManager activeTargetActions](self, "activeTargetActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      -[AXDisplayLinkManager displayLink](self, "displayLink");

    }
  }
}

- (void)endRequiringWarmUpMode
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[AXDisplayLinkManager warmUpModeRequirementsCount](self, "warmUpModeRequirementsCount") - 1;
  -[AXDisplayLinkManager setWarmUpModeRequirementsCount:](self, "setWarmUpModeRequirementsCount:", v3);
  if (!v3 && !-[AXDisplayLinkManager isHandlingDisplayRefresh](self, "isHandlingDisplayRefresh"))
  {
    if (-[AXDisplayLinkManager hasUpdatedTargetActions](self, "hasUpdatedTargetActions"))
      _AXAssert();
    -[AXDisplayLinkManager activeTargetActions](self, "activeTargetActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      -[AXDisplayLinkManager _didRemoveLastTargetAction](self, "_didRemoveLastTargetAction");
  }
}

- (void)_displayDidRefresh:(id)a3
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[AXDisplayLinkManager isHandlingDisplayRefresh](self, "isHandlingDisplayRefresh", a3);
  -[AXDisplayLinkManager setHandlingDisplayRefresh:](self, "setHandlingDisplayRefresh:", 1);
  -[AXDisplayLinkManager activeTargetActions](self, "activeTargetActions");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "displayDidRefresh:", self, (_QWORD)v13);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[AXDisplayLinkManager setHandlingDisplayRefresh:](self, "setHandlingDisplayRefresh:", v4);
  if (v4 || !-[AXDisplayLinkManager hasUpdatedTargetActions](self, "hasUpdatedTargetActions"))
  {
    v11 = v5;
  }
  else
  {
    objc_msgSend(v5, "removeAllObjects");
    -[AXDisplayLinkManager updatedTargetActions](self, "updatedTargetActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXDisplayLinkManager setUpdatedTargetActions:](self, "setUpdatedTargetActions:", v5);
    -[AXDisplayLinkManager setActiveTargetActions:](self, "setActiveTargetActions:", v10);
    -[AXDisplayLinkManager setHasUpdatedTargetActions:](self, "setHasUpdatedTargetActions:", 0);
    v11 = v10;

    v12 = objc_msgSend(v11, "count");
    if (!v12)
      -[AXDisplayLinkManager _didRemoveLastTargetAction](self, "_didRemoveLastTargetAction");
  }

}

- (CADisplayLink)storedDisplayLink
{
  return self->_storedDisplayLink;
}

- (void)setStoredDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_storedDisplayLink, a3);
}

- (NSMutableSet)activeTargetActions
{
  return self->_activeTargetActions;
}

- (void)setActiveTargetActions:(id)a3
{
  objc_storeStrong((id *)&self->_activeTargetActions, a3);
}

- (NSMutableSet)updatedTargetActions
{
  return self->_updatedTargetActions;
}

- (void)setUpdatedTargetActions:(id)a3
{
  objc_storeStrong((id *)&self->_updatedTargetActions, a3);
}

- (BOOL)hasUpdatedTargetActions
{
  return self->_hasUpdatedTargetActions;
}

- (void)setHasUpdatedTargetActions:(BOOL)a3
{
  self->_hasUpdatedTargetActions = a3;
}

- (BOOL)isHandlingDisplayRefresh
{
  return self->_handlingDisplayRefresh;
}

- (void)setHandlingDisplayRefresh:(BOOL)a3
{
  self->_handlingDisplayRefresh = a3;
}

- (unint64_t)warmUpModeRequirementsCount
{
  return self->_warmUpModeRequirementsCount;
}

- (void)setWarmUpModeRequirementsCount:(unint64_t)a3
{
  self->_warmUpModeRequirementsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedTargetActions, 0);
  objc_storeStrong((id *)&self->_activeTargetActions, 0);
  objc_storeStrong((id *)&self->_storedDisplayLink, 0);
}

@end
