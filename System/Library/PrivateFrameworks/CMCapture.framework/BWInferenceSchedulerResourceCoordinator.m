@implementation BWInferenceSchedulerResourceCoordinator

- (int)requestPixelBufferPoolForRequirement:(id)a3 size:(unint64_t)a4
{
  return -[BWInferenceSchedulerResourceCoordinator requestPixelBufferPoolForFormat:size:](self, "requestPixelBufferPoolForFormat:size:", objc_msgSend(a3, "videoFormat"), a4);
}

- (int)requestPixelBufferPoolForFormat:(id)a3 size:(unint64_t)a4
{
  void *v7;

  if (self->_pixelBufferPoolByFormat)
    return FigSignalErrorAt();
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestedPoolSizeByFormat, "objectForKeyedSubscript:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestedPoolSizeByFormat, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4 + (int)objc_msgSend(v7, "intValue")), a3);
  return 0;
}

- (id)pixelBufferPoolForFormat:(id)a3
{
  NSMutableDictionary *pixelBufferPoolByFormat;

  pixelBufferPoolByFormat = self->_pixelBufferPoolByFormat;
  if (!pixelBufferPoolByFormat)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Coordinator has not prepared shared pixel buffer pools!"), 0));
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](pixelBufferPoolByFormat, "objectForKeyedSubscript:", a3);
}

- (BWInferenceSchedulerResourceCoordinator)init
{
  BWInferenceSchedulerResourceCoordinator *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceSchedulerResourceCoordinator;
  v2 = -[BWInferenceSchedulerResourceCoordinator init](&v4, sel_init);
  if (v2)
  {
    v2->_requestedPoolSizeByFormat = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_pixelBufferPoolByFormat = 0;
  }
  return v2;
}

- (void)preparePixelBufferPoolsWithBackPressureDrivenPipelining:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BWPixelBufferPool *v12;
  uint64_t v13;
  NSMutableDictionary *obj;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_pixelBufferPoolByFormat)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Coordinator has already prepared shared pixel buffer pools!"), 0));
  v3 = a3;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_requestedPoolSizeByFormat;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = (int)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestedPoolSizeByFormat, "objectForKeyedSubscript:", v9), "intValue");
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Inference pool for %@"), objc_msgSend(v9, "description"));
        LOBYTE(v13) = v3;
        v12 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", objc_msgSend(v9, "underlyingVideoFormat"), v10, v11, 0, +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), v3, v13);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  self->_pixelBufferPoolByFormat = (NSMutableDictionary *)v15;

}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerResourceCoordinator;
  -[BWInferenceSchedulerResourceCoordinator dealloc](&v3, sel_dealloc);
}

- (id)formatsWithRequestedPoolsRemainingAfterSubtractingFormats:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[NSMutableDictionary allKeys](self->_pixelBufferPoolByFormat, "allKeys"));
  objc_msgSend(v4, "minusSet:", a3);
  return (id)objc_msgSend(v4, "allObjects");
}

@end
