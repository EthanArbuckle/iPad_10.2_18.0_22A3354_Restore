@implementation BWInferenceSchedulerFramebuffer

- (BWInferenceSchedulerFramebuffer)initWithGraph:(id)a3 jobList:(id)a4
{
  BWInferenceSchedulerFramebuffer *v6;
  BWInferenceSchedulerFramebuffer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWInferenceSchedulerFramebuffer;
  v6 = -[BWInferenceSchedulerFramebuffer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->framebufferLock._os_unfair_lock_opaque = 0;
    v6->_jobs = (BWInferenceSchedulerJobList *)a4;
    v7->_graph = (BWInferenceSchedulerGraph *)a3;
  }
  return v7;
}

- (void)resetJobStatesWithPreventionBlock:(id)a3
{
  BWInferenceSchedulerJobList *jobs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  atomic_store(0, (unsigned int *)&self->failedJobStatus);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  jobs = self->_jobs;
  v5 = -[BWInferenceSchedulerJobList countByEnumeratingWithState:objects:count:](jobs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(jobs);
        v9 = *(_BYTE **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = v9[21];
        if ((*((unsigned int (**)(id, _BYTE *))a3 + 2))(a3, v9))
          v11 = 4;
        else
          v11 = v10 == 0;
        atomic_store(v11, v9 + 22);
        atomic_store(v10, v9 + 23);
      }
      v6 = -[BWInferenceSchedulerJobList countByEnumeratingWithState:objects:count:](jobs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
}

- (BWInferenceSchedulerJobList)jobs
{
  return self->_jobs;
}

- (BWInferenceSchedulerGraph)graph
{
  return self->_graph;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerFramebuffer;
  -[BWInferenceSchedulerFramebuffer dealloc](&v3, sel_dealloc);
}

@end
