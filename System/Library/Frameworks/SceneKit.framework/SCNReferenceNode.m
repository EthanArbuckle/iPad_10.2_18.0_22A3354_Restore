@implementation SCNReferenceNode

- (SCNReferenceNode)initWithURL:(NSURL *)referenceURL
{
  SCNReferenceNode *v4;
  SCNReferenceNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNReferenceNode;
  v4 = -[SCNNode init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SCNReferenceNode setReferenceURL:](v4, "setReferenceURL:", referenceURL);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNReferenceNode;
  -[SCNNode dealloc](&v3, sel_dealloc);
}

+ (SCNReferenceNode)referenceNodeWithURL:(NSURL *)referenceURL
{
  return (SCNReferenceNode *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:", referenceURL);
}

- (void)_diffObject:(id)a3 with:(id)a4 path:(id)a5
{
  objc_class *v5;
  objc_property_t *v6;
  void *v7;
  unint64_t i;
  objc_property *v9;
  const char *Attributes;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unsigned int outCount;
  _BYTE v28[128];
  uint64_t v29;

  v19 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  if (_diffObject_with_path__onceToken != -1)
    dispatch_once(&_diffObject_with_path__onceToken, &__block_literal_global_38);
  v5 = (objc_class *)objc_opt_class();
  outCount = 0;
  v6 = class_copyPropertyList(v5, &outCount);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v9 = v6[i];
      Attributes = property_getAttributes(v9);
      if (strcmp((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Attributes), "componentsSeparatedByString:", CFSTR(",")), "objectAtIndex:", 0), "substringFromIndex:", 1), "UTF8String"), "{CATransform3D=dddddddddddddddd}"))
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Attributes), "rangeOfString:", CFSTR(",R,"));
        if (v11 != 3)
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v9)));
      }
    }
  }
  free(v6);
  -[SCNReferenceNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overrides"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        if ((objc_msgSend((id)_diffObject_with_path__skippedProperies, "containsObject:", v15, v19) & 1) == 0
          && (objc_msgSend(v15, "hasPrefix:", CFSTR("_")) & 1) == 0
          && (objc_msgSend(v15, "hasPrefix:", CFSTR("ide_")) & 1) == 0
          && (objc_msgSend(v15, "hasPrefix:", CFSTR("ske_")) & 1) == 0
          && (objc_msgSend(v15, "hasPrefix:", CFSTR("simd")) & 1) == 0)
        {
          v16 = (void *)objc_msgSend(a3, "valueForKey:", v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v17 = (void *)objc_msgSend(a4, "valueForKey:", v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = (void *)objc_msgSend(v16, "lastPathComponent");
              v17 = (void *)objc_msgSend(v17, "lastPathComponent");
            }
            else
            {
              v18 = v16;
            }
            if ((objc_msgSend(v18, "isEqual:", v17) & 1) == 0)
              -[NSMutableDictionary setValue:forKey:](self->_overrides, "setValue:forKey:", v16, objc_msgSend((id)objc_msgSend(v19, "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", v15));
          }
        }
      }
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v12);
  }
  -[SCNReferenceNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overrides"), v19);
}

id __42__SCNReferenceNode__diffObject_with_path___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA5FF690);
  _diffObject_with_path__skippedProperies = (uint64_t)result;
  return result;
}

- (BOOL)_isNameUnique:(id)a3
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SCNReferenceNode__isNameUnique___block_invoke;
  v5[3] = &unk_1EA5A0108;
  v5[4] = a3;
  v5[5] = &v6;
  -[SCNNode enumerateHierarchyUsingBlock:](self, "enumerateHierarchyUsingBlock:", v5);
  v3 = *((_DWORD *)v7 + 6) == 1;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SCNReferenceNode__isNameUnique___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    if (++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 2)
      *a3 = 1;
  }
  return result;
}

