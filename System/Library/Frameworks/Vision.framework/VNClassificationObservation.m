@implementation VNClassificationObservation

- (VNClassificationObservation)initWithRequestRevision:(unint64_t)a3 identifier:(id)a4 confidence:(float)a5
{
  return -[VNClassificationObservation initWithRequestRevision:identifier:confidence:classificationMetrics:](self, "initWithRequestRevision:identifier:confidence:classificationMetrics:", a3, a4, 0);
}

- (VNClassificationObservation)initWithRequestRevision:(unint64_t)a3 identifier:(id)a4 confidence:(float)a5 classificationMetrics:(id)a6
{
  id v10;
  id v11;
  VNClassificationObservation *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  VisionCoreClassificationMetrics *classificationMetrics;
  double v17;
  objc_super v19;

  v10 = a4;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VNClassificationObservation;
  v12 = -[VNObservation initWithRequestRevision:](&v19, sel_initWithRequestRevision_, a3);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    classificationMetrics = v12->_classificationMetrics;
    v12->_classificationMetrics = (VisionCoreClassificationMetrics *)v15;

    *(float *)&v17 = a5;
    -[VNObservation setConfidence:](v12, "setConfidence:", v17);
  }

  return v12;
}

- (VNClassificationObservation)initWithOriginatingRequestSpecifier:(id)a3 identifier:(id)a4 confidence:(float)a5
{
  return -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](self, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", a3, a4, 0);
}

