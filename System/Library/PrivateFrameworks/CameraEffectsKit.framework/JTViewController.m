@implementation JTViewController

- (NSMutableDictionary)suspendedChildViewControllerRequests
{
  NSMutableDictionary *suspendedChildViewControllerRequests;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  suspendedChildViewControllerRequests = self->_suspendedChildViewControllerRequests;
  if (!suspendedChildViewControllerRequests)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_suspendedChildViewControllerRequests;
    self->_suspendedChildViewControllerRequests = v4;

    suspendedChildViewControllerRequests = self->_suspendedChildViewControllerRequests;
  }
  return suspendedChildViewControllerRequests;
}

- (NSMutableArray)suspendInteractionTags
{
  NSMutableArray *suspendInteractionTags;
  NSMutableArray *v4;
  NSMutableArray *v5;

  suspendInteractionTags = self->_suspendInteractionTags;
  if (!suspendInteractionTags)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_suspendInteractionTags;
    self->_suspendInteractionTags = v4;

    suspendInteractionTags = self->_suspendInteractionTags;
  }
  return suspendInteractionTags;
}

- (void)logSuspendedViewControllers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "\n%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)logSuspendedChildViewControllersToString:(id)a3 indentLevel:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v4 = *(_QWORD *)&a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[JTViewController suspendInteractionTags](self, "suspendInteractionTags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[JTViewController suspendInteractionTags](self, "suspendInteractionTags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("%*s%@ suspend count %lu\n"), v4, " ", v10, objc_msgSend(v11, "count"));

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[JTViewController suspendInteractionTags](self, "suspendInteractionTags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v6, "appendFormat:", CFSTR("%*s suspended with tag \"%@\"\n"), v4, " ", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v14);
    }

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[JTViewController childViewControllers](self, "childViewControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    v21 = (v4 + 1);
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v22);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v23, "logSuspendedChildViewControllersToString:indentLevel:", v6, v21);
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

}

- (void)suspendInteractionWithTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[JTViewController suspendInteractionTags](self, "suspendInteractionTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[JTViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isUserInteractionEnabled");

  if ((_DWORD)v5)
  {
    -[JTViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  }
}

- (void)resumeInteractionWithTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v4 = a3;
  -[JTViewController suspendInteractionTags](self, "suspendInteractionTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[JTViewController suspendInteractionTags](self, "suspendInteractionTags");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    -[JTViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUserInteractionEnabled");

    if ((v7 & 1) != 0)
      return;
    -[JTViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 1);
  }

}

- (JTView)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JTViewController;
  -[JTViewController view](&v3, sel_view);
  return (JTView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setView:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JTViewController;
  -[JTViewController setView:](&v3, sel_setView_, a3);
}

