@implementation _FEFocusUpdateContext

- (_FEFocusUpdateContext)init
{
  NSObject *v3;
  _FEFocusSystem *v4;
  void *v5;
  _FEFocusUpdateContext *v6;
  uint8_t v8[16];

  logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_23C48C000, v3, OS_LOG_TYPE_FAULT, "-init is not a useful initializer for this class. Use one of the designated initializers instead.", v8, 2u);
  }

  v4 = -[_FEFocusSystem initWithFocusBehavior:]([_FEFocusSystem alloc], "initWithFocusBehavior:", 0);
  +[_FEFocusUpdateRequest requestForRemovingFocusInFocusSystem:](_FEFocusUpdateRequest, "requestForRemovingFocusInFocusSystem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_FEFocusUpdateContext _initWithFocusUpdateRequest:](self, "_initWithFocusUpdateRequest:", v5);

  return v6;
}

- (id)_initWithFocusUpdateRequest:(id)a3
{
  id v6;
  _FEFocusUpdateContext *v7;
  _FEFocusUpdateContext *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _FEFocusItemInfo *sourceItemInfo;
  void *v13;
  void *v14;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateContext.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v17.receiver = self;
  v17.super_class = (Class)_FEFocusUpdateContext;
  v7 = -[_FEFocusUpdateContext init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_request, a3);
    objc_msgSend(v6, "focusSystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "focusedItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FEFocusItemInfo infoWithItem:](_FEFocusItemInfo, "infoWithItem:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sourceItemInfo = v8->_sourceItemInfo;
    v8->_sourceItemInfo = (_FEFocusItemInfo *)v11;

    if (objc_msgSend(v6, "isFocusRemovalRequest"))
    {
      objc_storeWeak((id *)&v8->_initialDestinationEnvironment, 0);
    }
    else
    {
      objc_msgSend(v6, "destinationEnvironment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_storeWeak((id *)&v8->_initialDestinationEnvironment, v13);
      }
      else
      {
        objc_msgSend(v6, "environment");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&v8->_initialDestinationEnvironment, v14);

      }
    }
    *(_BYTE *)&v8->_flags |= 4u;
    objc_msgSend(v6, "cacheCurrentFocusSystem");
    -[_FEFocusUpdateContext _cacheFocusBehavior](v8, "_cacheFocusBehavior");
  }

  return v8;
}

- (id)_initWithFocusMovementRequest:(id)a3 nextFocusedItem:(id)a4
{
  id v8;
  id v9;
  _FEFocusUpdateContext *v10;
  _FEFocusUpdateContext *v11;
  uint64_t v12;
  _FEFocusMovementInfo *focusMovement;
  uint64_t v14;
  _FEFocusItemInfo *sourceItemInfo;
  void *v16;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateContext.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v19.receiver = self;
  v19.super_class = (Class)_FEFocusUpdateContext;
  v10 = -[_FEFocusUpdateContext init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a3);
    objc_msgSend(v8, "movementInfo");
    v12 = objc_claimAutoreleasedReturnValue();
    focusMovement = v11->_focusMovement;
    v11->_focusMovement = (_FEFocusMovementInfo *)v12;

    objc_msgSend(v8, "focusedItemInfo");
    v14 = objc_claimAutoreleasedReturnValue();
    sourceItemInfo = v11->_sourceItemInfo;
    v11->_sourceItemInfo = (_FEFocusItemInfo *)v14;

    objc_storeWeak((id *)&v11->_initialDestinationEnvironment, v9);
    *(_BYTE *)&v11->_flags |= 4u;
    objc_msgSend(v8, "movementInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v11->_flags = *(_BYTE *)&v11->_flags & 0xF7 | (8 * ((objc_msgSend(v16, "heading") & 0x300) != 0));

    -[_FEFocusUpdateContext _cacheFocusBehavior](v11, "_cacheFocusBehavior");
  }

  return v11;
}

