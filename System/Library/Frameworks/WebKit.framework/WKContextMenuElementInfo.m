@implementation WKContextMenuElementInfo

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKContextMenuElementInfo accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKContextMenuElementInfo accessInstanceVariablesDirectly]::didLogFault = 1;
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
  const void *v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(const void **)&self[10]._elementInfo.data.__lx[16];
    *(_QWORD *)&self[10]._elementInfo.data.__lx[16] = 0;
    if (v5)
      CFRelease(v5);
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_elementInfo.data.__lx[16], v4);
    v6.receiver = self;
    v6.super_class = (Class)WKContextMenuElementInfo;
    -[WKContextMenuElementInfo dealloc](&v6, sel_dealloc);
  }
}

- (NSURL)linkURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (Object)_apiObject
{
  return (Object *)&self->_elementInfo;
}

- (id)_activatedElementInfo
{
  unsigned __int8 *v2;
  const void *v3;
  _WKActivatedElementInfo *v4;

  v2 = &self->_elementInfo.data.__lx[16];
  v3 = *(const void **)&self[10]._elementInfo.data.__lx[16];
  if (v3)
    CFRetain(*(CFTypeRef *)&self[10]._elementInfo.data.__lx[16]);
  v4 = +[_WKActivatedElementInfo activatedElementInfoWithInteractionInformationAtPosition:userInfo:](_WKActivatedElementInfo, "activatedElementInfoWithInteractionInformationAtPosition:userInfo:", v2, v3);
  if (v3)
    CFRelease(v3);
  return v4;
}

@end
