@implementation AXAuditCategory

- (AXAuditCategory)init
{
  AXAuditCategory *v2;
  objc_class *v3;
  uint64_t v4;
  NSString *title;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAuditCategory;
  v2 = -[AXAuditCategory init](&v7, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    title = v2->_title;
    v2->_title = (NSString *)v4;

    AXDevicePrimeDisplayManager();
  }
  return v2;
}

- (BOOL)localIssueShouldRun:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping](AXAuditIssueDescriptionManager, "auditIssueTypeToAuditTestTypeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AXAuditCategory currentAuditTypesToTestFor](self, "currentAuditTypesToTestFor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSSet)allSupportedAuditTypes
{
  return 0;
}

- (NSArray)caseSelectorsForAuditing
{
  return 0;
}

- (BOOL)shouldRunAuditTestType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AXAuditCategory currentAuditTypesToTestFor](self, "currentAuditTypesToTestFor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)supportsAuditTestType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AXAuditCategory allSupportedAuditTypes](self, "allSupportedAuditTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)_availableCasesDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[AXAuditCategory caseSelectorsForAuditing](self, "caseSelectorsForAuditing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nContains %i test cases {\n"), objc_msgSend(v4, "count"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXAuditCategory caseSelectorsForAuditing](self, "caseSelectorsForAuditing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "appendFormat:", CFSTR("   %@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)objc_opt_new();
  v10.receiver = self;
  v10.super_class = (Class)AXAuditCategory;
  -[AXAuditCategory description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[AXAuditCategory title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v5);
  -[AXAuditCategory _availableCasesDescription](self, "_availableCasesDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\n   "), 1, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v3, "appendString:", v7);
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *title;

  v4 = (NSString *)a3;
  -[AXAuditCategory _result](self, "_result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  title = self->_title;
  self->_title = v4;

}

- (id)result
{
  void *v3;
  void *v4;

  -[AXAuditCategory _result](self, "_result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[AXAuditCategory title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v4);

    -[AXAuditCategory set_result:](self, "set_result:", v3);
  }
  return v3;
}

