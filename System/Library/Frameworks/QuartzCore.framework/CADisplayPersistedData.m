@implementation CADisplayPersistedData

- (CADisplayPersistedData)init
{
  CADisplayPersistedData *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)CADisplayPersistedData;
  v2 = -[CADisplayPersistedData init](&v4, sel_init);
  if (v2)
  {
    if (framework_version(void)::once != -1)
      dispatch_once(&framework_version(void)::once, &__block_literal_global_110_18705);
    v2->_version = (NSString *)objc_msgSend((id)framework_version(void)::version, "copy");
    v2->_latencies = (NSMutableArray *)objc_opt_new();
    v2->_preferredModes = (NSMutableArray *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayPersistedData;
  -[CADisplayPersistedData dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p; "), NSStringFromClass(v4), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("version: %@, latencies: %@, preferredModes:%@"), self->_version, self->_latencies, self->_preferredModes);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)setLatency:(double)a3 forUUID:(id)a4 andMode:(Mode)a5
{
  __CFDictionary *v8;
  CADisplayPersistedLatency *v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v13[0] = a5.var0.var1;
  v8 = CA::WindowServer::Display::Mode::create_dictionary_representation((CA::WindowServer::Display::Mode *)v13);
  v9 = objc_alloc_init(CADisplayPersistedLatency);
  -[CADisplayPersistedLatency setUuid:](v9, "setUuid:", a4);
  -[CADisplayPersistedLatency setMode:](v9, "setMode:", v8);
  -[CADisplayPersistedLatency setLatency:](v9, "setLatency:", a3);
  if (!-[NSMutableArray count](self->_latencies, "count"))
    goto LABEL_6;
  v10 = 0;
  v11 = 0;
  while (1)
  {
    v12 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_latencies, "objectAtIndexedSubscript:", v10);
    if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v12, "uuid")))
    {
      if ((-[__CFDictionary isEqual:](v8, "isEqual:", objc_msgSend(v12, "mode")) & 1) != 0)
        break;
    }
    v10 = ++v11;
    if (-[NSMutableArray count](self->_latencies, "count") <= (unint64_t)v11)
      goto LABEL_6;
  }
  if ((v11 & 0x80000000) != 0)
  {
LABEL_6:
    if ((unint64_t)-[NSMutableArray count](self->_latencies, "count") >= 0x10)
      -[NSMutableArray removeObjectAtIndex:](self->_latencies, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_latencies, "addObject:", v9);
  }
  else
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_latencies, "replaceObjectAtIndex:withObject:", v11, v9);
  }
  -[CADisplayPersistedData save](self, "save");
}

- (double)latencyForUUID:(id)a3 andMode:(Mode)a4
{
  __CFDictionary *v6;
  NSMutableArray *latencies;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  unint64_t var1;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  var1 = a4.var0.var1;
  v6 = CA::WindowServer::Display::Mode::create_dictionary_representation((CA::WindowServer::Display::Mode *)&var1);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  latencies = self->_latencies;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latencies, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  v9 = 0.0;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(latencies);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v13, "uuid"))
          && (-[__CFDictionary isEqual:](v6, "isEqual:", objc_msgSend(v13, "mode")) & 1) != 0)
        {
          objc_msgSend(v13, "latency");
          return v14;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latencies, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v10)
        continue;
      break;
    }
  }
  return v9;
}

- (void)setPreferredMode:(Mode)a3 forUUID:(id)a4
{
  void *v4;
  CADisplayPersistedPreferredMode *v6;
  uint64_t v7;
  unsigned int v8;
  _QWORD v9[2];

  v4 = (void *)*(&a3.var0.var1 + 1);
  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = a3.var0.var1;
  v6 = objc_alloc_init(CADisplayPersistedPreferredMode);
  -[CADisplayPersistedPreferredMode setUuid:](v6, "setUuid:", v4, v9[0]);
  -[CADisplayPersistedPreferredMode setMode:](v6, "setMode:", CA::WindowServer::Display::Mode::create_dictionary_representation((CA::WindowServer::Display::Mode *)v9));
  if (!-[NSMutableArray count](self->_preferredModes, "count"))
    goto LABEL_8;
  v7 = 0;
  v8 = 0;
  while ((objc_msgSend(v4, "isEqualToString:", objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_preferredModes, "objectAtIndexedSubscript:", v7), "uuid")) & 1) == 0)
  {
    v7 = ++v8;
    if (-[NSMutableArray count](self->_preferredModes, "count") <= (unint64_t)v8)
      goto LABEL_8;
  }
  if ((v8 & 0x80000000) != 0)
  {
LABEL_8:
    if ((unint64_t)-[NSMutableArray count](self->_preferredModes, "count") >= 0x10)
      -[NSMutableArray removeObjectAtIndex:](self->_preferredModes, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_preferredModes, "addObject:", v6);
  }
  else
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_preferredModes, "replaceObjectAtIndex:withObject:", v8, v6);
  }
  -[CADisplayPersistedData save](self, "save");
}

- (Mode)preferredModeForUUID:(id)a3
{
  NSMutableArray *preferredModes;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  Mode result;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  preferredModes = self->_preferredModes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](preferredModes, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(preferredModes);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "uuid")) & 1) != 0)
        {
          v11 = 0;
          CA::WindowServer::Display::Mode::Mode((CA::WindowServer::Display::Mode *)&v11, (CFDictionaryRef)objc_msgSend(v10, "mode"));
          v5 = v11;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](preferredModes, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      v7 = v5;
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:
  *(&result.var0.var1 + 1) = v6;
  result.var0.var1 = v5;
  return result;
}

