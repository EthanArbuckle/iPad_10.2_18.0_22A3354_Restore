@implementation GEOETARoute

- (double)expectedTime
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GEOETARoute steps](self, "steps", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v5 = v5 + (double)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "expectedTime");
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)remainingTimeFromStepID:(unsigned int)a3 toEndStepID:(unsigned int)a4 currentStepRemainingDistance:(double)a5
{
  uint64_t v6;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  double i;
  void *v14;
  double v15;
  void *v16;

  v6 = *(_QWORD *)&a4;
  v9 = -[GEOETARoute stepIndexOfStepWithID:](self, "stepIndexOfStepWithID:");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = v9;
  v11 = -[GEOETARoute stepIndexOfStepWithID:](self, "stepIndexOfStepWithID:", v6);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GEOETARoute steps](self, "steps");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "count") - 1;

  }
  for (i = 0.0; v10 <= v11; ++v10)
  {
    -[GEOETARoute stepAtIndex:](self, "stepAtIndex:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (double)objc_msgSend(v14, "expectedTime");
    if (objc_msgSend(v14, "stepID") == a3)
    {
      if (objc_msgSend(v14, "hasTimeCheckpoints"))
      {
        objc_msgSend(v14, "timeCheckpoints");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v15 = GEORemainingTimeForRemainingDistanceAlongStep(v16, a5, v15, (float)objc_msgSend(v14, "distanceCm") * 0.01);

    }
    i = i + v15;

  }
  return i;
}

- (double)remainingTimeAlongRoute:(unsigned int)a3 currentStepRemainingDistance:(double)a4
{
  unint64_t v7;
  unint64_t v8;
  double i;
  void *v10;
  double v11;
  void *v12;

  v7 = -[GEOETARoute stepIndexOfStepWithID:](self, "stepIndexOfStepWithID:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v7;
  for (i = 0.0; v8 < -[GEOETARoute stepsCount](self, "stepsCount"); ++v8)
  {
    -[GEOETARoute stepAtIndex:](self, "stepAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)objc_msgSend(v10, "expectedTime");
    if (objc_msgSend(v10, "stepID") == a3)
    {
      if (objc_msgSend(v10, "hasTimeCheckpoints"))
      {
        objc_msgSend(v10, "timeCheckpoints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      v11 = GEORemainingTimeForRemainingDistanceAlongStep(v12, a4, v11, (float)objc_msgSend(v10, "distanceCm") * 0.01);

    }
    i = i + v11;

  }
  return i;
}

- (unint64_t)stepIndexOfStepWithID:(unsigned int)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[4];
  unsigned int v8;

  -[GEOETARoute steps](self, "steps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__GEOETARoute_GEORouteExtras__stepIndexOfStepWithID___block_invoke;
  v7[3] = &__block_descriptor_36_e27_B32__0__GEOETAStep_8Q16_B24l;
  v8 = a3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);

  return v5;
}

BOOL __53__GEOETARoute_GEORouteExtras__stepIndexOfStepWithID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v5;
  int v6;

  v5 = *(_DWORD *)(a1 + 32);
  v6 = objc_msgSend(a2, "stepID");
  if (v5 == v6)
    *a4 = 1;
  return v5 == v6;
}

- (GEOETARoute)init
{
  GEOETARoute *v2;
  GEOETARoute *v3;
  GEOETARoute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETARoute;
  v2 = -[GEOETARoute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETARoute)initWithData:(id)a3
{
  GEOETARoute *v3;
  GEOETARoute *v4;
  GEOETARoute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETARoute;
  v3 = -[GEOETARoute initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOETARoute;
  -[GEOETARoute dealloc](&v3, sel_dealloc);
}

- (void)_readRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteID_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasRouteID
{
  -[GEOETARoute _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOETARoute _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40800000u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (void)_readSteps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 311) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSteps_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)steps
{
  -[GEOETARoute _readSteps]((uint64_t)self);
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *steps;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addStep:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readSteps]((uint64_t)self);
  -[GEOETARoute _addNoFlagsStep:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsStep:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 240);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 240);
      *(_QWORD *)(a1 + 240) = v5;

      v4 = *(void **)(a1 + 240);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)stepsCount
{
  -[GEOETARoute _readSteps]((uint64_t)self);
  return -[NSMutableArray count](self->_steps, "count");
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readSteps]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_steps, "objectAtIndex:", a3);
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readZilchPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 311) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilchPoints_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)zilchPoints
{
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *zilchPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  zilchPoints = self->_zilchPoints;
  self->_zilchPoints = v4;

}

- (void)clearZilchPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_zilchPoints, "removeAllObjects");
}

- (void)addZilchPoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  -[GEOETARoute _addNoFlagsZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsZilchPoints:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 264);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 264);
      *(_QWORD *)(a1 + 264) = v5;

      v4 = *(void **)(a1 + 264);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)zilchPointsCount
{
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_zilchPoints, "count");
}

- (id)zilchPointsAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readZilchPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_zilchPoints, "objectAtIndex:", a3);
}

+ (Class)zilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readPathLeg
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPathLeg_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasPathLeg
{
  -[GEOETARoute _readPathLeg]((uint64_t)self);
  return self->_pathLeg != 0;
}

- (NSData)pathLeg
{
  -[GEOETARoute _readPathLeg]((uint64_t)self);
  return self->_pathLeg;
}

- (void)setPathLeg:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40200000u;
  objc_storeStrong((id *)&self->_pathLeg, a3);
}

- (BOOL)routeNoLongerValid
{
  return self->_routeNoLongerValid;
}

- (void)setRouteNoLongerValid:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40000020u;
  self->_routeNoLongerValid = a3;
}

- (void)setHasRouteNoLongerValid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1073741856;
  else
    v3 = 0x40000000;
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasRouteNoLongerValid
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readReroutedRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReroutedRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)reroutedRoutes
{
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  return self->_reroutedRoutes;
}

- (void)setReroutedRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *reroutedRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  reroutedRoutes = self->_reroutedRoutes;
  self->_reroutedRoutes = v4;

}

- (void)clearReroutedRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_reroutedRoutes, "removeAllObjects");
}

- (void)addReroutedRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsReroutedRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsReroutedRoute:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 208);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v5;

      v4 = *(void **)(a1 + 208);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)reroutedRoutesCount
{
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_reroutedRoutes, "count");
}

- (id)reroutedRouteAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_reroutedRoutes, "objectAtIndex:", a3);
}

+ (Class)reroutedRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readInvalidSectionZilchPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInvalidSectionZilchPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)invalidSectionZilchPoints
{
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  return self->_invalidSectionZilchPoints;
}

- (void)setInvalidSectionZilchPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *invalidSectionZilchPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;
  self->_invalidSectionZilchPoints = v4;

}

- (void)clearInvalidSectionZilchPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_invalidSectionZilchPoints, "removeAllObjects");
}

- (void)addInvalidSectionZilchPoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  -[GEOETARoute _addNoFlagsInvalidSectionZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsInvalidSectionZilchPoints:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)invalidSectionZilchPointsCount
{
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_invalidSectionZilchPoints, "count");
}

- (id)invalidSectionZilchPointsAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readInvalidSectionZilchPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_invalidSectionZilchPoints, "objectAtIndex:", a3);
}

+ (Class)invalidSectionZilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficColors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficColors_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)trafficColorsCount
{
  -[GEOETARoute _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.count;
}

- (unsigned)trafficColors
{
  -[GEOETARoute _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.list;
}

- (void)clearTrafficColors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  -[GEOETARoute _readTrafficColors]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColors;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOETARoute _readTrafficColors]((uint64_t)self);
  p_trafficColors = &self->_trafficColors;
  count = self->_trafficColors.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_trafficColors->list[a3];
}

- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Set();
}

- (void)_readTrafficColorOffsets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficColorOffsets_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)trafficColorOffsetsCount
{
  -[GEOETARoute _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.count;
}

- (unsigned)trafficColorOffsets
{
  -[GEOETARoute _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.list;
}

- (void)clearTrafficColorOffsets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  -[GEOETARoute _readTrafficColorOffsets]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColorOffsets;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOETARoute _readTrafficColorOffsets]((uint64_t)self);
  p_trafficColorOffsets = &self->_trafficColorOffsets;
  count = self->_trafficColorOffsets.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_trafficColorOffsets->list[a3];
}

- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Set();
}

- (void)_readRouteLineStyleInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 311) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteLineStyleInfos_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)routeLineStyleInfos
{
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  return self->_routeLineStyleInfos;
}

- (void)setRouteLineStyleInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeLineStyleInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  routeLineStyleInfos = self->_routeLineStyleInfos;
  self->_routeLineStyleInfos = v4;

}

- (void)clearRouteLineStyleInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_routeLineStyleInfos, "removeAllObjects");
}

- (void)addRouteLineStyleInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsRouteLineStyleInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsRouteLineStyleInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 232);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 232);
      *(_QWORD *)(a1 + 232) = v5;

      v4 = *(void **)(a1 + 232);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeLineStyleInfosCount
{
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_routeLineStyleInfos, "count");
}

- (id)routeLineStyleInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readRouteLineStyleInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeLineStyleInfos, "objectAtIndex:", a3);
}

+ (Class)routeLineStyleInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteCameraInputInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 311) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteCameraInputInfos_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)routeCameraInputInfos
{
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  return self->_routeCameraInputInfos;
}

- (void)setRouteCameraInputInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeCameraInputInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  routeCameraInputInfos = self->_routeCameraInputInfos;
  self->_routeCameraInputInfos = v4;

}

- (void)clearRouteCameraInputInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_routeCameraInputInfos, "removeAllObjects");
}

- (void)addRouteCameraInputInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsRouteCameraInputInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsRouteCameraInputInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 224);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v5;

      v4 = *(void **)(a1 + 224);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeCameraInputInfosCount
{
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_routeCameraInputInfos, "count");
}

- (id)routeCameraInputInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readRouteCameraInputInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeCameraInputInfos, "objectAtIndex:", a3);
}

+ (Class)routeCameraInputInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOnETARoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentsOnETARoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentsOnETARoutes
{
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  return self->_incidentsOnETARoutes;
}

- (void)setIncidentsOnETARoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentsOnETARoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOnETARoutes = self->_incidentsOnETARoutes;
  self->_incidentsOnETARoutes = v4;

}

- (void)clearIncidentsOnETARoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_incidentsOnETARoutes, "removeAllObjects");
}

- (void)addIncidentsOnETARoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentsOnETARoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentsOnETARoute:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v5;

      v4 = *(void **)(a1 + 160);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentsOnETARoutesCount
{
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentsOnETARoutes, "count");
}

- (id)incidentsOnETARouteAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentsOnETARoutes, "objectAtIndex:", a3);
}

+ (Class)incidentsOnETARouteType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOnReRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentsOnReRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentsOnReRoutes
{
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  return self->_incidentsOnReRoutes;
}

- (void)setIncidentsOnReRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentsOnReRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOnReRoutes = self->_incidentsOnReRoutes;
  self->_incidentsOnReRoutes = v4;

}

- (void)clearIncidentsOnReRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_incidentsOnReRoutes, "removeAllObjects");
}

- (void)addIncidentsOnReRoutes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentsOnReRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentsOnReRoutes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentsOnReRoutesCount
{
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentsOnReRoutes, "count");
}

- (id)incidentsOnReRoutesAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentsOnReRoutes, "objectAtIndex:", a3);
}

+ (Class)incidentsOnReRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOffReRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentsOffReRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentsOffReRoutes
{
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  return self->_incidentsOffReRoutes;
}

- (void)setIncidentsOffReRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentsOffReRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentsOffReRoutes = self->_incidentsOffReRoutes;
  self->_incidentsOffReRoutes = v4;

}

- (void)clearIncidentsOffReRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_incidentsOffReRoutes, "removeAllObjects");
}

- (void)addIncidentsOffReRoutes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentsOffReRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentsOffReRoutes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 152);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = v5;

      v4 = *(void **)(a1 + 152);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentsOffReRoutesCount
{
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentsOffReRoutes, "count");
}

- (id)incidentsOffReRoutesAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentsOffReRoutes, "objectAtIndex:", a3);
}

+ (Class)incidentsOffReRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentIndexs_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)incidentIndexsCount
{
  -[GEOETARoute _readIncidentIndexs]((uint64_t)self);
  return self->_incidentIndexs.count;
}

- (unsigned)incidentIndexs
{
  -[GEOETARoute _readIncidentIndexs]((uint64_t)self);
  return self->_incidentIndexs.list;
}

- (void)clearIncidentIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Clear();
}

