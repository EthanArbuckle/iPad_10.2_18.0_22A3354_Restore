@implementation SGTextLabelTransformer

- (SGTextLabelTransformer)initWithMethods:(id)a3 withLabelStrings:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SGTextLabelTransformer *v10;
  uint64_t v11;
  SGStringPreprocessingTransformer *preprocessor;
  void *v13;
  uint64_t v14;
  SGStringLabelingTransformer *labeler;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextLabelTransformer.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("methods"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextLabelTransformer.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labels"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SGTextLabelTransformer;
  v10 = -[SGTextLabelTransformer init](&v19, sel_init);
  if (v10)
  {
    +[SGStringPreprocessingTransformer withMethods:](SGStringPreprocessingTransformer, "withMethods:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    preprocessor = v10->_preprocessor;
    v10->_preprocessor = (SGStringPreprocessingTransformer *)v11;

    +[SGTextLabelTransformer _preprocessedLabelsWithLabels:andPreprocessor:](SGTextLabelTransformer, "_preprocessedLabelsWithLabels:andPreprocessor:", v9, v10->_preprocessor);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGStringLabelingTransformer withLabelStrings:](SGStringLabelingTransformer, "withLabelStrings:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    labeler = v10->_labeler;
    v10->_labeler = (SGStringLabelingTransformer *)v14;

  }
  return v10;
}

- (SGTextLabelTransformer)initWithPreprocessor:(id)a3 labeler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SGTextLabelTransformer *v11;
  SGTextLabelTransformer *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextLabelTransformer.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preprocessor"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextLabelTransformer.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labeler"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SGTextLabelTransformer;
  v11 = -[SGTextLabelTransformer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_preprocessor, a3);
    objc_storeStrong((id *)&v12->_labeler, a4);
  }

  return v12;
}

- (id)transform:(id)a3
{
  id v4;
  SGStringLabelingTransformer *labeler;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGTextLabelTransformer transform:]", "SGTextLabelTransformer.m", 71, "[input isKindOfClass:[NSString class]]");
  labeler = self->_labeler;
  -[SGStringPreprocessingTransformer transform:](self->_preprocessor, "transform:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStringLabelingTransformer transform:](labeler, "transform:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)toPlistWithChunks:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BE79AE0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithClassNameKey:", *MEMORY[0x24BE79B08]);
  v12[0] = CFSTR("PREPROCESSOR");
  objc_msgSend(v7, "writeToPlistWithObject:andChunks:", self->_preprocessor, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("LABELER");
  v13[0] = v8;
  objc_msgSend(v7, "writeToPlistWithObject:andChunks:", self->_labeler, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SGTextLabelTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SGTextLabelTransformer *v18;

  v8 = (objc_class *)MEMORY[0x24BE79AE0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  v13 = (void *)objc_msgSend(v12, "initWithClassNameKey:", *MEMORY[0x24BE79B08]);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PREPROCESSOR"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "readObjectWithPlist:chunks:context:", v14, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LABELER"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "readObjectWithPlist:chunks:context:", v16, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SGTextLabelTransformer initWithPreprocessor:labeler:](self, "initWithPreprocessor:labeler:", v15, v17);
  return v18;
}

- (BOOL)isEqualToTextLabelTransformer:(id)a3
{
  id v4;
  _QWORD *v5;
  SGStringPreprocessingTransformer *preprocessor;
  SGStringPreprocessingTransformer *v7;
  SGStringPreprocessingTransformer *v8;
  SGStringPreprocessingTransformer *v9;
  BOOL v10;
  char v11;
  SGStringLabelingTransformer *v12;
  SGStringLabelingTransformer *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  preprocessor = self->_preprocessor;
  v7 = (SGStringPreprocessingTransformer *)*((id *)v4 + 1);
  if (preprocessor == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = preprocessor;
    v10 = -[SGStringPreprocessingTransformer isEqual:](v9, "isEqual:", v8);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_labeler;
  v13 = v12;
  if (v12 == (SGStringLabelingTransformer *)v5[2])
    v11 = 1;
  else
    v11 = -[SGStringLabelingTransformer isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SGTextLabelTransformer *v4;
  SGTextLabelTransformer *v5;
  BOOL v6;

  v4 = (SGTextLabelTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGTextLabelTransformer isEqualToTextLabelTransformer:](self, "isEqualToTextLabelTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SGStringPreprocessingTransformer hash](self->_preprocessor, "hash");
  return -[SGStringLabelingTransformer hash](self->_labeler, "hash") - v3 + 32 * v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeler, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
}

+ (id)withMethods:(id)a3 withLabelStrings:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMethods:withLabelStrings:", v7, v6);

  return v8;
}

+ (id)_preprocessedLabelsWithLabels:(id)a3 andPreprocessor:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGTextLabelTransformer.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labels"));

  }
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGTextLabelTransformer.m"), 56, CFSTR("SGTextLabelTransformer: Unexpected null value for flattened labels"));

  }
  v26 = (void *)v9;
  v27 = v8;
  objc_msgSend(v8, "transformBatch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  if (objc_msgSend(v7, "count"))
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v12 + v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v20);

          ++v19;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

        }
        while (v19 < v22);
        v12 += v19;
      }
      objc_msgSend(v11, "addObject:", v16);

      ++v13;
    }
    while (v13 < objc_msgSend(v7, "count"));
  }

  return v11;
}

@end