- (void)viewDidLoad
{
  void *v3;
  char isKindOfClass;
  _BOOL8 v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)JTViewController;
  -[JTViewController viewDidLoad](&v8, sel_viewDidLoad);
  if (-[JTViewController debuggingUIEnabled](self, "debuggingUIEnabled"))
  {
    -[JTViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v5 = -[JTViewController debuggingUIEnabled](self, "debuggingUIEnabled");
      -[JTViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDebuggingUIEnabled:", v5);

    }
    -[JTViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JTViewController;
  -[JTViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[JTViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JTViewController;
  -[JTViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[JTViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)suspendChildViewControllersInteractionWithTag:(id)a3 timeout:(double)a4 excluding:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  -[JTViewController suspendedChildViewControllerRequests](self, "suspendedChildViewControllerRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    JFXLog_core();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[JTViewController suspendChildViewControllersInteractionWithTag:timeout:excluding:].cold.1();

  }
  else
  {
    +[JTSuspendedInteractionRequest requestWithTag:excludedViewControllers:](JTSuspendedInteractionRequest, "requestWithTag:excludedViewControllers:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[JTViewController setChildViewControllerInteractionEnabledWithRequest:enabled:](self, "setChildViewControllerInteractionEnabledWithRequest:enabled:", v11, 0);
    -[JTViewController suspendedChildViewControllerRequests](self, "suspendedChildViewControllerRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v8);

    if (a4 != 0.0)
      -[JTViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_timeoutInteractionSuspended_, v8, a4);
  }

}

- (void)resumeInteractionForChildViewControllersWithTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_timeoutInteractionSuspended_, v4);
  -[JTViewController suspendedChildViewControllerRequests](self, "suspendedChildViewControllerRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[JTViewController setChildViewControllerInteractionEnabledWithRequest:enabled:](self, "setChildViewControllerInteractionEnabledWithRequest:enabled:", v6, 1);
    -[JTViewController suspendedChildViewControllerRequests](self, "suspendedChildViewControllerRequests");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v7, "removeObjectForKey:", v4);
  }
  else
  {
    JFXLog_core();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[JTViewController resumeInteractionForChildViewControllersWithTag:].cold.1();
  }

}

- (void)timeoutInteractionSuspended:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  JFXLog_core();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JTViewController timeoutInteractionSuspended:].cold.1();

  -[JTViewController resumeInteractionForChildViewControllersWithTag:](self, "resumeInteractionForChildViewControllersWithTag:", v4);
}

- (void)setChildViewControllerInteractionEnabledWithRequest:(id)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  -[JTViewController childViewControllers](self, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "excludedChildViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "excludedChildViewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectsInArray:", v11);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "tag");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v4)
            objc_msgSend(v17, "resumeInteractionWithTag:", v18);
          else
            objc_msgSend(v17, "suspendInteractionWithTag:", v18);
        }
        else
        {
          JFXLog_core();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v17;
            _os_log_debug_impl(&dword_2269A9000, v18, OS_LOG_TYPE_DEBUG, "expected %@ to be a JTViewController", buf, 0xCu);
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v14);
  }

}

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  void *v4;
  int v5;

  -[JTViewController viewControllerDrivingStatusAppearance](self, "viewControllerDrivingStatusAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[JTViewController viewControllerDrivingStatusAppearance](self, "viewControllerDrivingStatusAppearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v4, "prefersStatusBarHidden");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "jfx_hasTrueDepthFrontCamera") ^ 1;
  }

  return v5;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;

  -[JTViewController viewControllerDrivingStatusAppearance](self, "viewControllerDrivingStatusAppearance");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[JTViewController viewControllerDrivingStatusAppearance](self, "viewControllerDrivingStatusAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(CFSTR("prefersHomeIndicatorAutoHidden"));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  -[JTViewController viewControllerDrivingStatusAppearance](self, "viewControllerDrivingStatusAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "performSelector:", NSSelectorFromString(CFSTR("prefersHomeIndicatorAutoHidden"))) != 0;

  return v8;
}

- (BOOL)debuggingUIEnabled
{
  return self->_debuggingUIEnabled;
}

- (void)setDebuggingUIEnabled:(BOOL)a3
{
  self->_debuggingUIEnabled = a3;
}

- (UIViewController)viewControllerDrivingStatusAppearance
{
  return self->_viewControllerDrivingStatusAppearance;
}

- (void)setViewControllerDrivingStatusAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerDrivingStatusAppearance, a3);
}

- (void)setSuspendedChildViewControllerRequests:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedChildViewControllerRequests, a3);
}

- (void)setSuspendInteractionTags:(id)a3
{
  objc_storeStrong((id *)&self->_suspendInteractionTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendInteractionTags, 0);
  objc_storeStrong((id *)&self->_suspendedChildViewControllerRequests, 0);
  objc_storeStrong((id *)&self->_viewControllerDrivingStatusAppearance, 0);
}

- (void)suspendChildViewControllersInteractionWithTag:timeout:excluding:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "child view controllers already suspended with tag \"%@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)resumeInteractionForChildViewControllersWithTag:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "child view controllers were not suspended with tag \"%@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)timeoutInteractionSuspended:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "suspend interaction tag \"%@\" timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
