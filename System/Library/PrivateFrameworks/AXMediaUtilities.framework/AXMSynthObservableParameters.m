@implementation AXMSynthObservableParameters

- (AXMSynthObservableParameters)init
{
  AXMSynthObservableParameters *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *supportedParameters;
  uint64_t v5;
  NSPointerArray *parameterObservers;
  uint64_t v7;
  NSMutableDictionary *parameterValues;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXMSynthObservableParameters;
  v2 = -[AXMSynthObservableParameters init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    supportedParameters = v2->_supportedParameters;
    v2->_supportedParameters = v3;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v5 = objc_claimAutoreleasedReturnValue();
    parameterObservers = v2->_parameterObservers;
    v2->_parameterObservers = (NSPointerArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    parameterValues = v2->_parameterValues;
    v2->_parameterValues = (NSMutableDictionary *)v7;

    -[AXMSynthObservableParameters addSupportedParameters](v2, "addSupportedParameters");
  }
  return v2;
}

- (void)addSupportedParameter:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->_supportedParameters, "addObject:", a3);
}

- (void)addSupportedParameters:(id)a3
{
  -[NSMutableOrderedSet addObjectsFromArray:](self->_supportedParameters, "addObjectsFromArray:", a3);
}

- (BOOL)isParameterSupported:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_supportedParameters, "containsObject:", a3);
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSynthObservableParameters supportedParameters](self, "supportedParameters");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[AXMSynthObservableParameters getValueForParameter:](self, "getValueForParameter:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
}

- (void)addParameterObserver:(id)a3
{
  -[NSPointerArray addPointer:](self->_parameterObservers, "addPointer:", a3);
}

- (void)removeParameterObserver:(id)a3
{
  unint64_t i;
  id v5;

  v5 = a3;
  for (i = 0; i < -[NSPointerArray count](self->_parameterObservers, "count"); ++i)
  {
    if (-[NSPointerArray pointerAtIndex:](self->_parameterObservers, "pointerAtIndex:", i) == v5)
    {
      if (i != 0x7FFFFFFFFFFFFFFFLL)
        -[NSPointerArray removePointerAtIndex:](self->_parameterObservers, "removePointerAtIndex:", i);
      break;
    }
  }

}

- (void)notifyObserversOfValueChange:(id)a3 forParameter:(id)a4
{
  id v6;
  id v7;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_parameterObservers;
  v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "parameterValueDidChange:forParameter:", v6, v7, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[AXMSynthObservableParameters assertParameterIsSupported:](self, "assertParameterIsSupported:", v6))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameterValues, "setObject:forKeyedSubscript:", v7, v6);
    -[AXMSynthObservableParameters notifyObserversOfValueChange:forParameter:](self, "notifyObserversOfValueChange:forParameter:", v7, v6);
  }

}

- (id)getValueForParameter:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[AXMSynthObservableParameters isParameterSupported:](self, "isParameterSupported:", v4))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_parameterValues, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)defaultParameters
{
  return objc_alloc_init(AXMSynthObservableParameters);
}

- (NSPointerArray)parameterObservers
{
  return self->_parameterObservers;
}

- (void)setParameterObservers:(id)a3
{
  objc_storeStrong((id *)&self->_parameterObservers, a3);
}

- (NSMutableDictionary)parameterValues
{
  return self->_parameterValues;
}

- (void)setParameterValues:(id)a3
{
  objc_storeStrong((id *)&self->_parameterValues, a3);
}

- (NSMutableOrderedSet)supportedParameters
{
  return self->_supportedParameters;
}

- (void)setSupportedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_supportedParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedParameters, 0);
  objc_storeStrong((id *)&self->_parameterValues, 0);
  objc_storeStrong((id *)&self->_parameterObservers, 0);
}

@end
