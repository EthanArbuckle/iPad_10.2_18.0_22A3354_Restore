@implementation CalAppleConferenceFormat

+ (id)calBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
}

+ (id)calConferenceSerializationHandle
{
  if (calConferenceSerializationHandle_onceToken != -1)
    dispatch_once(&calConferenceSerializationHandle_onceToken, &__block_literal_global_10);
  return (id)calConferenceSerializationHandle_logHandle;
}

void __60__CalAppleConferenceFormat_calConferenceSerializationHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.calendarFoundation", "appleConferenceSerialization");
  v1 = (void *)calConferenceSerializationHandle_logHandle;
  calConferenceSerializationHandle_logHandle = (uint64_t)v0;

}

- (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[16];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "joinMethods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v47 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("----( "), v6, CFSTR(")----"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v9, "addObject:");
    objc_msgSend(v5, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("["), v13, CFSTR("]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v9, "addObject:", v14);

      -[NSObject addObject:](v9, "addObject:", &stru_1E2A86598);
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v5, "joinMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v49;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v19);
          objc_msgSend(v20, "title");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          v23 = objc_msgSend(v20, "isBroadcast");
          if (v22)
            v24 = v23 == 0;
          else
            v24 = 1;
          if (!v24)
          {
            v26 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v20, "title");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("%@%@%@ %@%@%@"), CFSTR("["), v27, CFSTR("]"), CFSTR("("), CFSTR("Broadcast"), CFSTR(")"));
            goto LABEL_16;
          }
          if (v22)
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v20, "title");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("["), v27, CFSTR("]"), v43, v44, v45);
LABEL_16:
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v9, "addObject:", v28);

LABEL_17:
            goto LABEL_18;
          }
          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("("), CFSTR("Broadcast"), CFSTR(")"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v9, "addObject:", v27);
            goto LABEL_17;
          }
LABEL_18:
          objc_msgSend(v20, "URL");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "absoluteString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v9, "addObject:", v30);

          objc_msgSend(v5, "joinMethods");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "lastObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v20, "isEqual:", v32);

          if ((v33 & 1) == 0)
            -[NSObject addObject:](v9, "addObject:", &stru_1E2A86598);
          ++v19;
        }
        while (v17 != v19);
        v34 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        v17 = v34;
      }
      while (v34);
    }

    objc_msgSend(v5, "conferenceDetails");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    if (v36)
    {
      -[NSObject addObject:](v9, "addObject:", &stru_1E2A86598);
      objc_msgSend((id)objc_opt_class(), "calBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Details"), &stru_1E2A86598, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("---( "), v38, CFSTR(")---"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v9, "addObject:", v39);
      -[NSObject addObject:](v9, "addObject:", &stru_1E2A86598);
      objc_msgSend(v5, "conferenceDetails");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v9, "addObject:", v40);

    }
    -[NSObject addObject:](v9, "addObject:", CFSTR("---===---"));
    -[NSObject componentsJoinedByString:](v9, "componentsJoinedByString:", CFSTR("\n"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v47;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "calConferenceSerializationHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC12000, v9, OS_LOG_TYPE_DEFAULT, "Conference has no joinMethods but at least 1 is required for serializing", buf, 2u);
    }
    v41 = 0;
  }

  return v41;
}

- (id)deserializeConferences:(id)a3
{
  id v4;
  id v5;
  StateData *v6;
  uint64_t v7;
  StateData *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  StateData *v15;
  CalAppleConferenceFormat *v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "length"))
  {
    v6 = objc_alloc_init(StateData);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v7 = objc_msgSend(v4, "length");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__CalAppleConferenceFormat_deserializeConferences___block_invoke;
    v14[3] = &unk_1E2A845E8;
    v8 = v6;
    v15 = v8;
    v16 = self;
    v19 = v20;
    v17 = v4;
    v9 = v5;
    v18 = v9;
    objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 0, v14);
    if (-[StateData state](v8, "state") == 8)
    {
      objc_msgSend((id)objc_opt_class(), "_buildDeserializationResultFromState:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
    v11 = v18;
    v12 = v9;

    _Block_object_dispose(v20, 8);
  }

  return v5;
}

