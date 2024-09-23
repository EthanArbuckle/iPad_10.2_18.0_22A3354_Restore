@implementation RWIProtocolCSSSelectorList(IKJSInspector)

+ (id)ik_cssSelectorListFromSelectorList:()IKJSInspector forStyleMarkup:withNewLineIndexSet:
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSRange v25;
  void *v26;
  id v28;
  NSRange v29;
  NSRange v30;

  v6 = a3;
  v28 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "selectorAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DD95C0];
      objc_msgSend(v10, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safe_initWithText:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "addObject:", v13);
      if (v9)
        v14 = CFSTR(", ");
      else
        v14 = &stru_1E9F50578;
      objc_msgSend(v10, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("%@%@"), v14, v15);

      ++v9;
    }
    while (objc_msgSend(v6, "count") > v9);
  }
  objc_msgSend(MEMORY[0x1E0DD95C8], "safe_initWithSelectors:text:", v7, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "selectorAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "range");
    v20 = v19;

    objc_msgSend(v6, "selectorAtIndex:", objc_msgSend(v6, "count") - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "range");
    v24 = v23;

    v29.location = v18;
    v29.length = v20;
    v30.location = v22;
    v30.length = v24;
    v25 = NSUnionRange(v29, v30);
    objc_msgSend(MEMORY[0x1E0DD95D8], "ik_cssSourceRangeForRange:withNewLineIndexSet:", v25.location, v25.length, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v16, "setRange:", v26);

  }
  return v16;
}

@end
