@implementation BWDeferredProcessorController

- (BWDeferredProcessorController)initWithConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWDeferredProcessorController;
  return -[BWStillImageProcessorController initWithName:type:configuration:](&v4, sel_initWithName_type_configuration_, CFSTR("DeferredProcessor"), 5, a3);
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWDeferredProcessorController;
  -[BWStillImageProcessorController dealloc](&v4, sel_dealloc);
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWDeferredProcessorControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWDeferredProcessorControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  -[BWStillImageProcessorControllerInput setProcessorController:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setProcessorController:", self);
  return 0;
}

- (int)process
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __objc2_prop_list **p_inst_props;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  __CVBuffer *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CVBuffer *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  float v51;
  double v52;
  uint64_t v53;
  char v54;
  void *v55;
  int v56;
  const void *v57;
  uint64_t v58;
  uint64_t v60;
  const __CFString *key;
  uint64_t v62;
  void *context;
  uint64_t v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BWStillImageProcessorControllerDelegate *v72;
  BWStillImageProcessorControllerInput *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BWDeferredProcessorController *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t theAttachments;
  const __CFDictionary *theAttachmentsa;
  uint64_t v86;
  uint64_t v87;
  CMAttachmentBearerRef target;
  _QWORD v89[2];
  __CVBuffer *(*v90)(uint64_t, uint64_t, uint64_t);
  void *v91;
  void *v92;
  void *v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  unsigned int v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v101 = 0;
  v73 = -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input");
  v3 = (void *)-[BWStillImageProcessorControllerInput container](v73, "container");
  v78 = self;
  v72 = -[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate");
  if (objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "captureType") != 12
    && (objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "captureFlags") & 0x80) == 0)
  {
    v101 = -12780;
    goto LABEL_89;
  }
  context = (void *)MEMORY[0x1A858DD40]();
  v4 = -[BWDeferredProcessorController _sortedIntermediates](self);
  v71 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InferenceAttachedMediaMeta-%@"), -[BWStillImageProcessorControllerInput portType](v73, "portType"));
  -[BWDeferredProcessorController _handleDidDetermineReferenceFrameWithSortedIntermediates:](self, v4);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
  if (!v6)
    goto LABEL_88;
  v7 = v6;
  v8 = *(_QWORD *)v98;
  v70 = *MEMORY[0x1E0D05FB8];
  v76 = *MEMORY[0x1E0D05CA8];
  v77 = *MEMORY[0x1E0D05D30];
  p_inst_props = &OBJC_PROTOCOL___BWRedEyeReductionControllerDelegate.inst_props;
  v75 = *MEMORY[0x1E0D05D48];
  key = (const __CFString *)*MEMORY[0x1E0D08740];
  v62 = *MEMORY[0x1E0D06D00];
  v86 = *(_QWORD *)v98;
  v74 = v4;
  v67 = v3;
  do
  {
    v10 = 0;
    v87 = v7;
    do
    {
      if (*(_QWORD *)v98 != v8)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1A858DD40]();
      v96 = 0;
      v13 = (void *)objc_msgSend(v11, "tag");
      v14 = objc_msgSend(v13, "hasPrefix:", p_inst_props[374]);
      v15 = (uint64_t)v13;
      if ((v14 & 1) != 0)
        goto LABEL_23;
      v16 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagSourceNodePixelBufferAttributes);
      v15 = (uint64_t)v13;
      if ((v16 & 1) != 0)
        goto LABEL_23;
      v17 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix);
      v15 = (uint64_t)v13;
      if ((v17 & 1) != 0)
        goto LABEL_23;
      v18 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagSyntheticReferenceFrameMetadataByPortTypePrefix);
      v15 = (uint64_t)v13;
      if ((v18 & 1) != 0)
        goto LABEL_23;
      v19 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix);
      v15 = (uint64_t)v13;
      if ((v19 & 1) != 0)
        goto LABEL_23;
      v20 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagDNGDictionaryPrefix);
      v15 = (uint64_t)v13;
      if ((v20 & 1) != 0)
        goto LABEL_23;
      v21 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix);
      v15 = (uint64_t)v13;
      if ((v21 & 1) != 0)
        goto LABEL_23;
      v22 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagDepthMetadata);
      v15 = (uint64_t)v13;
      if ((v22 & 1) != 0)
        goto LABEL_23;
      v23 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagStereoPhotoDepthMetadata);
      v15 = (uint64_t)v13;
      if ((v23 & 1) != 0)
        goto LABEL_23;
      v24 = objc_msgSend(v13, "hasPrefix:", BWDeferredIntermediateTagDepthData);
      v15 = (uint64_t)v13;
      if ((v24 & 1) != 0)
        goto LABEL_23;
      if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class())
        && (objc_msgSend(v11, "bufferType") == 2001
         || objc_msgSend(v11, "bufferType") == 19
         || objc_msgSend(v11, "bufferType") == 37))
      {
        objc_msgSend(v5, "addObject:", v13);
        v15 = objc_msgSend(v11, "metadataTag");
LABEL_23:
        objc_msgSend(v5, "addObject:", v15);
      }
      if ((objc_msgSend(v5, "containsObject:", v13) & 1) != 0)
        goto LABEL_53;
      if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
      {
        v95 = 0;
        v94 = 0;
        v79 = objc_msgSend(v11, "bufferType");
        theAttachments = objc_msgSend(v11, "captureFrameFlags");
        v25 = (__CVBuffer *)objc_msgSend(v3, "copyBufferForTag:err:", v13, &v95);
        if (objc_msgSend(v11, "metadataTag"))
        {
          v26 = (void *)objc_msgSend(v3, "copyMetadataForTag:err:", objc_msgSend(v11, "metadataTag"), &v94);
          v27 = (void *)objc_msgSend(v26, "mutableCopy");

          objc_msgSend(v5, "addObject:", objc_msgSend(v11, "metadataTag"));
        }
        else
        {
          v27 = 0;
        }
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v90 = __40__BWDeferredProcessorController_process__block_invoke;
        v91 = &unk_1E4926780;
        v36 = v3;
        v92 = v3;
        v93 = v5;
        v37 = objc_msgSend(v11, "rawThumbnailsBufferTag");
        v38 = objc_msgSend(v11, "rawThumbnailsMetadataTag");
        v39 = (void *)((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v90)(v89, v37, v38, v77);
        v40 = objc_msgSend(v11, "mainRawThumbnailBufferTag");
        v41 = objc_msgSend(v11, "mainRawThumbnailMetadataTag");
        v42 = (void *)((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v90)(v89, v40, v41, v76);
        v43 = objc_msgSend(v11, "sifrRawThumbnailBufferTag");
        v44 = objc_msgSend(v11, "sifrRawThumbnailMetadataTag");
        v45 = (void *)((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v90)(v89, v43, v44, v75);
        v46 = v95;
        if (v95 || (v46 = v94) != 0)
        {
          v101 = v46;
          goto LABEL_42;
        }
        if (!v101)
        {
          if ((objc_msgSend((id)objc_msgSend(v36, "captureSettings"), "captureFlags") & 4) == 0)
          {
            LODWORD(v60) = v101;
            -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:](v72, "processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:", v78, v25, v27, v79, theAttachments, v73, v60);
            goto LABEL_42;
          }
          v68 = 0;
          v66 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v67, "captureSettings"), "masterPortType"), "isEqualToString:", objc_msgSend(v11, "portType"));
          if (v66)
          {
            v53 = v79;
            if ((theAttachments & 0x10) != 0)
            {
              v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDNGDictionaryPrefix, -[BWStillImageProcessorControllerInput portType](v73, "portType"));
              if (objc_msgSend(v36, "hasTag:"))
                v68 = (void *)objc_msgSend(v67, "copyDictionaryForTag:err:", v69, &v101);
              else
                v68 = 0;
              v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagSyntheticReferenceFrameMetadataByPortTypePrefix, -[BWStillImageProcessorControllerInput portType](v73, "portType"));
              if (objc_msgSend(v67, "hasTag:"))
              {
                v65 = (void *)objc_msgSend(v67, "copyDictionaryForTag:err:", v64, &v101);
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v65, CFSTR("SyntheticReference"));

              }
              goto LABEL_69;
            }
          }
          else
          {
LABEL_69:
            v53 = v79;
          }
          if (v53 == 1)
          {
            v80 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix, objc_msgSend(v11, "portType"));
            if (objc_msgSend(v36, "hasTag:"))
            {
              v81 = (void *)objc_msgSend(v36, "copyDictionaryForTag:err:", v80, &v101);
              objc_msgSend(v27, "addEntriesFromDictionary:", v81);

            }
            target = 0;
            v101 = -[BWDeferredProcessorController _sensorRawSampleBufferWithBuffer:metadata:rawThumbnailsBuffer:mainRawThumbnailBuffer:sifrRawThumbnailBuffer:dngDictionary:captureFrameFlags:stillImageSettings:sampleBufferOut:]((uint64_t)v78, v25, v27, v39, v42, v45, v68, theAttachments, -[BWStillImageProcessorControllerInput stillImageSettings](v73, "stillImageSettings"), (CMSampleBufferRef *)&target);
            if (target)
              v54 = v66;
            else
              v54 = 1;
            v55 = v36;
            if ((v54 & 1) == 0)
            {
              v82 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagStereoPhotoDepthMetadata, -[BWStillImageProcessorControllerInput portType](v73, "portType"));
              v56 = objc_msgSend(v67, "hasTag:");
              v55 = v67;
              if (v56)
              {
                v83 = (void *)objc_msgSend(v67, "copyDictionaryForTag:err:", v82, &v101);
                v57 = (const void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v83);
                CMSetAttachment(target, key, v57, 1u);

                v55 = v67;
              }
            }
            if (objc_msgSend((id)objc_msgSend(v55, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
            {
              if ((theAttachments & 0x10) != 0)
              {
                theAttachmentsa = (const __CFDictionary *)-[BWDeferredProcessorController _getOriginalCameraIntrinsicsForPortType:](v78, objc_msgSend(v27, "objectForKeyedSubscript:", v62));
                if (-[__CFDictionary count](theAttachmentsa, "count"))
                  CMSetAttachments(target, theAttachmentsa, 1u);
              }
            }
            -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](v72, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v78, target, 1, v73, v101);
            if (target)
              CFRelease(target);
          }
          else
          {
            LODWORD(v60) = v101;
            -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:](v72, "processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:", v78, v25, v27, v53, theAttachments, v73, v60);
          }

        }
