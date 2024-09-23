@implementation ETVariablesDefinition

- (id)initForLayers:(id)a3 error:(id *)a4
{
  id v6;
  ETVariablesDefinition *v7;
  ETVariablesDefinition *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ETVariablesDefinition;
  v7 = -[ETVariablesDefinition init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_layerNames, a3);

  return v8;
}

- (NSArray)layerNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLayerNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerNames, 0);
}

@end
