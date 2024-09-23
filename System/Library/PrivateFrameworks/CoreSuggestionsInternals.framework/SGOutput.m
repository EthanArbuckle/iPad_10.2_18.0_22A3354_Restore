@implementation SGOutput

- (SGOutput)initWithOutputItems:(id)a3 sourceMetadata:(id)a4 exeptionTemplates:(id)a5 jsMessageLogs:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SGOutput *v15;
  SGOutput *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGOutput;
  v15 = -[SGOutput init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_outputItems, a3);
    objc_storeStrong((id *)&v16->_sourceMetadata, a4);
    objc_storeStrong((id *)&v16->_exceptionTemplates, a5);
    objc_storeStrong((id *)&v16->_jsMessageLogs, a6);
  }

  return v16;
}

- (SGOutput)initWithOutputItems:(id)a3 exeptionTemplates:(id)a4 jsMessageLogs:(id)a5
{
  return -[SGOutput initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:](self, "initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:", a3, 0, a4, a5);
}

- (NSArray)outputItems
{
  return self->_outputItems;
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (NSArray)exceptionTemplates
{
  return self->_exceptionTemplates;
}

- (NSDictionary)jsMessageLogs
{
  return self->_jsMessageLogs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsMessageLogs, 0);
  objc_storeStrong((id *)&self->_exceptionTemplates, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_outputItems, 0);
}

@end
