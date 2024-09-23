@implementation IRMiloLslPredictionDO

- (id)exportAsDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  IRMiloLslPredictionDO *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[IRMiloLslPredictionDO predictionId](self, "predictionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("predictionId"));

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = self;
  -[IRMiloLslPredictionDO scores](self, "scores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v11, "score");
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("score"));

        objc_msgSend(v11, "eventID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("eventID"));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v5, CFSTR("scores"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[IRMiloLslPredictionDO miLoServiceQuality](v20, "miLoServiceQuality"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("miLoServiceQuality"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[IRMiloLslPredictionDO miLoServiceQualityReasonBitmap](v20, "miLoServiceQualityReasonBitmap"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("miLoServiceQualityReasonBitmap"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[IRMiloLslPredictionDO confidence](v20, "confidence"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("miLoPredictionConfidence"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[IRMiloLslPredictionDO confidenceReasonBitmap](v20, "confidenceReasonBitmap"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, CFSTR("miLoPredictionConfidenceReasonsBitmap"));

  return v21;
}

- (double)scoreForPredictionId:(id)a3 andLabel:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = 0.0;
  if (-[IRMiloLslPredictionDO canUse](self, "canUse"))
  {
    -[IRMiloLslPredictionDO predictionId](self, "predictionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v6);

    v8 = 1.0;
    if ((v10 & 1) == 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[IRMiloLslPredictionDO scores](self, "scores", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v8 = 0.0;
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v16, "eventID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v7);

            if ((v18 & 1) != 0)
            {
              objc_msgSend(v16, "score");
              v8 = v19;
              goto LABEL_13;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

  return v8;
}

- (BOOL)canLabel
{
  return +[IRMiLoProvider isConfidenceValid:](IRMiLoProvider, "isConfidenceValid:", -[IRMiloLslPredictionDO confidence](self, "confidence"));
}

- (BOOL)canUse
{
  void *v3;
  BOOL v4;

  if (!+[IRMiLoProvider isConfidenceValid:](IRMiLoProvider, "isConfidenceValid:", -[IRMiloLslPredictionDO confidence](self, "confidence"))|| !+[IRMiLoProvider isQualityValid:](IRMiLoProvider, "isQualityValid:", -[IRMiloLslPredictionDO miLoServiceQuality](self, "miLoServiceQuality")))
  {
    return 0;
  }
  -[IRMiloLslPredictionDO scores](self, "scores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isInMotion
{
  return +[IRMiLoProvider isInMotion:](IRMiLoProvider, "isInMotion:", -[IRMiloLslPredictionDO confidenceReasonBitmap](self, "confidenceReasonBitmap"));
}

- (BOOL)isTemporarilyUnavailable
{
  void *v3;
  _BOOL4 v4;

  if (+[IRMiLoProvider isQualityValid:](IRMiLoProvider, "isQualityValid:", -[IRMiloLslPredictionDO miLoServiceQuality](self, "miLoServiceQuality")))
  {
    -[IRMiloLslPredictionDO scores](self, "scores");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = !+[IRMiLoProvider isConfidenceValid:](IRMiLoProvider, "isConfidenceValid:", -[IRMiloLslPredictionDO confidence](self, "confidence"));
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (IRMiloLslPredictionDO)initWithPredictionId:(id)a3 miLoServiceQuality:(int64_t)a4 miLoServiceQualityReasonBitmap:(int64_t)a5 scores:(id)a6 nearbyDevices:(id)a7 predictionTime:(id)a8 confidence:(int64_t)a9 confidenceReasonBitmap:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  IRMiloLslPredictionDO *v20;
  IRMiloLslPredictionDO *v21;
  objc_super v24;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IRMiloLslPredictionDO;
  v20 = -[IRMiloLslPredictionDO init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_predictionId, a3);
    v21->_miLoServiceQuality = a4;
    v21->_miLoServiceQualityReasonBitmap = a5;
    objc_storeStrong((id *)&v21->_scores, a6);
    objc_storeStrong((id *)&v21->_nearbyDevices, a7);
    objc_storeStrong((id *)&v21->_predictionTime, a8);
    v21->_confidence = a9;
    v21->_confidenceReasonBitmap = a10;
  }

  return v21;
}

+ (IRMiloLslPredictionDO)miloLslPredictionDOWithPredictionId:(id)a3 miLoServiceQuality:(int64_t)a4 miLoServiceQualityReasonBitmap:(int64_t)a5 scores:(id)a6 nearbyDevices:(id)a7 predictionTime:(id)a8 confidence:(int64_t)a9 confidenceReasonBitmap:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v19, a4, a5, v18, v17, v16, a9, a10);

  return (IRMiloLslPredictionDO *)v20;
}

- (id)copyWithReplacementPredictionId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v4, self->_miLoServiceQuality, self->_miLoServiceQualityReasonBitmap, self->_scores, self->_nearbyDevices, self->_predictionTime, self->_confidence, self->_confidenceReasonBitmap);

  return v5;
}

- (id)copyWithReplacementMiLoServiceQuality:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", self->_predictionId, a3, self->_miLoServiceQualityReasonBitmap, self->_scores, self->_nearbyDevices, self->_predictionTime, self->_confidence, self->_confidenceReasonBitmap);
}

- (id)copyWithReplacementMiLoServiceQualityReasonBitmap:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", self->_predictionId, self->_miLoServiceQuality, a3, self->_scores, self->_nearbyDevices, self->_predictionTime, self->_confidence, self->_confidenceReasonBitmap);
}

- (id)copyWithReplacementScores:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", self->_predictionId, self->_miLoServiceQuality, self->_miLoServiceQualityReasonBitmap, v4, self->_nearbyDevices, self->_predictionTime, self->_confidence, self->_confidenceReasonBitmap);

  return v5;
}

