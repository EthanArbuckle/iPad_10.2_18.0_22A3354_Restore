@implementation CBCE3Input

- (CBCE3Input)initWithInput:(id)a3
{
  CBCE3Input *v3;
  CBCE3Input *v5;
  objc_super v6;
  id location[2];
  CBCE3Input *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CBCE3Input;
  v8 = -[CBCE3Input init](&v6, sel_init);
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
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6917420, a2, self);
}

- (id)featureValueForName:(id)a3
{
  id MLFeatureValueClass;
  MLMultiArray *v5;
  id location[2];
  CBCE3Input *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("input")) & 1) != 0)
  {
    MLFeatureValueClass = getMLFeatureValueClass();
    v5 = -[CBCE3Input input](v7, "input");
    v8 = (id)objc_msgSend(MLFeatureValueClass, "featureValueWithMultiArray:");

  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8;
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
