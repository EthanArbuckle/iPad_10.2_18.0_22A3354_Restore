@implementation MKPlaceInlineMapViewControllerConfiguration

+ (id)configurationForPlaceViewControllerOptions:(unint64_t)a3
{
  MKPlaceInlineMapViewControllerConfiguration *v4;

  v4 = objc_alloc_init(MKPlaceInlineMapViewControllerConfiguration);
  -[MKPlaceInlineMapViewControllerConfiguration setUseWindowTraitCollectionForUserInterfaceStyle:](v4, "setUseWindowTraitCollectionForUserInterfaceStyle:", (a3 >> 27) & 1);
  return v4;
}

- (BOOL)useWindowTraitCollectionForUserInterfaceStyle
{
  return self->_useWindowTraitCollectionForUserInterfaceStyle;
}

- (void)setUseWindowTraitCollectionForUserInterfaceStyle:(BOOL)a3
{
  self->_useWindowTraitCollectionForUserInterfaceStyle = a3;
}

- (BOOL)suppressLookAround
{
  return self->_suppressLookAround;
}

- (void)setSuppressLookAround:(BOOL)a3
{
  self->_suppressLookAround = a3;
}

- (BOOL)suppressSectionHeader
{
  return self->_suppressSectionHeader;
}

- (void)setSuppressSectionHeader:(BOOL)a3
{
  self->_suppressSectionHeader = a3;
}

- (BOOL)showMapAttribution
{
  return self->_showMapAttribution;
}

- (void)setShowMapAttribution:(BOOL)a3
{
  self->_showMapAttribution = a3;
}

- (GEOApplicationAuditToken)mapSnapshotAuditToken
{
  return self->_mapSnapshotAuditToken;
}

- (void)setMapSnapshotAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_mapSnapshotAuditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshotAuditToken, 0);
}

@end
