@implementation FigCameraViewfinderSession

- (FigCameraViewfinderSession)init
{
  FigCameraViewfinderSession *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;

  v2 = -[FigCameraViewfinderSession initSubclass](self, "initSubclass");
  if (v2)
  {
    v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99778];
      v6 = (objc_class *)objc_opt_class();
      objc_msgSend(v4, "raise:format:", v5, CFSTR("*** -%@ cannot be instantiated directly, it is vended by FigCameraViewfinder!"), NSStringFromClass(v6));

      return 0;
    }
  }
  return v2;
}

- (id)initSubclass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSession;
  return -[FigCameraViewfinderSession init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderSession;
  -[FigCameraViewfinderSession dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t PIDFromAuditToken;
  void *v4;
  objc_class *v5;
  _OWORD v7[2];

  if (self)
    -[FigCameraViewfinderSession clientAuditToken](self, "clientAuditToken");
  else
    memset(v7, 0, sizeof(v7));
  PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(v7);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p pid:%d>"), NSStringFromClass(v5), self, PIDFromAuditToken);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  objc_class *v6;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  __int128 v8;

  v6 = (objc_class *)objc_opt_class();
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)_requestConcreteImplementation((objc_class *)self, a3, v6);
  *(_QWORD *)&v8 = -1;
  *((_QWORD *)&v8 + 1) = -1;
  *(_OWORD *)retstr->var0 = v8;
  *(_OWORD *)&retstr->var0[4] = v8;
  return result;
}

- (void)openPreviewStreamWithOptions:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v5);
}

- (void)closePreviewStream
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v4);
}

@end
