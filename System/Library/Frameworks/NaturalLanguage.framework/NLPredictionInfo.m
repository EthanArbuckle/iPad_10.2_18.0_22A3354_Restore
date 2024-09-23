@implementation NLPredictionInfo

- (NLPredictionInfo)initWithPrediction:(id)a3 tokenIDArray:(id)a4 contextLength:(unint64_t)a5 probabilityInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  NLPredictionInfo *v13;
  size_t v14;
  uint64_t v15;
  NSString *prediction;
  uint64_t v17;
  NLProbabilityInfo *probabilityInfo;
  uint64_t v19;
  NSArray *tokenIDArray;
  _DWORD *v21;
  _DWORD *v22;
  uint64_t i;
  void *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NLPredictionInfo;
  v13 = -[NLPredictionInfo init](&v26, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "count");
    v15 = objc_msgSend(v10, "copy");
    prediction = v13->_prediction;
    v13->_prediction = (NSString *)v15;

    v13->_contextLength = a5;
    v17 = objc_msgSend(v12, "copy");
    probabilityInfo = v13->_probabilityInfo;
    v13->_probabilityInfo = (NLProbabilityInfo *)v17;

    v19 = objc_msgSend(v11, "copy");
    tokenIDArray = v13->_tokenIDArray;
    v13->_tokenIDArray = (NSArray *)v19;

    v13->_tokenIDs = 0;
    if (v14)
    {
      v21 = malloc_type_calloc(v14, 4uLL, 0x100004052888210uLL);
      if (v21)
      {
        v22 = v21;
        for (i = 0; i != v14; ++i)
        {
          objc_msgSend(v11, "objectAtIndex:", i);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v22[i] = objc_msgSend(v24, "unsignedIntegerValue");

        }
        v13->_tokenIDs = v22;
      }
    }
  }

  return v13;
}

- (NLPredictionInfo)initWithPrediction:(id)a3 contextLength:(unint64_t)a4 probabilityInfo:(id)a5
{
  return -[NLPredictionInfo initWithPrediction:tokenIDArray:contextLength:probabilityInfo:](self, "initWithPrediction:tokenIDArray:contextLength:probabilityInfo:", a3, MEMORY[0x1E0C9AA60], a4, a5);
}

- (NLPredictionInfo)initWithPrediction:(id)a3 probabilityInfo:(id)a4
{
  return -[NLPredictionInfo initWithPrediction:tokenIDArray:contextLength:probabilityInfo:](self, "initWithPrediction:tokenIDArray:contextLength:probabilityInfo:", a3, MEMORY[0x1E0C9AA60], 0, a4);
}

- (NLPredictionInfo)initWithPrediction:(id)a3 tokenIDs:(const unsigned int *)a4 length:(unint64_t)a5 contextLength:(unint64_t)a6 probabilityInfo:(id)a7
{
  id v12;
  id v13;
  void *i;
  unsigned int v15;
  void *v16;
  NLPredictionInfo *v17;

  v12 = a3;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a5; --a5)
  {
    v15 = *a4++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v16);

  }
  v17 = -[NLPredictionInfo initWithPrediction:tokenIDArray:contextLength:probabilityInfo:](self, "initWithPrediction:tokenIDArray:contextLength:probabilityInfo:", v12, i, a6, v13);

  return v17;
}

- (void)dealloc
{
  void *tokenIDs;
  objc_super v4;

  tokenIDs = self->_tokenIDs;
  if (tokenIDs)
    free(tokenIDs);
  v4.receiver = self;
  v4.super_class = (Class)NLPredictionInfo;
  -[NLPredictionInfo dealloc](&v4, sel_dealloc);
}

- (id)tokenIDArray
{
  return self->_tokenIDArray;
}

- (const)tokenIDs
{
  return (const unsigned int *)self->_tokenIDs;
}

- (unint64_t)tokenIDLength
{
  void *v2;
  unint64_t v3;

  -[NLPredictionInfo tokenIDArray](self, "tokenIDArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NLPredictionInfo prediction](self, "prediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPredictionInfo probabilityInfo](self, "probabilityInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[NLPredictionInfo prediction](self, "prediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NLPredictionInfo contextLength](self, "contextLength") ^ v4;
  -[NLPredictionInfo probabilityInfo](self, "probabilityInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[NLPredictionInfo tokenIDArray](self, "tokenIDArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  NLPredictionInfo *v4;
  NLPredictionInfo *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = (NLPredictionInfo *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_8;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  -[NLPredictionInfo prediction](self, "prediction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPredictionInfo prediction](v5, "prediction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqual:", v7)
    || (v8 = -[NLPredictionInfo contextLength](self, "contextLength"),
        v8 != -[NLPredictionInfo contextLength](v5, "contextLength")))
  {
LABEL_10:

    goto LABEL_11;
  }
  -[NLPredictionInfo probabilityInfo](self, "probabilityInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPredictionInfo probabilityInfo](v5, "probabilityInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v10))
  {

    goto LABEL_10;
  }
  -[NLPredictionInfo tokenIDArray](self, "tokenIDArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPredictionInfo tokenIDArray](v5, "tokenIDArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) == 0)
    goto LABEL_11;
LABEL_8:
  v14 = 1;
LABEL_12:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLPredictionInfo requires keyed coding"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  -[NLPredictionInfo prediction](self, "prediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("NLPrediction"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[NLPredictionInfo contextLength](self, "contextLength"), CFSTR("NLContextLength"));
  -[NLPredictionInfo probabilityInfo](self, "probabilityInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("NLProbabilityInfo"));

  -[NLPredictionInfo tokenIDArray](self, "tokenIDArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("NLTokenIDArray"));

}

- (NLPredictionInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NLPredictionInfo *v9;
  id v11;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLPredictionInfo requires keyed coding"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NLPrediction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NLContextLength"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NLProbabilityInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("NLTokenIDArray"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NLPredictionInfo initWithPrediction:tokenIDArray:contextLength:probabilityInfo:](self, "initWithPrediction:tokenIDArray:contextLength:probabilityInfo:", v5, v8, v6, v7);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)prediction
{
  return self->_prediction;
}

- (unint64_t)contextLength
{
  return self->_contextLength;
}

- (NLProbabilityInfo)probabilityInfo
{
  return self->_probabilityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityInfo, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_tokenIDArray, 0);
}

@end
