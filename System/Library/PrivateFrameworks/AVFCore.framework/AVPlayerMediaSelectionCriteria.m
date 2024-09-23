@implementation AVPlayerMediaSelectionCriteria

- (id)figDictionary
{
  void *v2;

  v2 = *(void **)self->_criteriaInternal;
  if (v2)
    return (id)objc_msgSend(v2, "copy");
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (NSArray)principalMediaCharacteristics
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5738]);
  if (v2)
    return (NSArray *)AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)preferredMediaCharacteristics
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5718]);
  if (v2)
    return (NSArray *)AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)preferredLanguages
{
  NSArray *result;

  result = (NSArray *)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5720]);
  if (!result)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (AVPlayerMediaSelectionCriteria)init
{
  AVPlayerMediaSelectionCriteria *v2;
  void *v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerMediaSelectionCriteria;
  v2 = -[AVPlayerMediaSelectionCriteria init](&v5, sel_init);
  if (v2)
  {
    v3 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v2->_criteriaInternal = v3;
    if (v3)
    {
      v7 = *MEMORY[0x1E0CC5700];
      v6 = *MEMORY[0x1E0CC5E70];
      v8[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
      *(_QWORD *)v2->_criteriaInternal = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVPlayerMediaSelectionCriteria)initWithPrincipalMediaCharacteristics:(NSArray *)principalMediaCharacteristics preferredLanguages:(NSArray *)preferredLanguages preferredMediaCharacteristics:(NSArray *)preferredMediaCharacteristics
{
  AVPlayerMediaSelectionCriteria *v7;
  void *v8;
  AVPlayerMediaSelectionCriteria *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;

  v7 = -[AVPlayerMediaSelectionCriteria initWithPreferredLanguages:preferredMediaCharacteristics:](self, "initWithPreferredLanguages:preferredMediaCharacteristics:", preferredLanguages, preferredMediaCharacteristics);
  if (v7)
  {
    v18 = 0;
    if (publicCriteriaAreExceptional(0, 0, principalMediaCharacteristics, 0, &v18))
    {
      v10 = v7;
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v7, a2, (uint64_t)v18, v11, v12, v13, v14, v15, v17), 0);
      objc_exception_throw(v16);
    }
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)v7->_criteriaInternal);
    if (principalMediaCharacteristics)
      objc_msgSend(v8, "setValue:forKey:", AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(principalMediaCharacteristics), *MEMORY[0x1E0CC5738]);

    *(_QWORD *)v7->_criteriaInternal = objc_msgSend(v8, "copy");
  }
  return v7;
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(NSArray *)preferredLanguages preferredMediaCharacteristics:(NSArray *)preferredMediaCharacteristics
{
  AVPlayerMediaSelectionCriteria *v7;
  void *v8;
  void *v9;
  AVPlayerMediaSelectionCriteria *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;

  v7 = -[AVPlayerMediaSelectionCriteria init](self, "init");
  if (v7)
  {
    v19 = 0;
    if (publicCriteriaAreExceptional(preferredLanguages, preferredMediaCharacteristics, 0, 0, &v19))
    {
      v11 = v7;
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v7, a2, (uint64_t)v19, v12, v13, v14, v15, v16, v18), 0);
      objc_exception_throw(v17);
    }
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)v7->_criteriaInternal);
    v9 = v8;
    if (preferredLanguages)
      objc_msgSend(v8, "setValue:forKey:", preferredLanguages, *MEMORY[0x1E0CC5720]);
    if (preferredMediaCharacteristics)
      objc_msgSend(v9, "setValue:forKey:", AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(preferredMediaCharacteristics), *MEMORY[0x1E0CC5718]);

    *(_QWORD *)v7->_criteriaInternal = objc_msgSend(v9, "copy");
  }
  return v7;
}

