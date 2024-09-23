@implementation CBCE2Output

- (CBCE2Output)initWithCBCE2_Q0_output:(id)a3 CBCE2_Q1_output:(id)a4 CBCE2_Q2_output:(id)a5 CBCE2_Q3_output:(id)a6 CBCE2_Q4_output:(id)a7 strength_output:(id)a8 uncertainty:(id)a9
{
  CBCE2Output *v9;
  CBCE2Output *v11;
  objc_super v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  CBCE2Output *v25;

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
  v17.super_class = (Class)CBCE2Output;
  v25 = -[CBCE2Output init](&v17, sel_init);
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    objc_storeStrong((id *)&v25->_CBCE2_Q0_output, location[0]);
    objc_storeStrong((id *)&v25->_CBCE2_Q1_output, v23);
    objc_storeStrong((id *)&v25->_CBCE2_Q2_output, v22);
    objc_storeStrong((id *)&v25->_CBCE2_Q3_output, v21);
    objc_storeStrong((id *)&v25->_CBCE2_Q4_output, v20);
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
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E69174B0, a2, self);
}

- (id)featureValueForName:(id)a3
{
  id location[2];
  CBCE2Output *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE2_Q0_output")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(getMLFeatureValueClass_0(), "featureValueWithMultiArray:", v5->_CBCE2_Q0_output);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE2_Q1_output")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(getMLFeatureValueClass_0(), "featureValueWithMultiArray:", v5->_CBCE2_Q1_output);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE2_Q2_output")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(getMLFeatureValueClass_0(), "featureValueWithMultiArray:", v5->_CBCE2_Q2_output);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE2_Q3_output")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(getMLFeatureValueClass_0(), "featureValueWithMultiArray:", v5->_CBCE2_Q3_output);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CBCE2_Q4_output")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(getMLFeatureValueClass_0(), "featureValueWithMultiArray:", v5->_CBCE2_Q4_output);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("strength_output")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(getMLFeatureValueClass_0(), "featureValueWithMultiArray:", v5->_strength_output);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("uncertainty")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(getMLFeatureValueClass_0(), "featureValueWithMultiArray:", v5->_uncertainty);
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (MLMultiArray)CBCE2_Q0_output
{
  return self->_CBCE2_Q0_output;
}

- (void)setCBCE2_Q0_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE2_Q0_output, a3);
}

- (MLMultiArray)CBCE2_Q1_output
{
  return self->_CBCE2_Q1_output;
}

- (void)setCBCE2_Q1_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE2_Q1_output, a3);
}

- (MLMultiArray)CBCE2_Q2_output
{
  return self->_CBCE2_Q2_output;
}

- (void)setCBCE2_Q2_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE2_Q2_output, a3);
}

- (MLMultiArray)CBCE2_Q3_output
{
  return self->_CBCE2_Q3_output;
}

- (void)setCBCE2_Q3_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE2_Q3_output, a3);
}

- (MLMultiArray)CBCE2_Q4_output
{
  return self->_CBCE2_Q4_output;
}

- (void)setCBCE2_Q4_output:(id)a3
{
  objc_storeStrong((id *)&self->_CBCE2_Q4_output, a3);
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
  objc_storeStrong((id *)&self->_CBCE2_Q4_output, 0);
  objc_storeStrong((id *)&self->_CBCE2_Q3_output, 0);
  objc_storeStrong((id *)&self->_CBCE2_Q2_output, 0);
  objc_storeStrong((id *)&self->_CBCE2_Q1_output, 0);
  objc_storeStrong((id *)&self->_CBCE2_Q0_output, 0);
}

@end