LABEL_42:
        CVPixelBufferRelease(v25);
        objc_msgSend(v11, "releaseBuffer");

        CVPixelBufferRelease((CVPixelBufferRef)v39);
        CVPixelBufferRelease((CVPixelBufferRef)v42);
        CVPixelBufferRelease((CVPixelBufferRef)v45);
        if (v101)
        {
          objc_autoreleasePoolPop(v12);
          v3 = v36;
          goto LABEL_88;
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "tag"));
        v3 = v36;
        v4 = v74;
LABEL_51:
        v8 = v86;
        v7 = v87;
        goto LABEL_52;
      }
      if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
      {
        v28 = objc_msgSend(v11, "inferenceAttachedMediaKey");
        v29 = (__CVBuffer *)objc_msgSend(v11, "fetchAndRetain:", &v96);
        if (objc_msgSend(v11, "metadataTag"))
        {
          v30 = (void *)objc_msgSend(v3, "copyMetadataForTag:err:", objc_msgSend(v11, "metadataTag"), &v96);
          v31 = (void *)objc_msgSend(v30, "mutableCopy");

          objc_msgSend(v5, "addObject:", objc_msgSend(v11, "metadataTag"));
        }
        else
        {
          v31 = 0;
        }
        if ((objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "captureFlags") & 0x100000000) != 0)
        {
          v48 = (float)objc_msgSend((id)objc_msgSend(v3, "settings"), "deferredPhotoFinalHeight");
          v49 = v48 / (float)objc_msgSend((id)objc_msgSend(v3, "settings"), "deferredPhotoProxyHeight");
          v50 = (void *)MEMORY[0x1E0CB37E8];
          -[BWStillImageProcessorControllerConfiguration inferenceMainImageDownscalingFactor](-[BWStillImageProcessorController configuration](v78, "configuration"), "inferenceMainImageDownscalingFactor");
          *(float *)&v52 = v49 * v51;
          objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(v50, "numberWithFloat:", v52), v70);
        }
        -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingInferenceBuffer:metadata:inferenceAttachedMediaKey:processorInput:err:](v72, "processorController:didFinishProcessingInferenceBuffer:metadata:inferenceAttachedMediaKey:processorInput:err:", v78, v29, v31, v28, v73, v96);
        CVPixelBufferRelease(v29);

        objc_msgSend(v11, "releaseBuffer");
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "tag"));
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v32 = (void *)objc_msgSend(v11, "performSelector:", sel_inferenceAttachmentKey);
        if ((objc_msgSend(v32, "isEqual:", 0x1E4951358) & 1) != 0
          || objc_msgSend(v32, "isEqual:", 0x1E4951338))
        {
          v33 = (void *)MEMORY[0x1E0C99E60];
          goto LABEL_36;
        }
        if ((objc_msgSend(v32, "isEqual:", 0x1E4951158) & 1) != 0
          || objc_msgSend(v32, "isEqual:", 0x1E4951058))
        {
          v33 = (void *)MEMORY[0x1E0C99E60];
          getVNFaceObservationClass();
LABEL_36:
          v34 = objc_msgSend(v33, "setWithObject:", objc_opt_class());
        }
        else
        {
          v34 = 0;
        }
        v35 = (void *)objc_msgSend(v11, "fetchWithCustomClassesAndRetain:err:", v34, &v96);
        -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingInference:inferenceAttachmentKey:processorInput:err:](v72, "processorController:didFinishProcessingInference:inferenceAttachmentKey:processorInput:err:", v78, v35, v32, v73, v96);

        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "tag"));
