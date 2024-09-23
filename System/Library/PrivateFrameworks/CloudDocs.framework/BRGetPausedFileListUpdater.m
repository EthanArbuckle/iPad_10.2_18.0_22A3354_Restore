@implementation BRGetPausedFileListUpdater

- (BRGetPausedFileListUpdater)initWithCallback:(id)a3
{
  id v4;
  BRGetPausedFileListUpdater *v5;
  uint64_t v6;
  id callback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRGetPausedFileListUpdater;
  v5 = -[BRGetPausedFileListUpdater init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1A1AD85E4](v4);
    callback = v5->_callback;
    v5->_callback = (id)v6;

  }
  return v5;
}

- (void)updatePausedFileURL:(id)a3 reply:(id)a4
{
  void (**callback)(id, id, id);

  callback = (void (**)(id, id, id))self->_callback;
  if (callback)
    callback[2](callback, a3, a4);
}

- (BRGetPausedFileListUpdater)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRGetPausedFileListUpdater;
  return -[BRGetPausedFileListUpdater init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
