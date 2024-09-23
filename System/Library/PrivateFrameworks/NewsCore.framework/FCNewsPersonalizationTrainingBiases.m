@implementation FCNewsPersonalizationTrainingBiases

void __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke_2;
  v6[3] = &unk_1E46459B0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

- (FCNewsPersonalizationTrainingBiases)initWithBiases:(id)a3
{
  id v4;
  FCNewsPersonalizationTrainingBiases *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *biases;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCNewsPersonalizationTrainingBiases;
  v5 = -[FCNewsPersonalizationTrainingBiases init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke;
    v10[3] = &unk_1E463AA78;
    v11 = v4;
    objc_msgSend(v6, "fc_dictionary:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    biases = v5->_biases;
    v5->_biases = (NSDictionary *)v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biases, 0);
}

void __54__FCNewsPersonalizationTrainingBiases_initWithBiases___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  FCNewsPersonalizationTrainingBias *v6;

  v3 = a2;
  v6 = -[FCNewsPersonalizationTrainingBias initWithDictionary:]([FCNewsPersonalizationTrainingBias alloc], "initWithDictionary:", v3);

  if (v6)
  {
    v4 = *(void **)(a1 + 32);
    -[FCNewsPersonalizationTrainingBias identifier](v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
}

+ (id)identifiersForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", v9, 0, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", v9, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v12;
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", 0, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", v9, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20[4] = v14;
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", 0, v8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[5] = v15;
  +[FCNewsPersonalizationTrainingBias identifierForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBias, "identifierForEventType:feedType:groupType:", 0, 0, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", &__block_literal_global_104);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __82__FCNewsPersonalizationTrainingBiases_identifiersForEventType_feedType_groupType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (double)biasForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FCNewsPersonalizationTrainingBiases biases](self, "biases");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    +[FCNewsPersonalizationTrainingBiases identifiersForEventType:feedType:groupType:](FCNewsPersonalizationTrainingBiases, "identifiersForEventType:feedType:groupType:", v8, v9, v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v15 = 1.0;
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[FCNewsPersonalizationTrainingBiases biases](self, "biases");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v21, "bias");
            v15 = v22;

            goto LABEL_12;
          }
        }
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v15 = 1.0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationTrainingBiases biases](self, "biases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; biases: %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSDictionary)biases
{
  return self->_biases;
}

- (void)setBiases:(id)a3
{
  objc_storeStrong((id *)&self->_biases, a3);
}

@end