LABEL_52:
        p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___BWRedEyeReductionControllerDelegate + 56);
        goto LABEL_53;
      }
      if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class())
        && objc_msgSend((id)objc_msgSend(v11, "tag"), "isEqualToString:", v71))
      {
        v47 = (void *)objc_msgSend(v3, "copyDictionaryForTag:err:", v71, &v101);
        -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingInferenceAttachedMediaMetadata:processorInput:](v72, "processorController:didFinishProcessingInferenceAttachedMediaMetadata:processorInput:", v78, v47, v73);

      }
LABEL_53:
      objc_autoreleasePoolPop(v12);
      ++v10;
    }
    while (v7 != v10);
    v58 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
    v7 = v58;
  }
  while (v58);
LABEL_88:
  objc_autoreleasePoolPop(context);
LABEL_89:
  objc_msgSend(v3, "releaseIntermediates");
  -[BWStillImageProcessorControllerInput setProcessorController:](v73, "setProcessorController:", 0);
  return v101;
}

- (void)_sortedIntermediates
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend((id)objc_msgSend(result, "currentRequest"), "input");
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "container"), "captureSettings"), "captureFlags") & 4) == 0)
      return (void *)objc_msgSend((id)objc_msgSend(v2, "container"), "intermediates");
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "container"), "captureSettings"), "captureFlags");
    v4 = (void *)objc_msgSend(v2, "container");
    if (v3 < 0)
    {
      return (void *)objc_msgSend((id)objc_msgSend(v4, "intermediates"), "sortedArrayUsingComparator:", &__block_literal_global_104);
    }
    else
    {
      if (objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "captureType") != 12)
        return (void *)objc_msgSend((id)objc_msgSend(v2, "container"), "intermediates");
      v5 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "ultraHighResolutionSensorRawDimensions");
      return (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "container", MEMORY[0x1E0C809B0], 3221225472, __53__BWDeferredProcessorController__sortedIntermediates__block_invoke_2, &unk_1E49267C8, v2, v5), "intermediates"), "sortedArrayUsingComparator:", &v6);
    }
  }
  return result;
}

