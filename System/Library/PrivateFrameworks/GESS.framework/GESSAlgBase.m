@implementation GESSAlgBase

- (GESSAlgBase)init
{
  GESSAlgBase *v2;
  GESSAlgBase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GESSAlgBase;
  v2 = -[GESSAlgBase init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GESSAlgBase setAlgStatus:](v2, "setAlgStatus:", 0);
  return v3;
}

- (BOOL)setProgressCallback:(id)a3
{
  void *v4;
  id progress_callback;

  v4 = (void *)MEMORY[0x2426215CC](a3, a2);
  progress_callback = self->_progress_callback;
  self->_progress_callback = v4;

  return 1;
}

- (BOOL)setErrorCallback:(id)a3
{
  void *v4;
  id error_callback;

  v4 = (void *)MEMORY[0x2426215CC](a3, a2);
  error_callback = self->_error_callback;
  self->_error_callback = v4;

  return 1;
}

- (id)returnReport
{
  GESSAlgReport *v3;

  v3 = objc_alloc_init(GESSAlgReport);
  if (-[GESSAlgBase algStatus](self, "algStatus") == 3)
    -[GESSAlgReport setSuccess:](v3, "setSuccess:", 1);
  return v3;
}

- (BOOL)run
{
  -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 1);
  NSLog(CFSTR("Need to override run()."));
  -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 3);
  return 1;
}

- (int)algStatus
{
  return self->algStatus;
}

- (void)setAlgStatus:(int)a3
{
  self->algStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_error_callback, 0);
  objc_storeStrong(&self->_progress_callback, 0);
}

@end
