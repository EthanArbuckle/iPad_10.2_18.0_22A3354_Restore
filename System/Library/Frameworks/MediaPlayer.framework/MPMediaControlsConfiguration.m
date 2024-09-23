@implementation MPMediaControlsConfiguration

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

  v3 = -[MPMediaControlsConfiguration style](self, "style");
  if (v3 > 8)
    v4 = 0;
  else
    v4 = off_1E3152ED0[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[MPMediaControlsConfiguration routingContextUID](self, "routingContextUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  presentingAppBundleID = self->_presentingAppBundleID;
  NSStringFromCGRect(self->_sourceRect);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p routingContextUID=%@, style=%@, presentingAppBundleID=%@, sourcRect=%@, preferredWidth=%f>"), v6, self, v7, v4, presentingAppBundleID, v9, *(_QWORD *)&self->_preferredWidth);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MPMediaControlsConfiguration)initWithCoder:(id)a3
{
  id v4;
  MPMediaControlsConfiguration *v5;
  uint64_t v6;
  NSString *routingContextUID;
  uint64_t v8;
  NSString *presentingAppBundleID;
  uint64_t v10;
  NSString *nowPlayingAppBundleID;
  uint64_t v12;
  NSString *donatingAppBundleID;
  uint64_t v14;
  NSArray *visibleMediaApps;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  float v20;
  uint64_t v21;
  NSString *routeUID;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *customRows;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MPMediaControlsConfiguration;
  v5 = -[MPMediaControlsConfiguration init](&v28, sel_init);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v5->_initatorStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initiatorStyle"));
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("donatingAppBundleID"));
    v12 = objc_claimAutoreleasedReturnValue();
    donatingAppBundleID = v5->_donatingAppBundleID;
    v5->_donatingAppBundleID = (NSString *)v12;

    v5->_donatingAppEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("donatingAppEligible"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("visibleMediaApps"));
    v14 = objc_claimAutoreleasedReturnValue();
    visibleMediaApps = v5->_visibleMediaApps;
    v5->_visibleMediaApps = (NSArray *)v14;

    v5->_allowsNowPlayingApplicationLaunch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNowPlayingApplicationLaunch"));
    v5->_sortByIsVideoRoute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sortByIsVideoRoute"));
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("sourceRect"));
    v5->_sourceRect.origin.x = v16;
    v5->_sourceRect.origin.y = v17;
    v5->_sourceRect.size.width = v18;
    v5->_sourceRect.size.height = v19;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("preferredWidth"));
    v5->_preferredWidth = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routeUID"));
    v21 = objc_claimAutoreleasedReturnValue();
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v21;

    v23 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("customRows"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "arrayWithArray:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    customRows = v5->_customRows;
    v5->_customRows = (NSMutableArray *)v25;

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
  objc_msgSend(v6, "encodeInteger:forKey:", self->_initatorStyle, CFSTR("initiatorStyle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_routingContextUID, CFSTR("routingContextUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_presentingAppBundleID, CFSTR("presentingAppBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nowPlayingAppBundleID, CFSTR("nowPlayingAppBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_donatingAppBundleID, CFSTR("donatingAppBundleID"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_donatingAppEligible, CFSTR("donatingAppEligible"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_visibleMediaApps, CFSTR("visibleMediaApps"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_allowsNowPlayingApplicationLaunch, CFSTR("allowsNowPlayingApplicationLaunch"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_sortByIsVideoRoute, CFSTR("sortByIsVideoRoute"));
  objc_msgSend(v6, "encodeCGRect:forKey:", CFSTR("sourceRect"), self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
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
  MPMediaControlsConfiguration *v4;
  CGPoint origin;

  v4 = objc_alloc_init(MPMediaControlsConfiguration);
  v4->_style = self->_style;
  v4->_initatorStyle = self->_initatorStyle;
  objc_storeStrong((id *)&v4->_routingContextUID, self->_routingContextUID);
  objc_storeStrong((id *)&v4->_presentingAppBundleID, self->_presentingAppBundleID);
  objc_storeStrong((id *)&v4->_nowPlayingAppBundleID, self->_nowPlayingAppBundleID);
  objc_storeStrong((id *)&v4->_donatingAppBundleID, self->_donatingAppBundleID);
  v4->_donatingAppEligible = self->_donatingAppEligible;
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
  MPMediaControlsConfiguration *v4;
  MPMediaControlsConfiguration *v5;
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
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  int v40;
  double v41;
  double v42;
  double v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  int v50;
  int v51;
  CGRect v53;
  CGRect v54;

  v4 = (MPMediaControlsConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v51) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MPMediaControlsConfiguration style](v5, "style");
      v7 = -[MPMediaControlsConfiguration style](self, "style");
      v8 = -[MPMediaControlsConfiguration initatorStyle](v5, "initatorStyle");
      v9 = -[MPMediaControlsConfiguration initatorStyle](self, "initatorStyle");
      -[MPMediaControlsConfiguration routingContextUID](v5, "routingContextUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaControlsConfiguration routingContextUID](self, "routingContextUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);
      if (v6 == v7 && v8 == v9)
        v14 = v12;
      else
        v14 = 0;

      -[MPMediaControlsConfiguration presentingAppBundleID](v5, "presentingAppBundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaControlsConfiguration presentingAppBundleID](self, "presentingAppBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      -[MPMediaControlsConfiguration nowPlayingAppBundleID](v5, "nowPlayingAppBundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaControlsConfiguration nowPlayingAppBundleID](self, "nowPlayingAppBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17 & objc_msgSend(v18, "isEqualToString:", v19);

      -[MPMediaControlsConfiguration donatingAppBundleID](v5, "donatingAppBundleID");
      v21 = objc_claimAutoreleasedReturnValue();
      -[MPMediaControlsConfiguration donatingAppBundleID](self, "donatingAppBundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14 & v20 & objc_msgSend((id)v21, "isEqualToString:", v22);

      LODWORD(v21) = -[MPMediaControlsConfiguration isDonatingAppEligible](v5, "isDonatingAppEligible");
      v24 = v23 & ~(v21 ^ -[MPMediaControlsConfiguration isDonatingAppEligible](self, "isDonatingAppEligible"));
      -[MPMediaControlsConfiguration visibleMediaApps](v5, "visibleMediaApps");
      v25 = objc_claimAutoreleasedReturnValue();
      -[MPMediaControlsConfiguration visibleMediaApps](self, "visibleMediaApps");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v24 & objc_msgSend((id)v25, "isEqualToArray:", v26);

      LODWORD(v25) = -[MPMediaControlsConfiguration allowsNowPlayingApplicationLaunch](v5, "allowsNowPlayingApplicationLaunch");
      LODWORD(v26) = v25 ^ -[MPMediaControlsConfiguration allowsNowPlayingApplicationLaunch](self, "allowsNowPlayingApplicationLaunch");
      LODWORD(v25) = -[MPMediaControlsConfiguration sortByIsVideoRoute](v5, "sortByIsVideoRoute");
      LODWORD(v25) = v27 & ~(v26 | v25 ^ -[MPMediaControlsConfiguration sortByIsVideoRoute](self, "sortByIsVideoRoute"));
      -[MPMediaControlsConfiguration sourceRect](v5, "sourceRect");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      -[MPMediaControlsConfiguration sourceRect](self, "sourceRect");
      v54.origin.x = v36;
      v54.origin.y = v37;
      v54.size.width = v38;
      v54.size.height = v39;
      v53.origin.x = v29;
      v53.origin.y = v31;
      v53.size.width = v33;
      v53.size.height = v35;
      v40 = v25 & CGRectEqualToRect(v53, v54);
      -[MPMediaControlsConfiguration preferredWidth](v5, "preferredWidth");
      v42 = v41;
      -[MPMediaControlsConfiguration preferredWidth](self, "preferredWidth");
      if (v42 == v43)
        v44 = v40;
      else
        v44 = 0;
      -[MPMediaControlsConfiguration routeUID](v5, "routeUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaControlsConfiguration routeUID](self, "routeUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "isEqualToString:", v46);

      -[MPMediaControlsConfiguration customRows](v5, "customRows");
      v48 = objc_claimAutoreleasedReturnValue();
      -[MPMediaControlsConfiguration customRows](self, "customRows");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v47 & objc_msgSend((id)v48, "isEqualToArray:", v49);

      LODWORD(v48) = -[MPMediaControlsConfiguration useGenericDevicesIconInHeader](v5, "useGenericDevicesIconInHeader");
      v51 = v44 & v50 & (v48 ^ -[MPMediaControlsConfiguration useGenericDevicesIconInHeader](self, "useGenericDevicesIconInHeader") ^ 1);
    }
    else
    {
      LOBYTE(v51) = 0;
    }
  }

  return v51;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  self->_initatorStyle = a3;
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

- (int64_t)initatorStyle
{
  return self->_initatorStyle;
}

- (void)setInitatorStyle:(int64_t)a3
{
  self->_initatorStyle = a3;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)setRoutingContextUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (void)setPresentingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)donatingAppBundleID
{
  return self->_donatingAppBundleID;
}

- (void)setDonatingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isDonatingAppEligible
{
  return self->_donatingAppEligible;
}

- (void)setDonatingAppEligible:(BOOL)a3
{
  self->_donatingAppEligible = a3;
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_donatingAppBundleID, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_customRows, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
