@implementation SPSlicingDescriptor

- (SPSlicingDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPSlicingDescriptor;
  return -[SPSlicingDescriptor init](&v3, "init");
}

+ (id)_coreTelephonyDescriptor:(id)a3
{
  id v3;
  SPSlicingDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(SPSlicingDescriptor);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
  -[SPSlicingDescriptor setAddress:](v4, "setAddress:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  -[SPSlicingDescriptor setHost:](v4, "setHost:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "port"));
  -[SPSlicingDescriptor setPort:](v4, "setPort:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appCategory"));
  -[SPSlicingDescriptor setAppCategory:](v4, "setAppCategory:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
  -[SPSlicingDescriptor setBundleId:](v4, "setBundleId:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dnn"));
  -[SPSlicingDescriptor setDnn:](v4, "setDnn:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ipProtocol"));
  -[SPSlicingDescriptor setIpProtocol:](v4, "setIpProtocol:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "portRangeLow"));
  -[SPSlicingDescriptor setPortRangeLow:](v4, "setPortRangeLow:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "portRangeUpper"));
  -[SPSlicingDescriptor setPortRangeUpper:](v4, "setPortRangeUpper:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trafficClass"));
  -[SPSlicingDescriptor setTrafficClass:](v4, "setTrafficClass:", v14);

  return v4;
}

+ (id)_coreTelephonyDescritorList:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  NSMutableArray *v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  if (v3 && objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingDescriptor _coreTelephonyDescriptor:](SPSlicingDescriptor, "_coreTelephonyDescriptor:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), (_QWORD)v14));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }

  }
  v11 = qword_1002BEFA0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "slice descriptors %@", buf, 0xCu);
  }
  v12 = -[NSMutableArray copy](v4, "copy", (_QWORD)v14);

  return v12;
}

+ (id)_coreTelephonyContainer:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trafficDescriptors"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingDescriptor _coreTelephonyDescritorList:](SPSlicingDescriptor, "_coreTelephonyDescritorList:", v5));
  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor host](self, "host"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor port](self, "port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor appCategory](self, "appCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor bundleId](self, "bundleId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor dnn](self, "dnn"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor ipProtocol](self, "ipProtocol"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor portRangeLow](self, "portRangeLow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor portRangeUpper](self, "portRangeUpper"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SPSlicingDescriptor trafficClass](self, "trafficClass"));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: address=%@ %@:%@ category=%@ bundleId=%@ dnn=%@ ip=%@ prl=%@ pru=%@ tclass=%@>"), v16, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13));

  return v15;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)appCategory
{
  return self->_appCategory;
}

- (void)setAppCategory:(id)a3
{
  objc_storeStrong((id *)&self->_appCategory, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (NSNumber)portRangeLow
{
  return self->_portRangeLow;
}

- (void)setPortRangeLow:(id)a3
{
  objc_storeStrong((id *)&self->_portRangeLow, a3);
}

- (NSNumber)portRangeUpper
{
  return self->_portRangeUpper;
}

- (void)setPortRangeUpper:(id)a3
{
  objc_storeStrong((id *)&self->_portRangeUpper, a3);
}

- (NSNumber)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_ipProtocol, a3);
}

- (NSNumber)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(id)a3
{
  objc_storeStrong((id *)&self->_trafficClass, a3);
}

- (NSString)dnn
{
  return self->_dnn;
}

- (void)setDnn:(id)a3
{
  objc_storeStrong((id *)&self->_dnn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnn, 0);
  objc_storeStrong((id *)&self->_trafficClass, 0);
  objc_storeStrong((id *)&self->_ipProtocol, 0);
  objc_storeStrong((id *)&self->_portRangeUpper, 0);
  objc_storeStrong((id *)&self->_portRangeLow, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_appCategory, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
