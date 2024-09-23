@implementation VCPCNNVisionCoreDetector

- (VCPCNNVisionCoreDetector)initWithOptions:(id)a3
{
  VCPCNNVisionCoreDetector *v4;
  VCPCNNVisionCoreDetector *v5;
  uint64_t v6;
  VisionCoreISPInferenceNetworkDescriptor *descriptor;
  int v8;
  VCPCNNVisionCoreDetector *v9;
  uint64_t v10;
  NSMutableDictionary *outputBufferMapping;
  uint64_t v12;
  VisionCoreMutableNamedObjects *inferenceOutputNamedObjects;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  void *v23;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v49;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  int v61;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v62;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v63;
  uint64_t v64;
  NSArray *inputMasksNames;
  NSArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  int v76;
  void *v77;
  void *v78;
  uint64_t v79;
  VisionCoreMutableNamedObjects *postProcessingObjects;
  void *v81;
  void *v82;
  VCPCNNVisionCoreDetector *v83;
  void *v85;
  vector<espresso_buffer_t, std::allocator<espresso_buffer_t>> *p_outputEspressoBuffers;
  void *v87;
  id v88;
  NSArray *v89;
  void *v90;
  id obj;
  id v92;
  _OWORD v93[10];
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _OWORD v99[10];
  uint64_t v100;
  uint8_t buf[16];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  objc_super v116;
  _BYTE v117[128];
  _QWORD v118[2];
  uint8_t v119[4];
  void *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v92 = a3;
  v116.receiver = self;
  v116.super_class = (Class)VCPCNNVisionCoreDetector;
  v4 = -[VCPCNNVisionCoreDetector init](&v116, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  v4->_frameCount = 0;
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6CC0]), "initWithMajor:", 1);
  objc_msgSend(MEMORY[0x1E0DC6C68], "descriptorForIdentifier:version:objectTrackingEnabled:segmentationEnabled:lowFrameRate:error:", *MEMORY[0x1E0DC6D40]);
  v6 = objc_claimAutoreleasedReturnValue();
  descriptor = v5->_descriptor;
  v5->_descriptor = (VisionCoreISPInferenceNetworkDescriptor *)v6;

  v5->_espressoNetwork.plan = 0;
  v5->_espressoNetwork.network_index = 0;
  v8 = -[VCPCNNVisionCoreDetector loadModel:withOptions:](v5, "loadModel:withOptions:", v5->_descriptor, v92);
  if (v8)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = objc_claimAutoreleasedReturnValue();
  outputBufferMapping = v5->_outputBufferMapping;
  v5->_outputBufferMapping = (NSMutableDictionary *)v10;

  -[VisionCoreISPInferenceNetworkDescriptor allOutputNames](v5->_descriptor, "allOutputNames");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C90]), "initWithCapacity:", objc_msgSend(v87, "count"));
  inferenceOutputNamedObjects = v5->_inferenceOutputNamedObjects;
  v5->_inferenceOutputNamedObjects = (VisionCoreMutableNamedObjects *)v12;

  if ((!objc_msgSend(v87, "count") || !v87)
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - outputNames nil or empty", buf, 2u);
  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v87;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
  if (v14)
  {
    v88 = *(id *)v113;
    p_outputEspressoBuffers = &v5->_outputEspressoBuffers;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(id *)v113 != v88)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
        -[VisionCoreISPInferenceNetworkDescriptor outputNamed:error:](v5->_descriptor, "outputNamed:error:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "could not obtain model output", buf, 2u);
          }
          goto LABEL_63;
        }
        v111 = 0;
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        *(_OWORD *)buf = 0u;
        v102 = 0u;
        objc_msgSend(v17, "shape");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "rank");
        v20 = objc_retainAutorelease(v19);
        objc_msgSend(v20, "sizes");
        v21 = espresso_buffer_pack_tensor_shape();
        if (v21)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v119 = 67109120;
            LODWORD(v120) = v21;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed with espresso status %i", v119, 8u);
          }
          goto LABEL_62;
        }
        objc_msgSend(v18, "dataType");
        LODWORD(v111) = VisionCoreEspressoStorageTypeForTensorDataType();
        v22 = objc_retainAutorelease(v16);
        objc_msgSend(v22, "UTF8String");
        if (espresso_network_bind_buffer())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            _espressoPlanErrorMessage(v5->_espressoNetwork.plan);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v119 = 138412290;
            v120 = v82;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", v119, 0xCu);

          }
LABEL_62:

