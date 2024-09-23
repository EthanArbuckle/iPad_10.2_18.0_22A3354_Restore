@implementation AVExternalPlaybackMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)longFormVideoExternalPlaybackMonitor
{
  void *v3;

  if (FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager())
    v3 = 0;
  else
    v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFigRoutingSessionManager:", 0);
  return v3;
}

- (AVExternalPlaybackMonitor)initWithFigRoutingSessionManager:(OpaqueFigRoutingSessionManager *)a3
{
  AVExternalPlaybackMonitor *v5;
  AVExternalPlaybackMonitorInternal *ivars;
  OpaqueFigRoutingSessionManager *v7;
  AVExternalPlaybackMonitor *v8;
  objc_super v10;

  CMNotificationCenterGetDefaultLocalCenter();
  v10.receiver = self;
  v10.super_class = (Class)AVExternalPlaybackMonitor;
  v5 = -[AVExternalPlaybackMonitor init](&v10, sel_init);
  if (v5
    && (ivars = objc_alloc_init(AVExternalPlaybackMonitorInternal), (v5->_ivars = ivars) != 0)
    && (!a3
      ? (v7 = 0)
      : (OpaqueFigRoutingSessionManager *)(v7 = (OpaqueFigRoutingSessionManager *)CFRetain(a3), ivars = v5->_ivars),
        (ivars->figRoutingSessionManager = v7, v5->_ivars->figRoutingSessionManager)
     && !FigNotificationCenterAddWeakListener()
     && !FigNotificationCenterAddWeakListener()))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AVExternalPlaybackMonitor)init
{
  return -[AVExternalPlaybackMonitor initWithFigRoutingSessionManager:](self, "initWithFigRoutingSessionManager:", 0);
}

- (void)dealloc
{
  AVExternalPlaybackMonitorInternal *ivars;
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  objc_super v5;

  ivars = self->_ivars;
  if (ivars)
  {
    if (ivars->figRoutingSessionManager)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      FigNotificationCenterRemoveWeakListener();
      ivars = self->_ivars;
      figRoutingSessionManager = ivars->figRoutingSessionManager;
      if (figRoutingSessionManager)
      {
        CFRelease(figRoutingSessionManager);
        ivars = self->_ivars;
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVExternalPlaybackMonitor;
  -[AVExternalPlaybackMonitor dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, airPlayVideoActive=%d, airPlayVideoPlaying=%d>"), NSStringFromClass(v4), self, -[AVExternalPlaybackMonitor isAirPlayVideoActive](self, "isAirPlayVideoActive"), -[AVExternalPlaybackMonitor isAirPlayVideoPlaying](self, "isAirPlayVideoPlaying"));
}

- (BOOL)isAirPlayVideoActive
{
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  void (*v3)(OpaqueFigRoutingSessionManager *, char *);
  char v5;

  v5 = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v3 = *(void (**)(OpaqueFigRoutingSessionManager *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v3)
    return 0;
  v3(figRoutingSessionManager, &v5);
  return v5 != 0;
}

- (BOOL)isAirPlayVideoPlaying
{
  OpaqueFigRoutingSessionManager *figRoutingSessionManager;
  void (*v3)(OpaqueFigRoutingSessionManager *, char *);
  char v5;

  v5 = 0;
  figRoutingSessionManager = self->_ivars->figRoutingSessionManager;
  v3 = *(void (**)(OpaqueFigRoutingSessionManager *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (!v3)
    return 0;
  v3(figRoutingSessionManager, &v5);
  return v5 != 0;
}

@end
