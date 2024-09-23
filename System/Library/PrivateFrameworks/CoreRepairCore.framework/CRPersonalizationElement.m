@implementation CRPersonalizationElement

- (CRPersonalizationElement)initWithID:(id)a3 param:(id)a4 requestFunction:(id)a5 responseFunction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRPersonalizationElement *v15;
  CRPersonalizationElement *v16;
  uint64_t v17;
  id personalizationMeasurementCreator;
  uint64_t v19;
  id personalizationResponseParser;
  id data;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CRPersonalizationElement;
  v15 = -[CRPersonalizationElement init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_elementId, a3);
    objc_storeStrong(&v16->_param, a4);
    v17 = MEMORY[0x2199D1B40](v13);
    personalizationMeasurementCreator = v16->_personalizationMeasurementCreator;
    v16->_personalizationMeasurementCreator = (id)v17;

    v19 = MEMORY[0x2199D1B40](v14);
    personalizationResponseParser = v16->_personalizationResponseParser;
    v16->_personalizationResponseParser = (id)v19;

    data = v16->_data;
    v16->_data = 0;

  }
  return v16;
}

- (CRPersonalizationElement)init
{
  objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Use initWithID"));

  return 0;
}

- (NSString)elementId
{
  return self->_elementId;
}

- (void)setElementId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)param
{
  return self->_param;
}

- (void)setParam:(id)a3
{
  objc_storeStrong(&self->_param, a3);
}

- (id)personalizationMeasurementCreator
{
  return self->_personalizationMeasurementCreator;
}

- (void)setPersonalizationMeasurementCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)personalizationResponseParser
{
  return self->_personalizationResponseParser;
}

- (void)setPersonalizationResponseParser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong(&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong(&self->_personalizationResponseParser, 0);
  objc_storeStrong(&self->_personalizationMeasurementCreator, 0);
  objc_storeStrong(&self->_param, 0);
  objc_storeStrong((id *)&self->_elementId, 0);
}

@end
