@implementation BWEspressoInferenceFaceprintPropagator

- (BWEspressoInferenceFaceprintPropagator)initWithFaceprintRequirement:(id)a3 faceprintSizeBytes:(unint64_t)a4 confidenceRequirement:(id)a5 maxFaces:(unint64_t)a6 faceIndex:(unint64_t)a7
{
  BWEspressoInferenceFaceprintPropagator *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BWEspressoInferenceFaceprintPropagator;
  v12 = -[BWEspressoInferenceFaceprintPropagator init](&v15, sel_init);
  if (v12)
  {
    v12->_faceprintRequirement = (BWInferenceMetadataRequirement *)objc_msgSend(a3, "copy");
    v13 = objc_msgSend(a5, "copy");
    v12->_maxFaces = a6;
    v12->_faceIndex = a7;
    v12->_confidenceRequirement = (BWInferenceMetadataRequirement *)v13;
    v12->_faceprintSizeBytes = a4;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceFaceprintPropagator;
  -[BWEspressoInferenceFaceprintPropagator dealloc](&v3, sel_dealloc);
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _DWORD **v13;
  const __CFString *v14;
  id v15;
  const __CFString *v16;
  CFTypeRef v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  double v21;

  v10 = objc_msgSend(a4, "tensorForRequirement:", self->_faceprintRequirement);
  if (v10)
  {
    v11 = (_QWORD *)v10;
    v12 = objc_msgSend(a4, "tensorForRequirement:", self->_confidenceRequirement);
    if (v12)
    {
      v13 = (_DWORD **)v12;
      v14 = -[NSArray firstObject](-[BWInferenceMetadataRequirement metadataKeys](self->_faceprintRequirement, "metadataKeys"), "firstObject");
      v15 = (id)CMGetAttachment(a6, v14, 0);
      v16 = -[NSArray firstObject](-[BWInferenceMetadataRequirement metadataKeys](self->_confidenceRequirement, "metadataKeys"), "firstObject");
      v17 = CMGetAttachment(a6, v16, 0);
      v18 = (id)v17;
      if (v15)
      {
        if (v17)
        {
LABEL_14:
          objc_msgSend(v15, "replaceObjectAtIndex:withObject:", self->_faceIndex, objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *v11, self->_faceprintSizeBytes));
          LODWORD(v21) = **v13;
          objc_msgSend(v18, "replaceObjectAtIndex:withObject:", self->_faceIndex, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21));
          objc_msgSend(a3, "setObject:forKeyedSubscript:", v15, v14);
          objc_msgSend(a3, "setObject:forKeyedSubscript:", v18, v16);
          return;
        }
      }
      else
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (self->_maxFaces)
        {
          v19 = 0;
          do
            objc_msgSend(v15, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), v19++);
          while (self->_maxFaces > v19);
        }
        CMSetAttachment(a6, v14, v15, 1u);

        if (v18)
          goto LABEL_14;
      }
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (self->_maxFaces)
      {
        v20 = 0;
        do
          objc_msgSend(v18, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), v20++);
        while (self->_maxFaces > v20);
      }
      CMSetAttachment(a6, v16, v18, 1u);

      goto LABEL_14;
    }
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end
