@implementation ServiceHostRegistry

+ (id)sharedInstance
{
  if (qword_100063328 != -1)
    dispatch_once(&qword_100063328, &stru_1000499E8);
  return (id)qword_100063320;
}

- (NSString)registeredHostBundleId
{
  return self->_registeredHostBundleId;
}

- (void)setRegisteredHostBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_registeredHostBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredHostBundleId, 0);
}

@end