- (void)addIncidentIndex:(unsigned int)a3
{
  -[GEOETARoute _readIncidentIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)incidentIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_incidentIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOETARoute _readIncidentIndexs]((uint64_t)self);
  p_incidentIndexs = &self->_incidentIndexs;
  count = self->_incidentIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_incidentIndexs->list[a3];
}

- (void)setIncidentIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Set();
}

- (void)_readIncidentEndOffsetsInETARoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 308) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentEndOffsetsInETARoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)incidentEndOffsetsInETARoutesCount
{
  -[GEOETARoute _readIncidentEndOffsetsInETARoutes]((uint64_t)self);
  return self->_incidentEndOffsetsInETARoutes.count;
}

- (unsigned)incidentEndOffsetsInETARoutes
{
  -[GEOETARoute _readIncidentEndOffsetsInETARoutes]((uint64_t)self);
  return self->_incidentEndOffsetsInETARoutes.list;
}

- (void)clearIncidentEndOffsetsInETARoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Clear();
}

- (void)addIncidentEndOffsetsInETARoute:(unsigned int)a3
{
  -[GEOETARoute _readIncidentEndOffsetsInETARoutes]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (unsigned)incidentEndOffsetsInETARouteAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_incidentEndOffsetsInETARoutes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOETARoute _readIncidentEndOffsetsInETARoutes]((uint64_t)self);
  p_incidentEndOffsetsInETARoutes = &self->_incidentEndOffsetsInETARoutes;
  count = self->_incidentEndOffsetsInETARoutes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_incidentEndOffsetsInETARoutes->list[a3];
}

- (void)setIncidentEndOffsetsInETARoutes:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  PBRepeatedUInt32Set();
}

- (void)_readTrafficBannerText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 311) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficBannerText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasTrafficBannerText
{
  -[GEOETARoute _readTrafficBannerText]((uint64_t)self);
  return self->_trafficBannerText != 0;
}

- (GEOTrafficBannerText)trafficBannerText
{
  -[GEOETARoute _readTrafficBannerText]((uint64_t)self);
  return self->_trafficBannerText;
}

- (void)setTrafficBannerText:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000000u;
  objc_storeStrong((id *)&self->_trafficBannerText, a3);
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (void)setHistoricTravelTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000001u;
  self->_historicTravelTime = a3;
}

- (void)setHasHistoricTravelTime:(BOOL)a3
{
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000000);
}

- (BOOL)hasHistoricTravelTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000004u;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1073741828;
  else
    v3 = 0x40000000;
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)travelTimeBestEstimate
{
  return self->_travelTimeBestEstimate;
}

- (void)setTravelTimeBestEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000008u;
  self->_travelTimeBestEstimate = a3;
}

- (void)setHasTravelTimeBestEstimate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1073741832;
  else
    v3 = 0x40000000;
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTravelTimeBestEstimate
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000010u;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1073741840;
  else
    v3 = 0x40000000;
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)staticTravelTime
{
  return self->_staticTravelTime;
}

- (void)setStaticTravelTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40000002u;
  self->_staticTravelTime = a3;
}

- (void)setHasStaticTravelTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1073741826;
  else
    v3 = 0x40000000;
  self->_flags = ($C98F32EDFC9B1C2D78E34865DB4AC25D)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasStaticTravelTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readEnrouteNotices
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnrouteNotices_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)enrouteNotices
{
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  return self->_enrouteNotices;
}

- (void)setEnrouteNotices:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *enrouteNotices;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  enrouteNotices = self->_enrouteNotices;
  self->_enrouteNotices = v4;

}

- (void)clearEnrouteNotices
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_enrouteNotices, "removeAllObjects");
}

- (void)addEnrouteNotice:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  -[GEOETARoute _addNoFlagsEnrouteNotice:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsEnrouteNotice:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)enrouteNoticesCount
{
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  return -[NSMutableArray count](self->_enrouteNotices, "count");
}

- (id)enrouteNoticeAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readEnrouteNotices]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_enrouteNotices, "objectAtIndex:", a3);
}

+ (Class)enrouteNoticeType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficColorInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 311) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficColorInfos_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)trafficColorInfos
{
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  return self->_trafficColorInfos;
}

- (void)setTrafficColorInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficColorInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  trafficColorInfos = self->_trafficColorInfos;
  self->_trafficColorInfos = v4;

}

- (void)clearTrafficColorInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_trafficColorInfos, "removeAllObjects");
}

- (void)addTrafficColorInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsTrafficColorInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsTrafficColorInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 256);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 256);
      *(_QWORD *)(a1 + 256) = v5;

      v4 = *(void **)(a1 + 256);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficColorInfosCount
{
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficColorInfos, "count");
}

- (id)trafficColorInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readTrafficColorInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficColorInfos, "objectAtIndex:", a3);
}

+ (Class)trafficColorInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentOnRouteInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentOnRouteInfos_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)incidentOnRouteInfos
{
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  return self->_incidentOnRouteInfos;
}

- (void)setIncidentOnRouteInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentOnRouteInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  self->_incidentOnRouteInfos = v4;

}

- (void)clearIncidentOnRouteInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_incidentOnRouteInfos, "removeAllObjects");
}

- (void)addIncidentOnRouteInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  -[GEOETARoute _addNoFlagsIncidentOnRouteInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsIncidentOnRouteInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 144);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

      v4 = *(void **)(a1 + 144);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentOnRouteInfosCount
{
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentOnRouteInfos, "count");
}

- (id)incidentOnRouteInfoAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readIncidentOnRouteInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentOnRouteInfos, "objectAtIndex:", a3);
}

+ (Class)incidentOnRouteInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginWaypointInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginWaypointInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasOriginWaypointInfo
{
  -[GEOETARoute _readOriginWaypointInfo]((uint64_t)self);
  return self->_originWaypointInfo != 0;
}

- (GEOWaypointInfo)originWaypointInfo
{
  -[GEOETARoute _readOriginWaypointInfo]((uint64_t)self);
  return self->_originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40100000u;
  objc_storeStrong((id *)&self->_originWaypointInfo, a3);
}

- (void)_readDestinationWaypointInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationWaypointInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDestinationWaypointInfo
{
  -[GEOETARoute _readDestinationWaypointInfo]((uint64_t)self);
  return self->_destinationWaypointInfo != 0;
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  -[GEOETARoute _readDestinationWaypointInfo]((uint64_t)self);
  return self->_destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40000800u;
  objc_storeStrong((id *)&self->_destinationWaypointInfo, a3);
}

- (void)_readNavigabilityInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 310) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavigabilityInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasNavigabilityInfo
{
  -[GEOETARoute _readNavigabilityInfo]((uint64_t)self);
  return self->_navigabilityInfo != 0;
}

- (GEONavigabilityInfo)navigabilityInfo
{
  -[GEOETARoute _readNavigabilityInfo]((uint64_t)self);
  return self->_navigabilityInfo;
}

- (void)setNavigabilityInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40080000u;
  objc_storeStrong((id *)&self->_navigabilityInfo, a3);
}

- (void)_readGuidanceEvents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 309) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidanceEvents_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  return self->_guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *guidanceEvents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;

}

- (void)clearGuidanceEvents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
  -[NSMutableArray removeAllObjects](self->_guidanceEvents, "removeAllObjects");
}

- (void)addGuidanceEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  -[GEOETARoute _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000000u;
}

- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)guidanceEventsCount
{
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  return -[NSMutableArray count](self->_guidanceEvents, "count");
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEOETARoute _readGuidanceEvents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_guidanceEvents, "objectAtIndex:", a3);
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOETARoute;
  -[GEOETARoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETARoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETARoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  id v55;
  const __CFString *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t ii;
  void *v63;
  id v64;
  const __CFString *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t jj;
  void *v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t kk;
  void *v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t mm;
  void *v88;
  id v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  const __CFString *v96;
  id v97;
  int v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t nn;
  void *v107;
  id v108;
  const __CFString *v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i1;
  void *v116;
  id v117;
  const __CFString *v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t i2;
  void *v125;
  id v126;
  const __CFString *v127;
  void *v128;
  void *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  void *v133;
  const __CFString *v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  const __CFString *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  const __CFString *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  const __CFString *v148;
  id v149;
  void *v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t i3;
  void *v156;
  id v157;
  const __CFString *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  id v164;
  id v165;
  _QWORD v167[4];
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  uint64_t v234;

  v234 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "routeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routeID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("routeID"));
    }
  }

  if (objc_msgSend(*(id *)(a1 + 240), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 240), "count"));
    v217 = 0u;
    v218 = 0u;
    v219 = 0u;
    v220 = 0u;
    v9 = *(id *)(a1 + 240);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v217, v233, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v218;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v218 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v217, v233, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("step"));
  }
  if (*(_QWORD *)(a1 + 264))
  {
    if (a2)
    {
      v16 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "zilchPoints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v215 = 0u;
      v216 = 0u;
      v213 = 0u;
      v214 = 0u;
      objc_msgSend((id)a1, "zilchPoints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v213, v232, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v214;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v214 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v213, v232, 16);
        }
        while (v21);
      }

    }
    else
    {
      objc_msgSend((id)a1, "zilchPoints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("zilchPoints"));

  }
  objc_msgSend((id)a1, "pathLeg");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "base64EncodedStringWithOptions:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("pathLeg"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("path_leg"));
    }
  }

  if ((*(_BYTE *)(a1 + 308) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 304));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("routeNoLongerValid"));

  }
  if (objc_msgSend(*(id *)(a1 + 208), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
    v209 = 0u;
    v210 = 0u;
    v211 = 0u;
    v212 = 0u;
    v30 = *(id *)(a1 + 208);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v209, v231, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v210;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v210 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "addObject:", v36);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v209, v231, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("reroutedRoute"));
  }
  if (*(_QWORD *)(a1 + 176))
  {
    if (a2)
    {
      v37 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "invalidSectionZilchPoints");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "arrayWithCapacity:", objc_msgSend(v38, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v207 = 0u;
      v208 = 0u;
      v205 = 0u;
      v206 = 0u;
      objc_msgSend((id)a1, "invalidSectionZilchPoints");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v205, v230, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v206;
        do
        {
          for (m = 0; m != v42; ++m)
          {
            if (*(_QWORD *)v206 != v43)
              objc_enumerationMutation(v40);
            objc_msgSend(*(id *)(*((_QWORD *)&v205 + 1) + 8 * m), "base64EncodedStringWithOptions:", 0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v45);

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v205, v230, 16);
        }
        while (v42);
      }

    }
    else
    {
      objc_msgSend((id)a1, "invalidSectionZilchPoints");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("invalidSectionZilchPoints"));

  }
  if (*(_QWORD *)(a1 + 104))
  {
    PBRepeatedUInt32NSArray();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("trafficColor"));

  }
  if (*(_QWORD *)(a1 + 80))
  {
    PBRepeatedUInt32NSArray();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("trafficColorOffset"));

  }
  if (objc_msgSend(*(id *)(a1 + 232), "count"))
  {
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    v201 = 0u;
    v202 = 0u;
    v203 = 0u;
    v204 = 0u;
    v49 = *(id *)(a1 + 232);
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v201, v229, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v202;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v202 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v54, "jsonRepresentation");
          else
            objc_msgSend(v54, "dictionaryRepresentation");
          v55 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "addObject:", v55);
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v201, v229, 16);
      }
      while (v51);
    }

    if (a2)
      v56 = CFSTR("routeLineStyleInfo");
    else
      v56 = CFSTR("route_line_style_info");
    objc_msgSend(v4, "setObject:forKey:", v48, v56);

  }
  if (objc_msgSend(*(id *)(a1 + 224), "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    v197 = 0u;
    v198 = 0u;
    v199 = 0u;
    v200 = 0u;
    v58 = *(id *)(a1 + 224);
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v197, v228, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v198;
      do
      {
        for (ii = 0; ii != v60; ++ii)
        {
          if (*(_QWORD *)v198 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v63, "jsonRepresentation");
          else
            objc_msgSend(v63, "dictionaryRepresentation");
          v64 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "addObject:", v64);
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v197, v228, 16);
      }
      while (v60);
    }

    if (a2)
      v65 = CFSTR("routeCameraInputInfo");
    else
      v65 = CFSTR("route_camera_input_info");
    objc_msgSend(v4, "setObject:forKey:", v57, v65);

  }
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v193 = 0u;
    v194 = 0u;
    v195 = 0u;
    v196 = 0u;
    v67 = *(id *)(a1 + 160);
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v193, v227, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v194;
      do
      {
        for (jj = 0; jj != v69; ++jj)
        {
          if (*(_QWORD *)v194 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v72, "jsonRepresentation");
          else
            objc_msgSend(v72, "dictionaryRepresentation");
          v73 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "addObject:", v73);
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v193, v227, 16);
      }
      while (v69);
    }

    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("incidentsOnETARoute"));
  }
  if (objc_msgSend(*(id *)(a1 + 168), "count"))
  {
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 168), "count"));
    v189 = 0u;
    v190 = 0u;
    v191 = 0u;
    v192 = 0u;
    v75 = *(id *)(a1 + 168);
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v189, v226, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v190;
      do
      {
        for (kk = 0; kk != v77; ++kk)
        {
          if (*(_QWORD *)v190 != v78)
            objc_enumerationMutation(v75);
          v80 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v80, "jsonRepresentation");
          else
            objc_msgSend(v80, "dictionaryRepresentation");
          v81 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v74, "addObject:", v81);
        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v189, v226, 16);
      }
      while (v77);
    }

    objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("incidentsOnReRoutes"));
  }
  if (objc_msgSend(*(id *)(a1 + 152), "count"))
  {
    v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 152), "count"));
    v185 = 0u;
    v186 = 0u;
    v187 = 0u;
    v188 = 0u;
    v83 = *(id *)(a1 + 152);
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v185, v225, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v186;
      do
      {
        for (mm = 0; mm != v85; ++mm)
        {
          if (*(_QWORD *)v186 != v86)
            objc_enumerationMutation(v83);
          v88 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * mm);
          if ((a2 & 1) != 0)
            objc_msgSend(v88, "jsonRepresentation");
          else
            objc_msgSend(v88, "dictionaryRepresentation");
          v89 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v82, "addObject:", v89);
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v185, v225, 16);
      }
      while (v85);
    }

    objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("incidentsOffReRoutes"));
  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt32NSArray();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v91 = CFSTR("incidentIndex");
    else
      v91 = CFSTR("incident_index");
    objc_msgSend(v4, "setObject:forKey:", v90, v91);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v92, CFSTR("incidentEndOffsetsInETARoute"));

  }
  objc_msgSend((id)a1, "trafficBannerText");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v93, "jsonRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("trafficBannerText");
    }
    else
    {
      objc_msgSend(v93, "dictionaryRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("traffic_banner_text");
    }
    v97 = v95;

    objc_msgSend(v4, "setObject:forKey:", v97, v96);
  }

  v98 = *(_DWORD *)(a1 + 308);
  if ((v98 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 284));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v132, CFSTR("historicTravelTime"));

    v98 = *(_DWORD *)(a1 + 308);
    if ((v98 & 4) == 0)
    {
LABEL_144:
      if ((v98 & 8) == 0)
        goto LABEL_145;
      goto LABEL_204;
    }
  }
  else if ((v98 & 4) == 0)
  {
    goto LABEL_144;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 292));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v134 = CFSTR("travelTimeAggressiveEstimate");
  else
    v134 = CFSTR("travel_time_aggressive_estimate");
  objc_msgSend(v4, "setObject:forKey:", v133, v134);

  v98 = *(_DWORD *)(a1 + 308);
  if ((v98 & 8) == 0)
  {
LABEL_145:
    if ((v98 & 0x10) == 0)
      goto LABEL_146;
LABEL_208:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 300));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v138 = CFSTR("travelTimeConservativeEstimate");
    else
      v138 = CFSTR("travel_time_conservative_estimate");
    objc_msgSend(v4, "setObject:forKey:", v137, v138);

    if ((*(_DWORD *)(a1 + 308) & 2) == 0)
      goto LABEL_151;
    goto LABEL_147;
  }
