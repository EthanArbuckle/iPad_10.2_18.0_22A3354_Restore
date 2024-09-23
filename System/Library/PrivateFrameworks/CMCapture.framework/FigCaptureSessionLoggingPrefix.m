@implementation FigCaptureSessionLoggingPrefix

- (char)initWithClientAuditToken:(uint64_t)a3 captureSession:
{
  char *v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  objc_super v10;
  _OWORD v11[4];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)FigCaptureSessionLoggingPrefix;
  v5 = (char *)objc_msgSendSuper2(&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    *((_QWORD *)v5 + 6) = a3;
    pthread_rwlock_init((pthread_rwlock_t *)(v5 + 56), 0);
    v8 = *a2;
    v7 = a2[1];
    v11[2] = v8;
    v11[3] = v7;
    *(_OWORD *)(v6 + 8) = v8;
    *(_OWORD *)(v6 + 24) = v7;
    v11[0] = v8;
    v11[1] = v7;
    *((_DWORD *)v6 + 10) = FigCaptureGetPIDFromAuditToken(v11);
    objc_msgSend(v6, "_updateLoggingPrefix");
    objc_msgSend(v6, "_updateLoggingPrefix");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->_stringValueLock);

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionLoggingPrefix;
  -[FigCaptureSessionLoggingPrefix dealloc](&v3, sel_dealloc);
}

- (void)_updateLoggingPrefix
{
  __int128 v3;
  __CFString *v4;
  void *v5;
  NSString *stringValue;
  _OWORD v7[2];

  if (self->_clientPIDUsedForLoggingPrefix != self->_clientPID)
  {
    v3 = *(_OWORD *)&self->_clientAuditToken.val[4];
    v7[0] = *(_OWORD *)self->_clientAuditToken.val;
    v7[1] = v3;
    v4 = (__CFString *)FigCaptureCopyClientCodeSigningIdentifier(v7);
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p[%d][%@]>"), self->_captureSession, self->_clientPID, v4);

    pthread_rwlock_wrlock(&self->_stringValueLock);
    stringValue = self->_stringValue;
    self->_stringValue = (NSString *)v5;
    pthread_rwlock_unlock(&self->_stringValueLock);
    self->_clientPIDUsedForLoggingPrefix = self->_clientPID;

  }
}

- (id)description
{
  _opaque_pthread_rwlock_t *p_stringValueLock;
  NSString *v4;

  p_stringValueLock = &self->_stringValueLock;
  pthread_rwlock_rdlock(&self->_stringValueLock);
  v4 = self->_stringValue;
  pthread_rwlock_unlock(p_stringValueLock);
  return v4;
}

@end
