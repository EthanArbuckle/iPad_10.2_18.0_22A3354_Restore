@implementation ATXMagicalMomentsPrediction

- (ATXMagicalMomentsPrediction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXMagicalMomentsPrediction.m"), 24, CFSTR("Do not call -init, call -initWithConfidence:bundleId:."));

  return 0;
}

- (ATXMagicalMomentsPrediction)initWithConfidence:(double)a3 predictionIdentifier:(id)a4
{
  id v6;
  ATXMagicalMomentsPrediction *v7;
  ATXMagicalMomentsPrediction *v8;
  uint64_t v9;
  NSString *predictionIdentifier;
  ATXMagicalMomentsPrediction *v11;
  objc_super v13;

  v6 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)ATXMagicalMomentsPrediction;
    v7 = -[ATXMagicalMomentsPrediction init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_confidence = a3;
      v9 = objc_msgSend(v6, "copy");
      predictionIdentifier = v8->_predictionIdentifier;
      v8->_predictionIdentifier = (NSString *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prediction: %@, Confidence: %f"), self->_predictionIdentifier, *(_QWORD *)&self->_confidence);
}

- (BOOL)isEqual:(id)a3
{
  ATXMagicalMomentsPrediction *v4;
  ATXMagicalMomentsPrediction *v5;
  double confidence;
  double v7;
  NSString *predictionIdentifier;
  void *v9;
  char v10;

  v4 = (ATXMagicalMomentsPrediction *)a3;
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
      confidence = self->_confidence;
      -[ATXMagicalMomentsPrediction confidence](v5, "confidence");
      if (confidence == v7)
      {
        predictionIdentifier = self->_predictionIdentifier;
        -[ATXMagicalMomentsPrediction predictionIdentifier](v5, "predictionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqualToString:](predictionIdentifier, "isEqualToString:", v9);

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

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[ATXMagicalMomentsPrediction confidence](self, "confidence");
  v6 = v5;
  objc_msgSend(v4, "confidence");
  if (v6 >= v7)
  {
    -[ATXMagicalMomentsPrediction confidence](self, "confidence");
    v10 = v9;
    objc_msgSend(v4, "confidence");
    v8 = v10 > v11;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_predictionIdentifier, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATXMagicalMomentsPrediction confidence](self, "confidence");
  v6 = v5;
  -[ATXMagicalMomentsPrediction predictionIdentifier](self, "predictionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithConfidence:predictionIdentifier:", v7, v6);

  return v8;
}

+ (id)convertPredictionsToPMMPredictionItems:(id)a3 reason:(unsigned int)a4 anchor:(int64_t)a5 triggerEvent:(id)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  id obj;
  uint64_t v21;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a6;
  v25 = (id)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v21 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1CAA48B6C]();
        v13 = objc_alloc(MEMORY[0x1E0D810A8]);
        objc_msgSend(v11, "predictionIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[ATXMagicalMomentsPrediction mmReasonToPMMReason:](ATXMagicalMomentsPrediction, "mmReasonToPMMReason:", a4);
        objc_msgSend((id)objc_opt_class(), "pmmMetadataForDuetEvent:", v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = +[ATXMagicalMomentsPrediction mmAnchorToPMMAnchor:](ATXMagicalMomentsPrediction, "mmAnchorToPMMAnchor:", a5);
        objc_msgSend(v11, "confidence");
        v18 = (void *)objc_msgSend(v13, "initWithBundleId:predictionSource:reason:reasonMetadata:anchorType:confidence:", v14, 2, v15, v16, v17);

        objc_msgSend(v25, "addObject:", v18);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  return v25;
}

+ (id)pmmMetadataForDuetEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "deviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v16 = *MEMORY[0x1E0D810D0];
      objc_msgSend(v3, "deviceName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v5;
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = (void **)v17;
      v8 = &v16;
LABEL_7:
      objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v14 = *MEMORY[0x1E0D810D0];
      objc_msgSend(v3, "deviceIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v5;
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = &v15;
      v8 = &v14;
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_9:
  if (v10)
    v11 = v10;
  else
    v11 = (void *)MEMORY[0x1E0C9AA70];
  v12 = v11;

  return v12;
}

+ (int64_t)mmReasonToPMMReason:(unsigned int)a3
{
  int64_t result;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;

  if ((int)a3 > 31)
  {
    v4 = 128;
    v5 = 256;
    v6 = 512;
    if (a3 != 512)
      v6 = 0;
    if (a3 != 256)
      v5 = v6;
    if (a3 != 128)
      v4 = v5;
    v7 = 32;
    v8 = 64;
    if (a3 != 64)
      v8 = 0;
    if (a3 != 32)
      v7 = v8;
    if ((int)a3 <= 127)
      return v7;
    else
      return v4;
  }
  else
  {
    result = 0;
    switch(a3)
    {
      case 1u:
        result = 1;
        break;
      case 2u:
        result = 2;
        break;
      case 3u:
      case 5u:
      case 6u:
      case 7u:
        return result;
      case 4u:
        result = 4;
        break;
      case 8u:
        result = 8;
        break;
      default:
        if (a3 == 16)
          result = 16;
        else
          result = 0;
        break;
    }
  }
  return result;
}

+ (int64_t)mmAnchorToPMMAnchor:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x13)
    return 0;
  else
    return a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *predictionIdentifier;
  id v5;

  predictionIdentifier = self->_predictionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", predictionIdentifier, CFSTR("predictionIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);

}

- (ATXMagicalMomentsPrediction)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  ATXMagicalMomentsPrediction *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXMagicalMomentsPrediction initWithConfidence:predictionIdentifier:](self, "initWithConfidence:predictionIdentifier:", v7, v6);
  return v8;
}

- (NSString)predictionIdentifier
{
  return self->_predictionIdentifier;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionIdentifier, 0);
}

@end
