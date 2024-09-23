@implementation _DPAlgorithmParameters

- (_DPAlgorithmParameters)init
{

  return 0;
}

- (_DPAlgorithmParameters)initWithDictionary:(id)a3
{
  id v5;
  _DPAlgorithmParameters *v6;
  _DPAlgorithmParameters *v7;
  _DPAlgorithmParameters *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DPAlgorithmParameters;
  v6 = -[_DPAlgorithmParameters init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_parameterDictionary, a3);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (id)algorithmParametersFromDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

+ (id)algorithmParametersForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[_DPStrings algorithmParametersPath](_DPStrings, "algorithmParametersPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parametersFromFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "parameterDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { parametersDictionary=%@ }"), v5, self->_parameterDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)parametersFromFile:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45___DPAlgorithmParameters_parametersFromFile___block_invoke;
  v9[3] = &unk_1E95D92C0;
  v10 = v4;
  v11 = a1;
  v5 = parametersFromFile__onceToken_0;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&parametersFromFile__onceToken_0, v9);
  v7 = (id)allParameters;

  return v7;
}

+ (id)allAlgorithmNames
{
  void *v3;
  void *v4;
  void *v5;

  +[_DPStrings keyNamesPath](_DPStrings, "keyNamesPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parametersFromFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)parameterDictionary
{
  return self->_parameterDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDictionary, 0);
}

@end
