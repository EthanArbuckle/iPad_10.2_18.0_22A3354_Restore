@implementation FigCaptureSessionProxy

- (int64_t)identifier
{
  return self->_identifier;
}

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptureSessionProxy)initWithFigCaptureSession:(OpaqueFigCaptureSession *)a3 identifier:(int64_t)a4 clientAuditToken:(id *)a5 containsVideoSource:(BOOL)a6
{
  char *v10;
  __int128 v11;
  objc_super v13;

  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)FigCaptureSessionProxy;
    v10 = -[FigCaptureSessionProxy init](&v13, sel_init);
    if (v10)
    {
      *((_QWORD *)v10 + 1) = CFRetain(a3);
      *((_QWORD *)v10 + 2) = a4;
      v11 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)(v10 + 28) = *(_OWORD *)a5->var0;
      *(_OWORD *)(v10 + 44) = v11;
      v10[24] = a6;
    }
  }
  else
  {

    return 0;
  }
  return (FigCaptureSessionProxy *)v10;
}

- (void)dealloc
{
  OpaqueFigCaptureSession *session;
  objc_super v4;

  session = self->_session;
  if (session)
    CFRelease(session);
  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionProxy;
  -[FigCaptureSessionProxy dealloc](&v4, sel_dealloc);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[3];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[7];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)containsVideoSource
{
  return self->_containsVideoSource;
}

- (int)openPreviewTapWithDelegate:(id)a3
{
  int v4;

  if (self->_previewTapOpened)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v4 = FigSignalErrorAt();
    if (!v4)
      return v4;
    goto LABEL_8;
  }
  self->_previewTapDelegate = (FigCaptureSessionPreviewTapDelegate *)a3;
  v4 = FigCaptureSessionSetVideoPreviewTapCallback(self->_session, (uint64_t)csp_previewTapCallback, (uint64_t)self);
  if (v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_8:
    self->_previewTapDelegate = 0;
    return v4;
  }
  self->_previewTapOpened = 1;
  return v4;
}

- (void)closePreviewTap
{
  uint64_t v2;
  int v4;
  int v5;
  uint64_t v6;

  if (self->_previewTapOpened)
  {
    v4 = FigCaptureSessionSetVideoPreviewTapCallback(self->_session, 0, 0);
    if (v4)
    {
      v5 = v4;
      fig_log_get_emitter();
      LODWORD(v6) = v5;
      FigDebugAssert3();
      -[FigCaptureSessionPreviewTapDelegate captureSessionPreviewTapDidClose:](self->_previewTapDelegate, "captureSessionPreviewTapDidClose:", self, v6, v2);
      self->_previewTapDelegate = 0;
      self->_previewTapOpened = 0;
    }
  }
}

@end
