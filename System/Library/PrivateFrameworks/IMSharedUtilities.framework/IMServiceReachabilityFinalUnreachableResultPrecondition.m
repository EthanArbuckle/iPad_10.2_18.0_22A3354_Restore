@implementation IMServiceReachabilityFinalUnreachableResultPrecondition

+ (id)preconditionWithDictionary:(id)a3
{
  void *v3;
  IMServiceReachabilityFinalUnreachableResultPrecondition *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("FinalUnreachableResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(IMServiceReachabilityFinalUnreachableResultPrecondition);
    -[IMServiceReachabilityFinalUnreachableResultPrecondition setServiceName:](v4, "setServiceName:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)evaluateWithLatestResults:(id)a3 requestedServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMServiceReachabilityFinalUnreachableResultPrecondition serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    -[IMServiceReachabilityFinalUnreachableResultPrecondition serviceName](self, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMServiceReachabilityPrecondition _latestResultsForServiceName:fromLatestResults:](self, "_latestResultsForServiceName:fromLatestResults:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v18, "isFinal", (_QWORD)v21))
            {
              if (objc_msgSend(v18, "allAreReachable") && !objc_msgSend(v18, "error"))
              {

                v19 = 2;
                goto LABEL_19;
              }
            }
            else
            {
              v15 = 1;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);

        v19 = ~v15 & 1;
      }
      else
      {

        v19 = 1;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_19:

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
