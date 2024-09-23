@implementation MLABOutput

- (MLABOutput)initWithIdentity:(id)a3 LTM_output_E:(id)a4 Identity_10:(id)a5 Identity_11:(id)a6 Identity_12:(id)a7 Identity_13:(id)a8 Identity_14:(id)a9 LTM_output_L:(id)a10 LTM_output_S:(id)a11 Identity_4:(id)a12 Identity_5:(id)a13 STM_output_E:(id)a14 STM_output_L:(id)a15 STM_output_S:(id)a16 Identity_9:(id)a17
{
  MLABOutput *v17;
  MLABOutput *v19;
  objc_super v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id location[2];
  MLABOutput *v41;

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = 0;
  objc_storeStrong(&v39, a4);
  v38 = 0;
  objc_storeStrong(&v38, a5);
  v37 = 0;
  objc_storeStrong(&v37, a6);
  v36 = 0;
  objc_storeStrong(&v36, a7);
  v35 = 0;
  objc_storeStrong(&v35, a8);
  v34 = 0;
  objc_storeStrong(&v34, a9);
  v33 = 0;
  objc_storeStrong(&v33, a10);
  v32 = 0;
  objc_storeStrong(&v32, a11);
  v31 = 0;
  objc_storeStrong(&v31, a12);
  v30 = 0;
  objc_storeStrong(&v30, a13);
  v29 = 0;
  objc_storeStrong(&v29, a14);
  v28 = 0;
  objc_storeStrong(&v28, a15);
  v27 = 0;
  objc_storeStrong(&v27, a16);
  v26 = 0;
  objc_storeStrong(&v26, a17);
  v17 = v41;
  v41 = 0;
  v25.receiver = v17;
  v25.super_class = (Class)MLABOutput;
  v41 = -[MLABOutput init](&v25, sel_init);
  objc_storeStrong((id *)&v41, v41);
  if (v41)
  {
    objc_storeStrong((id *)&v41->_Identity, location[0]);
    objc_storeStrong((id *)&v41->_LTM_output_E, v39);
    objc_storeStrong((id *)&v41->_Identity_10, v38);
    objc_storeStrong((id *)&v41->_Identity_11, v37);
    objc_storeStrong((id *)&v41->_Identity_12, v36);
    objc_storeStrong((id *)&v41->_Identity_13, v35);
    objc_storeStrong((id *)&v41->_Identity_14, v34);
    objc_storeStrong((id *)&v41->_LTM_output_L, v33);
    objc_storeStrong((id *)&v41->_LTM_output_S, v32);
    objc_storeStrong((id *)&v41->_Identity_4, v31);
    objc_storeStrong((id *)&v41->_Identity_5, v30);
    objc_storeStrong((id *)&v41->_STM_output_E, v29);
    objc_storeStrong((id *)&v41->_STM_output_L, v28);
    objc_storeStrong((id *)&v41->_STM_output_S, v27);
    objc_storeStrong((id *)&v41->_Identity_9, v26);
  }
  v19 = v41;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v41, 0);
  return v19;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6917570, a2, self);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  MLMultiArray *v5;
  id v6;
  MLMultiArray *v7;
  id v8;
  MLMultiArray *v9;
  id v10;
  MLMultiArray *v11;
  id v12;
  MLMultiArray *v13;
  id v14;
  MLMultiArray *v15;
  id v16;
  MLMultiArray *v17;
  id v18;
  MLMultiArray *v19;
  id v20;
  MLMultiArray *v21;
  id v22;
  MLMultiArray *v23;
  id v24;
  MLMultiArray *v25;
  id v26;
  MLMultiArray *v27;
  id v28;
  MLMultiArray *v29;
  id v30;
  MLMultiArray *v31;
  id MLFeatureValueClass_1;
  MLMultiArray *v33;
  id location[2];
  MLABOutput *v35;
  id v36;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity")) & 1) != 0)
  {
    MLFeatureValueClass_1 = getMLFeatureValueClass_1();
    v33 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(MLFeatureValueClass_1, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("LTM_output_E")) & 1) != 0)
  {
    v30 = getMLFeatureValueClass_1();
    v31 = -[MLABOutput LTM_output_E](v35, "LTM_output_E");
    v36 = (id)objc_msgSend(v30, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_10")) & 1) != 0)
  {
    v28 = getMLFeatureValueClass_1();
    v29 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v28, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_11")) & 1) != 0)
  {
    v26 = getMLFeatureValueClass_1();
    v27 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v26, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_12")) & 1) != 0)
  {
    v24 = getMLFeatureValueClass_1();
    v25 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v24, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_13")) & 1) != 0)
  {
    v22 = getMLFeatureValueClass_1();
    v23 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v22, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_14")) & 1) != 0)
  {
    v20 = getMLFeatureValueClass_1();
    v21 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v20, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("LTM_output_L")) & 1) != 0)
  {
    v18 = getMLFeatureValueClass_1();
    v19 = -[MLABOutput LTM_output_L](v35, "LTM_output_L");
    v36 = (id)objc_msgSend(v18, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("LTM_output_S")) & 1) != 0)
  {
    v16 = getMLFeatureValueClass_1();
    v17 = -[MLABOutput LTM_output_S](v35, "LTM_output_S");
    v36 = (id)objc_msgSend(v16, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_4")) & 1) != 0)
  {
    v14 = getMLFeatureValueClass_1();
    v15 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v14, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_5")) & 1) != 0)
  {
    v12 = getMLFeatureValueClass_1();
    v13 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v12, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("STM_output_E")) & 1) != 0)
  {
    v10 = getMLFeatureValueClass_1();
    v11 = -[MLABOutput STM_output_E](v35, "STM_output_E");
    v36 = (id)objc_msgSend(v10, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("STM_output_L")) & 1) != 0)
  {
    v8 = getMLFeatureValueClass_1();
    v9 = -[MLABOutput STM_output_L](v35, "STM_output_L");
    v36 = (id)objc_msgSend(v8, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("STM_output_S")) & 1) != 0)
  {
    v6 = getMLFeatureValueClass_1();
    v7 = -[MLABOutput STM_output_S](v35, "STM_output_S");
    v36 = (id)objc_msgSend(v6, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Identity_9")) & 1) != 0)
  {
    v4 = getMLFeatureValueClass_1();
    v5 = -[MLABOutput Identity](v35, "Identity");
    v36 = (id)objc_msgSend(v4, "featureValueWithMultiArray:");

  }
  else
  {
    v36 = 0;
  }
  objc_storeStrong(location, 0);
  return v36;
}

- (MLMultiArray)Identity
{
  return self->_Identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_Identity, a3);
}

- (MLMultiArray)LTM_output_E
{
  return self->_LTM_output_E;
}

- (void)setLTM_output_E:(id)a3
{
  objc_storeStrong((id *)&self->_LTM_output_E, a3);
}

- (MLMultiArray)Identity_10
{
  return self->_Identity_10;
}

- (void)setIdentity_10:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_10, a3);
}

