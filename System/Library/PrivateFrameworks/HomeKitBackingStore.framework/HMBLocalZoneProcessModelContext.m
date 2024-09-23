@implementation HMBLocalZoneProcessModelContext

- (HMBLocalZoneProcessModelContext)initWithModel:(id)a3 outputBlockRow:(id)a4 externalData:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMBLocalZoneProcessModelContext *v13;
  HMBLocalZoneProcessModelContext *v14;
  uint64_t v15;
  NSNumber *outputBlockRow;
  HMBLocalZoneProcessModelContext *v18;
  SEL v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = v11;
    v20.receiver = self;
    v20.super_class = (Class)HMBLocalZoneProcessModelContext;
    v13 = -[HMBLocalZoneProcessModelContext init](&v20, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_model, a3);
      v15 = objc_msgSend(v10, "copy");
      outputBlockRow = v14->_outputBlockRow;
      v14->_outputBlockRow = (NSNumber *)v15;

      objc_storeStrong((id *)&v14->_externalData, a5);
    }

    return v14;
  }
  else
  {
    v18 = (HMBLocalZoneProcessModelContext *)_HMFPreconditionFailure();
    return (HMBLocalZoneProcessModelContext *)-[HMBLocalZoneProcessModelContext model](v18, v19);
  }
}

- (HMBModel)model
{
  return self->_model;
}

- (NSNumber)outputBlockRow
{
  return self->_outputBlockRow;
}

- (NSData)externalData
{
  return self->_externalData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalData, 0);
  objc_storeStrong((id *)&self->_outputBlockRow, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
