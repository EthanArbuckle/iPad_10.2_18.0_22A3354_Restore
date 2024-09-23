@implementation CAXContextualActionsPredictionElement

- (CAXContextualActionsPredictionElement)initWithIdentifier:(id)a3 frequency:(id)a4
{
  return -[CAXContextualActionsPredictionElement initWithIdentifier:frequency:normalizedFrequency:priorTotal:](self, "initWithIdentifier:frequency:normalizedFrequency:priorTotal:", a3, a4, &unk_24DB35998, &unk_24DB35998);
}

- (CAXContextualActionsPredictionElement)initWithIdentifier:(id)a3 frequency:(id)a4 normalizedFrequency:(id)a5 priorTotal:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CAXContextualActionsPredictionElement *v15;
  CAXContextualActionsPredictionElement *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CAXContextualActionsPredictionElement;
  v15 = -[CAXContextualActionsPredictionElement init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_encodedActionIdentifier, a3);
    objc_storeStrong((id *)&v16->_frequency, a4);
    objc_storeStrong((id *)&v16->_normalizedFrequency, a5);
    objc_storeStrong((id *)&v16->_priorTotal, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  CAXContextualActionsPredictionElement *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CAXContextualActionsPredictionElement *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CAXContextualActionsPredictionElement encodedActionIdentifier](self, "encodedActionIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAXContextualActionsPredictionElement encodedActionIdentifier](v4, "encodedActionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[CAXContextualActionsPredictionElement frequency](self, "frequency");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAXContextualActionsPredictionElement frequency](v4, "frequency");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;

  -[CAXContextualActionsPredictionElement encodedActionIdentifier](self, "encodedActionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");
  -[CAXContextualActionsPredictionElement frequency](self, "frequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)(objc_msgSend(v5, "intValue") * v4);

  return v6;
}

- (NSString)encodedActionIdentifier
{
  return self->_encodedActionIdentifier;
}

- (void)setEncodedActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_encodedActionIdentifier, a3);
}

- (NSNumber)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_frequency, a3);
}

- (NSNumber)normalizedFrequency
{
  return self->_normalizedFrequency;
}

- (void)setNormalizedFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedFrequency, a3);
}

- (NSNumber)priorTotal
{
  return self->_priorTotal;
}

- (void)setPriorTotal:(id)a3
{
  objc_storeStrong((id *)&self->_priorTotal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorTotal, 0);
  objc_storeStrong((id *)&self->_normalizedFrequency, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_encodedActionIdentifier, 0);
}

@end
