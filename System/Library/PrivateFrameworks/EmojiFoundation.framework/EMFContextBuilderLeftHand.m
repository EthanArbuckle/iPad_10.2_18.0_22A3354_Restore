@implementation EMFContextBuilderLeftHand

- (void)enumerateWindowsForContext:(id)a3 range:(_NSRange)a4 searchAnchors:(id)a5 usingBlock:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(id, uint64_t, uint64_t, uint64_t, uint64_t, char *);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v27 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, char *))a6;
  v32 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v9;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v29;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v25)
        objc_enumerationMutation(obj);
      if (v32)
        break;
      v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
      v12 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v11, 1, a4.location, a4.length, 0);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = v12;
        v15 = v13;
        v16 = 0;
        v17 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          v18 = v17 + v16;
          v19 = v17 == 0x7FFFFFFFFFFFFFFFLL;
          v17 = v14;
          v20 = v14 - v18;
          if (v19)
            v20 = kEMFContextBuilderContextWindowLengthDefault;
          v21 = (v14 - v20) & ~((v14 - v20) >> 63);
          if (v14 - v21 >= 1 && v14 - v21 < (unint64_t)objc_msgSend(v8, "length"))
            v27[2](v27, v21, v14 - v21, v14, v15, &v32);
          v14 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v11, 1, v14 + v15, objc_msgSend(v8, "length") - (v14 + v15), 0);
          v16 = v15;
          v15 = v22;
        }
        while (v14 != 0x7FFFFFFFFFFFFFFFLL);
      }
      if (++v10 == v26)
      {
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v26)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end
