@implementation WFMediaRouteDescriptor

- (WFMediaRouteDescriptor)initWithRouteUID:(id)a3 groupUID:(id)a4 routeName:(id)a5 isLocalDevice:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  WFMediaRouteDescriptor *v13;
  uint64_t v14;
  NSString *groupUID;
  uint64_t v16;
  NSString *routeUID;
  uint64_t v18;
  NSString *routeName;
  WFMediaRouteDescriptor *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFMediaRouteDescriptor;
  v13 = -[MTLModel init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    groupUID = v13->_groupUID;
    v13->_groupUID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    routeUID = v13->_routeUID;
    v13->_routeUID = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    routeName = v13->_routeName;
    v13->_routeName = (NSString *)v18;

    v13->_isLocalDevice = a6;
    v20 = v13;
  }

  return v13;
}

- (NSString)displayName
{
  void *v3;
  void *v4;

  if (-[WFMediaRouteDescriptor isLocalDevice](self, "isLocalDevice"))
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFMediaRouteDescriptor routeName](self, "routeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (BOOL)isEqualInRouteUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[WFMediaRouteDescriptor routeUID](self, "routeUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "routeUID:isEqualToRouteUID:", v6, v7);
  return (char)v4;
}

- (id)findMatchingRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFMediaRouteDescriptor routeUID](self, "routeUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
          v12 = objc_opt_class();
          objc_msgSend(v11, "routeUID", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFMediaRouteDescriptor routeUID](self, "routeUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend((id)v12, "routeUID:isEqualToRouteUID:", v13, v14);

          if ((v12 & 1) != 0)
          {
            v17 = v11;
            goto LABEL_16;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  if (!-[WFMediaRouteDescriptor isLocalDevice](self, "isLocalDevice", (_QWORD)v19)
    || (objc_msgSend(v4, "objectMatchingKey:BOOLValue:", CFSTR("isDeviceSpeakerRoute"), 1),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[WFMediaRouteDescriptor routeName](self, "routeName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[WFMediaRouteDescriptor routeName](self, "routeName");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectMatchingKey:value:", CFSTR("routeName"), v6);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v15 = v17;

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "mtl_identityPropertyMapWithModel:", a1);
}

+ (BOOL)routeUID:(id)a3 isEqualToRouteUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("//"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("//"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") != 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") != 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsString:", v9) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v9, "containsString:", v8);

  return v10;
}

@end
