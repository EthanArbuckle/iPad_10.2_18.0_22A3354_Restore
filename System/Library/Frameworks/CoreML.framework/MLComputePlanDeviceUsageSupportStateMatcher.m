@implementation MLComputePlanDeviceUsageSupportStateMatcher

- (MLComputePlanDeviceUsageSupportStateMatcher)init
{
  MLComputePlanDeviceUsageSupportStateMatcher *result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *supportStatePatterns;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MLComputePlanDeviceUsageSupportStateMatcher *v30;
  objc_super v31;
  _QWORD v32[27];

  v32[25] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)MLComputePlanDeviceUsageSupportStateMatcher;
  result = -[MLComputePlanDeviceUsageSupportStateMatcher init](&v31, sel_init);
  if (result)
  {
    v30 = result;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Input cannot run on ANE"), 100);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v29;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Invalid input tensor format[:|] (\\w+)"), 120);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v28;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Unsupported tensor (\\w+) type (\\w+)"), 120);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v27;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Unsupported parameter (\\w+) type (\\w+)"), 120);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v26;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Unsupported (\\w+) data type:? \"?(\\w+)\"?"), 120);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v25;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("type (\\w+) for (\\S+) is not supported. only support (\\w+)"), 120);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[5] = v24;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("(\\w+) const (\\w+) is not supported"), 120);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[6] = v23;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("ANECompiler does not support range shape flexibility"), 110);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[7] = v22;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Invalid output tensor format[:|] (\\w+)"), 220);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[8] = v21;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Output type (\\w+) is not supported"), 220);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[9] = v20;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR(" must be positive."), 300);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[10] = v19;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Impossible to retrieve non-constant tensor shape at index #(\\d+)"), 300);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[11] = v18;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Unable to resolve operation input [\"|](\\w+)[\"|]"), 300);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[12] = v17;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("kernel (width|height) and (width|height) should be multiple of (\\d+) for large kernel but are (\\d* and \\d*)"), 320);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[13] = v16;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("input and output (x|y) strides should be the same for conv with large kernel but are \\d+ and \\d+"), 320);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[14] = v15;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Tensor dimensions (N\\d+D\\d+C\\d+H\\d+W\\d+) are not within supported range, (N\\[\\d-\\d+\\]D\\[\\d-\\d+\\]C\\[\\d-\\d+\\]H\\[\\d-\\d+\\]W\\[\\d-\\d+\\])"), 320);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v32[15] = v3;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("does not support palettized (\\w+) with large kernel"), 320);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v32[16] = v4;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("padding on the (\\w+) dimension is not supported"), 330);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32[17] = v5;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Invalid Pool kernel (width|height) \\(([A-Za-z0-9]*)\\), must be ([0-9\\[\\]-]*) or ([0-9\\[\\]-]*)"), 320);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32[18] = v6;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Failed to retrieve parameter (\\w+)"), 340);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32[19] = v7;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("invalid negative step on (\\w+) (\\w+)"), 310);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[20] = v8;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("This platform doesn't support Neuron (\\S+) \\(aka (\\S+)\\)"), 400);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[21] = v9;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Invalid operation. (\\w+)"), 400);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[22] = v10;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Unsupported MIL operation \"?(\\w+)\"?"), 400);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[23] = v11;
    +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:supportState:](MLComputePlanDeviceUsageSupportStatePattern, "deviceUsageSupportStatePatternWithPattern:supportState:", CFSTR("Cannot divided by zero"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[24] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 25);
    v13 = objc_claimAutoreleasedReturnValue();
    supportStatePatterns = v30->_supportStatePatterns;
    v30->_supportStatePatterns = (NSArray *)v13;

    return v30;
  }
  return result;
}

- (int64_t)matchingSupportStateForValidationMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MLComputePlanDeviceUsageSupportStateMatcher supportStatePatterns](self, "supportStatePatterns", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isMatchForValidationMessage:", v4) & 1) != 0)
        {
          v11 = objc_msgSend(v10, "supportState");
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = -1;
LABEL_11:

  return v11;
}

- (NSArray)supportStatePatterns
{
  return self->_supportStatePatterns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportStatePatterns, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MLComputePlanDeviceUsageSupportStateMatcher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_registry;
}

void __61__MLComputePlanDeviceUsageSupportStateMatcher_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_registry;
  sharedInstance_registry = (uint64_t)v1;

}

@end
