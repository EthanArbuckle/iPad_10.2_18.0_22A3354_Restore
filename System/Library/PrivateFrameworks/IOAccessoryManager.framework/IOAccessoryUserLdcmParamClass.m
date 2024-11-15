@implementation IOAccessoryUserLdcmParamClass

- (unint64_t)enableHalogenMitigationsAndUI
{
  return self->_enableHalogenMitigationsAndUI;
}

- (IOAccessoryUserLdcmParamClass)init
{
  IOAccessoryUserLdcmParamClass *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOAccessoryUserLdcmParamClass;
  result = -[IOAccessoryUserLdcmParamClass init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_userBehaviorMask = 0x300000001;
    *(_OWORD *)&result->_minVhiDurationSec = xmmword_1D13E7EA0;
    *(_OWORD *)&result->_maxUpFluctuationMv = xmmword_1D13E7EB0;
    *(_OWORD *)&result->_wetPollingIntervalSec = xmmword_1D13E7EC0;
    *(_OWORD *)&result->_ldcmArbiterRetrySec = xmmword_1D13E7ED0;
    *(_OWORD *)&result->_ldcmStartMeasurementsRetryMs = xmmword_1D13E7EE0;
    *(_OWORD *)&result->_enableHalogenSnrTtr = xmmword_1D13E7EF0;
    result->_wetTransitionCapacitanceThreshold = 3.5;
    result->_dryTransitionCapacitanceThreshold = 1.0;
  }
  return result;
}

- (unint64_t)minVhiDurationSec
{
  return self->_minVhiDurationSec;
}

- (void)setMinVhiDurationSec:(unint64_t)a3
{
  self->_minVhiDurationSec = a3;
}

- (unint64_t)maxVhiDurationSec
{
  return self->_maxVhiDurationSec;
}

- (void)setMaxVhiDurationSec:(unint64_t)a3
{
  self->_maxVhiDurationSec = a3;
}

- (unint64_t)maxUpFluctuationMv
{
  return self->_maxUpFluctuationMv;
}

- (void)setMaxUpFluctuationMv:(unint64_t)a3
{
  self->_maxUpFluctuationMv = a3;
}

- (int)userBehaviorMask
{
  return self->_userBehaviorMask;
}

- (void)setUserBehaviorMask:(int)a3
{
  self->_userBehaviorMask = a3;
}

- (int)fdpBehaviorMask
{
  return self->_fdpBehaviorMask;
}

- (void)setFdpBehaviorMask:(int)a3
{
  self->_fdpBehaviorMask = a3;
}

- (unint64_t)numEisHalogenSamples
{
  return self->_numEisHalogenSamples;
}

- (void)setNumEisHalogenSamples:(unint64_t)a3
{
  self->_numEisHalogenSamples = a3;
}

- (unint64_t)wetPollingIntervalSec
{
  return self->_wetPollingIntervalSec;
}

- (void)setWetPollingIntervalSec:(unint64_t)a3
{
  self->_wetPollingIntervalSec = a3;
}

- (unint64_t)dryPollingIntervalSec
{
  return self->_dryPollingIntervalSec;
}

- (void)setDryPollingIntervalSec:(unint64_t)a3
{
  self->_dryPollingIntervalSec = a3;
}

- (unint64_t)ldcmArbiterRetrySec
{
  return self->_ldcmArbiterRetrySec;
}

- (void)setLdcmArbiterRetrySec:(unint64_t)a3
{
  self->_ldcmArbiterRetrySec = a3;
}

- (unint64_t)ldcmStartMeasurementsDelayMs
{
  return self->_ldcmStartMeasurementsDelayMs;
}

- (void)setLdcmStartMeasurementsDelayMs:(unint64_t)a3
{
  self->_ldcmStartMeasurementsDelayMs = a3;
}

- (unint64_t)ldcmStartMeasurementsRetryMs
{
  return self->_ldcmStartMeasurementsRetryMs;
}

- (void)setLdcmStartMeasurementsRetryMs:(unint64_t)a3
{
  self->_ldcmStartMeasurementsRetryMs = a3;
}

- (unint64_t)minDryReadings
{
  return self->_minDryReadings;
}

- (void)setMinDryReadings:(unint64_t)a3
{
  self->_minDryReadings = a3;
}

- (unint64_t)enableHalogenSnrTtr
{
  return self->_enableHalogenSnrTtr;
}

- (void)setEnableHalogenSnrTtr:(unint64_t)a3
{
  self->_enableHalogenSnrTtr = a3;
}

- (void)setEnableHalogenMitigationsAndUI:(unint64_t)a3
{
  self->_enableHalogenMitigationsAndUI = a3;
}

- (double)wetTransitionCapacitanceThreshold
{
  return self->_wetTransitionCapacitanceThreshold;
}

- (void)setWetTransitionCapacitanceThreshold:(double)a3
{
  self->_wetTransitionCapacitanceThreshold = a3;
}

- (double)dryTransitionCapacitanceThreshold
{
  return self->_dryTransitionCapacitanceThreshold;
}

- (void)setDryTransitionCapacitanceThreshold:(double)a3
{
  self->_dryTransitionCapacitanceThreshold = a3;
}

@end
