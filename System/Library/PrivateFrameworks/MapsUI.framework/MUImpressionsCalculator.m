@implementation MUImpressionsCalculator

- (void)_logExitForImpressionUIElement:(id)a3 usingExitDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[MUImpressionsCalculator observerBlock](self, "observerBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MUImpressionsCalculator observerBlock](self, "observerBlock");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
  -[MUImpressionsCalculatorConfiguration logger](self->_configuration, "logger");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "logImpressionElementDidExit:usingEnterDate:exitDate:", v10, v11, v6);
}

- (void)_logEnterForImpressionUIElement:(id)a3 usingStartDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[MUImpressionsCalculator observerBlock](self, "observerBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MUImpressionsCalculator observerBlock](self, "observerBlock");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
  -[MUImpressionsCalculatorConfiguration logger](self->_configuration, "logger");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "logImpressionElementDidEnter:onDate:", v10, v6);
}

- (NSString)debugState
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  _BYTE v46[128];
  uint64_t v47;
  CGSize v48;
  CGPoint v49;
  CGRect v50;
  CGRect v51;

  v47 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_uiElementsByIdentifiers, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "state");
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "clientElement");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "debugString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        NSStringFromCGRect(v50);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ | %@    |   %@"), v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == 1)
          v18 = v5;
        else
          v18 = v40;
        objc_msgSend(v18, "addObject:", v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session Identifier: %@\n"), self->_sessionIdentifier);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(v5, "insertObject:atIndex:", CFSTR("Visible Elements"), 0);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "insertObject:atIndex:", CFSTR("Nonvisible Elements"), 0);
  objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImpressionsCalculator scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentOffset");
  v23 = v22;
  v25 = v24;
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v21, "frame");
  NSStringFromCGRect(v51);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentSize");
  NSStringFromCGSize(v48);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49.x = v23;
  v49.y = v25;
  NSStringFromCGPoint(v49);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Scrollview Metrics\nframe: %@\ncontentSize %@\ncontent offset: %@\ntype: %@"), v27, v28, v29, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v37;
  v45[1] = v36;
  v45[2] = v20;
  v45[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n\n"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v34;
}

uint64_t __37__MUImpressionsCalculator_debugState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (MUImpressionsCalculator)initWithConfiguration:(id)a3
{
  id v5;
  MUImpressionsCalculator *v6;
  MUImpressionsCalculator *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *uiElementsByIdentifiers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUImpressionsCalculator;
  v6 = -[MUImpressionsCalculator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uiElementsByIdentifiers = v7->_uiElementsByIdentifiers;
    v7->_uiElementsByIdentifiers = v8;

    -[MUImpressionsCalculator _registerForBackgroundingNotifications](v7, "_registerForBackgroundingNotifications");
  }

  return v7;
}

