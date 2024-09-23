@implementation GEOETAResponse

- (GEOETAResponse)init
{
  GEOETAResponse *v2;
  GEOETAResponse *v3;
  GEOETAResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETAResponse;
  v2 = -[GEOETAResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETAResponse)initWithData:(id)a3
{
  GEOETAResponse *v3;
  GEOETAResponse *v4;
  GEOETAResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETAResponse;
  v3 = -[GEOETAResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOETAResponse clearProblemDetails](self, "clearProblemDetails");
  v3.receiver = self;
  v3.super_class = (Class)GEOETAResponse;
  -[GEOETAResponse dealloc](&v3, sel_dealloc);
}

- (int)status
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasStatus
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEtaResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)etaResults
{
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  return self->_etaResults;
}

- (void)setEtaResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *etaResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  etaResults = self->_etaResults;
  self->_etaResults = v4;

}

- (void)clearEtaResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_etaResults, "removeAllObjects");
}

- (void)addEtaResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  -[GEOETAResponse _addNoFlagsEtaResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsEtaResult:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)etaResultsCount
{
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  return -[NSMutableArray count](self->_etaResults, "count");
}

- (id)etaResultAtIndex:(unint64_t)a3
{
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_etaResults, "objectAtIndex:", a3);
}

+ (Class)etaResultType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginPlaceSearchResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginPlaceSearchResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasOriginPlaceSearchResponse
{
  -[GEOETAResponse _readOriginPlaceSearchResponse]((uint64_t)self);
  return self->_originPlaceSearchResponse != 0;
}

- (GEOPlaceSearchResponse)originPlaceSearchResponse
{
  -[GEOETAResponse _readOriginPlaceSearchResponse]((uint64_t)self);
  return self->_originPlaceSearchResponse;
}

- (void)setOriginPlaceSearchResponse:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_originPlaceSearchResponse, a3);
}

- (void)_readProblemDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemDetails_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)problemDetailsCount
{
  -[GEOETAResponse _readProblemDetails]((uint64_t)self);
  return self->_problemDetailsCount;
}

- (GEOProblemDetail)problemDetails
{
  -[GEOETAResponse _readProblemDetails]((uint64_t)self);
  return self->_problemDetails;
}

- (uint64_t)_reserveProblemDetails:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (12 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0x3243262AuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(_QWORD *)(a1 + 32)), 12 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearProblemDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  self->_problemDetailsSpace = 0;
  self->_problemDetailsCount = 0;
  free(self->_problemDetails);
  self->_problemDetails = 0;
}

- (void)addProblemDetail:(GEOProblemDetail)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  uint64_t v4;
  GEOProblemDetail *v6;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  -[GEOETAResponse _readProblemDetails]((uint64_t)self);
  if (self && -[GEOETAResponse _reserveProblemDetails:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_problemDetails[self->_problemDetailsCount];
    *(_QWORD *)&v6->var0 = v4;
    v6->var2 = var2;
    ++self->_problemDetailsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3
{
  unint64_t problemDetailsCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOProblemDetail *v10;
  uint64_t v11;
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  GEOProblemDetail result;

  -[GEOETAResponse _readProblemDetails]((uint64_t)self);
  problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, problemDetailsCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_problemDetails[a3];
  v11 = *(_QWORD *)&v10->var0;
  var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.var2 = var2;
  return result;
}

- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[GEOETAResponse clearProblemDetails](self, "clearProblemDetails");
  if (-[GEOETAResponse _reserveProblemDetails:]((uint64_t)self, a4))
  {
    memcpy(self->_problemDetails, a3, 12 * a4);
    self->_problemDetailsCount = a4;
  }
}

- (void)_readEtaResultReferencePointOrigin
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaResultReferencePointOrigin_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasEtaResultReferencePointOrigin
{
  -[GEOETAResponse _readEtaResultReferencePointOrigin]((uint64_t)self);
  return self->_etaResultReferencePointOrigin != 0;
}

- (GEOETAResult)etaResultReferencePointOrigin
{
  -[GEOETAResponse _readEtaResultReferencePointOrigin]((uint64_t)self);
  return self->_etaResultReferencePointOrigin;
}

- (void)setEtaResultReferencePointOrigin:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_etaResultReferencePointOrigin, a3);
}

