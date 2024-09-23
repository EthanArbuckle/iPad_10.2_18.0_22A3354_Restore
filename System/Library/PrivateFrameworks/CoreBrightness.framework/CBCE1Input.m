@implementation CBCE1Input

- (CBCE1Input)initWithInput:(id)a3
{
  CBCE1Input *v3;
  CBCE1Input *v5;
  objc_super v6;
  id location[2];
  CBCE1Input *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CBCE1Input;
  v8 = -[CBCE1Input init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    objc_storeStrong((id *)&v8->_input, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E69175B8, a2, self);
}

- (id)featureValueForName:(id)a3
{
  id location[2];
  CBCE1Input *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("input")) & 1) != 0)
    v6 = (id)objc_msgSend(getMLFeatureValueClass_2(), "featureValueWithMultiArray:", v5->_input);
  else
    v6 = 0;
  objc_storeStrong(location, 0);
  return v6;
}

- (MLMultiArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
}

@end