- (void)dealloc
{
  id *criteriaInternal;
  objc_super v4;

  criteriaInternal = (id *)self->_criteriaInternal;
  if (criteriaInternal)
  {

    free(self->_criteriaInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerMediaSelectionCriteria;
  -[AVPlayerMediaSelectionCriteria dealloc](&v4, sel_dealloc);
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 preferredMediaSubTypes:(id)a5 precludedMediaSubTypes:(id)a6
{
  AVPlayerMediaSelectionCriteria *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  AVPlayerMediaSelectionCriteria *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = -[AVPlayerMediaSelectionCriteria initWithPreferredLanguages:preferredMediaCharacteristics:](self, "initWithPreferredLanguages:preferredMediaCharacteristics:", a3, a4);
  if (v9)
  {
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      v13 = CFSTR("preferredMediaSubTypes must contain only items of type NSNumber");
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(a5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_24:
            v22 = v9;
            v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, (uint64_t)v13, v23, v24, v25, v26, v27, v29), 0);
            objc_exception_throw(v28);
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v11);
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      v13 = CFSTR("precludedMediaSubTypes must contain only items of type NSNumber");
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(a6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_24;
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v16);
    }
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)v9->_criteriaInternal);
    v20 = v19;
    if (a5)
      objc_msgSend(v19, "setValue:forKey:", a5, *MEMORY[0x1E0CC5728]);
    if (a6)
      objc_msgSend(v20, "setValue:forKey:", a6, *MEMORY[0x1E0CC5708]);

    *(_QWORD *)v9->_criteriaInternal = objc_msgSend(v20, "copy");
  }
  return v9;
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 preferredMediaSubTypes:(id)a5 precludedMediaSubTypes:(id)a6 preferMultichannelAudio:(BOOL)a7 precludeMultichannelAudio:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  AVPlayerMediaSelectionCriteria *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a8;
  v9 = a7;
  v10 = -[AVPlayerMediaSelectionCriteria initWithPreferredLanguages:preferredMediaCharacteristics:preferredMediaSubTypes:precludedMediaSubTypes:](self, "initWithPreferredLanguages:preferredMediaCharacteristics:preferredMediaSubTypes:precludedMediaSubTypes:", a3, a4, a5, a6);
  if (v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)v10->_criteriaInternal);
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    objc_msgSend(v11, "setValue:forKey:", v12, *MEMORY[0x1E0CC5710]);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    objc_msgSend(v11, "setValue:forKey:", v13, *MEMORY[0x1E0CC56F8]);

    *(_QWORD *)v10->_criteriaInternal = objc_msgSend(v11, "copy");
  }
  return v10;
}

- (AVPlayerMediaSelectionCriteria)initWithPreferredLanguages:(id)a3 preferredMediaCharacteristics:(id)a4 fallbackPreferredLanguages:(id)a5 fallbackPreferredMediaCharacteristics:(id)a6 captionDisplayType:(int64_t)a7
{
  AVPlayerMediaSelectionCriteria *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v12 = -[AVPlayerMediaSelectionCriteria initWithPreferredLanguages:preferredMediaCharacteristics:](self, "initWithPreferredLanguages:preferredMediaCharacteristics:");
  if (v12)
  {
    if ((unint64_t)a3 | (unint64_t)a4)
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)v12->_criteriaInternal);
    else
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = v13;
    if (a5)
      objc_msgSend(v13, "setValue:forKey:", a5, *MEMORY[0x1E0CC56F0]);
    if (a6)
      objc_msgSend(v14, "setValue:forKey:", AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(a6), *MEMORY[0x1E0CC56E8]);
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a7);
    objc_msgSend(v14, "setValue:forKey:", v15, *MEMORY[0x1E0CC56E0]);

    *(_QWORD *)v12->_criteriaInternal = objc_msgSend(v14, "copy");
  }
  return v12;
}

- (AVPlayerMediaSelectionCriteria)initWithPremiumMediaCharacteristics:(id)a3 preferredLanguages:(id)a4 preferredMediaCharacteristics:(id)a5
{
  AVPlayerMediaSelectionCriteria *v9;
  uint64_t v10;
  void *v11;
  AVPlayerMediaSelectionCriteria *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;

  v9 = -[AVPlayerMediaSelectionCriteria initWithPreferredLanguages:preferredMediaCharacteristics:](self, "initWithPreferredLanguages:preferredMediaCharacteristics:", a4, a5);
  if (v9)
  {
    if ((unint64_t)a4 | (unint64_t)a5)
      v10 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)v9->_criteriaInternal);
    else
      v10 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)v10;
    v21 = 0;
    if (publicCriteriaAreExceptional(0, 0, 0, a3, &v21))
    {
      v13 = v9;
      v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, (uint64_t)v21, v14, v15, v16, v17, v18, v20), 0);
      objc_exception_throw(v19);
    }
    if (a3)
      objc_msgSend(v11, "setValue:forKey:", AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(a3), *MEMORY[0x1E0CC5730]);

    *(_QWORD *)v9->_criteriaInternal = objc_msgSend(v11, "copy");
  }
  return v9;
}

- (id)premiumMediaCharacteristics
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5730]);
  if (v2)
    return AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)_precludedMediaCharacteristics
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5700]);
  if (v2)
    return AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)_fallbackPreferredMediaCharacteristics
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC56E8]);
  if (v2)
    return AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(v2);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)_fallbackPreferredLanguages
{
  id result;

  result = (id)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC56F0]);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (id)preferredMediaSubTypes
{
  id result;

  result = (id)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5728]);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (id)precludedMediaSubTypes
{
  id result;

  result = (id)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5708]);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (BOOL)preferMultichannelAudio
{
  return objc_msgSend((id)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC5710]), "BOOLValue");
}

