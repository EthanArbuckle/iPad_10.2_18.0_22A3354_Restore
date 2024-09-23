@implementation AVAudioDeviceTestSequenceTone

- (AVAudioDeviceTestSequenceTone)init
{
  AVAudioDeviceTestSequenceTone *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAudioDeviceTestSequenceTone;
  result = -[AVAudioDeviceTestSequence init](&v3, sel_init);
  if (result)
  {
    result->_frequency = 0.0;
    result->_amplitude = 0.0;
    result->_soundLevel = 0.0;
    result->_numberOfPulses = 0;
    result->_pulseDuration = 200.0;
    result->_pauseDuration = 200.0;
    result->_rampDuration = 35.0;
    result->_startDelay = 150.0;
    result->_duration = 0.0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioDeviceTestSequenceTone;
  v4 = a3;
  -[AVAudioDeviceTestSequence encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("frequency"), self->_frequency, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("amplitude"), self->_amplitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("soundLevel"), self->_soundLevel);
  objc_msgSend(v4, "encodeInt:forKey:", self->_numberOfPulses, CFSTR("numberOfPulses"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pulseDuration"), self->_pulseDuration);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pauseDuration"), self->_pauseDuration);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rampDuration"), self->_rampDuration);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("startDelay"), self->_startDelay);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);

}

- (AVAudioDeviceTestSequenceTone)initWithCoder:(id)a3
{
  id v4;
  AVAudioDeviceTestSequenceTone *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVAudioDeviceTestSequenceTone;
  v5 = -[AVAudioDeviceTestSequence initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frequency"));
    v5->_frequency = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("amplitude"));
    v5->_amplitude = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("soundLevel"));
    v5->_soundLevel = v8;
    v5->_numberOfPulses = objc_msgSend(v4, "decodeIntForKey:", CFSTR("numberOfPulses"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pulseDuration"));
    v5->_pulseDuration = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pauseDuration"));
    v5->_pauseDuration = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rampDuration"));
    v5->_rampDuration = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startDelay"));
    v5->_startDelay = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v13;
  }

  return v5;
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (double)soundLevel
{
  return self->_soundLevel;
}

- (void)setSoundLevel:(double)a3
{
  self->_soundLevel = a3;
}

- (int)numberOfPulses
{
  return self->_numberOfPulses;
}

- (void)setNumberOfPulses:(int)a3
{
  self->_numberOfPulses = a3;
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
}

- (double)pauseDuration
{
  return self->_pauseDuration;
}

- (void)setPauseDuration:(double)a3
{
  self->_pauseDuration = a3;
}

- (double)rampDuration
{
  return self->_rampDuration;
}

- (void)setRampDuration:(double)a3
{
  self->_rampDuration = a3;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setStartDelay:(double)a3
{
  self->_startDelay = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
