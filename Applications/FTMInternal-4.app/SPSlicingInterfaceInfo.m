@implementation SPSlicingInterfaceInfo

+ (id)_coreTelephonyInterface:(id)a3
{
  id v3;
  SPSlicingInterfaceInfo *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_opt_new(SPSlicingInterfaceInfo);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interface"));
    -[SPSlicingInterfaceInfo setInterface:](v4, "setInterface:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trafficDescriptors"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingDescriptor _coreTelephonyDescritorList:](SPSlicingDescriptor, "_coreTelephonyDescritorList:", v6));
    -[SPSlicingInterfaceInfo setTrafficDescriptors:](v4, "setTrafficDescriptors:", v7);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_coreTelephonyInterfaceList:(id)a3
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
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingInterfaceInfo _coreTelephonyInterface:](SPSlicingInterfaceInfo, "_coreTelephonyInterface:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13));
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

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingInterfaceInfo interface](self, "interface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingInterfaceInfo trafficDescriptors](self, "trafficDescriptors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: interface=%@ descriptors=%@>"), v4, v5, v6));

  return v7;
}

- (NSString)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (NSArray)trafficDescriptors
{
  return self->_trafficDescriptors;
}

- (void)setTrafficDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_trafficDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDescriptors, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
