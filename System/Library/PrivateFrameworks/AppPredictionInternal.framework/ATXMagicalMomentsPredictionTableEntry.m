@implementation ATXMagicalMomentsPredictionTableEntry

- (ATXMagicalMomentsPredictionTableEntry)initWithPrediction:(id)a3 applicablePredicates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ATXMagicalMomentsPredictionTableEntry *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "compoundPredicateFromPredicateArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXMagicalMomentsPredictionTableEntry initWithPrediction:applicableCompoundPredicate:](self, "initWithPrediction:applicableCompoundPredicate:", v6, v9);

    v10 = self;
  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXMagicalMomentsPredictionTableEntry initWithPrediction:applicablePredicates:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (ATXMagicalMomentsPredictionTableEntry)initWithPrediction:(id)a3 applicableCompoundPredicate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ATXMagicalMomentsPredictionTableEntry *v10;
  id *p_isa;
  ATXMagicalMomentsPredictionTableEntry *v12;
  NSObject *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)ATXMagicalMomentsPredictionTableEntry;
    v10 = -[ATXMagicalMomentsPredictionTableEntry init](&v15, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_prediction, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXMagicalMomentsPredictionTableEntry initWithPrediction:applicableCompoundPredicate:].cold.1();

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXMagicalMomentsPrediction predictionIdentifier](self->_prediction, "predictionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMagicalMomentsPrediction confidence](self->_prediction, "confidence");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Prediction: %@, Confidence: %f, Predicate: %@"), v4, v5, self->_compoundPredicate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXMagicalMomentsPredictionTableEntry *v4;
  ATXMagicalMomentsPredictionTableEntry *v5;
  ATXMagicalMomentsPrediction *prediction;
  void *v7;
  NSCompoundPredicate *compoundPredicate;
  void *v9;
  char v10;

  v4 = (ATXMagicalMomentsPredictionTableEntry *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      prediction = self->_prediction;
      -[ATXMagicalMomentsPredictionTableEntry prediction](v5, "prediction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ATXMagicalMomentsPrediction isEqual:](prediction, "isEqual:", v7))
      {
        compoundPredicate = self->_compoundPredicate;
        -[ATXMagicalMomentsPredictionTableEntry compoundPredicate](v5, "compoundPredicate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSCompoundPredicate isEqual:](compoundPredicate, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return -[ATXMagicalMomentsPrediction hash](self->_prediction, "hash");
}

+ (id)compoundPredicateFromPredicateArray:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXMagicalMomentsPredictionTable.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicateArray"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXMagicalMomentsPrediction *prediction;
  id v5;

  prediction = self->_prediction;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", prediction, CFSTR("prediction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compoundPredicate, CFSTR("compoundPredicate"));

}

- (ATXMagicalMomentsPredictionTableEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXMagicalMomentsPredictionTableEntry *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prediction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compoundPredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXMagicalMomentsPredictionTableEntry initWithPrediction:applicableCompoundPredicate:](self, "initWithPrediction:applicableCompoundPredicate:", v5, v6);
  return v7;
}

- (ATXMagicalMomentsPrediction)prediction
{
  return self->_prediction;
}

- (NSCompoundPredicate)compoundPredicate
{
  return self->_compoundPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundPredicate, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
}

- (void)initWithPrediction:applicablePredicates:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXMM: Failed to create a prediction table entry because either the prediction or applicablePredicates was empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithPrediction:applicableCompoundPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXMM: Failed to create a prediction table entry because either the prediction or applicableCompoundPredicate was empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
