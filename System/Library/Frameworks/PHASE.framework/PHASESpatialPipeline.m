@implementation PHASESpatialPipeline

- (PHASESpatialPipeline)init
{
  -[PHASESpatialPipeline doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESpatialPipeline)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (BOOL)addToDictionary:(id)a3 add:(BOOL)a4 key:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  Phase::Logger *v10;
  PHASESpatialPipelineEntry *v11;
  BOOL v12;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = (PHASESpatialPipelineEntry *)objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10) + 432));
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315650;
      v16 = "PHASESpatialPipeline.mm";
      v17 = 1024;
      v18 = 94;
      v19 = 2080;
      v20 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _os_log_impl(&dword_2164CC000, &v11->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d Dictionary already has entry for key %s.", (uint8_t *)&v15, 0x1Cu);
    }
  }
  else
  {
    if (!v6)
    {
      v12 = 1;
      goto LABEL_6;
    }
    v11 = objc_alloc_init(PHASESpatialPipelineEntry);
    if (v11)
    {
      objc_msgSend(v7, "setValue:forKey:", v11, v8);
      v12 = 1;
      goto LABEL_5;
    }
    v14 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315394;
      v16 = "PHASESpatialPipeline.mm";
      v17 = 1024;
      v18 = 106;
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASESpatialPipelineEntry:init failed.", (uint8_t *)&v15, 0x12u);
    }
    v11 = 0;
  }
  v12 = 0;
LABEL_5:

LABEL_6:
  return v12;
}

- (PHASESpatialPipeline)initWithFlags:(PHASESpatialPipelineFlags)flags
{
  PHASESpatialPipeline *v3;
  PHASESpatialPipeline *v5;
  id v6;
  uint64_t v7;
  NSDictionary *entries;
  PHASESpatialPipeline *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v3 = self;
  v17 = *MEMORY[0x24BDAC8D0];
  if (!flags)
  {
    v10 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "PHASESpatialPipeline.mm";
      v15 = 1024;
      v16 = 124;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d Invalid PHASESpatialPipelineFlags == 0.", buf, 0x12u);
    }
    goto LABEL_11;
  }
  v12.receiver = self;
  v12.super_class = (Class)PHASESpatialPipeline;
  v5 = -[PHASESpatialPipeline init](&v12, sel_init);
  v3 = v5;
  if (v5)
  {
    v5->_flags = flags;
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (+[PHASESpatialPipeline addToDictionary:add:key:](PHASESpatialPipeline, "addToDictionary:add:key:", v6, flags & 1, CFSTR("PHASEDirectPathTransmission"))&& +[PHASESpatialPipeline addToDictionary:add:key:](PHASESpatialPipeline, "addToDictionary:add:key:", v6, (flags >> 1) & 1, CFSTR("PHASEEarlyReflections"))&& +[PHASESpatialPipeline addToDictionary:add:key:](PHASESpatialPipeline, "addToDictionary:add:key:", v6, (flags >> 2) & 1, CFSTR("PHASELateReverb")))
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v6);
      entries = v3->_entries;
      v3->_entries = (NSDictionary *)v7;

      goto LABEL_7;
    }

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v3 = v3;
  v9 = v3;
LABEL_12:

  return v9;
}

- (PHASESpatialPipelineFlags)flags
{
  return self->_flags;
}

- (NSDictionary)entries
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
