@implementation _CDCachedPeopleSuggestion

- (BOOL)isValidForContext:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;

  v4 = a3;
  objc_msgSend(v4, "locationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPeopleSuggesterContext locationUUID](self->_context, "locationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6 || objc_msgSend(v5, "isEqual:", v6))
  {
    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPeopleSuggesterContext title](self->_context, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8 || objc_msgSend(v7, "isEqual:", v8))
    {
      objc_msgSend(v4, "seedContactIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPeopleSuggesterContext seedContactIdentifiers](self->_context, "seedContactIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10 || objc_msgSend(v9, "isEqual:", v10))
      {
        objc_msgSend(v4, "contactPrefix");
        v35 = objc_claimAutoreleasedReturnValue();
        +[_CDPeopleSuggester restrictedPrefixForPrefix:](_CDPeopleSuggester, "restrictedPrefixForPrefix:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDPeopleSuggesterContext contactPrefix](self->_context, "contactPrefix");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDPeopleSuggester restrictedPrefixForPrefix:](_CDPeopleSuggester, "restrictedPrefixForPrefix:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v11;
        if (v11 == v12 || objc_msgSend(v11, "isEqual:", v12))
        {
          v33 = v9;
          v34 = v12;
          objc_msgSend(v4, "consumerIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDPeopleSuggesterContext consumerIdentifier](self->_context, "consumerIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 == v14 || objc_msgSend(v13, "isEqual:", v14))
          {
            v31 = v10;
            v32 = v14;
            objc_msgSend(v4, "nearbyPeople");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDPeopleSuggesterContext nearbyPeople](self->_context, "nearbyPeople");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v15;
            if (v15 == v16 || objc_msgSend(v15, "isEqual:", v16))
            {
              v29 = v16;
              objc_msgSend(v4, "activeInteraction");
              v17 = objc_claimAutoreleasedReturnValue();
              -[_CDPeopleSuggesterContext activeInteraction](self->_context, "activeInteraction");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)v17;
              v20 = (void *)v18;
              if (v19 == (void *)v18 || (v21 = v19, v22 = objc_msgSend(v19, "isEqual:", v18), v19 = v21, v22))
              {
                v21 = v19;
                objc_msgSend(v4, "contentUTIs", v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[_CDPeopleSuggesterContext contentUTIs](self->_context, "contentUTIs");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23 == v24)
                  v25 = 1;
                else
                  v25 = objc_msgSend(v23, "isEqual:", v24);

                v26 = (void *)v35;
                v20 = v28;
              }
              else
              {
                v25 = 0;
                v26 = (void *)v35;
              }

              v16 = v29;
            }
            else
            {
              v25 = 0;
              v26 = (void *)v35;
            }

            v10 = v31;
            v14 = v32;
          }
          else
          {
            v25 = 0;
            v26 = (void *)v35;
          }

          v9 = v33;
          v12 = v34;
        }
        else
        {
          v25 = 0;
          v26 = (void *)v35;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)isValidForSettings:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = objc_msgSend(v4, "maxNumberOfPeopleSuggested");
  if (v5 >= -[_CDPeopleSuggesterSettings maxNumberOfPeopleSuggested](self->_settings, "maxNumberOfPeopleSuggested"))
  {
    objc_msgSend(v4, "constrainAccounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPeopleSuggesterSettings constrainAccounts](self->_settings, "constrainAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8 || objc_msgSend(v7, "isEqual:", v8))
    {
      objc_msgSend(v4, "constrainBundleIds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPeopleSuggesterSettings constrainBundleIds](self->_settings, "constrainBundleIds");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10 || objc_msgSend(v9, "isEqual:", v10))
      {
        objc_msgSend(v4, "constrainDomainIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDPeopleSuggesterSettings constrainDomainIdentifiers](self->_settings, "constrainDomainIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12 || objc_msgSend(v11, "isEqual:", v12))
        {
          objc_msgSend(v4, "constrainMechanisms");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDPeopleSuggesterSettings constrainMechanisms](self->_settings, "constrainMechanisms");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 == v14 || objc_msgSend(v13, "isEqual:", v14))
          {
            v37 = v11;
            v38 = v14;
            objc_msgSend(v4, "constrainIdentifiers");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDPeopleSuggesterSettings constrainIdentifiers](self->_settings, "constrainIdentifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15 == v16 || objc_msgSend(v15, "isEqual:", v16))
            {
              v35 = v12;
              v36 = v16;
              objc_msgSend(v4, "constrainPersonIds");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[_CDPeopleSuggesterSettings constrainPersonIds](self->_settings, "constrainPersonIds");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17 == v18 || objc_msgSend(v17, "isEqual:", v18))
              {
                v33 = v9;
                v34 = v18;
                objc_msgSend(v4, "constrainPersonIdType");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[_CDPeopleSuggesterSettings constrainPersonIdType](self->_settings, "constrainPersonIdType");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19 == v20 || objc_msgSend(v19, "isEqual:", v20))
                {
                  v31 = v13;
                  v32 = v20;
                  v21 = objc_msgSend(v4, "useTitleToContrainKeywords");
                  if (v21 == -[_CDPeopleSuggesterSettings useTitleToContrainKeywords](self->_settings, "useTitleToContrainKeywords"))
                  {
                    objc_msgSend(v4, "ignoreContactIdentifiers");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_CDPeopleSuggesterSettings ignoreContactIdentifiers](self->_settings, "ignoreContactIdentifiers");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = v22;
                    if ((v22 == v23 || objc_msgSend(v22, "isEqual:", v23))
                      && (v24 = objc_msgSend(v4, "useFuture"),
                          v24 == -[_CDPeopleSuggesterSettings useFuture](self->_settings, "useFuture"))
                      && (v25 = objc_msgSend(v4, "aggregateByIdentifier"),
                          v25 == -[_CDPeopleSuggesterSettings aggregateByIdentifier](self->_settings, "aggregateByIdentifier"))&& (v26 = objc_msgSend(v4, "requireOutgoingInteraction"), v26 == -[_CDPeopleSuggesterSettings requireOutgoingInteraction](self->_settings, "requireOutgoingInteraction"))&& (v27 = objc_msgSend(v4, "constrainMaxRecipientCount"), v27 == -[_CDPeopleSuggesterSettings constrainMaxRecipientCount](self->_settings, "constrainMaxRecipientCount")))
                    {
                      v28 = objc_msgSend(v4, "inferActiveInteractions");
                      v6 = v28 ^ -[_CDPeopleSuggesterSettings inferActiveInteractions](self->_settings, "inferActiveInteractions") ^ 1;
                    }
                    else
                    {
                      LOBYTE(v6) = 0;
                    }
                    v13 = v31;

                  }
                  else
                  {
                    LOBYTE(v6) = 0;
                    v13 = v31;
                  }
                  v20 = v32;
                }
                else
                {
                  LOBYTE(v6) = 0;
                }

                v9 = v33;
                v18 = v34;
              }
              else
              {
                LOBYTE(v6) = 0;
              }

              v12 = v35;
              v16 = v36;
            }
            else
            {
              LOBYTE(v6) = 0;
            }

            v11 = v37;
            v14 = v38;
          }
          else
          {
            LOBYTE(v6) = 0;
          }

        }
        else
        {
          LOBYTE(v6) = 0;
        }

      }
      else
      {
        LOBYTE(v6) = 0;
      }

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isValidForContext:(id)a3 settings:(id)a4 timeoutSeconds:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  NSObject *v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCachedPeopleSuggestion date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = fabs(v12);

  if (v13 >= a5)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_CDCachedPeopleSuggestion isValidForContext:settings:timeoutSeconds:].cold.1(v15, a5);

    goto LABEL_7;
  }
  if (!-[_CDCachedPeopleSuggestion isValidForContext:](self, "isValidForContext:", v8))
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v14 = -[_CDCachedPeopleSuggestion isValidForSettings:](self, "isValidForSettings:", v9);
LABEL_8:

  return v14;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_CDPeopleSuggesterContext)context
{
  return (_CDPeopleSuggesterContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_CDPeopleSuggesterSettings)settings
{
  return (_CDPeopleSuggesterSettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)suggestions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)isValidForContext:(os_log_t)log settings:(double)a2 timeoutSeconds:.cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "_CDPeopleSuggester: cache timeout. diff > %f sec", (uint8_t *)&v2, 0xCu);
}

@end