- (void)_readEtaResultReferencePointDestinations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaResultReferencePointDestinations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)etaResultReferencePointDestinations
{
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  return self->_etaResultReferencePointDestinations;
}

- (void)setEtaResultReferencePointDestinations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *etaResultReferencePointDestinations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;
  self->_etaResultReferencePointDestinations = v4;

}

- (void)clearEtaResultReferencePointDestinations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_etaResultReferencePointDestinations, "removeAllObjects");
}

- (void)addEtaResultReferencePointDestination:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  -[GEOETAResponse _addNoFlagsEtaResultReferencePointDestination:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsEtaResultReferencePointDestination:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)etaResultReferencePointDestinationsCount
{
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  return -[NSMutableArray count](self->_etaResultReferencePointDestinations, "count");
}

- (id)etaResultReferencePointDestinationAtIndex:(unint64_t)a3
{
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_etaResultReferencePointDestinations, "objectAtIndex:", a3);
}

+ (Class)etaResultReferencePointDestinationType
{
  return (Class)objc_opt_class();
}

- (void)_readDatasetAbStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDatasetAbStatus
{
  -[GEOETAResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOETAResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readDebugData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugData_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDebugData
{
  -[GEOETAResponse _readDebugData]((uint64_t)self);
  return self->_debugData != 0;
}

- (NSString)debugData
{
  -[GEOETAResponse _readDebugData]((uint64_t)self);
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (void)_readResponseAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseAttributes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasResponseAttributes
{
  -[GEOETAResponse _readResponseAttributes]((uint64_t)self);
  return self->_responseAttributes != 0;
}

- (GEOCommonResponseAttributes)responseAttributes
{
  -[GEOETAResponse _readResponseAttributes]((uint64_t)self);
  return self->_responseAttributes;
}

- (void)setResponseAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_responseAttributes, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOETAResponse;
  -[GEOETAResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETAResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 128) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 124);
    if (v5 <= 29)
    {
      v6 = CFSTR("STATUS_SUCCESS");
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v6 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v5 != 20)
            goto LABEL_15;
          v6 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 124));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v8 = *(id *)(a1 + 88);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v60 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("etaResult"));
  }
  objc_msgSend((id)a1, "originPlaceSearchResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("originPlaceSearchResponse"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v19 = 0;
      v20 = 0;
      do
      {
        _GEOProblemDetailDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v21);

        ++v20;
        v19 += 12;
      }
      while (v20 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("problemDetail"));

  }
  objc_msgSend((id)a1, "etaResultReferencePointOrigin");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v22, "jsonRepresentation");
    else
      objc_msgSend(v22, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("etaResultReferencePointOrigin"));

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v26 = *(id *)(a1 + 72);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v31, "jsonRepresentation");
          else
            objc_msgSend(v31, "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v32);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("etaResultReferencePointDestination"));
  }
  objc_msgSend((id)a1, "datasetAbStatus");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("datasetAbStatus");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("dataset_ab_status");
    }
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  objc_msgSend((id)a1, "debugData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    if (a2)
      v38 = CFSTR("debugData");
    else
      v38 = CFSTR("debug_data");
    objc_msgSend(v4, "setObject:forKey:", v37, v38);
  }

  objc_msgSend((id)a1, "responseAttributes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("responseAttributes");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("response_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  objc_msgSend((id)a1, "clientMetrics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v43, "jsonRepresentation");
    else
      objc_msgSend(v43, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("clientMetrics"));

  }
  v46 = *(void **)(a1 + 16);
  if (v46)
  {
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v47, "count"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __44__GEOETAResponse__dictionaryRepresentation___block_invoke;
      v53[3] = &unk_1E1C00600;
      v50 = v49;
      v54 = v50;
      objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v53);
      v51 = v50;

      v48 = v51;
    }
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOETAResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOETAResponse)initWithDictionary:(id)a3
{
  return (GEOETAResponse *)-[GEOETAResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  unint64_t v3;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOETAResult *v16;
  uint64_t v17;
  void *v18;
  GEOPlaceSearchResponse *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  GEOETAResult *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  GEOETAResult *v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;
  GEOPDDatasetABStatus *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  GEOCommonResponseAttributes *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  GEOClientMetrics *v56;
  uint64_t v57;
  void *v58;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  unsigned int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a1)
    goto LABEL_104;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_104;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v9 = 30;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v9 = 40;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v9 = 50;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v9 = 60;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_26:
    objc_msgSend(a1, "setStatus:", v9);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("etaResult"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v60 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v72;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v72 != v14)
            objc_enumerationMutation(v11);
          v3 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = [GEOETAResult alloc];
            if (v16)
              v3 = -[GEOETAResult _initWithDictionary:isJSON:](v16, (void *)v3, a3);
            else
              v3 = 0;
            objc_msgSend(a1, "addEtaResult:", v3);

          }
          ++v15;
        }
        while (v13 != v15);
        v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        v13 = v17;
      }
      while (v17);
    }

    v6 = v60;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("originPlaceSearchResponse"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOPlaceSearchResponse alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOPlaceSearchResponse initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOPlaceSearchResponse initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setOriginPlaceSearchResponse:", v20);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("problemDetail"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v68 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v66 = 0;
            v65 = 0;
            _GEOProblemDetailFromDictionaryRepresentation(v28, (uint64_t)&v65);
            v3 = v3 & 0xFFFFFFFF00000000 | v66;
            objc_msgSend(a1, "addProblemDetail:", v65, v3);
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v25);
    }

    v6 = v60;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("etaResultReferencePointOrigin"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOETAResult alloc];
    if (v30)
      v31 = (void *)-[GEOETAResult _initWithDictionary:isJSON:](v30, v29, a3);
    else
      v31 = 0;
    objc_msgSend(a1, "setEtaResultReferencePointOrigin:", v31);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("etaResultReferencePointDestination"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v62;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v62 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v37);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = [GEOETAResult alloc];
            if (v39)
              v40 = (void *)-[GEOETAResult _initWithDictionary:isJSON:](v39, v38, a3);
            else
              v40 = 0;
            objc_msgSend(a1, "addEtaResultReferencePointDestination:", v40);

          }
          ++v37;
        }
        while (v35 != v37);
        v41 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
        v35 = v41;
      }
      while (v41);
    }

    v6 = v60;
  }

  if (a3)
    v42 = CFSTR("datasetAbStatus");
  else
    v42 = CFSTR("dataset_ab_status");
  objc_msgSend(v6, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = [GEOPDDatasetABStatus alloc];
    if ((a3 & 1) != 0)
      v45 = -[GEOPDDatasetABStatus initWithJSON:](v44, "initWithJSON:", v43);
    else
      v45 = -[GEOPDDatasetABStatus initWithDictionary:](v44, "initWithDictionary:", v43);
    v46 = (void *)v45;
    objc_msgSend(a1, "setDatasetAbStatus:", v45);

  }
  if (a3)
    v47 = CFSTR("debugData");
  else
    v47 = CFSTR("debug_data");
  objc_msgSend(v6, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(a1, "setDebugData:", v49);

  }
  if (a3)
    v50 = CFSTR("responseAttributes");
  else
    v50 = CFSTR("response_attributes");
  objc_msgSend(v6, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEOCommonResponseAttributes alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEOCommonResponseAttributes initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEOCommonResponseAttributes initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(a1, "setResponseAttributes:", v53);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientMetrics"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = [GEOClientMetrics alloc];
    if ((a3 & 1) != 0)
      v57 = -[GEOClientMetrics initWithJSON:](v56, "initWithJSON:", v55);
    else
      v57 = -[GEOClientMetrics initWithDictionary:](v56, "initWithDictionary:", v55);
    v58 = (void *)v57;
    objc_msgSend(a1, "setClientMetrics:", v57);

  }
