@implementation AXTapticSoundTestingContainer

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXTapticSoundTestingContainer sound](self, "sound");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTapticSoundTestingContainer delay](self, "delay");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [delay: %f]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
}

@end