LABEL_63:
          goto LABEL_64;
        }
        v23 = (void *)objc_opt_new();
        v99[8] = v109;
        v99[9] = v110;
        v100 = v111;
        v99[4] = v105;
        v99[5] = v106;
        v99[6] = v107;
        v99[7] = v108;
        v99[0] = *(_OWORD *)buf;
        v99[1] = v102;
        v99[2] = v103;
        v99[3] = v104;
        objc_msgSend(v23, "setBuffer:", v99);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_outputBufferMapping, "setObject:forKeyedSubscript:", v23, obj);
        end = v5->_outputEspressoBuffers.__end_;
        value = v5->_outputEspressoBuffers.__end_cap_.__value_;
        if (end >= value)
        {
          v35 = 0xCF3CF3CF3CF3CF3DLL * ((end - p_outputEspressoBuffers->__begin_) >> 3);
          v36 = v35 + 1;
          if (v35 + 1 > 0x186186186186186)
            std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
          v37 = 0xCF3CF3CF3CF3CF3DLL * ((value - p_outputEspressoBuffers->__begin_) >> 3);
          if (2 * v37 > v36)
            v36 = 2 * v37;
          if (v37 >= 0xC30C30C30C30C3)
            v38 = 0x186186186186186;
          else
            v38 = v36;
          if (v38)
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>((uint64_t)&v5->_outputEspressoBuffers.__end_cap_, v38);
          else
            v39 = 0;
          v40 = &v39[168 * v35];
          v41 = *(_OWORD *)buf;
          v42 = v103;
          *((_OWORD *)v40 + 1) = v102;
          *((_OWORD *)v40 + 2) = v42;
          *(_OWORD *)v40 = v41;
          v43 = v104;
          v44 = v105;
          v45 = v107;
          *((_OWORD *)v40 + 5) = v106;
          *((_OWORD *)v40 + 6) = v45;
          *((_OWORD *)v40 + 3) = v43;
          *((_OWORD *)v40 + 4) = v44;
          v46 = v108;
          v47 = v109;
          v48 = v110;
          *((_QWORD *)v40 + 20) = v111;
          *((_OWORD *)v40 + 8) = v47;
          *((_OWORD *)v40 + 9) = v48;
          *((_OWORD *)v40 + 7) = v46;
          begin = v5->_outputEspressoBuffers.__begin_;
          v49 = v5->_outputEspressoBuffers.__end_;
          v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v40;
          if (v49 != begin)
          {
            do
            {
              v52 = *(_OWORD *)((char *)v49 - 168);
              v53 = *(_OWORD *)((char *)v49 - 152);
              *(_OWORD *)((char *)v51 - 136) = *(_OWORD *)((char *)v49 - 136);
              *(_OWORD *)((char *)v51 - 152) = v53;
              *(_OWORD *)((char *)v51 - 168) = v52;
              v54 = *(_OWORD *)((char *)v49 - 120);
              v55 = *(_OWORD *)((char *)v49 - 104);
              v56 = *(_OWORD *)((char *)v49 - 88);
              *(_OWORD *)((char *)v51 - 72) = *(_OWORD *)((char *)v49 - 72);
              *(_OWORD *)((char *)v51 - 88) = v56;
              *(_OWORD *)((char *)v51 - 104) = v55;
              *(_OWORD *)((char *)v51 - 120) = v54;
              v57 = *(_OWORD *)((char *)v49 - 56);
              v58 = *(_OWORD *)((char *)v49 - 40);
              v59 = *(_OWORD *)((char *)v49 - 24);
              *((_QWORD *)v51 - 1) = *((_QWORD *)v49 - 1);
              *(_OWORD *)((char *)v51 - 24) = v59;
              *(_OWORD *)((char *)v51 - 40) = v58;
              *(_OWORD *)((char *)v51 - 56) = v57;
              v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v51 - 168);
              v49 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v49 - 168);
            }
            while (v49 != begin);
            v49 = p_outputEspressoBuffers->__begin_;
          }
          v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v40 + 168);
          v5->_outputEspressoBuffers.__begin_ = v51;
          v5->_outputEspressoBuffers.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v40 + 168);
          v5->_outputEspressoBuffers.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v39[168 * v38];
          if (v49)
            operator delete(v49);
        }
        else
        {
          v26 = *(_OWORD *)buf;
          v27 = v103;
          *((_OWORD *)end + 1) = v102;
          *((_OWORD *)end + 2) = v27;
          *(_OWORD *)end = v26;
          v28 = v104;
          v29 = v105;
          v30 = v107;
          *((_OWORD *)end + 5) = v106;
          *((_OWORD *)end + 6) = v30;
          *((_OWORD *)end + 3) = v28;
          *((_OWORD *)end + 4) = v29;
          v31 = v108;
          v32 = v109;
          v33 = v110;
          *((_QWORD *)end + 20) = v111;
          *((_OWORD *)end + 8) = v32;
          *((_OWORD *)end + 9) = v33;
          *((_OWORD *)end + 7) = v31;
          v34 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 168);
        }
        v5->_outputEspressoBuffers.__end_ = v34;
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", *((_QWORD *)v34 - 21), objc_msgSend(v18, "storageByteCount"), 0);
        if (!v60)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v119 = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - no output data", v119, 2u);
          }

