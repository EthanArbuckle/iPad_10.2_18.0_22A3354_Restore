@implementation HMDMutableNaturalLightingCurve

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNaturalLightingCurve *v4;
  unint64_t v5;
  void *v6;
  HMDNaturalLightingCurve *v7;

  v4 = +[HMDNaturalLightingCurve allocWithZone:](HMDNaturalLightingCurve, "allocWithZone:", a3);
  v5 = -[HMDNaturalLightingCurve version](self, "version");
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:](v4, "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:", v5, v6, -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"), -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"), -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"), -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"));

  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](v7, "setColorTemperatureUpdateIntervalInMilliseconds:", -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds"));
  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](v7, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](v7, "setColorTemperatureNotifyValueChangeThreshold:", -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold"));
  return v7;
}

@end
