@implementation AXWeatherUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  return (id)sharedInstance__shared;
}

void __36__AXWeatherUtilities_sharedInstance__block_invoke()
{
  AXWeatherUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(AXWeatherUtilities);
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;

}

- (id)descriptionForWeatherConditionImageName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("-?(centered|day|night|mostly|partly|severe)-?+"), 1, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "localizedDescription");
      v12 = CFSTR("Weather image extract regex failed with error: %@");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = 1;
      _AXLogWithFacility();

    }
    objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length", v11, v12, v13), &stru_1E76AC698);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[AXWeatherUtilities descriptionForWeatherWFConditionCode:](self, "descriptionForWeatherWFConditionCode:", -[AXWeatherUtilities _weatherCodeForGenericIconName:](self, "_weatherCodeForGenericIconName:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)descriptionForPrecipitation:(id)a3 weatherConditionCode:(unint64_t)a4
{
  id v5;
  char v6;
  float v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = (a4 > 0x2E) | (0x23E7FFE03E3EuLL >> a4);
  objc_msgSend(v5, "floatValue");
  if (v7 >= 0.0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    if ((v6 & 1) != 0)
      v11 = CFSTR("precipitation.rain");
    else
      v11 = CFSTR("precipitation.snow");
    AXUILocalizedStringForKey(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    AXFormatFloatWithPercentage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((a4 > 0x2E) | (0x23E7FFE03E3EuLL >> a4) & 1)
      v8 = CFSTR("now.precipitation.rain");
    else
      v8 = CFSTR("now.precipitation.snow");
    AXUILocalizedStringForKey(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (unint64_t)_weatherCodeForGenericIconName:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("thunderstorm")) & 1) != 0)
  {
    v4 = 5;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("flurry-snow-snow-shower")) & 1) != 0)
  {
    v4 = 6;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("drizzle")) & 1) != 0)
  {
    v4 = 10;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hail")) & 1) != 0)
  {
    v4 = 18;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rain")) & 1) != 0)
  {
    v4 = 13;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("flurry")) & 1) != 0)
  {
    v4 = 14;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("blowingsnow")) & 1) != 0)
  {
LABEL_14:
    v4 = 17;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sunny")) & 1) != 0)
    goto LABEL_16;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fog")) & 1) != 0)
  {
    v4 = 21;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("breezy")) & 1) != 0)
  {
    v4 = 25;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ice")) & 1) != 0)
    goto LABEL_14;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cloudy")) & 1) != 0)
  {
    v4 = 27;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("clear")) & 1) != 0)
  {
LABEL_16:
    v4 = 33;
    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("suncloud")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("heavy-rain")) & 1) != 0)
  {
    v4 = 40;
  }
  else
  {
    _AXLogWithFacility();
    v4 = 0;
  }
LABEL_30:

  return v4;
}

