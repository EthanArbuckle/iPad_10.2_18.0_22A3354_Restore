@implementation MPAVRoutingTableViewCellSubtitleTextState

- (BOOL)hasVisibleTextTypeToShow
{
  unint64_t v3;
  void *v4;

  v3 = -1;
  while (v3 != 3)
  {
    -[MPAVRoutingTableViewCellSubtitleTextState _stringForVisibleTextType:](self, "_stringForVisibleTextType:", ++v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return v3 < 4;
  }
  v3 = 4;
  return v3 < 4;
}

- (BOOL)hasVisibleTextTypeToTransitionTo
{
  return -[MPAVRoutingTableViewCellSubtitleTextState _nextAvailableVisibleTextType](self, "_nextAvailableVisibleTextType") != self->_currentVisibleTextType;
}

- (void)transitionToNextAvailableVisibleTextType
{
  self->_currentVisibleTextType = -[MPAVRoutingTableViewCellSubtitleTextState _nextAvailableVisibleTextType](self, "_nextAvailableVisibleTextType");
}

- (NSString)stringForCurrentVisibleTextType
{
  void *v2;
  void *v3;

  -[MPAVRoutingTableViewCellSubtitleTextState _stringForVisibleTextType:](self, "_stringForVisibleTextType:", self->_currentVisibleTextType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (id)_stringForVisibleTextType:(unint64_t)a3
{
  id v3;
  void *v4;
  id v5;

  if (a3 - 1 > 2)
    v3 = 0;
  else
    v3 = *((id *)&self->_routeUID + a3);
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (unint64_t)_nextAvailableVisibleTextType
{
  unint64_t currentVisibleTextType;
  unint64_t v4;
  char v5;
  void *v6;

  currentVisibleTextType = self->_currentVisibleTextType;
  LOBYTE(v4) = currentVisibleTextType;
  while (1)
  {
    v5 = v4 + 1;
    v4 = ((_BYTE)v4 + 1) & 3;
    if (v4 == currentVisibleTextType)
      break;
    -[MPAVRoutingTableViewCellSubtitleTextState _stringForVisibleTextType:](self, "_stringForVisibleTextType:", v5 & 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return v4;
  }
  return currentVisibleTextType;
}

- (void)resetForNewRoute
{
  self->_currentVisibleTextType = 0;
  -[MPAVRoutingTableViewCellSubtitleTextState transitionToNextAvailableVisibleTextType](self, "transitionToNextAvailableVisibleTextType");
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)batteryText
{
  return self->_batteryText;
}

- (void)setBatteryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)pairedDeviceText
{
  return self->_pairedDeviceText;
}

- (void)setPairedDeviceText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (unint64_t)currentVisibleTextType
{
  return self->_currentVisibleTextType;
}

- (void)setCurrentVisibleTextType:(unint64_t)a3
{
  self->_currentVisibleTextType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_pairedDeviceText, 0);
  objc_storeStrong((id *)&self->_batteryText, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
}

@end
