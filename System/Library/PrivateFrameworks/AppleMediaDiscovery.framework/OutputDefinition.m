@implementation OutputDefinition

- (OutputDefinition)initWithOutputDefinitionDictionary:(id)a3
{
  OutputDefinition *v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  OutputDefinition *v12;
  objc_super v13;
  id location[2];
  OutputDefinition *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v15;
  v15 = 0;
  v13.receiver = v3;
  v13.super_class = (Class)OutputDefinition;
  v15 = -[OutputDefinition init](&v13, sel_init);
  objc_storeStrong((id *)&v15, v15);
  v5 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("model_output_name"));
  -[OutputDefinition setModelOutputName:](v15, "setModelOutputName:");

  v6 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("mode"));
  -[OutputDefinition setMode:](v15, "setMode:");

  v7 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("model_top_n"));
  -[OutputDefinition setModelTopN:](v15, "setModelTopN:");

  v8 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("remap_dictionary_id"));
  -[OutputDefinition setRemapDictionaryId:](v15, "setRemapDictionaryId:");

  v9 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("score_threshold_as_multiple_of_random_score"));
  -[OutputDefinition setScoreThresholdAsMultipleOfRandomScore:](v15, "setScoreThresholdAsMultipleOfRandomScore:");

  v10 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("modifiers"));
  -[OutputDefinition setModifiers:](v15, "setModifiers:");

  v11 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("native_postprocessing_operators"));
  -[OutputDefinition setNativePostprocessingOperations:](v15, "setNativePostprocessingOperations:");

  v12 = v15;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v12;
}

- (BOOL)isValid
{
  NSString *v2;
  BOOL v4;

  v2 = -[OutputDefinition modelOutputName](self, "modelOutputName");
  v4 = v2 != 0;

  return v4;
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setModelOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_modelOutputName, a3);
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (NSNumber)modelTopN
{
  return self->_modelTopN;
}

- (void)setModelTopN:(id)a3
{
  objc_storeStrong((id *)&self->_modelTopN, a3);
}

- (NSArray)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(id)a3
{
  objc_storeStrong((id *)&self->_modifiers, a3);
}

- (NSString)remapDictionaryId
{
  return self->_remapDictionaryId;
}

- (void)setRemapDictionaryId:(id)a3
{
  objc_storeStrong((id *)&self->_remapDictionaryId, a3);
}

- (NSNumber)scoreThresholdAsMultipleOfRandomScore
{
  return self->_scoreThresholdAsMultipleOfRandomScore;
}

- (void)setScoreThresholdAsMultipleOfRandomScore:(id)a3
{
  objc_storeStrong((id *)&self->_scoreThresholdAsMultipleOfRandomScore, a3);
}

- (NSArray)nativePostprocessingOperations
{
  return self->_nativePostprocessingOperations;
}

- (void)setNativePostprocessingOperations:(id)a3
{
  objc_storeStrong((id *)&self->_nativePostprocessingOperations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativePostprocessingOperations, 0);
  objc_storeStrong((id *)&self->_scoreThresholdAsMultipleOfRandomScore, 0);
  objc_storeStrong((id *)&self->_remapDictionaryId, 0);
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_modelTopN, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
}

@end
