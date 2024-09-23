@implementation IUIRangeTransform

+ (_NSRange)rangeInDocumentState:(id)a3 fromTextRange:(id)a4 inUITextInput:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _BOOL4 v30;
  NSUInteger v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  char *v35;
  char *v36;
  char *v37;
  _NSRange result;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedTextRange"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "end"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "start"));
  v37 = (char *)objc_msgSend(v8, "offsetFromPosition:toPosition:", v12, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "end"));
  v36 = (char *)objc_msgSend(v8, "offsetFromPosition:toPosition:", v13, v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextBeforeInput"));
  v35 = (char *)objc_msgSend(v14, "length");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "markedText"));
  if (v15)
  {
    v16 = (char *)objc_msgSend(v7, "selectedRangeInMarkedText");
    v18 = &v16[v17];
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedText"));
    v18 = (char *)objc_msgSend(v19, "length");

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextBeforeInput"));
  v21 = objc_msgSend(v20, "length");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "markedText"));
  if (v22)
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "markedText"));
  else
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedText"));
  v24 = v23;
  v25 = objc_msgSend(v23, "length");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextAfterInput"));
  v27 = objc_msgSend(v26, "length");

  v30 = &v35[(_QWORD)v18] - v37 < 0
     || (uint64_t)((uint64_t)v21 + (_QWORD)v25 + (unint64_t)v27) < &v35[(_QWORD)v18] - v36
     || (uint64_t)v37 < (uint64_t)v36;
  if (v30)
    v31 = 0;
  else
    v31 = v37 - v36;
  if (v30)
    v32 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v32 = &v35[(_QWORD)v18] - v37;

  v33 = v32;
  v34 = v31;
  result.length = v34;
  result.location = v33;
  return result;
}

+ (id)textRangeInUITextInput:(id)a3 fromRange:(_NSRange)a4 inDocumentState:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  NSUInteger v11;
  void *v12;
  char *v13;
  void *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  char *v20;
  NSUInteger v21;
  NSUInteger v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (location == 0x7FFFFFFFFFFFFFFFLL || (v11 = location + length, (uint64_t)(location + length) < 0))
  {
    v18 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextBeforeInput"));
    v13 = (char *)objc_msgSend(v12, "length");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "markedText"));
    if (v14)
    {
      v15 = (char *)objc_msgSend(v10, "selectedRangeInMarkedText");
      v17 = &v15[v16];
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedText"));
      v17 = (char *)objc_msgSend(v19, "length");

    }
    v20 = &v13[(_QWORD)v17];

    v21 = location - (_QWORD)v20;
    v22 = v11 - (_QWORD)v20;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedTextRange"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "end"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v24, v21));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v24, v22));
    v27 = (void *)v26;
    v18 = 0;
    if (v25 && v26)
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textRangeFromPosition:toPosition:", v25, v26));

  }
  return v18;
}

@end
