@implementation AXSSKeyboardEvent

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setKeyCode:", -[AXSSKeyboardEvent keyCode](self, "keyCode"));
  -[AXSSKeyboardEvent unicodeCharacter](self, "unicodeCharacter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnicodeCharacter:", v5);

  -[AXSSKeyboardEvent backupUnicodeCharacter](self, "backupUnicodeCharacter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackupUnicodeCharacter:", v6);

  objc_msgSend(v4, "setIsDownEvent:", -[AXSSKeyboardEvent isDownEvent](self, "isDownEvent"));
  objc_msgSend(v4, "setIsRepeatEvent:", -[AXSSKeyboardEvent isRepeatEvent](self, "isRepeatEvent"));
  objc_msgSend(v4, "setIsModifierChangedEvent:", -[AXSSKeyboardEvent isModifierChangedEvent](self, "isModifierChangedEvent"));
  objc_msgSend(v4, "setIsLeftCommandDown:", -[AXSSKeyboardEvent isLeftCommandDown](self, "isLeftCommandDown"));
  objc_msgSend(v4, "setIsRightCommandDown:", -[AXSSKeyboardEvent isRightCommandDown](self, "isRightCommandDown"));
  objc_msgSend(v4, "setIsLeftOptionDown:", -[AXSSKeyboardEvent isLeftOptionDown](self, "isLeftOptionDown"));
  objc_msgSend(v4, "setIsRightOptionDown:", -[AXSSKeyboardEvent isRightOptionDown](self, "isRightOptionDown"));
  objc_msgSend(v4, "setIsLeftShiftDown:", -[AXSSKeyboardEvent isLeftShiftDown](self, "isLeftShiftDown"));
  objc_msgSend(v4, "setIsRightShiftDown:", -[AXSSKeyboardEvent isRightShiftDown](self, "isRightShiftDown"));
  objc_msgSend(v4, "setIsFnDown:", -[AXSSKeyboardEvent isFnDown](self, "isFnDown"));
  objc_msgSend(v4, "setIsCapsLockDown:", -[AXSSKeyboardEvent isCapsLockDown](self, "isCapsLockDown"));
  return v4;
}

- (BOOL)isCommandDown
{
  return -[AXSSKeyboardEvent isLeftCommandDown](self, "isLeftCommandDown")
      || -[AXSSKeyboardEvent isRightCommandDown](self, "isRightCommandDown");
}

- (BOOL)isOptionDown
{
  return -[AXSSKeyboardEvent isLeftOptionDown](self, "isLeftOptionDown")
      || -[AXSSKeyboardEvent isRightOptionDown](self, "isRightOptionDown");
}

- (BOOL)isControlDown
{
  return -[AXSSKeyboardEvent isLeftControlDown](self, "isLeftControlDown")
      || -[AXSSKeyboardEvent isRightControlDown](self, "isRightControlDown");
}

- (BOOL)isShiftDown
{
  return -[AXSSKeyboardEvent isLeftShiftDown](self, "isLeftShiftDown")
      || -[AXSSKeyboardEvent isRightShiftDown](self, "isRightShiftDown");
}

- (int64_t)modifierMask
{
  int64_t v3;

  v3 = -[AXSSKeyboardEvent isCommandDown](self, "isCommandDown");
  if (-[AXSSKeyboardEvent isOptionDown](self, "isOptionDown"))
    v3 |= 2uLL;
  if (-[AXSSKeyboardEvent isControlDown](self, "isControlDown"))
    v3 |= 4uLL;
  if (-[AXSSKeyboardEvent isShiftDown](self, "isShiftDown"))
    v3 |= 8uLL;
  if (-[AXSSKeyboardEvent isFnDown](self, "isFnDown"))
    v3 |= 0x10uLL;
  if (-[AXSSKeyboardEvent isCapsLockDown](self, "isCapsLockDown"))
    return v3 | 0x20;
  else
    return v3;
}

