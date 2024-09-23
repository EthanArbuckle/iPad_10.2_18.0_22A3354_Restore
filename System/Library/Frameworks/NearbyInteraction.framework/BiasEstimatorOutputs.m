@implementation BiasEstimatorOutputs

- (BiasEstimatorOutputs)initWithOuputProbabilities:(id)a3 rawRange:(double)a4 correctedRange:(double)a5
{
  id v8;
  BiasEstimatorOutputs *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BiasEstimatorOutputs;
  v9 = -[BiasEstimatorOutputs init](&v23, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          v15 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "doubleValue", (_QWORD)v19);
          objc_msgSend(v16, "numberWithDouble:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    -[BiasEstimatorOutputs setOutProbabilities:](v9, "setOutProbabilities:", v10);
    -[BiasEstimatorOutputs setRawRange:](v9, "setRawRange:", a4);
    -[BiasEstimatorOutputs setCorrectedRange:](v9, "setCorrectedRange:", a5);

  }
  return v9;
}

- (BiasEstimatorOutputs)initWithBiasEstimatorOutputs:(id)a3
{
  id v5;
  BiasEstimatorOutputs *v6;
  void *v7;
  uint64_t v8;
  NSArray *outProbabilities;
  double v10;
  double v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UWBSignalFeatures.mm"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputs"));

  }
  v14.receiver = self;
  v14.super_class = (Class)BiasEstimatorOutputs;
  v6 = -[BiasEstimatorOutputs init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "outProbabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    outProbabilities = v6->_outProbabilities;
    v6->_outProbabilities = (NSArray *)v8;

    objc_msgSend(v5, "rawRange");
    v6->_rawRange = v10;
    objc_msgSend(v5, "correctedRange");
    v6->_correctedRange = v11;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBiasEstimatorOutputs:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_outProbabilities, CFSTR("outputProbabilities"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rawRange"), self->_rawRange);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("correctedRange"), self->_correctedRange);

}

- (BiasEstimatorOutputs)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BiasEstimatorOutputs *v10;
  BiasEstimatorOutputs *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("outputProbabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rawRange"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("correctedRange"));
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)BiasEstimatorOutputs;
  v10 = -[BiasEstimatorOutputs init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[BiasEstimatorOutputs setOutProbabilities:](v10, "setOutProbabilities:", v5);
    -[BiasEstimatorOutputs setRawRange:](v11, "setRawRange:", v7);
    -[BiasEstimatorOutputs setCorrectedRange:](v11, "setCorrectedRange:", v9);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BiasEstimatorOutputs *v5;
  BiasEstimatorOutputs *v6;
  double rawRange;
  double v8;
  double v9;
  double correctedRange;
  double v11;
  double v12;
  NSArray *outProbabilities;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (BiasEstimatorOutputs *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v18 = 1;
LABEL_12:

      goto LABEL_13;
    }
    rawRange = self->_rawRange;
    -[BiasEstimatorOutputs rawRange](v5, "rawRange");
    v9 = v8;
    correctedRange = self->_correctedRange;
    -[BiasEstimatorOutputs correctedRange](v6, "correctedRange");
    v12 = v11;
    outProbabilities = self->_outProbabilities;
    if (!outProbabilities)
    {
      -[BiasEstimatorOutputs outProbabilities](v6, "outProbabilities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v16 = 1;
        goto LABEL_7;
      }
      outProbabilities = self->_outProbabilities;
    }
    -[BiasEstimatorOutputs outProbabilities](v6, "outProbabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NSArray isEqualToArray:](outProbabilities, "isEqualToArray:", v15);

LABEL_7:
    v17 = rawRange == v9;
    if (correctedRange != v12)
      v17 = 0;
    v18 = v17 & v16;
    goto LABEL_12;
  }
  v18 = 0;
LABEL_13:

  return v18;
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
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rawRange);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_correctedRange);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v6 ^ v4 ^ -[NSArray hash](self->_outProbabilities, "hash");

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  uint64_t v9;
  double correctedRange;
  double rawRange;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  for (i = 0; -[NSArray count](self->_outProbabilities, "count") > i; ++i)
  {
    -[NSArray objectAtIndex:](self->_outProbabilities, "objectAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v6, "appendFormat:", CFSTR(" out_prob_%d: %.6f,"), i, v9);

  }
  rawRange = self->_rawRange;
  correctedRange = self->_correctedRange;
  objc_msgSend(v6, "appendFormat:", CFSTR(" rawRange: %.3f,"), *(_QWORD *)&rawRange);
  objc_msgSend(v6, "appendFormat:", CFSTR(" bias_correction_estimate: %.3f,"), correctedRange - rawRange);
  objc_msgSend(v6, "appendFormat:", CFSTR(" correctedRange: %.3f>"), *(_QWORD *)&self->_correctedRange);
  return v6;
}

- (id)populateOrderedBiasEstimatorOutputs
{
  id v3;
  unint64_t i;
  void *v5;
  uint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  for (i = 0; -[NSArray count](self->_outProbabilities, "count") > i; ++i)
  {
    -[NSArray objectAtIndex:](self->_outProbabilities, "objectAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR(" %.6f, "), v6);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" %.3f, %.3f, %.3f"), *(_QWORD *)&self->_rawRange, self->_correctedRange - self->_rawRange, *(_QWORD *)&self->_correctedRange);
  return v3;
}

- (NSArray)outProbabilities
{
  return self->_outProbabilities;
}

- (void)setOutProbabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)rawRange
{
  return self->_rawRange;
}

- (void)setRawRange:(double)a3
{
  self->_rawRange = a3;
}

- (double)correctedRange
{
  return self->_correctedRange;
}

- (void)setCorrectedRange:(double)a3
{
  self->_correctedRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outProbabilities, 0);
}

@end
