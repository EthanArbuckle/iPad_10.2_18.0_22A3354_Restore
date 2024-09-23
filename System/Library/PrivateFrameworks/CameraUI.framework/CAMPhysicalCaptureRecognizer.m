@implementation CAMPhysicalCaptureRecognizer

- (CAMPhysicalCaptureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  CAMPhysicalCaptureRecognizer *v4;
  CAMPhysicalCaptureRecognizer *v5;
  NSSet *activeButtons;
  NSArray *desiredButtons;
  CAMPhysicalCaptureRecognizer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMPhysicalCaptureRecognizer;
  v4 = -[CAMPhysicalCaptureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_suspended = 0;
    v4->_lastActiveButton = 0;
    activeButtons = v4->_activeButtons;
    v4->_activeButtons = 0;

    desiredButtons = v5->_desiredButtons;
    v5->_desiredButtons = 0;

    v5->_pressType = -1;
    -[CAMPhysicalCaptureRecognizer _updateApplicationButtonStatus](v5, "_updateApplicationButtonStatus");
    v8 = v5;
  }

  return v5;
}

- (void)_updateApplicationButtonStatus
{
  int v3;
  id v4;
  int v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[CAMPhysicalCaptureRecognizer isEnabled](self, "isEnabled");
  -[CAMPhysicalCaptureRecognizer desiredButtons](self, "desiredButtons");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_msgSend(v11, "containsObject:", &unk_1EA3B0FE8);
  v6 = objc_msgSend(v11, "containsObject:", &unk_1EA3B1000);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsVolumeButtonEvents:", v3 & (v5 | v6));

  if (!v5)
  {
    if (!v6)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(v4, "addObject:", &unk_1EA3B1030);
    if (v3)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWantsLockEvents:", 0);

    goto LABEL_11;
  }
  objc_msgSend(v4, "addObject:", &unk_1EA3B1018);
  if (v6)
    goto LABEL_9;
LABEL_3:
  if (!v3)
    goto LABEL_10;
LABEL_4:
  v8 = objc_msgSend(v11, "containsObject:", &unk_1EA3B1048);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsLockEvents:", v8);

  if ((_DWORD)v8)
    objc_msgSend(v4, "addObject:", &unk_1EA3B1060);
  if (objc_msgSend(v11, "containsObject:", &unk_1EA3B1078))
    objc_msgSend(v4, "addObject:", &unk_1EA3B1090);
LABEL_11:
  -[CAMPhysicalCaptureRecognizer setAllowedPressTypes:](self, "setAllowedPressTypes:", v4);

}

- (NSArray)desiredButtons
{
  return self->_desiredButtons;
}

- (void)setDesiredButtons:(id)a3
{
  NSArray *v4;
  NSArray *desiredButtons;

  if (self->_desiredButtons != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    desiredButtons = self->_desiredButtons;
    self->_desiredButtons = v4;

    -[CAMPhysicalCaptureRecognizer _updateApplicationButtonStatus](self, "_updateApplicationButtonStatus");
  }
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMPhysicalCaptureRecognizer;
  -[CAMPhysicalCaptureRecognizer setEnabled:](&v4, sel_setEnabled_, a3);
  -[CAMPhysicalCaptureRecognizer _updateApplicationButtonStatus](self, "_updateApplicationButtonStatus");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (!-[CAMPhysicalCaptureRecognizer state](self, "state", a3, a4))
    -[CAMPhysicalCaptureRecognizer setState:](self, "setState:", 5);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMPhysicalCaptureRecognizer;
  -[CAMPhysicalCaptureRecognizer reset](&v3, sel_reset);
  -[CAMPhysicalCaptureRecognizer setPressType:](self, "setPressType:", -1);
}

- (void)setPressType:(int64_t)a3
{
  self->_pressType = a3;
}

- (int64_t)pressType
{
  return self->_pressType;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[CAMPhysicalCaptureRecognizer isSuspended](self, "isSuspended"))
  {
    -[CAMPhysicalCaptureRecognizer activeButtons](self, "activeButtons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (!v8)
      goto LABEL_19;
    v9 = v8;
    v10 = *(_QWORD *)v25;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "type");
        v14 = -[CAMPhysicalCaptureRecognizer _captureButtonForPressType:](self, "_captureButtonForPressType:", v13);
        if (!v14)
          goto LABEL_14;
        v15 = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "containsObject:", v16) & 1) == 0)
        {

LABEL_14:
          -[CAMPhysicalCaptureRecognizer ignorePress:forEvent:](self, "ignorePress:forEvent:", v12, v7);
          goto LABEL_15;
        }
        v17 = -[CAMPhysicalCaptureRecognizer state](self, "state");

        if (v17)
          goto LABEL_14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "containsObject:", v18))
        {
          v19 = -[CAMPhysicalCaptureRecognizer state](self, "state");

          if (!v19)
          {
            -[CAMPhysicalCaptureRecognizer setLastActiveButton:](self, "setLastActiveButton:", v15);
            -[CAMPhysicalCaptureRecognizer setState:](self, "setState:", 1);
            -[CAMPhysicalCaptureRecognizer setPressType:](self, "setPressType:", v13);
          }
        }
        else
        {

        }
LABEL_15:
        ++v11;
      }
      while (v9 != v11);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v9 = v20;
      if (!v20)
      {
LABEL_19:

        v6 = v21;
        break;
      }
    }
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if (-[CAMPhysicalCaptureRecognizer state](self, "state", a3, a4))
    -[CAMPhysicalCaptureRecognizer setState:](self, "setState:", 3);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  if (-[CAMPhysicalCaptureRecognizer state](self, "state", a3, a4))
    -[CAMPhysicalCaptureRecognizer setState:](self, "setState:", 4);
}

- (int64_t)_captureButtonForPressType:(int64_t)a3
{
  if (a3 > 103)
  {
    if (a3 != 104)
    {
      if (a3 == 601)
        return 4;
      return 0;
    }
    return 3;
  }
  else
  {
    if (a3 != 102)
    {
      if (a3 == 103)
        return 2;
      return 0;
    }
    return 1;
  }
}

- (NSSet)activeButtons
{
  return self->_activeButtons;
}

- (void)setActiveButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (int64_t)lastActiveButton
{
  return self->_lastActiveButton;
}

- (void)setLastActiveButton:(int64_t)a3
{
  self->_lastActiveButton = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredButtons, 0);
  objc_storeStrong((id *)&self->_activeButtons, 0);
}

@end
