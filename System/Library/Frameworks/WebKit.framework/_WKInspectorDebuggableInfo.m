@implementation _WKInspectorDebuggableInfo

- (_WKInspectorDebuggableInfo)init
{
  _WKInspectorDebuggableInfo *v2;
  _WKInspectorDebuggableInfo *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_WKInspectorDebuggableInfo;
  v2 = -[_WKInspectorDebuggableInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[_WKInspectorDebuggableInfo _apiObject](v2, "_apiObject");
    *(_OWORD *)(v4 + 8) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_QWORD *)v4 = off_1E34CC2A8;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(_QWORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 40) = 0;
    *(_QWORD *)(v4 + 24) = 0;
    *(_BYTE *)(v4 + 48) = 0;
    *(_QWORD *)v4 = &off_1E34D92F8;
    *(_QWORD *)(v4 + 8) = v3;
  }
  return v3;
}

- (int64_t)debuggableType
{
  unint64_t v2;

  v2 = (char)self->_debuggableInfo.data.__lx[16];
  if (v2 > 4)
    return 1;
  else
    return qword_1978CF900[v2];
}

- (void)setDebuggableType:(int64_t)a3
{
  unint64_t v3;

  v3 = 0x402030100uLL >> (8 * a3);
  if ((unint64_t)a3 >= 5)
    LOBYTE(v3) = 1;
  self->_debuggableInfo.data.__lx[16] = v3;
}

- (NSString)targetPlatformName
{
  if (*(_QWORD *)&self->_debuggableInfo.data.__lx[24])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setTargetPlatformName:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self->_debuggableInfo.data.__lx[24], (WTF::StringImpl *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (NSString)targetBuildVersion
{
  if (*(_QWORD *)&self->_debuggableInfo.data.__lx[32])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setTargetBuildVersion:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self->_debuggableInfo.data.__lx[32], (WTF::StringImpl *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (NSString)targetProductVersion
{
  if (*(_QWORD *)&self->_debuggableInfo.data.__lx[40])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setTargetProductVersion:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self->_debuggableInfo.data.__lx[40], (WTF::StringImpl *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (BOOL)targetIsSimulator
{
  return (BOOL)self[1].super.isa;
}

- (void)setTargetIsSimulator:(BOOL)a3
{
  LOBYTE(self[1].super.isa) = a3;
}

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::DebuggableInfo::~DebuggableInfo((API::DebuggableInfo *)&self->_debuggableInfo, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKInspectorDebuggableInfo;
    -[_WKInspectorDebuggableInfo dealloc](&v5, sel_dealloc);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDebuggableType:", -[_WKInspectorDebuggableInfo debuggableType](self, "debuggableType"));
  objc_msgSend(v4, "setTargetPlatformName:", -[_WKInspectorDebuggableInfo targetPlatformName](self, "targetPlatformName"));
  objc_msgSend(v4, "setTargetBuildVersion:", -[_WKInspectorDebuggableInfo targetBuildVersion](self, "targetBuildVersion"));
  objc_msgSend(v4, "setTargetProductVersion:", -[_WKInspectorDebuggableInfo targetProductVersion](self, "targetProductVersion"));
  objc_msgSend(v4, "setTargetIsSimulator:", -[_WKInspectorDebuggableInfo targetIsSimulator](self, "targetIsSimulator"));
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_debuggableInfo;
}

@end
