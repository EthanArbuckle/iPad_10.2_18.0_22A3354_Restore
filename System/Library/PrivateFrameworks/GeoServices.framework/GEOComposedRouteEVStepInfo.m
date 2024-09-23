@implementation GEOComposedRouteEVStepInfo

- (GEOComposedRouteEVStepInfo)init
{
  GEOComposedRouteEVStepInfo *result;

  result = (GEOComposedRouteEVStepInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOComposedRouteEVStepInfo)initWithEVStateInfo:(id)a3
{
  id v4;
  GEOComposedRouteEVStepInfo *v5;
  GEOComposedRouteEVStepInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedRouteEVStepInfo;
  v5 = -[GEOComposedRouteEVStepInfo init](&v8, sel_init);
  if (v5)
  {
    v5->_remainingBatteryCharge = objc_msgSend(v4, "remainingBatteryCharge");
    v5->_remainingBatteryPercentage = objc_msgSend(v4, "remainingBatteryPercentage");
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteEVStepInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteEVStepInfo *v5;
  GEOComposedRouteEVStepInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedRouteEVStepInfo;
  v5 = -[GEOComposedRouteEVStepInfo init](&v8, sel_init);
  if (v5)
  {
    v5->_remainingBatteryCharge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_remainingBatteryCharge"));
    v5->_remainingBatteryPercentage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_remainingBatteryPercentage"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t remainingBatteryCharge;
  id v5;

  remainingBatteryCharge = self->_remainingBatteryCharge;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", remainingBatteryCharge, CFSTR("_remainingBatteryCharge"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remainingBatteryPercentage, CFSTR("_remainingBatteryPercentage"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u Wh (%u%%)"), self->_remainingBatteryCharge, self->_remainingBatteryPercentage);
}

- (unsigned)remainingBatteryCharge
{
  return self->_remainingBatteryCharge;
}

- (unsigned)remainingBatteryPercentage
{
  return self->_remainingBatteryPercentage;
}

@end
