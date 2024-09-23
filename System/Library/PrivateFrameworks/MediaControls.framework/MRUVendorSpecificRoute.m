@implementation MRUVendorSpecificRoute

- (MRUVendorSpecificRoute)initWithDevice:(id)a3
{
  id v5;
  MRUVendorSpecificRoute *v6;
  MRUVendorSpecificRoute *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *subrouteMap;
  uint64_t v10;
  UIImage *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  UIImage *v24;
  UIImage *protocolIcon;
  uint64_t v26;
  UIImage *v27;
  void *v28;
  uint64_t v29;
  NSString *protocolName;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MRUVendorSpecificRoute;
  v6 = -[MRUVendorSpecificRoute init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_shouldBeDisplayed = 1;
    if (v5)
    {
      objc_storeStrong((id *)&v6->_device, a3);
      if (-[MRUVendorSpecificRoute isGroup](v7, "isGroup"))
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        subrouteMap = v7->_subrouteMap;
        v7->_subrouteMap = v8;

        v7->_expanded = 0;
      }
      else
      {
        objc_msgSend(v5, "protocolType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = (void *)MEMORY[0x1E0D3A838];
          objc_msgSend(v14, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "symbolForTypeIdentifier:error:", v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "scale");
            objc_msgSend(v18, "imageForSize:scale:", 20.0, 20.0, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v21, "CGImage"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "imageWithRenderingMode:", 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v24 = v23;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("airplayvideo"));
              v24 = (UIImage *)objc_claimAutoreleasedReturnValue();
            }
            protocolIcon = v7->_protocolIcon;
            v7->_protocolIcon = v24;

            objc_msgSend(v15, "localizedDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v15, "localizedDescription");
              v29 = objc_claimAutoreleasedReturnValue();
              protocolName = v7->_protocolName;
              v7->_protocolName = (NSString *)v29;
            }
            else
            {
              protocolName = v7->_protocolName;
              v7->_protocolName = (NSString *)CFSTR("Unknown Protocol");
            }

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("airplayvideo"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v7->_protocolIcon;
          v7->_protocolIcon = (UIImage *)v26;

          v18 = v7->_protocolName;
          v7->_protocolName = (NSString *)CFSTR("Unknown Protocol");
        }

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("airplayvideo"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v7->_protocolIcon;
      v7->_protocolIcon = (UIImage *)v10;

      +[MRUStringsProvider vendorSpecificAirPlay](MRUStringsProvider, "vendorSpecificAirPlay");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v7->_protocolName;
      v7->_protocolName = (NSString *)v12;

    }
  }

  return v7;
}

- (id)routeName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[MRUVendorSpecificRoute isGroup](self, "isGroup"))
  {
    -[DADevice endpoints](self->_device, "endpoints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[DADevice endpoints](self->_device, "endpoints", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "underlyingDADevice");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(v13, "name");
            v15 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v15;
            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    if (-[MRUVendorSpecificRoute isAirPlayRoute](self, "isAirPlayRoute"))
      -[MPAVRoute routeName](self->_underlyingNativeRoute, "routeName");
    else
      -[DADevice name](self->_device, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)routeUID
{
  if (self->_underlyingNativeRoute)
    -[MPAVRoute routeUID](self->_underlyingNativeRoute, "routeUID");
  else
    -[DADevice identifier](self->_device, "identifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)vendorSpecificRouteType
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[MRUVendorSpecificRoute isGroup](self, "isGroup"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[MRUVendorSpecificRoute subroutes](self, "subroutes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v3);
          v6 = -[MRUVendorSpecificRoute moreCapableTypeBetween:otherType:](self, "moreCapableTypeBetween:otherType:", v6, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "vendorSpecificRouteType"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    if (!-[MRUVendorSpecificRoute isAirPlayRoute](self, "isAirPlayRoute"))
      return -[DADevice type](self->_device, "type");
    if ((unint64_t)(-[MPAVRoute routeType](self->_underlyingNativeRoute, "routeType") - 1) >= 2)
      return 0;
    else
      return 3;
  }
  return v6;
}

- (int64_t)routeType
{
  void *v3;
  int64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[MRUVendorSpecificRoute isGroup](self, "isGroup"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[MRUVendorSpecificRoute subroutes](self, "subroutes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = 0;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "routeType") == 1;
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
      v4 = v5 & 1;
    }

  }
  else
  {
    if (-[MRUVendorSpecificRoute isAirPlayRoute](self, "isAirPlayRoute"))
      return -[MPAVRoute routeType](self->_underlyingNativeRoute, "routeType");
    return ((unint64_t)-[DADevice flags](self->_device, "flags") >> 2) & 1;
  }
  return v4;
}

- (int64_t)routeSubtype
{
  return 0;
}

- (BOOL)isGroup
{
  void *v2;
  BOOL v3;

  -[DADevice endpoints](self->_device, "endpoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (NSArray)subroutes
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  -[NSMutableDictionary allValues](self->_subrouteMap, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MRUVendorSpecificRoute_subroutes__block_invoke;
  v5[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v5[4] = 577;
  objc_msgSend(v2, "sortedArrayUsingComparator:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __35__MRUVendorSpecificRoute_subroutes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "protocolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:options:", v8, *(_QWORD *)(a1 + 32));

  if (!v9)
  {
    objc_msgSend(v5, "routeUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "compare:options:", v11, *(_QWORD *)(a1 + 32));

  }
  return v9;
}

- (NSArray)endpoints
{
  void *v2;
  void *v3;
  void *v4;

  -[DADevice endpoints](self->_device, "endpoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

BOOL __35__MRUVendorSpecificRoute_endpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 < v6;
}

- (BOOL)isAirPlayRoute
{
  return self->_underlyingNativeRoute != 0;
}

- (BOOL)supportsAirPlayGrouping
{
  if (-[MRUVendorSpecificRoute isGroup](self, "isGroup")
    || !-[MRUVendorSpecificRoute isAirPlayRoute](self, "isAirPlayRoute"))
  {
    return 0;
  }
  else
  {
    return -[MPAVRoute supportsAirPlayGrouping](self->_underlyingNativeRoute, "supportsAirPlayGrouping");
  }
}

- (BOOL)supportsGrouping
{
  if (-[MRUVendorSpecificRoute isGroup](self, "isGroup"))
    return 0;
  if (-[MRUVendorSpecificRoute isAirPlayRoute](self, "isAirPlayRoute"))
    return -[MPAVRoute supportsAirPlayGrouping](self->_underlyingNativeRoute, "supportsAirPlayGrouping");
  return -[DADevice supportsGrouping](self->_device, "supportsGrouping");
}

- (BOOL)isDisplayedAsPicked
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[MRUVendorSpecificRoute isGroup](self, "isGroup"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[MRUVendorSpecificRoute subroutes](self, "subroutes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "isDisplayedAsPicked") & 1) != 0)
          {

            return 1;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }

    return 0;
  }
  else if (-[MRUVendorSpecificRoute isAirPlayRoute](self, "isAirPlayRoute"))
  {
    return -[MPAVRoute isDisplayedAsPicked](self->_underlyingNativeRoute, "isDisplayedAsPicked");
  }
  else
  {
    return self->_isPicked;
  }
}

- (BOOL)isKnown
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[MRUVendorSpecificRoute isGroup](self, "isGroup"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MRUVendorSpecificRoute subroutes](self, "subroutes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "isKnown");
        if ((objc_msgSend(v8, "isAirPlayRoute") & 1) != 0)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v9 = 0;
    }

    return v9;
  }
  else
  {
    if (-[MRUVendorSpecificRoute isAirPlayRoute](self, "isAirPlayRoute"))
      v10 = 248;
    else
      v10 = 216;
    return objc_msgSend(*(id *)((char *)&self->super.super.isa + v10), "isKnown");
  }
}

- (NSString)protocolIdentifier
{
  void *v2;
  void *v3;

  -[DADevice protocolType](self->_device, "protocolType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->_expanded = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_subrouteMap, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setShouldBeDisplayed:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addSubRoute:(id)a3
{
  NSMutableDictionary *subrouteMap;
  void *v5;
  id v6;

  subrouteMap = self->_subrouteMap;
  v6 = a3;
  objc_msgSend(v6, "routeUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](subrouteMap, "setObject:forKeyedSubscript:", v6, v5);

  objc_msgSend(v6, "setParentRoute:", self);
  objc_msgSend(v6, "setShouldBeDisplayed:", self->_expanded);

}

- (MRUVendorSpecificRoute)preferredSubroute
{
  MRUVendorSpecificRoute *tempPreferredSubrouteOverride;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  tempPreferredSubrouteOverride = self->_tempPreferredSubrouteOverride;
  if (tempPreferredSubrouteOverride)
    return tempPreferredSubrouteOverride;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_subrouteMap, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isPreferredRoute") & 1) != 0)
        {
          v10 = v9;

          return (MRUVendorSpecificRoute *)v10;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  return (MRUVendorSpecificRoute *)0;
}

- (int64_t)moreCapableTypeBetween:(int64_t)a3 otherType:(int64_t)a4
{
  if (a3 <= a4)
    return a4;
  else
    return a3;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)shouldBeDisplayed
{
  return self->_shouldBeDisplayed;
}

- (void)setShouldBeDisplayed:(BOOL)a3
{
  self->_shouldBeDisplayed = a3;
}

- (DADevice)device
{
  return self->_device;
}

- (UIImage)protocolIcon
{
  return self->_protocolIcon;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (MRUVendorSpecificRoute)tempPreferredSubrouteOverride
{
  return self->_tempPreferredSubrouteOverride;
}

- (void)setTempPreferredSubrouteOverride:(id)a3
{
  objc_storeStrong((id *)&self->_tempPreferredSubrouteOverride, a3);
}

- (BOOL)isPicked
{
  return self->_isPicked;
}

- (void)setIsPicked:(BOOL)a3
{
  self->_isPicked = a3;
}

- (MPAVRoute)underlyingNativeRoute
{
  return self->_underlyingNativeRoute;
}

- (void)setUnderlyingNativeRoute:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingNativeRoute, a3);
}

- (BOOL)isPreferredRoute
{
  return self->_isPreferredRoute;
}

- (void)setIsPreferredRoute:(BOOL)a3
{
  self->_isPreferredRoute = a3;
}

- (NSMutableDictionary)subrouteMap
{
  return self->_subrouteMap;
}

- (void)setSubrouteMap:(id)a3
{
  objc_storeStrong((id *)&self->_subrouteMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrouteMap, 0);
  objc_storeStrong((id *)&self->_underlyingNativeRoute, 0);
  objc_storeStrong((id *)&self->_tempPreferredSubrouteOverride, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_protocolIcon, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
