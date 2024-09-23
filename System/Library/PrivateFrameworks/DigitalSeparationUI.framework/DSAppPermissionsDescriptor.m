@implementation DSAppPermissionsDescriptor

void __78__DSAppPermissionsDescriptor_DigitalSeparationUI__iconAppBundleForPermission___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("com.apple.camera"), *MEMORY[0x24BEB3848], CFSTR("com.apple.mobileslideshow"), *MEMORY[0x24BEB38D8], CFSTR("com.apple.Music"), *MEMORY[0x24BEB38B8], CFSTR("com.apple.Home"), *MEMORY[0x24BEB3998], CFSTR("com.apple.mobilecal"), *MEMORY[0x24BEB3840], CFSTR("com.apple.reminders"), *MEMORY[0x24BEB38E8], CFSTR("com.apple.MobileAddressBook"), CFSTR("DSContacts"), CFSTR("com.apple.Health"), CFSTR("DSHealth"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iconAppBundleForPermission__icons;
  iconAppBundleForPermission__icons = v0;

}

void __78__DSAppPermissionsDescriptor_DigitalSeparationUI__iconAssetNameForPermission___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("camera"), *MEMORY[0x24BEB3848], CFSTR("photos"), *MEMORY[0x24BEB38D8], CFSTR("music"), *MEMORY[0x24BEB38B8], CFSTR("home"), *MEMORY[0x24BEB3998], CFSTR("calendar"), *MEMORY[0x24BEB3840], CFSTR("reminders"), *MEMORY[0x24BEB38E8], CFSTR("contacts"), CFSTR("DSContacts"), CFSTR("health"), CFSTR("DSHealth"), CFSTR("location"),
    CFSTR("DSLocationAlways"),
    CFSTR("bluetooth"),
    *MEMORY[0x24BEB3838],
    CFSTR("location"),
    CFSTR("DSLocationWhenInUse"),
    CFSTR("microphone"),
    *MEMORY[0x24BEB38C0],
    CFSTR("localNetwork"),
    CFSTR("DSLocalNetwork"),
    CFSTR("nearbyInteraction"),
    *MEMORY[0x24BEB38D0],
    CFSTR("sensorKit"),
    *MEMORY[0x24BEB3910],
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iconAssetNameForPermission__icons;
  iconAssetNameForPermission__icons = v0;

}

void __74__DSAppPermissionsDescriptor_DigitalSeparationUI__stringKeyForPermission___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("DSLocationAlways"), CFSTR("BLUETOOTH"), *MEMORY[0x24BEB3838], CFSTR("LOCATION"), CFSTR("DSLocationWhenInUse"), CFSTR("MICROPHONE"), *MEMORY[0x24BEB38C0], CFSTR("CAMERA"), *MEMORY[0x24BEB3848], CFSTR("PHOTOS"), *MEMORY[0x24BEB38D8], CFSTR("MEDIA"), *MEMORY[0x24BEB38B8], CFSTR("HOME"), *MEMORY[0x24BEB3998], CFSTR("CALENDAR"), *MEMORY[0x24BEB3840],
    CFSTR("REMINDERS"),
    *MEMORY[0x24BEB38E8],
    CFSTR("CONTACTS"),
    CFSTR("DSContacts"),
    CFSTR("HEALTH"),
    CFSTR("DSHealth"),
    CFSTR("LOCALNETWORK"),
    CFSTR("DSLocalNetwork"),
    CFSTR("NEARBYINTERACTION"),
    *MEMORY[0x24BEB38D0],
    CFSTR("SENSORKIT"),
    *MEMORY[0x24BEB3910],
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringKeyForPermission__icons;
  stringKeyForPermission__icons = v0;

}

@end
