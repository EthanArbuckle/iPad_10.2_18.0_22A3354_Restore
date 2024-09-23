@implementation _MUETAConfiguration

+ (id)rerouteConfigurationETAStringForTravelTime:(double)a3
{
  _MUETAConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(_MUETAConfiguration);
  v5 = (void *)MEMORY[0x1E0CB3940];
  _MULocalizedStringFromThisBundle(CFSTR("Reroute ETA button title [Placecard]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MUETAConfiguration setEtaString:](v4, "setEtaString:", v8);

  return v4;
}

+ (id)addStopConfigurationETAStringForTravelTime:(double)a3
{
  _MUETAConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(_MUETAConfiguration);
  if (a3 == 0.0)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Add Stop [Placecard]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MUETAConfiguration setEtaString:](v4, "setEtaString:", v5);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    _MULocalizedStringFromThisBundle(CFSTR("Add Stop With Detour Time [Placecard]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)a3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MUETAConfiguration setEtaString:](v4, "setEtaString:", v8);

  }
  return v4;
}

+ (id)configurationForEtaStringFor:(unint64_t)a3 travelTime:(double)a4 hasSecondaryController:(BOOL)a5 isStackingButtons:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  const __CFString *v10;
  _MUETAConfiguration *v11;
  uint64_t v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v10 = 0;
  switch(a3)
  {
    case 1uLL:
      v10 = CFSTR("car.fill");
      break;
    case 2uLL:
      v10 = CFSTR("figure.walk");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v10 = CFSTR("tram.fill");
      break;
    case 8uLL:
      v10 = CFSTR("bicycle");
      break;
    default:
      if (a3 == 0xFFFFFFF)
        v10 = CFSTR("arrow.triangle.turn.up.right.circle.fill");
      else
        v10 = 0;
      break;
  }
  v11 = objc_alloc_init(_MUETAConfiguration);
  -[_MUETAConfiguration setSymbolName:](v11, "setSymbolName:", v10);
  if (a3 == 0xFFFFFFF || a4 == 0.0)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Directions [Placecard]"));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (a4 > 0.0)
  {
    +[MUPlaceHeaderETAFormatter etaStringFromSeconds:isRenderingInFullWidth:](MUPlaceHeaderETAFormatter, "etaStringFromSeconds:isRenderingInFullWidth:", (unint64_t)a4, !v7 | v6);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v13 = (void *)v12;
    -[_MUETAConfiguration setEtaString:](v11, "setEtaString:", v12);

  }
  return v11;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)etaString
{
  return self->_etaString;
}

- (void)setEtaString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaString, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
