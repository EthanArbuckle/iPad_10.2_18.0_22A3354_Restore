@implementation BWFusionTrackerInferencePropagator

- (BWFusionTrackerInferencePropagator)initWithInputVideoRequirement:(id)a3 outputTensorRequirements:(id)a4 operation:(int64_t)a5
{
  BWFusionTrackerInferencePropagator *v8;
  BWFusionTrackerInferencePropagator *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWFusionTrackerInferencePropagator;
  v8 = -[BWFusionTrackerInferencePropagator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_operation = a5;
    v8->_outputTensorRequirements = (NSMutableDictionary *)a4;
    v9->_inputVideoRequirement = (BWInferenceVideoRequirement *)a3;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFusionTrackerInferencePropagator;
  -[BWFusionTrackerInferencePropagator dealloc](&v3, sel_dealloc);
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSMutableDictionary *outputTensorRequirements;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *FTEspressoBufferClass;
  CGPoint v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int64_t operation;
  uint64_t v30;
  void *FTTapToBoxClass;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  CGPoint v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  double v48;
  CFDictionaryRef DictionaryRepresentation;
  opaqueCMSampleBuffer *obj;
  NSMutableDictionary *obja;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGRect v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputVideoRequirement);
  obj = a6;
  v10 = (void *)objc_msgSend((id)CMGetAttachment(a6, CFSTR("FusionTrackerInput"), 0), "highPriorityTrackerState");
  if (!v9)
    goto LABEL_30;
  v11 = v10;
  if ((objc_msgSend(v10, "completed") & 1) != 0)
    goto LABEL_30;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  outputTensorRequirements = self->_outputTensorRequirements;
  v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](outputTensorRequirements, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v68 != v16)
          objc_enumerationMutation(outputTensorRequirements);
        v18 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        v19 = objc_msgSend(a4, "tensorForRequirement:", -[NSMutableDictionary objectForKeyedSubscript:](self->_outputTensorRequirements, "objectForKeyedSubscript:", v18));
        FTEspressoBufferClass = (void *)getFTEspressoBufferClass();
        v21 = *(CGPoint *)v19;
        v22 = *(_OWORD *)(v19 + 32);
        v57.size = *(CGSize *)(v19 + 16);
        v58 = v22;
        v57.origin = v21;
        v23 = *(_OWORD *)(v19 + 48);
        v24 = *(_OWORD *)(v19 + 64);
        v25 = *(_OWORD *)(v19 + 96);
        v61 = *(_OWORD *)(v19 + 80);
        v62 = v25;
        v59 = v23;
        v60 = v24;
        v26 = *(_OWORD *)(v19 + 112);
        v27 = *(_OWORD *)(v19 + 128);
        v28 = *(_OWORD *)(v19 + 144);
        v66 = *(_QWORD *)(v19 + 160);
        v64 = v27;
        v65 = v28;
        v63 = v26;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(FTEspressoBufferClass, "bufferWithEspressoBuffer:", &v57), v18);
      }
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](outputTensorRequirements, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v15);
  }
  operation = self->_operation;
  switch(operation)
  {
    case 1:
      targetRectForSampleBuffer(obj);
      if (!objc_msgSend(v11, "postProcessExemplarOutputs:forTargetRect:", v12))
        goto LABEL_28;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      obja = self->_outputTensorRequirements;
      v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v54 != v35)
              objc_enumerationMutation(obja);
            v37 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
            v38 = objc_msgSend(a4, "tensorForRequirement:", -[NSMutableDictionary objectForKeyedSubscript:](self->_outputTensorRequirements, "objectForKeyedSubscript:", v37));
            v39 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)v38, bweis_storageLengthInBytes(v38));
            v66 = 0;
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            memset(&v57, 0, sizeof(v57));
            v40 = *(CGPoint *)v38;
            v41 = *(_OWORD *)(v38 + 32);
            v57.size = *(CGSize *)(v38 + 16);
            v58 = v41;
            v57.origin = v40;
            v42 = *(_OWORD *)(v38 + 48);
            v43 = *(_OWORD *)(v38 + 64);
            v44 = *(_OWORD *)(v38 + 96);
            v61 = *(_OWORD *)(v38 + 80);
            v62 = v44;
            v59 = v42;
            v60 = v43;
            v45 = *(_OWORD *)(v38 + 112);
            v46 = *(_OWORD *)(v38 + 128);
            v47 = *(_OWORD *)(v38 + 144);
            v66 = *(_QWORD *)(v38 + 160);
            v64 = v46;
            v65 = v47;
            v63 = v45;
            *(_QWORD *)&v57.origin.x = objc_msgSend(v39, "bytes");
            objc_msgSend((id)objc_msgSend(v11, "sessionStorage"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v57, "{?=^v^v[4Q][4Q]QQQQQQQQQQi}"), v37);
            objc_msgSend((id)objc_msgSend(v11, "sessionStorage"), "setObject:forKeyedSubscript:", v39, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_underlying_data"), v37));
          }
          v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
        }
        while (v34);
      }
      break;
    case 2:
      if ((objc_msgSend(v11, "postProcessInstanceOutputs:", v12) & 1) != 0)
        break;
      goto LABEL_28;
    case 3:
      v30 = objc_msgSend(a4, "tensorForRequirement:", objc_msgSend((id)-[NSMutableDictionary allValues](self->_outputTensorRequirements, "allValues"), "firstObject"));
      *(_QWORD *)&v58 = 0;
      memset(&v57, 0, sizeof(v57));
      FTTapToBoxClass = (void *)getFTTapToBoxClass();
      if (FTTapToBoxClass)
      {
        objc_msgSend(FTTapToBoxClass, "postProcessNetworkOutput:", v30);
        v32 = *(double *)&v58;
      }
      else
      {
        *(_QWORD *)&v58 = 0;
        v32 = 0.0;
        memset(&v57, 0, sizeof(v57));
      }
      objc_msgSend((id)getFTTapToBoxClass(), "defaultConfidenceThreshold");
      if (v32 < v48)
      {
LABEL_28:
        objc_msgSend(v11, "abort");
        break;
      }
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v57);
      CMSetAttachment(obj, CFSTR("BWInferenceAttachmentKey_FusionTrackerTargetRect"), DictionaryRepresentation, 1u);
      objc_msgSend(a3, "addEntriesFromDictionary:", DictionaryRepresentation);

      break;
    default:
      break;
  }
LABEL_30:
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end
