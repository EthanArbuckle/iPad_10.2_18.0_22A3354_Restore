@implementation MADTextEmbeddingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextEmbeddingResult)initWithEmbedding:(id)a3 calibrationVersion:(id)a4 mean:(id)a5 standardDeviation:(id)a6 bias:(id)a7 scale:(id)a8 threshold:(id)a9
{
  id v16;
  id v17;
  MADTextEmbeddingResult *v18;
  MADTextEmbeddingResult *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MADTextEmbeddingResult;
  v18 = -[MADTextEmbeddingResult init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_embedding, a3);
    objc_storeStrong((id *)&v19->_calibrationVersion, a4);
    objc_storeStrong((id *)&v19->_mean, a5);
    objc_storeStrong((id *)&v19->_standardDeviation, a6);
    objc_storeStrong((id *)&v19->_bias, a7);
    objc_storeStrong((id *)&v19->_scale, a8);
    objc_storeStrong((id *)&v19->_threshold, a9);
  }

  return v19;
}

- (MADTextEmbeddingResult)initWithCoder:(id)a3
{
  id v4;
  MADTextEmbeddingResult *v5;
  uint64_t v6;
  MADEmbeddingResult *embedding;
  uint64_t v8;
  NSNumber *calibrationVersion;
  uint64_t v10;
  NSNumber *mean;
  uint64_t v12;
  NSNumber *standardDeviation;
  uint64_t v14;
  NSNumber *bias;
  uint64_t v16;
  NSNumber *scale;
  uint64_t v18;
  NSNumber *threshold;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MADTextEmbeddingResult;
  v5 = -[MADTextResult initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Embedding"));
    v6 = objc_claimAutoreleasedReturnValue();
    embedding = v5->_embedding;
    v5->_embedding = (MADEmbeddingResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CalibrationVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    calibrationVersion = v5->_calibrationVersion;
    v5->_calibrationVersion = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Mean"));
    v10 = objc_claimAutoreleasedReturnValue();
    mean = v5->_mean;
    v5->_mean = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StandardDeviation"));
    v12 = objc_claimAutoreleasedReturnValue();
    standardDeviation = v5->_standardDeviation;
    v5->_standardDeviation = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Bias"));
    v14 = objc_claimAutoreleasedReturnValue();
    bias = v5->_bias;
    v5->_bias = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Scale"));
    v16 = objc_claimAutoreleasedReturnValue();
    scale = v5->_scale;
    v5->_scale = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Threshold"));
    v18 = objc_claimAutoreleasedReturnValue();
    threshold = v5->_threshold;
    v5->_threshold = (NSNumber *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADTextEmbeddingResult;
  v4 = a3;
  -[MADTextResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_embedding, CFSTR("Embedding"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_calibrationVersion, CFSTR("CalibrationVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mean, CFSTR("Mean"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_standardDeviation, CFSTR("StandardDeviation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bias, CFSTR("Bias"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scale, CFSTR("Scale"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_threshold, CFSTR("Threshold"));

}

- (unint64_t)elementType
{
  return -[MADEmbeddingResult type](self->_embedding, "type");
}

- (unint64_t)elementCount
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  int v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[MADEmbeddingResult type](self->_embedding, "type");
  if (v3 == 2)
  {
    -[MADEmbeddingResult data](self->_embedding, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v4, "length") >> 2;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    -[MADEmbeddingResult data](self->_embedding, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v4, "length") >> 1;
LABEL_5:

    return v5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[MADEmbeddingResult type](self->_embedding, "type");
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Embedding has unknown element type (%d); cannot derive count",
      (uint8_t *)v8,
      8u);
  }
  return 0;
}

- (NSData)embeddingData
{
  return -[MADEmbeddingResult data](self->_embedding, "data");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("embedding: %@"), self->_embedding);
  if (self->_calibrationVersion)
    objc_msgSend(v3, "appendFormat:", CFSTR(", calibrationVersion: %@"), self->_calibrationVersion);
  if (self->_mean)
    objc_msgSend(v3, "appendFormat:", CFSTR(", mean: %@"), self->_mean);
  if (self->_standardDeviation)
    objc_msgSend(v3, "appendFormat:", CFSTR(", standardDeviation: %@"), self->_standardDeviation);
  if (self->_bias)
    objc_msgSend(v3, "appendFormat:", CFSTR(", bias: %@"), self->_bias);
  if (self->_scale)
    objc_msgSend(v3, "appendFormat:", CFSTR(", scale: %@"), self->_scale);
  if (self->_threshold)
    objc_msgSend(v3, "appendFormat:", CFSTR(", threshold: %@"), self->_threshold);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (MADEmbeddingResult)embedding
{
  return self->_embedding;
}

- (NSNumber)calibrationVersion
{
  return self->_calibrationVersion;
}

- (NSNumber)mean
{
  return self->_mean;
}

- (NSNumber)standardDeviation
{
  return self->_standardDeviation;
}

- (NSNumber)bias
{
  return self->_bias;
}

- (NSNumber)scale
{
  return self->_scale;
}

- (NSNumber)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_bias, 0);
  objc_storeStrong((id *)&self->_standardDeviation, 0);
  objc_storeStrong((id *)&self->_mean, 0);
  objc_storeStrong((id *)&self->_calibrationVersion, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end
