@implementation UITextView(FBKCursorUtils)

- (BOOL)isCursorIsAtEndOfDocument
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "selectedRange");
  objc_msgSend(a1, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v2 == v4;
}

- (double)currentCursorRect
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;

  v2 = objc_msgSend(a1, "selectedRange");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return *MEMORY[0x24BDBF090];
  v4 = v2;
  objc_msgSend(a1, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "positionFromPosition:offset:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "caretRectForPosition:", v6);
  v3 = v7;

  return v3;
}

- (void)scrollTableToAvoidKeyboardInTableView:()FBKCursorUtils keyboardHeight:withPadding:
{
  id v8;
  id v9;
  double x;
  double y;
  double width;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;

  v8 = a5;
  v9 = a1;
  objc_msgSend(v9, "currentCursorRect");
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  if (!CGRectEqualToRect(v41, *MEMORY[0x24BDBF090]))
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    if (!CGRectIsEmpty(v42))
    {
      objc_msgSend(v9, "convertRect:toView:", v8, x, y, width, height);
      v16 = v14 + v15;
      objc_msgSend(v8, "frame");
      v18 = v17 - a2;
      v19 = v16 - (v17 - a2);
      objc_msgSend(v8, "contentOffset");
      v21 = v20;
      objc_msgSend(v8, "contentOffset");
      v23 = v22;
      if (v19 == 1.79769313e308)
      {
        +[FBKLog appHandle](FBKLog, "appHandle");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[UITextView(FBKCursorUtils) scrollTableToAvoidKeyboardInTableView:keyboardHeight:withPadding:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

      }
      else if (height + a3 + v16 - v21 > v18)
      {
        v32 = height + a3 + v19;
        +[FBKLog appHandle](FBKLog, "appHandle");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[UITextView(FBKCursorUtils) scrollTableToAvoidKeyboardInTableView:keyboardHeight:withPadding:].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);

        objc_msgSend(v8, "setContentOffset:animated:", 0, v23, v32);
      }
    }
  }

}

- (void)scrollTableToAvoidKeyboardInTableView:()FBKCursorUtils keyboardHeight:withPadding:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, a1, a3, "offset is too large", a5, a6, a7, a8, 0);
}

- (void)scrollTableToAvoidKeyboardInTableView:()FBKCursorUtils keyboardHeight:withPadding:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, a1, a3, "moving table", a5, a6, a7, a8, 0);
}

@end