- (id)copyWithReplacementNearbyDevices:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", self->_predictionId, self->_miLoServiceQuality, self->_miLoServiceQualityReasonBitmap, self->_scores, v4, self->_predictionTime, self->_confidence, self->_confidenceReasonBitmap);

  return v5;
}

- (id)copyWithReplacementPredictionTime:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", self->_predictionId, self->_miLoServiceQuality, self->_miLoServiceQualityReasonBitmap, self->_scores, self->_nearbyDevices, v4, self->_confidence, self->_confidenceReasonBitmap);

  return v5;
}

- (id)copyWithReplacementConfidence:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", self->_predictionId, self->_miLoServiceQuality, self->_miLoServiceQualityReasonBitmap, self->_scores, self->_nearbyDevices, self->_predictionTime, a3, self->_confidenceReasonBitmap);
}

- (id)copyWithReplacementConfidenceReasonBitmap:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", self->_predictionId, self->_miLoServiceQuality, self->_miLoServiceQualityReasonBitmap, self->_scores, self->_nearbyDevices, self->_predictionTime, self->_confidence, a3);
}

- (BOOL)isEqualToMiloLslPredictionDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *predictionId;
  void *v10;
  int v11;
  int64_t miLoServiceQuality;
  int64_t miLoServiceQualityReasonBitmap;
  int v14;
  void *v15;
  int v16;
  NSSet *scores;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  NSSet *nearbyDevices;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  NSDate *predictionTime;
  void *v30;
  int v31;
  int64_t confidence;
  int64_t confidenceReasonBitmap;
  BOOL v34;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_18;
  v6 = self->_predictionId != 0;
  objc_msgSend(v4, "predictionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_18;
  predictionId = self->_predictionId;
  if (predictionId)
  {
    objc_msgSend(v5, "predictionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](predictionId, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  miLoServiceQuality = self->_miLoServiceQuality;
  if (miLoServiceQuality != objc_msgSend(v5, "miLoServiceQuality"))
    goto LABEL_18;
  miLoServiceQualityReasonBitmap = self->_miLoServiceQualityReasonBitmap;
  if (miLoServiceQualityReasonBitmap != objc_msgSend(v5, "miLoServiceQualityReasonBitmap"))
    goto LABEL_18;
  v14 = self->_scores != 0;
  objc_msgSend(v5, "scores");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v14 == v16)
    goto LABEL_18;
  scores = self->_scores;
  if (scores)
  {
    objc_msgSend(v5, "scores");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NSSet isEqual:](scores, "isEqual:", v18);

    if (!v19)
      goto LABEL_18;
  }
  v20 = self->_nearbyDevices != 0;
  objc_msgSend(v5, "nearbyDevices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v20 == v22)
    goto LABEL_18;
  nearbyDevices = self->_nearbyDevices;
  if (nearbyDevices)
  {
    objc_msgSend(v5, "nearbyDevices");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[NSSet isEqual:](nearbyDevices, "isEqual:", v24);

    if (!v25)
      goto LABEL_18;
  }
  v26 = self->_predictionTime != 0;
  objc_msgSend(v5, "predictionTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (v26 == v28)
    goto LABEL_18;
  predictionTime = self->_predictionTime;
  if (predictionTime)
  {
    objc_msgSend(v5, "predictionTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[NSDate isEqual:](predictionTime, "isEqual:", v30);

    if (!v31)
      goto LABEL_18;
  }
  confidence = self->_confidence;
  if (confidence != objc_msgSend(v5, "confidence"))
  {
LABEL_18:
    v34 = 0;
  }
  else
  {
    confidenceReasonBitmap = self->_confidenceReasonBitmap;
    v34 = confidenceReasonBitmap == objc_msgSend(v5, "confidenceReasonBitmap");
  }

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  IRMiloLslPredictionDO *v4;
  IRMiloLslPredictionDO *v5;
  BOOL v6;

  v4 = (IRMiloLslPredictionDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRMiloLslPredictionDO isEqualToMiloLslPredictionDO:](self, "isEqualToMiloLslPredictionDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  v3 = -[NSString hash](self->_predictionId, "hash");
  v4 = self->_miLoServiceQuality - v3 + 32 * v3;
  v5 = self->_miLoServiceQualityReasonBitmap - v4 + 32 * v4;
  v6 = -[NSSet hash](self->_scores, "hash") - v5 + 32 * v5;
  v7 = -[NSSet hash](self->_nearbyDevices, "hash") - v6 + 32 * v6;
  v8 = -[NSDate hash](self->_predictionTime, "hash");
  v9 = self->_confidence - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  return self->_confidenceReasonBitmap - v9 + 32 * v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiloLslPredictionDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IRMiloLslPredictionDO *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString **v33;
  uint64_t *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRMiloLslPredictionDO key \"predictionId\" (expected %@, decoded %@)"), v7, v9, 0);
      v61 = *MEMORY[0x24BDD0FC8];
      v62[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiloLslPredictionDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);

LABEL_4:
      v13 = 0;
LABEL_38:

      goto LABEL_39;
    }
  }
  else
  {
    objc_msgSend(v4, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_17;
  }
  v15 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("miLoServiceQuality"));
  if (!v15)
  {
    objc_msgSend(v4, "error");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      goto LABEL_17;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("miLoServiceQuality")) & 1) == 0)
    {
      v59 = *MEMORY[0x24BDD0FC8];
      v60 = CFSTR("Missing serialized value for IRMiloLslPredictionDO.miLoServiceQuality");
      v32 = (void *)MEMORY[0x24BDBCE70];
      v33 = &v60;
      v34 = &v59;
      goto LABEL_29;
    }
  }
  v16 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("miLoServiceQualityReasonBitmap"));
  if (v16)
  {
LABEL_8:
    v17 = objc_alloc(MEMORY[0x24BDBCF20]);
    v18 = objc_opt_class();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("scores"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v4, "error");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        v13 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    v20 = objc_alloc(MEMORY[0x24BDBCF20]);
    v21 = objc_opt_class();
    v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("nearbyDevices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v4, "error");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
        goto LABEL_4;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionTime"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRMiloLslPredictionDO key \"predictionTime\" (expected %@, decoded %@)"), v49, v26, 0);
        v55 = *MEMORY[0x24BDD0FC8];
        v56 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v28 = v23;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiloLslPredictionDOOCNTErrorDomain"), 3, v29);
        objc_msgSend(v4, "failWithError:", v30);

        v23 = v28;
