@implementation AVAssetReaderOutputAnnotationAdaptor

+ (id)assetReaderOutputAnnotationAdaptorWithAssetReaderTrackOutput:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAssetReaderTrackOutput:", a3);
}

- (AVAssetReaderOutputAnnotationAdaptor)init
{
  return -[AVAssetReaderOutputAnnotationAdaptor initWithAssetReaderTrackOutput:](self, "initWithAssetReaderTrackOutput:", 0);
}

- (AVAssetReaderOutputAnnotationAdaptor)initWithAssetReaderTrackOutput:(id)a3
{
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  AVAssetReaderOutputAnnotationAdaptor *v9;
  AVAssetReaderOutputAnnotationAdaptor *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  AVAssetReaderOutputAnnotationAdaptor *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  AVAssetReaderOutputAnnotationAdaptor *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  AVAssetReaderOutputAnnotationAdaptor *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (!a3)
  {
    v11 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "trackOutput != nil";
LABEL_10:
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)v19);
    v22 = v17;
    v23 = v18;
    goto LABEL_14;
  }
  v8 = (uint64_t)v7;
  if ((objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("meta")) & 1) == 0)
  {
    v20 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "[[trackOutput mediaType] isEqualToString:AVMediaTypeMetadata]";
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "_isAttachedToAdaptor"))
  {
    v24 = self;
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot initialize an instance of %@ with a track output which was used to initialize another instance of %@"), v27, v28, v29, v30, v31, v8);
LABEL_13:
    v21 = v32;
    v22 = v25;
    v23 = v26;
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v21, 0));
  }
  if (objc_msgSend(a3, "_status") >= 1)
  {
    v33 = self;
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot initialize an instance of %@ with a track output which has already progressed beyond AVAssetReaderStatusUnknown"), v34, v35, v36, v37, v38, v8);
    goto LABEL_13;
  }
  v39.receiver = self;
  v39.super_class = (Class)AVAssetReaderOutputAnnotationAdaptor;
  v9 = -[AVAssetReaderOutputAnnotationAdaptor init](&v39, sel_init);
  if (v9)
  {
    v9->_trackOutput = (AVAssetReaderTrackOutput *)a3;
    v9->_assetReaderOutputMetadataAdaptor = +[AVAssetReaderOutputMetadataAdaptor assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:](AVAssetReaderOutputMetadataAdaptor, "assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:", a3);
    objc_msgSend(a3, "_setAttachedAdaptor:", v9);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetReaderOutputAnnotationAdaptor;
  -[AVAssetReaderOutputAnnotationAdaptor dealloc](&v3, sel_dealloc);
}

- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6
{
  uint64_t v9;
  uint64_t (*v10)(OpaqueFigAssetReader *, uint64_t, id, int *);

  v9 = objc_msgSend((id)objc_msgSend(a3, "track"), "trackID");
  v10 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 24);
  if (v10)
    return v10(a4, v9, a5, a6);
  else
    return -12782;
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_trackOutput;
}

- (id)nextAnnotation
{
  void *v3;
  AVTimedMetadataGroup *v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_assetReaderOutputMetadataAdaptor, "nextTimedMetadataGroup");
  if (v4)
  {
    v14 = v3;
    v5 = -[AVTimedMetadataGroup items](v4, "items");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      v10 = *MEMORY[0x1E0CA2440];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqualToString:", 0x1E303D358))
          {
            if (objc_msgSend((id)objc_msgSend(v12, "dataType"), "isEqualToString:", v10))
            {
              objc_msgSend(v12, "value");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v6, "addObject:", +[AVAnnotationRepresentation _createBindingDictionaryFromMetadataItemPayload:error:](AVAnnotationRepresentation, "_createBindingDictionaryFromMetadataItemPayload:error:", objc_msgSend(v12, "value"), 0));
            }
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke;
    v15[3] = &unk_1E3034888;
    v15[4] = v6;
    v3 = v14;
    v15[5] = v14;
    -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v15);
  }
  return (id)objc_msgSend(v3, "firstObject");
}

uint64_t __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqualToString:", 0x1E303D338);
    if ((_DWORD)result)
    {
      objc_msgSend(a2, "value");
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) != 0)
      {
        v14 = objc_msgSend(a2, "value");
        v5 = +[AVAnnotation annotationPropertyListToNonDataBindingsArray:](AVAnnotation, "annotationPropertyListToNonDataBindingsArray:");
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v18;
          v9 = MEMORY[0x1E0C809B0];
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v18 != v8)
                objc_enumerationMutation(v5);
              v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "objectForKey:", 0x1E3036B98);
              v12 = *(void **)(a1 + 32);
              v16[0] = v9;
              v16[1] = 3221225472;
              v16[2] = __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke_2;
              v16[3] = &unk_1E3030948;
              v16[4] = v11;
              v13 = objc_msgSend(v12, "indexOfObjectPassingTest:", v16);
              if (v13 != 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v15, "addObject:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v13));
              ++v10;
            }
            while (v7 != v10);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v7);
        }
        return objc_msgSend(*(id *)(a1 + 40), "addObject:", -[AVAnnotation initWithJSONData:representationBinaryDataBindings:error:]([AVAnnotation alloc], "initWithJSONData:representationBinaryDataBindings:error:", objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v14, 0, 0), v15, 0));
      }
    }
  }
  return result;
}

uint64_t __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "objectForKey:", 0x1E3036B98));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

@end
