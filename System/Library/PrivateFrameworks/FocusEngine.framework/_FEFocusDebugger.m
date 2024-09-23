@implementation _FEFocusDebugger

+ (id)help
{
  void *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  _QWORD v7[4];
  id v8;

  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("\nFocus Debugging Utilities:"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __24___FEFocusDebugger_help__block_invoke;
  v7[3] = &unk_250D3A580;
  v8 = v2;
  v3 = v2;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2426205A4](v7);
  ((void (**)(_QWORD, const __CFString *, const __CFString *, const __CFString *, const __CFString *))v4)[2](v4, CFSTR("Status"), CFSTR("po _FEFocusDebugger.status()"), CFSTR("po [_FEFocusDebugger status]"), CFSTR("Outputs information for the currently focused item."));
  ((void (**)(_QWORD, const __CFString *, const __CFString *, const __CFString *, const __CFString *))v4)[2](v4, CFSTR("Diagnosing Focusability Issues"), CFSTR("po _FEFocusDebugger.checkFocusability(for: <item reference>)"), CFSTR("po [_FEFocusDebugger checkFocusabilityForItem:<item reference>]"), CFSTR("Outputs a diagnosis of the specified item's focusability, including any known issues that may be preventing focusability."));
  +[_FEFocusDebuggerStringOutput outputWithString:](_FEFocusDebuggerStringOutput, "outputWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)status
{
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  return +[_FEDebugLogNode rootNode](_FEDebugLogNode, "rootNode");
}

+ (id)_verboseStatus
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  +[_FEDebugLogNode rootNode](_FEDebugLogNode, "rootNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[_FEFocusSystem _allFocusSystems](_FEFocusSystem, "_allFocusSystems", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      if (!--v5)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (!v5)
          break;
      }
    }
  }

  return v2;
}