- (void)_diffNode:(id)a3 with:(id)a4 path:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t j;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint8_t buf;
  _BYTE v31[15];

  if (objc_msgSend(a3, "name")
    && (objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", CFSTR(".")) & 1) == 0
    && -[SCNReferenceNode _isNameUnique:](self, "_isNameUnique:", objc_msgSend(a3, "name")))
  {
    a5 = (id)objc_msgSend(CFSTR("/"), "stringByAppendingString:", objc_msgSend(a3, "name"));
  }
  v24 = a4;
  -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", a3, a4, a5);
  v23 = a3;
  if (objc_msgSend(a3, "geometry") && objc_msgSend(a4, "geometry"))
  {
    -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", objc_msgSend(a3, "geometry"), objc_msgSend(a4, "geometry"), objc_msgSend((id)objc_msgSend(a5, "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", CFSTR("geometry")));
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "materials"), "count");
    if (v9 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "geometry"), "materials"), "count"))
    {
      v28 = (void *)objc_msgSend((id)objc_msgSend(a3, "geometry"), "materials");
      v27 = (void *)objc_msgSend((id)objc_msgSend(v24, "geometry"), "materials");
      if (v9)
      {
        v10 = 0;
        v25 = v9;
        v26 = a5;
        do
        {
          v11 = (void *)objc_msgSend(v28, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_msgSend(v27, "objectAtIndexedSubscript:", v10);
          v29 = v10;
          v13 = (void *)objc_msgSend((id)objc_msgSend(a5, "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("geometry.materials[%d]"), v10));
          -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", v11, v12, v13);
          v14 = (void *)objc_msgSend(v11, "properties");
          v15 = (void *)objc_msgSend(v12, "properties");
          v16 = objc_msgSend(v14, "count");
          if (objc_msgSend(v15, "count") == v16)
          {
            if (v16)
            {
              for (i = 0; i != v16; ++i)
                -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", objc_msgSend(v14, "objectAtIndexedSubscript:", i), objc_msgSend(v15, "objectAtIndexedSubscript:", i), objc_msgSend((id)objc_msgSend(v13, "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", i), "slotName")));
            }
          }
          else
          {
            v18 = scn_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[SCNReferenceNode _diffNode:with:path:].cold.2(&buf, v31, v18);
          }
          ++v10;
          a5 = v26;
        }
        while (v29 + 1 != v25);
      }
    }
    else
    {
      v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SCNReferenceNode _diffNode:with:path:].cold.3();
    }
  }
  if (objc_msgSend((id)objc_msgSend(v23, "particleSystems"), "count")
    && objc_msgSend((id)objc_msgSend(v24, "particleSystems"), "count"))
  {
    -[SCNReferenceNode _diffObject:with:path:](self, "_diffObject:with:path:", objc_msgSend((id)objc_msgSend(v23, "particleSystems"), "objectAtIndexedSubscript:", 0), objc_msgSend((id)objc_msgSend(v24, "particleSystems"), "objectAtIndexedSubscript:", 0), objc_msgSend((id)objc_msgSend(a5, "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", CFSTR("particleSystems[0]")));
  }
  v20 = objc_msgSend((id)objc_msgSend(v23, "childNodes"), "count");
  if (v20 == objc_msgSend((id)objc_msgSend(v24, "childNodes"), "count"))
  {
    if (v20)
    {
      for (j = 0; j != v20; ++j)
      {
        a5 = (id)objc_msgSend((id)objc_msgSend(a5, "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%d]"), j));
        -[SCNReferenceNode _diffNode:with:path:](self, "_diffNode:with:path:", objc_msgSend((id)objc_msgSend(v23, "childNodes"), "objectAtIndexedSubscript:", j), objc_msgSend((id)objc_msgSend(v24, "childNodes"), "objectAtIndexedSubscript:", j), a5);
      }
    }
  }
  else
  {
    v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SCNReferenceNode _diffNode:with:path:].cold.1();
  }
}

