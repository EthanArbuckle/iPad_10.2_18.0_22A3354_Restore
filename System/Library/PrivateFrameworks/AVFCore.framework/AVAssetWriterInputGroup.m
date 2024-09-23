@implementation AVAssetWriterInputGroup

+ (AVAssetWriterInputGroup)assetWriterInputGroupWithInputs:(NSArray *)inputs defaultInput:(AVAssetWriterInput *)defaultInput
{
  return (AVAssetWriterInputGroup *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:defaultInput:", inputs, defaultInput);
}

- (AVAssetWriterInputGroup)init
{
  return -[AVAssetWriterInputGroup initWithInputs:defaultInput:](self, "initWithInputs:defaultInput:", 0, 0);
}

- (AVAssetWriterInputGroup)initWithInputs:(NSArray *)inputs defaultInput:(AVAssetWriterInput *)defaultInput
{
  AVAssetWriterInputGroup *v8;
  AVAssetWriterInputGroupInternal *v9;
  AVAssetWriterInputGroup *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  AVAssetWriterInputGroup *v20;
  AVAssetWriterInputGroup *v21;
  void *v22;
  objc_super v23;

  if (!inputs)
  {
    v11 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "inputs != nil";
    goto LABEL_13;
  }
  if (!-[NSArray count](inputs, "count"))
  {
    v20 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "[inputs count] > 0";
    goto LABEL_13;
  }
  if (defaultInput && !-[NSArray containsObject:](inputs, "containsObject:", defaultInput))
  {
    v21 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "defaultInput == nil || [inputs containsObject:defaultInput]";
LABEL_13:
    v22 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)v19), 0);
    objc_exception_throw(v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)AVAssetWriterInputGroup;
  v8 = -[AVMediaSelectionGroup init](&v23, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(AVAssetWriterInputGroupInternal);
    v8->_internal = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_internal->inputs = (NSArray *)-[NSArray copy](inputs, "copy");
      v8->_internal->defaultInput = defaultInput;
      -[AVAssetWriterInputGroup _startObservingInputPropertiesThatMayChangeValueOfOptions](v8, "_startObservingInputPropertiesThatMayChangeValueOfOptions");
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_internal)
  {
    -[AVAssetWriterInputGroup _stopObservingInputPropertiesThatMayChangeValueOfOptions](self, "_stopObservingInputPropertiesThatMayChangeValueOfOptions");

    CFRelease(self->_internal);
  }
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputGroup;
  -[AVMediaSelectionGroup dealloc](&v3, sel_dealloc);
}

- (NSArray)inputs
{
  NSArray *result;

  result = self->_internal->inputs;
  if (!result)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (AVAssetWriterInput)defaultInput
{
  return self->_internal->defaultInput;
}

- (void)_startObservingInputPropertiesThatMayChangeValueOfOptions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSArray *obj;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  obj = self->_internal->inputs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("languageCode"), 0, CFSTR("AVAssetWriterInputGroupOptionsChangedContext"));
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("extendedLanguageTag"), 0, CFSTR("AVAssetWriterInputGroupOptionsChangedContext"));
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("metadata"), 0, CFSTR("AVAssetWriterInputGroupOptionsChangedContext"));
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("trackReferences"), 0, CFSTR("AVAssetWriterInputGroupOptionsChangedContext"));
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
}

- (void)_stopObservingInputPropertiesThatMayChangeValueOfOptions
{
  NSArray *inputs;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  inputs = self->_internal->inputs;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(inputs);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("languageCode"));
        objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("extendedLanguageTag"));
        objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("metadata"));
        objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("trackReferences"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == CFSTR("AVAssetWriterInputGroupOptionsChangedContext"))
  {
    -[AVAssetWriterInputGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("options"), a4, a5);
    -[AVAssetWriterInputGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("options"));
  }
}