- (MLMultiArray)Identity_11
{
  return self->_Identity_11;
}

- (void)setIdentity_11:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_11, a3);
}

- (MLMultiArray)Identity_12
{
  return self->_Identity_12;
}

- (void)setIdentity_12:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_12, a3);
}

- (MLMultiArray)Identity_13
{
  return self->_Identity_13;
}

- (void)setIdentity_13:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_13, a3);
}

- (MLMultiArray)Identity_14
{
  return self->_Identity_14;
}

- (void)setIdentity_14:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_14, a3);
}

- (MLMultiArray)LTM_output_L
{
  return self->_LTM_output_L;
}

- (void)setLTM_output_L:(id)a3
{
  objc_storeStrong((id *)&self->_LTM_output_L, a3);
}

- (MLMultiArray)LTM_output_S
{
  return self->_LTM_output_S;
}

- (void)setLTM_output_S:(id)a3
{
  objc_storeStrong((id *)&self->_LTM_output_S, a3);
}

- (MLMultiArray)Identity_4
{
  return self->_Identity_4;
}

- (void)setIdentity_4:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_4, a3);
}

- (MLMultiArray)Identity_5
{
  return self->_Identity_5;
}

- (void)setIdentity_5:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_5, a3);
}

- (MLMultiArray)STM_output_E
{
  return self->_STM_output_E;
}

- (void)setSTM_output_E:(id)a3
{
  objc_storeStrong((id *)&self->_STM_output_E, a3);
}

- (MLMultiArray)STM_output_L
{
  return self->_STM_output_L;
}

- (void)setSTM_output_L:(id)a3
{
  objc_storeStrong((id *)&self->_STM_output_L, a3);
}

- (MLMultiArray)STM_output_S
{
  return self->_STM_output_S;
}

- (void)setSTM_output_S:(id)a3
{
  objc_storeStrong((id *)&self->_STM_output_S, a3);
}

- (MLMultiArray)Identity_9
{
  return self->_Identity_9;
}

- (void)setIdentity_9:(id)a3
{
  objc_storeStrong((id *)&self->_Identity_9, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Identity_9, 0);
  objc_storeStrong((id *)&self->_STM_output_S, 0);
  objc_storeStrong((id *)&self->_STM_output_L, 0);
  objc_storeStrong((id *)&self->_STM_output_E, 0);
  objc_storeStrong((id *)&self->_Identity_5, 0);
  objc_storeStrong((id *)&self->_Identity_4, 0);
  objc_storeStrong((id *)&self->_LTM_output_S, 0);
  objc_storeStrong((id *)&self->_LTM_output_L, 0);
  objc_storeStrong((id *)&self->_Identity_14, 0);
  objc_storeStrong((id *)&self->_Identity_13, 0);
  objc_storeStrong((id *)&self->_Identity_12, 0);
  objc_storeStrong((id *)&self->_Identity_11, 0);
  objc_storeStrong((id *)&self->_Identity_10, 0);
  objc_storeStrong((id *)&self->_LTM_output_E, 0);
  objc_storeStrong((id *)&self->_Identity, 0);
}

@end
