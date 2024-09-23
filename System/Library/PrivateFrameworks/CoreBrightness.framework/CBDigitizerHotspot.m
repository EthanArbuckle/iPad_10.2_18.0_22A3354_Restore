@implementation CBDigitizerHotspot

- (int64_t)triggered
{
  return self->_triggered;
}

- (int)orientation
{
  return self->_orientation;
}

- (BOOL)isClearedAt:(float)a3
{
  BOOL v4;

  v4 = 0;
  if (self->_triggered == 2)
    return (float)(a3 - self->_touchReleaseTime) > self->_touchTriggerDelay;
  return v4;
}

- (CBDigitizerHotspot)init
{
  objc_super v3;
  SEL v4;
  CBDigitizerHotspot *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBDigitizerHotspot;
  v5 = -[CBDigitizerHotspot init](&v3, sel_init);
  if (v5)
  {
    v5->_touchReleaseTime = 0.0;
    v5->_touchTriggerDelay = 5.0;
  }
  return v5;
}

- (id)description
{
  float v2;
  char *v4;
  id v5;
  SEL v6;
  CBDigitizerHotspot *v7;

  v7 = self;
  v6 = a2;
  v5 = (id)MEMORY[0x1E0CB3940];
  v4 = (&kTouchStateStr)[-[CBDigitizerHotspot triggered](self, "triggered")];
  -[CBDigitizerHotspot touchReleaseTime](v7, "touchReleaseTime");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("state=%s touchReleased=%.2f"), v4, v2);
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (float)center_X
{
  return self->_center_X;
}

- (void)setCenter_X:(float)a3
{
  self->_center_X = a3;
}

- (float)center_Y
{
  return self->_center_Y;
}

- (void)setCenter_Y:(float)a3
{
  self->_center_Y = a3;
}

- (void)setTriggered:(int64_t)a3
{
  self->_triggered = a3;
}

- (float)touchTriggerDelay
{
  return self->_touchTriggerDelay;
}

- (void)setTouchTriggerDelay:(float)a3
{
  self->_touchTriggerDelay = a3;
}

- (float)touchReleaseTime
{
  return self->_touchReleaseTime;
}

- (void)setTouchReleaseTime:(float)a3
{
  self->_touchReleaseTime = a3;
}

@end
