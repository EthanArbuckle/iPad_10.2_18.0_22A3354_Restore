@implementation BWLearnedNRInferenceConfiguration

- (BWLearnedNRInferenceConfiguration)initWithMetalCommandQueue:(id)a3 sensorConfigurationsByPortType:(id)a4 inferenceType:(int)a5 outputVideoRequirements:(id)a6
{
  BWLearnedNRInferenceConfiguration *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWLearnedNRInferenceConfiguration;
  v8 = -[BWTiledEspressoInferenceConfiguration initWithInferenceType:metalCommandQueue:](&v10, sel_initWithInferenceType_metalCommandQueue_, *(_QWORD *)&a5, a3);
  if (v8)
  {
    v8->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v8->_outputVideoRequirements = (NSArray *)a6;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRInferenceConfiguration;
  -[BWTiledEspressoInferenceConfiguration dealloc](&v3, sel_dealloc);
}

- (id)outputAttachedMediaKeyForInputDimensions:(id)a3
{
  NSArray *outputVideoRequirements;
  id result;
  id v6;
  uint64_t v7;
  uint64_t var0;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  outputVideoRequirements = self->_outputVideoRequirements;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v13;
    var0 = a3.var0;
    v9 = *(uint64_t *)&a3 >> 32;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(outputVideoRequirements);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10);
        if (objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "width") == var0
          && objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "height") == v9)
        {
          return (id)objc_msgSend(v11, "attachedMediaKey");
        }
        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](outputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (NSDictionary)sensorConfigurationsByPortType
{
  return self->_sensorConfigurationsByPortType;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

@end