LABEL_104:

  return a1;
}

- (GEOETAResponse)initWithJSON:(id)a3
{
  return (GEOETAResponse *)-[GEOETAResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_567;
    else
      v8 = (int *)&readAll__nonRecursiveTag_568;
    GEOETAResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOETAResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETAResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETAResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOETAResponse readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = self->_etaResults;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    if (self->_originPlaceSearchResponse)
      PBDataWriterWriteSubmessage();
    if (self->_problemDetailsCount)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v22 = 0;
        PBDataWriterPlaceMark();
        GEOProblemDetailWriteTo((uint64_t)&self->_problemDetails[v10]);
        PBDataWriterRecallMark();
        ++v11;
        ++v10;
      }
      while (v11 < self->_problemDetailsCount);
    }
    if (self->_etaResultReferencePointOrigin)
      PBDataWriterWriteSubmessage();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = self->_etaResultReferencePointDestinations;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteSubmessage();
          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v13);
    }

    if (self->_datasetAbStatus)
      PBDataWriterWriteSubmessage();
    if (self->_debugData)
      PBDataWriterWriteStringField();
    if (self->_responseAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_clientMetrics)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOETAResponseClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_etaResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      if ((-[GEOETAResult hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9), v3) & 1) != 0)
        goto LABEL_19;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_etaResultReferencePointDestinations;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v5);
      if ((-[GEOETAResult hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), v3) & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_19:

    return 1;
  }
