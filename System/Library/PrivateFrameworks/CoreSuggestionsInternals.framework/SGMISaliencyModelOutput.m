@implementation SGMISaliencyModelOutput

- (SGMISaliencyModelOutput)initWithData:(id)a3
{
  id v5;
  SGMISaliencyModelOutput *v6;
  SGMISaliencyModelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMISaliencyModelOutput;
  v6 = -[SGMISaliencyModelOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (double)regularScore
{
  void *v2;
  double v3;
  double v4;

  -[MLMultiArray objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", &unk_1E7E108C0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)salientScore
{
  void *v2;
  double v3;
  double v4;

  -[MLMultiArray objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", &unk_1E7E108D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (MLMultiArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
