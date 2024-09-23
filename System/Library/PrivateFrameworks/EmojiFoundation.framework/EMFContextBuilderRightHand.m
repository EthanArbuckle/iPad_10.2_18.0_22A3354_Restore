@implementation EMFContextBuilderRightHand

- (void)enumerateWindowsForContext:(id)a3 range:(_NSRange)a4 searchAnchors:(id)a5 usingBlock:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, unint64_t, uint64_t, uint64_t, char *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger length;
  NSUInteger location;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, char *))a6;
  v31 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v9;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v28;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v24)
        objc_enumerationMutation(obj);
      if (v31)
        break;
      v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11);
      v13 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v12, 1, a4.location, a4.length, 0);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = v13;
        v16 = v14;
        location = a4.location;
        length = a4.length;
        do
        {
          v19 = v15 + v16;
          if (v15 + v16 < 0)
            goto LABEL_16;
          v20 = kEMFContextBuilderContextWindowLengthDefault;
          if (v19 >= objc_msgSend(v8, "length"))
            goto LABEL_16;
          v21 = v20 + v19;
          if (v20 + v19 >= location + length)
            v21 = location + length;
          v10[2](v10, v15 + v16, v21 - v19, v15, v16, &v31);
          length = objc_msgSend(v8, "length") - v19;
          v15 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v12, 1, v15 + v16, length, 0);
          v16 = v22;
          location = v19;
        }
        while (v15 != 0x7FFFFFFFFFFFFFFFLL);
      }
      if (++v11 == v23)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v23)
          goto LABEL_3;
        break;
      }
    }
  }
LABEL_16:

}

@end
