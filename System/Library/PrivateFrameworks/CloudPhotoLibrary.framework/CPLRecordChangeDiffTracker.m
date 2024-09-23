@implementation CPLRecordChangeDiffTracker

- (CPLRecordChangeDiffTracker)init
{
  return -[CPLRecordChangeDiffTracker initWithTrackingChangeTypeMask:](self, "initWithTrackingChangeTypeMask:", 0);
}

- (CPLRecordChangeDiffTracker)initWithTrackingChangeTypeMask:(unint64_t)a3
{
  CPLRecordChangeDiffTracker *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLRecordChangeDiffTracker;
  result = -[CPLRecordChangeDiffTracker init](&v5, sel_init);
  if (result)
    result->_trackingChangeType = a3;
  return result;
}

- (void)withTrackerForChangeType:(unint64_t)a3 block:(id)a4
{
  CPLDiffTracker *diffTracker;
  CPLDiffTracker *v7;
  CPLDiffTracker *v8;
  void (**v9)(id, CPLDiffTracker *);

  v9 = (void (**)(id, CPLDiffTracker *))a4;
  diffTracker = self->_diffTracker;
  if (!diffTracker)
  {
    v7 = objc_alloc_init(CPLDiffTracker);
    v8 = self->_diffTracker;
    self->_diffTracker = v7;

    diffTracker = self->_diffTracker;
  }
  -[CPLDiffTracker setShouldCompareAllProperties:](diffTracker, "setShouldCompareAllProperties:", (self->_trackingChangeType & a3) != 0);
  v9[2](v9, self->_diffTracker);

}

- (NSArray)updatedProperties
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[CPLDiffTracker differingProperties](self->_diffTracker, "differingProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (BOOL)areObjectsDifferentOnProperty:(id)a3 changeType:(unint64_t)a4
{
  id v7;
  unint64_t trackingChangeType;
  unint64_t v9;
  CPLDiffTracker *diffTracker;
  char v11;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  trackingChangeType = self->_trackingChangeType;
  if (!trackingChangeType)
    goto LABEL_7;
  if ((a4 & 0xFFFFFFFFFFFFFBFFLL) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v20 = a4;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Invalid change type %ld", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 1501, CFSTR("Invalid change type %ld"), a4, v18);
LABEL_19:

    abort();
  }
  v9 = trackingChangeType & a4;
  if (!v9)
  {
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
  if (v9 != a4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = self->_trackingChangeType;
        *(_DWORD *)buf = 134218240;
        v20 = a4;
        v21 = 2048;
        v22 = v17;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Invalid change type %ld - tracked %ld", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 1507, CFSTR("Invalid change type %ld - tracked %ld"), a4, self->_trackingChangeType);
    goto LABEL_19;
  }
  diffTracker = self->_diffTracker;
  if (!diffTracker)
    goto LABEL_7;
  v11 = -[CPLDiffTracker areObjectsDifferentOnProperty:](diffTracker, "areObjectsDifferentOnProperty:", v7);
LABEL_8:

  return v11;
}

- (id)description
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[CPLDiffTracker description](self->_diffTracker, "description");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("[no differences]");
  v4 = v2;

  return v4;
}

- (id)redactedDescription
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[CPLDiffTracker description](self->_diffTracker, "description");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("[no differences]");
  v4 = v2;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffTracker, 0);
}

@end
