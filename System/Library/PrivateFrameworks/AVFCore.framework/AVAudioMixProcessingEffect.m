@implementation AVAudioMixProcessingEffect

- (BOOL)isValueSupported:(id)a3 exceptionReasonOut:(id *)a4
{
  uint64_t *v7;
  int v8;
  uint64_t *v9;
  __CFString *v10;
  BOOL v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  if (isValueSupported_exceptionReasonOut__sSupportedValueTypesOnce != -1)
    dispatch_once(&isValueSupported_exceptionReasonOut__sSupportedValueTypesOnce, &__block_literal_global_13);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_90;
  v13[3] = &unk_1E30329F0;
  v13[4] = a3;
  v13[5] = self;
  v13[6] = &v20;
  v13[7] = &v14;
  objc_msgSend((id)isValueSupported_exceptionReasonOut__sSupportedValueTypes, "enumerateObjectsUsingBlock:", v13);
  v7 = v21;
  v8 = *((unsigned __int8 *)v21 + 24);
  if (a4 && !*((_BYTE *)v21 + 24))
  {
    v9 = v15;
    v10 = CFSTR("Unsupported type sent as value for property");
    if (v15[5])
      v10 = (__CFString *)v15[5];
    *a4 = v10;
    v9[5] = 0;
    v8 = *((unsigned __int8 *)v7 + 24);
  }
  v11 = v8 != 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

id __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke()
{
  void *v0;
  uint64_t v1;
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v1 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 5);
  result = (id)objc_msgSend(v0, "setWithArray:", v1, v3, v4, v5, v6);
  isValueSupported_exceptionReasonOut__sSupportedValueTypes = (uint64_t)result;
  return result;
}

uint64_t __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_90(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (result)
      {
        v8 = result;
        v9 = *(_QWORD *)v16;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v7);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "isValueSupported:exceptionReasonOut:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), 0);
            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {
              result = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("array containing value with type %@ is not supported"), objc_opt_class());
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
              return result;
            }
            ++v10;
          }
          while (v8 != v10);
          result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          v8 = result;
          if (result)
            continue;
          break;
        }
      }
    }
    else
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) != 0)
      {
        v11 = *(void **)(a1 + 32);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_2;
        v12[3] = &unk_1E30329C8;
        v13 = *(_OWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 56);
        return objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);
      }
    }
  }
  return result;
}

id __66__AVAudioMixProcessingEffect_isValueSupported_exceptionReasonOut___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result;
  const __CFString *v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isValueSupported:exceptionReasonOut:", a2, 0);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v8 = CFSTR("dictionary with key of type %@ is not supported");
    goto LABEL_5;
  }
  result = (id)objc_msgSend(*(id *)(a1 + 32), "isValueSupported:exceptionReasonOut:", a3, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v8 = CFSTR("dictionary with value of type %@ is not supported");
LABEL_5:
    result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, objc_opt_class());
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

+ (id)processingEffectWithDSPGraphText:(id)a3 properties:(id)a4 parameterSchedule:(id)a5 identifier:(id)a6
{
  return -[AVAudioMixProcessingEffect initWithDSPGraphText:properties:parameterSchedule:identifier:]([AVAudioMixProcessingEffect alloc], "initWithDSPGraphText:properties:parameterSchedule:identifier:", a3, a4, a5, a6);
}

- (AVAudioMixProcessingEffect)initWithDSPGraphText:(id)a3 properties:(id)a4 parameterSchedule:(id)a5 identifier:(id)a6
{
  AVAudioMixProcessingEffect *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)AVAudioMixProcessingEffect;
  v11 = -[AVAudioMixEffect init](&v35, sel_init);
  if (v11)
  {
    v11->_identifier = (NSString *)objc_msgSend(a6, "copy");
    v11->_graphText = (NSString *)objc_msgSend(a3, "copy");
    v29 = 0;
    v30 = &v29;
    v31 = 0x3052000000;
    v32 = __Block_byref_object_copy__13;
    v33 = __Block_byref_object_dispose__13;
    v34 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __91__AVAudioMixProcessingEffect_initWithDSPGraphText_properties_parameterSchedule_identifier___block_invoke;
    v28[3] = &unk_1E3032A18;
    v28[4] = v11;
    v28[5] = &v29;
    objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v28);
    v17 = v30[5];
    if (v17)
    {
      v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v11, a2, v17, v12, v13, v14, v15, v16, v24), 0);
      objc_exception_throw(v23);
    }
    v11->_properties = (NSDictionary *)objc_msgSend(a4, "copy");
    v11->_scheduleEntries = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(a5);
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "copy");
          -[NSMutableArray insertObject:atIndex:](v11->_scheduleEntries, "insertObject:atIndex:", v21, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v11->_scheduleEntries, "indexOfObject:inSortedRange:options:usingComparator:", v21, 0, -[NSMutableArray count](v11->_scheduleEntries, "count"), 1024, &__block_literal_global_108));
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v18);
    }
    _Block_object_dispose(&v29, 8);
  }
  return v11;
}

uint64_t __91__AVAudioMixProcessingEffect_initWithDSPGraphText_properties_parameterSchedule_identifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t result;
  char v9;

  if ((unint64_t)objc_msgSend(a2, "unsignedLongLongValue") >> 32)
  {
    result = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key %@ in properties dictionary is not FourCC"), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    v9 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isValueSupported:exceptionReasonOut:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9 = result ^ 1;
  }
  *a4 = v9;
  return result;
}