LABEL_204:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 296));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v136 = CFSTR("travelTimeBestEstimate");
  else
    v136 = CFSTR("travel_time_best_estimate");
  objc_msgSend(v4, "setObject:forKey:", v135, v136);

  v98 = *(_DWORD *)(a1 + 308);
  if ((v98 & 0x10) != 0)
    goto LABEL_208;
LABEL_146:
  if ((v98 & 2) != 0)
  {
LABEL_147:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 288));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v100 = CFSTR("staticTravelTime");
    else
      v100 = CFSTR("static_travel_time");
    objc_msgSend(v4, "setObject:forKey:", v99, v100);

  }
LABEL_151:
  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v102 = *(id *)(a1 + 128);
    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v181, v224, 16);
    if (v103)
    {
      v104 = v103;
      v105 = *(_QWORD *)v182;
      do
      {
        for (nn = 0; nn != v104; ++nn)
        {
          if (*(_QWORD *)v182 != v105)
            objc_enumerationMutation(v102);
          v107 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * nn);
          if ((a2 & 1) != 0)
            objc_msgSend(v107, "jsonRepresentation");
          else
            objc_msgSend(v107, "dictionaryRepresentation");
          v108 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v101, "addObject:", v108);
        }
        v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v181, v224, 16);
      }
      while (v104);
    }

    if (a2)
      v109 = CFSTR("enrouteNotice");
    else
      v109 = CFSTR("enroute_notice");
    objc_msgSend(v4, "setObject:forKey:", v101, v109);

  }
  if (objc_msgSend(*(id *)(a1 + 256), "count"))
  {
    v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
    v177 = 0u;
    v178 = 0u;
    v179 = 0u;
    v180 = 0u;
    v111 = *(id *)(a1 + 256);
    v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v177, v223, 16);
    if (v112)
    {
      v113 = v112;
      v114 = *(_QWORD *)v178;
      do
      {
        for (i1 = 0; i1 != v113; ++i1)
        {
          if (*(_QWORD *)v178 != v114)
            objc_enumerationMutation(v111);
          v116 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * i1);
          if ((a2 & 1) != 0)
            objc_msgSend(v116, "jsonRepresentation");
          else
            objc_msgSend(v116, "dictionaryRepresentation");
          v117 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v110, "addObject:", v117);
        }
        v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v177, v223, 16);
      }
      while (v113);
    }

    if (a2)
      v118 = CFSTR("trafficColorInfo");
    else
      v118 = CFSTR("traffic_color_info");
    objc_msgSend(v4, "setObject:forKey:", v110, v118);

  }
  if (objc_msgSend(*(id *)(a1 + 144), "count"))
  {
    v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v120 = *(id *)(a1 + 144);
    v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v173, v222, 16);
    if (v121)
    {
      v122 = v121;
      v123 = *(_QWORD *)v174;
      do
      {
        for (i2 = 0; i2 != v122; ++i2)
        {
          if (*(_QWORD *)v174 != v123)
            objc_enumerationMutation(v120);
          v125 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i2);
          if ((a2 & 1) != 0)
            objc_msgSend(v125, "jsonRepresentation");
          else
            objc_msgSend(v125, "dictionaryRepresentation");
          v126 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v119, "addObject:", v126);
        }
        v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v173, v222, 16);
      }
      while (v122);
    }

    if (a2)
      v127 = CFSTR("incidentOnRouteInfo");
    else
      v127 = CFSTR("incident_on_route_info");
    objc_msgSend(v4, "setObject:forKey:", v119, v127);

  }
  objc_msgSend((id)a1, "originWaypointInfo");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v128;
  if (v128)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v128, "jsonRepresentation");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = CFSTR("originWaypointInfo");
    }
    else
    {
      objc_msgSend(v128, "dictionaryRepresentation");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = CFSTR("origin_waypoint_info");
    }
    v139 = v130;

    objc_msgSend(v4, "setObject:forKey:", v139, v131);
  }

  objc_msgSend((id)a1, "destinationWaypointInfo");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v140;
  if (v140)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v140, "jsonRepresentation");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = CFSTR("destinationWaypointInfo");
    }
    else
    {
      objc_msgSend(v140, "dictionaryRepresentation");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = CFSTR("destination_waypoint_info");
    }
    v144 = v142;

    objc_msgSend(v4, "setObject:forKey:", v144, v143);
  }

  objc_msgSend((id)a1, "navigabilityInfo");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v145;
  if (v145)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v145, "jsonRepresentation");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = CFSTR("navigabilityInfo");
    }
    else
    {
      objc_msgSend(v145, "dictionaryRepresentation");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = CFSTR("navigability_info");
    }
    v149 = v147;

    objc_msgSend(v4, "setObject:forKey:", v149, v148);
  }

  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v150 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v151 = *(id *)(a1 + 136);
    v152 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v169, v221, 16);
    if (v152)
    {
      v153 = v152;
      v154 = *(_QWORD *)v170;
      do
      {
        for (i3 = 0; i3 != v153; ++i3)
        {
          if (*(_QWORD *)v170 != v154)
            objc_enumerationMutation(v151);
          v156 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i3);
          if ((a2 & 1) != 0)
            objc_msgSend(v156, "jsonRepresentation");
          else
            objc_msgSend(v156, "dictionaryRepresentation");
          v157 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v150, "addObject:", v157);
        }
        v153 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v169, v221, 16);
      }
      while (v153);
    }

    if (a2)
      v158 = CFSTR("guidanceEvent");
    else
      v158 = CFSTR("guidance_event");
    objc_msgSend(v4, "setObject:forKey:", v150, v158);

  }
  v159 = *(void **)(a1 + 16);
  if (v159)
  {
    objc_msgSend(v159, "dictionaryRepresentation");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v160;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v160, "count"));
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v167[0] = MEMORY[0x1E0C809B0];
      v167[1] = 3221225472;
      v167[2] = __41__GEOETARoute__dictionaryRepresentation___block_invoke;
      v167[3] = &unk_1E1C00600;
      v163 = v162;
      v168 = v163;
      objc_msgSend(v161, "enumerateKeysAndObjectsUsingBlock:", v167);
      v164 = v163;

      v161 = v164;
    }
    objc_msgSend(v4, "setObject:forKey:", v161, CFSTR("Unknown Fields"));

  }
  v165 = v4;

  return v165;
}

