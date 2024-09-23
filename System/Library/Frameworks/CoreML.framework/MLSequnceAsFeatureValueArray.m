@implementation MLSequnceAsFeatureValueArray

- (id)initWrappingSequence:(id)a3
{
  id v5;
  MLSequnceAsFeatureValueArray *v6;
  MLSequnceAsFeatureValueArray *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLSequnceAsFeatureValueArray;
  v6 = -[MLSequnceAsFeatureValueArray init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sequence, a3);

  return v7;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[MLSequence values](self->_sequence, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  MLFeatureType v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[MLSequence type](self->_sequence, "type");
  -[MLSequence values](self->_sequence, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureValue featureValueOfType:fromObject:error:](MLFeatureValue, "featureValueOfType:fromObject:error:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MLSequence)sequence
{
  return self->_sequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
