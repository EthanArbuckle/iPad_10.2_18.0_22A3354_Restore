@implementation ARCoachingSessionCache

- (ARCoachingSessionCache)init
{
  ARCoachingSessionCache *v2;
  ARCoachingSessionCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARCoachingSessionCache;
  v2 = -[ARCoachingSessionCache init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ARCoachingSessionCache clear](v2, "clear");
  return v3;
}

- (void)clear
{
  self->_planeCount = 0;
  self->_horizontalPlaneCount = 0;
  self->_planeCacheInitialized = 0;
  self->_verticalPlaneCount = 0;
}

- (void)anchorsAdded:(id)a3
{
  if (self->_planeCacheInitialized)
    -[ARCoachingSessionCache updatePlaneCache:](self, "updatePlaneCache:", a3);
}

- (void)anchorsRemoved:(id)a3
{
  if (self->_planeCacheInitialized)
    -[ARCoachingSessionCache removeFromPlaneCache:](self, "removeFromPlaneCache:", a3);
}

- (void)sessionChanged
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARCoachingSessionCache *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ARLogCoaching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Clearing cached anchors info after session change", (uint8_t *)&v6, 0x16u);

  }
  -[ARCoachingSessionCache clear](self, "clear");
}

- (BOOL)hasAnyPlane:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  BOOL v8;
  int v10;
  void *v11;
  __int16 v12;
  ARCoachingSessionCache *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_planeCacheInitialized)
    {
      _ARLogCoaching();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v7;
        v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_1DCC73000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Searching frame for any planes", (uint8_t *)&v10, 0x16u);

      }
      -[ARCoachingSessionCache initializePlaneCache:](self, "initializePlaneCache:", v4);
    }
    v8 = self->_planeCount > 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasHorizontalPlane:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  BOOL v8;
  int v10;
  void *v11;
  __int16 v12;
  ARCoachingSessionCache *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_planeCacheInitialized)
    {
      _ARLogCoaching();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v7;
        v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_1DCC73000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Searching frame for horizontal planes", (uint8_t *)&v10, 0x16u);

      }
      -[ARCoachingSessionCache initializePlaneCache:](self, "initializePlaneCache:", v4);
    }
    v8 = self->_horizontalPlaneCount > 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasVerticalPlane:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  BOOL v8;
  int v10;
  void *v11;
  __int16 v12;
  ARCoachingSessionCache *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_planeCacheInitialized)
    {
      _ARLogCoaching();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v7;
        v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_1DCC73000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Searching frame for vertical planes", (uint8_t *)&v10, 0x16u);

      }
      -[ARCoachingSessionCache initializePlaneCache:](self, "initializePlaneCache:", v4);
    }
    v8 = self->_verticalPlaneCount > 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)initializePlaneCache:(id)a3
{
  void *v4;

  objc_msgSend(a3, "anchors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingSessionCache updatePlaneCache:](self, "updatePlaneCache:", v4);

  self->_planeCacheInitialized = 1;
}

- (void)updatePlaneCache:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__ARCoachingSessionCache_updatePlaneCache___block_invoke;
  v3[3] = &unk_1EA586450;
  v3[4] = self;
  ARCoachingEnumeratePlaneAnchors(a3, v3);
}

uint64_t __43__ARCoachingSessionCache_updatePlaneCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = objc_msgSend(a2, "alignment");
  if (result)
  {
    if (result != 1)
      return result;
    v4 = 24;
  }
  else
  {
    v4 = 16;
  }
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + v4);
  return result;
}

- (void)removeFromPlaneCache:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__ARCoachingSessionCache_removeFromPlaneCache___block_invoke;
  v3[3] = &unk_1EA586450;
  v3[4] = self;
  ARCoachingEnumeratePlaneAnchors(a3, v3);
}

uint64_t __47__ARCoachingSessionCache_removeFromPlaneCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = objc_msgSend(a2, "alignment");
  if (result)
  {
    if (result != 1)
      return result;
    v4 = 24;
  }
  else
  {
    v4 = 16;
  }
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + v4);
  return result;
}

@end