- (id)_initWithContext:(id)a3
{
  id *v4;
  _FEFocusUpdateContext *v5;
  _FEFocusUpdateContext *v6;
  id WeakRetained;
  id v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  _FEFocusBehavior *focusBehavior;
  objc_super v16;

  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)_FEFocusUpdateContext;
  v5 = -[_FEFocusUpdateContext init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_request, v4[9]);
    objc_storeStrong((id *)&v6->_sourceItemInfo, v4[10]);
    objc_storeStrong((id *)&v6->_destinationItemInfo, v4[2]);
    objc_storeStrong((id *)&v6->_focusMovement, v4[11]);
    WeakRetained = objc_loadWeakRetained(v4 + 13);
    objc_storeWeak((id *)&v6->_initialDestinationEnvironment, WeakRetained);

    v8 = objc_loadWeakRetained(v4 + 19);
    objc_storeWeak((id *)&v6->_focusedGuide, v8);

    v6->_focusRedirectedByGuide = *((_BYTE *)v4 + 13);
    objc_storeStrong((id *)&v6->_regionMapSnapshots, v4[16]);
    objc_storeStrong((id *)&v6->_regionMapSnapshotsVisualRepresentation, v4[6]);
    v9 = *(_BYTE *)&v6->_flags & 0xFE | (_BYTE)v4[1] & 1;
    *(_BYTE *)&v6->_flags = v9;
    v10 = v9 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)v4 + 8) >> 1) & 1));
    *(_BYTE *)&v6->_flags = v10;
    v11 = v10 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)v4 + 8) >> 2) & 1));
    *(_BYTE *)&v6->_flags = v11;
    *(_BYTE *)&v6->_flags = v11 & 0xF7 | (_BYTE)v4[1] & 8;
    v12 = objc_loadWeakRetained(v4 + 3);
    objc_storeWeak((id *)&v6->_commonAncestorEnvironment, v12);

    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xEF | (_BYTE)v4[1] & 0x10;
    objc_msgSend(v4, "focusBehavior");
    v13 = objc_claimAutoreleasedReturnValue();
    focusBehavior = v6->_focusBehavior;
    v6->_focusBehavior = (_FEFocusBehavior *)v13;

  }
  return v6;
}