- (void)setSessionIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  NSUUID *sessionIdentifier;
  NSObject *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[NSUUID isEqual:](self->_sessionIdentifier, "isEqual:", v5) & 1) == 0)
  {
    MUGetMUImpressionVisibilityCheckingLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      sessionIdentifier = self->_sessionIdentifier;
      v9 = 138412546;
      v10 = sessionIdentifier;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_INFO, "Rotating Session Identifier %@ with %@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)&self->_sessionIdentifier, a3);
    -[NSMutableDictionary removeAllObjects](self->_uiElementsByIdentifiers, "removeAllObjects");
    MUGetMUImpressionVisibilityCheckingLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_INFO, "Finished removing items and removed the working set", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)_checkVisibilityForAllItemsOnDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MUImpressionsCalculator isActive](self, "isActive"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary allValues](self->_uiElementsByIdentifiers, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[MUImpressionsCalculator _checkVisibilityForElement:onDate:](self, "_checkVisibilityForElement:onDate:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_checkVisibilityForElement:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSUUID *sessionIdentifier;
  NSObject *v46;
  void *v47;
  NSUUID *v48;
  double v49;
  double v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  double v54;
  double v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  NSUUID *v59;
  __int16 v60;
  double v61;
  uint64_t v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[MUImpressionsCalculator isActive](self, "isActive"))
  {
    objc_msgSend(v6, "clientElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibilityThreshold");
    v10 = v9;

    v11 = objc_msgSend(v6, "state");
    v12 = 0.0;
    if (v11 != 1)
      v12 = v10;
    v55 = v12;
    -[MUImpressionsCalculator scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[MUImpressionsCalculatorConfiguration hostingContainerView](self->_configuration, "hostingContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:toView:", v22, v15, v17, v19, v21);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    objc_msgSend(v13, "frame");
    v69.origin.x = v31;
    v69.origin.y = v32;
    v69.size.width = v33;
    v69.size.height = v34;
    v63.origin.x = v24;
    v63.origin.y = v26;
    v63.size.width = v28;
    v63.size.height = v30;
    v64 = CGRectIntersection(v63, v69);
    x = v64.origin.x;
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
    objc_msgSend(v6, "clientElement");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "sessionIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqual:", self->_sessionIdentifier);

    if ((v41 & 1) == 0)
    {
      MUGetMUImpressionVisibilityCheckingLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "clientElement");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "sessionIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        sessionIdentifier = self->_sessionIdentifier;
        *(_DWORD *)buf = 138412546;
        v57 = v44;
        v58 = 2112;
        v59 = sessionIdentifier;
        _os_log_impl(&dword_191DB8000, v42, OS_LOG_TYPE_INFO, "Mismatch of session identifiers %@ with element identifier %@", buf, 0x16u);

      }
    }
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    if (CGRectIsNull(v65)
      || (v66.origin.x = x,
          v66.origin.y = y,
          v66.size.width = width,
          v66.size.height = height,
          CGRectGetHeight(v66) <= 0.0))
    {
      MUGetMUImpressionVisibilityCheckingLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191DB8000, v51, OS_LOG_TYPE_DEBUG, "No intersection", buf, 2u);
      }

    }
    else
    {
      v54 = height / v30;
      MUGetMUImpressionVisibilityCheckingLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v67.origin.x = x;
        v67.origin.y = y;
        v67.size.width = width;
        v67.size.height = height;
        NSStringFromCGRect(v67);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v68.origin.x = v24;
        v68.origin.y = v26;
        v68.size.width = v28;
        v68.size.height = v30;
        NSStringFromCGRect(v68);
        v48 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v57 = v47;
        v58 = 2112;
        v59 = v48;
        v60 = 2048;
        v61 = height / v30;
        _os_log_impl(&dword_191DB8000, v46, OS_LOG_TYPE_DEBUG, "Comparing a intersection %@ within parent frame %@ and visible percent is %f", buf, 0x20u);

      }
      v50 = height / v30;
      v49 = v55;
      if (v54 >= v55)
      {
        if (!objc_msgSend(v6, "state", v55, v54))
        {
          objc_msgSend(v6, "setState:", 1);
          objc_msgSend(v6, "setStartDate:", v7);
          -[MUImpressionsCalculator _logEnterForImpressionUIElement:usingStartDate:](self, "_logEnterForImpressionUIElement:usingStartDate:", v6, v7);
        }
LABEL_24:

        goto LABEL_25;
      }
    }
    if (objc_msgSend(v6, "state", v49, v50, *(_QWORD *)&v54) == 1)
    {
      objc_msgSend(v6, "setState:", 0);
      objc_msgSend(v6, "startDate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        -[MUImpressionsCalculator _logExitForImpressionUIElement:usingExitDate:](self, "_logExitForImpressionUIElement:usingExitDate:", v6, v7);
      }
      else
      {
        MUGetMUImpressionVisibilityCheckingLog();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_191DB8000, v53, OS_LOG_TYPE_DEBUG, "For some reason we have a nil start date", buf, 2u);
        }

      }
    }
    goto LABEL_24;
  }
