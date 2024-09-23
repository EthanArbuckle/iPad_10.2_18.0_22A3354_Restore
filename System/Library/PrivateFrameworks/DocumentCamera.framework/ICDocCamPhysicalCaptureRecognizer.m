@implementation ICDocCamPhysicalCaptureRecognizer

- (ICDocCamPhysicalCaptureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  ICDocCamPhysicalCaptureRecognizer *v4;
  ICDocCamPhysicalCaptureRecognizer *v5;
  NSArray *desiredButtons;
  ICDocCamPhysicalCaptureRecognizer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICDocCamPhysicalCaptureRecognizer;
  v4 = -[ICDocCamPhysicalCaptureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_suspended = 0;
    v4->_activeButton = 0;
    desiredButtons = v4->_desiredButtons;
    v4->_desiredButtons = 0;

    v5->_physicalButtonType = -1;
    -[ICDocCamPhysicalCaptureRecognizer _updateApplicationButtonStatus](v5, "_updateApplicationButtonStatus");
    v7 = v5;
  }

  return v5;
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

    -[ICDocCamPhysicalCaptureRecognizer _updateApplicationButtonStatus](self, "_updateApplicationButtonStatus");
  }
}

- (void)_updateApplicationButtonStatus
{
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[ICDocCamPhysicalCaptureRecognizer isEnabled](self, "isEnabled");
  -[ICDocCamPhysicalCaptureRecognizer desiredButtons](self, "desiredButtons");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v3)
  {
    v5 = objc_msgSend(v11, "containsObject:", &unk_24C5D81A8);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWantsVolumeButtonEvents:", v5);

    if ((_DWORD)v5)
    {
      objc_msgSend(v4, "addObject:", &unk_24C5D81C0);
      objc_msgSend(v4, "addObject:", &unk_24C5D81D8);
    }
    v7 = objc_msgSend(v11, "containsObject:", &unk_24C5D81F0);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWantsLockEvents:", v7);

    if ((_DWORD)v7)
      objc_msgSend(v4, "addObject:", &unk_24C5D8208);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWantsVolumeButtonEvents:", 0);

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWantsLockEvents:", 0);

  }
  -[ICDocCamPhysicalCaptureRecognizer setAllowedPressTypes:](self, "setAllowedPressTypes:", v4);

}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamPhysicalCaptureRecognizer;
  -[ICDocCamPhysicalCaptureRecognizer setEnabled:](&v4, sel_setEnabled_, a3);
  -[ICDocCamPhysicalCaptureRecognizer _updateApplicationButtonStatus](self, "_updateApplicationButtonStatus");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (!-[ICDocCamPhysicalCaptureRecognizer state](self, "state", a3, a4))
    -[ICDocCamPhysicalCaptureRecognizer setState:](self, "setState:", 5);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  BOOL v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[ICDocCamPhysicalCaptureRecognizer isSuspended](self, "isSuspended"))
  {
    v8 = -[ICDocCamPhysicalCaptureRecognizer activeButton](self, "activeButton");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = -[ICDocCamPhysicalCaptureRecognizer _captureButtonForPhysicalButtonType:](self, "_captureButtonForPhysicalButtonType:", objc_msgSend(v14, "type", (_QWORD)v18));
          if (v15)
            v16 = v15 == v8;
          else
            v16 = 0;
          if (v16 && !-[ICDocCamPhysicalCaptureRecognizer state](self, "state"))
          {
            if (!-[ICDocCamPhysicalCaptureRecognizer state](self, "state"))
            {
              -[ICDocCamPhysicalCaptureRecognizer setState:](self, "setState:", 1);
              -[ICDocCamPhysicalCaptureRecognizer setPhysicalButtonType:](self, "setPhysicalButtonType:", objc_msgSend(v14, "type"));
            }
          }
          else
          {
            -[ICDocCamPhysicalCaptureRecognizer ignorePress:forEvent:](self, "ignorePress:forEvent:", v14, v7);
          }
          ++v13;
        }
        while (v11 != v13);
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v11 = v17;
      }
      while (v17);
    }

  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if (-[ICDocCamPhysicalCaptureRecognizer state](self, "state", a3, a4))
    -[ICDocCamPhysicalCaptureRecognizer setState:](self, "setState:", 3);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  if (-[ICDocCamPhysicalCaptureRecognizer state](self, "state", a3, a4))
    -[ICDocCamPhysicalCaptureRecognizer setState:](self, "setState:", 4);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDocCamPhysicalCaptureRecognizer;
  -[ICDocCamPhysicalCaptureRecognizer reset](&v3, sel_reset);
  -[ICDocCamPhysicalCaptureRecognizer setPhysicalButtonType:](self, "setPhysicalButtonType:", -1);
}

- (int64_t)_captureButtonForPhysicalButtonType:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x66)
    return 1;
  else
    return 2 * (a3 == 104);
}

- (int64_t)activeButton
{
  return self->_activeButton;
}

- (void)setActiveButton:(int64_t)a3
{
  self->_activeButton = a3;
}

- (NSArray)desiredButtons
{
  return self->_desiredButtons;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (int64_t)physicalButtonType
{
  return self->_physicalButtonType;
}

- (void)setPhysicalButtonType:(int64_t)a3
{
  self->_physicalButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredButtons, 0);
}

@end