- (void)_cacheFocusBehavior
{
  void *v3;
  _FEFocusBehavior *v4;
  _FEFocusBehavior *focusBehavior;
  id v6;

  -[_FEFocusUpdateContext _request](self, "_request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusSystem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "behavior");
  v4 = (_FEFocusBehavior *)objc_claimAutoreleasedReturnValue();
  focusBehavior = self->_focusBehavior;
  self->_focusBehavior = v4;

}

- (BOOL)_isValidInFocusSystem:(id)a3
{
  _FEFocusUpdateRequesting *request;
  id v5;
  id v6;
  char flags;

  request = self->_request;
  v5 = a3;
  -[_FEFocusUpdateRequesting focusSystem](request, "focusSystem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    return 0;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    flags = *(_BYTE *)&self->_flags & 0xFC | -[_FEFocusUpdateContext _validate](self, "_validate") | 2;
    *(_BYTE *)&self->_flags = flags;
  }
  return flags & 1;
}

- (BOOL)_validate
{
  void *v3;
  void *v4;
  void *v5;
  _FEDebugIssueReport *v6;
  uint64_t v7;
  _FEDebugIssueReport *v8;
  unsigned int (**v9)(_QWORD);
  _BYTE *v10;
  $7E0C05635123E2A0FF21903DA08D55EC flags;
  int v12;
  BOOL v13;
  int v14;
  int v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char v30;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  _FEFocusUpdateContext *v40;
  id v41;
  id v42;
  unsigned int (**v43)(_QWORD);
  uint64_t *v44;
  _QWORD v45[4];
  _FEDebugIssueReport *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  -[_FEFocusUpdateContext previouslyFocusedItem](self, "previouslyFocusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusUpdateContext nextFocusedItem](self, "nextFocusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusUpdateContext _request](self, "_request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_validationReport;
  v7 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __34___FEFocusUpdateContext__validate__block_invoke;
  v45[3] = &unk_250D3A750;
  v47 = &v48;
  v8 = v6;
  v46 = v8;
  v9 = (unsigned int (**)(_QWORD))MEMORY[0x2426205A4](v45);
  if (v3 != v4)
    goto LABEL_9;
  if ((objc_msgSend(v5, "allowsFocusingCurrentItem") & 1) == 0)
  {
    flags = self->_flags;
    v12 = (*(unsigned int *)&flags >> 3) & 1;
    *((_BYTE *)v49 + 24) = (*(_BYTE *)&flags & 8) != 0;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
      v13 = -[_FEFocusUpdateContext _focusRedirectedByGuide](self, "_focusRedirectedByGuide");
      v10 = v49 + 3;
      if (v13)
        goto LABEL_4;
      v12 = *v10;
    }
    if (v12)
      goto LABEL_9;
    -[_FEFocusUpdateContext _focusMovement](self, "_focusMovement");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
      goto LABEL_9;
    -[_FEFocusUpdateContext _initialDestinationEnvironment](self, "_initialDestinationEnvironment");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v33)
      goto LABEL_9;
  }
  v10 = v49 + 3;
LABEL_4:
  *v10 = 1;
LABEL_9:
  if (v9[2](v9))
  {
    v14 = objc_msgSend(v5, "requiresNextFocusedItem");
    v15 = v4 ? 0 : v14;
    if (v15 == 1)
    {
      *((_BYTE *)v49 + 24) = 0;
      if (v8)
      {
        if (v3)
        {
          +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", CFSTR("There is no next focused item, but updating focus to nil is not allowed."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_FEDebugIssueReport addIssue:](v8, "addIssue:", v16);

        }
      }
    }
  }
  v17 = v9[2](v9);
  if (v4)
    v18 = v17;
  else
    v18 = 0;
  if (v18 == 1)
  {
    -[_FEFocusUpdateRequesting focusSystem](self->_request, "focusSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 != v20)
      *((_BYTE *)v49 + 24) = 0;
  }
  if (v9[2](v9) && objc_msgSend(v5, "requiresEnvironmentValidation"))
  {
    if (v8)
    {
      +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", CFSTR("The following ancestor environments of the previously focused item prevented the focus update from occurring:"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", CFSTR("The following ancestor environments of the next focused item prevented the focus update from occurring:"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    objc_msgSend(v5, "focusSystem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v7;
    v35 = 3221225472;
    v36 = __34___FEFocusUpdateContext__validate__block_invoke_2;
    v37 = &unk_250D3A778;
    v38 = v3;
    v44 = &v48;
    v39 = v4;
    v40 = self;
    v24 = v21;
    v41 = v24;
    v43 = v9;
    v25 = v22;
    v42 = v25;
    objc_msgSend(v23, "_performWithoutFocusUpdates:", &v34);

    if (v8)
    {
      objc_msgSend(v24, "subissues", v34, v35, v36, v37, v38, v39, v40, v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
        -[_FEDebugIssueReport addIssue:](v8, "addIssue:", v24);
      objc_msgSend(v25, "subissues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v29)
        -[_FEDebugIssueReport addIssue:](v8, "addIssue:", v25);
    }

  }
  v30 = *((_BYTE *)v49 + 24);

  _Block_object_dispose(&v48, 8);
  return v30;
}

- (_FEFocusItem)previouslyFocusedItem
{
  void *v2;
  void *v3;

  -[_FEFocusUpdateContext _sourceItemInfo](self, "_sourceItemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_FEFocusItem *)v3;
}

- (_FEFocusItem)nextFocusedItem
{
  void *v2;
  void *v3;

  -[_FEFocusUpdateContext _destinationItemInfo](self, "_destinationItemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_FEFocusItem *)v3;
}

- (void)_setSourceItemInfo:(id)a3
{
  _FEFocusItemInfo *v4;
  _FEFocusItemInfo *sourceItemInfo;

  if (self->_sourceItemInfo != a3)
  {
    v4 = (_FEFocusItemInfo *)objc_msgSend(a3, "copy");
    sourceItemInfo = self->_sourceItemInfo;
    self->_sourceItemInfo = v4;

    *(_BYTE *)&self->_flags &= ~2u;
  }
}

- (_FEFocusItemInfo)_destinationItemInfo
{
  -[_FEFocusUpdateContext _updateDestinationItemIfNeeded](self, "_updateDestinationItemIfNeeded");
  return self->_destinationItemInfo;
}

- (void)_setInitialDestinationEnvironment:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_initialDestinationEnvironment, obj);
    v5 = obj;
    *(_BYTE *)&self->_flags |= 4u;
  }

}

- (void)_updateDestinationItemIfNeeded
{
  _UIDeepestPreferredEnvironmentSearch *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _FEFocusItemInfo *v8;
  _FEFocusItemInfo *destinationItemInfo;
  _FEDebugLogReport *preferredFocusReport;
  void *v11;
  void *v12;
  _FEFocusItemInfo *v13;
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)&self->_flags &= ~4u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);
    if (WeakRetained)
    {
      v3 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
      -[_FEFocusUpdateContext _request](self, "_request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDeepestPreferredEnvironmentSearch setAllowsOverridingPreferedFocusEnvironments:](v3, "setAllowsOverridingPreferedFocusEnvironments:", objc_msgSend(v4, "allowsOverridingPreferedFocusEnvironments"));

      if (self->_preferredFocusReport)
      {
        +[_FEDebugLogNode rootNode](_FEDebugLogNode, "rootNode");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIDeepestPreferredEnvironmentSearch setDebugLog:](v3, "setDebugLog:", v5);

      }
      -[_FEFocusUpdateContext _request](self, "_request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDeepestPreferredEnvironmentSearch deepestPreferredFocusableItemForEnvironment:withRequest:](v3, "deepestPreferredFocusableItemForEnvironment:withRequest:", WeakRetained, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[_FEFocusItemInfo infoWithItem:](_FEFocusItemInfo, "infoWithItem:", v7);
      v8 = (_FEFocusItemInfo *)objc_claimAutoreleasedReturnValue();
      destinationItemInfo = self->_destinationItemInfo;
      self->_destinationItemInfo = v8;

      preferredFocusReport = self->_preferredFocusReport;
      if (preferredFocusReport)
      {
        -[_UIDeepestPreferredEnvironmentSearch debugLog](v3, "debugLog");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_FEDebugLogReport addMessage:](preferredFocusReport, "addMessage:", v12);

      }
    }
    else
    {
      +[_FEFocusItemInfo infoWithItem:](_FEFocusItemInfo, "infoWithItem:", 0);
      v13 = (_FEFocusItemInfo *)objc_claimAutoreleasedReturnValue();
      v3 = (_UIDeepestPreferredEnvironmentSearch *)self->_destinationItemInfo;
      self->_destinationItemInfo = v13;
    }

  }
}

- (_FEFocusEnvironment)_commonAncestorEnvironment
{
  void *v3;
  void *v4;
  void *v5;

  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    -[_FEFocusUpdateContext previouslyFocusedItem](self, "previouslyFocusedItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEFocusUpdateContext nextFocusedItem](self, "nextFocusedItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _FEFocusEnvironmentFirstCommonAncestor(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_commonAncestorEnvironment, v5);

    *(_BYTE *)&self->_flags |= 0x10u;
  }
  return (_FEFocusEnvironment *)objc_loadWeakRetained((id *)&self->_commonAncestorEnvironment);
}

- (unint64_t)focusHeading
{
  void *v2;
  unint64_t v3;

  -[_FEFocusUpdateContext _focusMovement](self, "_focusMovement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "heading");

  return v3;
}

- (CGVector)_focusVelocity
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGVector result;

  -[_FEFocusUpdateContext _destinationViewDistanceOffscreen](self, "_destinationViewDistanceOffscreen");
  if (v3 == 0.0)
  {
    -[_FEFocusUpdateContext _focusMovement](self, "_focusMovement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_velocity");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.dy = v10;
  result.dx = v9;
  return result;
}

- (void)_setFocusedGuide:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedGuide);

  if (WeakRetained != obj)
    objc_storeWeak((id *)&self->_focusedGuide, obj);
  v5 = objc_loadWeakRetained((id *)&self->_focusedGuide);
  -[_FEFocusUpdateContext _setFocusRedirectedByGuide:](self, "_setFocusRedirectedByGuide:", v5 != 0);

}

- (void)_setFocusRedirectedByGuide:(BOOL)a3
{
  self->_focusRedirectedByGuide = a3;
}

- (void)_setFocusMapSearchInfo:(id)a3
{
  _FEFocusMapSearchInfo *v5;
  _FEFocusMapSearchInfo **p_focusMapSearchInfo;
  _FEFocusMapSearchInfo *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (_FEFocusMapSearchInfo *)a3;
  p_focusMapSearchInfo = &self->_focusMapSearchInfo;
  if (self->_focusMapSearchInfo != v5)
  {
    objc_storeStrong((id *)&self->_focusMapSearchInfo, a3);
    v7 = *p_focusMapSearchInfo;
    if (*p_focusMapSearchInfo)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[_FEFocusMapSearchInfo destinationRegions](v7, "destinationRegions", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_willParticipateAsDestinationRegionInFocusUpdate:", self);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
  }

}

- (void)_willUpdateFocusFromFocusedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_FEFocusUpdateContext previouslyFocusedItem](self, "previouslyFocusedItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 != v7)
  {
    +[_FEFocusItemInfo infoWithItem:](_FEFocusItemInfo, "infoWithItem:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEFocusUpdateContext _setSourceItemInfo:](self, "_setSourceItemInfo:", v6);

    v5 = v7;
  }

}

- (void)_didUpdateFocus
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_FEFocusUpdateContext _focusMapSearchInfo](self, "_focusMapSearchInfo", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationRegions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_didParticipateAsDestinationRegionInFocusUpdate:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_restoreRestrictedFocusMovementWithMovement:(id)a3
{
  objc_storeStrong((id *)&self->_focusMovement, a3);
}

- (void)_updateWithFocusGroupMap:(id)a3
{
  id v4;
  _UIDynamicFocusGroupMap *v5;
  NSString *previouslyFocusedGroupIdentifier;
  NSString *nextFocusedGroupIdentifier;

  v4 = a3;
  v5 = -[_UIDynamicFocusGroupMap initWithBackingFocusGroupMap:]([_UIDynamicFocusGroupMap alloc], "initWithBackingFocusGroupMap:", v4);

  -[_FEFocusUpdateContext _setFocusGroupMap:](self, "_setFocusGroupMap:", v5);
  previouslyFocusedGroupIdentifier = self->_previouslyFocusedGroupIdentifier;
  self->_previouslyFocusedGroupIdentifier = 0;

  nextFocusedGroupIdentifier = self->_nextFocusedGroupIdentifier;
  self->_nextFocusedGroupIdentifier = 0;

}

- (_UIDynamicFocusGroupMap)_focusGroupMap
{
  _UIDynamicFocusGroupMap *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIDynamicFocusGroupMap *v8;
  _UIDynamicFocusGroupMap *focusGroupMap;

  if (!self->_focusGroupMap && -[_FEFocusUpdateContext _isFilteredToGroup](self, "_isFilteredToGroup"))
  {
    v3 = [_UIDynamicFocusGroupMap alloc];
    -[_FEFocusUpdateContext _request](self, "_request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_focusItemContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_focusCoordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UIDynamicFocusGroupMap initWithCoordinateSpace:](v3, "initWithCoordinateSpace:", v7);
    focusGroupMap = self->_focusGroupMap;
    self->_focusGroupMap = v8;

  }
  return self->_focusGroupMap;
}

- (NSString)_previouslyFocusedGroupIdentifier
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *previouslyFocusedGroupIdentifier;

  if (!self->_previouslyFocusedGroupIdentifier
    && -[_FEFocusUpdateContext _isFilteredToGroup](self, "_isFilteredToGroup"))
  {
    -[_FEFocusUpdateContext previouslyFocusedItem](self, "previouslyFocusedItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_FEFocusUpdateContext _focusGroupMap](self, "_focusGroupMap");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "focusGroupIdentifierForItem:", v3);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      previouslyFocusedGroupIdentifier = self->_previouslyFocusedGroupIdentifier;
      self->_previouslyFocusedGroupIdentifier = v5;

    }
  }
  return self->_previouslyFocusedGroupIdentifier;
}

- (NSString)_nextFocusedGroupIdentifier
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *nextFocusedGroupIdentifier;

  if (!self->_nextFocusedGroupIdentifier && -[_FEFocusUpdateContext _isFilteredToGroup](self, "_isFilteredToGroup"))
  {
    -[_FEFocusUpdateContext nextFocusedItem](self, "nextFocusedItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_FEFocusUpdateContext _focusGroupMap](self, "_focusGroupMap");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "focusGroupIdentifierForItem:", v3);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      nextFocusedGroupIdentifier = self->_nextFocusedGroupIdentifier;
      self->_nextFocusedGroupIdentifier = v5;

    }
  }
  return self->_nextFocusedGroupIdentifier;
}

- (int64_t)_groupFilter
{
  void *v2;
  int64_t v3;

  -[_FEFocusUpdateContext _focusMovement](self, "_focusMovement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_groupFilter");

  return v3;
}

- (BOOL)_isFilteredToGroup
{
  return -[_FEFocusUpdateContext _groupFilter](self, "_groupFilter") != 0;
}

+ (_FEDebugIssueReportFormatter)_defaultValidationReportFormatter
{
  _FEDebugIssueReportFormatter *v2;

  v2 = objc_alloc_init(_FEDebugIssueReportFormatter);
  -[_FEDebugIssueReportFormatter setHeader:](v2, "setHeader:", CFSTR("The following issues were found that will prevent this focus update from being committed:"));
  -[_FEDebugIssueReportFormatter setNoIssuesDescription:](v2, "setNoIssuesDescription:", CFSTR("There are no issues that would prevent this focus update from occurring."));
  return v2;
}

- (NSArray)_regionMapSnapshots
{
  NSArray *regionMapSnapshots;
  NSArray *v4;
  NSArray *v5;

  regionMapSnapshots = self->_regionMapSnapshots;
  if (!regionMapSnapshots)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v5 = self->_regionMapSnapshots;
    self->_regionMapSnapshots = v4;

    regionMapSnapshots = self->_regionMapSnapshots;
  }
  return regionMapSnapshots;
}

- (id)_focusMapSnapshotDebugInfoArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[_FEFocusUpdateContext _focusMapSearchInfo](self, "_focusMapSearchInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_FEFocusUpdateContext _focusMapSearchInfo](self, "_focusMapSearchInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshots");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_getAssociatedObject(self, sel__focusMapSnapshotDebugInfoArray);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v8 = v5;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
              -[_FEFocusUpdateContext _focusMapSearchInfo](self, "_focusMapSearchInfo", (_QWORD)v19);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "_debugInfoWithFocusMapSearchInfo:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "addObject:", v15);
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v10);
        }

        v6 = (void *)objc_msgSend(v7, "copy");
        objc_setAssociatedObject(self, sel__focusMapSnapshotDebugInfoArray, v6, (void *)1);

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v16 = v6;
  else
    v16 = (void *)MEMORY[0x24BDBD1A8];
  v17 = v16;

  return v17;
}

- (UIImage)_regionMapSnapshotsVisualRepresentation
{
  UIImage *regionMapSnapshotsVisualRepresentation;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  regionMapSnapshotsVisualRepresentation = self->_regionMapSnapshotsVisualRepresentation;
  if (!regionMapSnapshotsVisualRepresentation)
  {
    -[_FEFocusUpdateContext _focusMapSnapshotDebugInfoArray](self, "_focusMapSnapshotDebugInfoArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_FEFocusUpdateContext _focusMovement](self, "_focusMovement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[_FEFocusMapSnapshotDebugInfo _summaryImageForDebugInfoArray:forFocusMovementWithInfo:scaleFactor:](_FEFocusMapSnapshotDebugInfo, "_summaryImageForDebugInfoArray:forFocusMovementWithInfo:scaleFactor:", v4, v5, 1.0);
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v7 = self->_regionMapSnapshotsVisualRepresentation;
      self->_regionMapSnapshotsVisualRepresentation = v6;

    }
    regionMapSnapshotsVisualRepresentation = self->_regionMapSnapshotsVisualRepresentation;
  }
  return regionMapSnapshotsVisualRepresentation;
}

