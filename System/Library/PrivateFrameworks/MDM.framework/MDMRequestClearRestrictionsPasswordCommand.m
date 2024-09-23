@implementation MDMRequestClearRestrictionsPasswordCommand

+ (id)requestType
{
  return CFSTR("ClearRestrictionsPassword");
}

+ (unint64_t)requiredAccessRights
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestClearRestrictionsPasswordCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)request
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDMRequestClearRestrictionsPasswordCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = (void (**)(id, uint64_t))a4;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (!v5)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v11 = 0;
  v7 = objc_msgSend(v5, "clearRestrictionsPasscodeWithError:", &v11);
  v8 = v11;
  if ((v7 & 1) != 0)
  {
LABEL_5:
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)v9;
  v4[2](v4, v9);

}

@end
