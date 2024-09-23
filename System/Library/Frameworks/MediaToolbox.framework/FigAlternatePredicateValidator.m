@implementation FigAlternatePredicateValidator

- (FigAlternatePredicateValidator)initWithPredicate:(id)a3
{
  FigAlternatePredicateValidator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigAlternatePredicateValidator;
  v4 = -[FigAlternatePredicateValidator init](&v6, sel_init);
  if (v4)
  {
    v4->_predicate = (NSPredicate *)objc_msgSend(a3, "copy");
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_result = 1;
  }
  return v4;
}

- (BOOL)validateWithError:(id *)a3
{
  MEMORY[0x19402EEEC](self->_mutex, a2);
  if (!self->_isEvaluated)
    -[NSPredicate acceptVisitor:flags:](self->_predicate, "acceptVisitor:flags:", self, 3);
  MEMORY[0x19402EF04](self->_mutex);
  if (a3)
    *a3 = self->_error;
  return self->_result;
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigAlternatePredicateValidator;
  -[FigAlternatePredicateValidator dealloc](&v3, sel_dealloc);
}

- (void)visitPredicate:(id)a3
{
  Class Class;
  Class v6;
  Class v7;
  Class v8;
  Class v9;
  Class v10;
  Class v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (self->_result)
  {
    Class = objc_getClass("AVAssetVariantChannelCountPredicate");
    v6 = objc_getClass("AVAssetVariantBinauralAudioPredicate");
    v7 = objc_getClass("AVAssetVariantImmersiveAudioPredicate");
    v8 = objc_getClass("AVAssetVariantDownmixAudioPredicate");
    v9 = objc_getClass("AVAssetVariantAudioSampleRatePredicate");
    v10 = objc_getClass("AVAssetVariantPresentationWidthPredicate");
    v11 = objc_getClass("AVAssetVariantPresentationHeightPredicate");
    if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0
      && (!Class || (objc_msgSend(a3, "isMemberOfClass:", Class) & 1) == 0)
      && (!v6 || (objc_msgSend(a3, "isMemberOfClass:", v6) & 1) == 0)
      && (!v7 || (objc_msgSend(a3, "isMemberOfClass:", v7) & 1) == 0)
      && (!v8 || (objc_msgSend(a3, "isMemberOfClass:", v8) & 1) == 0)
      && (!v10 || (objc_msgSend(a3, "isMemberOfClass:", v10) & 1) == 0)
      && (!v11 || (objc_msgSend(a3, "isMemberOfClass:", v11) & 1) == 0)
      && (!v9 || (objc_msgSend(a3, "isMemberOfClass:", v9) & 1) == 0))
    {
      self->_result = 0;
      v13 = *MEMORY[0x1E0CB2938];
      v14[0] = CFSTR("failed to validate NSPredicate because only comparison and compound predicates are supported");
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      self->_error = (NSError *)(id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreMediaErrorDomain"), -15860, v12);
    }
  }
}

- (BOOL)_unsafeEvaluateKeyPathWithDummy:(id)a3
{
  id v4;
  uint64_t v6;

  v4 = +[FigAlternateObjC dummy](FigAlternateObjC, "dummy");
  v6 = objc_msgSend(v4, "valueForKeyPath:", a3);
  return objc_msgSend(v4, "validateValue:forKeyPath:error:", &v6, a3, 0);
}

- (BOOL)_keyPathComponentIsAllowed:(id)a3
{
  if (_keyPathComponentIsAllowed__buildValidKeysOnce != -1)
    dispatch_once(&_keyPathComponentIsAllowed__buildValidKeysOnce, &__block_literal_global_73);
  return objc_msgSend((id)_keyPathComponentIsAllowed__sValidKeys, "containsObject:", a3);
}

