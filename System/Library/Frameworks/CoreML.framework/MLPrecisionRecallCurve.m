@implementation MLPrecisionRecallCurve

- (MLPrecisionRecallCurve)initWithPrecisionValues:(id)a3 precisionConfidenceThresholds:(id)a4 recallValues:(id)a5 recallConfidenceThresholds:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MLPrecisionRecallCurve *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *precisionValues;
  uint64_t v21;
  NSArray *precisionConfidenceThresholds;
  uint64_t v23;
  NSArray *recallValues;
  uint64_t v25;
  NSArray *recallConfidenceThresholds;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MLPrecisionRecallCurve;
  v14 = -[MLPrecisionRecallCurve init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "count");
    v16 = (_QWORD *)MEMORY[0x1E0C99778];
    if (!v15 || (v17 = objc_msgSend(v10, "count"), v17 != objc_msgSend(v11, "count")))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v16, CFSTR("The PrecisionRecallCurves precisions have zero or mismatched lengths."));
    if (!objc_msgSend(v12, "count") || (v18 = objc_msgSend(v12, "count"), v18 != objc_msgSend(v13, "count")))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v16, CFSTR("The PrecisionRecallCurves recalls have zero or mismatched lengths."));
    v19 = objc_msgSend(v10, "copy");
    precisionValues = v14->_precisionValues;
    v14->_precisionValues = (NSArray *)v19;

    v21 = objc_msgSend(v11, "copy");
    precisionConfidenceThresholds = v14->_precisionConfidenceThresholds;
    v14->_precisionConfidenceThresholds = (NSArray *)v21;

    v23 = objc_msgSend(v12, "copy");
    recallValues = v14->_recallValues;
    v14->_recallValues = (NSArray *)v23;

    v25 = objc_msgSend(v13, "copy");
    recallConfidenceThresholds = v14->_recallConfidenceThresholds;
    v14->_recallConfidenceThresholds = (NSArray *)v25;

  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MLPrecisionRecallCurve precisionValues](self, "precisionValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PrecisionValues"));

  -[MLPrecisionRecallCurve precisionConfidenceThresholds](self, "precisionConfidenceThresholds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PrecisionConfidenceThresholds"));

  -[MLPrecisionRecallCurve recallValues](self, "recallValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("RecallValues"));

  -[MLPrecisionRecallCurve recallConfidenceThresholds](self, "recallConfidenceThresholds");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("RecallConfidenceThresholds"));

}

- (MLPrecisionRecallCurve)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  MLPrecisionRecallCurve *v8;
  uint64_t v9;
  id v10;
  NSArray *precisionValues;
  uint64_t v12;
  id v13;
  NSArray *precisionConfidenceThresholds;
  uint64_t v15;
  id v16;
  NSArray *recallValues;
  uint64_t v18;
  id v19;
  NSArray *recallConfidenceThresholds;
  MLPrecisionRecallCurve *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v4, "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v7);

  v27.receiver = self;
  v27.super_class = (Class)MLPrecisionRecallCurve;
  v8 = -[MLPrecisionRecallCurve init](&v27, sel_init);
  if (!v8)
  {
    v19 = 0;
LABEL_8:
    v21 = v8;
    goto LABEL_9;
  }
  v26 = 0;
  objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v5, CFSTR("PrecisionValues"), &v26);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v26;
  precisionValues = v8->_precisionValues;
  v8->_precisionValues = (NSArray *)v9;

  v25 = v10;
  objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v5, CFSTR("PrecisionConfidenceThresholds"), &v25);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v25;

  precisionConfidenceThresholds = v8->_precisionConfidenceThresholds;
  v8->_precisionConfidenceThresholds = (NSArray *)v12;

  v24 = v13;
  objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v5, CFSTR("RecallValues"), &v24);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v24;

  recallValues = v8->_recallValues;
  v8->_recallValues = (NSArray *)v15;

  v23 = v16;
  objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v5, CFSTR("RecallConfidenceThresholds"), &v23);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v23;

  recallConfidenceThresholds = v8->_recallConfidenceThresholds;
  v8->_recallConfidenceThresholds = (NSArray *)v18;

  if (v8->_precisionValues
    && v8->_precisionConfidenceThresholds
    && v8->_recallValues
    && v8->_recallConfidenceThresholds)
  {
    goto LABEL_8;
  }
  v21 = 0;
LABEL_9:

  return v21;
}

- (NSArray)precisionValues
{
  return self->_precisionValues;
}

- (NSArray)precisionConfidenceThresholds
{
  return self->_precisionConfidenceThresholds;
}

- (NSArray)recallValues
{
  return self->_recallValues;
}

- (NSArray)recallConfidenceThresholds
{
  return self->_recallConfidenceThresholds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recallConfidenceThresholds, 0);
  objc_storeStrong((id *)&self->_recallValues, 0);
  objc_storeStrong((id *)&self->_precisionConfidenceThresholds, 0);
  objc_storeStrong((id *)&self->_precisionValues, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
