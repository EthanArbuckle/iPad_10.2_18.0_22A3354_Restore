@implementation WKWindowFeatures

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWindowFeatures accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWindowFeatures accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self[1]._windowFeatures.data.__lx[24], v4);
    v5.receiver = self;
    v5.super_class = (Class)WKWindowFeatures;
    -[WKWindowFeatures dealloc](&v5, sel_dealloc);
  }
}

- (NSNumber)menuBarVisibility
{
  if (HIWORD(self[1].super.isa) >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIWORD(self[1].super.isa) != 0);
  else
    return 0;
}

- (NSNumber)statusBarVisibility
{
  if (*(unsigned __int16 *)self[1]._windowFeatures.data.__lx >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)self[1]._windowFeatures.data.__lx != 0);
  else
    return 0;
}

- (NSNumber)toolbarsVisibility
{
  if (*(unsigned __int16 *)&self[1]._windowFeatures.data.__lx[2] >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)&self[1]._windowFeatures.data.__lx[2] != 0);
  else
    return 0;
}

- (NSNumber)allowsResizing
{
  if (*(unsigned __int16 *)&self[1]._windowFeatures.data.__lx[8] >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)&self[1]._windowFeatures.data.__lx[8] != 0);
  else
    return 0;
}

- (NSNumber)x
{
  double v2;

  if (!self->_windowFeatures.data.__lx[24])
    return 0;
  LODWORD(v2) = *(_DWORD *)&self->_windowFeatures.data.__lx[20];
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
}

- (NSNumber)y
{
  double v2;

  if (!self->_windowFeatures.data.__lx[32])
    return 0;
  LODWORD(v2) = *(_DWORD *)&self->_windowFeatures.data.__lx[28];
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
}

- (NSNumber)width
{
  double v2;

  if (!self->_windowFeatures.data.__lx[40])
    return 0;
  LODWORD(v2) = *(_DWORD *)&self->_windowFeatures.data.__lx[36];
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
}

- (NSNumber)height
{
  double v2;

  if (!LOBYTE(self[1].super.isa))
    return 0;
  LODWORD(v2) = *(_DWORD *)&self->_windowFeatures.data.__lx[44];
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
}

- (Object)_apiObject
{
  return (Object *)&self->_windowFeatures;
}

- (BOOL)_wantsPopup
{
  return WebCore::WindowFeatures::wantsPopup((WebCore::WindowFeatures *)&self->_windowFeatures.data.__lx[16]);
}

- (BOOL)_hasAdditionalFeatures
{
  return self->_windowFeatures.data.__lx[16];
}

- (NSNumber)_popup
{
  if (WORD2(self[1].super.isa) >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WORD2(self[1].super.isa) != 0);
  else
    return 0;
}

- (NSNumber)_locationBarVisibility
{
  if (*(unsigned __int16 *)&self[1]._windowFeatures.data.__lx[4] >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)&self[1]._windowFeatures.data.__lx[4] != 0);
  else
    return 0;
}

- (NSNumber)_scrollbarsVisibility
{
  if (*(unsigned __int16 *)&self[1]._windowFeatures.data.__lx[6] >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)&self[1]._windowFeatures.data.__lx[6] != 0);
  else
    return 0;
}

- (NSNumber)_fullscreenDisplay
{
  if (*(unsigned __int16 *)&self[1]._windowFeatures.data.__lx[10] >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)&self[1]._windowFeatures.data.__lx[10] != 0);
  else
    return 0;
}

- (NSNumber)_dialogDisplay
{
  if (*(unsigned __int16 *)&self[1]._windowFeatures.data.__lx[12] >= 0x100u)
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_WORD *)&self[1]._windowFeatures.data.__lx[12] != 0);
  else
    return 0;
}

@end
