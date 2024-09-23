@implementation RWIProtocolCSSSourceRange(IKJSInspector)

+ (id)ik_newLineIndexSetForStyleMarkup:()IKJSInspector
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v7 = 0;
    do
    {
      if (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v7)))
        objc_msgSend(v4, "addIndex:", v7);
      ++v7;
    }
    while (objc_msgSend(v3, "length") > v7);
  }
  ITMLKitGetLogObject(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[RWIProtocolCSSSourceRange(IKJSInspector) ik_newLineIndexSetForStyleMarkup:].cold.1((uint64_t)v5);

  return v4;
}

+ (uint64_t)ik_emptySourceRange
{
  return objc_msgSend(MEMORY[0x1E0DD95D8], "safe_initWithStartLine:startColumn:endLine:endColumn:", 0, 0, 0, 0);
}

+ (id)ik_cssSourceRangeForRange:()IKJSInspector withNewLineIndexSet:
{
  void *v5;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v5 = 0;
  if (a5 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = a3 + a4;
    v8 = a5;
    v9 = objc_msgSend(v8, "countOfIndexesInRange:", 0, a3);
    v10 = objc_msgSend(v8, "countOfIndexesInRange:", 0, v7);
    v11 = a3 + ~objc_msgSend(v8, "indexLessThanIndex:", a3);
    v12 = objc_msgSend(v8, "indexLessThanIndex:", v7);

    objc_msgSend(MEMORY[0x1E0DD95D8], "safe_initWithStartLine:startColumn:endLine:endColumn:", (v9 + 1), v11, (v10 + 1), (v7 + ~v12));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)ik_rangeWithNewLineIndexSet:()IKJSInspector
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (objc_msgSend(a1, "startLine") == 1)
    v5 = 0;
  else
    v5 = -100;
  v18 = v5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (objc_msgSend(a1, "endLine") == 1)
    v6 = 0;
  else
    v6 = -100;
  v14 = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__RWIProtocolCSSSourceRange_IKJSInspector__ik_rangeWithNewLineIndexSet___block_invoke;
  v10[3] = &unk_1E9F4BFD8;
  v10[4] = a1;
  v10[5] = v19;
  v10[6] = &v15;
  v10[7] = &v11;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v10);
  v7 = v16[3];
  if (v7 == -100)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = v7 + (int)objc_msgSend(a1, "startColumn");
  if (v12[3] != -100)
    objc_msgSend(a1, "endColumn");
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return v8;
}

+ (void)ik_newLineIndexSetForStyleMarkup:()IKJSInspector .cold.1(uint64_t a1)
{
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", a1);
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

@end