- (id)jsonRepresentation
{
  return -[GEOETARoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOETARoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOETARoute)initWithDictionary:(id)a3
{
  return (GEOETARoute *)-[GEOETARoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOETAStep *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  GEORoute *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ii;
  void *v62;
  const __CFString *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t jj;
  uint64_t v70;
  GEORouteLineStyleInfo *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t kk;
  uint64_t v81;
  GEORouteLineStyleInfo *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t mm;
  uint64_t v91;
  GEORouteIncident *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t nn;
  uint64_t v101;
  GEORouteIncident *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i1;
  uint64_t v111;
  GEORouteIncident *v112;
  uint64_t v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t i2;
  void *v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t i3;
  void *v129;
  const __CFString *v130;
  void *v131;
  GEOTrafficBannerText *v132;
  uint64_t v133;
  id v134;
  void *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  const __CFString *v143;
  void *v144;
  const __CFString *v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t i4;
  uint64_t v152;
  GEOEnrouteNotice *v153;
  uint64_t v154;
  void *v155;
  const __CFString *v156;
  void *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t i5;
  uint64_t v163;
  GEOTrafficColorInfo *v164;
  uint64_t v165;
  void *v166;
  const __CFString *v167;
  void *v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t i6;
  uint64_t v174;
  GEOIncidentOnRouteInfo *v175;
  uint64_t v176;
  void *v177;
  const __CFString *v178;
  void *v179;
  GEOWaypointInfo *v180;
  uint64_t v181;
  void *v182;
  const __CFString *v183;
  void *v184;
  GEOWaypointInfo *v185;
  uint64_t v186;
  void *v187;
  const __CFString *v188;
  void *v189;
  GEONavigabilityInfo *v190;
  uint64_t v191;
  void *v192;
  const __CFString *v193;
  void *v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t i7;
  uint64_t v200;
  GEOGuidanceEvent *v201;
  uint64_t v202;
  void *v203;
  void *v205;
  void *v206;
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  _BYTE v276[128];
  _BYTE v277[128];
  _BYTE v278[128];
  _BYTE v279[128];
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  _BYTE v289[128];
  _BYTE v290[128];
  _BYTE v291[128];
  _BYTE v292[128];
  uint64_t v293;

  v293 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1 && (v6 = (id)objc_msgSend(a1, "init"), v6, v6))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
      objc_msgSend(v6, "setRouteID:", v8);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("step"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v207 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v275 = 0u;
      v274 = 0u;
      v273 = 0u;
      v272 = 0u;
      v205 = v9;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v272, v292, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v273;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v273 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v272 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = [GEOETAStep alloc];
              if ((a3 & 1) != 0)
                v17 = -[GEOETAStep initWithJSON:](v16, "initWithJSON:", v15);
              else
                v17 = -[GEOETAStep initWithDictionary:](v16, "initWithDictionary:", v15);
              v18 = (void *)v17;
              objc_msgSend(v6, "addStep:", v17, v205);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v272, v292, 16);
        }
        while (v12);
      }

      v9 = v205;
      v5 = v207;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("zilchPoints"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v270 = 0u;
      v271 = 0u;
      v268 = 0u;
      v269 = 0u;
      v205 = v19;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v268, v291, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v269;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v269 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v268 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v25, 0);
              objc_msgSend(v6, "addZilchPoints:", v26);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v268, v291, 16);
        }
        while (v22);
      }

      v19 = v205;
      v5 = v207;
    }

    if (a3)
      v27 = CFSTR("pathLeg");
    else
      v27 = CFSTR("path_leg");
    objc_msgSend(v5, "objectForKeyedSubscript:", v27, v205);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v28, 0);
      objc_msgSend(v6, "setPathLeg:", v29);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeNoLongerValid"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setRouteNoLongerValid:", objc_msgSend(v30, "BOOLValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reroutedRoute"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v266 = 0u;
      v267 = 0u;
      v264 = 0u;
      v265 = 0u;
      v206 = v31;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v264, v290, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v265;
        do
        {
          for (k = 0; k != v34; ++k)
          {
            if (*(_QWORD *)v265 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v264 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = [GEORoute alloc];
              if ((a3 & 1) != 0)
                v39 = -[GEORoute initWithJSON:](v38, "initWithJSON:", v37);
              else
                v39 = -[GEORoute initWithDictionary:](v38, "initWithDictionary:", v37);
              v40 = (void *)v39;
              objc_msgSend(v6, "addReroutedRoute:", v39, v206);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v264, v290, 16);
        }
        while (v34);
      }

      v31 = v206;
      v5 = v207;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("invalidSectionZilchPoints"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v262 = 0u;
      v263 = 0u;
      v260 = 0u;
      v261 = 0u;
      v206 = v41;
      v42 = v41;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v260, v289, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v261;
        do
        {
          for (m = 0; m != v44; ++m)
          {
            if (*(_QWORD *)v261 != v45)
              objc_enumerationMutation(v42);
            v47 = *(_QWORD *)(*((_QWORD *)&v260 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v47, 0);
              objc_msgSend(v6, "addInvalidSectionZilchPoints:", v48);

            }
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v260, v289, 16);
        }
        while (v44);
      }

      v5 = v207;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficColor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v258 = 0u;
      v259 = 0u;
      v256 = 0u;
      v257 = 0u;
      v50 = v49;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v256, v288, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v257;
        do
        {
          for (n = 0; n != v52; ++n)
          {
            if (*(_QWORD *)v257 != v53)
              objc_enumerationMutation(v50);
            v55 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v6, "addTrafficColor:", objc_msgSend(v55, "unsignedIntValue"));
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v256, v288, 16);
        }
        while (v52);
      }

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficColorOffset"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v254 = 0u;
      v255 = 0u;
      v252 = 0u;
      v253 = 0u;
      v57 = v56;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v252, v287, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v253;
        do
        {
          for (ii = 0; ii != v59; ++ii)
          {
            if (*(_QWORD *)v253 != v60)
              objc_enumerationMutation(v57);
            v62 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v6, "addTrafficColorOffset:", objc_msgSend(v62, "unsignedIntValue"));
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v252, v287, 16);
        }
        while (v59);
      }

    }
    if (a3)
      v63 = CFSTR("routeLineStyleInfo");
    else
      v63 = CFSTR("route_line_style_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v63, v206);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v250 = 0u;
      v251 = 0u;
      v248 = 0u;
      v249 = 0u;
      v65 = v64;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v248, v286, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v249;
        do
        {
          for (jj = 0; jj != v67; ++jj)
          {
            if (*(_QWORD *)v249 != v68)
              objc_enumerationMutation(v65);
            v70 = *(_QWORD *)(*((_QWORD *)&v248 + 1) + 8 * jj);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v71 = [GEORouteLineStyleInfo alloc];
              if ((a3 & 1) != 0)
                v72 = -[GEORouteLineStyleInfo initWithJSON:](v71, "initWithJSON:", v70);
              else
                v72 = -[GEORouteLineStyleInfo initWithDictionary:](v71, "initWithDictionary:", v70);
              v73 = (void *)v72;
              objc_msgSend(v6, "addRouteLineStyleInfo:", v72);

            }
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v248, v286, 16);
        }
        while (v67);
      }

      v5 = v207;
    }

    if (a3)
      v74 = CFSTR("routeCameraInputInfo");
    else
      v74 = CFSTR("route_camera_input_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v246 = 0u;
      v247 = 0u;
      v244 = 0u;
      v245 = 0u;
      v76 = v75;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v244, v285, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v245;
        do
        {
          for (kk = 0; kk != v78; ++kk)
          {
            if (*(_QWORD *)v245 != v79)
              objc_enumerationMutation(v76);
            v81 = *(_QWORD *)(*((_QWORD *)&v244 + 1) + 8 * kk);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v82 = [GEORouteLineStyleInfo alloc];
              if ((a3 & 1) != 0)
                v83 = -[GEORouteLineStyleInfo initWithJSON:](v82, "initWithJSON:", v81);
              else
                v83 = -[GEORouteLineStyleInfo initWithDictionary:](v82, "initWithDictionary:", v81);
              v84 = (void *)v83;
              objc_msgSend(v6, "addRouteCameraInputInfo:", v83);

            }
          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v244, v285, 16);
        }
        while (v78);
      }

      v5 = v207;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentsOnETARoute"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v242 = 0u;
      v243 = 0u;
      v240 = 0u;
      v241 = 0u;
      v86 = v85;
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v240, v284, 16);
      if (v87)
      {
        v88 = v87;
        v89 = *(_QWORD *)v241;
        do
        {
          for (mm = 0; mm != v88; ++mm)
          {
            if (*(_QWORD *)v241 != v89)
              objc_enumerationMutation(v86);
            v91 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * mm);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v92 = [GEORouteIncident alloc];
              if ((a3 & 1) != 0)
                v93 = -[GEORouteIncident initWithJSON:](v92, "initWithJSON:", v91);
              else
                v93 = -[GEORouteIncident initWithDictionary:](v92, "initWithDictionary:", v91);
              v94 = (void *)v93;
              objc_msgSend(v6, "addIncidentsOnETARoute:", v93);

            }
          }
          v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v240, v284, 16);
        }
        while (v88);
      }

      v5 = v207;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentsOnReRoutes"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v238 = 0u;
      v239 = 0u;
      v236 = 0u;
      v237 = 0u;
      v96 = v95;
      v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v236, v283, 16);
      if (v97)
      {
        v98 = v97;
        v99 = *(_QWORD *)v237;
        do
        {
          for (nn = 0; nn != v98; ++nn)
          {
            if (*(_QWORD *)v237 != v99)
              objc_enumerationMutation(v96);
            v101 = *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * nn);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v102 = [GEORouteIncident alloc];
              if ((a3 & 1) != 0)
                v103 = -[GEORouteIncident initWithJSON:](v102, "initWithJSON:", v101);
              else
                v103 = -[GEORouteIncident initWithDictionary:](v102, "initWithDictionary:", v101);
              v104 = (void *)v103;
              objc_msgSend(v6, "addIncidentsOnReRoutes:", v103);

            }
          }
          v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v236, v283, 16);
        }
        while (v98);
      }

      v5 = v207;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentsOffReRoutes"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v234 = 0u;
      v235 = 0u;
      v232 = 0u;
      v233 = 0u;
      v106 = v105;
      v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v232, v282, 16);
      if (v107)
      {
        v108 = v107;
        v109 = *(_QWORD *)v233;
        do
        {
          for (i1 = 0; i1 != v108; ++i1)
          {
            if (*(_QWORD *)v233 != v109)
              objc_enumerationMutation(v106);
            v111 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * i1);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v112 = [GEORouteIncident alloc];
              if ((a3 & 1) != 0)
                v113 = -[GEORouteIncident initWithJSON:](v112, "initWithJSON:", v111);
              else
                v113 = -[GEORouteIncident initWithDictionary:](v112, "initWithDictionary:", v111);
              v114 = (void *)v113;
              objc_msgSend(v6, "addIncidentsOffReRoutes:", v113);

            }
          }
          v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v232, v282, 16);
        }
        while (v108);
      }

      v5 = v207;
    }

    if (a3)
      v115 = CFSTR("incidentIndex");
    else
      v115 = CFSTR("incident_index");
    objc_msgSend(v5, "objectForKeyedSubscript:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v230 = 0u;
      v231 = 0u;
      v228 = 0u;
      v229 = 0u;
      v117 = v116;
      v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v228, v281, 16);
      if (v118)
      {
        v119 = v118;
        v120 = *(_QWORD *)v229;
        do
        {
          for (i2 = 0; i2 != v119; ++i2)
          {
            if (*(_QWORD *)v229 != v120)
              objc_enumerationMutation(v117);
            v122 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * i2);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v6, "addIncidentIndex:", objc_msgSend(v122, "unsignedIntValue"));
          }
          v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v228, v281, 16);
        }
        while (v119);
      }

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentEndOffsetsInETARoute"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v226 = 0u;
      v227 = 0u;
      v224 = 0u;
      v225 = 0u;
      v124 = v123;
      v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v224, v280, 16);
      if (v125)
      {
        v126 = v125;
        v127 = *(_QWORD *)v225;
        do
        {
          for (i3 = 0; i3 != v126; ++i3)
          {
            if (*(_QWORD *)v225 != v127)
              objc_enumerationMutation(v124);
            v129 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * i3);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v6, "addIncidentEndOffsetsInETARoute:", objc_msgSend(v129, "unsignedIntValue"));
          }
          v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v224, v280, 16);
        }
        while (v126);
      }

    }
    if (a3)
      v130 = CFSTR("trafficBannerText");
    else
      v130 = CFSTR("traffic_banner_text");
    objc_msgSend(v5, "objectForKeyedSubscript:", v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v132 = [GEOTrafficBannerText alloc];
      if ((a3 & 1) != 0)
        v133 = -[GEOTrafficBannerText initWithJSON:](v132, "initWithJSON:", v131);
      else
        v133 = -[GEOTrafficBannerText initWithDictionary:](v132, "initWithDictionary:", v131);
      v135 = (void *)v133;
      objc_msgSend(v6, "setTrafficBannerText:", v133);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("historicTravelTime"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setHistoricTravelTime:", objc_msgSend(v136, "unsignedIntValue"));

    if (a3)
      v137 = CFSTR("travelTimeAggressiveEstimate");
    else
      v137 = CFSTR("travel_time_aggressive_estimate");
    objc_msgSend(v5, "objectForKeyedSubscript:", v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setTravelTimeAggressiveEstimate:", objc_msgSend(v138, "unsignedIntValue"));

    if (a3)
      v139 = CFSTR("travelTimeBestEstimate");
    else
      v139 = CFSTR("travel_time_best_estimate");
    objc_msgSend(v5, "objectForKeyedSubscript:", v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setTravelTimeBestEstimate:", objc_msgSend(v140, "unsignedIntValue"));

    if (a3)
      v141 = CFSTR("travelTimeConservativeEstimate");
    else
      v141 = CFSTR("travel_time_conservative_estimate");
    objc_msgSend(v5, "objectForKeyedSubscript:", v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setTravelTimeConservativeEstimate:", objc_msgSend(v142, "unsignedIntValue"));

    if (a3)
      v143 = CFSTR("staticTravelTime");
    else
      v143 = CFSTR("static_travel_time");
    objc_msgSend(v5, "objectForKeyedSubscript:", v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setStaticTravelTime:", objc_msgSend(v144, "unsignedIntValue"));

    if (a3)
      v145 = CFSTR("enrouteNotice");
    else
      v145 = CFSTR("enroute_notice");
    objc_msgSend(v5, "objectForKeyedSubscript:", v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v222 = 0u;
      v223 = 0u;
      v220 = 0u;
      v221 = 0u;
      v147 = v146;
      v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v220, v279, 16);
      if (v148)
      {
        v149 = v148;
        v150 = *(_QWORD *)v221;
        do
        {
          for (i4 = 0; i4 != v149; ++i4)
          {
            if (*(_QWORD *)v221 != v150)
              objc_enumerationMutation(v147);
            v152 = *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * i4);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v153 = [GEOEnrouteNotice alloc];
              if ((a3 & 1) != 0)
                v154 = -[GEOEnrouteNotice initWithJSON:](v153, "initWithJSON:", v152);
              else
                v154 = -[GEOEnrouteNotice initWithDictionary:](v153, "initWithDictionary:", v152);
              v155 = (void *)v154;
              objc_msgSend(v6, "addEnrouteNotice:", v154);

            }
          }
          v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v220, v279, 16);
        }
        while (v149);
      }

      v5 = v207;
    }

    if (a3)
      v156 = CFSTR("trafficColorInfo");
    else
      v156 = CFSTR("traffic_color_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v218 = 0u;
      v219 = 0u;
      v216 = 0u;
      v217 = 0u;
      v158 = v157;
      v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v216, v278, 16);
      if (v159)
      {
        v160 = v159;
        v161 = *(_QWORD *)v217;
        do
        {
          for (i5 = 0; i5 != v160; ++i5)
          {
            if (*(_QWORD *)v217 != v161)
              objc_enumerationMutation(v158);
            v163 = *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * i5);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v164 = [GEOTrafficColorInfo alloc];
              if ((a3 & 1) != 0)
                v165 = -[GEOTrafficColorInfo initWithJSON:](v164, "initWithJSON:", v163);
              else
                v165 = -[GEOTrafficColorInfo initWithDictionary:](v164, "initWithDictionary:", v163);
              v166 = (void *)v165;
              objc_msgSend(v6, "addTrafficColorInfo:", v165);

            }
          }
          v160 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v216, v278, 16);
        }
        while (v160);
      }

      v5 = v207;
    }

    if (a3)
      v167 = CFSTR("incidentOnRouteInfo");
    else
      v167 = CFSTR("incident_on_route_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v214 = 0u;
      v215 = 0u;
      v212 = 0u;
      v213 = 0u;
      v169 = v168;
      v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v212, v277, 16);
      if (v170)
      {
        v171 = v170;
        v172 = *(_QWORD *)v213;
        do
        {
          for (i6 = 0; i6 != v171; ++i6)
          {
            if (*(_QWORD *)v213 != v172)
              objc_enumerationMutation(v169);
            v174 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * i6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v175 = [GEOIncidentOnRouteInfo alloc];
              if ((a3 & 1) != 0)
                v176 = -[GEOIncidentOnRouteInfo initWithJSON:](v175, "initWithJSON:", v174);
              else
                v176 = -[GEOIncidentOnRouteInfo initWithDictionary:](v175, "initWithDictionary:", v174);
              v177 = (void *)v176;
              objc_msgSend(v6, "addIncidentOnRouteInfo:", v176);

            }
          }
          v171 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v212, v277, 16);
        }
        while (v171);
      }

      v5 = v207;
    }

    if (a3)
      v178 = CFSTR("originWaypointInfo");
    else
      v178 = CFSTR("origin_waypoint_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v180 = [GEOWaypointInfo alloc];
      if ((a3 & 1) != 0)
        v181 = -[GEOWaypointInfo initWithJSON:](v180, "initWithJSON:", v179);
      else
        v181 = -[GEOWaypointInfo initWithDictionary:](v180, "initWithDictionary:", v179);
      v182 = (void *)v181;
      objc_msgSend(v6, "setOriginWaypointInfo:", v181);

    }
    if (a3)
      v183 = CFSTR("destinationWaypointInfo");
    else
      v183 = CFSTR("destination_waypoint_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v185 = [GEOWaypointInfo alloc];
      if ((a3 & 1) != 0)
        v186 = -[GEOWaypointInfo initWithJSON:](v185, "initWithJSON:", v184);
      else
        v186 = -[GEOWaypointInfo initWithDictionary:](v185, "initWithDictionary:", v184);
      v187 = (void *)v186;
      objc_msgSend(v6, "setDestinationWaypointInfo:", v186);

    }
    if (a3)
      v188 = CFSTR("navigabilityInfo");
    else
      v188 = CFSTR("navigability_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v188);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v190 = [GEONavigabilityInfo alloc];
      if ((a3 & 1) != 0)
        v191 = -[GEONavigabilityInfo initWithJSON:](v190, "initWithJSON:", v189);
      else
        v191 = -[GEONavigabilityInfo initWithDictionary:](v190, "initWithDictionary:", v189);
      v192 = (void *)v191;
      objc_msgSend(v6, "setNavigabilityInfo:", v191);

    }
    if (a3)
      v193 = CFSTR("guidanceEvent");
    else
      v193 = CFSTR("guidance_event");
    objc_msgSend(v5, "objectForKeyedSubscript:", v193);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v210 = 0u;
      v211 = 0u;
      v208 = 0u;
      v209 = 0u;
      v195 = v194;
      v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v208, v276, 16);
      if (v196)
      {
        v197 = v196;
        v198 = *(_QWORD *)v209;
        do
        {
          for (i7 = 0; i7 != v197; ++i7)
          {
            if (*(_QWORD *)v209 != v198)
              objc_enumerationMutation(v195);
            v200 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * i7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v201 = [GEOGuidanceEvent alloc];
              if ((a3 & 1) != 0)
                v202 = -[GEOGuidanceEvent initWithJSON:](v201, "initWithJSON:", v200);
              else
                v202 = -[GEOGuidanceEvent initWithDictionary:](v201, "initWithDictionary:", v200);
              v203 = (void *)v202;
              objc_msgSend(v6, "addGuidanceEvent:", v202);

            }
          }
          v197 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v208, v276, 16);
        }
        while (v197);
      }

      v5 = v207;
    }

    v134 = v6;
  }
  else
  {
    v134 = 0;
  }

  return v134;
}