- (BOOL)precludeMultichannelAudio
{
  return objc_msgSend((id)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC56F8]), "BOOLValue");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), NSStringFromClass(v4), self);
  if (-[NSArray count](-[AVPlayerMediaSelectionCriteria principalMediaCharacteristics](self, "principalMediaCharacteristics"), "count"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria principalMediaCharacteristics](self, "principalMediaCharacteristics");
    objc_msgSend(v5, "appendString:", objc_msgSend(v6, "stringWithFormat:", CFSTR(", principalMediaCharacteristics = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria premiumMediaCharacteristics](self, "premiumMediaCharacteristics"), "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria premiumMediaCharacteristics](self, "premiumMediaCharacteristics");
    objc_msgSend(v5, "appendString:", objc_msgSend(v7, "stringWithFormat:", CFSTR(", premiumMediaCharacteristics = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (-[NSArray count](-[AVPlayerMediaSelectionCriteria preferredLanguages](self, "preferredLanguages"), "count"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria preferredLanguages](self, "preferredLanguages");
    objc_msgSend(v5, "appendString:", objc_msgSend(v8, "stringWithFormat:", CFSTR(", preferredLanguages = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (-[NSArray count](-[AVPlayerMediaSelectionCriteria preferredMediaCharacteristics](self, "preferredMediaCharacteristics"), "count"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria preferredMediaCharacteristics](self, "preferredMediaCharacteristics");
    objc_msgSend(v5, "appendString:", objc_msgSend(v9, "stringWithFormat:", CFSTR(", preferredMediaCharacteristics = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria _precludedMediaCharacteristics](self, "_precludedMediaCharacteristics"), "count"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria _precludedMediaCharacteristics](self, "_precludedMediaCharacteristics");
    objc_msgSend(v5, "appendString:", objc_msgSend(v10, "stringWithFormat:", CFSTR(", precludedMediaCharacteristics = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria _fallbackPreferredMediaCharacteristics](self, "_fallbackPreferredMediaCharacteristics"), "count"))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria _fallbackPreferredMediaCharacteristics](self, "_fallbackPreferredMediaCharacteristics");
    objc_msgSend(v5, "appendString:", objc_msgSend(v11, "stringWithFormat:", CFSTR(", fallbackPreferredMediaCharacteristics = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria _fallbackPreferredLanguages](self, "_fallbackPreferredLanguages"), "count"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria _fallbackPreferredLanguages](self, "_fallbackPreferredLanguages");
    objc_msgSend(v5, "appendString:", objc_msgSend(v12, "stringWithFormat:", CFSTR(", fallbackPreferredLanguages = %@"), (id)FigCFCopyCompactDescription()));
  }
  v13 = (void *)objc_msgSend(*(id *)self->_criteriaInternal, "objectForKey:", *MEMORY[0x1E0CC56E0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = objc_msgSend(v13, "intValue");
    if (v15 > 2)
      v16 = CFSTR("Unknown");
    else
      v16 = off_1E3035458[v15];
    objc_msgSend(v5, "appendString:", objc_msgSend(v14, "stringWithFormat:", CFSTR(", captionAppearanceDisplayType = %@"), v16));
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria preferredMediaSubTypes](self, "preferredMediaSubTypes"), "count"))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria preferredMediaSubTypes](self, "preferredMediaSubTypes");
    objc_msgSend(v5, "appendString:", objc_msgSend(v17, "stringWithFormat:", CFSTR(", preferredMediaSubTypes = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (objc_msgSend(-[AVPlayerMediaSelectionCriteria precludedMediaSubTypes](self, "precludedMediaSubTypes"), "count"))
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[AVPlayerMediaSelectionCriteria precludedMediaSubTypes](self, "precludedMediaSubTypes");
    objc_msgSend(v5, "appendString:", objc_msgSend(v18, "stringWithFormat:", CFSTR(", precludedMediaSubTypes = %@"), (id)FigCFCopyCompactDescription()));
  }
  if (-[AVPlayerMediaSelectionCriteria preferMultichannelAudio](self, "preferMultichannelAudio"))
    objc_msgSend(v5, "appendString:", CFSTR(", preferMultichannelAudio"));
  if (-[AVPlayerMediaSelectionCriteria precludeMultichannelAudio](self, "precludeMultichannelAudio"))
    objc_msgSend(v5, "appendString:", CFSTR(", precludeMultichannelAudio"));
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (AVPlayerMediaSelectionCriteria)initWithFigDictionary:(id)a3
{
  AVPlayerMediaSelectionCriteria *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerMediaSelectionCriteria;
  v4 = -[AVPlayerMediaSelectionCriteria init](&v7, sel_init);
  if (v4)
  {
    v5 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v4->_criteriaInternal = v5;
    if (v5)
    {
      *(_QWORD *)v4->_criteriaInternal = objc_msgSend(a3, "copy");
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

@end