LABEL_71:
          v83 = 0;
          goto LABEL_66;
        }
        v61 = -[VisionCoreMutableNamedObjects assignData:toName:error:](v5->_inferenceOutputNamedObjects, "assignData:toName:error:", v60, v22, 0);

        if (!v61)
          goto LABEL_71;
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
    }
    while (v14);
  }

  v63 = v5->_outputEspressoBuffers.__begin_;
  v62 = v5->_outputEspressoBuffers.__end_;
  if (0xCF3CF3CF3CF3CF3DLL * ((v62 - v63) >> 3) != objc_msgSend(obj, "count")
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - outputBuffers not matching number of descriptors", buf, 2u);
  }
  v118[0] = CFSTR("last_mask");
  v118[1] = CFSTR("last_salient_mask");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
  v64 = objc_claimAutoreleasedReturnValue();
  inputMasksNames = v5->_inputMasksNames;
  v5->_inputMasksNames = (NSArray *)v64;

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v66 = v5->_inputMasksNames;
  v67 = -[NSArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
  if (!v67)
    goto LABEL_52;
  v68 = *(_QWORD *)v96;
  v89 = v66;
  while (2)
  {
    for (j = 0; j != v67; ++j)
    {
      if (*(_QWORD *)v96 != v68)
        objc_enumerationMutation(v89);
      v70 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
      -[VisionCoreISPInferenceNetworkDescriptor inputNamed:error:](v5->_descriptor, "inputNamed:error:", v70, 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      if (!v71)
      {
        v78 = v89;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "could not obtain inputDescriptor", buf, 2u);
        }
        v8 = -18;
        goto LABEL_83;
      }
      v111 = 0;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      *(_OWORD *)buf = 0u;
      v102 = 0u;
      objc_msgSend(v71, "shape");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "rank");
      v74 = objc_retainAutorelease(v73);
      objc_msgSend(v74, "sizes");
      if (espresso_buffer_pack_tensor_shape())
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          _espressoPlanErrorMessage(v5->_espressoNetwork.plan);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v119 = 138412290;
          v120 = v85;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", v119, 0xCu);

        }
        goto LABEL_82;
      }
      objc_msgSend(v72, "dataType");
      LODWORD(v111) = VisionCoreEspressoStorageTypeForTensorDataType();
      v75 = objc_retainAutorelease(v70);
      objc_msgSend(v75, "UTF8String");
      v76 = espresso_network_bind_buffer();
      if (v76)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v119 = 67109120;
          LODWORD(v120) = v76;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed with espresso status %i", v119, 8u);
        }
LABEL_82:

        v8 = -18;
        v78 = v89;
        goto LABEL_83;
      }
      v77 = (void *)objc_opt_new();
      v93[8] = v109;
      v93[9] = v110;
      v94 = v111;
      v93[4] = v105;
      v93[5] = v106;
      v93[6] = v107;
      v93[7] = v108;
      v93[0] = *(_OWORD *)buf;
      v93[1] = v102;
      v93[2] = v103;
      v93[3] = v104;
      objc_msgSend(v77, "setBuffer:", v93);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_inputBufferMapping, "setObject:forKeyedSubscript:", v77, v75);

    }
    v66 = v89;
    v67 = -[NSArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
    if (v67)
      continue;
    break;
  }
LABEL_52:

  -[VisionCoreISPInferenceNetworkDescriptor postProcessingOutputDescriptors](v5->_descriptor, "postProcessingOutputDescriptors");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPCNNVisionCoreDetector allocatePostProcessingBuffers:error:](v5, "allocatePostProcessingBuffers:error:");
  v79 = objc_claimAutoreleasedReturnValue();
  postProcessingObjects = v5->_postProcessingObjects;
  v5->_postProcessingObjects = (VisionCoreMutableNamedObjects *)v79;

  v5->_personBuffer = (__CVBuffer *)-[VisionCoreMutableNamedObjects pixelBufferForName:error:](v5->_postProcessingObjects, "pixelBufferForName:error:", CFSTR("$postprocessed$Person"), 0);
  v5->_salientBuffer = (__CVBuffer *)-[VisionCoreMutableNamedObjects pixelBufferForName:error:](v5->_postProcessingObjects, "pixelBufferForName:error:", CFSTR("$postprocessed$SalientPerson"), 0);
  v5->_skinBuffer = (__CVBuffer *)-[VisionCoreMutableNamedObjects pixelBufferForName:error:](v5->_postProcessingObjects, "pixelBufferForName:error:", CFSTR("$postprocessed$Skin"), 0);
  v5->_hairBuffer = (__CVBuffer *)-[VisionCoreMutableNamedObjects pixelBufferForName:error:](v5->_postProcessingObjects, "pixelBufferForName:error:", CFSTR("$postprocessed$Hair"), 0);
  v5->_skyBuffer = (__CVBuffer *)-[VisionCoreMutableNamedObjects pixelBufferForName:error:](v5->_postProcessingObjects, "pixelBufferForName:error:", CFSTR("$postprocessed$Sky"), 0);
  -[VisionCoreISPInferenceNetworkDescriptor allOutputNames](v5->_descriptor, "allOutputNames");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "count");

  v8 = 0;