- (void)collectOverrides
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: inconsistency - hierarchy changed - can't diff reference node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addOverride:(id)a3 forKeyPath:(id)a4
{
  NSMutableDictionary *overrides;

  -[SCNReferenceNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overrides"));
  overrides = self->_overrides;
  if (!overrides)
  {
    overrides = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_overrides = overrides;
  }
  -[NSMutableDictionary setObject:forKey:](overrides, "setObject:forKey:", a3, a4);
  -[SCNReferenceNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overrides"));
}

- (void)removeForKeyPath:(id)a3
{
  -[SCNReferenceNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overrides"));
  -[NSMutableDictionary removeObjectForKey:](self->_overrides, "removeObjectForKey:", a3);
  if (!-[NSMutableDictionary count](self->_overrides, "count"))
  {

    self->_overrides = 0;
  }
  -[SCNReferenceNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overrides"));
}

- (void)removeAllOverrides
{
  -[SCNReferenceNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overrides"));
  -[NSMutableDictionary removeAllObjects](self->_overrides, "removeAllObjects");

  self->_overrides = 0;
  -[SCNReferenceNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overrides"));
}

- (id)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
  -[SCNReferenceNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overrides"));

  self->_overrides = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  -[SCNReferenceNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overrides"));
}

- (void)_applyOverride:(id)a3 forKeyPath:(id)a4
{
  -[SCNNode setValue:forKeyPath:](self, "setValue:forKeyPath:", a3, a4);
}

- (void)_applyUnsharing:(id)a3 alreadyShared:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "containsObject:") & 1) != 0)
    return;
  objc_msgSend(a4, "addObject:", a3);
  v7 = objc_msgSend(a3, "rangeOfString:options:", CFSTR("."), 4);
  if (v8 != 1)
    return;
  v9 = v7;
  v10 = v7 + 1;
  if (v7 + 1 >= (unint64_t)objc_msgSend(a3, "length"))
    return;
  v11 = objc_msgSend(a3, "substringToIndex:", v9);
  v12 = (void *)objc_msgSend(a3, "substringFromIndex:", v10);
  v13 = -[SCNNode valueForKeyPath:](self, "valueForKeyPath:", v11);
  if (!v13)
    return;
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("geometry")))
    {
      v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "geometry"), "copy");
      objc_msgSend(v14, "setGeometry:", v15);
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("particleSystems[0]")))
        goto LABEL_12;
      v16 = (void *)objc_msgSend((id)objc_msgSend(v14, "particleSystems"), "firstObject");
      if (!v16)
        goto LABEL_12;
      v17 = v16;
      v15 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v14, "removeParticleSystem:", v17);
      objc_msgSend(v14, "addParticleSystem:", v15);
    }

  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return;
  if ((objc_msgSend(a4, "containsObject:", v11) & 1) == 0)
  {
    -[SCNReferenceNode _applyUnsharing:alreadyShared:](self, "_applyUnsharing:alreadyShared:", v11, a4);
    v14 = -[SCNNode valueForKeyPath:](self, "valueForKeyPath:", v11);
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("firstMaterial")) & 1) != 0)
  {
    v18 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("materials")))
  {
    objc_msgSend(v14, "setMaterials:", (id)objc_msgSend((id)objc_msgSend(v14, "materials"), "copy"));
    return;
  }
  v20 = objc_msgSend(v12, "rangeOfString:", CFSTR("["));
  if (v21 == 1)
  {
    v22 = (void *)objc_msgSend(v12, "substringFromIndex:", v20 + 1);
    v23 = objc_msgSend(v22, "rangeOfString:", CFSTR("]"));
    if (v24 == 1)
    {
      v18 = objc_msgSend((id)objc_msgSend(v22, "substringToIndex:", v23), "integerValue");
LABEL_17:
      if (v18 >= objc_msgSend((id)objc_msgSend(v14, "materials"), "count"))
      {
        v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v29 = a3;
          v30 = 1024;
          v31 = v18;
          v32 = 1024;
          v33 = objc_msgSend((id)objc_msgSend(v14, "materials"), "count");
          _os_log_error_impl(&dword_1DCCB8000, v19, OS_LOG_TYPE_ERROR, "Error: failed to evaluate key path %@ - material index %d out of bounds (%d)", buf, 0x18u);
        }
      }
      else
      {
        v27 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "materials"), "objectAtIndexedSubscript:", v18), "copy");
        objc_msgSend(v14, "replaceMaterialAtIndex:withMaterial:", v18);

      }
      return;
    }
    v26 = scn_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SCNReferenceNode _applyUnsharing:alreadyShared:].cold.1();
  }
  else
  {
    v25 = scn_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SCNReferenceNode _applyUnsharing:alreadyShared:].cold.2();
  }
}

- (void)_applyOverrides
{
  NSMutableDictionary *overrides;
  uint64_t v4;
  NSMutableDictionary *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  overrides = self->_overrides;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SCNReferenceNode__applyOverrides__block_invoke;
  v8[3] = &unk_1EA5A0130;
  v8[4] = self;
  v8[5] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](overrides, "enumerateKeysAndObjectsUsingBlock:", v8);
  v5 = self->_overrides;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __35__SCNReferenceNode__applyOverrides__block_invoke_2;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __35__SCNReferenceNode__applyOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyUnsharing:alreadyShared:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __35__SCNReferenceNode__applyOverrides__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyOverride:forKeyPath:", a3, a2);
}