- (VNClassificationObservation)initWithOriginatingRequestSpecifier:(id)a3 identifier:(id)a4 confidence:(float)a5 classificationMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  VNClassificationObservation *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  VisionCoreClassificationMetrics *classificationMetrics;
  double v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VNClassificationObservation;
  v13 = -[VNObservation initWithOriginatingRequestSpecifier:](&v20, sel_initWithOriginatingRequestSpecifier_, v10);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v12, "copy");
    classificationMetrics = v13->_classificationMetrics;
    v13->_classificationMetrics = (VisionCoreClassificationMetrics *)v16;

    *(float *)&v18 = a5;
    -[VNObservation setConfidence:](v13, "setConfidence:", v18);
  }

  return v13;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNClassificationObservation;
  v3 = -[VNObservation hash](&v7, sel_hash);
  -[VNClassificationObservation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNClassificationObservation *v4;
  VNClassificationObservation *v5;
  void *v6;
  void *v7;
  char v8;
  VisionCoreClassificationMetrics *v9;
  int v10;
  VNOperationPointsProvider *v11;
  char v12;
  objc_super v14;

  v4 = (VNClassificationObservation *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VNClassificationObservation;
    if (-[VNObservation isEqual:](&v14, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNClassificationObservation identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNClassificationObservation identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v8 & 1) != 0
        && (v9 = self->_classificationMetrics, v10 = VisionCoreEqualOrNilObjects(), v9, v10))
      {
        v11 = self->_historicallyEncodedOperationPointsProvider;
        v12 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (VNClassificationObservation)initWithCoder:(id)a3
{
  id v4;
  VNClassificationObservation *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  VisionCoreClassificationMetrics *classificationMetrics;
  VNClassificationObservation *v11;
  VNOperationPointsProvider *v12;
  VNOperationPointsProvider *historicallyEncodedOperationPointsProvider;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNClassificationObservation;
  v5 = -[VNObservation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v7;

  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("P/R")))
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("operationPoints")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationPoints"));
      v11 = (VNClassificationObservation *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_9;
      v12 = -[VNOperationPointsProvider initWithOperationPoints:]([VNOperationPointsProvider alloc], "initWithOperationPoints:", v11);
      historicallyEncodedOperationPointsProvider = v5->_historicallyEncodedOperationPointsProvider;
      v5->_historicallyEncodedOperationPointsProvider = v12;

    }
LABEL_8:
    v11 = v5;
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("P/R"));
  v9 = objc_claimAutoreleasedReturnValue();
  classificationMetrics = v5->_classificationMetrics;
  v5->_classificationMetrics = (VisionCoreClassificationMetrics *)v9;

  if (v5->_classificationMetrics)
    goto LABEL_8;
LABEL_4:
  v11 = 0;
LABEL_9:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  VisionCoreClassificationMetrics *classificationMetrics;
  VNOperationPointsProvider *historicallyEncodedOperationPointsProvider;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNClassificationObservation;
  -[VNObservation encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  classificationMetrics = self->_classificationMetrics;
  if (classificationMetrics)
  {
    objc_msgSend(v4, "encodeObject:forKey:", classificationMetrics, CFSTR("P/R"));
  }
  else
  {
    historicallyEncodedOperationPointsProvider = self->_historicallyEncodedOperationPointsProvider;
    if (historicallyEncodedOperationPointsProvider)
    {
      v9 = 0;
      -[VNOperationPointsProvider operationPointsAndReturnError:](historicallyEncodedOperationPointsProvider, "operationPointsAndReturnError:", &v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9;
      if (v7)
        objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("operationPoints"));
      else
        objc_msgSend(v4, "failWithError:", v8);

    }
  }

}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNClassificationObservation;
  -[VNObservation vn_cloneObject](&v9, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSString copy](self->_identifier, "copy");
    v5 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v4;

    v6 = -[VisionCoreClassificationMetrics copy](self->_classificationMetrics, "copy");
    v7 = *(void **)(v3 + 104);
    *(_QWORD *)(v3 + 104) = v6;

    objc_storeStrong((id *)(v3 + 112), self->_historicallyEncodedOperationPointsProvider);
  }
  return (id)v3;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8.receiver = self;
  v8.super_class = (Class)VNClassificationObservation;
  -[VNObservation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[VNClassificationObservation identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(v3, "appendFormat:", CFSTR(" \"%@\"), v5);
  if (-[VNClassificationObservation hasPrecisionRecallCurve](self, "hasPrecisionRecallCurve"))
    objc_msgSend(v3, "appendString:", CFSTR(" (P/R)"));

  return v3;
}

- (BOOL)hasPrecisionRecallCurve
{
  return self->_classificationMetrics || self->_historicallyEncodedOperationPointsProvider != 0;
}

- (BOOL)hasMinimumRecall:(float)minimumRecall forPrecision:(float)precision
{
  VisionCoreClassificationMetrics *classificationMetrics;
  VisionCoreClassificationMetrics *v8;
  double v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  VNOperationPointsProvider *historicallyEncodedOperationPointsProvider;
  VisionCoreClassificationMetrics *v15;
  VisionCoreClassificationMetrics *v16;
  float v17;
  float v18;
  void *v19;
  double v20;
  char v22;
  float v23;
  float v24;

  classificationMetrics = self->_classificationMetrics;
  if (!classificationMetrics)
  {
    historicallyEncodedOperationPointsProvider = self->_historicallyEncodedOperationPointsProvider;
    if (!historicallyEncodedOperationPointsProvider)
      return 0;
    -[VNOperationPointsProvider operationPointsAndReturnError:](historicallyEncodedOperationPointsProvider, "operationPointsAndReturnError:", 0);
    v15 = (VisionCoreClassificationMetrics *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v15)
    {
      v16 = v15;
      -[VNObservation confidence](self, "confidence");
      v18 = v17;
      if (v17 <= 0.0)
      {
        v13 = 0;
      }
      else
      {
        -[VNClassificationObservation identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0.0;
        *(float *)&v20 = precision;
        if ((-[VisionCoreClassificationMetrics getConfidence:forClassificationIdentifier:withPrecision:error:](v16, "getConfidence:forClassificationIdentifier:withPrecision:error:", &v24, v19, 0, v20) & 1) != 0&& v18 >= v24)
        {
          if (minimumRecall <= 0.0)
          {
            v13 = 1;
          }
          else
          {
            v23 = 0.0;
            v22 = -[VisionCoreClassificationMetrics getRecall:forClassificationIdentifier:confidence:error:](v16, "getRecall:forClassificationIdentifier:confidence:error:", &v23, v19, 0);
            if (v23 >= minimumRecall)
              v13 = v22;
            else
              v13 = 0;
          }
        }
        else
        {
          v13 = 0;
        }

      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v8 = classificationMetrics;
  -[VNObservation confidence](self, "confidence");
  v10 = *(float *)&v9;
  if (*(float *)&v9 <= 0.0
    || (*(float *)&v9 = precision,
        -[VisionCoreClassificationMetrics confidenceThresholdForPrecision:](v8, "confidenceThresholdForPrecision:", v9),
        v10 < v11)
    || minimumRecall > 0.0
    && (-[VisionCoreClassificationMetrics recallOfConfidence:](v8, "recallOfConfidence:"), v12 < minimumRecall))
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)hasMinimumPrecision:(float)minimumPrecision forRecall:(float)recall
{
  VisionCoreClassificationMetrics *classificationMetrics;
  VisionCoreClassificationMetrics *v8;
  double v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  VNOperationPointsProvider *historicallyEncodedOperationPointsProvider;
  VisionCoreClassificationMetrics *v15;
  VisionCoreClassificationMetrics *v16;
  float v17;
  float v18;
  void *v19;
  double v20;
  char v22;
  float v23;
  float v24;

  classificationMetrics = self->_classificationMetrics;
  if (!classificationMetrics)
  {
    historicallyEncodedOperationPointsProvider = self->_historicallyEncodedOperationPointsProvider;
    if (!historicallyEncodedOperationPointsProvider)
      return 0;
    -[VNOperationPointsProvider operationPointsAndReturnError:](historicallyEncodedOperationPointsProvider, "operationPointsAndReturnError:", 0);
    v15 = (VisionCoreClassificationMetrics *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v15)
    {
      v16 = v15;
      -[VNObservation confidence](self, "confidence");
      v18 = v17;
      if (v17 <= 0.0)
      {
        v13 = 0;
      }
      else
      {
        -[VNClassificationObservation identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0.0;
        *(float *)&v20 = recall;
        if ((-[VisionCoreClassificationMetrics getConfidence:forClassificationIdentifier:withRecall:error:](v16, "getConfidence:forClassificationIdentifier:withRecall:error:", &v24, v19, 0, v20) & 1) != 0&& v18 >= v24)
        {
          if (minimumPrecision <= 0.0)
          {
            v13 = 1;
          }
          else
          {
            v23 = 0.0;
            v22 = -[VisionCoreClassificationMetrics getPrecision:forClassificationIdentifier:confidence:error:](v16, "getPrecision:forClassificationIdentifier:confidence:error:", &v23, v19, 0);
            if (v23 >= minimumPrecision)
              v13 = v22;
            else
              v13 = 0;
          }
        }
        else
        {
          v13 = 0;
        }

      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v8 = classificationMetrics;
  -[VNObservation confidence](self, "confidence");
  v10 = *(float *)&v9;
  if (*(float *)&v9 <= 0.0
    || (*(float *)&v9 = recall,
        -[VisionCoreClassificationMetrics confidenceThresholdForRecall:](v8, "confidenceThresholdForRecall:", v9),
        v10 < v11)
    || minimumPrecision > 0.0
    && (-[VisionCoreClassificationMetrics precisionOfConfidence:](v8, "precisionOfConfidence:"), v12 < minimumPrecision))
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v13 = 1;
LABEL_15:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (VisionCoreClassificationMetrics)classificationMetrics
{
  return self->_classificationMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicallyEncodedOperationPointsProvider, 0);
  objc_storeStrong((id *)&self->_classificationMetrics, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNClassifyImageRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