- (id)debugQuickLookObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  -[_FEFocusUpdateContext _focusMovement](self, "_focusMovement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_FEFocusUpdateContext _regionMapSnapshotsVisualRepresentation](self, "_regionMapSnapshotsVisualRepresentation");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = CFSTR("Quick Look is unavailable for this focus update.");
    if (v4)
      v6 = (__CFString *)v4;
    v7 = v6;

  }
  else
  {
    v7 = CFSTR("Quick Look is only available for focus updates that represent a user-initiated focus movement.");
  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusUpdateContext previouslyFocusedItem](self, "previouslyFocusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("previouslyFocusedItem"));

  -[_FEFocusUpdateContext nextFocusedItem](self, "nextFocusedItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v10);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("(nil)");
  }
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("nextFocusedItem"));

  _FEStringFromFocusHeading(-[_FEFocusUpdateContext focusHeading](self, "focusHeading"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("focusHeading"));

  if (-[_FEFocusUpdateContext _groupFilter](self, "_groupFilter"))
  {
    _FEStringFromGroupFilter(-[_FEFocusUpdateContext _groupFilter](self, "_groupFilter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("groupFilter"));

  }
  objc_msgSend(v3, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_setFocusGroupMap:(id)a3
{
  objc_storeStrong((id *)&self->_focusGroupMap, a3);
}

- (_FEFocusBehavior)focusBehavior
{
  return self->_focusBehavior;
}

- (_FEFocusUpdateRequesting)_request
{
  return self->_request;
}

- (_FEFocusItemInfo)_sourceItemInfo
{
  return self->_sourceItemInfo;
}

- (_FEFocusMovementInfo)_focusMovement
{
  return self->_focusMovement;
}

- (_FEFocusMapSearchInfo)_focusMapSearchInfo
{
  return self->_focusMapSearchInfo;
}

- (_FEFocusEnvironment)_initialDestinationEnvironment
{
  return (_FEFocusEnvironment *)objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);
}

- (_FEFocusEnvironmentScrollableContainerTuple)_commonEnvironmentScrollableContainer
{
  return self->_commonEnvironmentScrollableContainer;
}

- (void)_setCommonEnvironmentScrollableContainer:(id)a3
{
  objc_storeStrong((id *)&self->_commonEnvironmentScrollableContainer, a3);
}

- (double)_destinationViewDistanceOffscreen
{
  return self->_destinationViewDistanceOffscreen;
}

- (void)_setDestinationViewDistanceOffscreen:(double)a3
{
  self->_destinationViewDistanceOffscreen = a3;
}

- (BOOL)_isDeferredUpdate
{
  return self->_deferredUpdate;
}

- (void)_setDeferredUpdate:(BOOL)a3
{
  self->_deferredUpdate = a3;
}

- (void)_setRegionMapSnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_regionMapSnapshots, a3);
}

- (_FEDebugLogReport)_preferredFocusReport
{
  return self->_preferredFocusReport;
}

- (void)_setPreferredFocusReport:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFocusReport, a3);
}