void __51__CalAppleConferenceFormat_deserializeConferences___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10;
  void *v11;
  void *v12;
  CalVirtualConferenceJoinMethod *v13;
  void *v14;
  void *v15;
  CalVirtualConferenceJoinMethod *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  CalVirtualConferenceJoinMethod *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CalVirtualConferenceJoinMethod *v29;
  void *v30;
  void *v31;
  CalVirtualConferenceJoinMethod *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  int v41;
  _QWORD v42[4];
  CalVirtualConferenceJoinMethod *v43;
  uint8_t buf[8];
  uint64_t v45;

  v10 = a2;
  switch(objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    case 0:
      *(_QWORD *)buf = 0;
      v45 = 0;
      v11 = (void *)objc_opt_class();
      objc_msgSend((id)objc_opt_class(), "_startDelimiterRegex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "_line:matchesRegex:outFoundRange:", v10, v12, buf);

      if ((_DWORD)v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "setStartRange:", *(_QWORD *)buf + a3, v45);
        objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
        objc_msgSend((id)objc_opt_class(), "_parseBlockTitle:state:", v10, *(_QWORD *)(a1 + 32));
      }
      goto LABEL_47;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "setConferenceTitle:", 0);
      v18 = objc_msgSend(v10, "hasPrefix:", CFSTR("["));
      v19 = objc_msgSend(v10, "hasPrefix:", CFSTR("("));
      if ((v18 & 1) == 0 && !v19)
        goto LABEL_8;
      v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(void **)(a1 + 48);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __51__CalAppleConferenceFormat_deserializeConferences___block_invoke_2;
      v42[3] = &unk_1E2A845C0;
      v32 = v35;
      v43 = v32;
      objc_msgSend(v36, "enumerateLinesUsingBlock:", v42);
      if (v34 <= -[CalVirtualConferenceJoinMethod count](v32, "count") - 1)
      {
        if (v18
          && (-[CalVirtualConferenceJoinMethod objectAtIndexedSubscript:](v32, "objectAtIndexedSubscript:", v34),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = objc_msgSend(v40, "isEqualToString:", &stru_1E2A86598),
              v40,
              v41))
        {
          objc_msgSend((id)objc_opt_class(), "_parseConferenceTitle:state:", v10, *(_QWORD *)(a1 + 32));
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_parseJoinMethodTitleAndFeatures:state:", v10, *(_QWORD *)(a1 + 32));
        }
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "calConferenceSerializationHandle");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC12000, v37, OS_LOG_TYPE_DEFAULT, "Input does not have enough lines to be a valid section", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "resetToNewSection");
      }

      goto LABEL_46;
    case 2:
      if (objc_msgSend(v10, "isEqualToString:", &stru_1E2A86598))
      {
        v20 = *(void **)(a1 + 32);
        v21 = 5;
        goto LABEL_18;
      }
      objc_msgSend((id)objc_opt_class(), "calConferenceSerializationHandle");
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      *(_WORD *)buf = 0;
      v39 = "Conference title was not followed by an empty line";
      goto LABEL_42;
    case 3:
      goto LABEL_8;
    case 4:
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("---===---")))
      {
        v13 = [CalVirtualConferenceJoinMethod alloc];
        objc_msgSend(*(id *)(a1 + 32), "joinMethodTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "joinMethodURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[CalVirtualConferenceJoinMethod initWithTitle:URL:isBroadcast:](v13, "initWithTitle:URL:isBroadcast:", v14, v15, objc_msgSend(*(id *)(a1 + 32), "joinMethodIsBroadcast"));

        objc_msgSend(*(id *)(a1 + 32), "joinMethods");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v16);

        objc_msgSend(*(id *)(a1 + 32), "setEndRange:", a5, a6);
        objc_msgSend(*(id *)(a1 + 32), "setState:", 8);
        goto LABEL_34;
      }
      if (objc_msgSend(v10, "isEqualToString:", &stru_1E2A86598))
      {
        v29 = [CalVirtualConferenceJoinMethod alloc];
        objc_msgSend(*(id *)(a1 + 32), "joinMethodTitle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "joinMethodURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[CalVirtualConferenceJoinMethod initWithTitle:URL:isBroadcast:](v29, "initWithTitle:URL:isBroadcast:", v30, v31, objc_msgSend(*(id *)(a1 + 32), "joinMethodIsBroadcast"));

        objc_msgSend(*(id *)(a1 + 32), "joinMethods");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v32);

        objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
LABEL_46:

        goto LABEL_47;
      }
      objc_msgSend((id)objc_opt_class(), "calConferenceSerializationHandle");
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      *(_WORD *)buf = 0;
      v39 = "URL was not followed by the end delimiter or an empty string";
      goto LABEL_42;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "setJoinMethodTitle:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setJoinMethodIsBroadcast:", 0);
      v22 = (void *)objc_opt_class();
      objc_msgSend((id)objc_opt_class(), "_detailsDelimiterRegex");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = objc_msgSend(v22, "_line:matchesRegex:outFoundRange:", v10, v23, 0);

      if ((_DWORD)v22)
      {
        v20 = *(void **)(a1 + 32);
        v21 = 6;
        goto LABEL_18;
      }
      if ((objc_msgSend(v10, "hasPrefix:", CFSTR("[")) & 1) != 0
        || objc_msgSend(v10, "hasPrefix:", CFSTR("(")))
      {
        objc_msgSend((id)objc_opt_class(), "_parseJoinMethodTitleAndFeatures:state:", v10, *(_QWORD *)(a1 + 32));
      }
      else
      {
LABEL_8:
        objc_msgSend((id)objc_opt_class(), "_parseURL:state:", v10, *(_QWORD *)(a1 + 32));
      }
      goto LABEL_47;
    case 6:
      if (objc_msgSend(v10, "isEqualToString:", &stru_1E2A86598))
      {
        v20 = *(void **)(a1 + 32);
        v21 = 7;
        goto LABEL_18;
      }
      objc_msgSend((id)objc_opt_class(), "calConferenceSerializationHandle");
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      *(_WORD *)buf = 0;
      v39 = "ConferenceDetails delimiter was not followed by an empty string";
      goto LABEL_42;
    case 7:
      v24 = objc_msgSend(v10, "isEqualToString:", CFSTR("---===---"));
      objc_msgSend(*(id *)(a1 + 32), "conferenceDetails");
      v25 = (CalVirtualConferenceJoinMethod *)objc_claimAutoreleasedReturnValue();
      v16 = v25;
      if (v24)
      {
        v26 = -[CalVirtualConferenceJoinMethod count](v25, "count");

        if (v26)
        {
          objc_msgSend(*(id *)(a1 + 32), "setEndRange:", a5, a6);
          v20 = *(void **)(a1 + 32);
          v21 = 8;
LABEL_18:
          objc_msgSend(v20, "setState:", v21);
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "calConferenceSerializationHandle");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v39 = "No conferenceDetails lines were found when end delimiter was hit, despite conferenceDetails delimiter being present";
LABEL_42:
            _os_log_impl(&dword_18FC12000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
          }
LABEL_43:

          objc_msgSend(*(id *)(a1 + 32), "resetToNewSection");
        }
      }
      else
      {
        -[CalVirtualConferenceJoinMethod addObject:](v25, "addObject:", v10);
LABEL_34:

      }
