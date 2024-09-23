@implementation ETLossDefinition

- (ETLossDefinition)initWithMode:(unint64_t)a3 inputName:(id)a4 targetName:(id)a5 lossOutputName:(id)a6
{
  id v11;
  id v12;
  id v13;
  ETLossDefinition *v14;
  ETLossDefinition *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ETLossDefinition;
  v14 = -[ETLossDefinition init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    objc_storeStrong((id *)&v14->_inputName, a4);
    objc_storeStrong((id *)&v15->_targetInputName, a5);
    objc_storeStrong((id *)&v15->_lossOutputName, a6);
  }

  return v15;
}

- (NSString)inputName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)targetInputName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)lossOutputName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)outputName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOutputName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_lossOutputName, 0);
  objc_storeStrong((id *)&self->_targetInputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

+ (id)crossEntropyLossWithInputName:(id)a3 targetInputName:(id)a4 lossOutputName:(id)a5
{
  id v7;
  id v8;
  id v9;
  ETLossDefinition *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ETLossDefinition initWithMode:inputName:targetName:lossOutputName:]([ETLossDefinition alloc], "initWithMode:inputName:targetName:lossOutputName:", 1, v9, v8, v7);

  return v10;
}

+ (id)L2LossWithInputName:(id)a3 targetInputName:(id)a4 lossOutputName:(id)a5
{
  id v7;
  id v8;
  id v9;
  ETLossDefinition *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ETLossDefinition initWithMode:inputName:targetName:lossOutputName:]([ETLossDefinition alloc], "initWithMode:inputName:targetName:lossOutputName:", 2, v9, v8, v7);

  return v10;
}

+ (id)BuiltInLoss:(id)a3
{
  id v3;
  ETLossDefinition *v4;

  v3 = a3;
  v4 = -[ETLossDefinition initWithMode:inputName:targetName:lossOutputName:]([ETLossDefinition alloc], "initWithMode:inputName:targetName:lossOutputName:", 3, 0, 0, v3);

  return v4;
}

@end
