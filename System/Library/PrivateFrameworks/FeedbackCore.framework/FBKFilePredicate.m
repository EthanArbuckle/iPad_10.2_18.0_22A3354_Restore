@implementation FBKFilePredicate

+ (id)entityName
{
  return CFSTR("FilePredicate");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  void *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("enhanced_logging_duration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[FBKFilePredicate setEnhancedLoggingDuration:](self, "setEnhancedLoggingDuration:", objc_msgSend(v5, "unsignedIntegerValue"));
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("enhanced_logging_retry_count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[FBKFilePredicate setEnhancedLoggingRetryCount:](self, "setEnhancedLoggingRetryCount:", objc_msgSend(v7, "unsignedIntegerValue"));
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("shows_consent_text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[FBKFilePredicate setShowsConsentText:](self, "setShowsConsentText:", objc_msgSend(v9, "BOOLValue"));
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("is_always_required"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePredicate setAlwaysRequired:](self, "setAlwaysRequired:", objc_msgSend(v10, "BOOLValue"));

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("requires_remote"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFilePredicate setRequiresRemote:](self, "setRequiresRemote:", objc_msgSend(v11, "BOOLValue"));

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("file_predicate_conditions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v21, "valueForKeyPath:", CFSTR("file_predicate_conditions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePredicate managedObjectContext](self, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFilePredicateCondition, "importFromJSONArray:intoContext:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePredicate setConditions:](self, "setConditions:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePredicate setConditions:](self, "setConditions:", v13);
  }

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("file_predicate_file_matchers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v21, "valueForKeyPath:", CFSTR("file_predicate_file_matchers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("file_matcher"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePredicate managedObjectContext](self, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFileMatcher, "importFromJSONArray:intoContext:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePredicate setMatchers:](self, "setMatchers:", v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFilePredicate setMatchers:](self, "setMatchers:", v17);
  }

}

- (BOOL)satisfiedBy:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  int v45;
  BOOL v46;
  id obj;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  FBKFilePredicate *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  int v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((-[FBKFilePredicate alwaysRequired](self, "alwaysRequired") & 1) != 0
    || (-[FBKFilePredicate conditions](self, "conditions"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        !v6))
  {
    v46 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBCED8];
    -[FBKFilePredicate conditions](self, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[FBKFilePredicate conditions](self, "conditions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v70;
      v14 = MEMORY[0x24BDBD1C0];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v70 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "questionTat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      }
      while (v12);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v56 = self;
    -[FBKFilePredicate conditions](self, "conditions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v51)
    {
      v50 = *(_QWORD *)v66;
      v17 = &off_24E155000;
      v18 = MEMORY[0x24BDBD1C8];
      v49 = v4;
      v55 = v9;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v66 != v50)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          objc_msgSend(v4, "bugForm");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "questionTat");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "questionWithRole:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v53 = v23;
            v54 = j;
            objc_msgSend(v4, "answerForQuestion:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = 0u;
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v52 = v24;
            objc_msgSend(v24, "values");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v62;
              do
              {
                v29 = 0;
                do
                {
                  if (*(_QWORD *)v62 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v29);
                  objc_msgSend(v20, "questionValue");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v30) = objc_msgSend(v30, "isEqualToString:", v31);

                  if ((_DWORD)v30)
                  {
                    objc_msgSend(v17[379], "model");
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v20, "questionTat");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "questionValue");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      -[FBKManagedFeedbackObject ID](v56, "ID");
                      v36 = v18;
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = objc_msgSend(v37, "intValue");
                      *(_DWORD *)buf = 138543874;
                      v75 = v34;
                      v76 = 2114;
                      v77 = v35;
                      v78 = 1024;
                      v79 = v38;
                      _os_log_debug_impl(&dword_21D9A9000, v32, OS_LOG_TYPE_DEBUG, "condition [%{public}@ = %{public}@] satisfied for predicate [%i]", buf, 0x1Cu);

                      v18 = v36;
                      v17 = &off_24E155000;
                      v9 = v55;

                    }
                    objc_msgSend(v20, "questionTat");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v33);

                  }
                  ++v29;
                }
                while (v27 != v29);
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
              }
              while (v27);
            }

            v4 = v49;
            v23 = v53;
            j = v54;
          }

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      }
      while (v51);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v9, "allKeys");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v58;
      while (2)
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v58 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(v9, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "BOOLValue");

          if (!v45)
          {
            v46 = 0;
            goto LABEL_41;
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
        if (v41)
          continue;
        break;
      }
    }
    v46 = 1;
LABEL_41:

  }
  return v46;
}

@end
