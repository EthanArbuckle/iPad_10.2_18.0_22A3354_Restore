@implementation SCNCommonProfileProgramGenerator

- (__C3DFXProgram)programWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 trackedResource:(id)a5 introspectionDataPtr:(void *)a6
{
  uint64_t HashCode;
  const __CFString *v12;
  os_unfair_lock_s *p_programMutex;
  CFSetRef *Value;
  CFSetRef *v15;
  int v16;
  _BOOL4 v17;
  __C3DFXProgram *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  SCNCommonProfileProgramCache *v28;
  void *Mutable;
  CFStringRef v31;
  NSObject *v32;
  int v34;
  const __CFString *v35;
  __int16 v36;
  CFStringRef v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  HashCode = C3DProgramHashCodeGetHashCode((uint64_t)a3);
  if (HashCode)
  {
    v12 = (const __CFString *)HashCode;
    p_programMutex = &self->_programMutex;
    os_unfair_lock_lock(&self->_programMutex);
    Value = (CFSetRef *)CFDictionaryGetValue(self->_shaders, v12);
    if (Value)
    {
      v15 = Value;
      v16 = CFSetContainsValue(Value[2], a5);
      v17 = v16 == 0;
      if (!v16)
        CFSetAddValue(v15[2], a5);
      v18 = (__C3DFXProgram *)v15[1];
    }
    else
    {
      v27 = (void *)MEMORY[0x1DF0D4CF4]();
      kdebug_trace();
      v18 = (__C3DFXProgram *)-[SCNCommonProfileProgramGenerator _newProgramWithHashCode:engineContext:introspectionDataPtr:](self, "_newProgramWithHashCode:engineContext:introspectionDataPtr:", a3, a4, a6);
      kdebug_trace();
      objc_autoreleasePoolPop(v27);
      if (!v18)
      {
        v31 = CFCopyDescription(a3);
        v32 = scn_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v34 = 138412546;
          v35 = v12;
          v36 = 2112;
          v37 = v31;
          _os_log_impl(&dword_1DCCB8000, v32, OS_LOG_TYPE_DEFAULT, "Warning: Failed to create program for hashcode %@: %@", (uint8_t *)&v34, 0x16u);
        }
        CFRelease(v31);
        v18 = 0;
        goto LABEL_21;
      }
      C3DEntitySetName((uint64_t)v18, v12);
      v28 = objc_alloc_init(SCNCommonProfileProgramCache);
      v28->_program = (__C3DFXProgram *)CFRetain(v18);
      CFSetAddValue(v28->_owners, a5);
      CFDictionarySetValue(self->_shaders, v12, v28);

      CFRelease(v18);
      v17 = 1;
    }
    if (v17 && v18 != 0)
    {
      Mutable = (void *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a5);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        CFDictionarySetValue(self->_trackedResourcesToHashcode, a5, Mutable);
        CFRelease(Mutable);
      }
      CFArrayAppendValue((CFMutableArrayRef)Mutable, v12);
    }
LABEL_21:
    os_unfair_lock_unlock(p_programMutex);
    return v18;
  }
  v19 = scn_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[SCNCommonProfileProgramGenerator programWithHashCode:engineContext:trackedResource:introspectionDataPtr:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  return 0;
}

+ (id)generatorWithProfile:(int)a3 allowingHotReload:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  objc_sync_enter(a1);
  if (!s_registry[(int)v5])
  {
    if ((_DWORD)v5)
      s_registry[(int)v5] = (uint64_t)-[SCNCommonProfileProgramGeneratorGL initWithProfile:]([SCNCommonProfileProgramGeneratorGL alloc], "initWithProfile:", v5);
    else
      s_registry[0] = (uint64_t)-[SCNCommonProfileProgramGeneratorMetal initAllowingHotReload:]([SCNCommonProfileProgramGeneratorMetal alloc], "initAllowingHotReload:", v4);
  }
  objc_sync_exit(a1);
  return (id)s_registry[(int)v5];
}

