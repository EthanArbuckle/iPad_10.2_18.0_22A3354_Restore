@implementation MUPlaceInfoSectionControllerConfiguration

- (GEOPlaceDetailsModuleConfiguration)moduleConfiguration
{
  return self->_moduleConfiguration;
}

- (void)setModuleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_moduleConfiguration, a3);
}

- (MUPlaceDataAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_availability, a3);
}

- (MKPlaceActionManagerProtocol)actionDelegate
{
  return (MKPlaceActionManagerProtocol *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (MUPlaceHoursSectionViewConfiguration)hoursConfiguration
{
  return self->_hoursConfiguration;
}

- (void)setHoursConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_hoursConfiguration, a3);
}

- (BOOL)isDeveloperPlaceCard
{
  return self->_developerPlaceCard;
}

- (void)setDeveloperPlaceCard:(BOOL)a3
{
  self->_developerPlaceCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursConfiguration, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_moduleConfiguration, 0);
}

@end
