@implementation SGNameInversionPredictor

- (SGNameInversionPredictor)init
{
  SGNameInversionPredictor *v2;
  SGNameInversionPredictor *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSDictionary *tradToTrie;
  NSDictionary *v21;
  NSDictionary *tradToInversionRate;
  void *v23;
  double v24;
  void *v26;
  NSDictionary *v27;
  id obj;
  NSDictionary *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)SGNameInversionPredictor;
  v2 = -[SGNameInversionPredictor init](&v34, sel_init);
  if (v2)
  {
    v27 = (NSDictionary *)objc_opt_new();
    v29 = (NSDictionary *)objc_opt_new();
    v3 = v2;
    +[SGPatterns patternsForClass:](SGPatterns, "patternsForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rawValueForKey:", CFSTR("config"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traditions"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v31;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v8);
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traditions"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inversionRate"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v12, v9);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traditions"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("trieName"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pathForResource:ofType:inDirectory:", v15, CFSTR("trie"), CFSTR("Tries"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 && (v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v17)) != 0)
          {
            v19 = v18;
            -[NSDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v18, v9);
          }
          else
          {
            sgLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v36 = v9;
              v37 = 2112;
              v38 = v15;
              v39 = 2112;
              v40 = v17;
              _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "Failed to locate resource; tradition: %@, fname: %@, path: %@",
                buf,
                0x20u);
            }
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      }
      while (v6);
    }
    v2 = v3;
    tradToTrie = v3->_tradToTrie;
    v3->_tradToTrie = v27;
    v21 = v27;

    tradToInversionRate = v3->_tradToInversionRate;
    v3->_tradToInversionRate = v29;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidenceThreshold"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v3->_confidenceThreshold = v24;

  }
  return v2;
}

- (BOOL)shouldInvertFirst:(id)a3 last:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_tradToInversionRate;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (-[SGNameInversionPredictor shouldInvertFirst:last:underNamingTradition:](self, "shouldInvertFirst:last:underNamingTradition:", v6, v7, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (double)firstNameLikelihood:(id)a3 underNamingTradition:(id)a4 default:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  float v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "length") <= 0x20)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tradToTrie, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      LODWORD(v12) = objc_msgSend(v10, "payloadForString:", v8);
      if (v12 != 0.0)
        a5 = v12;
    }
    else
    {
      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v9;
        _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "failed to load trie for naming tradition; tradKey: %@",
          (uint8_t *)&v15,
          0xCu);
      }

    }
  }

  return a5;
}

- (double)inversionRateForNamingTradition:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_tradToInversionRate, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (BOOL)shouldInvertFirst:(id)a3 last:(id)a4 underNamingTradition:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  _BOOL4 v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SGNameInversionPredictor inversionRateForNamingTradition:](self, "inversionRateForNamingTradition:", v8);
  v12 = v11;
  -[SGNameInversionPredictor firstNameLikelihood:underNamingTradition:default:](self, "firstNameLikelihood:underNamingTradition:default:", v10, v8, 0.99);
  v14 = v13;

  -[SGNameInversionPredictor firstNameLikelihood:underNamingTradition:default:](self, "firstNameLikelihood:underNamingTradition:default:", v9, v8, 0.01);
  v16 = v15;

  if (v12 > 1.0 || v12 < 0.0 || v16 > 1.0 || (v14 >= 0.0 ? (v17 = v14 > 1.0) : (v17 = 1), v17 || v16 < 0.0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "double inversionProbabilityEstimate(double, double, double)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("SGNameInversionPredictor.m"), 48, CFSTR("Probabilities must be in [0, 1]"));

  }
  if (v14 == 1.0 && v16 == 1.0 || v14 == 0.0 && v16 == 0.0)
    goto LABEL_22;
  v18 = v14 == 0.0;
  if (v16 == 1.0)
    v18 = 1;
  if (v12 == 1.0 && v18)
    goto LABEL_22;
  v19 = v14 == 1.0;
  if (v16 == 0.0)
    v19 = 1;
  if (v12 == 0.0 && v19)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "double inversionProbabilityEstimate(double, double, double)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SGNameInversionPredictor.m"), 55, CFSTR("Contradictory parameters."));

  }
  return v12 * ((1.0 - v14) * v16) / ((1.0 - v12) * (v14 * (1.0 - v16)) + (1.0 - v14) * v16 * v12) >= self->_confidenceThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tradToInversionRate, 0);
  objc_storeStrong((id *)&self->_tradToTrie, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_27612 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3_27612, &__block_literal_global_27613);
  return (id)sharedInstance__pasExprOnceResult_27614;
}

+ (BOOL)shouldInvertFirst:(id)a3 last:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldInvertFirst:last:", v7, v6);

  return v9;
}

void __42__SGNameInversionPredictor_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_27614;
  sharedInstance__pasExprOnceResult_27614 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
