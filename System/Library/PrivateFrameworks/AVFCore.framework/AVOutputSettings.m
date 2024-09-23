@implementation AVOutputSettings

- (NSDictionary)outputSettingsDictionary
{
  return self->_outputSettingsDictionary;
}

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __CFString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v23 = a1;
    v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v24, v25, v26, v27, v28, (uint64_t)"outputSettingsDictionary != nil"), 0);
    objc_exception_throw(v29);
  }
  v34 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = (void *)objc_msgSend(a1, "registeredOutputSettingsClasses");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v31;
    v14 = CFSTR("Output settings dictionary does not contain any recognized keys");
LABEL_4:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
      v17 = objc_msgSend(v16, "_validateOutputSettingsDictionary:compatibilityDescription:", a3, &v34);
      if ((v17 & 1) == 0)
        goto LABEL_14;
      if ((v12 & 1) == 0)
        v14 = v34;
      if ((v17 & 2) == 0)
      {
        v18 = (void *)objc_msgSend(v16, "_outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:", a3, a4, &v34);
        if (!v18)
        {
          v12 = 1;
          v14 = v34;
          goto LABEL_14;
        }
        v19 = v18;
        if (objc_msgSend((id)objc_msgSend(v18, "compatibleMediaTypes"), "containsObject:", a4))
        {
          v14 = v34;
          if (!a5)
            return v19;
          goto LABEL_21;
        }
      }
      v12 = 1;
LABEL_14:
      if (v11 == ++v15)
      {
        v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        v11 = v20;
        if (v20)
          goto LABEL_4;
        v19 = 0;
        if (a5)
          goto LABEL_21;
        return v19;
      }
    }
  }
  v19 = 0;
  v14 = CFSTR("Output settings dictionary does not contain any recognized keys");
  if (a5)
LABEL_21:
    *a5 = v14;
  return v19;
}

- (AVOutputSettings)initWithOutputSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  AVOutputSettings *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVOutputSettings;
  v6 = -[AVOutputSettings init](&v9, sel_init, a3, a4);
  v7 = objc_opt_class();
  AVRequireConcreteObject(v6, a2, v7);
  if (v6)
    v6->_outputSettingsDictionary = (NSDictionary *)objc_msgSend(a3, "copyWithZone:", -[AVOutputSettings zone](v6, "zone"));
  return v6;
}

+ (unint64_t)_validateOutputSettingsDictionary:(id)a3 compatibilityDescription:(id *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "allKeys"));
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", objc_msgSend(a1, "eligibleOutputSettingsDictionaryKeys"));
  if (objc_msgSend(a1, "supportsEmptyOutputSettingsDictionary") && !objc_msgSend(v6, "count"))
  {
    v10 = CFSTR("Output settings dictionary is empty and valid");
    v9 = 1;
    if (!a4)
      return v9;
    goto LABEL_9;
  }
  objc_msgSend(v7, "intersectSet:", v6);
  v8 = objc_msgSend(v7, "count");
  v9 = v8 != 0;
  if (v8)
    v10 = CFSTR("Output settings dictionary is valid");
  else
    v10 = 0;
  if (v8 < objc_msgSend(v6, "count"))
  {
    v9 |= 2uLL;
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
    objc_msgSend(v11, "minusSet:", v7);
    v10 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output settings dictionary contains one or more invalid keys: %@"), objc_msgSend((id)objc_msgSend(v11, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
  }
  if (a4)
LABEL_9:
    *a4 = v10;
  return v9;
}

+ (BOOL)supportsEmptyOutputSettingsDictionary
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputSettings;
  -[AVOutputSettings dealloc](&v3, sel_dealloc);
}

+ (id)registeredOutputSettingsClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)eligibleOutputSettingsDictionaryKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(a1, "registeredOutputSettingsClasses", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "unionSet:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "eligibleOutputSettingsDictionaryKeys"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

+ (unint64_t)validateOutputSettingsDictionary:(id)a3
{
  return objc_msgSend(a1, "_validateOutputSettingsDictionary:compatibilityDescription:", a3, 0);
}

+ (id)outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4
{
  id result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v14 = 0;
  result = (id)objc_msgSend(a1, "_outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:", a3, a4, &v14);
  if (!result)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, v14, v7, v8, v9, v10, v11, v13), 0);
    objc_exception_throw(v12);
  }
  return result;
}

+ (id)defaultOutputSettingsForMediaType:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("soun")))
    return +[AVAudioOutputSettings defaultAudioOutputSettings](AVAudioOutputSettings, "defaultAudioOutputSettings");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("vide")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("auxv")))
  {
    return +[AVVideoOutputSettings defaultVideoOutputSettings](AVVideoOutputSettings, "defaultVideoOutputSettings");
  }
  return 0;
}

- (AVOutputSettings)init
{
  return -[AVOutputSettings initWithOutputSettingsDictionary:exceptionReason:](self, "initWithOutputSettingsDictionary:exceptionReason:", 0, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, outputSettingsDictionary=%@>"), NSStringFromClass(v4), self, -[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary"));
}

- (NSSet)compatibleMediaTypes
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)willYieldCompressedSamples
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
  return 0;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

@end
