@implementation ATXComplicationWidgetPersonalities

+ (id)calendarNextEventComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.CalendarWidget.CalendarNextEventComplication"));
}

+ (id)batteryComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.Batteries.BatteriesWidget"), CFSTR("com.apple.Batteries.complication"));
}

+ (id)weatherConditionsComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.conditions"));
}

+ (id)remindersComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.reminders.WidgetExtension"), CFSTR("com.apple.reminders.widget.today"));
}

+ (id)homeSummaryComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.summary.category"));
}

+ (id)homeClimateComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.climate.category"));
}

+ (id)homeClimateSingleSensorComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.climate.singleSensor"));
}

+ (id)homeSecurityComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.security.category"));
}

+ (id)homeSecuritySingleSensorComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.security.singleAccessory"));
}

+ (id)homeLightsComplicationWidgetPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9220]), "initWithExtensionBundleId:kind:", CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.lights.category"));
}

@end
