@implementation RWIProtocolCSSStyle(IKJSInspector)

+ (id)ik_cssStyleFromDeclarationList:()IKJSInspector forStyleMarkup:withNewLineIndexSet:existingStyle:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v41;
  uint64_t v42;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v41 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v9, "declarationAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v10)
      {
        v16 = objc_msgSend(v14, "valueRange");
        objc_msgSend(v10, "substringWithRange:", v16, v17);
      }
      else
      {
        objc_msgSend(v14, "stringValue");
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0DD9590];
      objc_msgSend(v15, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safe_initWithName:value:", v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setParsedOk:", 1);
      objc_msgSend(v21, "setStatus:", 0);
      if (v10)
      {
        v22 = objc_msgSend(v15, "range");
        objc_msgSend(v10, "substringWithRange:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setText:", v24);

      }
      v25 = (void *)MEMORY[0x1E0DD95D8];
      v26 = objc_msgSend(v15, "range");
      objc_msgSend(v25, "ik_cssSourceRangeForRange:withNewLineIndexSet:", v26, v27, v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
        objc_msgSend(v21, "setRange:", v28);
      objc_msgSend(v12, "addObject:", v21);

      ++v13;
    }
    while (objc_msgSend(v9, "count") > v13);
  }
  v29 = v41;
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "setCssProperties:", v12);
    v31 = v30;
    if (!v9)
      goto LABEL_23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DD95E0], "safe_initWithCssProperties:shorthandEntries:", v12, MEMORY[0x1E0C9AA60]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_23;
  }
  v32 = objc_msgSend(v9, "range");
  v42 = v33;
  objc_msgSend(v30, "styleId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "styleSheetId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("inline"));

  if (v36)
  {
    v37 = objc_msgSend(v10, "length");
    v32 = 0;
  }
  else
  {
    v37 = v42;
  }
  objc_msgSend(MEMORY[0x1E0DD95D8], "ik_cssSourceRangeForRange:withNewLineIndexSet:", v32, v37, v11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_msgSend(v31, "setRange:", v38);
  if (v10)
  {
    objc_msgSend(v10, "substringWithRange:", v32, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCssText:", v39);

  }
LABEL_23:

  return v31;
}

@end
