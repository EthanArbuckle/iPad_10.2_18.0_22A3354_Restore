@implementation WKSyntheticFlagsChangedWebEvent

- (WKSyntheticFlagsChangedWebEvent)initWithKeyCode:(unsigned __int16)a3 modifiers:(unsigned int)a4 keyDown:(BOOL)a5
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  double v9;
  int v11;
  objc_super v12;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  if (a5)
    v8 = 4;
  else
    v8 = 5;
  v9 = (double)(unint64_t)GSCurrentEventTimestamp();
  v12.receiver = self;
  v12.super_class = (Class)WKSyntheticFlagsChangedWebEvent;
  BYTE2(v11) = v6 == 43;
  LOWORD(v11) = v6;
  return -[WebEvent initWithKeyEventType:timeStamp:characters:charactersIgnoringModifiers:modifiers:isRepeating:withFlags:withInputManagerHint:keyCode:isTabKey:](&v12, sel_initWithKeyEventType_timeStamp_characters_charactersIgnoringModifiers_modifiers_isRepeating_withFlags_withInputManagerHint_keyCode_isTabKey_, v8, &stru_1E351F1B8, &stru_1E351F1B8, v5, 0, 32, v9, 0, v11);
}

- (WKSyntheticFlagsChangedWebEvent)initWithCapsLockState:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  return -[WKSyntheticFlagsChangedWebEvent initWithKeyCode:modifiers:keyDown:](self, "initWithKeyCode:modifiers:keyDown:", 57, v3, a3);
}

- (WKSyntheticFlagsChangedWebEvent)initWithShiftState:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  return -[WKSyntheticFlagsChangedWebEvent initWithKeyCode:modifiers:keyDown:](self, "initWithKeyCode:modifiers:keyDown:", 225, v3, a3);
}

@end
