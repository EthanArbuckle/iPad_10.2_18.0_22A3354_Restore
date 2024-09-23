@implementation EmbeddingPaths

- (EmbeddingPaths)initWithSrcVocabPath:(id)a3 modelPath:(id)a4 configPath:(id)a5 reformulationPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EmbeddingPaths *v15;
  EmbeddingPaths *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EmbeddingPaths;
  v15 = -[EmbeddingPaths init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_srcVocabPath, a3);
    objc_storeStrong((id *)&v16->_modelPath, a4);
    objc_storeStrong((id *)&v16->_configPath, a5);
    objc_storeStrong((id *)&v16->_reformulationPath, a6);
  }

  return v16;
}

- (NSString)srcVocabPath
{
  return self->_srcVocabPath;
}

- (NSString)modelPath
{
  return self->_modelPath;
}

- (NSString)configPath
{
  return self->_configPath;
}

- (NSString)reformulationPath
{
  return self->_reformulationPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reformulationPath, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
  objc_storeStrong((id *)&self->_srcVocabPath, 0);
}

@end
