@implementation MPAVRoutingViewItem

- (NSString)localizedTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *result;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  switch(-[MPAVRoutingViewItem type](self, "type"))
  {
    case 0:
    case 3:
    case 4:
      -[MPAVRoutingViewItem routes](self, "routes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "routeName");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1:
    case 7:
      v6 = (void *)MEMORY[0x1E0C99DE8];
      -[MPAVRoutingViewItem routes](self, "routes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[MPAVRoutingViewItem routes](self, "routes", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v13, "routeName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v13, "routeName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" + "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 2:
    case 6:
      return self->_localizedTitle;
    case 5:
      -[MPAVRoutingViewItem routes](self, "routes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "protocolName");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v16 = (void *)v5;

LABEL_17:
      result = v16;
      break;
    default:
      result = &stru_1E3163D10;
      break;
  }
  return result;
}

- (MPAVRoute)mainRoute
{
  MPAVRoute *leader;

  leader = self->_leader;
  if (leader)
    return leader;
  -[NSArray firstObject](self->_routes, "firstObject");
  return (MPAVRoute *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isExpandable
{
  void *v3;
  void *v4;
  BOOL v5;

  -[MPAVRoutingViewItem mainRoute](self, "mainRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = 1;
  else
    v5 = self->_type == 1;

  return v5;
}

- (BOOL)isPickable
{
  void *v2;
  char v3;

  -[MPAVRoutingViewItem mainRoute](self, "mainRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPickable");

  return v3;
}

- (unint64_t)nestedLevel
{
  void *v2;
  char *v3;
  void *v4;
  void *v5;

  -[MPAVRoutingViewItem mainRoute](self, "mainRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentRoute");
  v3 = (char *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = 0;
    v4 = v2;
    do
    {
      ++v3;
      objc_msgSend(v4, "parentRoute");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "parentRoute");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v2;
    }
    while (v5);
  }

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  MPAVRoutingViewItem *v4;
  MPAVRoutingViewItem *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  NSString *actionIdentifier;
  NSString *localizedSubtitle;
  NSString *v12;
  int v13;
  NSString *vendorSpecificCustomRowIdentifier;

  v4 = (MPAVRoutingViewItem *)a3;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MPAVRoutingViewItem type](v5, "type");
      if (v6 != -[MPAVRoutingViewItem type](self, "type"))
      {
        LOBYTE(self) = 0;
        goto LABEL_11;
      }
      v7 = -[MPAVRoutingViewItem type](self, "type");
      if (v7 > 7)
        goto LABEL_11;
      if (((1 << v7) & 0xBB) != 0)
      {
        self = (MPAVRoutingViewItem *)self->_routes;
        -[MPAVRoutingViewItem routes](v5, "routes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = -[MPAVRoutingViewItem isEqual:](self, "isEqual:", v8);
LABEL_7:

LABEL_11:
        goto LABEL_12;
      }
      if (v7 == 2)
      {
        actionIdentifier = self->_actionIdentifier;
        -[MPAVRoutingViewItem actionIdentifier](v5, "actionIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](actionIdentifier, "isEqualToString:", v8))
        {
          localizedSubtitle = self->_localizedSubtitle;
          -[MPAVRoutingViewItem localizedSubtitle](v5, "localizedSubtitle");
          v12 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
          if (localizedSubtitle == v12)
          {

          }
          else
          {
            v13 = -[NSString isEqual:](localizedSubtitle, "isEqual:", v12);

            if (!v13)
            {
              LOBYTE(self) = 0;
LABEL_24:

              goto LABEL_7;
            }
          }
          LODWORD(self) = self->_enabled;
          LOBYTE(self) = (_DWORD)self == -[MPAVRoutingViewItem enabled](v5, "enabled");
          goto LABEL_24;
        }
      }
      else
      {
        vendorSpecificCustomRowIdentifier = self->_vendorSpecificCustomRowIdentifier;
        -[MPAVRoutingViewItem vendorSpecificCustomRowIdentifier](v5, "vendorSpecificCustomRowIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](vendorSpecificCustomRowIdentifier, "isEqualToString:", v8))
        {
          self = (MPAVRoutingViewItem *)self->_localizedTitle;
          -[MPAVRoutingViewItem localizedTitle](v5, "localizedTitle");
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = -[MPAVRoutingViewItem isEqualToString:](self, "isEqualToString:", v12);
          goto LABEL_24;
        }
      }
      LOBYTE(self) = 0;
      goto LABEL_7;
    }
    LOBYTE(self) = 0;
  }
LABEL_12:

  return self & 1;
}

- (unint64_t)hash
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_routes;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "routeUID", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 ^= objc_msgSend(v9, "hash");

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return -[NSString hash](self->_actionIdentifier, "hash") ^ v6;
}

- (id)_stateDumpObject
{
  __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *actionIdentifier;

  switch(self->_type)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      -[NSArray firstObject](self->_routes, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescription");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("<NONE>");
      if (v4)
        v6 = (__CFString *)v4;
      v2 = v6;

      goto LABEL_8;
    case 1:
    case 7:
      -[NSArray debugDescription](self->_routes, "debugDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v7;
      v8 = CFSTR("<NONE>");
      if (v7)
        v8 = (__CFString *)v7;
      v2 = v8;
LABEL_8:

      return v2;
    case 2:
      actionIdentifier = (__CFString *)self->_actionIdentifier;
      goto LABEL_11;
    case 6:
      actionIdentifier = (__CFString *)self->_vendorSpecificCustomRowIdentifier;
LABEL_11:
      if (!actionIdentifier)
        actionIdentifier = CFSTR("<NONE>");
      v2 = actionIdentifier;
      break;
    default:
      return v2;
  }
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)routes
{
  return self->_routes;
}

- (MPAVRoute)leader
{
  return self->_leader;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)vendorSpecificCustomRowIdentifier
{
  return self->_vendorSpecificCustomRowIdentifier;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorSpecificCustomRowIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

+ (id)itemWithRoute:(id)a3
{
  id v3;
  MPAVRoutingViewItem *v4;
  uint64_t v5;
  NSArray *routes;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MPAVRoutingViewItem);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  routes = v4->_routes;
  v4->_routes = (NSArray *)v5;

  v4->_enabled = 1;
  v4->_type = 0;
  return v4;
}

+ (id)itemWithLeader:(id)a3 members:(id)a4
{
  MPAVRoute *v5;
  id v6;
  MPAVRoutingViewItem *v7;
  NSArray *v8;
  uint64_t v9;
  NSArray *routes;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *localizedSubtitle;
  MPAVRoute *leader;

  v5 = (MPAVRoute *)a3;
  v6 = a4;
  v7 = objc_alloc_init(MPAVRoutingViewItem);
  v8 = (NSArray *)objc_msgSend(v6, "copy");

  if (!-[NSArray containsObject:](v8, "containsObject:", v5))
  {
    -[NSArray arrayByAddingObject:](v8, "arrayByAddingObject:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (NSArray *)v9;
  }
  routes = v7->_routes;
  v7->_routes = v8;
  v11 = v8;

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ROUTING_GROUP_SUBTITLE_COUNT"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, -[NSArray count](v11, "count"));
  v15 = objc_claimAutoreleasedReturnValue();
  localizedSubtitle = v7->_localizedSubtitle;
  v7->_localizedSubtitle = (NSString *)v15;

  leader = v7->_leader;
  v7->_leader = v5;

  v7->_enabled = 1;
  v7->_type = 1;
  return v7;
}

+ (id)itemWithActionTitle:(id)a3 subtitle:(id)a4 enabled:(BOOL)a5 identifier:(id)a6 image:(id)a7
{
  UIImage *v11;
  id v12;
  id v13;
  id v14;
  MPAVRoutingViewItem *v15;
  uint64_t v16;
  NSString *localizedTitle;
  uint64_t v18;
  NSString *localizedSubtitle;
  uint64_t v20;
  NSString *actionIdentifier;
  UIImage *image;

  v11 = (UIImage *)a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(MPAVRoutingViewItem);
  v16 = objc_msgSend(v14, "copy");

  localizedTitle = v15->_localizedTitle;
  v15->_localizedTitle = (NSString *)v16;

  v18 = objc_msgSend(v13, "copy");
  localizedSubtitle = v15->_localizedSubtitle;
  v15->_localizedSubtitle = (NSString *)v18;

  v15->_enabled = a5;
  v20 = objc_msgSend(v12, "copy");

  actionIdentifier = v15->_actionIdentifier;
  v15->_actionIdentifier = (NSString *)v20;

  image = v15->_image;
  v15->_image = v11;

  v15->_type = 2;
  return v15;
}

+ (id)itemWithVendorSpecificRoute:(id)a3
{
  id v3;
  MPAVRoutingViewItem *v4;
  uint64_t v5;
  NSArray *routes;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MPAVRoutingViewItem);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  routes = v4->_routes;
  v4->_routes = (NSArray *)v5;

  v4->_enabled = 1;
  if (objc_msgSend(v3, "isGroup"))
  {
    v7 = 4;
  }
  else if (objc_msgSend(v3, "isSubRoute"))
  {
    v7 = 5;
  }
  else
  {
    v7 = 3;
  }
  v4->_type = v7;

  return v4;
}

+ (id)itemWithVendorSpecificLeader:(id)a3 members:(id)a4
{
  MPAVRoute *v5;
  id v6;
  MPAVRoutingViewItem *v7;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  NSArray *routes;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *localizedSubtitle;
  MPAVRoute *leader;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (MPAVRoute *)a3;
  v6 = a4;
  v7 = objc_alloc_init(MPAVRoutingViewItem);
  v8 = (NSArray *)objc_msgSend(v6, "copy");

  if (!-[NSArray containsObject:](v8, "containsObject:", v5))
  {
    v20[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (NSArray *)v10;
  }
  routes = v7->_routes;
  v7->_routes = v8;
  v12 = v8;

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaPlayerBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ROUTING_GROUP_SUBTITLE_COUNT"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, -[NSArray count](v12, "count"));
  v16 = objc_claimAutoreleasedReturnValue();
  localizedSubtitle = v7->_localizedSubtitle;
  v7->_localizedSubtitle = (NSString *)v16;

  leader = v7->_leader;
  v7->_leader = v5;

  v7->_enabled = 1;
  v7->_type = 7;
  return v7;
}

+ (id)itemWithVendorSpecificCustomRowTitle:(id)a3 icon:(id)a4 identifier:(id)a5
{
  UIImage *v7;
  id v8;
  id v9;
  MPAVRoutingViewItem *v10;
  uint64_t v11;
  NSString *localizedTitle;
  UIImage *image;
  UIImage *v14;
  uint64_t v15;
  NSString *vendorSpecificCustomRowIdentifier;

  v7 = (UIImage *)a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(MPAVRoutingViewItem);
  v11 = objc_msgSend(v9, "copy");

  localizedTitle = v10->_localizedTitle;
  v10->_localizedTitle = (NSString *)v11;

  image = v10->_image;
  v10->_image = v7;
  v14 = v7;

  v15 = objc_msgSend(v8, "copy");
  vendorSpecificCustomRowIdentifier = v10->_vendorSpecificCustomRowIdentifier;
  v10->_vendorSpecificCustomRowIdentifier = (NSString *)v15;

  v10->_enabled = 1;
  v10->_type = 6;
  return v10;
}

@end
