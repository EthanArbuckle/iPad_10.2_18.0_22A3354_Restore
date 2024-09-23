@implementation CBCE3Output

- (CBCE3Output)initWithCBCE3_Q0_output:(id)a3 CBCE3_Q1_output:(id)a4 CBCE3_Q2_output:(id)a5 CBCE3_Q3_output:(id)a6 CBCE3_Q4_output:(id)a7 strength_output:(id)a8 uncertainty:(id)a9
{
  CBCE3Output *v9;
  CBCE3Output *v11;
  objc_super v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  CBCE3Output *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = 0;
  objc_storeStrong(&v21, a6);
  v20 = 0;
  objc_storeStrong(&v20, a7);
  v19 = 0;
  objc_storeStrong(&v19, a8);
  v18 = 0;
  objc_storeStrong(&v18, a9);
  v9 = v25;
  v25 = 0;
  v17.receiver = v9;
  v17.super_class = (Class)CBCE3Output;
  v25 = -[CBCE3Output init](&v17, sel_init);
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    objc_storeStrong((id *)&v25->_CBCE3_Q0_output, location[0]);
    objc_storeStrong((id *)&v25->_CBCE3_Q1_output, v23);
    objc_storeStrong((id *)&v25->_CBCE3_Q2_output, v22);
    objc_storeStrong((id *)&v25->_CBCE3_Q3_output, v21);
    objc_storeStrong((id *)&v25->_CBCE3_Q4_output, v20);
    objc_storeStrong((id *)&v25->_strength_output, v19);
    objc_storeStrong((id *)&v25->_uncertainty, v18);
  }
  v11 = v25;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v11;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6917438, a2, self);
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
  id MLFeatureValueClass;
  MLMultiArray *v17;
  id location[2];
  CBCE3Output *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE3_Q0_output")) & 1) != 0)
  {
    MLFeatureValueClass = getMLFeatureValueClass();
    v17 = -[CBCE3Output CBCE3_Q0_output](v19, "CBCE3_Q0_output");
    v20 = (id)objc_msgSend(MLFeatureValueClass, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE3_Q1_output")) & 1) != 0)
  {
    v14 = getMLFeatureValueClass();
    v15 = -[CBCE3Output CBCE3_Q1_output](v19, "CBCE3_Q1_output");
    v20 = (id)objc_msgSend(v14, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE3_Q2_output")) & 1) != 0)
  {
    v12 = getMLFeatureValueClass();
    v13 = -[CBCE3Output CBCE3_Q2_output](v19, "CBCE3_Q2_output");
    v20 = (id)objc_msgSend(v12, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE3_Q3_output")) & 1) != 0)
  {
    v10 = getMLFeatureValueClass();
    v11 = -[CBCE3Output CBCE3_Q3_output](v19, "CBCE3_Q3_output");
    v20 = (id)objc_msgSend(v10, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE3_Q4_output")) & 1) != 0)
  {
    v8 = getMLFeatureValueClass();
    v9 = -[CBCE3Output CBCE3_Q4_output](v19, "CBCE3_Q4_output");
    v20 = (id)objc_msgSend(v8, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("strength_output")) & 1) != 0)
  {
    v6 = getMLFeatureValueClass();
    v7 = -[CBCE3Output strength_output](v19, "strength_output");
    v20 = (id)objc_msgSend(v6, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("uncertainty")) & 1) != 0)
  {
    v4 = getMLFeatureValueClass();
    v5 = -[CBCE3Output uncertainty](v19, "uncertainty");
    v20 = (id)objc_msgSend(v4, "featureValueWithMultiArray:");

  }
  else
  {
    v20 = 0;
  }
  objc_storeStrong(location, 0);
  return v20;
}

- (MLMultiArray)CBCE3_Q0_output
{
  return self->_CBCE3_Q0_output;
}

- (void)setCBCE3_Q0_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE3_Q0_output, a3);
}

- (MLMultiArray)CBCE3_Q1_output
{
  return self->_CBCE3_Q1_output;
}

- (void)setCBCE3_Q1_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE3_Q1_output, a3);
}

- (MLMultiArray)CBCE3_Q2_output
{
  return self->_CBCE3_Q2_output;
}

- (void)setCBCE3_Q2_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE3_Q2_output, a3);
}

- (MLMultiArray)CBCE3_Q3_output
{
  return self->_CBCE3_Q3_output;
}

- (void)setCBCE3_Q3_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE3_Q3_output, a3);
}

- (MLMultiArray)CBCE3_Q4_output
{
  return self->_CBCE3_Q4_output;
}

- (void)setCBCE3_Q4_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE3_Q4_output, a3);
}

- (MLMultiArray)strength_output
{
  return self->_strength_output;
}

- (void)setStrength_output:(id)a3
{
  objc_storeStrong((id *)&self->_strength_output, a3);
}

- (MLMultiArray)uncertainty
{
  return self->_uncertainty;
}

- (void)setUncertainty:(id)a3
{
  objc_storeStrong((id *)&self->_uncertainty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncertainty, 0);
  objc_storeStrong((id *)&self->_strength_output, 0);
  objc_storeStrong((id *)&self->_CBCE3_Q4_output, 0);
  objc_storeStrong((id *)&self->_CBCE3_Q3_output, 0);
  objc_storeStrong((id *)&self->_CBCE3_Q2_output, 0);
  objc_storeStrong((id *)&self->_CBCE3_Q1_output, 0);
  objc_storeStrong((id *)&self->_CBCE3_Q0_output, 0);
}

@end
