@implementation VNRequestPerformingContext

- (id)requestPerformerAndReturnError:(id *)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakRequestPerformer);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else if (a3)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("no request performer available"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (VNSession)session
{
  return self->_session;
}

- (VNRequestPerformingContext)initWithSession:(id)a3 requestPerformer:(id)a4 imageBuffer:(id)a5 forensics:(id)a6 observationsCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  VNRequestPerformingContext *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[VNRequestPerformingContext initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:qosClass:](self, "initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:qosClass:", v16, v15, v14, v13, v12, qos_class_self());

  return v17;
}

- (VNRequestPerformingContext)initWithSession:(id)a3 requestPerformer:(id)a4 imageBuffer:(id)a5 forensics:(id)a6 observationsCache:(id)a7 qosClass:(unsigned int)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  VNRequestPerformingContext *v19;
  VNRequestPerformingContext *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSMapTable *requestToObservationsCacheKeyMap;
  id v26;
  objc_super v27;

  v26 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v27.receiver = self;
  v27.super_class = (Class)VNRequestPerformingContext;
  v19 = -[VNRequestPerformingContext init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    do
    {
      v21 = __ldxr(&initWithSession_requestPerformer_imageBuffer_forensics_observationsCache_qosClass__ourNextSerialNumber);
      v22 = v21 + 1;
    }
    while (__stxr(v22, &initWithSession_requestPerformer_imageBuffer_forensics_observationsCache_qosClass__ourNextSerialNumber));
    v19->_serialNumber = v22;
    objc_storeStrong((id *)&v19->_session, a3);
    v20->_qosClass = a8;
    objc_storeWeak((id *)&v20->_weakRequestPerformer, v15);
    objc_storeStrong((id *)&v20->_imageBuffer_DO_NOT_DIRECTLY_ACCESS, a5);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    requestToObservationsCacheKeyMap = v20->_requestToObservationsCacheKeyMap;
    v20->_requestToObservationsCacheKeyMap = (NSMapTable *)v23;

    objc_storeStrong((id *)&v20->_observationsCache, a7);
    v20->_observationsCacheLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_requestForensics, a6);
  }

  return v20;
}

- (id)cachedObservationsAcceptedByRequest:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observationsCacheLock;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, int);
  void *v12;
  VNRequestPerformingContext *v13;
  id v14;

  v4 = a3;
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  if (self->_requestForensics)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __66__VNRequestPerformingContext_cachedObservationsAcceptedByRequest___block_invoke;
    v12 = &unk_1E4548B50;
    v13 = self;
    v14 = v4;
    v6 = _Block_copy(&v9);

  }
  else
  {
    v6 = 0;
  }
  -[VNObservationsCache observationsAcceptedByRequest:testedKeyHandler:](self->_observationsCache, "observationsAcceptedByRequest:testedKeyHandler:", v4, v6, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_observationsCacheLock);
  return v7;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (id)imageBufferAndReturnError:(id *)a3
{
  VNImageBuffer *imageBuffer_DO_NOT_DIRECTLY_ACCESS;
  VNImageBuffer *v4;

  imageBuffer_DO_NOT_DIRECTLY_ACCESS = self->_imageBuffer_DO_NOT_DIRECTLY_ACCESS;
  if (imageBuffer_DO_NOT_DIRECTLY_ACCESS)
  {
    v4 = imageBuffer_DO_NOT_DIRECTLY_ACCESS;
  }
  else if (a3)
  {
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("no image is available"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return imageBuffer_DO_NOT_DIRECTLY_ACCESS;
}

- (BOOL)cacheObservationsOfRequest:(id)a3
{
  id v4;
  char v5;
  void *v6;
  VNObservationsCache *observationsCache;
  void *v8;
  VNRequestForensics *requestForensics;

  v4 = a3;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  v5 = objc_msgSend(v4, "allowsCachingOfResults");
  if ((v5 & 1) != 0)
  {
    -[VNRequestPerformingContext _observationsCacheKeyForRequest:](self, "_observationsCacheKeyForRequest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    observationsCache = self->_observationsCache;
    objc_msgSend(v4, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNObservationsCache setObservations:forKey:](observationsCache, "setObservations:forKey:", v8, v6);

    -[VNRequestPerformingContext serialNumber](self, "serialNumber");
    objc_msgSend(v4, "resolvedRevision");
    objc_msgSend((id)objc_opt_class(), "VNClassCode");
    kdebug_trace();
    requestForensics = self->_requestForensics;
    if (requestForensics)
      -[VNRequestForensics request:cachedResultsWithObservationsCacheKey:](requestForensics, "request:cachedResultsWithObservationsCacheKey:", v4, v6);

  }
  os_unfair_lock_unlock(&self->_observationsCacheLock);

  return v5;
}

- (void)recordSequencedObservationsOfRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "wantsSequencedRequestObservationsRecording"))
  {
    -[VNRequestPerformingContext requestPerformerAndReturnError:](self, "requestPerformerAndReturnError:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordSequencedObservationsForRequest:", v5);

  }
}

- (id)_observationsCacheKeyForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_requestToObservationsCacheKeyMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copy");
    -[NSMapTable setObject:forKey:](self->_requestToObservationsCacheKeyMap, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (id)requestForensics
{
  return self->_requestForensics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestForensics, 0);
  objc_storeStrong((id *)&self->_observationsCache, 0);
  objc_storeStrong((id *)&self->_requestToObservationsCacheKeyMap, 0);
  objc_storeStrong((id *)&self->_imageBuffer_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_destroyWeak((id *)&self->_weakRequestPerformer);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id)previousSequencedObservationsAcceptedByRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VNRequestPerformingContext requestPerformerAndReturnError:](self, "requestPerformerAndReturnError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousSequencedObservationsForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __66__VNRequestPerformingContext_cachedObservationsAcceptedByRequest___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (a3)
    return objc_msgSend(v4, "cachedObservationsWithKey:wereLocatedOnBehalfOfRequest:", a2, v3);
  else
    return objc_msgSend(v4, "cachedObservationsWithKey:wereCheckedOnBehalfOfRequest:", a2, v3);
}

@end
