@implementation MRMediaControlsConfiguration

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *presentingAppBundleID;
  void *v9;
  void *v10;

  v3 = -[MRMediaControlsConfiguration style](self, "style");
  if (v3 > 8)
    v4 = 0;
  else
    v4 = off_1E30C9FE8[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[MRMediaControlsConfiguration routingContextUID](self, "routingContextUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  presentingAppBundleID = self->_presentingAppBundleID;
  MR_NSStringFromCGRect(self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p routingContextUID=%@, style=%@, presentingAppBundleID=%@, sourcRect=%@, preferredWidth=%f>"), v6, self, v7, v4, presentingAppBundleID, v9, *(_QWORD *)&self->_preferredWidth);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRMediaControlsConfiguration)initWithCoder:(id)a3
{
  id v4;
  MRMediaControlsConfiguration *v5;
  uint64_t v6;
  NSString *routingContextUID;
  uint64_t v8;
  NSString *presentingAppBundleID;
  uint64_t v10;
  NSString *nowPlayingAppBundleID;
  uint64_t v12;
  NSArray *visibleMediaApps;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  float v18;
  uint64_t v19;
  NSString *routeUID;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableArray *customRows;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MRMediaControlsConfiguration;
  v5 = -[MRMediaControlsConfiguration init](&v26, sel_init);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v5->_initiatorStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initiatorStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routingContextUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    routingContextUID = v5->_routingContextUID;
    v5->_routingContextUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingAppBundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    presentingAppBundleID = v5->_presentingAppBundleID;
    v5->_presentingAppBundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nowPlayingAppBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    nowPlayingAppBundleID = v5->_nowPlayingAppBundleID;
    v5->_nowPlayingAppBundleID = (NSString *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("visibleMediaApps"));
    v12 = objc_claimAutoreleasedReturnValue();
    visibleMediaApps = v5->_visibleMediaApps;
    v5->_visibleMediaApps = (NSArray *)v12;

    v5->_allowsNowPlayingApplicationLaunch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNowPlayingApplicationLaunch"));
    v5->_sortByIsVideoRoute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sortByIsVideoRoute"));
    objc_msgSend(v4, "mr_decodeCGRectForKey:", CFSTR("sourceRect"));
    v5->_sourceRect.origin.x = v14;
    v5->_sourceRect.origin.y = v15;
    v5->_sourceRect.size.width = v16;
    v5->_sourceRect.size.height = v17;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("preferredWidth"));
    v5->_preferredWidth = v18;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routeUID"));
    v19 = objc_claimAutoreleasedReturnValue();
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v19;

    v21 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("customRows"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayWithArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    customRows = v5->_customRows;
    v5->_customRows = (NSMutableArray *)v23;

    v5->_presentingAppProcessIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("presentingAppProcessIdentifier"));
    v5->_useGenericDevicesIconInHeader = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useGenericDevicesIconInHeader"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  double preferredWidth;
  id v6;

  style = self->_style;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", style, CFSTR("style"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_initiatorStyle, CFSTR("initiatorStyle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_routingContextUID, CFSTR("routingContextUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_presentingAppBundleID, CFSTR("presentingAppBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nowPlayingAppBundleID, CFSTR("nowPlayingAppBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_visibleMediaApps, CFSTR("visibleMediaApps"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_allowsNowPlayingApplicationLaunch, CFSTR("allowsNowPlayingApplicationLaunch"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_sortByIsVideoRoute, CFSTR("sortByIsVideoRoute"));
  objc_msgSend(v6, "mr_encodeCGRect:forKey:", CFSTR("sourceRect"), self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  preferredWidth = self->_preferredWidth;
  *(float *)&preferredWidth = preferredWidth;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("preferredWidth"), preferredWidth);
  objc_msgSend(v6, "encodeObject:forKey:", self->_routeUID, CFSTR("routeUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_customRows, CFSTR("customRows"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_presentingAppProcessIdentifier, CFSTR("presentingAppProcessIdentifier"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_useGenericDevicesIconInHeader, CFSTR("useGenericDevicesIconInHeader"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MRMediaControlsConfiguration *v4;
  CGPoint origin;

  v4 = objc_alloc_init(MRMediaControlsConfiguration);
  v4->_style = self->_style;
  v4->_initiatorStyle = self->_initiatorStyle;
  objc_storeStrong((id *)&v4->_routingContextUID, self->_routingContextUID);
  objc_storeStrong((id *)&v4->_presentingAppBundleID, self->_presentingAppBundleID);
  objc_storeStrong((id *)&v4->_nowPlayingAppBundleID, self->_nowPlayingAppBundleID);
  objc_storeStrong((id *)&v4->_visibleMediaApps, self->_visibleMediaApps);
  v4->_allowsNowPlayingApplicationLaunch = self->_allowsNowPlayingApplicationLaunch;
  v4->_sortByIsVideoRoute = self->_sortByIsVideoRoute;
  origin = self->_sourceRect.origin;
  v4->_sourceRect.size = self->_sourceRect.size;
  v4->_sourceRect.origin = origin;
  v4->_preferredWidth = self->_preferredWidth;
  objc_storeStrong((id *)&v4->_routeUID, self->_routeUID);
  objc_storeStrong((id *)&v4->_customRows, self->_customRows);
  v4->_presentingAppProcessIdentifier = self->_presentingAppProcessIdentifier;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MRMediaControlsConfiguration *v4;
  MRMediaControlsConfiguration *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  int v36;
  double v37;
  double v38;
  double v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  int v46;
  int v47;
  CGRect v49;
  CGRect v50;

  v4 = (MRMediaControlsConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v47) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MRMediaControlsConfiguration style](v5, "style");
      v7 = -[MRMediaControlsConfiguration style](self, "style");
      v8 = -[MRMediaControlsConfiguration initiatorStyle](v5, "initiatorStyle");
      v9 = -[MRMediaControlsConfiguration initiatorStyle](self, "initiatorStyle");
      -[MRMediaControlsConfiguration routingContextUID](v5, "routingContextUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaControlsConfiguration routingContextUID](self, "routingContextUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);
      if (v6 == v7 && v8 == v9)
        v14 = v12;
      else
        v14 = 0;

      -[MRMediaControlsConfiguration presentingAppBundleID](v5, "presentingAppBundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaControlsConfiguration presentingAppBundleID](self, "presentingAppBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      -[MRMediaControlsConfiguration nowPlayingAppBundleID](v5, "nowPlayingAppBundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaControlsConfiguration nowPlayingAppBundleID](self, "nowPlayingAppBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17 & objc_msgSend(v18, "isEqualToString:", v19);

      -[MRMediaControlsConfiguration visibleMediaApps](v5, "visibleMediaApps");
      v21 = objc_claimAutoreleasedReturnValue();
      -[MRMediaControlsConfiguration visibleMediaApps](self, "visibleMediaApps");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v14 & v20 & objc_msgSend((id)v21, "isEqualToArray:", v22);

      LODWORD(v21) = -[MRMediaControlsConfiguration allowsNowPlayingApplicationLaunch](v5, "allowsNowPlayingApplicationLaunch");
      LODWORD(v22) = v21 ^ -[MRMediaControlsConfiguration allowsNowPlayingApplicationLaunch](self, "allowsNowPlayingApplicationLaunch");
      LODWORD(v21) = -[MRMediaControlsConfiguration sortByIsVideoRoute](v5, "sortByIsVideoRoute");
      LODWORD(v21) = v23 & ~(v22 | v21 ^ -[MRMediaControlsConfiguration sortByIsVideoRoute](self, "sortByIsVideoRoute"));
      -[MRMediaControlsConfiguration sourceRect](v5, "sourceRect");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[MRMediaControlsConfiguration sourceRect](self, "sourceRect");
      v50.origin.x = v32;
      v50.origin.y = v33;
      v50.size.width = v34;
      v50.size.height = v35;
      v49.origin.x = v25;
      v49.origin.y = v27;
      v49.size.width = v29;
      v49.size.height = v31;
      v36 = v21 & CGRectEqualToRect(v49, v50);
      -[MRMediaControlsConfiguration preferredWidth](v5, "preferredWidth");
      v38 = v37;
      -[MRMediaControlsConfiguration preferredWidth](self, "preferredWidth");
      if (v38 == v39)
        v40 = v36;
      else
        v40 = 0;
      -[MRMediaControlsConfiguration routeUID](v5, "routeUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaControlsConfiguration routeUID](self, "routeUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqualToString:", v42);

      -[MRMediaControlsConfiguration customRows](v5, "customRows");
      v44 = objc_claimAutoreleasedReturnValue();
      -[MRMediaControlsConfiguration customRows](self, "customRows");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v43 & objc_msgSend((id)v44, "isEqualToArray:", v45);

      LODWORD(v44) = -[MRMediaControlsConfiguration useGenericDevicesIconInHeader](v5, "useGenericDevicesIconInHeader");
      v47 = v40 & v46 & (v44 ^ -[MRMediaControlsConfiguration useGenericDevicesIconInHeader](self, "useGenericDevicesIconInHeader") ^ 1);
    }
    else
    {
      LOBYTE(v47) = 0;
    }
  }

  return v47;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  self->_initiatorStyle = a3;
}

- (NSMutableArray)customRows
{
  return self->_customRows;
}

- (void)setCustomRows:(id)a3
{
  objc_storeStrong((id *)&self->_customRows, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)initiatorStyle
{
  return self->_initiatorStyle;
}

- (void)setInitiatorStyle:(int64_t)a3
{
  self->_initiatorStyle = a3;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)setRoutingContextUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setPresentingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)presentingAppProcessIdentifier
{
  return self->_presentingAppProcessIdentifier;
}

- (void)setPresentingAppProcessIdentifier:(int)a3
{
  self->_presentingAppProcessIdentifier = a3;
}

- (BOOL)shouldPreventAutorotation
{
  return self->_shouldPreventAutorotation;
}

- (void)setShouldPreventAutorotation:(BOOL)a3
{
  self->_shouldPreventAutorotation = a3;
}

- (BOOL)allowsNowPlayingApplicationLaunch
{
  return self->_allowsNowPlayingApplicationLaunch;
}

- (void)setAllowsNowPlayingApplicationLaunch:(BOOL)a3
{
  self->_allowsNowPlayingApplicationLaunch = a3;
}

- (BOOL)sortByIsVideoRoute
{
  return self->_sortByIsVideoRoute;
}

- (void)setSortByIsVideoRoute:(BOOL)a3
{
  self->_sortByIsVideoRoute = a3;
}

- (BOOL)useGenericDevicesIconInHeader
{
  return self->_useGenericDevicesIconInHeader;
}

- (void)setUseGenericDevicesIconInHeader:(BOOL)a3
{
  self->_useGenericDevicesIconInHeader = a3;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_customRows, 0);
}

@end
