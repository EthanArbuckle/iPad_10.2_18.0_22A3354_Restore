@implementation NRParameters

- (NRParameters)init
{
  nw_parameters_t v3;
  NRParameters *v4;

  v3 = nw_parameters_create();
  v4 = -[NRParameters initWithParameters:](self, "initWithParameters:", v3);

  return v4;
}

- (NRParameters)initWithParameters:(id)a3
{
  OS_nw_parameters *v4;
  NRParameters *v5;
  NRParameters *v6;
  OS_nw_parameters *parameters;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (OS_nw_parameters *)a3;
  v20.receiver = self;
  v20.super_class = (Class)NRParameters;
  v5 = -[NRParameters init](&v20, sel_init);
  if (!v5)
  {
    v9 = nrCopyLogObj_2253();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v10 = v9;
      v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v18 = _os_log_pack_fill();
        *(_DWORD *)v18 = 136446210;
        *(_QWORD *)(v18 + 4) = "-[NRParameters initWithParameters:]";
        v19 = nrCopyLogObj_2253();
        _NRLogAbortWithPack(v19);
      }
    }
    v12 = nrCopyLogObj_2253();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  parameters = v5->_parameters;
  v5->_parameters = v4;

  return v6;
}

- (id)description
{
  id v3;
  OS_nw_parameters *parameters;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    parameters = self->_parameters;
  else
    parameters = 0;
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("NRParameters<%@>"), parameters);
}

- (void)setServiceClass:(unsigned __int8)a3
{
  NSObject *parameters;
  nw_service_class_t v4;

  self->_serviceClass = a3;
  parameters = self->_parameters;
  if ((a3 - 1) > 4)
    v4 = nw_service_class_best_effort;
  else
    v4 = dword_1DBDAAEA0[(a3 - 1)];
  nw_parameters_set_service_class(parameters, v4);
}

- (id)copyParameters
{
  if (self)
    self = (NRParameters *)self->_parameters;
  return nw_parameters_copy(&self->super);
}

- (unsigned)serviceClass
{
  return self->_serviceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
