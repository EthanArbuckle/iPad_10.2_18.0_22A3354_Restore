@implementation AVTCompositorPipelineCache

- (AVTCompositorPipelineCache)initWithMetalHelper:(id)a3
{
  id v5;
  AVTCompositorPipelineCache *v6;
  AVTCompositorPipelineCache *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *pipelines;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTCompositorPipelineCache;
  v6 = -[AVTCompositorPipelineCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_helper, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pipelines = v7->_pipelines;
    v7->_pipelines = v8;

  }
  return v7;
}

- (id)pipelineForPropertyName:(id)a3
{
  id v4;
  AVTCompositorPipeline *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pipelines, "objectForKeyedSubscript:", v4);
  v5 = (AVTCompositorPipeline *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("compositor_%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMetalHelper functionNamed:](self->_helper, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AVTCompositorPipeline initWithFunction:]([AVTCompositorPipeline alloc], "initWithFunction:", v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipelines, "setObject:forKeyedSubscript:", v5, v4);

  }
  return v5;
}

+ (id)pipelineForPropertyName:(id)a3 device:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  AVTCompositorPipelineCache *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&pipelineForPropertyName_device__lock);
  if (!pipelineForPropertyName_device__cachePerDevice)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)pipelineForPropertyName_device__cachePerDevice;
    pipelineForPropertyName_device__cachePerDevice = (uint64_t)v7;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "registryID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)pipelineForPropertyName_device__cachePerDevice, "objectForKeyedSubscript:", v9);
  v10 = (AVTCompositorPipelineCache *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AVTCompositorPipelineCache initWithMetalHelper:]([AVTCompositorPipelineCache alloc], "initWithMetalHelper:", v11);
    objc_msgSend((id)pipelineForPropertyName_device__cachePerDevice, "setObject:forKeyedSubscript:", v10, v9);

  }
  -[AVTCompositorPipelineCache pipelineForPropertyName:](v10, "pipelineForPropertyName:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&pipelineForPropertyName_device__lock);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelines, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