- (void)_handleDidDetermineReferenceFrameWithSortedIntermediates:(void *)result
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v26;
  CMTimeEpoch v27;
  __int128 v28;
  __CVBuffer *v29;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __CVBuffer *v35;
  const void *AttachedMedia;
  uint64_t v37;
  void *v38;
  const void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  CMSampleBufferRef v45;
  uint64_t v46;
  CMSampleTimingInfo *sampleTimingArray;
  CMSampleTimingInfo *sampleTimingArraya;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  CFTypeRef cf;
  id v54;
  CMSampleTimingInfo v55;
  CMTime v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CMSampleBufferRef v65;
  unsigned int v66;
  _BYTE v67[128];
  uint64_t v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v66 = 0;
  v65 = 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(result, "currentRequest"), "input");
  v5 = (void *)objc_msgSend(v4, "container");
  v6 = 0x1E0CB3000uLL;
  v52 = v3;
  if ((objc_msgSend((id)objc_msgSend(v4, "captureStreamSettings"), "captureFlags") & 4) == 0)
  {
    v7 = (void *)objc_msgSend(v5, "copyDictionaryForTag:err:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix, objc_msgSend(v4, "portType")), &v66);
    v8 = 0;
    if (v7)
    {
LABEL_4:
      v51 = v7;
      v9 = (id)objc_msgSend(v7, "mutableCopy");
      v10 = objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix, objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "masterPortType"));
      if (objc_msgSend(v5, "hasTag:", v10))
      {
        v11 = (void *)objc_msgSend(v5, "copyDictionaryForTag:err:", v10, &v66);
        objc_msgSend(v9, "addEntriesFromDictionary:", v11);

      }
      v12 = objc_alloc(MEMORY[0x1E0C99E08]);
      v13 = *MEMORY[0x1E0D05CB0];
      v68 = *MEMORY[0x1E0D05CB0];
      v69 = v9;
      v14 = (void *)objc_msgSend(v12, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "stillImageSettings"), "processingSettings"), "photoManifest"), CFSTR("PhotoManifest"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v5, "captureSettings"), CFSTR("BWStillImageCaptureSettings"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType")), CFSTR("StillImageCaptureType"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v5, "settings"), CFSTR("StillImageSettings"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v4, "stillImageSettings"), CFSTR("StillSettings"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8), CFSTR("StillImageCaptureFrameFlags"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "slaveLensFNumbers"), 0x1E495A8D8);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "slaveFocalLengths"), 0x1E495A8B8);
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "totalZoomFactor");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v15, "numberWithFloat:"), 0x1E4928E38);
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "uiZoomFactor");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v16, "numberWithFloat:"), 0x1E495A738);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "metadata"), "deviceType")), 0x1E495A2F8);
      v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "photoManifest"), "photoDescriptors"), "objectAtIndexedSubscript:", 0), "processingFlags");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17 & 0xFD5FFFFF), CFSTR("StillImageProcessingFlags"));
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDNGDictionaryPrefix, objc_msgSend(v4, "portType"));
      if (objc_msgSend(v5, "hasTag:", v18))
      {
        v19 = (void *)objc_msgSend(v5, "copyDictionaryForTag:err:", v18, &v66);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, 0x1E495ABF8);

      }
      v20 = -[BWDeferredProcessorController _getOriginalCameraIntrinsicsForPortType:](v3, objc_msgSend(v4, "portType"));
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v58 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        }
        while (v22);
      }
      memset(&v56, 0, sizeof(v56));
      v25 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      CMTimeMakeFromDictionary(&v56, (CFDictionaryRef)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
      v26 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
      *(_OWORD *)&v55.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
      *(_OWORD *)&v55.decodeTimeStamp.value = v26;
      v27 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
      v28 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
      *(_OWORD *)&v55.duration.value = *MEMORY[0x1E0CA2E90];
      v55.duration.epoch = v28;
      v55.decodeTimeStamp.epoch = v27;
      v55.presentationTimeStamp = v56;
      v66 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &v55, 0, 0, &v65);
      CMSetAttachments(v65, (CFDictionaryRef)v14, 1u);
      v7 = v51;
      if (objc_msgSend(v5, "hasBufferForType:portType:", 19, objc_msgSend(v4, "portType")))
      {
        v54 = 0;
        v29 = (__CVBuffer *)objc_msgSend(v5, "copyBufferForType:portType:metadata:err:", 19, objc_msgSend(v4, "portType"), &v54, &v66);
        if (!v66)
        {
          cf = 0;
          BWSampleBufferSetAttachedMediaFromPixelBuffer(v65, 0x1E4936818, v29, &cf, (uint64_t)v54, 0, 1);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          if (dword_1ECFE9A10)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        if (v29)
          CFRelease(v29);

      }
      v34 = v52;
      if (objc_msgSend(v5, "hasBufferForType:portType:", 2001, objc_msgSend(v4, "portType", sampleTimingArray, v49)))
      {
        v54 = 0;
        v35 = (__CVBuffer *)objc_msgSend(v5, "copyBufferForType:portType:metadata:err:", 2001, objc_msgSend(v4, "portType"), &v54, &v66);
        if (!v66)
        {
          cf = 0;
          BWSampleBufferSetAttachedMediaFromPixelBuffer(v65, (uint64_t)CFSTR("Depth"), v35, &cf, (uint64_t)v54, 0, 0);
          AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v65, (uint64_t)CFSTR("Depth"));
          v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDepthMetadata, objc_msgSend(v4, "portType"));
          if (objc_msgSend(v5, "hasTag:", v37))
          {
            v38 = (void *)objc_msgSend(v5, "copyDictionaryForTag:err:", v37, &v66);
            v39 = (const void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v38);
            CMSetAttachment(v65, (CFStringRef)*MEMORY[0x1E0D086F0], v39, 1u);

          }
          v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDepthData, objc_msgSend(v4, "portType"));
          if (objc_msgSend(v5, "hasTag:", v40))
          {
            v41 = (void *)objc_msgSend(v5, "copyDictionaryForTag:err:", v40, &v66);
            v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v41);
            CMSetAttachment(AttachedMedia, CFSTR("DepthPixelBufferType"), (CFTypeRef)objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("DepthPixelBufferType")), 1u);
            objc_msgSend(v42, "setObject:forKeyedSubscript:", 0, CFSTR("DepthPixelBufferType"));
            CMSetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05C28], v42, 1u);

          }
          v7 = v51;
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          if (dword_1ECFE9A10)
          {
            v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v34 = v52;
          }
        }
        if (v35)
          CFRelease(v35);

      }
      v44 = (void *)objc_msgSend((id)objc_msgSend(v34, "currentRequest", sampleTimingArraya, v50), "delegate");
      v45 = v65;
      v46 = objc_msgSend((id)objc_msgSend(v34, "currentRequest"), "input");
      objc_msgSend(v44, "processorController:didDetermineReferenceFrame:processorInput:err:", v34, v45, v46, v66);
      goto LABEL_51;
    }
    goto LABEL_33;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v14 = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v14)
  {
    v31 = *(_QWORD *)v62;
LABEL_23:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v31)
        objc_enumerationMutation(a2);
      v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v32);
      if (objc_msgSend(v33, "isMemberOfClass:", objc_opt_class()))
      {
        if ((objc_msgSend(v33, "captureFrameFlags") & 0x10) != 0
          && objc_msgSend((id)objc_msgSend(v33, "portType"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "masterPortType")))
        {
          break;
        }
      }
      if (v14 == (void *)++v32)
      {
        v14 = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v14)
          goto LABEL_23;
        goto LABEL_31;
      }
    }
    v7 = (void *)objc_msgSend(v5, "copyDictionaryForTag:err:", objc_msgSend(v33, "metadataTag"), &v66);
    v8 = objc_msgSend(v33, "captureFrameFlags");
    v3 = v52;
    v6 = 0x1E0CB3000;
    if (v7)
      goto LABEL_4;
