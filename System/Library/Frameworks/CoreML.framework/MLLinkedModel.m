@implementation MLLinkedModel

- (void)updateParameterDescriptionsByUnarchivingSpecification:(const void *)a3
{
  void *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (a3 != &CoreML::Specification::_LinkedModelFile_default_instance_)
  {
    if (*((_QWORD *)a3 + 2))
    {
      +[MLParameterKey linkedModelFileName](MLParameterKey, "linkedModelFileName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_QWORD *)a3 + 2))
        v6 = (uint64_t *)*((_QWORD *)a3 + 2);
      else
        v6 = &CoreML::Specification::_StringParameter_default_instance_;
      +[MLParameterDescription parameterDescriptionForKey:stringParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:stringParameterSpec:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v7);

    }
    if (*((_QWORD *)a3 + 3))
    {
      +[MLParameterKey linkedModelSearchPath](MLParameterKey, "linkedModelSearchPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_QWORD *)a3 + 3))
        v9 = (uint64_t *)*((_QWORD *)a3 + 3);
      else
        v9 = &CoreML::Specification::_StringParameter_default_instance_;
      +[MLParameterDescription parameterDescriptionForKey:stringParameterSpec:](MLParameterDescription, "parameterDescriptionForKey:stringParameterSpec:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v10);

    }
  }
  -[MLModel modelDescription](self, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLParameterUtils appendParameterDescriptions:toModelDescription:](MLParameterUtils, "appendParameterDescriptions:toModelDescription:", v12, v11);

}

- (MLLinkedModel)initWithLinkedModel:(id)a3 modelFileName:(id)a4 modelSearchPath:(id)a5 configuration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  MLLinkedModel *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "modelDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  v19.receiver = self;
  v19.super_class = (Class)MLLinkedModel;
  v17 = -[MLModel initWithDescription:configuration:](&v19, sel_initWithDescription_configuration_, v16, v14);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_linkedModel, a3);
    objc_storeStrong((id *)&v17->_modelFileName, a4);
    objc_storeStrong((id *)&v17->_modelSearchPath, a5);
  }

  return v17;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  void *v11;
  void *v12;
  id v14[7];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v14, v10, 0, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  -[MLLinkedModel linkedModel](self, "linkedModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionFromFeatures:options:error:", v8, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v14);
  return v12;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v16[6];

  v8 = a3;
  v9 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  v10 = -[MLModel signpostID](self, "signpostID");
  v11 = objc_msgSend(v9, "parentSignpostID");
  kdebug_trace();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__MLLinkedModel_predictionsFromBatch_options_error___block_invoke;
  v16[3] = &__block_descriptor_48_e5_v8__0l;
  v16[4] = v10;
  v16[5] = v11;
  v12 = (void (**)(_QWORD))_Block_copy(v16);
  -[MLLinkedModel linkedModel](self, "linkedModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predictionsFromBatch:options:error:", v8, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v12[2](v12);
  return v14;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;

  v6 = a3;
  if (objc_msgSend(v6, "hasGlobalScope"))
  {
    +[MLParameterKey linkedModelFileName](MLParameterKey, "linkedModelFileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hasSameNameAsKey:", v7);

    if (v8)
    {
      -[MLLinkedModel modelFileName](self, "modelFileName");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v12 = (void *)v9;
      goto LABEL_10;
    }
    +[MLParameterKey linkedModelSearchPath](MLParameterKey, "linkedModelSearchPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "hasSameNameAsKey:", v10);

    if (v11)
    {
      -[MLLinkedModel modelSearchPath](self, "modelSearchPath");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  if (a4)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Linked Model does not have a parameter for requested key %@."), v6);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_10:

  return v12;
}

- (MLModel)linkedModel
{
  return (MLModel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLinkedModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)modelFileName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setModelFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)modelSearchPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setModelSearchPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelSearchPath, 0);
  objc_storeStrong((id *)&self->_modelFileName, 0);
  objc_storeStrong((id *)&self->_linkedModel, 0);
}

uint64_t __52__MLLinkedModel_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)findFile:(id)a3 inSearchPath:(id)a4 basePath:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v7 = a4;
  v22 = a5;
  v20 = v7;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v27;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("$BUNDLE_MAIN")))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pathForResource:ofType:", v25, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_23;
        goto LABEL_20;
      }
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("$BUNDLE_IDENTIFIER")))
      {
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$BUNDLE_IDENTIFIER"), &stru_1E3D68DC8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "length") < 3
          || objc_msgSend(v13, "characterAtIndex:", 0) != 40
          || objc_msgSend(v13, "characterAtIndex:", objc_msgSend(v13, "length") - 1) != 41)
        {
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("()"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pathForResource:ofType:", v25, 0);
        v17 = objc_claimAutoreleasedReturnValue();

        if (v17)
        {

          v14 = (void *)v17;
LABEL_23:

          v13 = v14;
          goto LABEL_24;
        }
      }
      else
      {
        if (objc_msgSend(v12, "isAbsolutePath"))
        {
          objc_msgSend(v12, "stringByAppendingPathComponent:", v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "fileExistsAtPath:", v13) & 1) != 0)
            goto LABEL_24;
          goto LABEL_20;
        }
        objc_msgSend(v22, "stringByAppendingPathComponent:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByStandardizingPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "stringByAppendingPathComponent:", v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "fileExistsAtPath:", v14) & 1) != 0)
          goto LABEL_23;
      }