LABEL_25:

}

- (id)_uiElementForIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_uiElementsByIdentifiers, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[MUImpressionsCalculator _logWorkingSetWithDidBecomeVisible:](self, "_logWorkingSetWithDidBecomeVisible:");
  }
}

- (void)_logWorkingSetWithDidBecomeVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MUImpressionsCalculator uiElementsByIdentifiers](self, "uiElementsByIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    *(_QWORD *)&v9 = 138412290;
    v22 = v9;
    v23 = v3;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "state", v22) == 1)
        {
          if (v3)
          {
            objc_msgSend(v13, "startDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              MUGetMUImpressionVisibilityCheckingLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v13, "clientElement");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "elementIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v22;
                v29 = v17;
                _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_INFO, "Did become visible so Start date of element is nil %@", buf, 0xCu);

                v3 = v23;
              }

            }
            objc_msgSend(v13, "setStartDate:", v5);
            -[MUImpressionsCalculator _logEnterForImpressionUIElement:usingStartDate:](self, "_logEnterForImpressionUIElement:usingStartDate:", v13, v5);
          }
          else
          {
            -[MUImpressionsCalculator _logExitForImpressionUIElement:usingExitDate:](self, "_logExitForImpressionUIElement:usingExitDate:", v13, v5);
            objc_msgSend(v13, "startDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              MUGetMUImpressionVisibilityCheckingLog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v13, "clientElement");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "elementIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v22;
                v29 = v21;
                _os_log_impl(&dword_191DB8000, v19, OS_LOG_TYPE_INFO, "Start date is already nil %@", buf, 0xCu);

                v3 = v23;
              }

            }
            objc_msgSend(v13, "setStartDate:", 0);
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v10);
  }

}

- (UIScrollView)scrollView
{
  return -[MUImpressionsCalculatorConfiguration scrollView](self->_configuration, "scrollView");
}

- (BOOL)hasImpressionElements
{
  void *v2;
  BOOL v3;

  -[MUImpressionsCalculator uiElementsByIdentifiers](self, "uiElementsByIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_registerForBackgroundingNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willEnterForeground_, *MEMORY[0x1E0DC5338], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__didEnterBackground_, *MEMORY[0x1E0DC5318], 0);

}

- (void)_willEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  MUGetMUImpressionCalculatorBackgroundingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "Will enter foreground", v6, 2u);
  }

  -[MUImpressionsCalculator _handleNotification:withProposedActiveState:](self, "_handleNotification:withProposedActiveState:", v4, 1);
}

- (void)_didEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  MUGetMUImpressionCalculatorBackgroundingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "Did enter background", v6, 2u);
  }

  -[MUImpressionsCalculator _handleNotification:withProposedActiveState:](self, "_handleNotification:withProposedActiveState:", v4, 0);
}

- (void)_handleNotification:(id)a3 withProposedActiveState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  _DWORD v16[2];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUImpressionsCalculator scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    MUGetMUImpressionCalculatorBackgroundingLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v9 == v12)
    {
      if (v14)
      {
        v16[0] = 67109120;
        v16[1] = v4;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "Updating scene with proposed state %d", (uint8_t *)v16, 8u);
      }

      -[MUImpressionsCalculator setActive:](self, "setActive:", v4);
    }
    else
    {
      if (v14)
      {
        LOWORD(v16[0]) = 0;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "Scene notification belongs to another window. Early exit.", (uint8_t *)v16, 2u);
      }

    }
  }
  else
  {
    MUGetMUImpressionCalculatorBackgroundingLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_INFO, "Notification is not a scene. Early exit.", (uint8_t *)v16, 2u);
    }

  }
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (void)setObserverBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MUImpressionsCalculatorConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSMutableDictionary)uiElementsByIdentifiers
{
  return self->_uiElementsByIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiElementsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_observerBlock, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
