@implementation period_lstmOutput

- (period_lstmOutput)initWithOut:(id)a3 lstm_1_h_out:(id)a4 lstm_1_c_out:(id)a5
{
  id v9;
  id v10;
  id v11;
  period_lstmOutput *v12;
  period_lstmOutput *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)period_lstmOutput;
  v12 = -[period_lstmOutput init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_out_, a3);
    objc_storeStrong((id *)&v13->_lstm_1_h_out, a4);
    objc_storeStrong((id *)&v13->_lstm_1_c_out, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E720B18);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("out")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[period_lstmOutput out](self, "out");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("lstm_1_h_out")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[period_lstmOutput lstm_1_h_out](self, "lstm_1_h_out");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("lstm_1_c_out")))
    {
      v8 = 0;
      goto LABEL_8;
    }
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[period_lstmOutput lstm_1_c_out](self, "lstm_1_c_out");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (MLMultiArray)out_
{
  return self->_out_;
}

- (void)setOut_:(id)a3
{
  objc_storeStrong((id *)&self->_out_, a3);
}

- (MLMultiArray)lstm_1_h_out
{
  return self->_lstm_1_h_out;
}

- (void)setLstm_1_h_out:(id)a3
{
  objc_storeStrong((id *)&self->_lstm_1_h_out, a3);
}

- (MLMultiArray)lstm_1_c_out
{
  return self->_lstm_1_c_out;
}

- (void)setLstm_1_c_out:(id)a3
{
  objc_storeStrong((id *)&self->_lstm_1_c_out, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lstm_1_c_out, 0);
  objc_storeStrong((id *)&self->_lstm_1_h_out, 0);
  objc_storeStrong((id *)&self->_out_, 0);
}

@end