- (id)options
{
  void *v3;
  NSArray *inputs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  const void *v10;
  BOOL v11;
  CFTypeID v12;
  AVAssetWriterInputSelectionOption *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CMTextDisplayFlags displayFlagsOut;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  inputs = self->_internal->inputs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(inputs);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!objc_msgSend((id)objc_msgSend(v9, "mediaType"), "isEqualToString:", CFSTR("sbtl")))
        {
          v13 = +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:](AVAssetWriterInputSelectionOption, "assetWriterInputSelectionOptionWithAssetWriterInput:", v9);
          goto LABEL_18;
        }
        v10 = (const void *)objc_msgSend(v9, "sourceFormatHint");
        if (objc_msgSend(v9, "outputSettings"))
          v11 = 1;
        else
          v11 = v10 == 0;
        if (v11
          || (v12 = CFGetTypeID(v10), v12 != CMFormatDescriptionGetTypeID())
          || CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)v10) != 1935832172
          || (displayFlagsOut = 0, CMTextFormatDescriptionGetDisplayFlags((CMFormatDescriptionRef)v10, &displayFlagsOut))
          || (displayFlagsOut & 0x80000000) == 0)
        {
          objc_msgSend(v3, "addObject:", +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:displaysNonForcedSubtitles:](AVAssetWriterInputSelectionOption, "assetWriterInputSelectionOptionWithAssetWriterInput:displaysNonForcedSubtitles:", v9, 1));
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "_trackReferences"), "objectForKey:", CFSTR("forc")), "count"))
          {
            continue;
          }
        }
        v13 = +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:displaysNonForcedSubtitles:](AVAssetWriterInputSelectionOption, "assetWriterInputSelectionOptionWithAssetWriterInput:displaysNonForcedSubtitles:", v9, 0);
LABEL_18:
        objc_msgSend(v3, "addObject:", v13);
        continue;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v6);
  }
  return v3;
}

+ (AVAssetWriterInputGroup)assetWriterInputGroupWithInputs:(id)a3 provisionalInputs:(id)a4 defaultInput:(id)a5
{
  return (AVAssetWriterInputGroup *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:provisionalInputs:defaultInput:", a3, a4, a5);
}

- (AVAssetWriterInputGroup)initWithInputs:(id)a3 provisionalInputs:(id)a4 defaultInput:(id)a5
{
  void *v10;
  AVAssetWriterInputGroup *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  AVAssetWriterInputGroup *v20;
  AVAssetWriterInputGroupInternal *v21;
  AVAssetWriterInputGroup *v23;
  AVAssetWriterInputGroup *v24;
  void *v25;
  objc_super v26;

  if (a5 && (objc_msgSend(a3, "containsObject:", a5) & 1) == 0)
  {
    v23 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "defaultInput == nil || [inputs containsObject:defaultInput]";
    goto LABEL_16;
  }
  if (!objc_msgSend(a3, "count") || !objc_msgSend(a4, "count"))
  {
    if (objc_msgSend(a3, "count") || objc_msgSend(a4, "count"))
      goto LABEL_9;
    v24 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "[inputs count] > 0 || [provisionalInputs count] > 0";
LABEL_16:
    v25 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)v19), 0);
    objc_exception_throw(v25);
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  if (objc_msgSend(v10, "intersectsSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a4)))
  {
    v11 = self;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "! [[NSSet setWithArray:inputs] intersectsSet:[NSSet setWithArray:provisionalInputs]]";
    goto LABEL_16;
  }
LABEL_9:
  v26.receiver = self;
  v26.super_class = (Class)AVAssetWriterInputGroup;
  v20 = -[AVMediaSelectionGroup init](&v26, sel_init);
  if (v20)
  {
    v21 = objc_alloc_init(AVAssetWriterInputGroupInternal);
    v20->_internal = v21;
    if (v21)
    {
      CFRetain(v21);
      v20->_internal->inputs = (NSArray *)objc_msgSend(a3, "copy");
      v20->_internal->defaultInput = (AVAssetWriterInput *)a5;
      v20->_internal->provisionalInputs = (NSArray *)objc_msgSend(a4, "copy");
      -[AVAssetWriterInputGroup _startObservingInputPropertiesThatMayChangeValueOfOptions](v20, "_startObservingInputPropertiesThatMayChangeValueOfOptions");
    }
    else
    {

      return 0;
    }
  }
  return v20;
}

- (NSArray)provisionalInputs
{
  NSArray *result;

  result = self->_internal->provisionalInputs;
  if (!result)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (id)mediaSelectionOptionWithPropertyList:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v7;

  v4 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("UnsafeUnretainedPointerData"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v7 = 0, objc_msgSend(v4, "length") == 8)
    && (objc_msgSend(v4, "getBytes:length:", &v7, 8),
        v5 = -[AVAssetWriterInputGroup inputs](self, "inputs"),
        -[NSArray indexOfObjectIdenticalTo:](v5, "indexOfObjectIdenticalTo:", v7) != 0x7FFFFFFFFFFFFFFFLL))
  {
    return +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:](AVAssetWriterInputSelectionOption, "assetWriterInputSelectionOptionWithAssetWriterInput:", v7);
  }
  else
  {
    return 0;
  }
}

@end