LABEL_83:

LABEL_3:
  if (!v8)
  {
LABEL_4:
    v9 = v5;
    goto LABEL_65;
  }
LABEL_64:
  v9 = 0;
LABEL_65:
  v83 = v9;
LABEL_66:

  return v83;
}

- (int)downscaleBuffer:(__CVBuffer *)a3 scaledImage:(__CVBuffer *)a4
{
  int v4;
  int v6;

  v4 = -50;
  if (a3)
  {
    if (a4)
    {
      *a4 = 0;
      Scaler::Scale(&self->_scaler, a3, a4, 512, 384, 1111970369);
      v4 = v6;
      if (v6)
      {
        if (*a4)
        {
          CFRelease(*a4);
          *a4 = 0;
        }
      }
    }
  }
  return v4;
}

- (int)loadModel:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *context;
  int v9;
  void *plan;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector creating ANE context", (uint8_t *)&v25, 2u);
  }
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if (context)
  {
    v9 = espresso_context_set_low_precision_accumulation();
    if (v9)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector failed to set low precision numerical accumulation", (uint8_t *)&v25, 2u);
      }
      goto LABEL_33;
    }
    plan = (void *)espresso_create_plan();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planPriority"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planPriority"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "intValue") == 1)
      {

LABEL_17:
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planPriority"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "intValue");

        espresso_plan_set_priority();
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412290;
          v26 = v18;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector - espresso plan priority is set to %@", (uint8_t *)&v25, 0xCu);

        }
        goto LABEL_23;
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planPriority"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue") == 0x2000;

      if (v15)
        goto LABEL_17;
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planPriority"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");
        v25 = 67109120;
        LODWORD(v26) = v20;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPCNNVisionCoreDetector - invalid input espresso plan priority %d", (uint8_t *)&v25, 8u);

      }
    }
LABEL_23:
    objc_msgSend(v6, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v25 = 138412546;
        v26 = v6;
        v27 = 2112;
        v28 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - could not obtain model file path for %@ - %@", (uint8_t *)&v25, 0x16u);
      }
      v9 = -18;
      goto LABEL_32;
    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    v9 = espresso_plan_add_network();
    if (v9)
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_32;
    }
    else
    {
      v9 = espresso_plan_build();
      if (!v9 || (int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_32;
    }
    _espressoPlanErrorMessage(plan);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - %@", (uint8_t *)&v25, 0xCu);

LABEL_32:
    goto LABEL_33;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector failed to create ANE context", (uint8_t *)&v25, 2u);
  }
  v9 = -18;
LABEL_33:

  return v9;
}

- (int)UpdateInputBuffersAndBindPixelBuffer:(__CVBuffer *)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  int frameCount;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  -[VisionCoreISPInferenceNetworkDescriptor allInputNames](self->_descriptor, "allInputNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - inputNames nil or empty", buf, 2u);
    }
    v8 = -50;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C90]), "initWithCapacity:", objc_msgSend(v5, "count"));
    -[VisionCoreISPInferenceNetworkDescriptor inputNamed:error:](self->_descriptor, "inputNamed:error:", CFSTR("input_image"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "assignPixelBuffer:toName:error:", a3, v11, 0);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v10, "name");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v13, "UTF8String");
      v8 = espresso_network_bind_cvpixelbuffer();

      if (v8)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Failed to bind pixel buffer", buf, 2u);
        }
      }
      else
      {
        frameCount = self->_frameCount;
        if (frameCount >= 1)
        {
          -[VisionCoreISPInferenceNetworkDescriptor inputNamed:error:](self->_descriptor, "inputNamed:error:", CFSTR("prior_mask"), 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_inputBufferMapping, "objectForKeyedSubscript:", CFSTR("last_mask"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "buffer");
            v18 = *(void **)buf;
          }
          else
          {
            v18 = 0;
            v62 = 0;
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            *(_OWORD *)buf = 0u;
            v53 = 0u;
          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_outputBufferMapping, "objectForKeyedSubscript:", CFSTR("prior_mask"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "buffer");
            v21 = (const void *)v30;
          }
          else
          {
            v21 = 0;
            v50 = 0;
            v46 = 0u;
            v48 = 0u;
            v42 = 0u;
            v44 = 0u;
            v38 = 0u;
            v40 = 0u;
            v34 = 0u;
            v36 = 0u;
            v30 = 0u;
            v32 = 0u;
          }
          memcpy(v18, v21, objc_msgSend(v15, "storageByteCount", v30, v32, v34, v36, v38, v40, v42, v44, v46, v48, v50));

          -[VisionCoreISPInferenceNetworkDescriptor inputNamed:error:](self->_descriptor, "inputNamed:error:", CFSTR("salient_person_prior_mask"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_inputBufferMapping, "objectForKeyedSubscript:", CFSTR("last_salient_mask"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "buffer");
            v25 = *(void **)buf;
          }
          else
          {
            v25 = 0;
            v62 = 0;
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            *(_OWORD *)buf = 0u;
            v53 = 0u;
          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_outputBufferMapping, "objectForKeyedSubscript:", CFSTR("salient_person_prior_mask"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "buffer");
            v28 = (const void *)v31;
          }
          else
          {
            v28 = 0;
            v51 = 0;
            v47 = 0u;
            v49 = 0u;
            v43 = 0u;
            v45 = 0u;
            v39 = 0u;
            v41 = 0u;
            v35 = 0u;
            v37 = 0u;
            v31 = 0u;
            v33 = 0u;
          }
          memcpy(v25, v28, objc_msgSend(v22, "storageByteCount", v31, v33, v35, v37, v39, v41, v43, v45, v47, v49, v51));

          frameCount = self->_frameCount;
        }
        v8 = 0;
        self->_frameCount = frameCount + 1;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Failed to assign buffer", buf, 2u);
      }
      v8 = -18;
    }

  }
  return v8;
}