- (void)setOverride:(id)a3 forKeyPath:(id)a4
{
  -[SCNReferenceNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overrides"));
  if (!self->_overrides)
    self->_overrides = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SCNReferenceNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overrides"));
  -[SCNReferenceNode _applyOverride:forKeyPath:](self, "_applyOverride:forKeyPath:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNReferenceNode;
  v4 = -[SCNNode copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setReferenceURL:", self->_referenceURL);
  objc_msgSend(v4, "setLoadingPolicy:", self->_loadingPolicy);
  v4[37] = -[NSURL copy](self->_catalogURL, "copy");
  v4[35] = -[NSMutableDictionary mutableCopy](self->_overrides, "mutableCopy");
  return v4;
}

- (BOOL)_isAReference
{
  return 1;
}

- (NSURL)referenceURL
{
  return self->_referenceURL;
}

- (void)setReferenceURL:(NSURL *)referenceURL
{
  NSURL *v3;

  v3 = self->_referenceURL;
  if (v3 != referenceURL)
  {

    self->_referenceURL = (NSURL *)-[NSURL copy](referenceURL, "copy");
  }
}

- (id)_catalog
{
  id result;

  if (!self->_catalogURL
    || (result = +[SCNAssetCatalog assetCatalogWithURL:](SCNAssetCatalog, "assetCatalogWithURL:")) == 0)
  {
    result = (id)SCNGetResourceBundle();
    if (result)
      return +[SCNAssetCatalog assetCatalogWithURL:](SCNAssetCatalog, "assetCatalogWithURL:", objc_msgSend(result, "bundleURL"));
  }
  return result;
}

- (id)_resolveURL
{
  NSURL *referenceURL;
  NSString *v4;
  NSURL *v5;
  NSURL *sourceDocumentURL;
  NSURL *catalogURL;

  referenceURL = self->_referenceURL;
  if (!referenceURL)
    return 0;
  if (-[NSURL scheme](self->_referenceURL, "scheme") && !-[NSURL isFileURL](referenceURL, "isFileURL"))
    return referenceURL;
  v4 = -[NSURL relativePath](referenceURL, "relativePath");
  if (-[NSString isAbsolutePath](v4, "isAbsolutePath"))
    return referenceURL;
  sourceDocumentURL = self->_sourceDocumentURL;
  if (sourceDocumentURL)
  {
    v5 = -[NSURL URLByAppendingPathComponent:](-[NSURL URLByDeletingLastPathComponent](sourceDocumentURL, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", v4);
    if (C3DFileMayExistAtURL((const __CFURL *)v5))
      return v5;
  }
  catalogURL = self->_catalogURL;
  v5 = referenceURL;
  if (!catalogURL)
    return v5;
  return -[NSURL URLByAppendingPathComponent:](catalogURL, "URLByAppendingPathComponent:", v4);
}

- (void)unload
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v3 = -[SCNNode childNodes](self, "childNodes", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromParentNode");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  self->_loaded = 0;
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)load
{
  -[SCNReferenceNode _loadWithCatalog:](self, "_loadWithCatalog:", 0);
}

- (id)_loadReferencedSceneWithURL:(id)a3 catalog:(id)a4
{
  NSObject *v6;

  if (a3)
  {
    if (a4)
      return (id)objc_msgSend(a4, "sceneWithURL:", a3);
    a4 = -[SCNReferenceNode _catalog](self, "_catalog");
    if (a4)
      return (id)objc_msgSend(a4, "sceneWithURL:", a3);
    else
      return +[SCNScene sceneWithURL:options:error:](SCNScene, "sceneWithURL:options:error:", a3, 0, 0);
  }
  else
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNReferenceNode _loadReferencedSceneWithURL:catalog:].cold.1();
    return 0;
  }
}

- (void)_loadWithCatalog:(id)a3
{
  if (!self->_loaded)
    -[SCNReferenceNode _loadWithURL:catalog:](self, "_loadWithURL:catalog:", -[SCNReferenceNode _resolveURL](self, "_resolveURL"), a3);
}

- (void)_loadWithURL:(id)a3
{
  -[SCNReferenceNode _loadWithURL:catalog:](self, "_loadWithURL:catalog:", a3, 0);
}

- (void)_loadWithURL:(id)a3 catalog:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  SCNReferenceNode *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = +[SCNTransaction valueForKey:](SCNTransaction, "valueForKey:", CFSTR("SCNReferenceLoadingStack"));
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      +[SCNTransaction setValue:forKey:](SCNTransaction, "setValue:forKey:", v7, CFSTR("SCNReferenceLoadingStack"));

    }
    if (objc_msgSend(v7, "containsObject:", a3))
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SCNReferenceNode _loadWithURL:catalog:].cold.2();
    }
    else
    {
      objc_msgSend(v7, "addObject:", a3);
      v10 = -[SCNReferenceNode _loadReferencedSceneWithURL:catalog:](self, "_loadReferencedSceneWithURL:catalog:", a3, a4);
      objc_msgSend(v7, "removeObject:", a3);
      if (v10)
      {
        self->_loaded = 1;
        v11 = self;
        if (C3DWasLinkedBeforeMajorOSYear2017())
        {
          v11 = +[SCNNode node](SCNNode, "node");
          -[SCNNode setName:](v11, "setName:", CFSTR("referenceRoot"));
        }
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "rootNode"), "clone"), "childNodes", 0);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
              -[SCNNode addChildNode:](v11, "addChildNode:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v14);
        }
        -[SCNNode _copyAnimationsFrom:](v11, "_copyAnimationsFrom:", objc_msgSend(v10, "rootNode"));
        if (v11 != self)
          -[SCNNode addChildNode:](self, "addChildNode:", v11);
        -[SCNReferenceNode _applyOverrides](self, "_applyOverrides");
      }
    }
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNReferenceNode _loadReferencedSceneWithURL:catalog:].cold.1();
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p url=%@>"), NSStringFromClass(v4), self, self->_referenceURL);
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *referenceURL;
  NSMutableDictionary *overrides;
  objc_super v7;

  referenceURL = self->_referenceURL;
  if (referenceURL)
    objc_msgSend(a3, "encodeObject:forKey:", referenceURL, CFSTR("referenceURL"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_loadingPolicy, CFSTR("loadingPolicy"));
  overrides = self->_overrides;
  if (overrides)
    objc_msgSend(a3, "encodeObject:forKey:", overrides, CFSTR("overrides"));
  v7.receiver = self;
  v7.super_class = (Class)SCNReferenceNode;
  -[SCNNode encodeWithCoder:](&v7, sel_encodeWithCoder_, a3);
}