- (SCNCommonProfileProgramGenerator)init
{
  SCNCommonProfileProgramGenerator *v2;
  SCNCommonProfileProgramGenerator *v3;
  const __CFAllocator *v4;
  const CFDictionaryValueCallBacks *v5;
  uint64_t SharedInstance;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNCommonProfileProgramGenerator;
  v2 = -[SCNCommonProfileProgramGenerator init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_programMutex._os_unfair_lock_opaque = 0;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v2->_shaders = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v3->_trackedResourcesToHashcode = CFDictionaryCreateMutable(v4, 0, 0, v5);
    SharedInstance = C3DNotificationCenterGetSharedInstance();
    C3DNotificationCenterAddObserver(SharedInstance, v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))__HandleProfileWillDieNotification, CFSTR("kC3DNotificationProfileWillDie"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t SharedInstance;
  __CFDictionary *shaders;
  __CFDictionary *trackedResourcesToHashcode;
  objc_super v6;

  SharedInstance = C3DNotificationCenterGetSharedInstance();
  C3DNotificationCenterRemoveObserver(SharedInstance, self, CFSTR("kC3DNotificationProfileWillDie"), 0);
  shaders = self->_shaders;
  if (shaders)
  {
    CFRelease(shaders);
    self->_shaders = 0;
  }
  trackedResourcesToHashcode = self->_trackedResourcesToHashcode;
  if (trackedResourcesToHashcode)
  {
    CFRelease(trackedResourcesToHashcode);
    self->_trackedResourcesToHashcode = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SCNCommonProfileProgramGenerator;
  -[SCNCommonProfileProgramGenerator dealloc](&v6, sel_dealloc);
}

- (int)profile
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = scn_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[SCNCommonProfileProgramGenerator profile].cold.1(v2, v3, v4);
  return -1;
}

- (void)emptyShaderCache
{
  CFDictionaryRemoveAllValues(self->_shaders);
  CFDictionaryRemoveAllValues(self->_trackedResourcesToHashcode);
}

- (void)releaseProgramForResource:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFArray *Value;
  const __CFArray *v14;
  CFIndex Count;
  CFIndex v16;
  CFIndex i;
  const void *ValueAtIndex;
  CFMutableSetRef *v19;
  CFMutableSetRef *v20;
  NSObject *v21;
  uint8_t v22;
  _BYTE v23[15];

  if (!a3)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SCNCommonProfileProgramGenerator releaseProgramForResource:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  os_unfair_lock_lock(&self->_programMutex);
  Value = (const __CFArray *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a3);
  if (Value)
  {
    v14 = Value;
    Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      v16 = Count;
      for (i = 0; i != v16; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
        v19 = (CFMutableSetRef *)CFDictionaryGetValue(self->_shaders, ValueAtIndex);
        if (v19)
        {
          v20 = v19;
          CFSetRemoveValue(v19[2], a3);
          if (!CFSetGetCount(v20[2]))
            CFDictionaryRemoveValue(self->_shaders, ValueAtIndex);
        }
        else if ((releaseProgramForResource__done & 1) == 0)
        {
          releaseProgramForResource__done = 1;
          v21 = scn_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[SCNCommonProfileProgramGenerator releaseProgramForResource:].cold.1(&v22, v23, v21);
        }
      }
    }
  }
  CFDictionaryRemoveValue(self->_trackedResourcesToHashcode, a3);
  os_unfair_lock_unlock(&self->_programMutex);
}

- (void)profile
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Unreachable code: Invalid CommonProfile generator", v3);
}

- (void)programWithHashCode:(uint64_t)a3 engineContext:(uint64_t)a4 trackedResource:(uint64_t)a5 introspectionDataPtr:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)releaseProgramForResource:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: C3DCommonProfileProgramReleaseHashCode can't find cache for tracked resource", a1);
}

- (void)releaseProgramForResource:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
