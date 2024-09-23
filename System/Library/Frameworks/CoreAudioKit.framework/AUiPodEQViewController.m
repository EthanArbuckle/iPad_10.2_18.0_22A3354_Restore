@implementation AUiPodEQViewController

- (void)viewDidLoad
{
  void *v3;
  NSArray *v4;
  NSArray *topLevelObjects;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadNibNamed:owner:options:", CFSTR("AUiPodEQViewController"), self, 0);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  topLevelObjects = self->super.topLevelObjects;
  self->super.topLevelObjects = v4;

  v6.receiver = self;
  v6.super_class = (Class)AUiPodEQViewController;
  -[AUAppleViewControllerBase viewDidLoad](&v6, sel_viewDidLoad);
}

- (void)synchronizeUIWithParameterValues
{
  __CFRunLoop *Current;
  OSStatus v4;
  OSStatus v5;
  NSObject *v6;
  const char *v7;
  uint8_t *p_inEvent;
  OpaqueAudioComponentInstance *AU;
  UInt32 ioDataSize;
  _QWORD outData[2];
  uint8_t buf[4];
  int v13;
  AudioUnitEvent inEvent;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  outData[0] = 0;
  outData[1] = 0;
  ioDataSize = 16;
  if (!AudioUnitGetProperty(self->super.AU, 0x24u, 0, 0, outData, &ioDataSize))
    -[UIPickerView selectRow:inComponent:animated:](self->picker, "selectRow:inComponent:animated:", SLODWORD(outData[0]), 0, 1);
  if (self->super.AU && !self->super.eventListener)
  {
    Current = CFRunLoopGetCurrent();
    v4 = AUEventListenerCreate((AUEventListenerProc)EventListenerDispatcher, self, Current, (CFStringRef)*MEMORY[0x24BDBD598], 0.05, 0.05, &self->super.eventListener);
    if (v4)
    {
      v5 = v4;
      +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        return;
      }
      inEvent.mEventType = 67109120;
      *((_DWORD *)&inEvent.mEventType + 1) = v5;
      v7 = "Error creating event listener: %d, [AUiPodEQViewController synchronizeUIWIthParameterValues]";
      p_inEvent = (uint8_t *)&inEvent;
    }
    else
    {
      memset(&inEvent, 0, sizeof(inEvent));
      AU = self->super.AU;
      inEvent.mEventType = kAudioUnitEvent_PropertyChange;
      inEvent.mArgument.mParameter.mAudioUnit = AU;
      inEvent.mArgument.mParameter.mParameterID = 36;
      inEvent.mArgument.mParameter.mElement = 0;
      if (!AUEventListenerAddEventType(self->super.eventListener, self, &inEvent))
        return;
      +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 67109120;
      v13 = 0;
      v7 = "Error adding event listener for kAudioUnitProperty_PresentPreset: %d, [AUiPodEQViewController synchronizeUIWI"
           "thParameterValues]";
      p_inEvent = buf;
    }
    _os_log_impl(&dword_213156000, v6, OS_LOG_TYPE_ERROR, v7, p_inEvent, 8u);
    goto LABEL_12;
  }
}

- (void)priv_eventListener:(void *)a3 event:(const AudioUnitEvent *)a4 value:(float)a5
{
  objc_super v6;
  _QWORD block[5];
  __int128 v8;
  UInt32 ioDataSize;
  __int128 outData;

  if (a4->mEventType == kAudioUnitEvent_PropertyChange)
  {
    if (a4->mArgument.mParameter.mParameterID == 36)
    {
      outData = 0uLL;
      ioDataSize = 16;
      if (!AudioUnitGetProperty(self->super.AU, 0x24u, 0, 0, &outData, &ioDataSize))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __57__AUiPodEQViewController_priv_eventListener_event_value___block_invoke;
        block[3] = &unk_24CF54F88;
        block[4] = self;
        v8 = outData;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AUiPodEQViewController;
    -[AUAppleViewControllerBase priv_eventListener:event:value:](&v6, sel_priv_eventListener_event_value_, a3);
  }
}

uint64_t __57__AUiPodEQViewController_priv_eventListener_event_value___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "selectRow:inComponent:animated:", *(int *)(a1 + 40), 0, 1);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 23;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a4, a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AUAppleViewControllerBase getLocalizedString:](AUAppleViewControllerBase, "getLocalizedString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  BOOL v7;
  const void *ValueAtIndex;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  UInt32 ioDataSize;
  CFArrayRef outData;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  OSStatus v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  outData = 0;
  ioDataSize = 8;
  if (AudioUnitGetProperty(self->super.AU, 0x18u, 0, 0, &outData, &ioDataSize))
    v7 = 1;
  else
    v7 = outData == 0;
  if (!v7)
  {
    if (CFArrayGetCount(outData) > a4)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(outData, a4);
      if (ValueAtIndex)
      {
        v9 = AudioUnitSetProperty(self->super.AU, 0x24u, 0, 0, ValueAtIndex, 0x10u);
        if (v9)
        {
          v10 = v9;
          +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            v15 = a4;
            v16 = 1024;
            v17 = v10;
            _os_log_impl(&dword_213156000, v11, OS_LOG_TYPE_ERROR, "Unable to set preset %d: %d, [AUiPodEQViewController pickerView:didSelectRow:inComponent:]", buf, 0xEu);
          }

        }
      }
    }
    CFRelease(outData);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->picker, 0);
}

@end
