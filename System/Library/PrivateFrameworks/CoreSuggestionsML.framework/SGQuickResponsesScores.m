@implementation SGQuickResponsesScores

- (SGQuickResponsesScores)initWithModelScores:(id)a3 normalizedModelScores:(id)a4
{
  id v8;
  id v9;
  SGQuickResponsesScores *v10;
  SGQuickResponsesScores *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesInference.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelScores != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SGQuickResponsesScores;
  v10 = -[SGQuickResponsesScores init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_modelScores, a3);
    objc_storeStrong((id *)&v11->_normalizedModelScores, a4);
  }

  return v11;
}

- (NSArray)modelScores
{
  return self->_modelScores;
}

- (NSArray)normalizedModelScores
{
  return self->_normalizedModelScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedModelScores, 0);
  objc_storeStrong((id *)&self->_modelScores, 0);
}

+ (id)quickResponsesScoresWithModelScores:(id)a3 normalizedModelScores:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelScores:normalizedModelScores:", v7, v6);

  return v8;
}

@end