LABEL_23:
        v13 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
        goto LABEL_23;
    }
    v50 = v23;
    v39 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("confidence"));
    if (!v39)
    {
      objc_msgSend(v4, "error");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
        goto LABEL_36;
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("confidence")) & 1) == 0)
      {
        v53 = *MEMORY[0x24BDD0FC8];
        v54 = CFSTR("Missing serialized value for IRMiloLslPredictionDO.confidence");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiloLslPredictionDOOCNTErrorDomain"), 1, v42);
        objc_msgSend(v4, "failWithError:", v43);

        goto LABEL_36;
      }
    }
    v40 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("confidenceReasonBitmap"));
    if (v40)
    {
LABEL_26:
      v48 = v40;
      v23 = v50;
      self = -[IRMiloLslPredictionDO initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:](self, "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v5, v15, v16, v7, v9, v50, v39, v48);
      v13 = self;
      goto LABEL_37;
    }
    objc_msgSend(v4, "error");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("confidenceReasonBitmap")) & 1) != 0)
        goto LABEL_26;
      v51 = *MEMORY[0x24BDD0FC8];
      v52 = CFSTR("Missing serialized value for IRMiloLslPredictionDO.confidenceReasonBitmap");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiloLslPredictionDOOCNTErrorDomain"), 1, v45);
      objc_msgSend(v4, "failWithError:", v46);

    }
