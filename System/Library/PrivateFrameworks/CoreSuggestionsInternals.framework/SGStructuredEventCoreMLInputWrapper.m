@implementation SGStructuredEventCoreMLInputWrapper

- (SGStructuredEventCoreMLInputWrapper)initWithL:(id)a3 D:(id)a4 I:(id)a5 N:(id)a6 W:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v18;

  v18 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (self)
  {
    objc_storeStrong((id *)&self->_L, a3);
    objc_storeStrong((id *)&self->_D, a4);
    objc_storeStrong((id *)&self->_I, a5);
    objc_storeStrong((id *)&self->_N, a6);
    objc_storeStrong((id *)&self->_W, a7);
  }

  return self;
}

- (SGStructuredEventCoreMLInputWrapper)initWithL:(id)a3 D:(id)a4 I:(id)a5 N:(id)a6 W:(id)a7 bi_lstm_0_h_in:(id)a8 bi_lstm_0_c_in:(id)a9 bi_lstm_0_h_in_rev:(id)a10 bi_lstm_0_c_in_rev:(id)a11
{
  id v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v20 = a10;
  v18 = a11;
  if (self)
  {
    objc_storeStrong((id *)&self->_L, a3);
    objc_storeStrong((id *)&self->_D, a4);
    objc_storeStrong((id *)&self->_I, a5);
    objc_storeStrong((id *)&self->_N, a6);
    objc_storeStrong((id *)&self->_W, a7);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_in, a8);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_in, a9);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_in_rev, a10);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_in_rev, a11);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E7E107D0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("L")) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("D")) & 1) != 0)
  {
    v5 = 16;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("I")) & 1) != 0)
  {
    v5 = 24;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("N")) & 1) != 0)
  {
    v5 = 32;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("W")) & 1) != 0)
  {
    v5 = 40;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_h_in")) & 1) != 0)
  {
    v5 = 48;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_c_in")) & 1) != 0)
  {
    v5 = 56;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_h_in_rev")) & 1) != 0)
  {
    v5 = 64;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_c_in_rev")))
    {
      v6 = 0;
      goto LABEL_20;
    }
    v5 = 72;
  }
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", *(Class *)((char *)&self->super.isa + v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v6;
}

- (MLMultiArray)L
{
  return self->_L;
}

- (void)setL:(id)a3
{
  objc_storeStrong((id *)&self->_L, a3);
}

- (MLMultiArray)D
{
  return self->_D;
}

- (void)setD:(id)a3
{
  objc_storeStrong((id *)&self->_D, a3);
}

- (MLMultiArray)I
{
  return self->_I;
}

- (void)setI:(id)a3
{
  objc_storeStrong((id *)&self->_I, a3);
}

- (MLMultiArray)N
{
  return self->_N;
}

- (void)setN:(id)a3
{
  objc_storeStrong((id *)&self->_N, a3);
}

- (MLMultiArray)W
{
  return self->_W;
}

- (void)setW:(id)a3
{
  objc_storeStrong((id *)&self->_W, a3);
}

- (MLMultiArray)bi_lstm_0_h_in
{
  return self->_bi_lstm_0_h_in;
}

- (void)setBi_lstm_0_h_in:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_h_in, a3);
}

- (MLMultiArray)bi_lstm_0_c_in
{
  return self->_bi_lstm_0_c_in;
}

- (void)setBi_lstm_0_c_in:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_in, a3);
}

- (MLMultiArray)bi_lstm_0_h_in_rev
{
  return self->_bi_lstm_0_h_in_rev;
}

- (void)setBi_lstm_0_h_in_rev:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_h_in_rev, a3);
}

- (MLMultiArray)bi_lstm_0_c_in_rev
{
  return self->_bi_lstm_0_c_in_rev;
}

- (void)setBi_lstm_0_c_in_rev:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_in_rev, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_in_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_in_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_c_in, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_in, 0);
  objc_storeStrong((id *)&self->_W, 0);
  objc_storeStrong((id *)&self->_N, 0);
  objc_storeStrong((id *)&self->_I, 0);
  objc_storeStrong((id *)&self->_D, 0);
  objc_storeStrong((id *)&self->_L, 0);
}

@end
