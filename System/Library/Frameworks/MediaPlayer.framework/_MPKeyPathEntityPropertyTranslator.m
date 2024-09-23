@implementation _MPKeyPathEntityPropertyTranslator

- (id)valueFromSource:(id)a3 context:(id)a4
{
  void (*valueTransformFunction)(_QWORD *, id, id);
  _QWORD *p_isa;

  valueTransformFunction = (void (*)(_QWORD *, id, id))self->_valueTransformFunction;
  if (valueTransformFunction)
  {
    p_isa = &self->_sourceKeyPaths->super.isa;
  }
  else
  {
    p_isa = self->_valueTransformBlock;
    valueTransformFunction = (void (*)(_QWORD *, id, id))p_isa[2];
  }
  valueTransformFunction(p_isa, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)sourceKeyPaths
{
  return self->_sourceKeyPaths;
}

- (id)valueTransformBlock
{
  return self->_valueTransformBlock;
}

- (void)valueTransformFunction
{
  return self->_valueTransformFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueTransformBlock, 0);
  objc_storeStrong((id *)&self->_sourceKeyPaths, 0);
}

+ (id)translatorForKeyPaths:(id)a3 valueTransformBlock:(id)a4
{
  NSArray *v5;
  id v6;
  _MPKeyPathEntityPropertyTranslator *v7;
  NSArray *sourceKeyPaths;
  NSArray *v9;
  uint64_t v10;
  id valueTransformBlock;

  v5 = (NSArray *)a3;
  v6 = a4;
  v7 = objc_alloc_init(_MPKeyPathEntityPropertyTranslator);
  sourceKeyPaths = v7->_sourceKeyPaths;
  v7->_sourceKeyPaths = v5;
  v9 = v5;

  v10 = MEMORY[0x19403A810](v6);
  valueTransformBlock = v7->_valueTransformBlock;
  v7->_valueTransformBlock = (id)v10;

  return v7;
}

+ (id)translatorForKeyPaths:(id)a3 valueTransformFunction:(void *)a4
{
  NSArray *v5;
  _MPKeyPathEntityPropertyTranslator *v6;
  NSArray *sourceKeyPaths;

  v5 = (NSArray *)a3;
  v6 = objc_alloc_init(_MPKeyPathEntityPropertyTranslator);
  sourceKeyPaths = v6->_sourceKeyPaths;
  v6->_sourceKeyPaths = v5;

  v6->_valueTransformFunction = a4;
  return v6;
}

@end