LABEL_36:
    v13 = 0;
    v23 = v50;
    goto LABEL_37;
  }
  objc_msgSend(v4, "error");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("miLoServiceQualityReasonBitmap")) & 1) != 0)
      goto LABEL_8;
    v57 = *MEMORY[0x24BDD0FC8];
    v58 = CFSTR("Missing serialized value for IRMiloLslPredictionDO.miLoServiceQualityReasonBitmap");
    v32 = (void *)MEMORY[0x24BDBCE70];
    v33 = &v58;
    v34 = &v57;
LABEL_29:
    objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiloLslPredictionDOOCNTErrorDomain"), 1, v7);
    objc_msgSend(v4, "failWithError:", v9);
    goto LABEL_4;
  }
LABEL_17:
  v13 = 0;
LABEL_40:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *predictionId;
  NSSet *scores;
  NSSet *nearbyDevices;
  NSDate *predictionTime;
  void *v9;
  id v10;

  v4 = a3;
  predictionId = self->_predictionId;
  v10 = v4;
  if (predictionId)
  {
    objc_msgSend(v4, "encodeObject:forKey:", predictionId, CFSTR("predictionId"));
    v4 = v10;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_miLoServiceQuality, CFSTR("miLoServiceQuality"));
  objc_msgSend(v10, "encodeInt64:forKey:", self->_miLoServiceQualityReasonBitmap, CFSTR("miLoServiceQualityReasonBitmap"));
  scores = self->_scores;
  if (scores)
    objc_msgSend(v10, "encodeObject:forKey:", scores, CFSTR("scores"));
  nearbyDevices = self->_nearbyDevices;
  if (nearbyDevices)
    objc_msgSend(v10, "encodeObject:forKey:", nearbyDevices, CFSTR("nearbyDevices"));
  predictionTime = self->_predictionTime;
  v9 = v10;
  if (predictionTime)
  {
    objc_msgSend(v10, "encodeObject:forKey:", predictionTime, CFSTR("predictionTime"));
    v9 = v10;
  }
  objc_msgSend(v9, "encodeInt64:forKey:", self->_confidence, CFSTR("confidence"));
  objc_msgSend(v10, "encodeInt64:forKey:", self->_confidenceReasonBitmap, CFSTR("confidenceReasonBitmap"));

}

- (id)description
{
  id v3;
  NSString *predictionId;
  void *v5;
  void *v6;
  NSDate *predictionTime;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  predictionId = self->_predictionId;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_miLoServiceQuality);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_miLoServiceQualityReasonBitmap);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&self->_scores;
  predictionTime = self->_predictionTime;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_confidence);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_confidenceReasonBitmap);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<IRMiloLslPredictionDO | predictionId:%@ miLoServiceQuality:%@ miLoServiceQualityReasonBitmap:%@ scores:%@ nearbyDevices:%@ predictionTime:%@ confidence:%@ confidenceReasonBitmap:%@>"), predictionId, v5, v6, v12, predictionTime, v8, v9);

  return v10;
}

- (NSString)predictionId
{
  return self->_predictionId;
}

- (int64_t)miLoServiceQuality
{
  return self->_miLoServiceQuality;
}

- (int64_t)miLoServiceQualityReasonBitmap
{
  return self->_miLoServiceQualityReasonBitmap;
}

- (NSSet)scores
{
  return self->_scores;
}

- (NSSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (NSDate)predictionTime
{
  return self->_predictionTime;
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (int64_t)confidenceReasonBitmap
{
  return self->_confidenceReasonBitmap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionTime, 0);
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_predictionId, 0);
}

@end
