@implementation _CRSPassthroughService

- (void)requestCard:(id)a3 reply:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *, _QWORD);

  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    objc_msgSend(a3, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_2550A2BD0))
      v6 = v5;
    else
      v6 = 0;
    v7[2](v7, v6, 0);

  }
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  return 0;
}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_2550A2BD0);

  return v4;
}

- (NSString)serviceIdentifier
{
  return (NSString *)CFSTR("com.apple.cardservices.PassthroughService");
}

@end
