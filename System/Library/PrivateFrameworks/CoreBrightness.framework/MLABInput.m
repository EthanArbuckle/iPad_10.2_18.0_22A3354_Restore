@implementation MLABInput

- (MLABInput)initWithInput_x:(id)a3 target_lux:(id)a4 target_nits:(id)a5 target_weight:(id)a6
{
  MLABInput *v6;
  MLABInput *v8;
  objc_super v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  MLABInput *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v6 = v17;
  v17 = 0;
  v12.receiver = v6;
  v12.super_class = (Class)MLABInput;
  v17 = -[MLABInput init](&v12, sel_init);
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    objc_storeStrong((id *)&v17->_input_x, location[0]);
    objc_storeStrong((id *)&v17->_target_lux, v15);
    objc_storeStrong((id *)&v17->_target_nits, v14);
    objc_storeStrong((id *)&v17->_target_weight, v13);
  }
  v8 = v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v8;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6917558, a2, self);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  MLMultiArray *v5;
  id v6;
  MLMultiArray *v7;
  id v8;
  MLMultiArray *v9;
  id MLFeatureValueClass_1;
  MLMultiArray *v11;
  id location[2];
  MLABInput *v13;
  id v14;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("input_x")) & 1) != 0)
  {
    MLFeatureValueClass_1 = getMLFeatureValueClass_1();
    v11 = -[MLABInput input_x](v13, "input_x");
    v14 = (id)objc_msgSend(MLFeatureValueClass_1, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("target_lux")) & 1) != 0)
  {
    v8 = getMLFeatureValueClass_1();
    v9 = -[MLABInput target_lux](v13, "target_lux");
    v14 = (id)objc_msgSend(v8, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("target_nits")) & 1) != 0)
  {
    v6 = getMLFeatureValueClass_1();
    v7 = -[MLABInput target_nits](v13, "target_nits");
    v14 = (id)objc_msgSend(v6, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("target_weight")) & 1) != 0)
  {
    v4 = getMLFeatureValueClass_1();
    v5 = -[MLABInput target_weight](v13, "target_weight");
    v14 = (id)objc_msgSend(v4, "featureValueWithMultiArray:");

  }
  else
  {
    v14 = 0;
  }
  objc_storeStrong(location, 0);
  return v14;
}

- (MLMultiArray)input_x
{
  return self->_input_x;
}

- (void)setInput_x:(id)a3
{
  objc_storeStrong((id *)&self->_input_x, a3);
}

- (MLMultiArray)target_lux
{
  return self->_target_lux;
}

- (void)setTarget_lux:(id)a3
{
  objc_storeStrong((id *)&self->_target_lux, a3);
}

- (MLMultiArray)target_nits
{
  return self->_target_nits;
}

- (void)setTarget_nits:(id)a3
{
  objc_storeStrong((id *)&self->_target_nits, a3);
}

- (MLMultiArray)target_weight
{
  return self->_target_weight;
}

- (void)setTarget_weight:(id)a3
{
  objc_storeStrong((id *)&self->_target_weight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target_weight, 0);
  objc_storeStrong((id *)&self->_target_nits, 0);
  objc_storeStrong((id *)&self->_target_lux, 0);
  objc_storeStrong((id *)&self->_input_x, 0);
}

@end