LABEL_20:
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  v13 = 0;
LABEL_24:

  return v13;
}

+ (BOOL)areFeaturesIn:(id)a3 modelNamed:(id)a4 aSubsetOf:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v13)
  {
    v19 = 1;
    goto LABEL_18;
  }
  v14 = *(_QWORD *)v25;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v25 != v14)
        objc_enumerationMutation(v12);
      v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v11, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%@ is missing feature '%@'"), v10, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (a6)
        {
          v21 = objc_retainAutorelease(v20);
          *a6 = v21;
        }
        goto LABEL_17;
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "allowsValuesWithDescription:", v17) & 1) == 0)
      {
        +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("%@ feature '%@' is inconsistent with '%@'"), v10, v18, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v22;
        if (a6)
          *a6 = objc_retainAutorelease(v22);

LABEL_17:
        v19 = 0;
        goto LABEL_18;
      }

    }
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v19 = 1;
    if (v13)
      continue;
    break;
  }
LABEL_18:

  return v19;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  unint64_t *inited;
  unint64_t *v9;
  uint64_t *v10;
  void *v11;
  id v12;
  void *v13;
  const CoreML::Specification::LinkedModelFile *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  unint64_t *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  id v48;
  id v49;
  _BYTE v50[16];
  uint64_t *v51;
  uint64_t *v52;

  v7 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 556)
  {
    inited = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
    v9 = inited;
    if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 556)
    {
      v10 = *(uint64_t **)(*(_QWORD *)a3 + 32);
    }
    else
    {
      inited = CoreML::Specification::protobuf_LinkedModel_2eproto::InitDefaults((CoreML::Specification::protobuf_LinkedModel_2eproto *)inited);
      v10 = &CoreML::Specification::_LinkedModel_default_instance_;
    }
    if (*((_DWORD *)v10 + 7) == 1)
    {
      v14 = (const CoreML::Specification::LinkedModelFile *)v10[2];
    }
    else
    {
      CoreML::Specification::protobuf_LinkedModel_2eproto::InitDefaults((CoreML::Specification::protobuf_LinkedModel_2eproto *)inited);
      v14 = (const CoreML::Specification::LinkedModelFile *)&CoreML::Specification::_LinkedModelFile_default_instance_;
    }
    CoreML::Specification::LinkedModelFile::LinkedModelFile((CoreML::Specification::LinkedModelFile *)v50, v14);
    +[MLParameterKey linkedModelFileName](MLParameterKey, "linkedModelFileName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterUtils stringForKey:inDictionary:](MLParameterUtils, "stringForKey:inDictionary:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    +[MLParameterKey linkedModelSearchPath](MLParameterKey, "linkedModelSearchPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLParameterUtils stringForKey:inDictionary:](MLParameterUtils, "stringForKey:inDictionary:", v18, v19);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v20)
        goto LABEL_24;
    }
    else
    {
      v21 = v51;
      if (!v51)
        v21 = &CoreML::Specification::_StringParameter_default_instance_;
      v22 = v21[2];
      if (*(char *)(v22 + 23) < 0)
        v22 = *(_QWORD *)v22;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
LABEL_24:
        if (!-[__CFString length](v20, "length"))
        {

          v20 = CFSTR(".");
        }
        v45 = (void *)v17;
        objc_msgSend(v7, "rootModelURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringByDeletingLastPathComponent");
        v27 = objc_claimAutoreleasedReturnValue();

        v44 = (void *)v27;
        objc_msgSend(a1, "findFile:inSearchPath:basePath:", v17, v20, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model linking could not find model (%@) in search path (%@) relative to (%@)"), v45, v20, v27);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v40;
          if (a5)
          {
            v12 = objc_retainAutorelease(v40);
            v13 = 0;
            *a5 = v12;
          }
          else
          {
            v13 = 0;
          }
          goto LABEL_47;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        +[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", v29, v7, &v49);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v49;

        if (!v30)
        {
          if (!a5)
          {
            v13 = 0;
            goto LABEL_46;
          }
          v43 = 0;
          v35 = v12;
          goto LABEL_41;
        }
        v42 = v9;
        v43 = v30;
        objc_msgSend(v30, "modelDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "inputDescriptionsByName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "inputDescriptionsByName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v12;
        v34 = objc_msgSend(a1, "areFeaturesIn:modelNamed:aSubsetOf:error:", v32, CFSTR("Linked model"), v33, &v48);
        v35 = v48;

        if ((v34 & 1) != 0)
        {
          objc_msgSend(v42, "outputDescriptionsByName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "modelDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "outputDescriptionsByName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v35;
          v39 = objc_msgSend(a1, "areFeaturesIn:modelNamed:aSubsetOf:error:", v36, CFSTR("Root/Loaded model"), v38, &v47);
          v12 = v47;

          if ((v39 & 1) != 0)
          {
            v30 = v43;
            v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLinkedModel:modelFileName:modelSearchPath:configuration:", v43, v45, v20, v7);
            v9 = v42;
            objc_msgSend(v13, "updateParameterDescriptionsByUnarchivingSpecification:", v50);
LABEL_46:

LABEL_47:
            CoreML::Specification::LinkedModelFile::~LinkedModelFile((CoreML::Specification::LinkedModelFile *)v50);

            goto LABEL_48;
          }
          if (a5)
          {
            v35 = v12;
            goto LABEL_40;
          }
          v13 = 0;
        }
        else
        {
          if (a5)
          {
LABEL_40:
            v9 = v42;
LABEL_41:
            v12 = objc_retainAutorelease(v35);
            v13 = 0;
            *a5 = v12;
LABEL_45:
            v30 = v43;
            goto LABEL_46;
          }
          v13 = 0;
          v12 = v35;
        }
        v9 = v42;
        goto LABEL_45;
      }
    }
    v23 = v52;
    if (!v52)
      v23 = &CoreML::Specification::_StringParameter_default_instance_;
    v24 = v23[2];
    if (*(char *)(v24 + 23) < 0)
      v24 = *(_QWORD *)v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Model type is not linked model as expected"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5)
  {
    v12 = objc_retainAutorelease(v11);
    v13 = 0;
    *a5 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_48:

  return v13;
}

@end