- (void)dealloc
{
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CVBuffer *personBuffer;
  __CVBuffer *salientBuffer;
  __CVBuffer *skinBuffer;
  __CVBuffer *hairBuffer;
  __CVBuffer *skyBuffer;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  if (self->_espressoNetwork.plan)
    espresso_plan_destroy();
  if (self->_espressoContext)
    espresso_context_destroy();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_inputBufferMapping, "objectForKeyedSubscript:", CFSTR("last_mask"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_inputBufferMapping, "objectForKeyedSubscript:", CFSTR("last_mask"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "buffer");
      v6 = (void *)v25;
    }
    else
    {
      v6 = 0;
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
    }
    free(v6);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_inputBufferMapping, "objectForKeyedSubscript:", CFSTR("last_salient_mask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_inputBufferMapping, "objectForKeyedSubscript:", CFSTR("last_salient_mask"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "buffer");
      v10 = (void *)v25;
    }
    else
    {
      v10 = 0;
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
    }
    free(v10);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputBufferMapping, "objectForKeyedSubscript:", CFSTR("prior_mask"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_outputBufferMapping, "objectForKeyedSubscript:", CFSTR("prior_mask"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "buffer");
      v14 = (void *)v25;
    }
    else
    {
      v14 = 0;
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
    }
    free(v14);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputBufferMapping, "objectForKeyedSubscript:", CFSTR("salient_person_prior_mask"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_outputBufferMapping, "objectForKeyedSubscript:", CFSTR("salient_person_prior_mask"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "buffer");
      v18 = (void *)v25;
    }
    else
    {
      v18 = 0;
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
    }
    free(v18);

  }
  personBuffer = self->_personBuffer;
  if (personBuffer)
    CFRelease(personBuffer);
  salientBuffer = self->_salientBuffer;
  if (salientBuffer)
    CFRelease(salientBuffer);
  skinBuffer = self->_skinBuffer;
  if (skinBuffer)
    CFRelease(skinBuffer);
  hairBuffer = self->_hairBuffer;
  if (hairBuffer)
    CFRelease(hairBuffer);
  skyBuffer = self->_skyBuffer;
  if (skyBuffer)
    CFRelease(skyBuffer);
  v24.receiver = self;
  v24.super_class = (Class)VCPCNNVisionCoreDetector;
  -[VCPCNNVisionCoreDetector dealloc](&v24, sel_dealloc);
}