LABEL_47:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

      return;
    case 8:
      v27 = *(void **)(a1 + 56);
      objc_msgSend((id)objc_opt_class(), "_buildDeserializationResultFromState:", *(_QWORD *)(a1 + 32));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v28);

      goto LABEL_47;
    default:
      goto LABEL_47;
  }
}

uint64_t __51__CalAppleConferenceFormat_deserializeConferences___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (BOOL)supportsSerializingConferenceWithSource:(unint64_t)a3
{
  return a3 == 0;
}

+ (void)_parseURL:(id)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setJoinMethodURL:", v7);

  objc_msgSend(v6, "joinMethodURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "setState:", 4);
  }
  else
  {
    objc_msgSend(a1, "calConferenceSerializationHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC12000, v9, OS_LOG_TYPE_DEFAULT, "Url was invalid when parsed from string", v10, 2u);
    }

    objc_msgSend(v6, "resetToNewSection");
  }

}

+ (void)_parseBlockTitle:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_startDelimiterRegex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1
    && (objc_msgSend(v9, "firstObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "numberOfRanges"),
        v10,
        v11 == 2))
  {
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeWithName:", CFSTR("blockTitle"));
    objc_msgSend(v6, "substringWithRange:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBlockTitle:", v15);

  }
  else
  {
    objc_msgSend(a1, "calConferenceSerializationHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CalAppleConferenceFormat _parseBlockTitle:state:].cold.1(v16);

    objc_msgSend(v7, "setBlockTitle:", &stru_1E2A86598);
  }

}

+ (void)_parseConferenceTitle:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_conferenceTitleRegex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1
    && (objc_msgSend(v9, "firstObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "numberOfRanges"),
        v10,
        v11 == 2))
  {
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeWithName:", CFSTR("title"));
    objc_msgSend(v6, "substringWithRange:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConferenceTitle:", v15);

    objc_msgSend(v7, "setState:", 2);
  }
  else
  {
    objc_msgSend(a1, "calConferenceSerializationHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18FC12000, v16, OS_LOG_TYPE_DEFAULT, "Conference title didn't match title regex", v17, 2u);
    }

    objc_msgSend(v7, "resetToNewSection");
  }

}

+ (void)_parseJoinMethodTitleAndFeatures:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_joinMethodTitleAndFeaturesRegex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1
    && (objc_msgSend(v9, "firstObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "numberOfRanges"),
        v10,
        v11 > 1))
  {
    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "rangeWithName:", CFSTR("title"));
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "substringWithRange:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setJoinMethodTitle:", v16);

    }
    v17 = objc_msgSend(v13, "rangeWithName:", CFSTR("features"));
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "substringWithRange:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(","));
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v21)
      {
        v22 = v21;
        v30 = v19;
        v31 = v7;
        v23 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v33 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringByTrimmingCharactersInSet:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("Broadcast"));
            if (!v28)
            {
              v29 = 1;
              goto LABEL_19;
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v22)
            continue;
          break;
        }
        v29 = 0;