LABEL_33:
    v14 = 0;
    goto LABEL_51;
  }
LABEL_31:
  v7 = 0;
LABEL_51:
  if (v65)
    CFRelease(v65);

  return (void *)v66;
}

__CVBuffer *__40__BWDeferredProcessorController_process__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CVBuffer *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  if (!a2)
    return 0;
  v6 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "copyBufferForTag:err:", a2, &v12);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  if (v12)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3 && v6)
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyMetadataForTag:err:", a3, &v12);
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a3);
    if (v9)
    {
      CVBufferSetAttachment(v6, (CFStringRef)*MEMORY[0x1E0D05CB0], v9, kCVAttachmentMode_ShouldPropagate);
    }
    else
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }

  }
  return v6;
}

- (uint64_t)_sensorRawSampleBufferWithBuffer:(void *)a3 metadata:(const void *)a4 rawThumbnailsBuffer:(const void *)a5 mainRawThumbnailBuffer:(const void *)a6 sifrRawThumbnailBuffer:(const void *)a7 dngDictionary:(uint64_t)a8 captureFrameFlags:(void *)a9 stillImageSettings:(CMSampleBufferRef *)a10 sampleBufferOut:
{
  uint64_t v11;
  id v18;
  void *v19;
  int v20;
  CFStringRef *v21;
  CMSampleBufferRef v22;
  void *v23;
  CMSampleBufferRef v24;
  void *v25;
  CMSampleTimingInfo sampleTimingArray;
  CMTime v29;
  CMSampleBufferRef v30[2];

  if (!a1)
    return 0;
  v30[0] = 0;
  v11 = 4294954516;
  if (a2 && a3 && a9 && a10)
  {
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeFromDictionary(&v29, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
    if ((a8 & 0x4000000000000000) != 0)
    {
      sampleTimingArray.duration = v29;
      v11 = BWSampleBufferCreateFromPixelBuffer(a2, (uint64_t)&sampleTimingArray, (CFTypeRef *)(a1 + 56), v30);
    }
    else
    {
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E18];
      sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      sampleTimingArray.presentationTimeStamp = v29;
      sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
      v11 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, v30);
      v18 = objc_alloc(MEMORY[0x1E0C99D80]);
      v19 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", a2, *MEMORY[0x1E0D05BD0], 0);
      v20 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D80]), "BOOLValue");
      v21 = (CFStringRef *)MEMORY[0x1E0D05D40];
      if (!v20)
        v21 = (CFStringRef *)MEMORY[0x1E0D05D20];
      CMSetAttachment(v30[0], *v21, v19, 1u);

    }
    if (!(_DWORD)v11)
    {
      CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E0D05CB0], a3, 1u);
      CMSetAttachment(v30[0], CFSTR("StillSettings"), a9, 1u);
      CMSetAttachment(v30[0], CFSTR("StillImageSettings"), (CFTypeRef)objc_msgSend(a9, "requestedSettings"), 1u);
      CMSetAttachment(v30[0], CFSTR("BWStillImageCaptureSettings"), (CFTypeRef)objc_msgSend(a9, "captureSettings"), 1u);
      CMSetAttachment(v30[0], CFSTR("StillImageCaptureType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "captureType")), 1u);
      CMSetAttachment(v30[0], CFSTR("PhotoManifest"), (CFTypeRef)objc_msgSend((id)objc_msgSend(a9, "processingSettings"), "photoManifest"), 1u);
      CMSetAttachment(v30[0], CFSTR("StillImageCaptureFrameFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a8), 1u);
      CMSetAttachment(v30[0], CFSTR("ExifSlaveLensFNumbers"), (CFTypeRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "slaveLensFNumbers"), 1u);
      CMSetAttachment(v30[0], CFSTR("ExifSlaveFocalLengths"), (CFTypeRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "slaveFocalLengths"), 1u);
      v22 = v30[0];
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "totalZoomFactor");
      CMSetAttachment(v22, CFSTR("TotalZoomFactor"), (CFTypeRef)objc_msgSend(v23, "numberWithFloat:"), 1u);
      v24 = v30[0];
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "uiZoomFactor");
      CMSetAttachment(v24, CFSTR("UIZoomFactor"), (CFTypeRef)objc_msgSend(v25, "numberWithFloat:"), 1u);
      CMSetAttachment(v30[0], CFSTR("CaptureDeviceType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a9, "captureSettings"), "metadata"), "deviceType")), 1u);
      if (a4)
        CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E0D05D30], a4, 1u);
      if (a5)
        CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E0D05CA8], a5, 1u);
      if (a6)
        CMSetAttachment(v30[0], (CFStringRef)*MEMORY[0x1E0D05D48], a6, 1u);
      if (a7)
        CMSetAttachment(v30[0], CFSTR("RawDNGDictionary"), a7, 1u);
      v11 = 0;
      *a10 = v30[0];
    }
  }
  return v11;
}

