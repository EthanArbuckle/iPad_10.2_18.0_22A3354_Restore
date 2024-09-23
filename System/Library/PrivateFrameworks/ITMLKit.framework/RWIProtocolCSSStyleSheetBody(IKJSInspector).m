@implementation RWIProtocolCSSStyleSheetBody(IKJSInspector)

+ (id)ik_stylesheetBodyFromRuleList:()IKJSInspector forStyleMarkup:withHeader:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD95D8], "ik_newLineIndexSetForStyleMarkup:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v7, "ruleAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DD95A8], "ik_cssRuleForRule:withOrdinal:forStyleSheetHeader:forStyleMarkup:withNewLineIndexSet:", v13, v12, v9, v8, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

        ++v12;
      }
      while (objc_msgSend(v7, "count") > v12);
    }
    v15 = (void *)MEMORY[0x1E0DD95F8];
    objc_msgSend(v9, "styleSheetId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safe_initWithStyleSheetId:rules:", v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setText:", v8);
    objc_msgSend(v17, "ik_setTextNewLineIndexSet:", v11);
    objc_msgSend(v17, "ik_setRuleList:", v7);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)ik_ruleList
{
  return objc_getAssociatedObject(a1, sel_ik_ruleList);
}

- (void)ik_setRuleList:()IKJSInspector
{
  id v4;
  void *v5;
  id value;

  value = a3;
  objc_msgSend(a1, "ik_ruleList");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_ik_ruleList, value, (void *)1);
    v5 = value;
  }

}

- (id)ik_textNewLineIndexSet
{
  return objc_getAssociatedObject(a1, sel_ik_textNewLineIndexSet);
}

- (void)ik_setTextNewLineIndexSet:()IKJSInspector
{
  id v4;
  void *v5;
  id value;

  value = a3;
  objc_msgSend(a1, "ik_textNewLineIndexSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_ik_textNewLineIndexSet, value, (void *)1);
    v5 = value;
  }

}

@end
