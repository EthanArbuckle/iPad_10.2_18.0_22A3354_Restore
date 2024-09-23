@implementation BWInferenceSchedulerJobList

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v7;
  uint64_t v8;
  $B3E1125BAEE9BC7E13D71BCD3C96504F *orderedJobs;
  BOOL v10;

  a3->var1 = a4;
  a3->var2 = &self->_mutations;
  var0 = a3->var0;
  if (a3->var0 >= self->_jobCount || a5 == 0)
    return 0;
  v8 = 0;
  do
  {
    orderedJobs = self->_orderedJobs;
    a3->var0 = var0 + 1;
    a4[v8] = &orderedJobs[var0];
    v7 = v8 + 1;
    var0 = a3->var0;
    v10 = a3->var0 >= self->_jobCount || v7 >= a5;
    ++v8;
  }
  while (!v10);
  return v7;
}

- ($B3E1125BAEE9BC7E13D71BCD3C96504F)jobAtIndex:(unint64_t)a3
{
  if (-[BWInferenceSchedulerJobList count](self, "count") <= a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Job index out of bounds"), 0));
  return &self->_orderedJobs[a3];
}

- (unint64_t)count
{
  return self->_jobCount;
}

- (BWInferenceSchedulerJobList)initWithCapacity:(unint64_t)a3
{
  BWInferenceSchedulerJobList *v4;
  BWInferenceSchedulerJobList *v5;
  $B3E1125BAEE9BC7E13D71BCD3C96504F *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWInferenceSchedulerJobList;
  v4 = -[BWInferenceSchedulerJobList init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_jobCount = a3;
    v6 = ($B3E1125BAEE9BC7E13D71BCD3C96504F *)malloc_type_calloc(a3, 0x18uLL, 0x1080040CC6EE3FDuLL);
    v5->_mutations = v5->_jobCount;
    v5->_orderedJobs = v6;
  }
  return v5;
}

- (void)dealloc
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[BWInferenceSchedulerJobList countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(self);
        v7 = *(id **)(*((_QWORD *)&v9 + 1) + 8 * v6);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[BWInferenceSchedulerJobList countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  free(self->_orderedJobs);
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceSchedulerJobList;
  -[BWInferenceSchedulerJobList dealloc](&v8, sel_dealloc);
}

@end
