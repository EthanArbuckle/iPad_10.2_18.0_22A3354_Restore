@implementation SHSignatureAlignment

- (SHSignatureAlignment)initWithQueryRange:(id)a3 referenceRange:(id)a4 alignmentConfidence:(float)a5
{
  id v9;
  id v10;
  SHSignatureAlignment *v11;
  SHSignatureAlignment *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHSignatureAlignment;
  v11 = -[SHSignatureAlignment init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queryTimeRange, a3);
    objc_storeStrong((id *)&v12->_referenceTimeRange, a4);
    v12->_alignmentConfidence = a5;
  }

  return v12;
}

- (SHSignatureAlignment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  double v9;
  SHSignatureAlignment *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHSignatureAlignmentQueryRangeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHSignatureAlignmentReferenceRangeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("SHSignatureAlignmentConfidenceKey"));
  v8 = v7;

  LODWORD(v9) = v8;
  v10 = -[SHSignatureAlignment initWithQueryRange:referenceRange:alignmentConfidence:](self, "initWithQueryRange:referenceRange:alignmentConfidence:", v5, v6, v9);

  return v10;
}

- (SHSignatureAlignment)initWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  SHRange *v11;
  SHRange *v12;
  SHSignatureAlignment *v13;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = (_QWORD *)MEMORY[0x24BDBCAB8];
  if (v6 != 3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Signature alignment must have a query range, reference range and alignment confidence, not %@"), v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SHSignatureAlignmentQueryRangeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SHSignatureAlignmentReferenceRangeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SHSignatureAlignmentConfidenceKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count") || !objc_msgSend(v9, "count") || !v10)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v7, CFSTR("Invalid serialization format for signature alignment."));
  v11 = -[SHRange initWithSerializedRepresentation:]([SHRange alloc], "initWithSerializedRepresentation:", v8);
  v12 = -[SHRange initWithSerializedRepresentation:]([SHRange alloc], "initWithSerializedRepresentation:", v9);
  objc_msgSend(v10, "floatValue");
  v13 = -[SHSignatureAlignment initWithQueryRange:referenceRange:alignmentConfidence:](self, "initWithQueryRange:referenceRange:alignmentConfidence:", v11, v12);

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SHSignatureAlignment queryTimeRange](self, "queryTimeRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSignatureAlignment referenceTimeRange](self, "referenceTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Query: %@, Reference: %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("SHSignatureAlignmentQueryRangeKey");
  -[SHSignatureAlignment queryTimeRange](self, "queryTimeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("SHSignatureAlignmentReferenceRangeKey");
  -[SHSignatureAlignment referenceTimeRange](self, "referenceTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("SHSignatureAlignmentConfidenceKey");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[SHSignatureAlignment alignmentConfidence](self, "alignmentConfidence");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SHSignatureAlignment queryTimeRange](self, "queryTimeRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("SHSignatureAlignmentQueryRangeKey"));

  -[SHSignatureAlignment referenceTimeRange](self, "referenceTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SHSignatureAlignmentReferenceRangeKey"));

  -[SHSignatureAlignment alignmentConfidence](self, "alignmentConfidence");
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("SHSignatureAlignmentConfidenceKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  SHSignatureAlignment *v11;
  double v12;
  SHSignatureAlignment *v13;

  -[SHSignatureAlignment queryTimeRange](self, "queryTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", a3);

  -[SHSignatureAlignment referenceTimeRange](self, "referenceTimeRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);

  -[SHSignatureAlignment alignmentConfidence](self, "alignmentConfidence");
  v10 = v9;
  v11 = +[SHSignatureAlignment allocWithZone:](SHSignatureAlignment, "allocWithZone:", a3);
  LODWORD(v12) = v10;
  v13 = -[SHSignatureAlignment initWithQueryRange:referenceRange:alignmentConfidence:](v11, "initWithQueryRange:referenceRange:alignmentConfidence:", v6, v8, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v21;
  void *v22;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SHSignatureAlignment queryTimeRange](self, "queryTimeRange");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lowerBound");
  objc_msgSend(v3, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v21, "hash");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[SHSignatureAlignment queryTimeRange](self, "queryTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "upperBound");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v4;
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[SHSignatureAlignment referenceTimeRange](self, "referenceTimeRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowerBound");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[SHSignatureAlignment referenceTimeRange](self, "referenceTimeRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "upperBound");
  objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8 ^ v12 ^ objc_msgSend(v15, "hash");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[SHSignatureAlignment alignmentConfidence](self, "alignmentConfidence");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  SHSignatureAlignment *v4;
  SHSignatureAlignment *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  float v13;
  float v14;
  float v15;

  v4 = (SHSignatureAlignment *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SHSignatureAlignment queryTimeRange](self, "queryTimeRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSignatureAlignment queryTimeRange](v5, "queryTimeRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToRange:withTolerance:", v7, 0.01);

      -[SHSignatureAlignment referenceTimeRange](self, "referenceTimeRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSignatureAlignment referenceTimeRange](v5, "referenceTimeRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToRange:withTolerance:", v10, 0.01);

      v12 = 0;
      if (v8 && v11)
      {
        -[SHSignatureAlignment alignmentConfidence](self, "alignmentConfidence");
        v14 = v13;
        -[SHSignatureAlignment alignmentConfidence](v5, "alignmentConfidence");
        v12 = vabds_f32(v14, v15) < 0.01;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (SHRange)queryTimeRange
{
  return self->_queryTimeRange;
}

- (SHRange)referenceTimeRange
{
  return self->_referenceTimeRange;
}

- (float)alignmentConfidence
{
  return self->_alignmentConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTimeRange, 0);
  objc_storeStrong((id *)&self->_queryTimeRange, 0);
}

@end