- (GEOETARoute)initWithJSON:(id)a3
{
  return (GEOETARoute *)-[GEOETARoute _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_909;
    else
      v8 = (int *)&readAll__nonRecursiveTag_910;
    GEOETARouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOETARouteCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETARouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETARouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  unint64_t v22;
  unint64_t v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t ii;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t jj;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t kk;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t mm;
  unint64_t v44;
  unint64_t v45;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t nn;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i1;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i2;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i3;
  PBDataReader *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETARouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v63 = self->_reader;
    objc_sync_enter(v63);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v64);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v63);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOETARoute readAll:](self, "readAll:", 0);
    if (self->_routeID)
      PBDataWriterWriteDataField();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v6 = self->_steps;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v115 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
      }
      while (v7);
    }

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v10 = self->_zilchPoints;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v111;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v111 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteDataField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
      }
      while (v11);
    }

    if (self->_pathLeg)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v14 = self->_reroutedRoutes;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v107;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v107 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
      }
      while (v15);
    }

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v18 = self->_invalidSectionZilchPoints;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v103;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v103 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteDataField();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
      }
      while (v19);
    }

    if (self->_trafficColors.count)
    {
      v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColors.count)
      {
        v22 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v22;
        }
        while (v22 < self->_trafficColors.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficColorOffsets.count)
    {
      v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColorOffsets.count)
      {
        v23 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v23;
        }
        while (v23 < self->_trafficColorOffsets.count);
      }
      PBDataWriterRecallMark();
    }
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v24 = self->_routeLineStyleInfos;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v98;
      do
      {
        for (n = 0; n != v25; ++n)
        {
          if (*(_QWORD *)v98 != v26)
            objc_enumerationMutation(v24);
          PBDataWriterWriteSubmessage();
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
      }
      while (v25);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v28 = self->_routeCameraInputInfos;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v94;
      do
      {
        for (ii = 0; ii != v29; ++ii)
        {
          if (*(_QWORD *)v94 != v30)
            objc_enumerationMutation(v28);
          PBDataWriterWriteSubmessage();
        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
      }
      while (v29);
    }

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v32 = self->_incidentsOnETARoutes;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v89, v124, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v90;
      do
      {
        for (jj = 0; jj != v33; ++jj)
        {
          if (*(_QWORD *)v90 != v34)
            objc_enumerationMutation(v32);
          PBDataWriterWriteSubmessage();
        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v89, v124, 16);
      }
      while (v33);
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v36 = self->_incidentsOnReRoutes;
    v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v85, v123, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v86;
      do
      {
        for (kk = 0; kk != v37; ++kk)
        {
          if (*(_QWORD *)v86 != v38)
            objc_enumerationMutation(v36);
          PBDataWriterWriteSubmessage();
        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v85, v123, 16);
      }
      while (v37);
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v40 = self->_incidentsOffReRoutes;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v81, v122, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v82;
      do
      {
        for (mm = 0; mm != v41; ++mm)
        {
          if (*(_QWORD *)v82 != v42)
            objc_enumerationMutation(v40);
          PBDataWriterWriteSubmessage();
        }
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v81, v122, 16);
      }
      while (v41);
    }

    if (self->_incidentIndexs.count)
    {
      v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentIndexs.count)
      {
        v44 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v44;
        }
        while (v44 < self->_incidentIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_incidentEndOffsetsInETARoutes.count)
    {
      v101 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentEndOffsetsInETARoutes.count)
      {
        v45 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v45;
        }
        while (v45 < self->_incidentEndOffsetsInETARoutes.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficBannerText)
      PBDataWriterWriteSubmessage();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v47 = self->_enrouteNotices;
    v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v77, v121, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v78;
      do
      {
        for (nn = 0; nn != v48; ++nn)
        {
          if (*(_QWORD *)v78 != v49)
            objc_enumerationMutation(v47);
          PBDataWriterWriteSubmessage();
        }
        v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v77, v121, 16);
      }
      while (v48);
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v51 = self->_trafficColorInfos;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v73, v120, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v74;
      do
      {
        for (i1 = 0; i1 != v52; ++i1)
        {
          if (*(_QWORD *)v74 != v53)
            objc_enumerationMutation(v51);
          PBDataWriterWriteSubmessage();
        }
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v73, v120, 16);
      }
      while (v52);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v55 = self->_incidentOnRouteInfos;
    v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v69, v119, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v70;
      do
      {
        for (i2 = 0; i2 != v56; ++i2)
        {
          if (*(_QWORD *)v70 != v57)
            objc_enumerationMutation(v55);
          PBDataWriterWriteSubmessage();
        }
        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v69, v119, 16);
      }
      while (v56);
    }

    if (self->_originWaypointInfo)
      PBDataWriterWriteSubmessage();
    if (self->_destinationWaypointInfo)
      PBDataWriterWriteSubmessage();
    if (self->_navigabilityInfo)
      PBDataWriterWriteSubmessage();
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v59 = self->_guidanceEvents;
    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v65, v118, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v66;
      do
      {
        for (i3 = 0; i3 != v60; ++i3)
        {
          if (*(_QWORD *)v66 != v61)
            objc_enumerationMutation(v59);
          PBDataWriterWriteSubmessage();
        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v65, v118, 16);
      }
      while (v60);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v65);
  }

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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  -[GEOETARoute _readDestinationWaypointInfo]((uint64_t)self);
  if (-[GEOWaypointInfo hasGreenTeaWithValue:](self->_destinationWaypointInfo, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOETARoute _readIncidentsOffReRoutes]((uint64_t)self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_incidentsOffReRoutes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_36;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

  -[GEOETARoute _readIncidentsOnETARoutes]((uint64_t)self);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_incidentsOnETARoutes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
LABEL_12:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_36;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v11)
          goto LABEL_12;
        break;
      }
    }
  }

  -[GEOETARoute _readIncidentsOnReRoutes]((uint64_t)self);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_incidentsOnReRoutes;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
LABEL_20:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3) & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
        if (v15)
          goto LABEL_20;
        goto LABEL_26;
      }
    }
LABEL_36:

    return 1;
  }
