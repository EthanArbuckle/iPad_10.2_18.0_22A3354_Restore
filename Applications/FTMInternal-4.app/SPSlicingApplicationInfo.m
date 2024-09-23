@implementation SPSlicingApplicationInfo

+ (id)_coreTelephonyApplicationInfo:(id)a3
{
  id v3;
  SPSlicingApplicationInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_opt_new(SPSlicingApplicationInfo);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
    -[SPSlicingApplicationInfo setBundleId:](v4, "setBundleId:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "foreground"));
    -[SPSlicingApplicationInfo setForeground:](v4, "setForeground:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interfaces"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingInterfaceInfo _coreTelephonyInterfaceList:](SPSlicingInterfaceInfo, "_coreTelephonyInterfaceList:", v7));
    -[SPSlicingApplicationInfo setInterfaces:](v4, "setInterfaces:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_coreTelephonyAppInfoList:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingApplicationInfo _coreTelephonyApplicationInfo:](SPSlicingApplicationInfo, "_coreTelephonyApplicationInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  v11 = -[NSMutableArray copy](v4, "copy", (_QWORD)v13);

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingApplicationInfo bundleId](self, "bundleId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingApplicationInfo foreground](self, "foreground"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingApplicationInfo interfaces](self, "interfaces"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: bundleId=%@ foreground=%@ interfaces=%@>"), v4, v5, v6, v7));

  return v8;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSNumber)foreground
{
  return self->_foreground;
}

- (void)setForeground:(id)a3
{
  objc_storeStrong((id *)&self->_foreground, a3);
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_interfaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_foreground, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
