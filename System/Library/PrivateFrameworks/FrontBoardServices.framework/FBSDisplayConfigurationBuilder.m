@implementation FBSDisplayConfigurationBuilder

- (void)setPixelSize:(CGSize)a3 nativeBounds:(CGRect)a4 bounds:(CGRect)a5
{
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGRect v19;

  if (a3.width <= 0.0 || a3.width > 10000.0 || a3.height <= 0.0 || a3.height > 10000.0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    BSNSStringFromCGSize();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("invalid pixel size : %@"), v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setPixelSize:nativeBounds:bounds:].cold.1();
LABEL_18:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E3E38);
  }
  x = a4.origin.x;
  y = a4.origin.y;
  height = a4.size.height;
  width = a4.size.width;
  if (CGRectIsEmpty(a4)
    || (v19.origin.x = x, v19.origin.y = y, v19.size.width = width, v19.size.height = height, CGRectIsInfinite(v19)))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    BSNSStringFromCGRect();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("invalid nativeBounds : %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setPixelSize:nativeBounds:bounds:].cold.2();
    goto LABEL_18;
  }
  if (CGRectIsEmpty(a5) || CGRectIsInfinite(a5))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    BSNSStringFromCGRect();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("invalid bounds : %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setPixelSize:nativeBounds:bounds:].cold.3();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E3EB8);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_geometrySet = 1;
  self->_lock_pixelSize = a3;
  self->_lock_nativeBounds.origin.x = x;
  self->_lock_nativeBounds.origin.y = y;
  self->_lock_nativeBounds.size.width = width;
  self->_lock_nativeBounds.size.height = height;
  self->_lock_bounds = a5;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCurrentMode:(id)a3 preferredMode:(id)a4 otherModes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  FBSDisplayMode *v21;
  FBSDisplayMode *lock_currentMode;
  FBSDisplayMode *lock_preferredMode;
  FBSDisplayMode *v24;
  NSSet *v25;
  NSSet *lock_otherModes;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  NSClassFromString(CFSTR("FBSDisplayMode"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E44B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E451CLL);
  }

  v12 = v9;
  NSClassFromString(CFSTR("FBSDisplayMode"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.2();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E4580);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.2();
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E45E4);
  }

  v13 = v10;
  if (v13)
  {
    NSClassFromString(CFSTR("NSSet"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSSetClass]"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.6();
      objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6E4648);
    }
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v14);
        v19 = *(id *)(*((_QWORD *)&v45 + 1) + 8 * i);
        NSClassFromString(CFSTR("FBSDisplayMode"));
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.4();
          objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6E43F0);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayModeClass]"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.4();
          objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6E4454);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v16);
  }

  os_unfair_lock_lock(&self->_lock);
  v20 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v20, "removeObject:", v11);
  objc_msgSend(v20, "removeObject:", v12);
  v21 = (FBSDisplayMode *)objc_msgSend(v11, "copy");
  lock_currentMode = self->_lock_currentMode;
  self->_lock_currentMode = v21;

  if (BSEqualObjects())
  {
    lock_preferredMode = self->_lock_preferredMode;
    self->_lock_preferredMode = 0;
  }
  else
  {
    v24 = (FBSDisplayMode *)objc_msgSend(v12, "copy");
    lock_preferredMode = self->_lock_preferredMode;
    self->_lock_preferredMode = v24;
  }

  v25 = (NSSet *)objc_msgSend(v20, "copy");
  lock_otherModes = self->_lock_otherModes;
  self->_lock_otherModes = v25;

  if (v20)
  {
    objc_msgSend(v20, "addObject:", self->_lock_currentMode);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", self->_lock_currentMode);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_lock_preferredMode)
    objc_msgSend(v20, "addObject:");
  os_unfair_lock_unlock(&self->_lock);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v20;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v32, "pointScale");
        if ((unint64_t)(v32[1] - 1) >> 4 > 0x270
          || (unint64_t)(v32[2] - 1) >> 4 > 0x270
          || !BSFloatGreaterThanFloat()
          || !BSFloatLessThanOrEqualToFloat()
          || !BSFloatGreaterThanFloat()
          || !BSFloatLessThanOrEqualToFloat()
          || !FBSDisplayGamutIsValid(v32[6])
          || !FBSDisplayHDRModeIsValid(v32[7]))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mode is invalid : %@"), v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSDisplayConfigurationBuilder setCurrentMode:preferredMode:otherModes:].cold.3();
          objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6E438CLL);
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v29);
  }

}

