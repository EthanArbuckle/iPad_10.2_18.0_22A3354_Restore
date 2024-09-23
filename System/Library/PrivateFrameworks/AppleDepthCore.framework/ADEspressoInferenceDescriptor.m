@implementation ADEspressoInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkURL, 0);
  objc_storeStrong((id *)&self->_layoutNames, 0);
}

- (ADEspressoInferenceDescriptor)initWithUrl:(id)a3 layoutNames:(id)a4
{
  id v7;
  id v8;
  ADEspressoInferenceDescriptor *v9;
  ADEspressoInferenceDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADEspressoInferenceDescriptor;
  v9 = -[ADEspressoInferenceDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_networkURL, a3);
    objc_storeStrong((id *)&v10->_layoutNames, a4);
  }

  return v10;
}

- (NSURL)networkURL
{
  return self->_networkURL;
}

- (id)configurationNameForLayout:(unint64_t)a3
{
  NSDictionary *layoutNames;
  void *v4;
  void *v5;

  layoutNames = self->_layoutNames;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](layoutNames, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
