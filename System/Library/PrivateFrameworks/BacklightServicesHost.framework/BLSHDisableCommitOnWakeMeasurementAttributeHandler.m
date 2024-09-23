@implementation BLSHDisableCommitOnWakeMeasurementAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BLSHDisableCommitOnWakeMeasurementAttributeHandler initForService:provider:]([BLSHDisableCommitOnWakeMeasurementAttributeHandler alloc], (uint64_t)v6, v5);

  objc_msgSend(v7, "setupService");
  return v7;
}

- (id)initForService:(void *)a3 provider:
{
  id v6;
  id *v7;
  id *v8;
  objc_super v10;

  v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BLSHDisableCommitOnWakeMeasurementAttributeHandler;
    v7 = (id *)objc_msgSendSuper2(&v10, sel_initForService_, a2);
    v8 = v7;
    if (v7)
      objc_storeStrong(v7 + 6, a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)attributeClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateWithFirstEntry:(id)a3
{
  -[BLSHDisableCommitOnWakeMeasurementProvider setCommitOnWakeMeasurementDisabled:](self->_provider, "setCommitOnWakeMeasurementDisabled:", 1);
}

- (void)deactivateWithFinalEntry:(id)a3
{
  -[BLSHDisableCommitOnWakeMeasurementProvider setCommitOnWakeMeasurementDisabled:](self->_provider, "setCommitOnWakeMeasurementDisabled:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
