@implementation SRVisualResponseTransformer

+ (int64_t)visualMode
{
  return qword_10014D7C8;
}

+ (void)setVisualMode:(int64_t)a3
{
  qword_10014D7C8 = a3;
}

+ (id)transformVisualResponse:(id)a3 forMode:(unint64_t)a4 idiom:(int64_t)a5 shouldHideSnippet:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  BOOL v30;
  void *v31;
  unint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v9 = a3;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "views"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v35;
    v31 = v11;
    v32 = a4;
    v30 = a6;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v16);
        objc_opt_class(SAUIPluginSnippet, v13);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          if (a6)
            goto LABEL_13;
          objc_msgSend(a1, "setVisualMode:", objc_msgSend(a1, "_dialogModeToVisualModeConverter:", a4));
LABEL_12:
          objc_msgSend(v10, "addObject:", v17);
          goto LABEL_13;
        }
        objc_opt_class(SAUIVisualResponseSnippet, v13);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
          goto LABEL_12;
        if (!a6)
        {
          v20 = v17;
          v21 = v10;
          v22 = objc_msgSend(a1, "_dialogModeToVisualModeConverter:", a4);
          objc_msgSend(a1, "setVisualMode:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "modelData"));
          v24 = v22;
          v10 = v21;
          a6 = v30;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[VRXVisualResponseProvider transformModel:mode:currentIdiom:](VRXVisualResponseProvider, "transformModel:mode:currentIdiom:", v23, v24, a5));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_splitVisualResponse:forVisualResponseSnippet:", v25, v20));
          objc_msgSend(v10, "addObjectsFromArray:", v26);

          a4 = v32;
          v11 = v31;
        }
LABEL_13:
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }

  v27 = objc_msgSend(v29, "copy");
  objc_msgSend(v27, "setViews:", v10);

  return v27;
}

+ (int64_t)currentIdiom
{
  if ((SiriUIDeviceIsPad(a1, a2) & 1) != 0)
    return 2;
  if (SiriUIDeviceIsPod())
    return 3;
  return 1;
}

+ (id)_splitVisualResponse:(id)a3 forVisualResponseSnippet:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v27;
    v24 = SAAceViewUIItemTypeItemTypeConversationValue;
    v12 = SAAceViewUIItemTypeItemTypeResultValue;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
        v16 = objc_msgSend(v6, "copy", v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "model"));
        objc_msgSend(v16, "setModelData:", v17);

        v18 = objc_msgSend(v15, "responseType");
        v19 = v12;
        if (v18 == (id)1 || (v20 = objc_msgSend(v15, "responseType", v12), v19 = v24, v20 == (id)2))
          objc_msgSend(v16, "setItemType:", v19);
        if (v14 + (int)v13 >= 1)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID", v19));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
          objc_msgSend(v16, "setAceId:", v22);

        }
        objc_msgSend(v7, "addObject:", v16);

        v13 = (char *)v13 + 1;
      }
      while (v9 != v13);
      v10 = v14 + (_DWORD)v9;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  return v7;
}

+ (int64_t)_dialogModeToVisualModeConverter:(unint64_t)a3
{
  return a3 - 1 < 2;
}

@end
