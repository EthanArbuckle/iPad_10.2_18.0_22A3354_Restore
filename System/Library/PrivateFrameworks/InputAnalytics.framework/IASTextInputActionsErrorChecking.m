@implementation IASTextInputActionsErrorChecking

+ (id)validateLanguageHelper:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;

  v3 = a3;
  objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], v4, (uint64_t)CFSTR("emoji"), v5, v6, CFSTR("dictation"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if ((objc_msgSend_containsObject_(v7, v8, (uint64_t)v3, v9, v10) & 1) == 0)
  {
    if (objc_msgSend_length(v3, v11, v12, v13, v14) == 2
      || objc_msgSend_length(v3, v16, v17, v18, v19) == 3
      || objc_msgSend_length(v3, v16, v17, v18, v19) == 7
      || objc_msgSend_length(v3, v16, v17, v18, v19) == 8)
    {
      if (qword_254343B58 != -1)
        dispatch_once(&qword_254343B58, &unk_250F8F218);
      v20 = (void *)qword_254343B40;
      v21 = objc_msgSend_length(v3, v16, v17, v18, v19);
      if (objc_msgSend_numberOfMatchesInString_options_range_(v20, v22, (uint64_t)v3, 0, 0, v21) == 1)
        v15 = 0;
      else
        v15 = CFSTR("L");
    }
    else
    {
      v15 = CFSTR("L");
    }
  }

  return (id)v15;
}

+ (id)validateLanguage:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char isEqual;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;

  v3 = a3;
  v8 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    if (qword_254343B38 != -1)
      dispatch_once(&qword_254343B38, &unk_250F8F5A8);
    objc_msgSend_objectForKey_((void *)qword_254343B50, v9, (uint64_t)v8, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v16, v18, (uint64_t)v17, v19, v20);

      if ((isEqual & 1) != 0)
        v22 = 0;
      else
        v22 = v16;
    }
    else
    {
      objc_msgSend_validateLanguageHelper_(IASTextInputActionsErrorChecking, v12, (uint64_t)v8, v14, v15);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (void *)qword_254343B50;
      if (v22)
      {
        objc_msgSend_setObject_forKey_((void *)qword_254343B50, v23, (uint64_t)v22, (uint64_t)v8, v26);
      }
      else
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v23, v24, v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v27, v29, (uint64_t)v28, (uint64_t)v8, v30);

      }
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)validateRegionHelper:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;

  v3 = a3;
  if ((unint64_t)objc_msgSend_length(v3, v4, v5, v6, v7) >= 2)
  {
    v12 = CFSTR("R");
    if ((unint64_t)objc_msgSend_length(v3, v8, v9, v10, v11) <= 4)
    {
      if (qword_254343B68 != -1)
        dispatch_once(&qword_254343B68, &unk_250F8F338);
      v17 = (void *)qword_254343B70;
      v18 = objc_msgSend_length(v3, v13, v14, v15, v16);
      if (objc_msgSend_numberOfMatchesInString_options_range_(v17, v19, (uint64_t)v3, 0, 0, v18) == 1)
        v12 = 0;
    }
  }
  else
  {
    v12 = CFSTR("R");
  }

  return (id)v12;
}

+ (id)validateRegion:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char isEqual;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;

  v3 = a3;
  v8 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    if (qword_254343B48 != -1)
      dispatch_once(&qword_254343B48, &unk_250F8F1D8);
    objc_msgSend_objectForKey_((void *)qword_254343B60, v9, (uint64_t)v8, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v16, v18, (uint64_t)v17, v19, v20);

      if ((isEqual & 1) != 0)
        v22 = 0;
      else
        v22 = v16;
    }
    else
    {
      objc_msgSend_validateRegionHelper_(IASTextInputActionsErrorChecking, v12, (uint64_t)v8, v14, v15);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (void *)qword_254343B60;
      if (v22)
      {
        objc_msgSend_setObject_forKey_((void *)qword_254343B60, v23, (uint64_t)v22, (uint64_t)v8, v26);
      }
      else
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v23, v24, v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v27, v29, (uint64_t)v28, (uint64_t)v8, v30);

      }
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