LABEL_19:
        v7 = v31;
        v19 = v30;
      }
      else
      {
        v29 = 0;
      }

      objc_msgSend(v7, "setJoinMethodIsBroadcast:", v29);
    }
    objc_msgSend(v7, "setState:", 3);

  }
  else
  {
    objc_msgSend(a1, "calConferenceSerializationHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC12000, v12, OS_LOG_TYPE_DEFAULT, "Join method title/features didn't match regex", buf, 2u);
    }

    objc_msgSend(v7, "resetToNewSection");
  }

}

+ (id)_buildDeserializationResultFromState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CalVirtualConference *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CalVirtualConference *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  CalConferenceDeserializationResult *v19;
  void *v20;
  CalConferenceDeserializationResult *v21;
  NSRange v23;
  NSRange v24;

  v3 = a3;
  objc_msgSend(v3, "conferenceDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conferenceDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  if (objc_msgSend(v5, "isEqualToString:", &stru_1E2A86598))
  {

    v5 = 0;
  }
  v7 = [CalVirtualConference alloc];
  objc_msgSend(v3, "conferenceTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v3, "joinMethods");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CalVirtualConference initWithTitle:joinMethods:conferenceDetails:source:isWritable:](v7, "initWithTitle:joinMethods:conferenceDetails:source:isWritable:", v8, v11, v5, 0, 1);

  objc_msgSend(v3, "joinMethods");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  v14 = objc_msgSend(v3, "startRange");
  v16 = v15;
  v24.location = objc_msgSend(v3, "endRange");
  v24.length = v17;
  v23.location = v14;
  v23.length = v16;
  v18 = NSUnionRange(v23, v24);
  v19 = [CalConferenceDeserializationResult alloc];
  objc_msgSend(v3, "blockTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CalConferenceDeserializationResult initWithConference:range:blockTitle:](v19, "initWithConference:range:blockTitle:", v12, v18.location, v18.length, v20);

  objc_msgSend(v3, "setState:", 0);
  return v21;
}

+ (BOOL)_line:(id)a3 matchesRegex:(id)a4 outFoundRange:(_NSRange *)a5
{
  id v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  v11 = v10;

  if (a5)
  {
    a5->location = v9;
    a5->length = v11;
  }
  return v9 != 0x7FFFFFFFFFFFFFFFLL || v11 != 0;
}

+ (id)_joinMethodTitleAndFeaturesRegex
{
  if (_joinMethodTitleAndFeaturesRegex_onceToken != -1)
    dispatch_once(&_joinMethodTitleAndFeaturesRegex_onceToken, &__block_literal_global_126);
  return (id)_joinMethodTitleAndFeaturesRegex_regex;
}

void __60__CalAppleConferenceFormat__joinMethodTitleAndFeaturesRegex__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(?:\\[(?<title>.*)\\])? ?(?:\\((?<features>.+)\\))?$"), 16, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_joinMethodTitleAndFeaturesRegex_regex;
  _joinMethodTitleAndFeaturesRegex_regex = v0;

}

+ (id)_conferenceTitleRegex
{
  if (_conferenceTitleRegex_onceToken != -1)
    dispatch_once(&_conferenceTitleRegex_onceToken, &__block_literal_global_130);
  return (id)_conferenceTitleRegex_regex;
}

void __49__CalAppleConferenceFormat__conferenceTitleRegex__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^\\[(?<title>.*)\\].*$"), 16, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_conferenceTitleRegex_regex;
  _conferenceTitleRegex_regex = v0;

}

+ (id)_startDelimiterRegex
{
  if (_startDelimiterRegex_onceToken != -1)
    dispatch_once(&_startDelimiterRegex_onceToken, &__block_literal_global_133);
  return (id)_startDelimiterRegex_regex;
}

void __48__CalAppleConferenceFormat__startDelimiterRegex__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR("----( "));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR(")----"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@(?<blockTitle>.*)%@$"), v1, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v5, 16, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_startDelimiterRegex_regex;
  _startDelimiterRegex_regex = v3;

}

+ (id)_detailsDelimiterRegex
{
  if (_detailsDelimiterRegex_onceToken != -1)
    dispatch_once(&_detailsDelimiterRegex_onceToken, &__block_literal_global_136);
  return (id)_detailsDelimiterRegex_regex;
}

void __50__CalAppleConferenceFormat__detailsDelimiterRegex__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR("---( "));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", CFSTR(")---"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("^%@.*%@$"), v1, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v5, 16, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_detailsDelimiterRegex_regex;
  _detailsDelimiterRegex_regex = v3;

}

+ (void)_parseBlockTitle:(os_log_t)log state:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Block title match not found despite regex matching line", v1, 2u);
}

@end