- (id)allocatePostProcessingBuffers:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const __CFDictionary *v12;
  CVPixelBufferRef v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  id obj;
  CVPixelBufferRef pixelBufferOut[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  int v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C90]), "initWithCapacity:", objc_msgSend(v5, "count", v5));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v39;
    v25 = *MEMORY[0x1E0CA8FF0];
    v24 = *MEMORY[0x1E0CA8F68];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        v44[0] = v25;
        v44[1] = v24;
        v45[0] = MEMORY[0x1E0C9AA70];
        v45[1] = &unk_1E6B728C0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        pixelBufferOut[0] = 0;
        CVPixelBufferCreate(0, objc_msgSend(v11, "pixelWidth"), objc_msgSend(v11, "pixelHeight"), objc_msgSend(v11, "pixelFormatType"), v12, pixelBufferOut);
        v13 = pixelBufferOut[0];
        objc_msgSend(v11, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v6, "assignPixelBuffer:toName:error:", v13, v14, a4);

        if ((v13 & 1) == 0)
          goto LABEL_24;
      }
      else
      {
        v37 = 0;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        *(_OWORD *)pixelBufferOut = 0u;
        v28 = 0u;
        objc_msgSend(v10, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "rank");
        v16 = objc_retainAutorelease(v15);
        objc_msgSend(v16, "sizes");
        v17 = espresso_buffer_pack_tensor_shape();
        objc_msgSend(v10, "dataType");
        LODWORD(v37) = VisionCoreEspressoStorageTypeForTensorDataType();
        pixelBufferOut[0] = (CVPixelBufferRef)malloc_type_malloc(objc_msgSend(v10, "storageByteCount"), 0x983FD0C3uLL);
        if (v17)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v43 = v17;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Failed with espresso status %i", buf, 8u);
          }

          goto LABEL_24;
        }
        v18 = objc_alloc(MEMORY[0x1E0C99D50]);
        v19 = (void *)objc_msgSend(v18, "initWithBytes:length:", pixelBufferOut[0], objc_msgSend(v10, "storageByteCount"));
        if (!v19)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - no input data", buf, 2u);
          }
LABEL_23:

LABEL_24:
          v22 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v10, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v6, "assignData:toName:error:", v19, v20, a4);

        if ((v21 & 1) == 0)
          goto LABEL_23;

      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v22 = v6;
LABEL_25:

  return v22;
}

- (id)planExecutionandOutput:()vector<espresso_buffer_t descriptor:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3
{
  uint8_t v6[16];

  if (!espresso_plan_execute_sync())
    return self->_inferenceOutputNamedObjects;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "execution not successful", v6, 2u);
  }
  return 0;
}

- (id)resultForPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 Error:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *__p;
  void *v49;
  uint64_t v50;
  uint8_t v51[16];
  uint8_t buf[8];
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[2];

  v6 = *(_QWORD *)&a4;
  v60[1] = *MEMORY[0x1E0C80C00];
  v9 = mach_absolute_time();
  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCPCNNVisionCoreDetectorDownscale", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  if (-[VCPCNNVisionCoreDetector downscaleBuffer:scaledImage:](self, "downscaleBuffer:scaledImage:", a3, buf))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - downscaling pxielBuffer failed", v51, 2u);
    }
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPCNNVisionCoreDetector - downscaling buffer failed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
      v21 = 0;
      *a5 = v17;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  VCPSignPostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v11, "VCPCNNVisionCoreDetectorDownscale", ", v51, 2u);
  }

  if (v9)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if (-[VCPCNNVisionCoreDetector UpdateInputBuffersAndBindPixelBuffer:](self, "UpdateInputBuffersAndBindPixelBuffer:", *(_QWORD *)buf))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - update input buffers and binding buffer failed", v51, 2u);
    }
    if (a5)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPCNNVisionCoreDetector - update input buffers and binding buffer failed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_23:
    v21 = 0;
    goto LABEL_24;
  }
  v23 = mach_absolute_time();
  VCPSignPostLog();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_signpost_id_generate(v24);

  VCPSignPostLog();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VCPCNNVisionCoreDetectorExecution", ", v51, 2u);
  }

  __p = 0;
  v49 = 0;
  v50 = 0;
  std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&__p, self->_outputEspressoBuffers.__begin_, (uint64_t)self->_outputEspressoBuffers.__end_, 0xCF3CF3CF3CF3CF3DLL * ((self->_outputEspressoBuffers.__end_ - self->_outputEspressoBuffers.__begin_) >> 3));
  -[VCPCNNVisionCoreDetector planExecutionandOutput:descriptor:](self, "planExecutionandOutput:descriptor:", &__p, self->_descriptor);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v49 = __p;
    operator delete(__p);
  }
  VCPSignPostLog();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_END, v25, "VCPCNNVisionCoreDetectorExecution", ", v51, 2u);
  }

  if (v23)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  v30 = mach_absolute_time();
  VCPSignPostLog();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = os_signpost_id_generate(v31);

  VCPSignPostLog();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "VCPCNNVisionCoreDetectorPostProcessing", ", v51, 2u);
  }

  -[VisionCoreISPInferenceNetworkDescriptor postProcessingOutputDescriptors](self->_descriptor, "postProcessingOutputDescriptors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[VisionCoreISPInferenceNetworkDescriptor requiresPostProcessing](self->_descriptor, "requiresPostProcessing");
  if (v16)
    v36 = 0;
  else
    v36 = v35;
  if (v36 == 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - Descriptor requires post processing - but no postProcessingDescriptors returned", v51, 2u);
    }
    if (!a5)
    {
      v21 = 0;
      goto LABEL_22;
    }
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPCNNVisionCoreDetector - Descriptor requires post processing - but no postProcessingDescriptors returned"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v39);
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = objc_alloc(MEMORY[0x1E0DC6C70]);
    v38 = (void *)objc_msgSend(v40, "initWithInputImageBuffer:inputImageOrientation:inferenceOutputNamedObjects:", *(_QWORD *)buf, v6, v15);
    LODWORD(v47) = v6;
    LODWORD(v46) = v6;
    v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C78]), "initWithPostProcessedPersonImageBuffer:personImageOrientation:salientPersonImageBuffer:salientPersonImageBufferOrientation:skinImageBuffer:skinImageBufferOrientation:hairImageBuffer:hairImageBufferOrientation:skyImageBuffer:skyImageBufferOrientation:", self->_personBuffer, v6, self->_salientBuffer, v6, self->_skinBuffer, v6, self->_hairBuffer, v46, self->_skyBuffer, v47);
    if ((-[VisionCoreISPInferenceNetworkDescriptor performPostProcessingForInput:postProcessingOutput:error:](self->_descriptor, "performPostProcessingForInput:postProcessingOutput:error:", v38, v39, a5) & 1) != 0)
    {
      VCPSignPostLog();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        *(_WORD *)v51 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v42, OS_SIGNPOST_INTERVAL_END, v32, "VCPCNNVisionCoreDetectorPostProcessing", ", v51, 2u);
      }

      if (v30)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      v39 = v39;
      v21 = v39;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCNNVisionCoreDetector - ISP post processing failure", v51, 2u);
      }
      if (a5)
      {
        v43 = (void *)MEMORY[0x1E0CB35C8];
        v53 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPCNNVisionCoreDetector - ISP post processing failure"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v45);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v21 = 0;
    }
  }

