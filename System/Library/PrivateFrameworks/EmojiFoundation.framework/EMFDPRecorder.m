@implementation EMFDPRecorder

- (EMFDPRecorder)initWithEmoji:(id)a3
{
  id v5;
  EMFDPRecorder *v6;
  EMFDPRecorder *v7;
  NSLock *v8;
  NSLock *delegateLock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFDPRecorder;
  v6 = -[EMFDPRecorder init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_emoji, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    delegateLock = v7->_delegateLock;
    v7->_delegateLock = v8;

  }
  return v7;
}

- (EMFDPReportingDelegate)delegate
{
  EMFDPReportingDelegate *v3;

  -[NSLock lock](self->_delegateLock, "lock");
  v3 = self->_delegate;
  -[NSLock unlock](self->_delegateLock, "unlock");
  return v3;
}

- (void)setDelegate:(id)a3
{
  EMFDPReportingDelegate *v4;
  EMFDPReportingDelegate *delegate;
  EMFDPReportingDelegate *v6;

  v4 = (EMFDPReportingDelegate *)a3;
  -[NSLock lock](self->_delegateLock, "lock");
  delegate = self->_delegate;
  self->_delegate = v4;
  v6 = v4;

  -[NSLock unlock](self->_delegateLock, "unlock");
}

- (NSString)recordingKey
{
  return (NSString *)&stru_1E670BD50;
}

- (BOOL)report
{
  return 0;
}

- (EMFEmojiToken)emoji
{
  return (EMFEmojiToken *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEmoji:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_delegateLock, 0);
}

@end
