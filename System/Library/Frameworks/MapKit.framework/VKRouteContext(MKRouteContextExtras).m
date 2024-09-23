@implementation VKRouteContext(MKRouteContextExtras)

- (id)_routeInfoForRoute:()MKRouteContextExtras
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "routeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(a1, "routeInfo");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "alternateRoutes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "route");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v13 = v12 == v4;

          if (v13)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v8;
}

@end
