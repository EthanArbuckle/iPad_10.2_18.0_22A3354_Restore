@implementation BWNoiseReductionAndSharpeningParameters

- (BWNoiseReductionAndSharpeningParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4
{
  uint64_t v6;
  void *v7;
  BWNoiseReductionAndSharpeningParameters *v8;
  objc_super v10;

  if (a3
    && a4
    && (v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NoiseReductionAndSharpeningParameters")), "objectForKeyedSubscript:", CFSTR("StillImage"))) != 0)
  {
    v7 = (void *)v6;
    v10.receiver = self;
    v10.super_class = (Class)BWNoiseReductionAndSharpeningParameters;
    v8 = -[BWNoiseReductionAndSharpeningParameters init](&v10, sel_init);
    if (v8)
    {
      v8->_portType = (NSString *)a3;
      v8->_noiseReductionAndSharpeningConfiguration = (NSDictionary *)v7;
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNoiseReductionAndSharpeningParameters;
  -[BWNoiseReductionAndSharpeningParameters dealloc](&v3, sel_dealloc);
}

- (id)portType
{
  return self->_portType;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@: %@"), v4, self, BWPortTypeToDisplayString(self->_portType, v5), self->_noiseReductionAndSharpeningConfiguration);
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4 qSub:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  v6 = (void *)-[BWNoiseReductionAndSharpeningParameters _noiseReductionAndSharpeningParametersForType:qSub:]((uint64_t)self, a3, a5);
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    return 0;
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ISPMultiBandNoiseReductionParameters"));
  v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MultiBandEnabled")), "BOOLValue");
  v10 = *MEMORY[0x1E0D06F90];
  if (v9)
  {
    v32[0] = MEMORY[0x1E0C9AAB0];
    v11 = *MEMORY[0x1E0D06FA0];
    v31[0] = v10;
    v31[1] = v11;
    v32[1] = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MultiBandEnabled"));
    v31[2] = *MEMORY[0x1E0D06F80];
    v32[2] = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ChromaProcessingEnabled"));
    v31[3] = *MEMORY[0x1E0D06F98];
    v32[3] = nrasp_interpolateArrayOfValuesForGain((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LumaProcessingStrength")), a4);
    v31[4] = *MEMORY[0x1E0D06F88];
    v32[4] = nrasp_interpolateArrayOfValuesForGain((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ChromaProcessingStrength")), a4);
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v32;
    v14 = v31;
    v15 = 5;
  }
  else
  {
    v16 = *MEMORY[0x1E0D06FA0];
    v29[0] = *MEMORY[0x1E0D06F90];
    v29[1] = v16;
    v30[0] = MEMORY[0x1E0C9AAB0];
    v30[1] = MEMORY[0x1E0C9AAA0];
    v29[2] = *MEMORY[0x1E0D06F98];
    v30[2] = nrasp_interpolateArrayOfValuesForGain((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LumaProcessingStrength")), a4);
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v30;
    v14 = v29;
    v15 = 3;
  }
  v17 = objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
  if (!v17)
  {
    fig_log_get_emitter();
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocalContrastEnhancementStrength")))
  {
    v27[0] = *MEMORY[0x1E0D06FB8];
    v28[0] = nrasp_interpolateValueForGain((void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RawNoiseFilterStrength")), a4);
    v27[1] = *MEMORY[0x1E0D06FC0];
    v28[1] = nrasp_interpolateValueForGain((void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SharpeningControl")), a4);
    v27[2] = *MEMORY[0x1E0D06FA8];
    v18 = nrasp_interpolateValueForGain((void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LocalContrastEnhancementStrength")), a4);
    v27[3] = *MEMORY[0x1E0D06FB0];
    v28[2] = v18;
    v28[3] = v17;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v28;
    v21 = v27;
    v22 = 4;
  }
  else
  {
    v25[0] = *MEMORY[0x1E0D06FB8];
    v26[0] = nrasp_interpolateValueForGain((void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RawNoiseFilterStrength")), a4);
    v25[1] = *MEMORY[0x1E0D06FC0];
    v23 = nrasp_interpolateValueForGain((void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SharpeningControl")), a4);
    v25[2] = *MEMORY[0x1E0D06FB0];
    v26[1] = v23;
    v26[2] = v17;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v26;
    v21 = v25;
    v22 = 3;
  }
  return (id)objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
}

- (uint64_t)_noiseReductionAndSharpeningParametersForType:(int)a3 qSub:
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (result)
  {
    v3 = result;
    switch(a2)
    {
      case 0:
        v4 = *(void **)(result + 16);
        v5 = CFSTR("SingleImageSingleBand");
        goto LABEL_27;
      case 1:
        v4 = *(void **)(result + 16);
        if (!a3)
          goto LABEL_26;
        result = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SingleImageMultiBandQSub"));
        if (result)
          return result;
        v4 = *(void **)(v3 + 16);
LABEL_26:
        v5 = CFSTR("SingleImageMultiBand");
LABEL_27:
        result = objc_msgSend(v4, "objectForKeyedSubscript:", v5);
        break;
      case 2:
        v4 = *(void **)(result + 16);
        v5 = CFSTR("HDRParameters");
        goto LABEL_27;
      case 3:
        v4 = *(void **)(result + 16);
        v5 = CFSTR("OISParameters");
        goto LABEL_27;
      case 4:
        v4 = *(void **)(result + 16);
        v5 = CFSTR("SISParameters");
        goto LABEL_27;
      case 10:
        v4 = *(void **)(result + 16);
        v5 = CFSTR("EVZeroOnlyUBParameters");
        goto LABEL_27;
      case 11:
        v6 = *(void **)(result + 16);
        v7 = CFSTR("UBParameters");
        goto LABEL_19;
      case 12:
        v8 = *(void **)(result + 16);
        v9 = CFSTR("UBParameters");
        goto LABEL_21;
      case 13:
        v10 = *(void **)(result + 16);
        v11 = CFSTR("UBParameters");
        goto LABEL_23;
      case 14:
        v6 = *(void **)(result + 16);
        v7 = CFSTR("ToneMappedUBParameters");
        goto LABEL_19;
      case 15:
        v8 = *(void **)(result + 16);
        v9 = CFSTR("ToneMappedUBParameters");
        goto LABEL_21;
      case 16:
        v10 = *(void **)(result + 16);
        v11 = CFSTR("ToneMappedUBParameters");
        goto LABEL_23;
      case 17:
        v4 = *(void **)(result + 16);
        v5 = CFSTR("LowLightUBParameters");
        goto LABEL_27;
      case 20:
        v6 = *(void **)(result + 16);
        v7 = CFSTR("DeepFusionParameters");
LABEL_19:
        v4 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", v7);
        v5 = CFSTR("EVZero");
        goto LABEL_27;
      case 21:
        v8 = *(void **)(result + 16);
        v9 = CFSTR("DeepFusionParameters");
LABEL_21:
        v4 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v5 = CFSTR("EVMinus");
        goto LABEL_27;
      case 22:
        v10 = *(void **)(result + 16);
        v11 = CFSTR("DeepFusionParameters");
LABEL_23:
        v4 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v5 = CFSTR("Long");
        goto LABEL_27;
      case 30:
        v4 = *(void **)(result + 16);
        v5 = CFSTR("LearnedNRParameters");
        goto LABEL_27;
      default:
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unknown noise reduction and sharpening type"), 0));
    }
  }
  return result;
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4
{
  return -[BWNoiseReductionAndSharpeningParameters noiseReductionAndSharpeningConfigurationForType:gain:qSub:](self, "noiseReductionAndSharpeningConfigurationForType:gain:qSub:", *(_QWORD *)&a3, 0);
}

@end
