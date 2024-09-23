@implementation MUPlaceHeaderSectionControllerConfiguration

- (BOOL)suppressContainmentPunchout
{
  return self->_suppressContainmentPunchout;
}

- (void)setSuppressContainmentPunchout:(BOOL)a3
{
  self->_suppressContainmentPunchout = a3;
}

- (BOOL)alwaysShowExpandedVerifiedBusinessHeader
{
  return self->_alwaysShowExpandedVerifiedBusinessHeader;
}

- (void)setAlwaysShowExpandedVerifiedBusinessHeader:(BOOL)a3
{
  self->_alwaysShowExpandedVerifiedBusinessHeader = a3;
}

- (BOOL)shouldInsetRoundCoverPhoto
{
  return self->_shouldInsetRoundCoverPhoto;
}

- (void)setShouldInsetRoundCoverPhoto:(BOOL)a3
{
  self->_shouldInsetRoundCoverPhoto = a3;
}

- (BOOL)showShareButton
{
  return self->_showShareButton;
}

- (void)setShowShareButton:(BOOL)a3
{
  self->_showShareButton = a3;
}

- (BOOL)isDeveloperPlaceCard
{
  return self->_isDeveloperPlaceCard;
}

- (void)setIsDeveloperPlaceCard:(BOOL)a3
{
  self->_isDeveloperPlaceCard = a3;
}

- (GEOApplicationAuditToken)developerPlaceCardAuditToken
{
  return self->_developerPlaceCardAuditToken;
}

- (void)setDeveloperPlaceCardAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_developerPlaceCardAuditToken, a3);
}

- (BOOL)drawDynamicPlacecardDebugBackground
{
  return self->_drawDynamicPlacecardDebugBackground;
}

- (void)setDrawDynamicPlacecardDebugBackground:(BOOL)a3
{
  self->_drawDynamicPlacecardDebugBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerPlaceCardAuditToken, 0);
}

@end
