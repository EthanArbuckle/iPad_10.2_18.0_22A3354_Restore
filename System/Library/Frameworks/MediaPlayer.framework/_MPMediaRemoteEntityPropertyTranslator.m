@implementation _MPMediaRemoteEntityPropertyTranslator

- (id)valueFromSource:(id)a3 context:(id)a4
{
  NSString *keyPath;

  keyPath = self->_keyPath;
  if (keyPath)
    objc_msgSend(a3, "valueForKeyPath:", keyPath, a4);
  else
    (*((void (**)(void))self->_valueTransformBlock + 2))();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)translatorWithBlock:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = MEMORY[0x19403A810](v4);

  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (id)translatorWithKeyPath:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)valueTransformBlock
{
  return self->_valueTransformBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueTransformBlock, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