- (void)update
{
  uint64_t v3;
  NSMutableArray *latencies;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *preferredModes;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CADisplayPersistedData setLatencies:](self, "setLatencies:", -[NSMutableArray mutableCopy](self->_latencies, "mutableCopy"));
  -[CADisplayPersistedData setPreferredModes:](self, "setPreferredModes:", -[NSMutableArray mutableCopy](self->_preferredModes, "mutableCopy"));
  if (framework_version(void)::once != -1)
    dispatch_once(&framework_version(void)::once, &__block_literal_global_110_18705);
  v3 = framework_version(void)::version;
  if (!-[NSString isEqualToString:](self->_version, "isEqualToString:", framework_version(void)::version))
  {
    -[CADisplayPersistedData setVersion:](self, "setVersion:", v3);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    latencies = self->_latencies;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latencies, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(latencies);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setMode:", reload_mode((CFDictionaryRef)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "mode")));
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latencies, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      }
      while (v6);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    preferredModes = self->_preferredModes;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](preferredModes, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(preferredModes);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "setMode:", reload_mode((CFDictionaryRef)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "mode")));
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](preferredModes, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v11);
    }
    -[CADisplayPersistedData save](self, "save");
  }
}

- (void)save
{
  const void *v2;
  const __CFString *v3;

  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  if (v2)
  {
    v3 = (const __CFString *)*MEMORY[0x1E0C9B248];
    CFPreferencesSetAppValue(CFSTR("CADisplayPersistence"), v2, (CFStringRef)*MEMORY[0x1E0C9B248]);
    CFPreferencesAppSynchronize(v3);
  }
}

- (CADisplayPersistedData)initWithCoder:(id)a3
{
  CADisplayPersistedData *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CADisplayPersistedData;
  v4 = -[CADisplayPersistedData init](&v8, sel_init);
  if (v4)
  {
    v4->_version = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v5 = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[CADisplayPersistedData supportedClasses](CADisplayPersistedData, "supportedClasses"), CFSTR("latencies"));
    v4->_latencies = v5;
    if (!v5)
      v4->_latencies = (NSMutableArray *)objc_opt_new();
    v6 = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[CADisplayPersistedData supportedClasses](CADisplayPersistedData, "supportedClasses"), CFSTR("preferredModes"));
    v4->_preferredModes = v6;
    if (!v6)
      v4->_preferredModes = (NSMutableArray *)objc_opt_new();
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  NSMutableArray *latencies;
  NSMutableArray *preferredModes;

  v5 = (void *)MEMORY[0x186DBE2E4](self, a2);
  if (self->_version)
  {
    objc_msgSend(a3, "encodeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasVersion"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_version, CFSTR("version"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("hasVersion"));
  }
  latencies = self->_latencies;
  if (latencies && -[NSMutableArray count](latencies, "count"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasLatencies"));
    objc_msgSend(a3, "encodeObject:forKey:", (id)-[NSMutableArray copy](self->_latencies, "copy"), CFSTR("latencies"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("hasLatencies"));
  }
  preferredModes = self->_preferredModes;
  if (preferredModes && -[NSMutableArray count](preferredModes, "count"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasPreferredModes"));
    objc_msgSend(a3, "encodeObject:forKey:", (id)-[NSMutableArray copy](self->_preferredModes, "copy"), CFSTR("preferredModes"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("hasPreferredModes"));
  }
  objc_autoreleasePoolPop(v5);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)latencies
{
  return self->_latencies;
}

- (void)setLatencies:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)preferredModes
{
  return self->_preferredModes;
}

- (void)setPreferredModes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

+ (id)supportedClasses
{
  if (+[CADisplayPersistedData supportedClasses]::once != -1)
    dispatch_once(&+[CADisplayPersistedData supportedClasses]::once, &__block_literal_global_18719);
  return (id)+[CADisplayPersistedData supportedClasses]::set;
}

+ (id)sharedInstance
{
  if (+[CADisplayPersistedData sharedInstance]::once != -1)
    dispatch_once(&+[CADisplayPersistedData sharedInstance]::once, &__block_literal_global_6_18715);
  return (id)+[CADisplayPersistedData sharedInstance]::data;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __40__CADisplayPersistedData_sharedInstance__block_invoke()
{
  const __CFString *v0;
  CFPropertyListRef v1;
  const void *v2;
  CFTypeID v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (const __CFString *)*MEMORY[0x1E0C9B248];
  v1 = CFPreferencesCopyAppValue(CFSTR("CADisplayPersistence"), (CFStringRef)*MEMORY[0x1E0C9B248]);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFDataGetTypeID())
    {
      v5[0] = 0;
      +[CADisplayPersistedData sharedInstance]::data = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, v5);
      v4 = (id)+[CADisplayPersistedData sharedInstance]::data;
      if (v5[0])
      {
        NSLog(CFSTR("%@"), v5[0]);
        CFPreferencesSetAppValue(CFSTR("CADisplayPersistence"), 0, v0);
        CFPreferencesAppSynchronize(v0);
      }
      else
      {
        objc_msgSend((id)+[CADisplayPersistedData sharedInstance]::data, "update");
      }
    }
    CFRelease(v2);
  }
  if (!+[CADisplayPersistedData sharedInstance]::data)
    +[CADisplayPersistedData sharedInstance]::data = objc_alloc_init(CADisplayPersistedData);
}

id __42__CADisplayPersistedData_supportedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  +[CADisplayPersistedData supportedClasses]::set = (uint64_t)result;
  return result;
}

@end
