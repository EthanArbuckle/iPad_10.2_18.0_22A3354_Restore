@implementation FTiMessageStatus

+ (id)sharedInstance
{
  if (qword_1ECF9D800 != -1)
    dispatch_once(&qword_1ECF9D800, &unk_1E4DD9410);
  return (id)qword_1ECF9D810;
}

- (id)initPrivate
{
  const char *v2;
  uint64_t v3;
  FTiMessageStatus *v4;
  uint64_t v5;
  FTServiceStatus *serviceStatus;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FTiMessageStatus;
  v4 = -[FTiMessageStatus init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_sharedInstance(FTServiceStatus, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    serviceStatus = v4->_serviceStatus;
    v4->_serviceStatus = (FTServiceStatus *)v5;

  }
  return v4;
}

- (BOOL)iMessageSupported
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_serviceStatus(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_iMessageSupported(v3, v4, v5);

  return v6;
}

- (FTServiceStatus)serviceStatus
{
  return self->_serviceStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceStatus, 0);
}

@end
