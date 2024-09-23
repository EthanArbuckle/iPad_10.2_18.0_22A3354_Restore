@implementation _CBApplicationSupportServiceDelegate

- (BOOL)service:(id)a3 overrideClientInitialization:(id)a4
{
  return 1;
}

- (id)service:(id)a3 initializeClient:(id)a4
{
  if (qword_10008BE08 != -1)
    dispatch_once(&qword_10008BE08, &stru_100076250);
  return (id)qword_10008BE00;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processContextsByBundleIdentifier, 0);
}

@end