LABEL_17:

  -[GEOETAResponse _readEtaResultReferencePointOrigin]((uint64_t)self);
  if ((-[GEOETAResult hasGreenTeaWithValue:]((uint64_t)self->_etaResultReferencePointOrigin, v3) & 1) == 0)
  {
    -[GEOETAResponse _readOriginPlaceSearchResponse]((uint64_t)self);
    return -[GEOPlaceSearchResponse hasGreenTeaWithValue:](self->_originPlaceSearchResponse, "hasGreenTeaWithValue:", v3, (_QWORD)v15);
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  id *v17;
  id *v18;

  v18 = (id *)a3;
  -[GEOETAResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 28) = self->_readerMarkPos;
  *((_DWORD *)v18 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v18 + 31) = self->_status;
    *((_WORD *)v18 + 64) |= 1u;
  }
  if (-[GEOETAResponse etaResultsCount](self, "etaResultsCount"))
  {
    objc_msgSend(v18, "clearEtaResults");
    v4 = -[GEOETAResponse etaResultsCount](self, "etaResultsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOETAResponse etaResultAtIndex:](self, "etaResultAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addEtaResult:", v7);

      }
    }
  }
  if (self->_originPlaceSearchResponse)
    objc_msgSend(v18, "setOriginPlaceSearchResponse:");
  if (-[GEOETAResponse problemDetailsCount](self, "problemDetailsCount"))
  {
    objc_msgSend(v18, "clearProblemDetails");
    v8 = -[GEOETAResponse problemDetailsCount](self, "problemDetailsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = -[GEOETAResponse problemDetailAtIndex:](self, "problemDetailAtIndex:", j);
        objc_msgSend(v18, "addProblemDetail:", v11, v12);
      }
    }
  }
  if (self->_etaResultReferencePointOrigin)
    objc_msgSend(v18, "setEtaResultReferencePointOrigin:");
  if (-[GEOETAResponse etaResultReferencePointDestinationsCount](self, "etaResultReferencePointDestinationsCount"))
  {
    objc_msgSend(v18, "clearEtaResultReferencePointDestinations");
    v13 = -[GEOETAResponse etaResultReferencePointDestinationsCount](self, "etaResultReferencePointDestinationsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOETAResponse etaResultReferencePointDestinationAtIndex:](self, "etaResultReferencePointDestinationAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addEtaResultReferencePointDestination:", v16);

      }
    }
  }
  if (self->_datasetAbStatus)
    objc_msgSend(v18, "setDatasetAbStatus:");
  v17 = v18;
  if (self->_debugData)
  {
    objc_msgSend(v18, "setDebugData:");
    v17 = v18;
  }
  if (self->_responseAttributes)
  {
    objc_msgSend(v18, "setResponseAttributes:");
    v17 = v18;
  }
  if (self->_clientMetrics)
  {
    objc_msgSend(v18, "setClientMetrics:");
    v17 = v18;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  unint64_t problemDetailsCount;
  id v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  PBUnknownFields *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOETAResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAResponse readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_status;
    *(_WORD *)(v5 + 128) |= 1u;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = self->_etaResults;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEtaResult:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }

  v14 = -[GEOPlaceSearchResponse copyWithZone:](self->_originPlaceSearchResponse, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount)
  {
    -[GEOETAResponse _reserveProblemDetails:](v5, problemDetailsCount);
    memcpy(*(void **)(v5 + 24), self->_problemDetails, 12 * self->_problemDetailsCount);
    *(_QWORD *)(v5 + 32) = self->_problemDetailsCount;
  }
  v17 = -[GEOETAResult copyWithZone:](self->_etaResultReferencePointOrigin, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = self->_etaResultReferencePointDestinations;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v5, "addEtaResultReferencePointDestination:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }

  v24 = -[GEOPDDatasetABStatus copyWithZone:](self->_datasetAbStatus, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  v26 = -[NSString copyWithZone:](self->_debugData, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v26;

  v28 = -[GEOCommonResponseAttributes copyWithZone:](self->_responseAttributes, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v28;

  v30 = -[GEOClientMetrics copyWithZone:](self->_clientMetrics, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v30;

  v32 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v32;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  __int16 v5;
  NSMutableArray *etaResults;
  GEOPlaceSearchResponse *originPlaceSearchResponse;
  unint64_t problemDetailsCount;
  char v9;
  GEOETAResult *etaResultReferencePointOrigin;
  NSMutableArray *etaResultReferencePointDestinations;
  GEOPDDatasetABStatus *datasetAbStatus;
  NSString *debugData;
  GEOCommonResponseAttributes *responseAttributes;
  GEOClientMetrics *clientMetrics;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOETAResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 64);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_status != *((_DWORD *)v4 + 31))
      goto LABEL_13;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  etaResults = self->_etaResults;
  if ((unint64_t)etaResults | (unint64_t)v4[11]
    && !-[NSMutableArray isEqual:](etaResults, "isEqual:"))
  {
    goto LABEL_13;
  }
  originPlaceSearchResponse = self->_originPlaceSearchResponse;
  if ((unint64_t)originPlaceSearchResponse | (unint64_t)v4[12])
  {
    if (!-[GEOPlaceSearchResponse isEqual:](originPlaceSearchResponse, "isEqual:"))
      goto LABEL_13;
  }
  problemDetailsCount = self->_problemDetailsCount;
  if ((const void *)problemDetailsCount != v4[4])
    goto LABEL_13;
  if (memcmp(self->_problemDetails, v4[3], 12 * problemDetailsCount))
    goto LABEL_13;
  etaResultReferencePointOrigin = self->_etaResultReferencePointOrigin;
  if ((unint64_t)etaResultReferencePointOrigin | (unint64_t)v4[10])
  {
    if (!-[GEOETAResult isEqual:](etaResultReferencePointOrigin, "isEqual:"))
      goto LABEL_13;
  }
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;
  if ((unint64_t)etaResultReferencePointDestinations | (unint64_t)v4[9])
  {
    if (!-[NSMutableArray isEqual:](etaResultReferencePointDestinations, "isEqual:"))
      goto LABEL_13;
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | (unint64_t)v4[7])
  {
    if (!-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:"))
      goto LABEL_13;
  }
  debugData = self->_debugData;
  if ((unint64_t)debugData | (unint64_t)v4[8])
  {
    if (!-[NSString isEqual:](debugData, "isEqual:"))
      goto LABEL_13;
  }
  responseAttributes = self->_responseAttributes;
  if ((unint64_t)responseAttributes | (unint64_t)v4[13])
  {
    if (!-[GEOCommonResponseAttributes isEqual:](responseAttributes, "isEqual:"))
      goto LABEL_13;
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | (unint64_t)v4[6])
    v9 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  else
    v9 = 1;
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  -[GEOETAResponse readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_etaResults, "hash") ^ v3;
  v5 = v4 ^ -[GEOPlaceSearchResponse hash](self->_originPlaceSearchResponse, "hash");
  v6 = PBHashBytes();
  v7 = v5 ^ -[GEOETAResult hash](self->_etaResultReferencePointOrigin, "hash") ^ v6;
  v8 = -[NSMutableArray hash](self->_etaResultReferencePointDestinations, "hash");
  v9 = v8 ^ -[GEOPDDatasetABStatus hash](self->_datasetAbStatus, "hash");
  v10 = v9 ^ -[NSString hash](self->_debugData, "hash");
  v11 = v10 ^ -[GEOCommonResponseAttributes hash](self->_responseAttributes, "hash");
  return v7 ^ v11 ^ -[GEOClientMetrics hash](self->_clientMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOPlaceSearchResponse *originPlaceSearchResponse;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  unsigned int v16;
  GEOETAResult *etaResultReferencePointOrigin;
  void *v18;
  id v19;
  __int16 v20;
  GEOPlaceSearchResponse *placeSearchResponse;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  GEOPDDatasetABStatus *datasetAbStatus;
  uint64_t v39;
  GEOCommonResponseAttributes *responseAttributes;
  uint64_t v41;
  GEOClientMetrics *clientMetrics;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 64) & 1) != 0)
  {
    self->_status = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = *((id *)v4 + 11);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        -[GEOETAResponse addEtaResult:](self, "addEtaResult:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v7);
  }

  originPlaceSearchResponse = self->_originPlaceSearchResponse;
  v11 = *((_QWORD *)v4 + 12);
  if (originPlaceSearchResponse)
  {
    if (v11)
      -[GEOPlaceSearchResponse mergeFrom:](originPlaceSearchResponse, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOETAResponse setOriginPlaceSearchResponse:](self, "setOriginPlaceSearchResponse:");
  }
  v12 = objc_msgSend(v4, "problemDetailsCount");
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
    {
      v15 = objc_msgSend(v4, "problemDetailAtIndex:", j);
      -[GEOETAResponse addProblemDetail:](self, "addProblemDetail:", v15, v16);
    }
  }
  etaResultReferencePointOrigin = self->_etaResultReferencePointOrigin;
  v18 = (void *)*((_QWORD *)v4 + 10);
  if (etaResultReferencePointOrigin)
  {
    if (!v18)
      goto LABEL_51;
    v19 = v18;
    -[GEOETAResult readAll:]((uint64_t)v19, 0);
    v20 = *((_WORD *)v19 + 38);
    if ((v20 & 8) != 0)
    {
      etaResultReferencePointOrigin->_status = *((_DWORD *)v19 + 18);
      *(_WORD *)&etaResultReferencePointOrigin->_flags |= 8u;
      v20 = *((_WORD *)v19 + 38);
      if ((v20 & 4) == 0)
      {
LABEL_22:
        if ((v20 & 2) == 0)
        {
LABEL_24:
          placeSearchResponse = etaResultReferencePointOrigin->_placeSearchResponse;
          v22 = *((_QWORD *)v19 + 4);
          if (placeSearchResponse)
          {
            if (v22)
              -[GEOPlaceSearchResponse mergeFrom:](placeSearchResponse, "mergeFrom:");
          }
          else if (v22)
          {
            -[GEOETAResult setPlaceSearchResponse:]((uint64_t)etaResultReferencePointOrigin, *((void **)v19 + 4));
          }
          if ((*((_WORD *)v19 + 38) & 1) != 0)
          {
            etaResultReferencePointOrigin->_distance = *((_DWORD *)v19 + 15);
            *(_WORD *)&etaResultReferencePointOrigin->_flags |= 1u;
          }
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v23 = *((id *)v19 + 5);
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v57;
            do
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v57 != v26)
                  objc_enumerationMutation(v23);
                -[GEOETAResult addSortedETA:]((uint64_t)etaResultReferencePointOrigin, *(void **)(*((_QWORD *)&v56 + 1) + 8 * k));
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
            }
            while (v25);
          }

          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v28 = *((id *)v19 + 3);
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v53;
            do
            {
              for (m = 0; m != v30; ++m)
              {
                if (*(_QWORD *)v53 != v31)
                  objc_enumerationMutation(v28);
                -[GEOETAResult addEtaRouteIncident:]((uint64_t)etaResultReferencePointOrigin, *(void **)(*((_QWORD *)&v52 + 1) + 8 * m));
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            }
            while (v30);
          }

          goto LABEL_51;
        }
LABEL_23:
        etaResultReferencePointOrigin->_historicTravelTime = *((_DWORD *)v19 + 16);
        *(_WORD *)&etaResultReferencePointOrigin->_flags |= 2u;
        goto LABEL_24;
      }
    }
    else if ((v20 & 4) == 0)
    {
      goto LABEL_22;
    }
    etaResultReferencePointOrigin->_liveTravelTime = *((_DWORD *)v19 + 17);
    *(_WORD *)&etaResultReferencePointOrigin->_flags |= 4u;
    if ((*((_WORD *)v19 + 38) & 2) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (v18)
    -[GEOETAResponse setEtaResultReferencePointOrigin:](self, "setEtaResultReferencePointOrigin:");
LABEL_51:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v33 = *((id *)v4 + 9);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v45;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(v33);
        -[GEOETAResponse addEtaResultReferencePointDestination:](self, "addEtaResultReferencePointDestination:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * n), (_QWORD)v44);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v35);
  }

  datasetAbStatus = self->_datasetAbStatus;
  v39 = *((_QWORD *)v4 + 7);
  if (datasetAbStatus)
  {
    if (v39)
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
  }
  else if (v39)
  {
    -[GEOETAResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  if (*((_QWORD *)v4 + 8))
    -[GEOETAResponse setDebugData:](self, "setDebugData:");
  responseAttributes = self->_responseAttributes;
  v41 = *((_QWORD *)v4 + 13);
  if (responseAttributes)
  {
    if (v41)
      -[GEOCommonResponseAttributes mergeFrom:](responseAttributes, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEOETAResponse setResponseAttributes:](self, "setResponseAttributes:");
  }
  clientMetrics = self->_clientMetrics;
  v43 = *((_QWORD *)v4 + 6);
  if (clientMetrics)
  {
    if (v43)
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEOETAResponse setClientMetrics:](self, "setClientMetrics:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOETAResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_571);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x802u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETAResponse readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_etaResults;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          -[GEOETAResult clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    -[GEOPlaceSearchResponse clearUnknownFields:](self->_originPlaceSearchResponse, "clearUnknownFields:", 1);
    -[GEOETAResult clearUnknownFields:]((uint64_t)self->_etaResultReferencePointOrigin);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_etaResultReferencePointDestinations;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[GEOETAResult clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[GEOPDDatasetABStatus clearUnknownFields:](self->_datasetAbStatus, "clearUnknownFields:", 1, (_QWORD)v17);
    -[GEOCommonResponseAttributes clearUnknownFields:](self->_responseAttributes, "clearUnknownFields:", 1);
    -[GEOClientMetrics clearUnknownFields:](self->_clientMetrics, "clearUnknownFields:", 1);
  }
}

- (void)_readClientMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetrics_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasClientMetrics
{
  -[GEOETAResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEOETAResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics;
}

- (void)setClientMetrics:(id)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseAttributes, 0);
  objc_storeStrong((id *)&self->_originPlaceSearchResponse, 0);
  objc_storeStrong((id *)&self->_etaResults, 0);
  objc_storeStrong((id *)&self->_etaResultReferencePointOrigin, 0);
  objc_storeStrong((id *)&self->_etaResultReferencePointDestinations, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
