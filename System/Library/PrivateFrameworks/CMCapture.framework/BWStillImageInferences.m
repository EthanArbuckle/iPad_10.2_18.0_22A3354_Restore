@implementation BWStillImageInferences

- (BWStillImageInferences)init
{
  BWStillImageInferences *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageInferences;
  v2 = -[BWStillImageInferences init](&v4, sel_init);
  if (v2)
  {
    v2->_inferenceBufferByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_metadataByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_inferenceByAttachmentKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageInferences;
  -[BWStillImageInferences dealloc](&v3, sel_dealloc);
}

- (void)addInferenceBuffer:(__CVBuffer *)a3 metadata:(id)a4 inferenceAttachedMediaKey:(id)a5
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inferenceBufferByAttachedMediaKey, "setObject:forKeyedSubscript:", a3, a5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadataByAttachedMediaKey, "setObject:forKeyedSubscript:", a4, a5);
}

- (__CVBuffer)inferenceBufferForAttachedMediaKey:(id)a3
{
  return (__CVBuffer *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inferenceBufferByAttachedMediaKey, "objectForKeyedSubscript:", a3);
}

- (id)metadataForAttachedMediaKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadataByAttachedMediaKey, "objectForKeyedSubscript:", a3);
}

- (void)addInference:(id)a3 inferenceAttachmentKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inferenceByAttachmentKey, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)inferenceForAttachmentKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_inferenceByAttachmentKey, "objectForKeyedSubscript:", a3);
}

- (void)addInferenceAttachedMediaMetadata:(id)a3
{
  NSDictionary *inferenceAttachedMediaMetadata;

  inferenceAttachedMediaMetadata = self->_inferenceAttachedMediaMetadata;
  if (inferenceAttachedMediaMetadata != a3)
  {

    self->_inferenceAttachedMediaMetadata = (NSDictionary *)a3;
  }
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  NSMutableDictionary *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_inferenceByAttachmentKey;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = objc_msgSend(v5, "length");
        v10 = CFSTR(", ");
        if (!v9)
          v10 = &stru_1E4928818;
        v5 = (void *)objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%@%@"), v10, v8);
        v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_inferenceByAttachmentKey, "objectForKeyedSubscript:", v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v5 = (void *)objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(":%lu"), objc_msgSend(v11, "count"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v5 = (void *)objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(":%lu"), objc_msgSend(v11, "count"));
      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: inferenceBuffers:%@ inferenceAttachments:%@ inferenceAttachedMediaMetadata:%lu"), objc_opt_class(), self, objc_msgSend((id)-[NSMutableDictionary allKeys](self->_inferenceBufferByAttachedMediaKey, "allKeys"), "componentsJoinedByString:", CFSTR(",")), v5, -[NSDictionary count](self->_inferenceAttachedMediaMetadata, "count"));
}

- (NSDictionary)inferenceAttachedMediaMetadata
{
  return self->_inferenceAttachedMediaMetadata;
}

@end
