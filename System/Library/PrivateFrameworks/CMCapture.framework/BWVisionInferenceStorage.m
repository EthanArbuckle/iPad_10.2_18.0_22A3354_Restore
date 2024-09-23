@implementation BWVisionInferenceStorage

+ (void)initialize
{
  objc_opt_class();
}

- (BWVisionInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4
{
  BWVisionInferenceStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWVisionInferenceStorage;
  v4 = -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](&v6, sel_initWithRequirementsNeedingPixelBuffers_requirementsNeedingPixelBufferPools_, a3, a4);
  if (v4)
    v4->_requestsByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceStorage;
  -[BWInferenceProviderStorage dealloc](&v3, sel_dealloc);
}

- (id)requestForRequirement:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestsByRequirement, "objectForKeyedSubscript:", a3);
}

- (void)setRequest:(id)a3 forRequirement:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsByRequirement, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)removeRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)-[NSMutableDictionary allKeysForObject:](self->_requestsByRequirement, "allKeysForObject:", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary removeObjectForKey:](self->_requestsByRequirement, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  -[BWVisionInferenceStorage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)objc_msgSend(a3, "metadataKeys");
  v7 = -[BWVisionInferenceStorage requestForRequirement:](self, "requestForRequirement:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v7, "results");
    if (v8)
      v9 = (void *)v8;
    else
      v9 = (void *)MEMORY[0x1E0C9AA60];
    v10 = objc_msgSend(a3, "mappingOption");
    v11 = v10;
    if (!v10 || v10 == 2)
    {
      v12 = objc_msgSend(v6, "count");
      v13 = objc_msgSend(v9, "count");
      if (v12 >= v13)
        v14 = v13;
      else
        v14 = v12;
      if (v14)
      {
        v15 = v13;
        for (i = 0; i != v14; ++i)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectAtIndexedSubscript:", i), objc_msgSend(v6, "objectAtIndexedSubscript:", i));
        if (v11 == 2 && v12 < v15)
        {
          v17 = objc_msgSend(v6, "objectAtIndexedSubscript:", v14 - 1);
          v18 = objc_msgSend(v5, "objectForKey:", v17);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v18, 0);
          do
            objc_msgSend(v19, "addObject:", objc_msgSend(v9, "objectAtIndexedSubscript:", v14++));
          while (v15 != v14);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v17);

        }
      }
    }
    else if (v10 == 1)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, objc_msgSend(v6, "firstObject"));
    }
  }
  return v5;
}

@end
