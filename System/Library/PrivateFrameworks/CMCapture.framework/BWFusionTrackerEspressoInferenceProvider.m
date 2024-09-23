@implementation BWFusionTrackerEspressoInferenceProvider

- (BOOL)mustExecuteWhenAllowed
{
  return 1;
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  return (id)preventionReasonWithSampleBuffer(a3, self->_operation);
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  __int128 v24;
  int64_t var3;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = (void *)CMGetAttachment(a3, CFSTR("FusionTrackerInput"), 0);
  if (v10)
    v11 = (void *)objc_msgSend(v10, "highPriorityTrackerState");
  else
    v11 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = -[BWEspressoInferenceProvider inputMetadataRequirements](self, "inputMetadataRequirements");
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v18 = (void *)objc_msgSend((id)objc_msgSend(v11, "sessionStorage"), "objectForKey:", objc_msgSend((id)objc_msgSend(v17, "metadataKeys"), "objectAtIndexedSubscript:", 0));
        if (!v18)
        {
          v19 = -31714;
          (*((void (**)(id, uint64_t, BWFusionTrackerEspressoInferenceProvider *))a7 + 2))(a7, 4294935582, self);
          return v19;
        }
        objc_msgSend(v18, "getValue:", objc_msgSend(a4, "tensorForRequirement:", v17));
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v14)
        continue;
      break;
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)BWFusionTrackerEspressoInferenceProvider;
  v24 = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  return -[BWEspressoInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:](&v26, sel_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_, a3, a4, &v24, a6, a7);
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

@end
