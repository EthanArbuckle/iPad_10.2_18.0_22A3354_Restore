@implementation CTXPCGetSignalStrengthInfoResponse

- (CTXPCGetSignalStrengthInfoResponse)initWithSignalStrengthInfo:(id)a3
{
  id v4;
  void *v5;
  CTXPCGetSignalStrengthInfoResponse *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = CFSTR("signalInfo");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetSignalStrengthInfoResponse;
  v6 = -[CTXPCMessage initWithNamedArguments:](&v8, sel_initWithNamedArguments_, v5);

  return v6;
}

- (CTSignalStrengthInfo)signalInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("signalInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTSignalStrengthInfo>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTSignalStrengthInfo *)v4;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetSignalStrengthInfoResponse;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
