@implementation SGStructuredEventCoreMLOutputWrapper

- (SGStructuredEventCoreMLOutputWrapper)initWithLocation:(id)a3 time:(id)a4 title:(id)a5 core:(id)a6 bi_lstm_0_h_out:(id)a7 bi_lstm_0_c_out:(id)a8 bi_lstm_0_h_out_rev:(id)a9 bi_lstm_0_c_out_rev:(id)a10
{
  id v17;
  id v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v20 = a8;
  v17 = a9;
  v18 = a10;
  if (self)
  {
    objc_storeStrong((id *)&self->_location, a3);
    objc_storeStrong((id *)&self->_time, a4);
    objc_storeStrong((id *)&self->_title, a5);
    objc_storeStrong((id *)&self->_core, a6);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_out, a7);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_out, a8);
    objc_storeStrong((id *)&self->_bi_lstm_0_h_out_rev, a9);
    objc_storeStrong((id *)&self->_bi_lstm_0_c_out_rev, a10);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E7E10950);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("location")) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("time")) & 1) != 0)
  {
    v5 = 16;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v5 = 24;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("core")) & 1) != 0)
  {
    v5 = 32;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_h_out")) & 1) != 0)
  {
    v5 = 40;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_c_out")) & 1) != 0)
  {
    v5 = 48;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_h_out_rev")) & 1) != 0)
  {
    v5 = 56;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("bi_lstm_0_c_out_rev")))
    {
      v6 = 0;
      goto LABEL_18;
    }
    v5 = 64;
  }
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", *(Class *)((char *)&self->super.isa + v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v6;
}

- (MLMultiArray)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (MLMultiArray)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (MLMultiArray)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (MLMultiArray)core
{
  return self->_core;
}

- (void)setCore:(id)a3
{
  objc_storeStrong((id *)&self->_core, a3);
}

- (MLMultiArray)bi_lstm_0_h_out
{
  return self->_bi_lstm_0_h_out;
}

- (void)setBi_lstm_0_h_out:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_h_out, a3);
}

- (MLMultiArray)bi_lstm_0_c_out
{
  return self->_bi_lstm_0_c_out;
}

- (void)setBi_lstm_0_c_out:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_out, a3);
}

- (MLMultiArray)bi_lstm_0_h_out_rev
{
  return self->_bi_lstm_0_h_out_rev;
}

- (void)setBi_lstm_0_h_out_rev:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_h_out_rev, a3);
}

- (MLMultiArray)bi_lstm_0_c_out_rev
{
  return self->_bi_lstm_0_c_out_rev;
}

- (void)setBi_lstm_0_c_out_rev:(id)a3
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_out_rev, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bi_lstm_0_c_out_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_out_rev, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_c_out, 0);
  objc_storeStrong((id *)&self->_bi_lstm_0_h_out, 0);
  objc_storeStrong((id *)&self->_core, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