+ (id)_statusForFocusSystem:(id)a3 scene:(id)a4 includeSceneLog:(BOOL)a5 includeDeferralTarget:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  objc_class *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  __CFString *v37;
  void *v38;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  objc_msgSend(v9, "focusedItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = CFSTR("(nil)");
  }

  +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogNode, "messageWithStyle:string:", 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v12, "_isEnabled");
  v19 = CFSTR("NO");
  if (v18)
    v19 = CFSTR("YES");
  +[_FEDebugLogMessage messageWithFormat:](_FEDebugLogMessage, "messageWithFormat:", CFSTR("enabled: %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addMessage:", v20);

  if (v10 && v7)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = v10;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p>"), v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[_FEDebugLogMessage messageWithFormat:](_FEDebugLogMessage, "messageWithFormat:", CFSTR("scene: %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addMessage:", v26);

  }
  v27 = v11;
  if (v27)
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p>"), v30, v27);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = CFSTR("(nil)");
  }

  +[_FEDebugLogMessage messageWithFormat:](_FEDebugLogMessage, "messageWithFormat:", CFSTR("focused item: %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addMessage:", v32);

  if (v6)
  {
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("_deferredFocusUpdateTarget"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)MEMORY[0x24BDD17C8];
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p>"), v36, v33);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v37 = CFSTR("(nil)");
    }
    +[_FEDebugLogMessage messageWithFormat:](_FEDebugLogMessage, "messageWithFormat:", CFSTR("deferral target: %@"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addMessage:", v38);

  }
  return v17;
}

+ (id)_legacy_checkFocusabilityForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  +[_FEFocusDebugger checkFocusabilityForItem:](_FEFocusDebugger, "checkFocusabilityForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)checkFocusabilityForItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _FEDebugIssueReport *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int IsEligibleForFocusInteraction;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  _FEFocusMap *v24;
  _FEDebugIssueReportFormatter *v25;
  void *v26;
  void *v28;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEFocusDebugger.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "focusedItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
    {
      v9 = objc_alloc_init(_FEDebugIssueReport);
      v10 = objc_msgSend(v5, "_canBecomeFocused");
      if ((v10 & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_8;
        -[_FEDebugIssueReport issues](v9, "issues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        objc_msgSend(v5, "_diagnoseFocusabilityForReport:", v9);
        -[_FEDebugIssueReport issues](v9, "issues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v12 == v14)
        {
LABEL_8:
          +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", CFSTR("This item returns NO from -_canBecomeFocused."));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_FEDebugIssueReport addIssue:](v9, "addIssue:", v15);

        }
      }
      IsEligibleForFocusInteraction = _FEFocusEnvironmentIsEligibleForFocusInteraction(v5);
      if (!IsEligibleForFocusInteraction
        || (objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v5, "_shouldAlwaysDiagnoseFocusInteractionEligibility"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_FEDebugIssueReport issues](v9, "issues");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          objc_msgSend(v5, "_diagnoseFocusInteractionEligibilityForReport:", v9);
          -[_FEDebugIssueReport issues](v9, "issues");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v18 != objc_msgSend(v19, "count");

        }
        else
        {
          v20 = 0;
        }
        if (((IsEligibleForFocusInteraction | v20) & 1) == 0)
        {
          +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", CFSTR("This item is not eligible for focus, but the reason is unknown."));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_FEDebugIssueReport addIssue:](v9, "addIssue:", v23);
          goto LABEL_24;
        }
      }
      else
      {
        v20 = 0;
      }
      if (((v20 | v10 ^ 1) & 1) != 0)
      {
LABEL_25:
        v25 = objc_alloc_init(_FEDebugIssueReportFormatter);
        -[_FEDebugIssueReportFormatter setHeader:](v25, "setHeader:", CFSTR("The following issues were found that would prevent this item from being focusable:"));
        -[_FEDebugIssueReportFormatter setNoIssuesDescription:](v25, "setNoIssuesDescription:", CFSTR("This item should be focusable.\n\nIf you are still having trouble focusing this item, consider the following:\n – This tool will not detect if this item is denied focus as the result of returning NO from -shouldUpdateFocusInContext:.\n – This tool will not detect if another item or guide is redirecting focus movement away from this item.\n – This tool may not detect if this item has dynamic conditions that affect its focusability."));
        -[_FEDebugIssueReportFormatter stringFromReport:](v25, "stringFromReport:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[_FEFocusDebuggerStringOutput outputWithString:](_FEFocusDebuggerStringOutput, "outputWithString:", v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
      objc_msgSend(v7, "_focusMapContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = -[_FEFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:]([_FEFocusMap alloc], "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v7, v23, 0, 0, 0);
        -[_FEFocusMap diagnoseFocusabilityForItem:report:](v24, "diagnoseFocusabilityForItem:report:", v5, v9);

      }
LABEL_24:

      goto LABEL_25;
    }
    v21 = CFSTR("This item is currently focused.");
  }
  else
  {
    v21 = CFSTR("This item is not part of any focus system, so focusability is not applicable.");
  }
  +[_FEFocusDebuggerStringOutput outputWithString:](_FEFocusDebuggerStringOutput, "outputWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v22;
}

+ (id)simulateFocusUpdateRequestFromEnvironment:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _FEDebugLogReport *v8;
  _FEDebugIssueReport *v9;
  _FEDebugLogReport *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  _FEDebugIssueReport *v23;
  void *v24;
  uint64_t v25;
  _FEDebugIssueReportFormatter *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  objc_class *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  _FEFocusUpdateRequest *v53;
  __CFString *v54;
  void *v55;

  v5 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEFocusDebugger.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v53 = -[_FEFocusUpdateRequest initWithFocusSystem:environment:]([_FEFocusUpdateRequest alloc], "initWithFocusSystem:environment:", v6, v5);
    v7 = -[_FEFocusUpdateContext _initWithFocusUpdateRequest:]([_FEFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v53);
    v8 = objc_alloc_init(_FEDebugLogReport);
    objc_msgSend(v7, "_setPreferredFocusReport:", v8);

    v9 = objc_alloc_init(_FEDebugIssueReport);
    objc_msgSend(v7, "_setValidationReport:", v9);

    v10 = objc_alloc_init(_FEDebugLogReport);
    objc_msgSend(v7, "previouslyFocusedItem");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@ is currently focused)"), v15);
      v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = CFSTR("(Nothing is currently focused)");
    }
    v18 = v5;
    if (v5)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = CFSTR("(nil)");
    }
    v55 = (void *)v11;

    v54 = (__CFString *)v16;
    -[_FEDebugLogReport addMessageWithFormat:](v10, "addMessageWithFormat:", CFSTR("Simulating a fake focus update request from %@... %@"), v22, v16);

    -[_FEDebugLogReport addLineBreak](v10, "addLineBreak");
    v23 = objc_alloc_init(_FEDebugIssueReport);
    objc_msgSend(v6, "_debug_isEnvironmentEligibleForFocusUpdate:debugReport:", v18, v23);
    -[_FEDebugIssueReport issues](v23, "issues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v26 = objc_alloc_init(_FEDebugIssueReportFormatter);
      -[_FEDebugIssueReportFormatter setHeader:](v26, "setHeader:", CFSTR("The following issues were found that would normally prevent this environment's request from being accepted by the focus system (these will be ignored for the purposes of this test):"));
      -[_FEDebugIssueReportFormatter stringFromReport:](v26, "stringFromReport:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEDebugLogReport addMessage:](v10, "addMessage:", v27);

      -[_FEDebugLogReport addLineBreak](v10, "addLineBreak");
    }
    objc_msgSend(v7, "nextFocusedItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FEDebugReportFormatter defaultFormatter](_FEDebugLogReportFormatter, "defaultFormatter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_preferredFocusReport");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringFromReport:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEDebugLogReport addMessage:](v10, "addMessage:", v31);

    v32 = objc_msgSend(v7, "_isValidInFocusSystem:", v6);
    objc_msgSend(v7, "_validationReport");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "issues");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      -[_FEDebugLogReport addLineBreak](v10, "addLineBreak");
      +[_FEFocusUpdateContext _defaultValidationReportFormatter](_FEFocusUpdateContext, "_defaultValidationReportFormatter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_validationReport");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringFromReport:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEDebugLogReport addMessage:](v10, "addMessage:", v38);

    }
    -[_FEDebugLogReport resetIndentLevel](v10, "resetIndentLevel");
    -[_FEDebugLogReport addLineBreak](v10, "addLineBreak");
    if (v32)
    {
      if (v28)
      {
        v39 = (void *)MEMORY[0x24BDD17C8];
        v40 = v28;
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("<%@: %p>"), v42, v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[_FEDebugLogReport addMessageWithFormat:](v10, "addMessageWithFormat:", CFSTR("Simulated Result: Successfully updated focus to %@."), v43);
LABEL_25:

LABEL_28:
        +[_FEDebugReportFormatter defaultFormatter](_FEDebugLogReportFormatter, "defaultFormatter");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringFromReport:", v10);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        +[_FEFocusDebuggerStringOutput outputWithString:](_FEFocusDebuggerStringOutput, "outputWithString:", v50);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_29;
      }
      v44 = CFSTR("Simulated Result: Successfully updated focus to nil.");
    }
    else if (v28 == v55)
    {
      if (v55)
      {
        v45 = (void *)MEMORY[0x24BDD17C8];
        v46 = v55;
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("<%@: %p>"), v48, v46);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[_FEDebugLogReport addMessageWithFormat:](v10, "addMessageWithFormat:", CFSTR("Simulated Result: No change, %@ is still focused."), v43);
        goto LABEL_25;
      }
      v44 = CFSTR("Simulated Result: No change, nothing is still focused.");
    }
    else
    {
      v44 = CFSTR("Simulated Result: Failed to update focus.");
    }
    -[_FEDebugLogReport addMessage:](v10, "addMessage:", v44);
    goto LABEL_28;
  }
  +[_FEFocusDebuggerStringOutput outputWithString:](_FEFocusDebuggerStringOutput, "outputWithString:", CFSTR("This environment is not part of any focus system, and so cannot request a focus update."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v17;
}

+ (id)_ancestryForEnvironment:(id)a3
{
  id v5;
  _FEDebugLogReport *v6;
  id v7;
  _FEDebugLogReport *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _FEDebugLogReport *v15;
  id v16;

  v5 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEFocusDebugger.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v6 = objc_alloc_init(_FEDebugLogReport);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44___FEFocusDebugger__ancestryForEnvironment___block_invoke;
  v14[3] = &unk_250D39EE0;
  v15 = v6;
  v16 = v5;
  v7 = v5;
  v8 = v6;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v7, v14);
  +[_FEDebugReportFormatter defaultFormatter](_FEDebugLogReportFormatter, "defaultFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromReport:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_FEFocusDebuggerStringOutput outputWithString:](_FEFocusDebuggerStringOutput, "outputWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)focusGroupsForEnvironment:(id)a3
{
  id v3;
  void *v4;
  _FEFocusMovementRequest *v5;
  _FEFocusMovementInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_FEFocusMovementRequest initWithFocusSystem:]([_FEFocusMovementRequest alloc], "initWithFocusSystem:", v4);
  v6 = -[_FEFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_FEFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", 16, 0, 1, 0, 1, 2, 5);
  -[_FEFocusMovementRequest setMovementInfo:](v5, "setMovementInfo:", v6);

  objc_msgSend(v4, "_movementPerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextForFocusMovement:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 1, CFSTR("Focus Group Hierarchy:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addMessage:", v10);

  objc_msgSend(v8, "_focusMapSearchInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusGroupMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "focusGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke;
  v20[3] = &unk_250D3A5A8;
  v21 = v9;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke_2;
  v18[3] = &unk_250D3A5D0;
  v19 = v21;
  v15 = v21;
  __recursePreOrderDepthFirstTraversal(v13, sel_childGroups, 0, v20, v18);
  objc_msgSend(v15, "rootNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)preferredFocusEnvironmentsForEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _FEFocusEnvironmentPreferenceEnumerator *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a3;
  if ((_FEProcessIsBeingDebugged() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("It looks like you are calling a _FEFocusDebugger method outside of lldb. That is not allowed."));
  +[_FEDebugLogNode rootNode](_FEDebugLogNode, "rootNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 1, CFSTR("Preferred focus environments:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMessage:", v6);

    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_FEFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:]([_FEFocusEnvironmentPreferenceEnumerator alloc], "initWithEnumerationMode:", 1);
    -[_FEFocusEnvironmentPreferenceEnumerator setAllowsInferringPreferences:](v9, "setAllowsInferringPreferences:", 0);
    -[_FEFocusEnvironmentPreferenceEnumerator setDebugLog:](v9, "setDebugLog:", v4);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61___FEFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke;
    v12[3] = &unk_250D3A5F8;
    v13 = v7;
    v14 = v5;
    v10 = v7;
    -[_FEFocusEnvironmentPreferenceEnumerator enumeratePreferencesForEnvironment:usingBlock:](v9, "enumeratePreferencesForEnvironment:usingBlock:", v3, v12);

  }
  else
  {
    +[_FEDebugLogMessage messageWithStyle:string:](_FEDebugLogMessage, "messageWithStyle:string:", 4, CFSTR("The environment is not connected to a focus system."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addMessage:", v8);
  }

  return v4;
}

@end
