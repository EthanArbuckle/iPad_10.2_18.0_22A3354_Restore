@implementation LACExtractablePasswordPersistenceNullAdapter

- (id)extractPassword:(id *)a3
{
  if (a3)
  {
    -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform](self, "_serviceNotSupportedInCurrentPlatform");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)extractPasswordWithCompletion:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform](self, "_serviceNotSupportedInCurrentPlatform");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform](self, "_serviceNotSupportedInCurrentPlatform");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  if (a4)
  {
    -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform](self, "_serviceNotSupportedInCurrentPlatform", a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)_serviceNotSupportedInCurrentPlatform
{
  return +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, CFSTR("Service not available in this platform"));
}

@end
