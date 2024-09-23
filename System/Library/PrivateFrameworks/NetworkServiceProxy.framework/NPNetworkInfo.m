@implementation NPNetworkInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)failureReasonToFallbackReason:(unsigned int)a3
{
  if (a3 - 1 > 0x10)
    return 14;
  else
    return qword_19E9959A0[a3 - 1];
}

- (NPNetworkInfo)initWithCoder:(id)a3
{
  id v4;
  NPNetworkInfo *v5;
  uint64_t v6;
  NSDate *lastVisited;
  uint64_t v8;
  NSDate *lastUsed;
  uint64_t v10;
  NPEdgeSelection *edgeSelection;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *edgeLatencies;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDate *probeRateLimit;
  uint64_t v23;
  int64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *currentLatencyMap;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NPNetworkInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SignatureLastVisited"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastVisited = v5->_lastVisited;
    v5->_lastVisited = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NetworkLastUsed"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastUsed = v5->_lastUsed;
    v5->_lastUsed = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EdgeSelection"));
    v10 = objc_claimAutoreleasedReturnValue();
    edgeSelection = v5->_edgeSelection;
    v5->_edgeSelection = (NPEdgeSelection *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("EdgeLatencies"));
    v15 = objc_claimAutoreleasedReturnValue();
    edgeLatencies = v5->_edgeLatencies;
    v5->_edgeLatencies = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("CurrentLatencyMap"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeRateLimit"));
    v21 = objc_claimAutoreleasedReturnValue();
    probeRateLimit = v5->_probeRateLimit;
    v5->_probeRateLimit = (NSDate *)v21;

    v23 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("LastFailureReason"));
    if ((_DWORD)v23)
      v24 = +[NPNetworkInfo failureReasonToFallbackReason:](NPNetworkInfo, "failureReasonToFallbackReason:", v23);
    else
      v24 = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("LastFallbackReason"));
    v5->_lastFallbackReason = v24;
    v5->_isProbeInProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isProbeInProgress"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v25 = v20;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v32 = objc_msgSend(v31, "unsignedIntegerValue");
          if (v32 < -[NSArray count](v5->_edgeLatencies, "count"))
          {
            if (!v28)
              v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSArray objectAtIndexedSubscript:](v5->_edgeLatencies, "objectAtIndexedSubscript:", objc_msgSend(v31, "unsignedIntegerValue"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v33);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v27);
    }
    else
    {
      v28 = 0;
    }

    if (objc_msgSend(v28, "count"))
    {
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v28);
      currentLatencyMap = v5->_currentLatencyMap;
      v5->_currentLatencyMap = (NSArray *)v34;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NPNetworkInfo lastVisited](self, "lastVisited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SignatureLastVisited"));

  -[NPNetworkInfo lastUsed](self, "lastUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("NetworkLastUsed"));

  -[NPNetworkInfo edgeSelection](self, "edgeSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("EdgeSelection"));

  -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EdgeLatencies"));

  -[NPNetworkInfo probeRateLimit](self, "probeRateLimit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ProbeRateLimit"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[NPNetworkInfo lastFallbackReason](self, "lastFallbackReason"), CFSTR("LastFallbackReason"));
  v25 = v4;
  objc_msgSend(v4, "encodeBool:forKey:", -[NPNetworkInfo isProbeInProgress](self, "isProbeInProgress"), CFSTR("isProbeInProgress"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NPNetworkInfo currentLatencyMap](self, "currentLatencyMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          v19 = 0;
          while (1)
          {
            -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16 == v21)
              break;
            ++v19;
            -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            if (v19 >= v23)
              goto LABEL_14;
          }
          if (!v13)
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v24);

        }
LABEL_14:
        ;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v25, "encodeObject:forKey:", v13, CFSTR("CurrentLatencyMap"));
}

- (int64_t)compareLastVisited:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[NPNetworkInfo lastVisited](self, "lastVisited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastVisited");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSString)lastVisitedDesc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NPNetworkInfo lastVisited](self, "lastVisited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3578];
    -[NPNetworkInfo lastVisited](self, "lastVisited");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)lastUsedDesc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NPNetworkInfo lastUsed](self, "lastUsed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3578];
    -[NPNetworkInfo lastUsed](self, "lastUsed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)resortEdgeLatenciesUsingComparator:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPNetworkInfo setEdgeLatencies:](self, "setEdgeLatencies:", v5);
}

- (BOOL)isLatency:(id)a3 qualifiedForLatencyMap:(id)a4 parameters:(networkParameters *)a5 requireUniqueEdges:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  int var1;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "edgeIndex") == 0xFFFFFFFFLL
    || a5
    && (a5->var0 && objc_msgSend(v9, "TFOStatus") != 2
     || (var1 = a5->var1, var1 != objc_msgSend(v9, "probeNoTFOCookie")))
    || !objc_msgSend(v9, "isComplete:", 1))
  {
    v21 = 0;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = v10;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "probeEndpoint", v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "probeEndpoint");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqual:", v18) & 1) != 0)
          {

            goto LABEL_23;
          }
          if (v6)
          {
            v19 = objc_msgSend(v16, "edgeIndex");
            v20 = objc_msgSend(v9, "edgeIndex");

            if (v19 == v20)
              goto LABEL_23;
          }
          else
          {

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v13)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_23:

    v21 = v16 == 0;
    v10 = v23;
  }

  return v21;
}

