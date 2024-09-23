@implementation NTKCompanionWidgetComplicationRecord

- (CLKComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void)setComplicationDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_complicationDescriptor, a3);
}

- (CLKWidgetComplicationDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (void)setWidgetDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_widgetDescriptor, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSArray)supportedClockKitFamilies
{
  return self->_supportedClockKitFamilies;
}

- (void)setSupportedClockKitFamilies:(id)a3
{
  objc_storeStrong((id *)&self->_supportedClockKitFamilies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedClockKitFamilies, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
}

@end