LABEL_22:
LABEL_24:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
  return v21;
}

- (int)getHandsRegions:(id)a3 fromVisionCorePostProcessingOutput:(id)a4 imageWidth:(int)a5 imageHeight:(int)a6 extendRatio:(float)a7 portrait_mode:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  uint64_t v14;
  float v15;
  float v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  VCPBoundingBox *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  VCPBoundingBox *v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  uint64_t v65;
  id obj;
  float v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  int v81;
  __int16 v82;
  uint64_t v83;
  _BYTE v84[128];
  uint64_t v85;

  v8 = a8;
  v85 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(a4, "hands");
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
  if (v14)
  {
    v15 = (float)a5;
    v16 = (float)a6;
    v17 = *(_QWORD *)v69;
    v18 = (float)((float)a5 * 0.0019531);
    v19 = (float)((float)a6 / 384.0);
    v67 = a7 + 1.0;
    v65 = 134219264;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v69 != v17)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "groupID", v65);
        objc_msgSend(v21, "boundingBox");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v31 = objc_msgSend(v21, "chirality");
        if (v31 == 1)
          v32 = 0xFFFFFFFFLL;
        else
          v32 = v31 == 2;
        v33 = objc_msgSend(v21, "confidence");
        v34 = v28 * v18 * 0.5;
        v35 = v30 * v19 * 0.5;
        v36 = v34 + v24 * v18;
        v37 = v35 + v26 * v19;
        if (v34 < v35)
          v34 = v30 * v19 * 0.5;
        v38 = v67 * v34;
        v39 = v36 - v38;
        if ((float)(v36 - v38) < 0.0)
          v39 = 0.0;
        v40 = v37 - v38;
        if ((float)(v37 - v38) < 0.0)
          v40 = 0.0;
        v41 = v38 + v36;
        if (v41 > v15)
          v41 = v15;
        v42 = v38 + v37;
        v43 = v39 / v15;
        if (v42 > v16)
          v42 = (float)a6;
        v44 = v41 - v39;
        v45 = v40 / v16;
        v46 = v44 / v15;
        v47 = (float)(v42 - v40) / v16;
        if (v8)
        {
          v48 = (float)(1.0 - v43) - v46;
          v43 = v40 / v16;
          if (v48 >= 0.0)
            v45 = v48;
          else
            v45 = 0.0;
          v49 = v47;
        }
        else
        {
          v49 = v44 / v15;
          v46 = v47;
        }
        v50 = [VCPBoundingBox alloc];
        *(float *)&v51 = (float)v33;
        *(float *)&v52 = v43;
        *(float *)&v53 = v45;
        *(float *)&v54 = v49;
        *(float *)&v55 = v46;
        v56 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v50, "initWithXYAndSize:y:width:height:confidence:", v52, v53, v54, v55, v51);
        -[VCPBoundingBox setClassIndex:](v56, "setClassIndex:", v32);
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          -[VCPBoundingBox minX](v56, "minX");
          v58 = v57;
          -[VCPBoundingBox minY](v56, "minY");
          v60 = v59;
          -[VCPBoundingBox maxX](v56, "maxX");
          v62 = v61;
          -[VCPBoundingBox maxY](v56, "maxY");
          *(_DWORD *)buf = v65;
          v73 = v58;
          v74 = 2048;
          v75 = v60;
          v76 = 2048;
          v77 = v62;
          v78 = 2048;
          v79 = v63;
          v80 = 1024;
          v81 = v32;
          v82 = 2048;
          v83 = v22;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector: using VisionCore box (xyxy, chirality) = [%f, %f, %f, %f, %d], groupID = %lu", buf, 0x3Au);
        }
        -[VCPBoundingBox setGroupID:](v56, "setGroupID:", v22);
        objc_msgSend(v13, "addObject:", v56);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    }
    while (v14);
  }

  return 0;
}

