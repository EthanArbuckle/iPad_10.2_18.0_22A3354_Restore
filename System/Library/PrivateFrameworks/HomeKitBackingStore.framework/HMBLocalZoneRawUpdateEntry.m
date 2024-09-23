@implementation HMBLocalZoneRawUpdateEntry

- (HMBLocalZoneRawUpdateEntry)initWithModel:(id)a3 encoded:(id)a4
{
  id v7;
  id v8;
  HMBLocalZoneRawUpdateEntry *v9;
  HMBLocalZoneRawUpdateEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBLocalZoneRawUpdateEntry;
  v9 = -[HMBLocalZoneRawUpdateEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a3);
    objc_storeStrong((id *)&v10->_encoded, a4);
  }

  return v10;
}

- (NSData)encoded
{
  return self->_encoded;
}

- (void)setEncoded:(id)a3
{
  objc_storeStrong((id *)&self->_encoded, a3);
}

- (HMBModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_encoded, 0);
}

@end
