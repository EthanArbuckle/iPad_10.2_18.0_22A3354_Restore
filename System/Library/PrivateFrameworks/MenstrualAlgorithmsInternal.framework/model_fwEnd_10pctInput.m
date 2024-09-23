@implementation model_fwEnd_10pctInput

- (model_fwEnd_10pctInput)initWithIn:(id)a3
{
  return -[model_fwEnd_10pctInput initWithIn:lstm_1_h_in:lstm_1_c_in:](self, "initWithIn:lstm_1_h_in:lstm_1_c_in:", a3, 0, 0);
}

- (model_fwEnd_10pctInput)initWithIn:(id)a3 lstm_1_h_in:(id)a4 lstm_1_c_in:(id)a5
{
  id v9;
  id v10;
  id v11;
  model_fwEnd_10pctInput *v12;
  model_fwEnd_10pctInput *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)model_fwEnd_10pctInput;
  v12 = -[model_fwEnd_10pctInput init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_in_, a3);
    objc_storeStrong((id *)&v13->_lstm_1_h_in, a4);
    objc_storeStrong((id *)&v13->_lstm_1_c_in, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E720BC0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("in")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("lstm_1_h_in")))
    {
      -[model_fwEnd_10pctInput lstm_1_h_in](self, "lstm_1_h_in");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = (void *)MEMORY[0x24BDBFF98];
        -[model_fwEnd_10pctInput lstm_1_h_in](self, "lstm_1_h_in");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (void *)v9;
        objc_msgSend(v8, "featureValueWithMultiArray:", v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("lstm_1_c_in")))
      {
        v7 = 0;
        goto LABEL_12;
      }
      -[model_fwEnd_10pctInput lstm_1_c_in](self, "lstm_1_c_in");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = (void *)MEMORY[0x24BDBFF98];
        -[model_fwEnd_10pctInput lstm_1_c_in](self, "lstm_1_c_in");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
  v5 = (void *)MEMORY[0x24BDBFF98];
  -[model_fwEnd_10pctInput in](self, "in");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v7;
}

- (MLMultiArray)in_
{
  return self->_in_;
}

- (void)setIn_:(id)a3
{
  objc_storeStrong((id *)&self->_in_, a3);
}

- (MLMultiArray)lstm_1_h_in
{
  return self->_lstm_1_h_in;
}

- (void)setLstm_1_h_in:(id)a3
{
  objc_storeStrong((id *)&self->_lstm_1_h_in, a3);
}

- (MLMultiArray)lstm_1_c_in
{
  return self->_lstm_1_c_in;
}

- (void)setLstm_1_c_in:(id)a3
{
  objc_storeStrong((id *)&self->_lstm_1_c_in, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lstm_1_c_in, 0);
  objc_storeStrong((id *)&self->_lstm_1_h_in, 0);
  objc_storeStrong((id *)&self->_in_, 0);
}

@end