- (_FEDebugIssueReport)_validationReport
{
  return self->_validationReport;
}

- (void)_setValidationReport:(id)a3
{
  objc_storeStrong((id *)&self->_validationReport, a3);
}

- (_FEFocusGuide)_focusedGuide
{
  return (_FEFocusGuide *)objc_loadWeakRetained((id *)&self->_focusedGuide);
}

- (BOOL)_focusRedirectedByGuide
{
  return self->_focusRedirectedByGuide;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusedGuide);
  objc_storeStrong((id *)&self->_validationReport, 0);
  objc_storeStrong((id *)&self->_preferredFocusReport, 0);
  objc_storeStrong((id *)&self->_regionMapSnapshots, 0);
  objc_storeStrong((id *)&self->_commonEnvironmentScrollableContainer, 0);
  objc_destroyWeak((id *)&self->_initialDestinationEnvironment);
  objc_storeStrong((id *)&self->_focusMapSearchInfo, 0);
  objc_storeStrong((id *)&self->_focusMovement, 0);
  objc_storeStrong((id *)&self->_sourceItemInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_focusBehavior, 0);
  objc_storeStrong((id *)&self->_focusGroupMap, 0);
  objc_storeStrong((id *)&self->_regionMapSnapshotsVisualRepresentation, 0);
  objc_storeStrong((id *)&self->_nextFocusedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_previouslyFocusedGroupIdentifier, 0);
  objc_destroyWeak((id *)&self->_commonAncestorEnvironment);
  objc_storeStrong((id *)&self->_destinationItemInfo, 0);
}

@end