- (id)_getOriginalCameraIntrinsicsForPortType:(id)result
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  if (result)
  {
    if (a2)
    {
      v2 = result;
      v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix, a2);
      v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "currentRequest"), "input"), "container");
      if (objc_msgSend(v4, "hasTag:", v3))
      {
        v6 = 0;
        v5 = (void *)objc_msgSend(v4, "copyDictionaryForTag:err:", v3, &v6);
        return v5;
      }
    }
    else
    {
      FigDebugAssert3();
    }
    v5 = 0;
    return v5;
  }
  return result;
}

uint64_t __53__BWDeferredProcessorController__sortedIntermediates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (objc_msgSend(a2, "isMemberOfClass:", objc_opt_class()))
    return FigCapturePixelFormatIsVersatileRaw(objc_msgSend(a2, "pixelFormat"));
  if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return FigCapturePixelFormatIsVersatileRaw(objc_msgSend(a3, "pixelFormat")) << 63 >> 63;
  return 0;
}

uint64_t __53__BWDeferredProcessorController__sortedIntermediates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  int IsVersatileRaw;
  int v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  BOOL v22;

  if (!objc_msgSend(a2, "isMemberOfClass:", objc_opt_class())
    || !objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
  {
    if ((objc_msgSend(a2, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
      return -1;
    return (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) != 0;
  }
  IsVersatileRaw = FigCapturePixelFormatIsVersatileRaw(objc_msgSend(a2, "pixelFormat"));
  v7 = FigCapturePixelFormatIsVersatileRaw(objc_msgSend(a3, "pixelFormat"));
  v8 = objc_msgSend(a2, "captureFrameFlags");
  v9 = objc_msgSend(a3, "captureFrameFlags");
  v10 = objc_msgSend(a2, "bufferType");
  v11 = objc_msgSend(a3, "bufferType");
  if (!IsVersatileRaw || !v7)
  {
    if (IsVersatileRaw)
      result = -1;
    else
      result = 1;
    if (((IsVersatileRaw | v7) & 1) != 0)
      return result;
    return 0;
  }
  v12 = v11;
  if (v10 == v11)
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "container"), "captureSettings"), "captureFlags") & 0x200000000) == 0)
    {
      if ((v8 & 4) == 0)
      {
        if ((v9 & 4) != 0)
          return 1;
        if ((v8 & 8) == 0)
        {
          if ((v9 & 8) != 0)
            return 1;
          if ((v8 & 0x10) == 0)
          {
            if ((v9 & 0x10) != 0)
              return 1;
            if ((v8 & 2) == 0)
            {
              if ((v9 & 2) == 0)
              {
LABEL_42:
                if (v10 == 37)
                  return -1;
                else
                  return v12 == 37;
              }
              return 1;
            }
          }
        }
      }
      return -1;
    }
    v14 = (void *)objc_msgSend(a2, "attributes");
    v15 = *MEMORY[0x1E0CA90E0];
    v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue");
    v17 = (void *)objc_msgSend(a2, "attributes");
    v18 = *MEMORY[0x1E0CA8FD8];
    v19 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue");
    LODWORD(v15) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKeyedSubscript:", v15), "intValue");
    v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKeyedSubscript:", v18), "intValue");
    v21 = FigCaptureVideoDimensionsAreEqual(v16 | (unint64_t)(v19 << 32), *(_QWORD *)(a1 + 40));
    v22 = FigCaptureVideoDimensionsAreEqual(v15 | (unint64_t)(v20 << 32), *(_QWORD *)(a1 + 40));
    if (v21)
      result = -1;
    else
      result = 1;
    if (!v21 && !v22)
    {
      if ((v8 & 4) == 0)
      {
        if ((v9 & 4) != 0)
          return 1;
        if ((v8 & 8) == 0)
        {
          if ((v9 & 8) != 0)
            return 1;
          if ((v8 & 0x10) == 0)
          {
            if ((v9 & 0x10) != 0)
              return 1;
            if ((v8 & 0x12) != 2)
            {
              if ((v9 & 0x12) != 2)
                goto LABEL_42;
              return 1;
            }
          }
        }
      }
      return -1;
    }
  }
  else if (v10 == 1)
  {
    return -1;
  }
  else
  {
    return 1;
  }
  return result;
}

@end