- (SCNReferenceNode)initWithCoder:(NSCoder *)aDecoder
{
  SCNReferenceNode *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SCNReferenceNode;
  v4 = -[SCNNode initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    -[SCNReferenceNode setReferenceURL:](v4, "setReferenceURL:", -[NSCoder decodeObjectOfClasses:forKey:](aDecoder, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2)), CFSTR("referenceURL")));
    -[SCNReferenceNode setLoadingPolicy:](v4, "setLoadingPolicy:", -[NSCoder decodeIntegerForKey:](aDecoder, "decodeIntegerForKey:", CFSTR("loadingPolicy")));
    v4->_overrides = (NSMutableDictionary *)objc_msgSend(-[NSCoder decodeObjectOfClasses:forKey:](aDecoder, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("overrides")), "mutableCopy");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)-[NSCoder assetCatalog](aDecoder, "assetCatalog");
      v4->_catalogURL = (NSURL *)(id)objc_msgSend(v6, "catalogURL");
      v4->_sourceDocumentURL = (NSURL *)(id)-[NSCoder documentURL](aDecoder, "documentURL");
    }
    else
    {
      v6 = 0;
    }
    if (!-[NSCoder containsValueForKey:](aDecoder, "containsValueForKey:", CFSTR("childNodes")) && !v4->_loadingPolicy)
      -[SCNReferenceNode _loadWithCatalog:](v4, "_loadWithCatalog:", v6);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNReferenceLoadingPolicy)loadingPolicy
{
  return self->_loadingPolicy;
}

- (void)setLoadingPolicy:(SCNReferenceLoadingPolicy)loadingPolicy
{
  self->_loadingPolicy = loadingPolicy;
}

- (void)_diffNode:with:path:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: inconsistency - hierarchy doesn't match - can't diff reference node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_diffNode:(uint8_t *)buf with:(_BYTE *)a2 path:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: inconsistency - material has custom properties - can't diff reference node", buf, 2u);
}

- (void)_diffNode:with:path:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: inconsistency - material count doesn't match - can't diff reference node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_applyUnsharing:alreadyShared:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to parse key path %@ - missing ']'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_applyUnsharing:alreadyShared:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to parse key path %@ - missing '['", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadReferencedSceneWithURL:catalog:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to locate scene reference %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadWithURL:catalog:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: failed to resolve referenced scene (%@) cycle detected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
