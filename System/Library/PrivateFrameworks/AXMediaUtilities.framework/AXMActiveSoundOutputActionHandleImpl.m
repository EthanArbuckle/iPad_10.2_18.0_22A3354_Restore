@implementation AXMActiveSoundOutputActionHandleImpl

- (AXMActiveSoundOutputActionHandleImpl)init
{
  AXMActiveSoundOutputActionHandleImpl *v2;
  double v3;
  AXMActiveSoundOutputActionHandleImpl *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXMActiveSoundOutputActionHandleImpl;
  v2 = -[AXMActiveSoundOutputActionHandleImpl init](&v7, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1065353216;
    -[AXMActiveSoundOutputActionHandleImpl setRate:](v2, "setRate:", v3);
    LODWORD(v5) = 0;
    -[AXMActiveSoundOutputActionHandleImpl setPitch:](v4, "setPitch:", v5);
  }
  return v4;
}

- (void)setRate:(float)a3
{
  float v3;
  void *v4;
  double v5;
  id v6;

  if (a3 <= 0.03125)
    a3 = 0.03125;
  if (a3 >= 32.0)
    v3 = 32.0;
  else
    v3 = a3;
  self->_rate = v3;
  -[AXMActiveSoundOutputActionHandleImpl activeSound](self, "activeSound");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timePitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v3;
  objc_msgSend(v4, "setRate:", v5);

}

- (void)setPitch:(float)a3
{
  float v3;
  void *v4;
  double v5;
  id v6;

  if (a3 <= -2400.0)
    a3 = -2400.0;
  if (a3 >= 2400.0)
    v3 = 2400.0;
  else
    v3 = a3;
  self->_pitch = v3;
  -[AXMActiveSoundOutputActionHandleImpl activeSound](self, "activeSound");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timePitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v3;
  objc_msgSend(v4, "setPitch:", v5);

}

- (void)setQuantizedRate:(int64_t)a3
{
  double v3;

  if ((unint64_t)a3 <= 0xA)
  {
    LODWORD(v3) = dword_1B0F005A8[a3];
    -[AXMActiveSoundOutputActionHandleImpl setRate:](self, "setRate:", v3);
  }
}

- (void)stop
{
  void *v3;
  id v4;

  -[AXMActiveSoundOutputActionHandleImpl soundComponent](self, "soundComponent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXMActiveSoundOutputActionHandleImpl activeSound](self, "activeSound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stopActiveSound:", v3);

}

- (AXMActiveSound)activeSound
{
  return (AXMActiveSound *)objc_loadWeakRetained((id *)&self->_activeSound);
}

- (void)setActiveSound:(id)a3
{
  objc_storeWeak((id *)&self->_activeSound, a3);
}

- (AXMSoundComponent)soundComponent
{
  return (AXMSoundComponent *)objc_loadWeakRetained((id *)&self->_soundComponent);
}

- (void)setSoundComponent:(id)a3
{
  objc_storeWeak((id *)&self->_soundComponent, a3);
}

- (float)rate
{
  return self->_rate;
}

- (float)pitch
{
  return self->_pitch;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_soundComponent);
  objc_destroyWeak((id *)&self->_activeSound);
}

@end
