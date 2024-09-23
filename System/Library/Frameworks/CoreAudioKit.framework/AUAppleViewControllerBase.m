@implementation AUAppleViewControllerBase

+ (id)customViewLogger
{
  void *v2;
  os_log_t v3;
  void *v4;

  v2 = (void *)customViewLogger;
  if (!customViewLogger)
  {
    v3 = os_log_create("com.apple.audio.CoreAudioKit", "AUCustomViews");
    v4 = (void *)customViewLogger;
    customViewLogger = (uint64_t)v3;

    v2 = (void *)customViewLogger;
  }
  return v2;
}

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUAppleViewControllerBase();
  v2 = (char *)v3.receiver;
  -[AUAppleViewControllerBase viewDidLoad](&v3, sel_viewDidLoad);
  *(_QWORD *)&v2[OBJC_IVAR____TtC12CoreAudioKit25AUAppleViewControllerBase_realtimeDrawingInterval] = 0x3FA999999999999ALL;

}

- (void)setNeedsRealtimeDrawing:(BOOL)a3
{
  self->_needsRealtimeDrawing = a3;
}

- (BOOL)needsRealtimeDrawing
{
  return self->_needsRealtimeDrawing;
}

- (void)setAU:(OpaqueAudioComponentInstance *)a3
{
  self->AU = a3;
}

- (OpaqueAudioComponentInstance)au
{
  return self->AU;
}

- (void)priv_removeListeners
{
  AUListenerBase *eventListener;
  OSStatus v4;
  OSStatus v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  eventListener = self->eventListener;
  if (eventListener)
  {
    v4 = AUListenerDispose(eventListener);
    if (v4)
    {
      v5 = v4;
      +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = 67109378;
        v9[1] = v5;
        v10 = 2112;
        v11 = v8;
        _os_log_impl(&dword_213156000, v6, OS_LOG_TYPE_ERROR, "Error disposing au listener: %d, [%@ priv_removeListeners]", (uint8_t *)v9, 0x12u);

      }
    }
  }
  self->eventListener = 0;
}

- (void)priv_addListenerForParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  OpaqueAudioComponentInstance *AU;
  AUListenerBase **p_eventListener;
  AUListenerBase *eventListener;
  int v12;
  int v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  uint8_t *p_buf;
  __CFRunLoop *Current;
  OSStatus v20;
  OSStatus v21;
  objc_class *v22;
  _DWORD v23[2];
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  AudioUnitEvent buf;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  AU = self->AU;
  if (AU)
  {
    p_eventListener = &self->eventListener;
    eventListener = self->eventListener;
    if (!eventListener)
    {
      Current = CFRunLoopGetCurrent();
      v20 = AUEventListenerCreate((AUEventListenerProc)EventListenerDispatcher, self, Current, (CFStringRef)*MEMORY[0x24BDBD598], 0.05, 0.05, p_eventListener);
      if (v20)
      {
        v21 = v20;
        +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_10:

          return;
        }
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        buf.mEventType = 67109634;
        *((_DWORD *)&buf.mEventType + 1) = a3;
        LOWORD(buf.mArgument.mParameter.mAudioUnit) = 1024;
        *(_DWORD *)((char *)&buf.mArgument.mProperty.mAudioUnit + 2) = v21;
        HIWORD(buf.mArgument.mProperty.mAudioUnit) = 2112;
        *(_QWORD *)&buf.mArgument.mProperty.mPropertyID = v16;
        v17 = "Error creating event listener for param id %d: %d, [%@ priv_addListenerForParameter:scope:element:]";
        p_buf = (uint8_t *)&buf;
LABEL_9:
        _os_log_impl(&dword_213156000, v14, OS_LOG_TYPE_ERROR, v17, p_buf, 0x18u);

        goto LABEL_10;
      }
      AU = self->AU;
      eventListener = *p_eventListener;
    }
    *(_QWORD *)&buf.mEventType = 0;
    buf.mArgument.mParameter.mAudioUnit = AU;
    *(_QWORD *)&buf.mArgument.mProperty.mPropertyID = __PAIR64__(a4, a3);
    *(_QWORD *)&buf.mArgument.mProperty.mElement = a5;
    v12 = addParamListener(eventListener, self, &buf);
    if (!v12)
      return;
    v13 = v12;
    +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 67109634;
    v23[1] = a3;
    v24 = 1024;
    v25 = v13;
    v26 = 2112;
    v27 = v16;
    v17 = "Error adding parameter listener for param id %d: %d, [%@ priv_addListenerForParameter:scope:element:]";
    p_buf = (uint8_t *)v23;
    goto LABEL_9;
  }
}

- (void)priv_removeListenerForParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  OSStatus v6;
  OSStatus v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  OSStatus v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->AU)
  {
    v6 = AUListenerDispose(self->eventListener);
    if (v6)
    {
      v7 = v6;
      +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = 67109634;
        v11[1] = a3;
        v12 = 1024;
        v13 = v7;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_213156000, v8, OS_LOG_TYPE_ERROR, "Error disposing of event listener for param id %d: %d, [%@ priv_removeListenerForParameter:scope:element:]", (uint8_t *)v11, 0x18u);

      }
    }
  }
}