- (id)_keyChordForUnicodeCharacter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXSSKeyboardEvent isCommandDown](self, "isCommandDown"))
    objc_msgSend(v6, "addObject:", CFSTR("⌘"));
  if (-[AXSSKeyboardEvent isControlDown](self, "isControlDown"))
    objc_msgSend(v6, "addObject:", CFSTR("⌃"));
  if (-[AXSSKeyboardEvent isOptionDown](self, "isOptionDown"))
    objc_msgSend(v6, "addObject:", CFSTR("⌥"));
  if (-[AXSSKeyboardEvent isShiftDown](self, "isShiftDown"))
    objc_msgSend(v6, "addObject:", CFSTR("⇧"));
  if (-[AXSSKeyboardEvent isFnDown](self, "isFnDown"))
    objc_msgSend(v6, "addObject:", CFSTR("Fn"));
  if (-[AXSSKeyboardEvent isCapsLockDown](self, "isCapsLockDown"))
    objc_msgSend(v6, "addObject:", CFSTR("⇪"));
  +[AXSSKeyChord keyFromKeyCode:unicodeCharacter:](AXSSKeyChord, "keyFromKeyCode:unicodeCharacter:", -[AXSSKeyboardEvent keyCode](self, "keyCode"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "addObject:", v7);
    +[AXSSKeyChord keyChordWithKeys:](AXSSKeyChord, "keyChordWithKeys:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AXSSKeyChord)keyChord
{
  void *v3;
  void *v4;

  -[AXSSKeyboardEvent unicodeCharacter](self, "unicodeCharacter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSKeyboardEvent _keyChordForUnicodeCharacter:](self, "_keyChordForUnicodeCharacter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXSSKeyChord *)v4;
}

- (AXSSKeyChord)backupKeyChord
{
  void *v3;
  void *v4;

  -[AXSSKeyboardEvent backupUnicodeCharacter](self, "backupUnicodeCharacter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSKeyboardEvent _keyChordForUnicodeCharacter:](self, "_keyChordForUnicodeCharacter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXSSKeyChord *)v4;
}

- (id)description
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  unint64_t v21;
  void *v22;
  void *v23;
  objc_super v24;

  v23 = (void *)MEMORY[0x1E0CB3940];
  v24.receiver = self;
  v24.super_class = (Class)AXSSKeyboardEvent;
  -[AXSSKeyboardEvent description](&v24, sel_description);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[AXSSKeyboardEvent keyCode](self, "keyCode");
  v20 = -[AXSSKeyboardEvent isDownEvent](self, "isDownEvent");
  v19 = -[AXSSKeyboardEvent isRepeatEvent](self, "isRepeatEvent");
  v18 = -[AXSSKeyboardEvent isModifierChangedEvent](self, "isModifierChangedEvent");
  v17 = -[AXSSKeyboardEvent isCommandDown](self, "isCommandDown");
  v16 = -[AXSSKeyboardEvent isLeftCommandDown](self, "isLeftCommandDown");
  v15 = -[AXSSKeyboardEvent isRightCommandDown](self, "isRightCommandDown");
  v3 = -[AXSSKeyboardEvent isOptionDown](self, "isOptionDown");
  v4 = -[AXSSKeyboardEvent isLeftOptionDown](self, "isLeftOptionDown");
  v5 = -[AXSSKeyboardEvent isRightOptionDown](self, "isRightOptionDown");
  v6 = -[AXSSKeyboardEvent isControlDown](self, "isControlDown");
  v7 = -[AXSSKeyboardEvent isShiftDown](self, "isShiftDown");
  v8 = -[AXSSKeyboardEvent isLeftShiftDown](self, "isLeftShiftDown");
  v9 = -[AXSSKeyboardEvent isRightShiftDown](self, "isRightShiftDown");
  v10 = -[AXSSKeyboardEvent isFnDown](self, "isFnDown");
  v11 = -[AXSSKeyboardEvent isCapsLockDown](self, "isCapsLockDown");
  -[AXSSKeyboardEvent unicodeCharacter](self, "unicodeCharacter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: keyCode=%lu isDownEvent=%d isRepeatEvent=%d isModifierChangedEvent=%d isCommandDown=%d isLeftCommandDown=%d isRightCommandDown=%d isOptionDown=%d isLeftOptionDown=%d isRightOptionDown=%d isControlDown=%d isShiftDown=%d isLeftShiftDown=%d isRightShiftDown=%d isFnDown=%d isCapsLockDown=%d unicodeCharacter=%@"), v22, v21, v20, v19, v18, v17, v16, v15, v3, v4, v5, v6, v7, v8, v9, v10,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(unint64_t)a3
{
  self->_keyCode = a3;
}

- (NSString)unicodeCharacter
{
  return self->_unicodeCharacter;
}

- (void)setUnicodeCharacter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)backupUnicodeCharacter
{
  return self->_backupUnicodeCharacter;
}

- (void)setBackupUnicodeCharacter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isDownEvent
{
  return self->_isDownEvent;
}

- (void)setIsDownEvent:(BOOL)a3
{
  self->_isDownEvent = a3;
}

- (BOOL)isRepeatEvent
{
  return self->_isRepeatEvent;
}

- (void)setIsRepeatEvent:(BOOL)a3
{
  self->_isRepeatEvent = a3;
}

- (BOOL)isModifierChangedEvent
{
  return self->_isModifierChangedEvent;
}

- (void)setIsModifierChangedEvent:(BOOL)a3
{
  self->_isModifierChangedEvent = a3;
}

- (BOOL)isLeftCommandDown
{
  return self->_isLeftCommandDown;
}

- (void)setIsLeftCommandDown:(BOOL)a3
{
  self->_isLeftCommandDown = a3;
}

- (BOOL)isRightCommandDown
{
  return self->_isRightCommandDown;
}

- (void)setIsRightCommandDown:(BOOL)a3
{
  self->_isRightCommandDown = a3;
}

- (BOOL)isLeftOptionDown
{
  return self->_isLeftOptionDown;
}

- (void)setIsLeftOptionDown:(BOOL)a3
{
  self->_isLeftOptionDown = a3;
}

- (BOOL)isRightOptionDown
{
  return self->_isRightOptionDown;
}

- (void)setIsRightOptionDown:(BOOL)a3
{
  self->_isRightOptionDown = a3;
}

- (BOOL)isLeftControlDown
{
  return self->_isLeftControlDown;
}

- (void)setIsLeftControlDown:(BOOL)a3
{
  self->_isLeftControlDown = a3;
}

- (BOOL)isRightControlDown
{
  return self->_isRightControlDown;
}

- (void)setIsRightControlDown:(BOOL)a3
{
  self->_isRightControlDown = a3;
}

- (BOOL)isLeftShiftDown
{
  return self->_isLeftShiftDown;
}

- (void)setIsLeftShiftDown:(BOOL)a3
{
  self->_isLeftShiftDown = a3;
}

- (BOOL)isRightShiftDown
{
  return self->_isRightShiftDown;
}

- (void)setIsRightShiftDown:(BOOL)a3
{
  self->_isRightShiftDown = a3;
}

- (BOOL)isCapsLockDown
{
  return self->_isCapsLockDown;
}

- (void)setIsCapsLockDown:(BOOL)a3
{
  self->_isCapsLockDown = a3;
}

- (BOOL)isFnDown
{
  return self->_isFnDown;
}

- (void)setIsFnDown:(BOOL)a3
{
  self->_isFnDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupUnicodeCharacter, 0);
  objc_storeStrong((id *)&self->_unicodeCharacter, 0);
}

@end
