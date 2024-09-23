@implementation ULDisplayMonitorEventDisplayState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInFocus, 0);
}

- (NSString)appInFocus
{
  return self->_appInFocus;
}

- (void)setAppInFocus:(id)a3
{
  objc_storeStrong((id *)&self->_appInFocus, a3);
}

- (BOOL)appInFocusChanged
{
  return self->_appInFocusChanged;
}

- (void)setAppInFocusChanged:(BOOL)a3
{
  self->_appInFocusChanged = a3;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (BOOL)displayOnChanged
{
  return self->_displayOnChanged;
}

- (void)setDisplayOnChanged:(BOOL)a3
{
  self->_displayOnChanged = a3;
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (BOOL)screenLockedChanged
{
  return self->_screenLockedChanged;
}

- (void)setScreenLockedChanged:(BOOL)a3
{
  self->_screenLockedChanged = a3;
}

@end
