@implementation VNDetectionprintInferenceNetworkDescriptor

+ (id)_descriptorForNetworkFileName:(id)a3 networkSpecifier:(id)a4 imageInputName:(id)a5 tensorKeyToOutputNames:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  char v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  v29 = a5;
  v12 = a6;
  objc_msgSend(a1, "URLForEspressoModelNamed:error:", a3, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v12, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E459D2D0, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    v30 = 0;
    v31 = 0;
    v19 = objc_msgSend(MEMORY[0x1E0DC6C58], "getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:", &v31, &v30, v13, v29, 1111970369, v14, 0, a7);
    v20 = v31;
    v21 = v30;
    if ((v19 & 1) != 0)
    {
      v22 = objc_alloc((Class)a1);
      objc_msgSend(v21, "allValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (_QWORD *)objc_msgSend(v22, "initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:", v13, v28, 0, v20, v23, 0);

      v25 = objc_msgSend(v12, "copy");
      v26 = (void *)v24[8];
      v24[8] = v25;

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)sceneNetV3BasedNetworkAndReturnError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  v5 = objc_alloc(MEMORY[0x1E0DC6CB0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6CC0]), "initWithMajor:minor:micro:", 3, 0, 0);
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:version:", CFSTR("VNDetectionprintInferenceNetworkIdentifier"), v6);

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __83__VNDetectionprintInferenceNetworkDescriptor_sceneNetV3BasedNetworkAndReturnError___block_invoke;
  v17 = &unk_1E4548D60;
  v19 = a1;
  v8 = v7;
  v18 = v8;
  v9 = _Block_copy(&v14);
  +[VNFrameworkManager manager](VNFrameworkManager, "manager", v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detectorDescriptorsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForIdentifier:creationBlock:error:", v8, v9, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)URLForEspressoModelNamed:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0DC6C58], "URLForModelNamed:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __83__VNDetectionprintInferenceNetworkDescriptor_sceneNetV3BasedNetworkAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("VNDetectionprintTensorKeyMixed2");
  v7[1] = CFSTR("VNDetectionprintTensorKeyMixed6");
  v8[0] = CFSTR("classification/mixed_2/concat_channels");
  v8[1] = CFSTR("classification/mixed_6/concat_channels");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_descriptorForNetworkFileName:networkSpecifier:imageInputName:tensorKeyToOutputNames:error:", CFSTR("detector_print_mixed26.espresso"), *(_QWORD *)(a1 + 32), CFSTR("data"), v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)tensorKeyToPrintOutputName
{
  return self->_tensorKeyToPrintOutputName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tensorKeyToPrintOutputName, 0);
}

@end
