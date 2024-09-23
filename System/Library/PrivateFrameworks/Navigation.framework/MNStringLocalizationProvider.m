@implementation MNStringLocalizationProvider

- (MNStringLocalizationProvider)init
{
  MNStringLocalizationProvider *v2;
  uint64_t v3;
  NSLocale *locale;
  MNStringLocalizationProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNStringLocalizationProvider;
  v2 = -[MNStringLocalizationProvider init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    v5 = v2;
  }

  return v2;
}

+ (void)initLocalizationProvider
{
  if (initLocalizationProvider_onceToken != -1)
    dispatch_once(&initLocalizationProvider_onceToken, &__block_literal_global_43);
}

uint64_t __56__MNStringLocalizationProvider_initLocalizationProvider__block_invoke()
{
  MNStringLocalizationProvider *v0;
  void *v1;

  v0 = objc_alloc_init(MNStringLocalizationProvider);
  v1 = (void *)initLocalizationProvider_localizationProvider;
  initLocalizationProvider_localizationProvider = (uint64_t)v0;

  return objc_msgSend(MEMORY[0x1E0D26FD8], "setLocalizationProvider:", initLocalizationProvider_localizationProvider);
}

- (id)locale
{
  return self->_locale;
}

- (id)spokenLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentVoiceLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)aboutNDistance
{
  return _MNStringFromSpokenLocalization(CFSTR("about N distance [SPOKEN]"));
}

- (id)distanceAndAHalfKilometers
{
  return _MNStringFromSpokenLocalization(CFSTR("N and a half kilometers [SPOKEN]"));
}

- (id)aboutDistanceAndAHalfKilometers
{
  return _MNStringFromSpokenLocalization(CFSTR("N and a half kilometers [SPOKEN][APPROXIMATE]"));
}

- (id)distanceAndAHalfMiles
{
  return _MNStringFromSpokenLocalization(CFSTR("N and a half miles [SPOKEN]"));
}

- (id)aboutDistanceAndAHalfMiles
{
  return _MNStringFromSpokenLocalization(CFSTR("N and a half miles [SPOKEN][APPROXIMATE]"));
}

- (id)distanceAQuarterMile
{
  return _MNStringFromSpokenLocalization(CFSTR("a quarter mile [SPOKEN]"));
}

- (id)distanceHalfAMile
{
  return _MNStringFromSpokenLocalization(CFSTR("half a mile [SPOKEN]"));
}

- (id)distanceThreeQuartersOfAMile
{
  return _MNStringFromSpokenLocalization(CFSTR("three quarters of a mile [SPOKEN]"));
}

- (id)frequencySingleValue_OneHour
{
  return _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_component_singleHour"));
}

- (id)frequencySingleValue_OneMinute
{
  return _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_component_singleMinute"));
}

- (id)frequencyRange_BothOnlyHours
{
  return _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_description_hour_range"));
}

- (id)frequencyRange_BothOnlyMinutes
{
  return _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_description_minutes_range"));
}

- (id)frequencyRange_MixedUnits
{
  return _MNLocalizedStringFromThisBundle(CFSTR("TransitDepartureFrequency_description_mixes_range"));
}

- (id)separatorForTimestampList
{
  return _MNLocalizedStringFromThisBundle(CFSTR("timestamp list delimiter"));
}

- (id)minutesFormatForCountdownList
{
  return _MNLocalizedStringFromThisBundle(CFSTR("FormattedString_Countdownlist_Min_Format"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