- (FBSDisplayConfigurationBuilder)initWithConfiguration:(id)a3
{
  id v4;
  FBSDisplayConfigurationBuilder *v5;
  uint64_t v6;
  FBSDisplayConfiguration *configuration;
  void *v9;
  objc_super v10;

  v4 = a3;
  NSClassFromString(CFSTR("FBSDisplayConfiguration"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder initWithConfiguration:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E4758);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayConfigurationClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder initWithConfiguration:].cold.1();
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)FBSDisplayConfigurationBuilder;
  v5 = -[FBSDisplayConfigurationBuilder init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (FBSDisplayConfiguration *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (id)buildConfigurationWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v5;
  FBSDisplayIdentity *v6;
  int v7;
  NSString *lock_uniqueIdentifier;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  FBSDisplayMode *v13;
  FBSDisplayMode *v14;
  NSSet *v15;
  FBSDisplayMode *lock_currentMode;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id *v36;
  NSSet *v37;
  uint64_t v38;
  void *i;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  FBSDisplayConfiguration *configuration;
  CGSize *p_lock_pixelSize;
  CGFloat *p_height;
  CGRect *p_lock_nativeBounds;
  CGFloat *p_y;
  CGSize *p_size;
  CGFloat *v55;
  CGRect *p_lock_bounds;
  CGFloat *v57;
  CGSize *v58;
  CGFloat *v59;
  BOOL *p_cloningSupported;
  char v61;
  BOOL *p_lock_overscanned;
  int64_t *p_lock_overscanCompensation;
  CGSize *p_lock_safeOverscanRatio;
  CGFloat *v65;
  uint64_t v66;
  CGFloat width;
  uint64_t v68;
  CGFloat x;
  double v70;
  double v71;
  _BOOL4 v72;
  double v73;
  double v74;
  uint64_t v75;
  _BOOL4 v76;
  FBSDisplayConfiguration *v77;
  FBSDisplayConfiguration *v78;
  _BOOL8 v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  os_unfair_lock_s *v98;
  double v99;
  FBSDisplayMode *v100;
  double v101;
  BOOL v102;
  void *v103;
  void *v104;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[FBSDisplayConfiguration identity](self->_configuration, "identity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (*(_WORD *)&self->_lock_secure || self->_lock_uniqueIdentifier)
  {
    v6 = [FBSDisplayIdentity alloc];
    if (self->_lock_mainLike)
      v7 = 1;
    else
      v7 = *(unsigned __int8 *)(v5 + 52);
    lock_uniqueIdentifier = self->_lock_uniqueIdentifier;
    if (!lock_uniqueIdentifier)
      lock_uniqueIdentifier = *(NSString **)(v5 + 8);
    v9 = self->_lock_secure || *(_BYTE *)(v5 + 54) != 0;
    v10 = v7 != 0;
    v11 = *(_QWORD *)(v5 + 16);
    if (!v11)
      v11 = v5;
    LOBYTE(v92) = v9;
    LOBYTE(v91) = *(_BYTE *)(v5 + 53) != 0;
    v12 = -[FBSDisplayIdentity _initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:](v6, "_initWithType:UIKitMainLike:displayID:connectionType:connectionSeed:pid:external:uniqueIdentifier:secure:root:", *(_QWORD *)(v5 + 24), v10, *(unsigned int *)(v5 + 40), *(_QWORD *)(v5 + 32), *(unsigned int *)(v5 + 44), *(unsigned int *)(v5 + 48), v91, lock_uniqueIdentifier, v92, v11);

    v5 = v12;
  }
  v13 = self->_configuration->_currentMode;
  v14 = self->_configuration->_preferredMode;
  v15 = self->_configuration->_otherModes;
  lock_currentMode = self->_lock_currentMode;
  v17 = lock_currentMode != 0;
  if (!lock_currentMode)
  {
    v33 = 0;
    v18 = v13;
    goto LABEL_23;
  }
  -[FBSDisplayConfigurationBuilder _lock_sanitizedModeForMode:](self, "_lock_sanitizedModeForMode:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18
    || (__displayBuilderError(1, CFSTR("sanitizing currentMode failed : %@ : base=%@"), v19, v20, v21, v22, v23, v24, (uint64_t)self->_lock_currentMode), (v35 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v102 = v17;
    if (self->_lock_preferredMode)
    {
      -[FBSDisplayConfigurationBuilder _lock_sanitizedModeForMode:](self, "_lock_sanitizedModeForMode:");
      v25 = objc_claimAutoreleasedReturnValue();

      v14 = (FBSDisplayMode *)v25;
      if (!v25)
      {
        __displayBuilderError(2, CFSTR("sanitizing preferredMode failed : %@ : base=%@"), v26, v27, v28, v29, v30, v31, (uint64_t)self->_lock_preferredMode);
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (id)v32;
          v34 = v15;
          goto LABEL_40;
        }
      }
    }
    else
    {

      v14 = 0;
    }
    v103 = v18;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSSet count](v15, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v37 = self->_lock_otherModes;
    v33 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
    if (v33)
    {
      v98 = p_lock;
      v100 = v14;
      v38 = *(_QWORD *)v107;
      while (2)
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v107 != v38)
            objc_enumerationMutation(v37);
          v40 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
          -[FBSDisplayConfigurationBuilder _lock_sanitizedModeForMode:](self, "_lock_sanitizedModeForMode:", v40);
          v41 = objc_claimAutoreleasedReturnValue();
          if (!v41)
          {
            __displayBuilderError(3, CFSTR("sanitizing otherMode failed : %@ : base=%@"), v42, v43, v44, v45, v46, v47, v40);
            v33 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
          v48 = (void *)v41;
          objc_msgSend(v34, "addObject:", v41);

        }
        v33 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
        if (v33)
          continue;
        break;
      }
LABEL_38:
      p_lock = v98;
      v14 = v100;
    }

    v18 = v103;
LABEL_40:
    v17 = v102;
    if (v33)
      goto LABEL_24;
    goto LABEL_41;
  }
  v33 = (id)v35;
  v18 = 0;
LABEL_23:
  v34 = v15;
  if (v33)
  {
LABEL_24:
    os_unfair_lock_unlock(p_lock);
LABEL_25:
    if (*a3)
    {
      v33 = objc_retainAutorelease(v33);
      v36 = 0;
      *a3 = v33;
      goto LABEL_61;
    }
LABEL_60:
    v36 = 0;
    goto LABEL_61;
  }
LABEL_41:
  configuration = self->_configuration;
  if (self->_lock_geometrySet)
  {
    p_lock_pixelSize = &self->_lock_pixelSize;
    p_height = &self->_lock_pixelSize.height;
    p_lock_nativeBounds = &self->_lock_nativeBounds;
    p_y = &self->_lock_nativeBounds.origin.y;
    p_size = &self->_lock_nativeBounds.size;
    v55 = &self->_lock_nativeBounds.size.height;
    p_lock_bounds = &self->_lock_bounds;
    v57 = &self->_lock_bounds.origin.y;
    v58 = &self->_lock_bounds.size;
    v59 = &self->_lock_bounds.size.height;
    v17 = 1;
  }
  else
  {
    p_lock_bounds = &configuration->_bounds;
    v59 = &configuration->_bounds.size.height;
    v58 = &configuration->_bounds.size;
    v57 = &configuration->_bounds.origin.y;
    p_lock_nativeBounds = &configuration->_nativeBounds;
    v55 = &configuration->_nativeBounds.size.height;
    p_size = &configuration->_nativeBounds.size;
    p_y = &configuration->_nativeBounds.origin.y;
    p_lock_pixelSize = &configuration->_pixelSize;
    p_height = &configuration->_pixelSize.height;
  }
  p_cloningSupported = &configuration->_cloningSupported;
  v61 = self->_lock_cloningSet || v17;
  if (self->_lock_cloningSet)
    p_cloningSupported = &self->_lock_cloningSupported;
  if (self->_lock_overscanSet)
  {
    p_lock_overscanned = &self->_lock_overscanned;
    p_lock_overscanCompensation = &self->_lock_overscanCompensation;
    p_lock_safeOverscanRatio = &self->_lock_safeOverscanRatio;
    v65 = &self->_lock_safeOverscanRatio.height;
    v61 = 1;
  }
  else
  {
    p_lock_safeOverscanRatio = &configuration->_safeOverscanRatio;
    v65 = &configuration->_safeOverscanRatio.height;
    p_lock_overscanCompensation = &configuration->_overscanCompensation;
    p_lock_overscanned = &configuration->_overscanned;
  }
  v66 = *(_QWORD *)v59;
  width = v58->width;
  v68 = *(_QWORD *)v57;
  x = p_lock_bounds->origin.x;
  v99 = p_size->width;
  v101 = *v55;
  v96 = p_lock_nativeBounds->origin.x;
  v97 = *p_y;
  v70 = *p_height;
  v71 = p_lock_pixelSize->width;
  v72 = *p_cloningSupported;
  v73 = *v65;
  v74 = p_lock_safeOverscanRatio->width;
  v75 = *p_lock_overscanCompensation;
  v76 = *p_lock_overscanned;
  os_unfair_lock_unlock(p_lock);
  v77 = [FBSDisplayConfiguration alloc];
  v78 = self->_configuration;
  v79 = (v61 & 1) == 0 && v78->_noEqual_comparable;
  BYTE1(v93) = v76;
  LOBYTE(v93) = v72;
  v80 = -[FBSDisplayConfiguration _initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:](v77, "_initWithIdentity:hardwareIdentifier:name:deviceName:seed:comparable:tags:currentMode:preferredMode:otherModes:cloningSupported:overscanned:overscanCompensation:safeOverscanRatio:pixelSize:nativeBounds:bounds:latency:originatingConfiguration:validityCheck:", v5, v78->_hardwareIdentifier, v78->_name, v78->_deviceName, v78->_noEqual_seed, v79, v74, v73, v71, v70, v96, v97, v99, v101, v78->_tags,
          v18,
          v14,
          v34,
          v93,
          v75,
          *(_QWORD *)&x,
          v68,
          *(_QWORD *)&width,
          v66,
          *(_QWORD *)&v78->_latency,
          v78,
          2);
  if (!v80)
  {
    FBSDisplayOverscanCompensationDescription(v75);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    BSNSStringFromCGSize();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    BSNSStringFromCGSize();
    v104 = v18;
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    BSNSStringFromCGRect();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    BSNSStringFromCGRect();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    __displayBuilderError(4, CFSTR("constructing configuration failed : identity=%@ configChanged=%i currentMode=%@ preferredMode=%@ otherModes=%@ cloningSupported=%i overscanned=%i overscanCompensation=%@ safeOverscanRatio=%@ pixelSize=%@ nativeBounds=%@ bounds=%@ : base=%@"), v84, v85, v86, v87, v88, v89, v5);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    v18 = v104;
    if (!v33)
      goto LABEL_60;
    goto LABEL_25;
  }
  v36 = (id *)v80;
  if ((v61 & 1) == 0)
    objc_storeStrong((id *)(v80 + 176), self->_configuration->_immutableCADisplay);
  objc_storeStrong(v36 + 23, self->_configuration->_caDisplay);
  v33 = 0;
LABEL_61:

  return v36;
}

- (id)_lock_sanitizedModeForMode:(id)a3
{
  char *v4;
  char *v5;
  void *v6;
  int v7;
  int64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  BOOL v12;
  int *v13;
  uint64_t v14;
  int *v15;
  char *v16;
  id result;
  void *v18;
  uint64_t v19;

  v4 = (char *)a3;
  if (v4)
  {
    v5 = v4;
    -[FBSDisplayConfiguration availableModes](self->_configuration, "availableModes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7
      || (v8 = -[FBSDisplayConfiguration _nativeRotation](self->_configuration, "_nativeRotation"),
          v9 = *((_QWORD *)v5 + 8),
          v8 == v9)
      && v5[72])
    {
      v10 = v5;
    }
    else
    {
      v11 = ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 1) ^ ((v9 & 0xFFFFFFFFFFFFFFFDLL) != 1);
      v12 = v11 == 0;
      if (v11)
        v13 = &OBJC_IVAR___FBSDisplayMode__height;
      else
        v13 = &OBJC_IVAR___FBSDisplayMode__width;
      v14 = *(_QWORD *)&v5[*v13];
      if (v12)
        v15 = &OBJC_IVAR___FBSDisplayMode__height;
      else
        v15 = &OBJC_IVAR___FBSDisplayMode__width;
      LOBYTE(v19) = 1;
      v10 = -[FBSDisplayMode _initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:]([FBSDisplayMode alloc], "_initWithWidth:height:preferredScale:scaleOverride:refreshRate:gamut:hdr:rotation:virtual:validityCheck:", *(_QWORD *)&v5[*v15], v14, *((_QWORD *)v5 + 3), *((_QWORD *)v5 + 6), *((_QWORD *)v5 + 7), v8, *((double *)v5 + 4), *((double *)v5 + 5), v19, 2);
    }
    v16 = v10;

    return v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("mode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder _lock_sanitizedModeForMode:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_otherModes, 0);
  objc_storeStrong((id *)&self->_lock_preferredMode, 0);
  objc_storeStrong((id *)&self->_lock_currentMode, 0);
  objc_storeStrong((id *)&self->_lock_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (FBSDisplayConfigurationBuilder)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  FBSDisplayConfigurationBuilder *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  FBSDisplayConfigurationBuilder *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not allowed for %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("FBSDisplayConfigurationBuilder.m");
    v21 = 1024;
    v22 = 48;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (FBSDisplayConfigurationBuilder *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)setUniqueIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSString *v6;
  NSString *lock_uniqueIdentifier;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  lock_uniqueIdentifier = self->_lock_uniqueIdentifier;
  self->_lock_uniqueIdentifier = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setExpectsSecureRendering
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_secure = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)setUIKitMainLike
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_mainLike = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)setCloningNotSupported
{
  -[FBSDisplayConfigurationBuilder setCloningSupported:](self, "setCloningSupported:", 0);
}

- (void)setCloningSupported:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_cloningSet = 1;
  self->_lock_cloningSupported = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setOverscanned:(BOOL)a3 compensation:(int64_t)a4 safeRatio:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  height = a5.height;
  width = a5.width;
  if (!FBSDisplayOverscanCompensationIsValid(a4))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    FBSDisplayOverscanCompensationDescription(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("invalid compensation : %@"), v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setOverscanned:compensation:safeRatio:].cold.2();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A715BCCLL);
  }
  if (!BSFloatGreaterThanOrEqualToFloat()
    || !BSFloatLessThanOrEqualToFloat()
    || !BSFloatGreaterThanOrEqualToFloat()
    || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    BSNSStringFromCGSize();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("invalid safeRatio : %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayConfigurationBuilder setOverscanned:compensation:safeRatio:].cold.1();
    goto LABEL_12;
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_overscanSet = 1;
  self->_lock_overscanned = a3;
  self->_lock_overscanCompensation = a4;
  self->_lock_safeOverscanRatio.width = width;
  self->_lock_safeOverscanRatio.height = height;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)initWithConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_lock_sanitizedModeForMode:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setCurrentMode:preferredMode:otherModes:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setPixelSize:nativeBounds:bounds:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setPixelSize:nativeBounds:bounds:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setPixelSize:nativeBounds:bounds:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setOverscanned:compensation:safeRatio:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setOverscanned:compensation:safeRatio:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
