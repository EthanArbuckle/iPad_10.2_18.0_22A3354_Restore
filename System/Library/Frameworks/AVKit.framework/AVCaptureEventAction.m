@implementation AVCaptureEventAction

- (AVCaptureEventAction)initWithSource:(unint64_t)a3 eventHandler:(id)a4
{
  id v6;
  AVCaptureEventAction *v7;
  AVCaptureEventAction *v8;
  uint64_t v9;
  id handler;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVCaptureEventAction;
  v7 = -[AVCaptureEventAction init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_source = a3;
    v9 = MEMORY[0x1AF43E9B8](v6);
    handler = v8->_handler;
    v8->_handler = (id)v9;

  }
  return v8;
}

- (void)sendPhaseUpdate:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[AVCaptureEvent eventWithSource:phase:](AVCaptureEvent, "eventWithSource:phase:", self->_source, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[AVCaptureEventAction sendPhaseUpdate:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending AVCaptureEvent: %@", (uint8_t *)&v7, 0x16u);

  }
  (*((void (**)(void))self->_handler + 2))();

}

- (unint64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
