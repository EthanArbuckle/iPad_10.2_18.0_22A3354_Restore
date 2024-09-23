@implementation VNDetectionprintGenerator

+ (id)_inferenceNetworkDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  if (!objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class())
    || objc_msgSend(v6, "requestRevision") != 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  +[VNDetectionprintInferenceNetworkDescriptor sceneNetV3BasedNetworkAndReturnError:](VNDetectionprintInferenceNetworkDescriptor, "sceneNetV3BasedNetworkAndReturnError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___VNDetectionprintGenerator;
  objc_msgSendSuper2(&v8, sel_fullyPopulateConfigurationOptions_, v4);
  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfigurationOptions:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allInputNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("VNEspressoModelFileBasedDetectorOption_InputBlobNames"));

  objc_msgSend(v5, "allOutputNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("VNEspressoModelFileBasedDetectorOption_OutputBlobNames"));

}

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  +[VNValidationUtilities computeDeviceForKey:inOptions:error:](VNValidationUtilities, "computeDeviceForKey:inOptions:error:", CFSTR("VNDetectorInternalOption_ModelComputeDevice"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "_inferenceNetworkDescriptorForConfigurationOptions:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "modelPathForComputeDevice:error:", v7, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfigurationOptions:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(a1, "_inferenceNetworkDescriptorForConfigurationOptions:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pixelFormatType");

  return v5;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  VNDetectionprintInferenceNetworkDescriptor *v7;
  VNDetectionprintInferenceNetworkDescriptor *inferenceNetworkDescriptor;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNDetectionprintGenerator;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v11, sel_completeInitializationForSession_error_, a3))return 0;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_inferenceNetworkDescriptorForConfigurationOptions:error:", v6, a4);
  v7 = (VNDetectionprintInferenceNetworkDescriptor *)objc_claimAutoreleasedReturnValue();
  inferenceNetworkDescriptor = self->_inferenceNetworkDescriptor;
  self->_inferenceNetworkDescriptor = v7;

  v9 = self->_inferenceNetworkDescriptor != 0;
  return v9;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  __CVBuffer *v31;
  BOOL v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "width");
    v22 = objc_msgSend(v20, "height");
    -[VNDetectionprintInferenceNetworkDescriptor onlyInputImage](self->_inferenceNetworkDescriptor, "onlyInputImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "pixelWidth");
    v25 = objc_msgSend(v23, "pixelHeight");
    v26 = v25;
    v27 = width * (double)v21;
    v28 = height * (double)v22;
    if (v27 >= v28)
      v29 = v28;
    else
      v29 = v27;
    if (v24 >= v25)
      v30 = v25;
    else
      v30 = v24;
    if (v29 < (double)(unint64_t)v30)
      VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, v30);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
    v31 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v26, objc_msgSend(v23, "pixelFormatType"), v17, a8, x * (double)v21, y * (double)v22, v27, v28);
    *a7 = v31;
    v32 = v31 != 0;

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  id v37;
  VNDetectionprint *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  VNDetectionprintObservation *v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  _OWORD v56[10];
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _OWORD v78[2];
  int v79;
  VNDetectionprintObservation *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v54 = a7;
  v55 = a9;
  v53 = v13;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v13, a8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "network");
    -[VNDetectionprintInferenceNetworkDescriptor onlyInputImage](self->_inferenceNetworkDescriptor, "onlyInputImage");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "name");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "UTF8String");
    v16 = espresso_network_bind_input_cvpixelbuffer();

    if ((_DWORD)v16)
    {
      if (a8)
      {
        +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v16, CFSTR("Could not bind input image buffer"));
        v17 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      -[VNDetectionprintInferenceNetworkDescriptor tensorKeyToPrintOutputName](self->_inferenceNetworkDescriptor, "tensorKeyToPrintOutputName");
      memset(v78, 0, sizeof(v78));
      v79 = 1065353216;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v75;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v75 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
            v73 = 0;
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v23 = objc_retainAutorelease(v22);
            objc_msgSend(v23, "UTF8String");
            v24 = espresso_network_bind_buffer();
            if ((_DWORD)v24)
            {
              if (a8)
              {
                v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not bind output \"%@\"), v23);
                +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v24, v35);
                *a8 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_21;
            }
            v62 = v23;
            v25 = std::__hash_table<std::__hash_value_type<void *,espresso_buffer_t>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,espresso_buffer_t>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>((float *)v78, (unint64_t)v23, &v62);
            v26 = v73;
            v28 = v71;
            v27 = v72;
            v29 = v69;
            *(_OWORD *)(v25 + 136) = v70;
            *(_OWORD *)(v25 + 152) = v28;
            *(_OWORD *)(v25 + 168) = v27;
            v31 = v67;
            v30 = v68;
            v32 = v65;
            *(_OWORD *)(v25 + 72) = v66;
            *((_QWORD *)v25 + 23) = v26;
            *(_OWORD *)(v25 + 88) = v31;
            *(_OWORD *)(v25 + 104) = v30;
            *(_OWORD *)(v25 + 120) = v29;
            v33 = v64;
            *(_OWORD *)(v25 + 24) = v63;
            *(_OWORD *)(v25 + 40) = v33;
            *(_OWORD *)(v25 + 56) = v32;
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
          if (v19)
            continue;
          break;
        }
      }

      objc_msgSend(v52, "plan");
      v34 = espresso_plan_execute_sync();
      if ((_DWORD)v34)
      {
        if (a8)
        {
          +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v34, CFSTR("Could not run network"));
          v17 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_21:
          v17 = 0;
        }
      }
      else
      {
        v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v38 = v50;
        v39 = -[VNDetectionprint countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v59;
          while (2)
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v59 != v40)
                objc_enumerationMutation(v38);
              v42 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
              -[VNDetectionprint objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", v42);
              v43 = (VNDetectionprintObservation *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v63 = v43;
              v44 = std::__hash_table<std::__hash_value_type<void *,espresso_buffer_t>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,espresso_buffer_t>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>((float *)v78, (unint64_t)v43, &v63);
              v45 = *(_OWORD *)(v44 + 152);
              v56[7] = *(_OWORD *)(v44 + 136);
              v56[8] = v45;
              v56[9] = *(_OWORD *)(v44 + 168);
              v57 = *((_QWORD *)v44 + 23);
              v46 = *(_OWORD *)(v44 + 88);
              v56[3] = *(_OWORD *)(v44 + 72);
              v56[4] = v46;
              v47 = *(_OWORD *)(v44 + 120);
              v56[5] = *(_OWORD *)(v44 + 104);
              v56[6] = v47;
              v48 = *(_OWORD *)(v44 + 40);
              v56[0] = *(_OWORD *)(v44 + 24);
              v56[1] = v48;
              v56[2] = *(_OWORD *)(v44 + 56);
              +[VNDetectionprintTensor tensorFromEspressoBuffer:originatingRequestSpecifier:error:](VNDetectionprintTensor, "tensorFromEspressoBuffer:originatingRequestSpecifier:error:", v56, v14, a8);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v49)
              {
                v17 = 0;
                goto LABEL_35;
              }
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v49, v42);

            }
            v39 = -[VNDetectionprint countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
            if (v39)
              continue;
            break;
          }
        }

        v38 = -[VNDetectionprint initWithTensorsDictionary:originatingRequestSpecifier:]([VNDetectionprint alloc], "initWithTensorsDictionary:originatingRequestSpecifier:", v37, v14);
        v43 = -[VNDetectionprintObservation initWithOriginatingRequestSpecifier:detectionprint:]([VNDetectionprintObservation alloc], "initWithOriginatingRequestSpecifier:detectionprint:", v14, v38);
        v80 = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

      }
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v78);

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceNetworkDescriptor, 0);
}

@end
