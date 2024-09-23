@implementation MMCSPutFile

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  objc_msgSend_setCompletionBlock_(self, a2, 0, v2, v3);
  objc_msgSend_setProgressUpdateBlock_(self, v5, 0, v6, v7);
  objc_msgSend_setRegistrationBlock_(self, v8, 0, v9, v10);

  v11.receiver = self;
  v11.super_class = (Class)MMCSPutFile;
  -[MMCSSimpleFile dealloc](&v11, sel_dealloc);
}

- (void)setProgress:(double)a3
{
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;
  objc_super v11;
  objc_super v12;

  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 <= 1.0)
    v4 = a3;
  else
    v4 = 1.0;
  v12.receiver = self;
  v12.super_class = (Class)MMCSPutFile;
  -[MMCSSimpleFile progress](&v12, sel_progress);
  if (v4 != v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MMCSPutFile;
    -[MMCSSimpleFile setProgress:](&v11, sel_setProgress_, v4);
    updated = objc_msgSend_progressUpdateBlock(self, v6, v7, v8, v9);
    if (updated)
      (*(void (**)(uint64_t, MMCSPutFile *, double))(updated + 16))(updated, self, v4);
  }
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)progressUpdateBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setProgressUpdateBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)protocolVersion
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setProtocolVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSData)authRequestData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAuthRequestData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (id)registrationBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setRegistrationBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

@end