id __61__FigAlternatePredicateValidator__keyPathComponentIsAllowed___block_invoke()
{
  id result;

  result = objc_retain((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("peakBitRate"), CFSTR("averageBitRate"), CFSTR("videoAttributes"), CFSTR("videoRange"), CFSTR("codecTypes"), CFSTR("presentationSize"), CFSTR("presentationHeight"), CFSTR("presentationWidth"), CFSTR("nominalFrameRate"), CFSTR("audioAttributes"), CFSTR("formatIDs"), CFSTR("immersiveAttributes"), CFSTR("packing"), CFSTR("channelLayout"), CFSTR("projection"), CFSTR("@avg"), CFSTR("@count"),
                             CFSTR("@max"),
                             CFSTR("@min"),
                             CFSTR("@sum"),
                             CFSTR("@distinctUnionOfObjects"),
                             CFSTR("@unionOfObjects"),
                             CFSTR("@distinctUnionOfArrays"),
                             CFSTR("@unionOfArrays"),
                             CFSTR("@distinctUnionOfSets"),
                             CFSTR("videoLayoutAttributes"),
                             CFSTR("stereoViewComponents"),
                             CFSTR("packingType"),
                             CFSTR("projectionType"),
                             0));
  _keyPathComponentIsAllowed__sValidKeys = (uint64_t)result;
  return result;
}

- (id)_keyPathComponents:(id)a3
{
  return (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
}

- (BOOL)_validateKeyPath:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "length");
  if (v5)
  {
    v6 = -[FigAlternatePredicateValidator _keyPathComponents:](self, "_keyPathComponents:", a3);
    if ((unint64_t)objc_msgSend(v6, "count") <= 5)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
LABEL_6:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          LODWORD(v5) = -[FigAlternatePredicateValidator _keyPathComponentIsAllowed:](self, "_keyPathComponentIsAllowed:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
          if (!(_DWORD)v5)
            break;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
            if (v8)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:
        LOBYTE(v5) = -[FigAlternatePredicateValidator _unsafeEvaluateKeyPathWithDummy:](self, "_unsafeEvaluateKeyPathWithDummy:", a3);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_allowCallingFunctionWithName:(id)a3
{
  if (_allowCallingFunctionWithName__sOnceToken != -1)
    dispatch_once(&_allowCallingFunctionWithName__sOnceToken, &__block_literal_global_76);
  return objc_msgSend((id)_allowCallingFunctionWithName__sValidFunctions, "containsObject:", a3);
}

id __64__FigAlternatePredicateValidator__allowCallingFunctionWithName___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("channelCountForMediaOption:"), CFSTR("isBinauralMediaOption:"), CFSTR("isImmersiveMediaOption:"), CFSTR("isDownmixMediaOption:"), CFSTR("sampleRateForMediaOption:"), 0);
  _allowCallingFunctionWithName__sValidFunctions = (uint64_t)result;
  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5;
  void *v6;
  const __CFString **v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!self->_result)
    return;
  v5 = objc_msgSend(a3, "expressionType");
  if (v5 > 9)
  {
    if (v5 == 19)
    {
      v11 = *MEMORY[0x1E0CB2938];
      v12 = CFSTR("failed to validate NSPredicate because block expressions are not supported");
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = &v12;
      v8 = &v11;
      goto LABEL_14;
    }
    if (v5 != 10)
      return;
LABEL_9:
    v9 = objc_msgSend(a3, "keyPath");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[FigAlternatePredicateValidator _validateKeyPath:](self, "_validateKeyPath:", v9))
        return;
      v15 = *MEMORY[0x1E0CB2938];
      v16 = CFSTR("failed to validate NSPredicate because of invalid key path");
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = &v16;
      v8 = &v15;
    }
    else
    {
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("failed to validate NSPredicate because key path is not a string");
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = (const __CFString **)v18;
      v8 = &v17;
    }
    goto LABEL_14;
  }
  if (v5 == 3)
    goto LABEL_9;
  if (v5 == 4
    && !-[FigAlternatePredicateValidator _allowCallingFunctionWithName:](self, "_allowCallingFunctionWithName:", objc_msgSend(a3, "function")))
  {
    v13 = *MEMORY[0x1E0CB2938];
    v14 = CFSTR("failed to validate NSPredicate because calling the supplied function is forbidden");
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = &v14;
    v8 = &v13;
LABEL_14:
    v10 = objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1);
    self->_result = 0;
    self->_error = (NSError *)(id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreMediaErrorDomain"), -15860, v10);
  }
}

- (void)visitPredicateOperator:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_result && objc_msgSend(a3, "operatorType") == 11)
  {
    v5 = *MEMORY[0x1E0CB2938];
    v6[0] = CFSTR("failed to validate NSPredicate because custom selector operators are not supported");
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    self->_result = 0;
    self->_error = (NSError *)(id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreMediaErrorDomain"), -15860, v4);
  }
}

+ (BOOL)validateKeyPathForMinMaxQualifiers:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      v8 = objc_msgSend(&unk_1E3028890, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
      if (!v8)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

@end