- (AudioUnitParameterInfo)getParameterInfo:(SEL)a3 scope:(unsigned int)a4
{
  AudioUnitParameterInfo *result;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  UInt32 ioDataSize;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  ioDataSize = 104;
  *(_OWORD *)retstr->name = 0u;
  *(_OWORD *)&retstr->name[16] = 0u;
  *(_OWORD *)&retstr->name[32] = 0u;
  *(_OWORD *)&retstr->name[48] = 0u;
  *(_OWORD *)&retstr->clumpID = 0u;
  *(_OWORD *)&retstr->unit = 0u;
  *(_QWORD *)&retstr->flags = 0;
  result = (AudioUnitParameterInfo *)AudioUnitGetProperty(self->AU, 4u, 0, a4, retstr, &ioDataSize);
  if ((_DWORD)result)
  {
    v8 = (int)result;
    +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v14 = a4;
      v15 = 1024;
      v16 = v8;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_213156000, v9, OS_LOG_TYPE_ERROR, "Error getting parameter info for param id %d: %d, [%@ getParameterInfo:scope:]", buf, 0x18u);

    }
    *(_QWORD *)&retstr->flags = 0;
    *(_OWORD *)&retstr->clumpID = 0u;
    *(_OWORD *)&retstr->unit = 0u;
    *(_OWORD *)&retstr->name[32] = 0u;
    *(_OWORD *)&retstr->name[48] = 0u;
    *(_OWORD *)retstr->name = 0u;
    *(_OWORD *)&retstr->name[16] = 0u;
  }
  return result;
}

- (void)postBeginGestureNotificationForParameter:(unsigned int)a3
{
  AudioUnitEvent v3;

  v3.mArgument.mParameter.mAudioUnit = self->AU;
  *(_OWORD *)&v3.mArgument.mProperty.mPropertyID = a3;
  *(_QWORD *)&v3.mEventType = 1;
  AUEventListenerNotify(self->eventListener, self, &v3);
}

- (void)postEndGestureNotificationForParameter:(unsigned int)a3
{
  AudioUnitEvent v3;

  v3.mArgument.mParameter.mAudioUnit = self->AU;
  *(_OWORD *)&v3.mArgument.mProperty.mPropertyID = a3;
  *(_QWORD *)&v3.mEventType = 2;
  AUEventListenerNotify(self->eventListener, self, &v3);
}

- (void)priv_eventListener:(void *)a3 event:(const AudioUnitEvent *)a4 value:(float)a5
{
  AudioUnitEventType mEventType;
  AudioUnitParameterID mParameterID;

  mEventType = a4->mEventType;
  if (a4->mEventType == kAudioUnitEvent_BeginParameterChangeGesture)
  {
    -[AUAppleViewControllerBase handleBeginGesture:](self, "handleBeginGesture:", a4->mArgument.mParameter.mParameterID);
  }
  else if (mEventType == kAudioUnitEvent_EndParameterChangeGesture)
  {
    -[AUAppleViewControllerBase handleEndGesture:](self, "handleEndGesture:", a4->mArgument.mParameter.mParameterID);
  }
  else if (mEventType == kAudioUnitEvent_PropertyChange)
  {
    mParameterID = a4->mArgument.mParameter.mParameterID;
    if (mParameterID == 8 || mParameterID == 3)
      -[AUAppleViewControllerBase handleParameterListChanged](self, "handleParameterListChanged", a3);
  }
}

+ (id)getLocalizedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24CF57660, CFSTR("AudioUnits")),
        (v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = v3;
    +[AUAppleViewControllerBase customViewLogger](AUAppleViewControllerBase, "customViewLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_213156000, v7, OS_LOG_TYPE_ERROR, "Error reading \"%@\" string from localized string file,  [%@ +getLocalizedString:]", (uint8_t *)&v11, 0x16u);

    }
  }

  return v6;
}

- (double)realtimeDrawingInterval
{
  return self->_realtimeDrawingInterval;
}

- (void)setRealtimeDrawingInterval:(double)a3
{
  self->_realtimeDrawingInterval = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit25AUAppleViewControllerBase_tintColor));
}

- (_TtC12CoreAudioKit25AUAppleViewControllerBase)init
{
  return (_TtC12CoreAudioKit25AUAppleViewControllerBase *)sub_2131C1A24();
}

- (_TtC12CoreAudioKit25AUAppleViewControllerBase)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit25AUAppleViewControllerBase *)sub_2131C1B08(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void (*v4)(void);
  _TtC12CoreAudioKit25AUAppleViewControllerBase *v5;
  objc_super v6;

  v3 = a3;
  v4 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.isa) + 0x1D0);
  v5 = self;
  v4();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for AUAppleViewControllerBase();
  -[AUAppleViewControllerBase viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);

}

- (_TtC12CoreAudioKit25AUAppleViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12CoreAudioKit25AUAppleViewControllerBase *result;

  v4 = a4;
  result = (_TtC12CoreAudioKit25AUAppleViewControllerBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