LABEL_26:

  -[GEOETARoute _readOriginWaypointInfo]((uint64_t)self);
  if (!-[GEOWaypointInfo hasGreenTeaWithValue:](self->_originWaypointInfo, "hasGreenTeaWithValue:", v3))
  {
    -[GEOETARoute _readReroutedRoutes]((uint64_t)self);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_reroutedRoutes;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
    if (!v18)
    {
LABEL_35:

      -[GEOETARoute _readTrafficBannerText]((uint64_t)self);
      return -[GEOTrafficBannerText hasGreenTeaWithValue:](self->_trafficBannerText, "hasGreenTeaWithValue:", v3);
    }
    v19 = v18;
    v20 = *(_QWORD *)v24;
LABEL_29:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v20)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (_QWORD)v23) & 1) != 0)
        goto LABEL_36;
      if (v19 == ++v21)
      {
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
        if (v19)
          goto LABEL_29;
        goto LABEL_35;
      }
    }
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
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  unint64_t v23;
  unint64_t v24;
  uint64_t ii;
  unint64_t v26;
  unint64_t v27;
  uint64_t jj;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t kk;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t mm;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t nn;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t i1;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t i2;
  unint64_t v49;
  unint64_t v50;
  uint64_t i3;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags;
  unint64_t v53;
  unint64_t v54;
  uint64_t i4;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t i5;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t i6;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t i7;
  void *v68;
  id *v69;

  v69 = (id *)a3;
  -[GEOETARoute readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v69 + 1, self->_reader);
  *((_DWORD *)v69 + 68) = self->_readerMarkPos;
  *((_DWORD *)v69 + 69) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeID)
    objc_msgSend(v69, "setRouteID:");
  if (-[GEOETARoute stepsCount](self, "stepsCount"))
  {
    objc_msgSend(v69, "clearSteps");
    v4 = -[GEOETARoute stepsCount](self, "stepsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOETARoute stepAtIndex:](self, "stepAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addStep:", v7);

      }
    }
  }
  if (-[GEOETARoute zilchPointsCount](self, "zilchPointsCount"))
  {
    objc_msgSend(v69, "clearZilchPoints");
    v8 = -[GEOETARoute zilchPointsCount](self, "zilchPointsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOETARoute zilchPointsAtIndex:](self, "zilchPointsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addZilchPoints:", v11);

      }
    }
  }
  if (self->_pathLeg)
    objc_msgSend(v69, "setPathLeg:");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *((_BYTE *)v69 + 304) = self->_routeNoLongerValid;
    *((_DWORD *)v69 + 77) |= 0x20u;
  }
  if (-[GEOETARoute reroutedRoutesCount](self, "reroutedRoutesCount"))
  {
    objc_msgSend(v69, "clearReroutedRoutes");
    v12 = -[GEOETARoute reroutedRoutesCount](self, "reroutedRoutesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOETARoute reroutedRouteAtIndex:](self, "reroutedRouteAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addReroutedRoute:", v15);

      }
    }
  }
  if (-[GEOETARoute invalidSectionZilchPointsCount](self, "invalidSectionZilchPointsCount"))
  {
    objc_msgSend(v69, "clearInvalidSectionZilchPoints");
    v16 = -[GEOETARoute invalidSectionZilchPointsCount](self, "invalidSectionZilchPointsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOETARoute invalidSectionZilchPointsAtIndex:](self, "invalidSectionZilchPointsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addInvalidSectionZilchPoints:", v19);

      }
    }
  }
  if (-[GEOETARoute trafficColorsCount](self, "trafficColorsCount"))
  {
    objc_msgSend(v69, "clearTrafficColors");
    v20 = -[GEOETARoute trafficColorsCount](self, "trafficColorsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
        objc_msgSend(v69, "addTrafficColor:", -[GEOETARoute trafficColorAtIndex:](self, "trafficColorAtIndex:", n));
    }
  }
  if (-[GEOETARoute trafficColorOffsetsCount](self, "trafficColorOffsetsCount"))
  {
    objc_msgSend(v69, "clearTrafficColorOffsets");
    v23 = -[GEOETARoute trafficColorOffsetsCount](self, "trafficColorOffsetsCount");
    if (v23)
    {
      v24 = v23;
      for (ii = 0; ii != v24; ++ii)
        objc_msgSend(v69, "addTrafficColorOffset:", -[GEOETARoute trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", ii));
    }
  }
  if (-[GEOETARoute routeLineStyleInfosCount](self, "routeLineStyleInfosCount"))
  {
    objc_msgSend(v69, "clearRouteLineStyleInfos");
    v26 = -[GEOETARoute routeLineStyleInfosCount](self, "routeLineStyleInfosCount");
    if (v26)
    {
      v27 = v26;
      for (jj = 0; jj != v27; ++jj)
      {
        -[GEOETARoute routeLineStyleInfoAtIndex:](self, "routeLineStyleInfoAtIndex:", jj);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addRouteLineStyleInfo:", v29);

      }
    }
  }
  if (-[GEOETARoute routeCameraInputInfosCount](self, "routeCameraInputInfosCount"))
  {
    objc_msgSend(v69, "clearRouteCameraInputInfos");
    v30 = -[GEOETARoute routeCameraInputInfosCount](self, "routeCameraInputInfosCount");
    if (v30)
    {
      v31 = v30;
      for (kk = 0; kk != v31; ++kk)
      {
        -[GEOETARoute routeCameraInputInfoAtIndex:](self, "routeCameraInputInfoAtIndex:", kk);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addRouteCameraInputInfo:", v33);

      }
    }
  }
  if (-[GEOETARoute incidentsOnETARoutesCount](self, "incidentsOnETARoutesCount"))
  {
    objc_msgSend(v69, "clearIncidentsOnETARoutes");
    v34 = -[GEOETARoute incidentsOnETARoutesCount](self, "incidentsOnETARoutesCount");
    if (v34)
    {
      v35 = v34;
      for (mm = 0; mm != v35; ++mm)
      {
        -[GEOETARoute incidentsOnETARouteAtIndex:](self, "incidentsOnETARouteAtIndex:", mm);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addIncidentsOnETARoute:", v37);

      }
    }
  }
  if (-[GEOETARoute incidentsOnReRoutesCount](self, "incidentsOnReRoutesCount"))
  {
    objc_msgSend(v69, "clearIncidentsOnReRoutes");
    v38 = -[GEOETARoute incidentsOnReRoutesCount](self, "incidentsOnReRoutesCount");
    if (v38)
    {
      v39 = v38;
      for (nn = 0; nn != v39; ++nn)
      {
        -[GEOETARoute incidentsOnReRoutesAtIndex:](self, "incidentsOnReRoutesAtIndex:", nn);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addIncidentsOnReRoutes:", v41);

      }
    }
  }
  if (-[GEOETARoute incidentsOffReRoutesCount](self, "incidentsOffReRoutesCount"))
  {
    objc_msgSend(v69, "clearIncidentsOffReRoutes");
    v42 = -[GEOETARoute incidentsOffReRoutesCount](self, "incidentsOffReRoutesCount");
    if (v42)
    {
      v43 = v42;
      for (i1 = 0; i1 != v43; ++i1)
      {
        -[GEOETARoute incidentsOffReRoutesAtIndex:](self, "incidentsOffReRoutesAtIndex:", i1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addIncidentsOffReRoutes:", v45);

      }
    }
  }
  if (-[GEOETARoute incidentIndexsCount](self, "incidentIndexsCount"))
  {
    objc_msgSend(v69, "clearIncidentIndexs");
    v46 = -[GEOETARoute incidentIndexsCount](self, "incidentIndexsCount");
    if (v46)
    {
      v47 = v46;
      for (i2 = 0; i2 != v47; ++i2)
        objc_msgSend(v69, "addIncidentIndex:", -[GEOETARoute incidentIndexAtIndex:](self, "incidentIndexAtIndex:", i2));
    }
  }
  if (-[GEOETARoute incidentEndOffsetsInETARoutesCount](self, "incidentEndOffsetsInETARoutesCount"))
  {
    objc_msgSend(v69, "clearIncidentEndOffsetsInETARoutes");
    v49 = -[GEOETARoute incidentEndOffsetsInETARoutesCount](self, "incidentEndOffsetsInETARoutesCount");
    if (v49)
    {
      v50 = v49;
      for (i3 = 0; i3 != v50; ++i3)
        objc_msgSend(v69, "addIncidentEndOffsetsInETARoute:", -[GEOETARoute incidentEndOffsetsInETARouteAtIndex:](self, "incidentEndOffsetsInETARouteAtIndex:", i3));
    }
  }
  if (self->_trafficBannerText)
    objc_msgSend(v69, "setTrafficBannerText:");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *((_DWORD *)v69 + 71) = self->_historicTravelTime;
    *((_DWORD *)v69 + 77) |= 1u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_63:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_64;
      goto LABEL_92;
    }
  }
  else if ((*(_BYTE *)&flags & 4) == 0)
  {
    goto LABEL_63;
  }
  *((_DWORD *)v69 + 73) = self->_travelTimeAggressiveEstimate;
  *((_DWORD *)v69 + 77) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_64:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_65;
LABEL_93:
    *((_DWORD *)v69 + 75) = self->_travelTimeConservativeEstimate;
    *((_DWORD *)v69 + 77) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 2) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_92:
  *((_DWORD *)v69 + 74) = self->_travelTimeBestEstimate;
  *((_DWORD *)v69 + 77) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
    goto LABEL_93;
LABEL_65:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_66:
    *((_DWORD *)v69 + 72) = self->_staticTravelTime;
    *((_DWORD *)v69 + 77) |= 2u;
  }
LABEL_67:
  if (-[GEOETARoute enrouteNoticesCount](self, "enrouteNoticesCount"))
  {
    objc_msgSend(v69, "clearEnrouteNotices");
    v53 = -[GEOETARoute enrouteNoticesCount](self, "enrouteNoticesCount");
    if (v53)
    {
      v54 = v53;
      for (i4 = 0; i4 != v54; ++i4)
      {
        -[GEOETARoute enrouteNoticeAtIndex:](self, "enrouteNoticeAtIndex:", i4);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addEnrouteNotice:", v56);

      }
    }
  }
  if (-[GEOETARoute trafficColorInfosCount](self, "trafficColorInfosCount"))
  {
    objc_msgSend(v69, "clearTrafficColorInfos");
    v57 = -[GEOETARoute trafficColorInfosCount](self, "trafficColorInfosCount");
    if (v57)
    {
      v58 = v57;
      for (i5 = 0; i5 != v58; ++i5)
      {
        -[GEOETARoute trafficColorInfoAtIndex:](self, "trafficColorInfoAtIndex:", i5);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addTrafficColorInfo:", v60);

      }
    }
  }
  if (-[GEOETARoute incidentOnRouteInfosCount](self, "incidentOnRouteInfosCount"))
  {
    objc_msgSend(v69, "clearIncidentOnRouteInfos");
    v61 = -[GEOETARoute incidentOnRouteInfosCount](self, "incidentOnRouteInfosCount");
    if (v61)
    {
      v62 = v61;
      for (i6 = 0; i6 != v62; ++i6)
      {
        -[GEOETARoute incidentOnRouteInfoAtIndex:](self, "incidentOnRouteInfoAtIndex:", i6);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addIncidentOnRouteInfo:", v64);

      }
    }
  }
  if (self->_originWaypointInfo)
    objc_msgSend(v69, "setOriginWaypointInfo:");
  if (self->_destinationWaypointInfo)
    objc_msgSend(v69, "setDestinationWaypointInfo:");
  if (self->_navigabilityInfo)
    objc_msgSend(v69, "setNavigabilityInfo:");
  if (-[GEOETARoute guidanceEventsCount](self, "guidanceEventsCount"))
  {
    objc_msgSend(v69, "clearGuidanceEvents");
    v65 = -[GEOETARoute guidanceEventsCount](self, "guidanceEventsCount");
    if (v65)
    {
      v66 = v65;
      for (i7 = 0; i7 != v66; ++i7)
      {
        -[GEOETARoute guidanceEventAtIndex:](self, "guidanceEventAtIndex:", i7);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addGuidanceEvent:", v68);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t ii;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t jj;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t kk;
  void *v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t mm;
  void *v57;
  id v58;
  void *v59;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t nn;
  void *v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i1;
  void *v70;
  NSMutableArray *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i2;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  NSMutableArray *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i3;
  void *v86;
  PBUnknownFields *v87;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOETARouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_105;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETARoute readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v9;

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v11 = self->_steps;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v138;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v138 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStep:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
    }
    while (v12);
  }

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v16 = self->_zilchPoints;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v134;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v134 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addZilchPoints:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
    }
    while (v17);
  }

  v21 = -[NSData copyWithZone:](self->_pathLeg, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v21;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 304) = self->_routeNoLongerValid;
    *(_DWORD *)(v5 + 308) |= 0x20u;
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v23 = self->_reroutedRoutes;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v130;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v130 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addReroutedRoute:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
    }
    while (v24);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v28 = self->_invalidSectionZilchPoints;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v126;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v126 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addInvalidSectionZilchPoints:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
    }
    while (v29);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v33 = self->_routeLineStyleInfos;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v122;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v122 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteLineStyleInfo:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
    }
    while (v34);
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v38 = self->_routeCameraInputInfos;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v118;
    do
    {
      for (ii = 0; ii != v39; ++ii)
      {
        if (*(_QWORD *)v118 != v40)
          objc_enumerationMutation(v38);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteCameraInputInfo:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
    }
    while (v39);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v43 = self->_incidentsOnETARoutes;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v113, v147, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v114;
    do
    {
      for (jj = 0; jj != v44; ++jj)
      {
        if (*(_QWORD *)v114 != v45)
          objc_enumerationMutation(v43);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentsOnETARoute:", v47);

      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v113, v147, 16);
    }
    while (v44);
  }

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v48 = self->_incidentsOnReRoutes;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v109, v146, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v110;
    do
    {
      for (kk = 0; kk != v49; ++kk)
      {
        if (*(_QWORD *)v110 != v50)
          objc_enumerationMutation(v48);
        v52 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentsOnReRoutes:", v52);

      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v109, v146, 16);
    }
    while (v49);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v53 = self->_incidentsOffReRoutes;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v105, v145, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v106;
    do
    {
      for (mm = 0; mm != v54; ++mm)
      {
        if (*(_QWORD *)v106 != v55)
          objc_enumerationMutation(v53);
        v57 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentsOffReRoutes:", v57);

      }
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v105, v145, 16);
    }
    while (v54);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v58 = -[GEOTrafficBannerText copyWithZone:](self->_trafficBannerText, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v58;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 284) = self->_historicTravelTime;
    *(_DWORD *)(v5 + 308) |= 1u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_72:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_73;
      goto LABEL_108;
    }
  }
  else if ((*(_BYTE *)&flags & 4) == 0)
  {
    goto LABEL_72;
  }
  *(_DWORD *)(v5 + 292) = self->_travelTimeAggressiveEstimate;
  *(_DWORD *)(v5 + 308) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_73:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_74;
