@implementation PHASEExternalOutputStreamNodeDefinition

- (PHASEExternalOutputStreamNodeDefinition)init
{
  -[PHASEExternalOutputStreamNodeDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalOutputStreamNodeDefinition)initWithExternalOutputStreamUUID:(id)a3 mixerDefinition:(id)a4 channelLayoutTag:(unsigned int)a5 uid:(id)a6
{
  id v11;
  id v12;
  id v13;
  id *v14;
  PHASEExternalOutputStreamNodeDefinition *v15;
  uint64_t v16;
  NSNumber *targetLKFS;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PHASEExternalOutputStreamNodeDefinition;
  v14 = -[PHASEGeneratorNodeDefinition initInternal:](&v19, sel_initInternal_, v12);
  v15 = (PHASEExternalOutputStreamNodeDefinition *)v14;
  if (v14)
  {
    objc_storeStrong(v14 + 11, a3);
    v15->_channelLayoutTag = a5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
    v16 = objc_claimAutoreleasedReturnValue();
    targetLKFS = v15->_targetLKFS;
    v15->_targetLKFS = (NSNumber *)v16;

    -[PHASEDefinition setIdentifier:](v15, "setIdentifier:", v13);
  }

  return v15;
}

- (void)setTargetLKFS:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSNumber *v10;
  NSNumber *targetLKFS;
  id v12;

  v12 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v9 = PHASEGetPropertyBounded<double>(v6, v7, v8, -100.0, 0.0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  targetLKFS = self->_targetLKFS;
  self->_targetLKFS = v10;

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)channelLayoutTag
{
  return self->_channelLayoutTag;
}

- (BOOL)normalize
{
  return self->_normalize;
}

- (void)setNormalize:(BOOL)a3
{
  self->_normalize = a3;
}

- (NSNumber)targetLKFS
{
  return self->_targetLKFS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLKFS, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
