@implementation CAFRegistrations

+ (id)registrationDictionaryForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.caraccessoryd")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("caraccessoryd")))
  {
    objc_msgSend(a1, "caraccessoryd");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_52:
    v6 = (void *)v7;
    goto LABEL_53;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarClimate")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Climate")))
  {
    objc_msgSend(a1, "climate");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarRadio")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Media")))
  {
    objc_msgSend(a1, "media");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.AutoSettings")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("AutoSettings")))
  {
    objc_msgSend(a1, "autoSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarTrip")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Trip")))
  {
    objc_msgSend(a1, "trip");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarTirePressure")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("TirePressure")))
  {
    objc_msgSend(a1, "tirePressure");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarClosures")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Closures")))
  {
    objc_msgSend(a1, "closures");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarCharge")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Charge")))
  {
    objc_msgSend(a1, "charge");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarVitals")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Vitals")))
  {
    objc_msgSend(a1, "vitals");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarPlayApp")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("CarPlayApp")))
  {
    objc_msgSend(a1, "carPlayApp");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarCamera")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("CarCamera")))
  {
    objc_msgSend(a1, "carCamera");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CarPlaySettings")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Settings")))
  {
    objc_msgSend(a1, "settings");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("Testing")))
  {
    objc_msgSend(a1, "testing");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SiriAudioApp")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("CarInspector")))
  {
    objc_msgSend(a1, "carInspector");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("CAFTool")))
  {
    objc_msgSend(a1, "cafTool");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.AssistantServices")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("SiriCommands")))
  {
    objc_msgSend(a1, "siriCommands");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.siriknowledged")) & 1) != 0
    || !objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("SiriDonations")))
  {
    objc_msgSend(a1, "siriDonations");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("MTBF")))
  {
    objc_msgSend(a1, "MTBF");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("FastStartup")))
  {
    objc_msgSend(a1, "fastStartup");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("NoLargePayload")))
  {
    objc_msgSend(a1, "noLargePayload");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("iOSOnly")))
  {
    objc_msgSend(a1, "iOSOnly");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  CAFRegistrationLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[CAFRegistrations registrationDictionaryForIdentifier:].cold.1((uint64_t)v4, v5);

  v6 = &unk_250958A70;
LABEL_53:

  return v6;
}

+ (NSDictionary)fastStartup
{
  return (NSDictionary *)&unk_250959038;
}

+ (NSDictionary)noLargePayload
{
  return (NSDictionary *)&unk_250959EC0;
}

+ (NSDictionary)iOSOnly
{
  return (NSDictionary *)&unk_25095A9B0;
}

+ (NSDictionary)caraccessoryd
{
  return (NSDictionary *)&unk_25095AAC8;
}

+ (NSDictionary)climate
{
  return (NSDictionary *)&unk_25095AE10;
}

+ (NSDictionary)media
{
  return (NSDictionary *)&unk_25095B018;
}

+ (NSDictionary)autoSettings
{
  return (NSDictionary *)&unk_25095B3B0;
}

+ (NSDictionary)trip
{
  return (NSDictionary *)&unk_25095B4C8;
}

+ (NSDictionary)tirePressure
{
  return (NSDictionary *)&unk_25095B568;
}

+ (NSDictionary)closures
{
  return (NSDictionary *)&unk_25095B630;
}

+ (NSDictionary)charge
{
  return (NSDictionary *)&unk_25095B770;
}

+ (NSDictionary)vitals
{
  return (NSDictionary *)&unk_25095B798;
}

+ (NSDictionary)carPlayApp
{
  return (NSDictionary *)&unk_25095BA68;
}

+ (NSDictionary)carCamera
{
  return (NSDictionary *)&unk_25095BB08;
}

+ (NSDictionary)settings
{
  return (NSDictionary *)&unk_25095BBA8;
}

+ (NSDictionary)testing
{
  return (NSDictionary *)&unk_25095BD60;
}

+ (NSDictionary)carInspector
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

+ (NSDictionary)cafTool
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

+ (NSDictionary)siriCommands
{
  return (NSDictionary *)&unk_25095C2D8;
}

+ (NSDictionary)siriDonations
{
  return (NSDictionary *)&unk_25095C350;
}

+ (NSDictionary)MTBF
{
  return (NSDictionary *)&unk_25095C878;
}

+ (void)registrationDictionaryForIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237717000, a2, OS_LOG_TYPE_ERROR, "Unknown registration identifier %@", (uint8_t *)&v2, 0xCu);
}

@end
