@implementation AVCaptureSynchronizedMetadataObjectData

+ (void)initialize
{
  objc_opt_class();
}

- (id)_initWithMetadataObjectCollection:(id)a3
{
  void *v5;
  _QWORD *v6;
  AVCaptureSynchronizedMetadataObjectDataInternal *v7;
  objc_super v9;
  _QWORD v10[3];

  if (!objc_msgSend(a3, "metadataObjects"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
    return 0;
  }
  if (a3)
    objc_msgSend(a3, "time");
  else
    memset(v10, 0, sizeof(v10));
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureSynchronizedMetadataObjectData;
  v6 = -[AVCaptureSynchronizedData _initWithTimestamp:](&v9, sel__initWithTimestamp_, v10);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureSynchronizedMetadataObjectDataInternal);
    v6[2] = v7;
    if (v7)
    {
      *(_QWORD *)(v6[2] + 16) = (id)objc_msgSend(a3, "handledMetadataObjectTypes");
      *(_QWORD *)(v6[2] + 8) = (id)objc_msgSend(a3, "metadataObjects");
      return v6;
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  AVCaptureSynchronizedMetadataObjectDataInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureSynchronizedMetadataObjectData;
  -[AVCaptureSynchronizedData dealloc](&v4, sel_dealloc);
}

- (NSArray)metadataObjects
{
  return self->_internal->metadataObjects;
}

- (id)handledMetadataObjectTypes
{
  return self->_internal->handledMetadataObjectTypes;
}

- (void)addSynchronizedData:(id)a3
{
  NSSet *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  AVCaptureSynchronizedMetadataObjectData *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CMTime time2;
  CMTime time1;
  CMTime v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  memset(&v23[1], 0, sizeof(CMTime));
  if (self)
    -[AVCaptureSynchronizedData timestamp](self, "timestamp");
  memset(v23, 0, 24);
  if (a3)
    objc_msgSend(a3, "timestamp");
  if ((v23[1].flags & 1) != 0 && (v23[0].flags & 1) != 0)
  {
    time1 = v23[0];
    time2 = v23[1];
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      time1 = v23[0];
      -[AVCaptureSynchronizedData setTimestampOverride:](self, "setTimestampOverride:", &time1);
    }
  }
  v5 = -[NSSet setByAddingObjectsFromSet:](self->_internal->handledMetadataObjectTypes, "setByAddingObjectsFromSet:", objc_msgSend(a3, "handledMetadataObjectTypes"));

  self->_internal->handledMetadataObjectTypes = v5;
  v15 = self;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_internal->metadataObjects);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)objc_msgSend(a3, "metadataObjects");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __63__AVCaptureSynchronizedMetadataObjectData_addSynchronizedData___block_invoke;
        v16[3] = &unk_1E421D160;
        v16[4] = v13;
        v14 = objc_msgSend(v6, "indexOfObjectPassingTest:", v16);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v6, "addObject:", v13);
        else
          objc_msgSend(v6, "insertObject:atIndex:", v13, v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v9);
  }

  v15->_internal->metadataObjects = (NSArray *)v6;
}

BOOL __63__AVCaptureSynchronizedMetadataObjectData_addSynchronizedData___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int32_t v7;
  CMTime v9;
  CMTime time1;

  if (a2)
    objc_msgSend(a2, "time");
  else
    memset(&time1, 0, sizeof(time1));
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "time");
  else
    memset(&v9, 0, sizeof(v9));
  v7 = CMTimeCompare(&time1, &v9);
  if (v7 >= 1)
    *a4 = 1;
  return v7 > 0;
}

@end
