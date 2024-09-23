@implementation SBVoiceOverTouchConnection

+ (id)defaultConnection
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_SBVOTConnection;
  if (!_SBVOTConnection)
  {
    v3 = objc_msgSend(objc_allocWithZone((Class)SBVoiceOverTouchConnection), "init");
    v4 = (void *)_SBVOTConnection;
    _SBVOTConnection = v3;

    objc_msgSend((id)_SBVOTConnection, "_registerForMachConnection");
    v2 = (void *)_SBVOTConnection;
  }
  return v2;
}

- (void)_registerVOTConnectionWithPort:(unsigned int)a3
{
  __CFMachPort *votMachPort;
  __CFMachPort *v6;
  __CFMachPort *v7;
  CFMachPortContext context;

  if (a3 && (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityIsAppReadyToBeProbed") & 1) != 0)
  {
    votMachPort = self->_votMachPort;
    if (votMachPort)
    {
      CFMachPortSetInvalidationCallBack(votMachPort, 0);
      v6 = self->_votMachPort;
      if (v6)
      {
        CFRelease(v6);
        self->_votMachPort = 0;
      }
    }
    _SBVOTPort = a3;
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    v7 = CFMachPortCreateWithPort(0, a3, 0, &context, 0);
    self->_votMachPort = v7;
    if (v7)
      CFMachPortSetInvalidationCallBack(v7, (CFMachPortInvalidationCallBack)_voiceOverTouchDied);
    _AXLogWithFacility();
  }
  else
  {
    -[SBVoiceOverTouchConnection tearDownVoiceOverTouchConnection](self, "tearDownVoiceOverTouchConnection");
  }
}

- (void)_registerForMachConnection
{
  ipc_space_t *v2;
  __CFRunLoop *Current;
  mach_port_t sp;

  sp = 0;
  if (bootstrap_check_in(*MEMORY[0x24BDAD2F0], "com.apple.SpringBoard.VOT", &sp))
  {
    _AXLogWithFacility();
    v2 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    if (!mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &sp)
      && !mach_port_insert_right(*v2, sp, sp, 0x14u)
      && bootstrap_register2())
    {
      _AXLogWithFacility();
    }
  }
  server_source = MSHCreateMIGServerSource();
  if (server_source)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)server_source, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  }
}

- (void)tearDownVoiceOverTouchConnection
{
  __CFMachPort *votMachPort;
  mach_port_t Port;

  votMachPort = self->_votMachPort;
  if (votMachPort)
  {
    Port = CFMachPortGetPort(votMachPort);
    CFMachPortSetInvalidationCallBack(self->_votMachPort, 0);
    mach_port_deallocate(*MEMORY[0x24BDAEC58], Port);
    CFRelease(self->_votMachPort);
    self->_votMachPort = 0;
  }
  -[SBVoiceOverTouchConnection setLabelElementPanelVisible:initialValue:](self, "setLabelElementPanelVisible:initialValue:", 0, 0);
  -[SBVoiceOverTouchConnection setScreenCurtainEnabled:](self, "setScreenCurtainEnabled:", 0);
  _SBVOTPort = 0;
}

- (void)dealloc
{
  void *v3;
  mach_port_name_t v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7258], 0);

  -[SBVoiceOverTouchConnection tearDownVoiceOverTouchConnection](self, "tearDownVoiceOverTouchConnection");
  if (server_source)
  {
    v4 = MSHGetMachPortFromSource();
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)server_source);
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v4, 1u, -1);
    CFRelease((CFTypeRef)server_source);
    server_source = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBVoiceOverTouchConnection;
  -[SBVoiceOverTouchConnection dealloc](&v5, sel_dealloc);
}

- (BOOL)elementLabelerVisible
{
  return self->_labelAlert != 0;
}

- (void)setLabelElementPanelVisible:(BOOL)a3 initialValue:(id)a4
{
  void *v6;
  char v7;
  SBVoiceOverTouchLabelElementAlertItem *v8;
  SBVoiceOverTouchLabelElementAlertItem *labelAlert;
  SBVoiceOverTouchLabelElementAlertItem *v10;
  id v11;

  v11 = a4;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_iosAccessibilityAttributeValue:", 1500);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    if (a3)
    {
      v8 = objc_alloc_init(SBVoiceOverTouchLabelElementAlertItem);
      labelAlert = self->_labelAlert;
      self->_labelAlert = v8;

      -[SBVoiceOverTouchLabelElementAlertItem setInitialValue:](self->_labelAlert, "setInitialValue:", v11);
      -[SBVoiceOverTouchLabelElementAlertItem setVoiceOverAlertItemDelegate:](self->_labelAlert, "setVoiceOverAlertItemDelegate:", self);
      objc_msgSend(MEMORY[0x24BEB0ED8], "activateAlertItem:", self->_labelAlert);
    }
    else
    {
      -[SBAlertItem dismiss](self->_labelAlert, "dismiss");
      v10 = self->_labelAlert;
      self->_labelAlert = 0;

    }
  }

}

- (void)_programmaticAppSwitch:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  SBSSpringBoardServerPort();
  if (v3)
    JUMPOUT(0x23491F600);
  JUMPOUT(0x23491F5F4);
}

- (void)setScreenCurtainEnabled:(BOOL)a3
{
  -[SBVoiceOverTouchConnection setScreenCurtainEnabled:animated:](self, "setScreenCurtainEnabled:animated:", a3, 1);
}

- (void)setScreenCurtainEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  char v6;

  v4 = a3;
  self->_screenCurtainEnabled = a3;
  if (!a3
    || (+[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance", a3, a4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isDimmed"),
        v5,
        (v6 & 1) == 0))
  {
    AXSpringBoardSetScreenCurtainEnabled(v4);
  }
}

- (void)_dismissLabelAlert
{
  SBVoiceOverTouchLabelElementAlertItem *labelAlert;

  -[SBAlertItem dismiss](self->_labelAlert, "dismiss");
  labelAlert = self->_labelAlert;
  self->_labelAlert = 0;

}

- (void)voiceOverTouchLabelElementAlertItemDidAccept:(id)a3 withTextField:(id)a4
{
  void *v5;

  objc_msgSend(a4, "text", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(0x7E9u, v5);

  -[SBVoiceOverTouchConnection _dismissLabelAlert](self, "_dismissLabelAlert");
}

- (BOOL)voiceOverTouchLabelElementAlertItem:(id)a3 textFieldShouldReturn:(id)a4
{
  void *v6;

  if (a4)
  {
    objc_msgSend(a4, "text", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0x7E9u, v6);

    -[SBVoiceOverTouchConnection setLabelElementPanelVisible:initialValue:](self, "setLabelElementPanelVisible:initialValue:", 0, 0);
  }
  return a4 == 0;
}

- (BOOL)screenCurtainEnabled
{
  return self->_screenCurtainEnabled;
}

- (BOOL)inVoiceOverPassthroughMode
{
  return self->inVoiceOverPassthroughMode;
}

- (void)setInVoiceOverPassthroughMode:(BOOL)a3
{
  self->inVoiceOverPassthroughMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAlert, 0);
}

@end