LABEL_109:
    *(_DWORD *)(v5 + 300) = self->_travelTimeConservativeEstimate;
    *(_DWORD *)(v5 + 308) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 2) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_108:
  *(_DWORD *)(v5 + 296) = self->_travelTimeBestEstimate;
  *(_DWORD *)(v5 + 308) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
    goto LABEL_109;
LABEL_74:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_75:
    *(_DWORD *)(v5 + 288) = self->_staticTravelTime;
    *(_DWORD *)(v5 + 308) |= 2u;
  }
LABEL_76:
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v61 = self->_enrouteNotices;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v101, v144, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v102;
    do
    {
      for (nn = 0; nn != v62; ++nn)
      {
        if (*(_QWORD *)v102 != v63)
          objc_enumerationMutation(v61);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEnrouteNotice:", v65);

      }
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v101, v144, 16);
    }
    while (v62);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v66 = self->_trafficColorInfos;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v97, v143, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v98;
    do
    {
      for (i1 = 0; i1 != v67; ++i1)
      {
        if (*(_QWORD *)v98 != v68)
          objc_enumerationMutation(v66);
        v70 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficColorInfo:", v70);

      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v97, v143, 16);
    }
    while (v67);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v71 = self->_incidentOnRouteInfos;
  v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v93, v142, 16);
  if (v72)
  {
    v73 = *(_QWORD *)v94;
    do
    {
      for (i2 = 0; i2 != v72; ++i2)
      {
        if (*(_QWORD *)v94 != v73)
          objc_enumerationMutation(v71);
        v75 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i2), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentOnRouteInfo:", v75);

      }
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v93, v142, 16);
    }
    while (v72);
  }

  v76 = -[GEOWaypointInfo copyWithZone:](self->_originWaypointInfo, "copyWithZone:", a3);
  v77 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v76;

  v78 = -[GEOWaypointInfo copyWithZone:](self->_destinationWaypointInfo, "copyWithZone:", a3);
  v79 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v78;

  v80 = -[GEONavigabilityInfo copyWithZone:](self->_navigabilityInfo, "copyWithZone:", a3);
  v81 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v80;

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v82 = self->_guidanceEvents;
  v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v89, v141, 16);
  if (v83)
  {
    v84 = *(_QWORD *)v90;
    do
    {
      for (i3 = 0; i3 != v83; ++i3)
      {
        if (*(_QWORD *)v90 != v84)
          objc_enumerationMutation(v82);
        v86 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i3), "copyWithZone:", a3, (_QWORD)v89);
        objc_msgSend((id)v5, "addGuidanceEvent:", v86);

      }
      v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v89, v141, 16);
    }
    while (v83);
  }

  v87 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v87;
LABEL_105:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *routeID;
  NSMutableArray *steps;
  NSMutableArray *zilchPoints;
  NSData *pathLeg;
  int v9;
  NSMutableArray *reroutedRoutes;
  NSMutableArray *invalidSectionZilchPoints;
  NSMutableArray *routeLineStyleInfos;
  NSMutableArray *routeCameraInputInfos;
  NSMutableArray *incidentsOnETARoutes;
  NSMutableArray *incidentsOnReRoutes;
  NSMutableArray *incidentsOffReRoutes;
  GEOTrafficBannerText *trafficBannerText;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags;
  int v19;
  NSMutableArray *enrouteNotices;
  NSMutableArray *trafficColorInfos;
  NSMutableArray *incidentOnRouteInfos;
  GEOWaypointInfo *originWaypointInfo;
  GEOWaypointInfo *destinationWaypointInfo;
  GEONavigabilityInfo *navigabilityInfo;
  NSMutableArray *guidanceEvents;
  char v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_77;
  -[GEOETARoute readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((_QWORD *)v4 + 27))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:"))
      goto LABEL_77;
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((_QWORD *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](steps, "isEqual:"))
      goto LABEL_77;
  }
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((_QWORD *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](zilchPoints, "isEqual:"))
      goto LABEL_77;
  }
  pathLeg = self->_pathLeg;
  if ((unint64_t)pathLeg | *((_QWORD *)v4 + 25))
  {
    if (!-[NSData isEqual:](pathLeg, "isEqual:"))
      goto LABEL_77;
  }
  v9 = *((_DWORD *)v4 + 77);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((v9 & 0x20) != 0)
    {
      if (self->_routeNoLongerValid)
      {
        if (!*((_BYTE *)v4 + 304))
          goto LABEL_77;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 304))
        goto LABEL_18;
    }
LABEL_77:
    v27 = 0;
    goto LABEL_78;
  }
  if ((v9 & 0x20) != 0)
    goto LABEL_77;
LABEL_18:
  reroutedRoutes = self->_reroutedRoutes;
  if ((unint64_t)reroutedRoutes | *((_QWORD *)v4 + 26)
    && !-[NSMutableArray isEqual:](reroutedRoutes, "isEqual:"))
  {
    goto LABEL_77;
  }
  invalidSectionZilchPoints = self->_invalidSectionZilchPoints;
  if ((unint64_t)invalidSectionZilchPoints | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](invalidSectionZilchPoints, "isEqual:"))
      goto LABEL_77;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_77;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_77;
  routeLineStyleInfos = self->_routeLineStyleInfos;
  if ((unint64_t)routeLineStyleInfos | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](routeLineStyleInfos, "isEqual:"))
      goto LABEL_77;
  }
  routeCameraInputInfos = self->_routeCameraInputInfos;
  if ((unint64_t)routeCameraInputInfos | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](routeCameraInputInfos, "isEqual:"))
      goto LABEL_77;
  }
  incidentsOnETARoutes = self->_incidentsOnETARoutes;
  if ((unint64_t)incidentsOnETARoutes | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnETARoutes, "isEqual:"))
      goto LABEL_77;
  }
  incidentsOnReRoutes = self->_incidentsOnReRoutes;
  if ((unint64_t)incidentsOnReRoutes | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnReRoutes, "isEqual:"))
      goto LABEL_77;
  }
  incidentsOffReRoutes = self->_incidentsOffReRoutes;
  if ((unint64_t)incidentsOffReRoutes | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](incidentsOffReRoutes, "isEqual:"))
      goto LABEL_77;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_77;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_77;
  trafficBannerText = self->_trafficBannerText;
  if ((unint64_t)trafficBannerText | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOTrafficBannerText isEqual:](trafficBannerText, "isEqual:"))
      goto LABEL_77;
  }
  flags = self->_flags;
  v19 = *((_DWORD *)v4 + 77);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v19 & 1) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 71))
      goto LABEL_77;
  }
  else if ((v19 & 1) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 73))
      goto LABEL_77;
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_travelTimeBestEstimate != *((_DWORD *)v4 + 74))
      goto LABEL_77;
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 75))
      goto LABEL_77;
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_staticTravelTime != *((_DWORD *)v4 + 72))
      goto LABEL_77;
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_77;
  }
  enrouteNotices = self->_enrouteNotices;
  if ((unint64_t)enrouteNotices | *((_QWORD *)v4 + 16)
    && !-[NSMutableArray isEqual:](enrouteNotices, "isEqual:"))
  {
    goto LABEL_77;
  }
  trafficColorInfos = self->_trafficColorInfos;
  if ((unint64_t)trafficColorInfos | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](trafficColorInfos, "isEqual:"))
      goto LABEL_77;
  }
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  if ((unint64_t)incidentOnRouteInfos | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](incidentOnRouteInfos, "isEqual:"))
      goto LABEL_77;
  }
  originWaypointInfo = self->_originWaypointInfo;
  if ((unint64_t)originWaypointInfo | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOWaypointInfo isEqual:](originWaypointInfo, "isEqual:"))
      goto LABEL_77;
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  if ((unint64_t)destinationWaypointInfo | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOWaypointInfo isEqual:](destinationWaypointInfo, "isEqual:"))
      goto LABEL_77;
  }
  navigabilityInfo = self->_navigabilityInfo;
  if ((unint64_t)navigabilityInfo | *((_QWORD *)v4 + 23))
  {
    if (!-[GEONavigabilityInfo isEqual:](navigabilityInfo, "isEqual:"))
      goto LABEL_77;
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((_QWORD *)v4 + 17))
    v27 = -[NSMutableArray isEqual:](guidanceEvents, "isEqual:");
  else
    v27 = 1;