- (void)rebuildLatencyMapWithViewSize:(id)a3 edgeCount:(unint64_t)a4 parameters:(networkParameters *)a5
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = objc_msgSend(v23, "unsignedIntegerValue");
  if (v8 >= a4)
    v9 = a4;
  else
    v9 = v8;
  -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (objc_msgSend(v10, "count"))
  {
    v12 = 0;
    while (1)
    {
      v13 = objc_msgSend(v11, "count");

      if (v13 >= v9)
        break;
      -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NPNetworkInfo isLatency:qualifiedForLatencyMap:parameters:requireUniqueEdges:](self, "isLatency:qualifiedForLatencyMap:parameters:requireUniqueEdges:", v15, v11, a5, 1))
      {
        if (!v11)
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v11, "addObject:", v15);
      }

      ++v12;
      -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 >= objc_msgSend(v10, "count"))
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:

  }
  if (v9 < objc_msgSend(v23, "unsignedIntegerValue"))
  {
    v16 = objc_msgSend(v23, "unsignedIntegerValue");
    -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v18 = 0;
      while (1)
      {
        v19 = objc_msgSend(v11, "count");

        if (v19 >= v16)
          break;
        -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[NPNetworkInfo isLatency:qualifiedForLatencyMap:parameters:requireUniqueEdges:](self, "isLatency:qualifiedForLatencyMap:parameters:requireUniqueEdges:", v21, v11, a5, 0))
        {
          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v11, "addObject:", v21);
        }

        ++v18;
        -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 >= objc_msgSend(v17, "count"))
          goto LABEL_22;
      }
    }
    else
    {
LABEL_22:

    }
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v11);
  -[NPNetworkInfo setCurrentLatencyMap:](self, "setCurrentLatencyMap:", v22);

}

- (void)mergeNewLatencies:(id)a3 usingComparator:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (!v18)
          goto LABEL_15;
        v19 = 0;
        while (1)
        {
          -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v20, "objectAtIndexedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v20) = objc_msgSend(v21, "isMatched:", v16);
          if ((v20 & 1) != 0)
            break;
          ++v19;
          -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v19 >= v23)
            goto LABEL_15;
        }
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NPNetworkInfo edgeLatencies](self, "edgeLatencies");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "setProbeCount:", objc_msgSend(v16, "probeCount") + objc_msgSend(v25, "probeCount"));
          objc_msgSend(v25, "creationDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setCreationDate:", v26);

          objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v19, v16);
        }
        else
        {
LABEL_15:
          objc_msgSend(v10, "addObject:", v16);
        }
        ++v15;
      }
      while (v15 != v13);
      v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v13 = v27;
    }
    while (v27);
  }

  objc_msgSend(v10, "sortedArrayUsingComparator:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPNetworkInfo setEdgeLatencies:](self, "setEdgeLatencies:", v28);

}

- (void)handleTFOFailedForAddressFamily:(unsigned __int8)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NPNetworkInfo edgeLatencies](self, "edgeLatencies", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "probeTFO"))
        {
          objc_msgSend(v9, "addressFamily");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "unsignedCharValue");

          if (v11 == v3)
            objc_msgSend(v9, "setTFOStatus:", 1);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (NSDate)lastVisited
{
  return self->_lastVisited;
}

- (void)setLastVisited:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisited, a3);
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsed, a3);
}

- (int64_t)lastFallbackReason
{
  return self->_lastFallbackReason;
}

- (void)setLastFallbackReason:(int64_t)a3
{
  self->_lastFallbackReason = a3;
}

- (BOOL)hasIPv6
{
  return self->_hasIPv6;
}

- (void)setHasIPv6:(BOOL)a3
{
  self->_hasIPv6 = a3;
}

- (NSArray)edgeLatencies
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEdgeLatencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)currentLatencyMap
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentLatencyMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)probeRateLimit
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProbeRateLimit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NPEdgeSelection)edgeSelection
{
  return (NPEdgeSelection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEdgeSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isProbeInProgress
{
  return self->_isProbeInProgress;
}

- (void)setIsProbeInProgress:(BOOL)a3
{
  self->_isProbeInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeSelection, 0);
  objc_storeStrong((id *)&self->_probeRateLimit, 0);
  objc_storeStrong((id *)&self->_currentLatencyMap, 0);
  objc_storeStrong((id *)&self->_edgeLatencies, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_lastVisited, 0);
}

@end