- (id)descriptionForWeatherWFConditionCode:(unint64_t)a3
{
  void *v3;
  __CFString *v4;
  id result;

  v3 = 0;
  switch(a3)
  {
    case 0uLL:
      v4 = CFSTR("weather.condition.unavailable");
      goto LABEL_45;
    case 1uLL:
      v4 = CFSTR("weather.condition.tornado");
      goto LABEL_45;
    case 2uLL:
      v4 = CFSTR("weather.condition.tropical.storm");
      goto LABEL_45;
    case 3uLL:
      v4 = CFSTR("weather.condition.hurricane");
      goto LABEL_45;
    case 4uLL:
      v4 = CFSTR("weather.condition.severe.thunderstorm");
      goto LABEL_45;
    case 5uLL:
      v4 = CFSTR("weather.condition.thunderstorm");
      goto LABEL_45;
    case 6uLL:
      v4 = CFSTR("weather.condition.rain.and.snow");
      goto LABEL_45;
    case 7uLL:
      v4 = CFSTR("weather.condition.rain.and.sleet");
      goto LABEL_45;
    case 8uLL:
      v4 = CFSTR("weather.condition.snow.and.sleet");
      goto LABEL_45;
    case 9uLL:
      v4 = CFSTR("weather.condition.freezing.drizzle");
      goto LABEL_45;
    case 0xAuLL:
      v4 = CFSTR("weather.condition.drizzle");
      goto LABEL_45;
    case 0xBuLL:
      v4 = CFSTR("weather.condition.freezing.rain");
      goto LABEL_45;
    case 0xCuLL:
      v4 = CFSTR("weather.condition.showers");
      goto LABEL_45;
    case 0xDuLL:
      v4 = CFSTR("weather.condition.rain");
      goto LABEL_45;
    case 0xEuLL:
      v4 = CFSTR("weather.condition.snow.flurries");
      goto LABEL_45;
    case 0xFuLL:
      v4 = CFSTR("weather.condition.light.snow.showers");
      goto LABEL_45;
    case 0x10uLL:
      v4 = CFSTR("weather.condition.blowing.snow");
      goto LABEL_45;
    case 0x11uLL:
      v4 = CFSTR("weather.condition.snow");
      goto LABEL_45;
    case 0x12uLL:
      v4 = CFSTR("weather.condition.hail");
      goto LABEL_45;
    case 0x13uLL:
      v4 = CFSTR("weather.condition.sleet");
      goto LABEL_45;
    case 0x14uLL:
      v4 = CFSTR("weather.condition.dust.haze");
      goto LABEL_45;
    case 0x15uLL:
      v4 = CFSTR("weather.condition.foggy");
      goto LABEL_45;
    case 0x16uLL:
      v4 = CFSTR("weather.condition.haze");
      goto LABEL_45;
    case 0x17uLL:
      v4 = CFSTR("weather.condition.smoky");
      goto LABEL_45;
    case 0x18uLL:
      v4 = CFSTR("weather.condition.blustery");
      goto LABEL_45;
    case 0x19uLL:
      v4 = CFSTR("weather.condition.windy");
      goto LABEL_45;
    case 0x1AuLL:
      v4 = CFSTR("weather.condition.cold");
      goto LABEL_45;
    case 0x1BuLL:
      v4 = CFSTR("weather.condition.clouds");
      goto LABEL_45;
    case 0x1DuLL:
      v4 = CFSTR("weather.condition.mostly.cloudy");
      goto LABEL_45;
    case 0x1FuLL:
      v4 = CFSTR("weather.condition.partly.cloudy");
      goto LABEL_45;
    case 0x21uLL:
      v4 = CFSTR("weather.condition.clear");
      goto LABEL_45;
    case 0x23uLL:
      v4 = CFSTR("weather.condition.mostly.clear");
      goto LABEL_45;
    case 0x24uLL:
      v4 = CFSTR("weather.condition.rain.and.hail");
      goto LABEL_45;
    case 0x25uLL:
      v4 = CFSTR("weather.condition.hot");
      goto LABEL_45;
    case 0x26uLL:
      v4 = CFSTR("weather.condition.isolated.thunderstorms");
      goto LABEL_45;
    case 0x27uLL:
      v4 = CFSTR("weather.condition.scattered.thunderstorms");
      goto LABEL_45;
    case 0x28uLL:
      v4 = CFSTR("weather.condition.scattered.showers");
      goto LABEL_45;
    case 0x29uLL:
      v4 = CFSTR("weather.condition.heavy.rain");
      goto LABEL_45;
    case 0x2AuLL:
      v4 = CFSTR("weather.condition.snow.showers");
      goto LABEL_45;
    case 0x2BuLL:
      v4 = CFSTR("weather.condition.heavy.snow");
      goto LABEL_45;
    case 0x2CuLL:
      v4 = CFSTR("weather.condition.blizzard");
      goto LABEL_45;
    case 0x2DuLL:
      v4 = CFSTR("weather.condition.isolated.thundershowers");
LABEL_45:
      AXUILocalizedStringForKey(v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    case 0x2EuLL:
LABEL_46:
      result = v3;
      break;
    default:
      _AXLogWithFacility();
      result = 0;
      break;
  }
  return result;
}

@end
