@implementation MLCANEDeviceOps

+ (id)deviceOpsWithType:(int)a3 params:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:params:", v4, v6);

  return v7;
}

- (MLCANEDeviceOps)initWithType:(int)a3 params:(id)a4
{
  id v7;
  MLCANEDeviceOps *v8;
  MLCANEDeviceOps *v9;
  NSArray *units;
  NSString *procedureName;
  _MLCANEModel *model;
  _ANERequest *request;
  uint64_t v14;
  NSMutableArray *constantTensors;
  _MLCANEPlistBuilder *plistBuilder;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MLCANEDeviceOps;
  v8 = -[MLCDeviceOps initWithSource:secondarySource:result:batchSize:](&v18, sel_initWithSource_secondarySource_result_batchSize_, 0, 0, 0, 1);
  v9 = v8;
  if (v8)
  {
    v8->_deviceOpType = a3;
    units = v8->_units;
    v8->_units = 0;

    objc_storeStrong(&v9->_params, a4);
    procedureName = v9->_procedureName;
    v9->_procedureName = 0;

    v9->_procedureIndex = -1;
    model = v9->_model;
    v9->_model = 0;

    request = v9->_request;
    v9->_request = 0;

    v14 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    constantTensors = v9->_constantTensors;
    v9->_constantTensors = (NSMutableArray *)v14;

    plistBuilder = v9->_plistBuilder;
    v9->_plistBuilder = 0;

  }
  return v9;
}

- (int)deviceOpType
{
  return self->_deviceOpType;
}

- (NSArray)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (id)params
{
  return self->_params;
}

- (NSString)procedureName
{
  return self->_procedureName;
}

- (void)setProcedureName:(id)a3
{
  objc_storeStrong((id *)&self->_procedureName, a3);
}

- (unint64_t)procedureIndex
{
  return self->_procedureIndex;
}

- (void)setProcedureIndex:(unint64_t)a3
{
  self->_procedureIndex = a3;
}

- (_MLCANEModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (_ANERequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSMutableArray)constantTensors
{
  return self->_constantTensors;
}

- (_MLCANEPlistBuilder)plistBuilder
{
  return self->_plistBuilder;
}

- (void)setPlistBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_plistBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistBuilder, 0);
  objc_storeStrong((id *)&self->_constantTensors, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_procedureName, 0);
  objc_storeStrong(&self->_params, 0);
  objc_storeStrong((id *)&self->_units, 0);
}

@end