- (unint64_t)categoryType
{
  if (self->_categoryType - 1 >= 3)
    return 1;
  else
    return self->_categoryType;
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return 0;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[AXAuditCategory start](self, "start");
  -[AXAuditCategory caseSelectorsForAuditing](self, "caseSelectorsForAuditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditCategory _currentTestingCaseSelectors](self, "_currentTestingCaseSelectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditCategory set_currentTestingCaseSelectors:](self, "set_currentTestingCaseSelectors:", v5);

  -[AXAuditCategory currentAuditTypesToTestFor](self, "currentAuditTypesToTestFor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_14;
  }
  v7 = objc_msgSend(v3, "count");

  if (!v7)
  {
LABEL_14:
    -[AXAuditCategory stop](self, "stop");
    goto LABEL_15;
  }
  -[AXAuditCategory _currentTestingCaseSelectors](self, "_currentTestingCaseSelectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v3);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = NSSelectorFromString(*(NSString **)(*((_QWORD *)&v15 + 1) + 8 * v13));
        if (v14)
          objc_msgSend(self, v14, (_QWORD)v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

LABEL_15:
}

- (void)start
{
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  -[AXAuditCategory result](self, "result");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendLog:", CFSTR("\n"));
  objc_msgSend(v6, "appendLog:", CFSTR("===================================================================="));
  if (-[AXAuditCategory targetPid](self, "targetPid"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (against pid: %i)"), -[AXAuditCategory targetPid](self, "targetPid"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_25071BA38;
  }
  -[AXAuditCategory title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendLog:", CFSTR("Test Starting: %@%@"), v4, v3);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStartTime:", v5);

}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[AXAuditCategory result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEndTime:", v4);

  objc_msgSend(v3, "appendLog:", CFSTR("\n"));
  -[AXAuditCategory title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executionTimeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendLog:", CFSTR("Test Complete: %@ -- Execution time:%@"), v5, v6);

  v7 = objc_msgSend(v3, "issueCount");
  if (v7)
  {
    if (v7 == 1)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found %i issue"), 1);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found %i issues"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("No issues");
  }
  objc_msgSend(v3, "appendLog:", v8);
  objc_msgSend(v3, "appendLog:", CFSTR("====================================================================\n"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "issueSummaryStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "appendLog:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "appendLog:", CFSTR("\n"));
  objc_msgSend(v3, "appendLog:", CFSTR("===================================================================="));
  -[AXAuditCategory delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didCompleteCategory:", self);

}

- (id)caseStartedForSelectorName:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[AXAuditCategory currentCaseResult](self, "currentCaseResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0.0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 1.0);
      -[AXAuditCategory currentCaseResult](self, "currentCaseResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        break;
      v6 = v6 + 1.0;
    }
    while (v6 < 20.0);
  }
  -[AXAuditCategory result](self, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "addCaseResult:", v9);
  -[AXAuditCategory setCurrentCaseResult:](self, "setCurrentCaseResult:", v9);
  objc_msgSend(v8, "appendLog:", CFSTR("===================================================================="));
  objc_msgSend(v8, "appendLog:", CFSTR("Case Starting %@"), v4);
  objc_msgSend(v9, "setCaseTitle:", v4);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStartTime:", v10);

  return v9;
}

- (void)caseEndedForSelectorName:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[AXAuditCategory result](self, "result");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEndTime:", v8);

  objc_msgSend(v6, "executionTimeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "appendLog:", CFSTR("Case Complete: %@ -- Execution time:%@"), v7, v9);
  objc_msgSend(v13, "appendLog:", CFSTR("====================================================================\n"));
  -[AXAuditCategory setCurrentCaseResult:](self, "setCurrentCaseResult:", 0);
  -[AXAuditCategory _currentTestingCaseSelectors](self, "_currentTestingCaseSelectors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v7);

  -[AXAuditCategory setLastCaseSelectorFinishedName:](self, "setLastCaseSelectorFinishedName:", v7);
  -[AXAuditCategory _currentTestingCaseSelectors](self, "_currentTestingCaseSelectors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    -[AXAuditCategory stop](self, "stop");

}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4
{
  -[AXAuditCategory addIssueWithClassification:auditElement:elementRect:elementDescription:](self, "addIssueWithClassification:auditElement:elementRect:elementDescription:", a3, a4, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6
{
  -[AXAuditCategory addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:](self, "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:", a3, a4, a6, 0, 0, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6 mlGeneratedDescription:(id)a7
{
  -[AXAuditCategory addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:](self, "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:", a3, a4, a6, a7, 0, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (BOOL)_isAppleInternalBuild
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (void)addIssueWithClassification:(int64_t)a3 auditElement:(id)a4 elementRect:(CGRect)a5 elementDescription:(id)a6 mlGeneratedDescription:(id)a7 longDescExtraInfo:(id)a8 elementText:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AXAuditCategory *v32;
  pid_t pid;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  +[AXAuditIssue auditIssueForClassification:](AXAuditIssue, "auditIssueForClassification:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "axElement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v32 = self;
  if (!v25)
  {
    if (-[AXAuditCategory _isAppleInternalBuild](self, "_isAppleInternalBuild"))
      goto LABEL_7;
    goto LABEL_6;
  }
  pid = 0;
  if (AXUIElementGetPid((AXUIElementRef)objc_msgSend(v25, "elementRef"), &pid)
    || !AuditDoesAllowDeveloperAttributes(pid))
  {
LABEL_6:

    v23 = 0;
  }
LABEL_7:
  +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping](AXAuditIssueDescriptionManager, "auditIssueTypeToAuditTestTypeMapping");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "setAuditTestType:", v29);
    objc_msgSend(v24, "setAuditElement:", v19);
    objc_msgSend(v24, "setElementDescription:", v20);
    objc_msgSend(v24, "setElementRect:", x, y, width, height);
    objc_msgSend(v24, "setLongDescExtraInfo:", v22);
    objc_msgSend(v24, "setElementText:", v23);
    objc_msgSend(v24, "setMlGeneratedDescription:", v21);
    -[AXAuditCategory currentCaseResult](v32, "currentCaseResult");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAuditIssue:", v24);
    -[AXAuditCategory delegate](v32, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "auditCategory:didEncounterIssue:", v32, v24);

  }
}

- (AXAuditCategoryDelegate)delegate
{
  return (AXAuditCategoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (NSSet)currentAuditTypesToTestFor
{
  return self->_currentAuditTypesToTestFor;
}

- (void)setCurrentAuditTypesToTestFor:(id)a3
{
  objc_storeStrong((id *)&self->_currentAuditTypesToTestFor, a3);
}

- (void)setCaseSelectorsForAuditing:(id)a3
{
  objc_storeStrong((id *)&self->_caseSelectorsForAuditing, a3);
}

- (NSString)lastCaseSelectorFinishedName
{
  return self->_lastCaseSelectorFinishedName;
}

- (void)setLastCaseSelectorFinishedName:(id)a3
{
  objc_storeStrong((id *)&self->_lastCaseSelectorFinishedName, a3);
}

- (NSString)title
{
  return self->_title;
}

- (AXAuditCaseResult)currentCaseResult
{
  return self->_currentCaseResult;
}

- (void)setCurrentCaseResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentCaseResult, a3);
}

- (NSMutableArray)_currentTestingCaseSelectors
{
  return self->__currentTestingCaseSelectors;
}

- (void)set_currentTestingCaseSelectors:(id)a3
{
  objc_storeStrong((id *)&self->__currentTestingCaseSelectors, a3);
}

- (AXAuditCategoryResult)_result
{
  return self->__result;
}

- (void)set_result:(id)a3
{
  objc_storeStrong((id *)&self->__result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__result, 0);
  objc_storeStrong((id *)&self->__currentTestingCaseSelectors, 0);
  objc_storeStrong((id *)&self->_currentCaseResult, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastCaseSelectorFinishedName, 0);
  objc_storeStrong((id *)&self->_caseSelectorsForAuditing, 0);
  objc_storeStrong((id *)&self->_currentAuditTypesToTestFor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
