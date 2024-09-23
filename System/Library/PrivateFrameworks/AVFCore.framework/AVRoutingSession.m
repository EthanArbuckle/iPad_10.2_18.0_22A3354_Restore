@implementation AVRoutingSession

- (AVRoutingSession)initWithFigRoutingSession:(OpaqueFigRoutingSession *)a3
{
  AVRoutingSession *v4;
  AVRoutingSessionInternal *ivars;
  OpaqueFigRoutingSession *v6;
  AVRoutingSession *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVRoutingSession;
  v4 = -[AVRoutingSession init](&v9, sel_init);
  if (v4
    && (ivars = objc_alloc_init(AVRoutingSessionInternal), (v4->_ivars = ivars) != 0)
    && (!a3 ? (v6 = 0) : (OpaqueFigRoutingSession *)(v6 = (OpaqueFigRoutingSession *)CFRetain(a3), ivars = v4->_ivars),
        ivars->figRoutingSession = v6,
        v4->_ivars->figRoutingSession))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (AVRoutingSession)init
{
  return -[AVRoutingSession initWithFigRoutingSession:](self, "initWithFigRoutingSession:", 0);
}

- (void)dealloc
{
  AVRoutingSessionInternal *ivars;
  OpaqueFigRoutingSession *figRoutingSession;
  objc_super v5;

  ivars = self->_ivars;
  if (ivars)
  {
    figRoutingSession = ivars->figRoutingSession;
    if (figRoutingSession)
    {
      CFRelease(figRoutingSession);
      ivars = self->_ivars;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRoutingSession;
  -[AVRoutingSession dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (-[AVRoutingSession establishedAutomaticallyFromLikelyDestination](self, "establishedAutomaticallyFromLikelyDestination"))
  {
    v6 = "Y";
  }
  else
  {
    v6 = "N";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, establishedAutomaticallyFromLikelyDestination=%s, destination=%@>"), v5, self, v6, -[AVRoutingSession destination](self, "destination"));
}

- (BOOL)establishedAutomaticallyFromLikelyDestination
{
  uint64_t CMBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  BOOL v4;
  CFTypeRef v5;
  CFTypeRef v6;
  CFTypeRef cf;

  cf = 0;
  CMBaseObject = FigRoutingSessionGetCMBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v3)
  {
    v4 = v3(CMBaseObject, *MEMORY[0x1E0D48DF8], *MEMORY[0x1E0C9AE00], &cf) == 0;
    v5 = cf;
    v6 = (CFTypeRef)*MEMORY[0x1E0C9AE50];
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = (CFTypeRef)*MEMORY[0x1E0C9AE50];
  }
  return v5 == v6 && v4;
}

- (AVRoutingSessionDestination)destination
{
  OpaqueFigRoutingSession *figRoutingSession;
  unsigned int (*v3)(OpaqueFigRoutingSession *, CFTypeRef *);
  AVRoutingSessionDestination *v4;
  AVRoutingSessionDestination *v5;
  CFTypeRef cf;

  cf = 0;
  figRoutingSession = self->_ivars->figRoutingSession;
  v3 = *(unsigned int (**)(OpaqueFigRoutingSession *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 8);
  if (!v3 || v3(figRoutingSession, &cf))
  {
    v5 = 0;
  }
  else
  {
    v4 = [AVRoutingSessionDestination alloc];
    v5 = -[AVRoutingSessionDestination initWithFigRoutingSessionDestination:](v4, "initWithFigRoutingSessionDestination:", cf);
  }
  if (cf)
    CFRelease(cf);
  return v5;
}

@end