uint64_t __91__AVAudioMixProcessingEffect_initWithDSPGraphText_properties_parameterSchedule_identifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  CMTime v6;
  CMTime v7;
  CMTime time2;
  CMTime time1;

  if (a2)
  {
    objc_msgSend(a2, "time");
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "time");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3)
      goto LABEL_3;
  }
  memset(&time2, 0, sizeof(time2));
LABEL_6:
  if (CMTimeCompare(&time1, &time2) < 0)
    return -1;
  if (!a2)
  {
    memset(&v7, 0, sizeof(v7));
    if (a3)
      goto LABEL_9;
LABEL_12:
    memset(&v6, 0, sizeof(v6));
    return CMTimeCompare(&v7, &v6) > 0;
  }
  objc_msgSend(a2, "time");
  if (!a3)
    goto LABEL_12;
LABEL_9:
  objc_msgSend(a3, "time");
  return CMTimeCompare(&v7, &v6) > 0;
}

- (void)dealloc
{
  NSString *graphText;
  objc_super v4;

  graphText = self->_graphText;
  if (graphText)

  v4.receiver = self;
  v4.super_class = (Class)AVAudioMixProcessingEffect;
  -[AVAudioMixProcessingEffect dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *graphText;
  uint64_t v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  if (a3 == self)
  {
LABEL_10:
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = -[NSString isEqual:](self->_identifier, "isEqual:", *((_QWORD *)a3 + 2));
  if (v5)
  {
    v5 = -[NSMutableArray isEqual:](self->_scheduleEntries, "isEqual:", *((_QWORD *)a3 + 4));
    if (v5)
    {
      v5 = -[NSDictionary isEqual:](self->_properties, "isEqual:", *((_QWORD *)a3 + 5));
      if (v5)
      {
        graphText = self->_graphText;
        if (!graphText || !*((_QWORD *)a3 + 3))
          goto LABEL_10;
        v7 = -[NSString hash](graphText, "hash");
        if (v7 == objc_msgSend(*((id *)a3 + 3), "hash"))
        {
          v5 = -[NSString isEqual:](self->_graphText, "isEqual:", *((_QWORD *)a3 + 3));
          if (v5)
            goto LABEL_10;
          return v5;
        }
LABEL_11:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger graphText;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  graphText = (NSUInteger)self->_graphText;
  if (graphText)
    graphText = objc_msgSend((id)graphText, "hash");
  v5 = graphText ^ v3;
  v6 = -[NSMutableArray hash](self->_scheduleEntries, "hash");
  return v5 ^ v6 ^ -[NSDictionary hash](self->_properties, "hash");
}

- (id)_fourCCToFigPropertyDict
{
  if (_fourCCToFigPropertyDict_sFourCCToFigPropertyDictOnce != -1)
    dispatch_once(&_fourCCToFigPropertyDict_sFourCCToFigPropertyDictOnce, &__block_literal_global_109);
  return (id)_fourCCToFigPropertyDict_sFourCCToFigPropertyDict;
}

id __54__AVAudioMixProcessingEffect__fourCCToFigPropertyDict__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  v0 = (void *)MEMORY[0x1E0C99D80];
  v1 = *MEMORY[0x1E0CC3E60];
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1735554168);
  v3 = *MEMORY[0x1E0CC3E68];
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1886548848);
  result = (id)objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", v1, v2, v3, v4, *MEMORY[0x1E0CC3E58], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1635087216), 0);
  _fourCCToFigPropertyDict_sFourCCToFigPropertyDict = (uint64_t)result;
  return result;
}

- (id)_figAudioProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSDictionary *properties;
  _QWORD v11[6];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (self->_graphText)
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1634758764);
    objc_msgSend(v3, "setValue:forKey:", v4, *MEMORY[0x1E0CC3E38]);
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1685287015);
    objc_msgSend(v3, "setValue:forKey:", v5, *MEMORY[0x1E0CC3E40]);
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    objc_msgSend(v3, "setValue:forKey:", v6, *MEMORY[0x1E0CC3E48]);
    v7 = -[AVAudioMixProcessingEffect _fourCCToFigPropertyDict](self, "_fourCCToFigPropertyDict");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v8, "setValue:forKey:", self->_graphText, objc_msgSend(v7, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1735554168)));
    properties = self->_properties;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__AVAudioMixProcessingEffect__figAudioProperties__block_invoke;
    v11[3] = &unk_1E3032A60;
    v11[4] = v8;
    v11[5] = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](properties, "enumerateKeysAndObjectsUsingBlock:", v11);
    objc_msgSend(v3, "setValue:forKey:", v8, *MEMORY[0x1E0CC3E50]);
  }
  return v3;
}

uint64_t __49__AVAudioMixProcessingEffect__figAudioProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a2));
}

- (id)_figSchedule
{
  void *v3;
  NSArray *v4;
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
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AVAudioMixProcessingEffect parameterSchedule](self, "parameterSchedule", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_figSchedule"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)DSPGraphText
{
  NSString *graphText;

  graphText = self->_graphText;
  if (graphText)
    return graphText;
  else
    return 0;
}

- (NSArray)parameterSchedule
{
  return (NSArray *)self->_scheduleEntries;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (id)description
{
  uint64_t v3;

  if (self->_graphText)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DSPG(%p) identifier=%@"), self, -[AVAudioMixProcessingEffect identifier](self, "identifier"));
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN(%p)"), self, v3);
}

@end