- (int)getBodyRegions:(id)a3 fromVisionCorePostProcessingOutput:(id)a4 imageWidth:(int)a5 imageHeight:(int)a6 extendRatio:(float)a7 portrait_mode:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  double v20;
  float v21;
  float v22;
  float v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  VCPBoundingBox *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  VCPBoundingBox *v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  uint64_t v63;
  id obj;
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  __int16 v78;
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v8 = a8;
  v81 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(a4, "fullBodyResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v15 = a5;
  else
    v15 = a6;
  v68 = 0u;
  v69 = 0u;
  if (v8)
    v16 = a6;
  else
    v16 = a5;
  v66 = 0uLL;
  v67 = 0uLL;
  obj = v14;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
  if (v17)
  {
    v18 = (float)v16 * 0.0019531;
    v19 = *(_QWORD *)v67;
    v65 = v18;
    v20 = (float)((float)v15 / 384.0);
    v21 = (float)a6;
    v22 = a7 + 1.0;
    v23 = (float)a5;
    v63 = 134219008;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v67 != v19)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v26 = objc_msgSend(v25, "groupID", v63);
        objc_msgSend(v25, "boundingBox");
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v35 = objc_msgSend(v25, "confidence");
        v36 = v32 * v65;
        v37 = v34 * v20;
        v38 = v28 * v65;
        v39 = v30 * v20;
        if (v8)
        {
          v40 = v21 - v38;
          v38 = v30 * v20;
          v39 = v40 - v36;
          v41 = v37;
        }
        else
        {
          v41 = v36;
          v36 = v37;
        }
        v42 = [VCPBoundingBox alloc];
        *(float *)&v45 = (float)(v36 * 0.5) + v39;
        *(float *)&v46 = v22 * (float)(v36 * 0.5);
        *(float *)&v47 = *(float *)&v46 + *(float *)&v45;
        if ((float)(*(float *)&v46 + *(float *)&v45) > v21)
          *(float *)&v47 = v21;
        v48 = *(float *)&v45 - *(float *)&v46;
        v49 = 0.0;
        if (v48 >= 0.0)
          *(float *)&v43 = v48;
        else
          *(float *)&v43 = 0.0;
        v50 = (float)(v41 * 0.5) + v38;
        v51 = v22 * (float)(v41 * 0.5);
        v52 = v51 + v50;
        if ((float)(v51 + v50) > v23)
          v52 = (float)a5;
        v53 = v50 - v51;
        if (v53 >= 0.0)
          v49 = v53;
        *(float *)&v45 = *(float *)&v43 / v21;
        *(float *)&v46 = v49 / v23;
        *(float *)&v43 = (float)(*(float *)&v47 - *(float *)&v43) / v21;
        *(float *)&v47 = (float)(v52 - v49) / v23;
        *(float *)&v44 = (float)v35;
        v54 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v42, "initWithXYAndSize:y:width:height:confidence:", v46, v45, v47, v43, v44);
        -[VCPBoundingBox setGroupID:](v54, "setGroupID:", v26);
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          -[VCPBoundingBox minX](v54, "minX");
          v56 = v55;
          -[VCPBoundingBox minY](v54, "minY");
          v58 = v57;
          -[VCPBoundingBox maxX](v54, "maxX");
          v60 = v59;
          -[VCPBoundingBox maxY](v54, "maxY");
          *(_DWORD *)buf = v63;
          v71 = v56;
          v72 = 2048;
          v73 = v58;
          v74 = 2048;
          v75 = v60;
          v76 = 2048;
          v77 = v61;
          v78 = 2048;
          v79 = v26;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPCNNVisionCoreDetector: person fullbody box (xyxy) = [%f, %f, %f, %f], groupID = %lu", buf, 0x34u);
        }
        objc_msgSend(v13, "addObject:", v54);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    }
    while (v17);
  }

  return 0;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_postProcessingObjects, 0);
  objc_storeStrong((id *)&self->_inferenceOutputNamedObjects, 0);
  begin = self->_outputEspressoBuffers.__begin_;
  if (begin)
  {
    self->_outputEspressoBuffers.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputMasksNames, 0);
  objc_storeStrong((id *)&self->_inputBufferMapping, 0);
  objc_storeStrong((id *)&self->_outputBufferMapping, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.pool_.value_);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
