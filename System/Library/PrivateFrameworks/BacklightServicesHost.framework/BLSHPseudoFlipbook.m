@implementation BLSHPseudoFlipbook

- (BLSHPseudoFlipbook)init
{
  BLSHPseudoFlipbook *v2;
  BLSHPseudoFlipbook *v3;
  uint64_t v4;
  NSMutableArray *lock_activeFrames;
  NSObject *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLSHPseudoFlipbook;
  v2 = -[BLSHPseudoFlipbook init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_activeFrames = v3->_lock_activeFrames;
    v3->_lock_activeFrames = (NSMutableArray *)v4;

    v3->_lock_nextframeID = 1;
    bls_flipbook_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BLSHPseudoFlipbook init].cold.1((uint64_t)v3, v6, v7);

  }
  return v3;
}

- (BLSHRenderedFlipbookFrame)frameOnGlass
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = mach_continuous_time();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_lock_activeFrames;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "presentationTime", (_QWORD)v14) <= v4)
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return (BLSHRenderedFlipbookFrame *)v8;
}

- (BLSHRenderedFlipbookFrame)lastRenderedFrame
{
  void *v2;
  void *v3;

  -[BLSHPseudoFlipbook activeFrames](self, "activeFrames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BLSHRenderedFlipbookFrame *)v3;
}

- (NSArray)activeFrames
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHPseudoFlipbook lock_cullExpiredFrames]((uint64_t)self);
  v4 = (void *)-[NSMutableArray copy](self->_lock_activeFrames, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (uint64_t)lock_cullExpiredFrames
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];

  if (result)
  {
    v1 = result;
    v2 = mach_continuous_time();
    v3 = *(void **)(v1 + 16);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__BLSHPseudoFlipbook_lock_cullExpiredFrames__block_invoke;
    v7[3] = &__block_descriptor_40_e44_B32__0___BLSHRenderedFlipbookFrame__8Q16_B24l;
    v7[4] = v2;
    result = objc_msgSend(v3, "indexOfObjectWithOptions:passingTest:", 2, v7);
    if (result && result != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = result;
      bls_flipbook_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BLSHPseudoFlipbook lock_cullExpiredFrames].cold.1(v1, v5, v6);

      return objc_msgSend(*(id *)(v1 + 16), "removeObjectsInRange:", 0, v5);
    }
  }
  return result;
}

- (unint64_t)memoryUsage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[BLSHPseudoFlipbook activeFrames](self, "activeFrames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 += objc_msgSend(v8, "memoryUsage");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isPowerSavingEnabled
{
  BLSHPseudoFlipbook *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_powerSavingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPowerSavingEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_powerSavingEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)is1HzFlipbook
{
  BLSHPseudoFlipbook *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set1HzFlipbook:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_1HzFlipbook = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)cachesFramesOnExit
{
  BLSHPseudoFlipbook *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cachesFramesOnExit;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCachesFramesOnExit:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_cachesFramesOnExit = a3;
  os_unfair_lock_unlock(p_lock);
}

BOOL __44__BLSHPseudoFlipbook_lock_cullExpiredFrames__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "presentationTime") < *(_QWORD *)(a1 + 32);
}

- (void)renderFrameForPresentation:(id)a3 dateSpecifier:(id)a4 completion:(id)a5
{
  os_unfair_lock_s *p_lock;
  void (**v8)(id, id, _QWORD);
  id v9;
  BLSHPseudoFlipbookFrame *v10;
  void *v11;
  uint64_t v12;
  BLSHPseudoFlipbookFrame *v13;

  p_lock = &self->_lock;
  v8 = (void (**)(id, id, _QWORD))a5;
  v9 = a4;
  os_unfair_lock_lock(p_lock);
  -[BLSHPseudoFlipbook lock_cullExpiredFrames]((uint64_t)self);
  v10 = [BLSHPseudoFlipbookFrame alloc];
  objc_msgSend(v9, "presentationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bls_machContinuousTime");
  ++self->_lock_nextframeID;
  v13 = -[BLSHPseudoFlipbookFrame initWithPresentationTime:frameId:specifier:memoryUsage:](v10, "initWithPresentationTime:frameId:specifier:memoryUsage:", v12);

  -[NSMutableArray addObject:](self->_lock_activeFrames, "addObject:", v13);
  os_unfair_lock_unlock(p_lock);
  v8[2](v8, v13, 0);

}

- (id)cancelAllFrames
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  NSMutableArray *lock_activeFrames;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = mach_continuous_time();
  lock_activeFrames = self->_lock_activeFrames;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__BLSHPseudoFlipbook_cancelAllFrames__block_invoke;
  v9[3] = &__block_descriptor_40_e44_B32__0___BLSHRenderedFlipbookFrame__8Q16_B24l;
  v9[4] = v4;
  v6 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](lock_activeFrames, "indexOfObjectWithOptions:passingTest:", 2, v9);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_lock_activeFrames, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableArray removeAllObjects](self->_lock_activeFrames, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  return v7;
}

BOOL __37__BLSHPseudoFlipbook_cancelAllFrames__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "presentationTime") < *(_QWORD *)(a1 + 32);
}

- (void)collect
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)purge
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeAllObjects](self->_lock_activeFrames, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_activeFrames, 0);
}

- (void)init
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_4(&dword_2145AC000, a2, a3, "%p created %{public}@", (uint8_t *)&v3);
}

- (void)lock_cullExpiredFrames
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, (uint64_t)a3, "%p culling (%lu) frames", (uint8_t *)&v3);
}

@end
