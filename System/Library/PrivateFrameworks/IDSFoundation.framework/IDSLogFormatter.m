@implementation IDSLogFormatter

+ (id)descriptionForString:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;

  v4 = a4;
  v5 = a3;
  v9 = v5;
  if ((v4 & 8) != 0 && (unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 0x65)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend__md5Hash(v9, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("-> %@"), v13, v11);
  }
  else
  {
    if ((v4 & 4) == 0 || (unint64_t)objc_msgSend_length(v9, v6, v7, v8) < 0x33)
    {
      v19 = v9;
      goto LABEL_9;
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_substringToIndex_(v9, v14, 20, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v17, (uint64_t)CFSTR("%@ <...>"), v18, v11);
  }
  v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v19;
}

+ (id)descriptionForData:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  uint64_t v15;

  v4 = a4;
  v5 = a3;
  v9 = v5;
  if ((v4 & 2) != 0 && (unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 0x65)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_SHA1HexString(v9, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("-> %@"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((v4 & 1) != 0 && (unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 0x33)
    {
      objc_msgSend_truncatedDescription(v9, v6, v7, v8);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_description(v9, v6, v7, v8);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v15;
  }

  return v14;
}

+ (id)descriptionForArray:(id)a3 options:(unint64_t)a4
{
  double v4;

  return (id)objc_msgSend_descriptionForArray_options_level_(a1, a2, (uint64_t)a3, v4, a4, 0);
}

+ (id)descriptionForArray:(id)a3 options:(unint64_t)a4 level:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  id v12;
  id v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  unint64_t v24;
  int64_t v25;
  id v26;

  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendString_(v9, v10, (uint64_t)CFSTR("("), v11);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_19BAE0588;
  v21[3] = &unk_1E3C22288;
  v24 = a4;
  v12 = v9;
  v22 = v12;
  v25 = a5;
  v26 = a1;
  v13 = v8;
  v23 = v13;
  objc_msgSend_enumerateObjectsUsingBlock_(v13, v14, (uint64_t)v21, v15);
  if ((a4 & 0x10) != 0 && a5 >= 1)
  {
    do
    {
      objc_msgSend_appendString_(v12, v16, (uint64_t)CFSTR("  "), v17);
      --a5;
    }
    while (a5);
  }
  objc_msgSend_appendString_(v12, v16, (uint64_t)CFSTR(")"), v17);
  v18 = v23;
  v19 = v12;

  return v19;
}

+ (id)descriptionForDictionary:(id)a3 options:(unint64_t)a4
{
  double v4;

  return (id)objc_msgSend_descriptionForDictionary_options_level_(a1, a2, (uint64_t)a3, v4, a4, 0);
}

+ (id)descriptionForDictionary:(id)a3 options:(unint64_t)a4 level:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  uint64_t v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendString_(v9, v10, (uint64_t)CFSTR("{\n"), v11);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v36, v13, v40, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v37;
    v16 = a5 + 1;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v17);
        v19 = v16;
        v20 = a5;
        if ((a5 & 0x8000000000000000) == 0)
        {
          do
          {
            objc_msgSend_appendString_(v9, v14, (uint64_t)CFSTR("  "), v15);
            --v19;
          }
          while (v19);
        }
        objc_msgSend_descriptionForObject_options_level_(a1, v14, v18, v15, a4, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(obj, v22, v18, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_descriptionForObject_options_level_(a1, v25, (uint64_t)v24, v26, a4, v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v9, v28, (uint64_t)CFSTR("%@ : %@\n"), v29, v21, v27);

        ++v17;
        a5 = v20;
      }
      while (v17 != v34);
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v36, v15, v40, 16);
    }
    while (v34);
  }

  if (a5 >= 1)
  {
    do
    {
      objc_msgSend_appendString_(v9, v30, (uint64_t)CFSTR("  "), v31);
      --a5;
    }
    while (a5);
  }
  objc_msgSend_appendString_(v9, v30, (uint64_t)CFSTR("}"), v31);

  return v9;
}

+ (id)descriptionForObject:(id)a3 options:(unint64_t)a4
{
  double v4;

  return (id)objc_msgSend_descriptionForObject_options_level_(a1, a2, (uint64_t)a3, v4, a4, 0);
}

+ (id)descriptionForObject:(id)a3 options:(unint64_t)a4 level:(int64_t)a5
{
  id v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_descriptionForString_options_(a1, v9, (uint64_t)v8, v10, a4);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_descriptionForData_options_(a1, v12, (uint64_t)v8, v13, a4);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_descriptionForArray_options_level_(a1, v14, (uint64_t)v8, v15, a4, a5);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_descriptionForDictionary_options_level_(a1, v16, (uint64_t)v8, v18, a4, a5);
        else
          objc_msgSend_description(v8, v16, v17, v18);
        v11 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v19 = (void *)v11;

  return v19;
}

@end
