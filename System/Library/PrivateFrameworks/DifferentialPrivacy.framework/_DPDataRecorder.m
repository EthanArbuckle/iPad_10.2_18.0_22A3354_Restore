@implementation _DPDataRecorder

- (_DPDataRecorder)init
{

  return 0;
}

- (_DPDataRecorder)initWithKey:(id)a3
{
  id v5;
  _DPDataRecorder *v6;
  _DPDataRecorder *v7;
  uint64_t v8;
  _DPKeyProperties *keyProperties;
  _DPKeyProperties *v10;
  void *v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DPDataRecorder *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double privacyParameter;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *randomizer;
  uint64_t v37;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;

  v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_DPDataRecorder;
  v6 = -[_DPDataRecorder init](&v46, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_18;
  objc_storeStrong((id *)&v6->_keyName, a3);
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  keyProperties = v7->_keyProperties;
  v7->_keyProperties = (_DPKeyProperties *)v8;

  v10 = v7->_keyProperties;
  if (!v10)
  {
    +[_DPLog framework](_DPLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_DPDataRecorder initWithKey:].cold.1((uint64_t)v5, v13, v20, v21, v22, v23, v24, v25);
    goto LABEL_8;
  }
  -[_DPKeyProperties privacyParameter](v10, "privacyParameter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v7->_privacyParameter = v12;

  if (!isInvalidEpsilon(v7->_privacyParameter))
  {
    -[_DPKeyProperties possibleRange](v7->_keyProperties, "possibleRange");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "range");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_range = objc_msgSend(v28, "unsignedIntegerValue");

    if (!v7->_range)
      v7->_range = 200;
    v7->_fragmentWidth = -[_DPKeyProperties fragmentWidth](v7->_keyProperties, "fragmentWidth");
    v7->_fragmentCount = -[_DPKeyProperties fragmentCount](v7->_keyProperties, "fragmentCount");
    v7->_bitStringAlgorithm = -[_DPKeyProperties bitStringAlgorithm](v7->_keyProperties, "bitStringAlgorithm");
    v7->_directUpload = -[_DPKeyProperties directUpload](v7->_keyProperties, "directUpload");
    v29 = -[_DPKeyProperties dataAlgorithm](v7->_keyProperties, "dataAlgorithm");
    if ((unint64_t)(v29 - 2) >= 3)
    {
      if (v29 != 1)
        goto LABEL_17;
      +[_DPStringRandomizer numbersRandomizerWithEpsilon:privatizationAlgorithm:dataAlgorithm:range:](_DPStringRandomizer, "numbersRandomizerWithEpsilon:privatizationAlgorithm:dataAlgorithm:range:", -[_DPKeyProperties privatizationAlgorithm](v7->_keyProperties, "privatizationAlgorithm"), -[_DPKeyProperties dataAlgorithm](v7->_keyProperties, "dataAlgorithm"), v7->_range, v7->_privacyParameter);
      v37 = objc_claimAutoreleasedReturnValue();
      randomizer = v7->_randomizer;
      v7->_randomizer = v37;
    }
    else
    {
      privacyParameter = v7->_privacyParameter;
      v31 = -[_DPKeyProperties privatizationAlgorithm](v7->_keyProperties, "privatizationAlgorithm");
      v32 = -[_DPKeyProperties dataAlgorithm](v7->_keyProperties, "dataAlgorithm");
      -[_DPKeyProperties parameterDictionary](v7->_keyProperties, "parameterDictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPKeyProperties huffmanTableClass](v7->_keyProperties, "huffmanTableClass");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPStringRandomizer stringRandomizerWithEpsilon:privatizationAlgorithm:dataAlgorithm:algorithmParameters:huffmanTableClass:](_DPStringRandomizer, "stringRandomizerWithEpsilon:privatizationAlgorithm:dataAlgorithm:algorithmParameters:huffmanTableClass:", v31, v32, v33, v34, privacyParameter);
      v35 = objc_claimAutoreleasedReturnValue();

      randomizer = v7->_randomizer;
      v7->_randomizer = v35;
    }

LABEL_17:
    if (!v7->_randomizer)
    {
      +[_DPLog framework](_DPLog, "framework");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[_DPDataRecorder initWithKey:].cold.3((uint64_t)&v7->_keyProperties, v39, v40, v41, v42, v43, v44, v45);

      goto LABEL_9;
    }
LABEL_18:
    v26 = v7;
    goto LABEL_19;
  }
  +[_DPLog framework](_DPLog, "framework");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[_DPDataRecorder initWithKey:].cold.2((uint64_t)&v7->_privacyParameter, v13, v14, v15, v16, v17, v18, v19);
LABEL_8:

LABEL_9:
  v26 = 0;
LABEL_19:

  return v26;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { keyName=%@ ; keyProperties=%@ }"),
    v5,
    self->_keyName,
    self->_keyProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSObject)randomizer
{
  return self->_randomizer;
}

- (double)privacyParameter
{
  return self->_privacyParameter;
}

- (unint64_t)range
{
  return self->_range;
}

- (unint64_t)fragmentWidth
{
  return self->_fragmentWidth;
}

- (unint64_t)fragmentCount
{
  return self->_fragmentCount;
}

- (BOOL)bitStringAlgorithm
{
  return self->_bitStringAlgorithm;
}

- (BOOL)directUpload
{
  return self->_directUpload;
}

- (NSString)keyName
{
  return self->_keyName;
}

- (_DPKeyProperties)keyProperties
{
  return self->_keyProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyProperties, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_randomizer, 0);
}

- (void)initWithKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Cannot load key property for key = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithKey:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Invalid epsilon = %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithKey:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Cannot create _randomizer for _keyProperties = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
