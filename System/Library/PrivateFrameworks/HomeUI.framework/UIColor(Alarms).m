@implementation UIColor(Alarms)

+ (uint64_t)hu_alarmsPrimaryColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

+ (uint64_t)hu_alarmsBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
}

+ (uint64_t)hu_alarmsPrimaryTextColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

+ (uint64_t)hu_alarmsDisabledTextColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
}

+ (uint64_t)hu_alarmsCellHighlightColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
}

+ (uint64_t)hu_alarmsCellAccessoryColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
}

+ (uint64_t)hu_alarmsSwitchTintColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
}

@end