LABEL_78:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  $C98F32EDFC9B1C2D78E34865DB4AC25D flags;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  -[GEOETARoute readAll:](self, "readAll:", 1);
  v33 = -[NSData hash](self->_routeID, "hash");
  v32 = -[NSMutableArray hash](self->_steps, "hash");
  v31 = -[NSMutableArray hash](self->_zilchPoints, "hash");
  v30 = -[NSData hash](self->_pathLeg, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v29 = 2654435761 * self->_routeNoLongerValid;
  else
    v29 = 0;
  v28 = -[NSMutableArray hash](self->_reroutedRoutes, "hash");
  v27 = -[NSMutableArray hash](self->_invalidSectionZilchPoints, "hash");
  v26 = PBRepeatedUInt32Hash();
  v25 = PBRepeatedUInt32Hash();
  v3 = -[NSMutableArray hash](self->_routeLineStyleInfos, "hash");
  v4 = -[NSMutableArray hash](self->_routeCameraInputInfos, "hash");
  v5 = -[NSMutableArray hash](self->_incidentsOnETARoutes, "hash");
  v6 = -[NSMutableArray hash](self->_incidentsOnReRoutes, "hash");
  v7 = -[NSMutableArray hash](self->_incidentsOffReRoutes, "hash");
  v8 = PBRepeatedUInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  v10 = -[GEOTrafficBannerText hash](self->_trafficBannerText, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v12 = 2654435761 * self->_historicTravelTime;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
LABEL_6:
      v13 = 2654435761 * self->_travelTimeAggressiveEstimate;
      if ((*(_BYTE *)&flags & 8) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v12 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_6;
  }
  v13 = 0;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
LABEL_7:
    v14 = 2654435761 * self->_travelTimeBestEstimate;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_8;
LABEL_13:
    v15 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_9;
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
LABEL_12:
  v14 = 0;
  if ((*(_BYTE *)&flags & 0x10) == 0)
    goto LABEL_13;
LABEL_8:
  v15 = 2654435761 * self->_travelTimeConservativeEstimate;
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_14;
LABEL_9:
  v16 = 2654435761 * self->_staticTravelTime;
LABEL_15:
  v17 = v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v18 = v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSMutableArray hash](self->_enrouteNotices, "hash");
  v19 = v18 ^ -[NSMutableArray hash](self->_trafficColorInfos, "hash");
  v20 = v19 ^ -[NSMutableArray hash](self->_incidentOnRouteInfos, "hash");
  v21 = v20 ^ -[GEOWaypointInfo hash](self->_originWaypointInfo, "hash");
  v22 = v17 ^ v21 ^ -[GEOWaypointInfo hash](self->_destinationWaypointInfo, "hash");
  v23 = -[GEONavigabilityInfo hash](self->_navigabilityInfo, "hash");
  return v22 ^ v23 ^ -[NSMutableArray hash](self->_guidanceEvents, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  uint64_t v28;
  uint64_t v29;
  uint64_t ii;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t jj;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t kk;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t mm;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t nn;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i1;
  uint64_t v56;
  uint64_t v57;
  uint64_t i2;
  uint64_t v59;
  uint64_t v60;
  uint64_t i3;
  GEOTrafficBannerText *trafficBannerText;
  uint64_t v63;
  int v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i4;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i5;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i6;
  GEOWaypointInfo *originWaypointInfo;
  uint64_t v81;
  GEOWaypointInfo *destinationWaypointInfo;
  uint64_t v83;
  GEONavigabilityInfo *navigabilityInfo;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i7;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 27))
    -[GEOETARoute setRouteID:](self, "setRouteID:");
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v5 = *((id *)v4 + 30);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v140 != v8)
          objc_enumerationMutation(v5);
        -[GEOETARoute addStep:](self, "addStep:", *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
    }
    while (v7);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v10 = *((id *)v4 + 33);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v136;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v136 != v13)
          objc_enumerationMutation(v10);
        -[GEOETARoute addZilchPoints:](self, "addZilchPoints:", *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 25))
    -[GEOETARoute setPathLeg:](self, "setPathLeg:");
  if ((*((_BYTE *)v4 + 308) & 0x20) != 0)
  {
    self->_routeNoLongerValid = *((_BYTE *)v4 + 304);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v15 = *((id *)v4 + 26);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v132;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v132 != v18)
          objc_enumerationMutation(v15);
        -[GEOETARoute addReroutedRoute:](self, "addReroutedRoute:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
    }
    while (v17);
  }

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v20 = *((id *)v4 + 22);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v128;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v128 != v23)
          objc_enumerationMutation(v20);
        -[GEOETARoute addInvalidSectionZilchPoints:](self, "addInvalidSectionZilchPoints:", *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
    }
    while (v22);
  }

  v25 = objc_msgSend(v4, "trafficColorsCount");
  if (v25)
  {
    v26 = v25;
    for (n = 0; n != v26; ++n)
      -[GEOETARoute addTrafficColor:](self, "addTrafficColor:", objc_msgSend(v4, "trafficColorAtIndex:", n));
  }
  v28 = objc_msgSend(v4, "trafficColorOffsetsCount");
  if (v28)
  {
    v29 = v28;
    for (ii = 0; ii != v29; ++ii)
      -[GEOETARoute addTrafficColorOffset:](self, "addTrafficColorOffset:", objc_msgSend(v4, "trafficColorOffsetAtIndex:", ii));
  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v31 = *((id *)v4 + 29);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v124;
    do
    {
      for (jj = 0; jj != v33; ++jj)
      {
        if (*(_QWORD *)v124 != v34)
          objc_enumerationMutation(v31);
        -[GEOETARoute addRouteLineStyleInfo:](self, "addRouteLineStyleInfo:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * jj));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
    }
    while (v33);
  }

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v36 = *((id *)v4 + 28);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v120;
    do
    {
      for (kk = 0; kk != v38; ++kk)
      {
        if (*(_QWORD *)v120 != v39)
          objc_enumerationMutation(v36);
        -[GEOETARoute addRouteCameraInputInfo:](self, "addRouteCameraInputInfo:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * kk));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
    }
    while (v38);
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v41 = *((id *)v4 + 20);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v116;
    do
    {
      for (mm = 0; mm != v43; ++mm)
      {
        if (*(_QWORD *)v116 != v44)
          objc_enumerationMutation(v41);
        -[GEOETARoute addIncidentsOnETARoute:](self, "addIncidentsOnETARoute:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * mm));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
    }
    while (v43);
  }

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v46 = *((id *)v4 + 21);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v111, v148, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v112;
    do
    {
      for (nn = 0; nn != v48; ++nn)
      {
        if (*(_QWORD *)v112 != v49)
          objc_enumerationMutation(v46);
        -[GEOETARoute addIncidentsOnReRoutes:](self, "addIncidentsOnReRoutes:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * nn));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v111, v148, 16);
    }
    while (v48);
  }

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v51 = *((id *)v4 + 19);
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v107, v147, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v108;
    do
    {
      for (i1 = 0; i1 != v53; ++i1)
      {
        if (*(_QWORD *)v108 != v54)
          objc_enumerationMutation(v51);
        -[GEOETARoute addIncidentsOffReRoutes:](self, "addIncidentsOffReRoutes:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i1));
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v107, v147, 16);
    }
    while (v53);
  }

  v56 = objc_msgSend(v4, "incidentIndexsCount");
  if (v56)
  {
    v57 = v56;
    for (i2 = 0; i2 != v57; ++i2)
      -[GEOETARoute addIncidentIndex:](self, "addIncidentIndex:", objc_msgSend(v4, "incidentIndexAtIndex:", i2));
  }
  v59 = objc_msgSend(v4, "incidentEndOffsetsInETARoutesCount");
  if (v59)
  {
    v60 = v59;
    for (i3 = 0; i3 != v60; ++i3)
      -[GEOETARoute addIncidentEndOffsetsInETARoute:](self, "addIncidentEndOffsetsInETARoute:", objc_msgSend(v4, "incidentEndOffsetsInETARouteAtIndex:", i3));
  }
  trafficBannerText = self->_trafficBannerText;
  v63 = *((_QWORD *)v4 + 31);
  if (trafficBannerText)
  {
    if (v63)
      -[GEOTrafficBannerText mergeFrom:](trafficBannerText, "mergeFrom:");
  }
  else if (v63)
  {
    -[GEOETARoute setTrafficBannerText:](self, "setTrafficBannerText:");
  }
  v64 = *((_DWORD *)v4 + 77);
  if ((v64 & 1) != 0)
  {
    self->_historicTravelTime = *((_DWORD *)v4 + 71);
    *(_DWORD *)&self->_flags |= 1u;
    v64 = *((_DWORD *)v4 + 77);
    if ((v64 & 4) == 0)
    {
LABEL_89:
      if ((v64 & 8) == 0)
        goto LABEL_90;
      goto LABEL_119;
    }
  }
  else if ((v64 & 4) == 0)
  {
    goto LABEL_89;
  }
  self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 73);
  *(_DWORD *)&self->_flags |= 4u;
  v64 = *((_DWORD *)v4 + 77);
  if ((v64 & 8) == 0)
  {
LABEL_90:
    if ((v64 & 0x10) == 0)
      goto LABEL_91;
    goto LABEL_120;
  }
LABEL_119:
  self->_travelTimeBestEstimate = *((_DWORD *)v4 + 74);
  *(_DWORD *)&self->_flags |= 8u;
  v64 = *((_DWORD *)v4 + 77);
  if ((v64 & 0x10) == 0)
  {
LABEL_91:
    if ((v64 & 2) == 0)
      goto LABEL_93;
    goto LABEL_92;
  }
LABEL_120:
  self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 75);
  *(_DWORD *)&self->_flags |= 0x10u;
  if ((*((_DWORD *)v4 + 77) & 2) != 0)
  {
LABEL_92:
    self->_staticTravelTime = *((_DWORD *)v4 + 72);
    *(_DWORD *)&self->_flags |= 2u;
  }
LABEL_93:
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v65 = *((id *)v4 + 16);
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v146, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v104;
    do
    {
      for (i4 = 0; i4 != v67; ++i4)
      {
        if (*(_QWORD *)v104 != v68)
          objc_enumerationMutation(v65);
        -[GEOETARoute addEnrouteNotice:](self, "addEnrouteNotice:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i4));
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v146, 16);
    }
    while (v67);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v70 = *((id *)v4 + 32);
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v99, v145, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v100;
    do
    {
      for (i5 = 0; i5 != v72; ++i5)
      {
        if (*(_QWORD *)v100 != v73)
          objc_enumerationMutation(v70);
        -[GEOETARoute addTrafficColorInfo:](self, "addTrafficColorInfo:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i5));
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v99, v145, 16);
    }
    while (v72);
  }

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v75 = *((id *)v4 + 18);
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v95, v144, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v96;
    do
    {
      for (i6 = 0; i6 != v77; ++i6)
      {
        if (*(_QWORD *)v96 != v78)
          objc_enumerationMutation(v75);
        -[GEOETARoute addIncidentOnRouteInfo:](self, "addIncidentOnRouteInfo:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i6));
      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v95, v144, 16);
    }
    while (v77);
  }

  originWaypointInfo = self->_originWaypointInfo;
  v81 = *((_QWORD *)v4 + 24);
  if (originWaypointInfo)
  {
    if (v81)
      -[GEOWaypointInfo mergeFrom:](originWaypointInfo, "mergeFrom:");
  }
  else if (v81)
  {
    -[GEOETARoute setOriginWaypointInfo:](self, "setOriginWaypointInfo:");
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  v83 = *((_QWORD *)v4 + 15);
  if (destinationWaypointInfo)
  {
    if (v83)
      -[GEOWaypointInfo mergeFrom:](destinationWaypointInfo, "mergeFrom:");
  }
  else if (v83)
  {
    -[GEOETARoute setDestinationWaypointInfo:](self, "setDestinationWaypointInfo:");
  }
  navigabilityInfo = self->_navigabilityInfo;
  v85 = *((_QWORD *)v4 + 23);
  if (navigabilityInfo)
  {
    if (v85)
      -[GEONavigabilityInfo mergeFrom:](navigabilityInfo, "mergeFrom:");
  }
  else if (v85)
  {
    -[GEOETARoute setNavigabilityInfo:](self, "setNavigabilityInfo:");
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v86 = *((id *)v4 + 17);
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v91, v143, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v92;
    do
    {
      for (i7 = 0; i7 != v88; ++i7)
      {
        if (*(_QWORD *)v92 != v89)
          objc_enumerationMutation(v86);
        -[GEOETARoute addGuidanceEvent:](self, "addGuidanceEvent:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i7), (_QWORD)v91);
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v91, v143, 16);
    }
    while (v88);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOETARouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_913);
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
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v3 = a3;
  v117 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40000040u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETARoute readAll:](self, "readAll:", 0);
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v7 = self->_steps;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v103;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v103 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
      }
      while (v9);
    }

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v12 = self->_reroutedRoutes;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v99;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v99 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
      }
      while (v14);
    }

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v17 = self->_routeLineStyleInfos;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v95;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v95 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
      }
      while (v19);
    }

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v22 = self->_routeCameraInputInfos;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v91;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v91 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v26++), "clearUnknownFields:", 1);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
      }
      while (v24);
    }

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v27 = self->_incidentsOnETARoutes;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v87;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v87 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v31++), "clearUnknownFields:", 1);
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
      }
      while (v29);
    }

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v32 = self->_incidentsOnReRoutes;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v82, v111, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v83;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v83 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v36++), "clearUnknownFields:", 1);
        }
        while (v34 != v36);
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v82, v111, 16);
      }
      while (v34);
    }

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v37 = self->_incidentsOffReRoutes;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v78, v110, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v79;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v79 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v41++), "clearUnknownFields:", 1);
        }
        while (v39 != v41);
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v78, v110, 16);
      }
      while (v39);
    }

    -[GEOTrafficBannerText clearUnknownFields:](self->_trafficBannerText, "clearUnknownFields:", 1);
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v42 = self->_enrouteNotices;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v74, v109, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v75;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v75 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v46++), "clearUnknownFields:", 1);
        }
        while (v44 != v46);
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v74, v109, 16);
      }
      while (v44);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v47 = self->_trafficColorInfos;
    v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v70, v108, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v71;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v71 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v51++), "clearUnknownFields:", 1);
        }
        while (v49 != v51);
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v70, v108, 16);
      }
      while (v49);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v52 = self->_incidentOnRouteInfos;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v66, v107, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v67;
      do
      {
        v56 = 0;
        do
        {
          if (*(_QWORD *)v67 != v55)
            objc_enumerationMutation(v52);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v56++), "clearUnknownFields:", 1);
        }
        while (v54 != v56);
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v66, v107, 16);
      }
      while (v54);
    }

    -[GEOWaypointInfo clearUnknownFields:](self->_originWaypointInfo, "clearUnknownFields:", 1);
    -[GEOWaypointInfo clearUnknownFields:](self->_destinationWaypointInfo, "clearUnknownFields:", 1);
    -[GEONavigabilityInfo clearUnknownFields:](self->_navigabilityInfo, "clearUnknownFields:", 1);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v57 = self->_guidanceEvents;
    v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v62, v106, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v63;
      do
      {
        v61 = 0;
        do
        {
          if (*(_QWORD *)v63 != v60)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v61++), "clearUnknownFields:", 1, (_QWORD)v62);
        }
        while (v59 != v61);
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v62, v106, 16);
      }
      while (v59);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_trafficColorInfos, 0);
  objc_storeStrong((id *)&self->_trafficBannerText, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_routeLineStyleInfos, 0);
  objc_storeStrong((id *)&self->_routeCameraInputInfos, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_reroutedRoutes, 0);
  objc_storeStrong((id *)&self->_pathLeg, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_navigabilityInfo, 0);
  objc_storeStrong((id *)&self->_invalidSectionZilchPoints, 0);
  objc_storeStrong((id *)&self->_incidentsOnReRoutes, 0);
  objc_storeStrong((id *)&self->_incidentsOnETARoutes, 0);
  objc_storeStrong((id *)&self->_incidentsOffReRoutes, 0);
  objc_storeStrong((id *)&self->_incidentOnRouteInfos, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_enrouteNotices, 0);
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
