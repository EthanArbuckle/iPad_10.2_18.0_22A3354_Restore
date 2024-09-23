@implementation MNTraceNavigationEventRecorder

- (MNTraceNavigationEventRecorder)initWithTraceRecorder:(id)a3
{
  id v5;
  MNTraceNavigationEventRecorder *v6;
  MNTraceNavigationEventRecorder *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)MNTraceNavigationEventRecorder,
        v6 = -[MNTraceNavigationEventRecorder init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_traceRecorder, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setLastMatchedLocation:(id)a3
{
  id v5;
  MNLocation *lastMatchedLocation;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  id v11;

  v5 = a3;
  lastMatchedLocation = self->_lastMatchedLocation;
  v11 = v5;
  if (lastMatchedLocation)
  {
    v7 = -[MNLocation state](lastMatchedLocation, "state");
    v5 = v11;
    v8 = v7 == 1;
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v5, "state") == 1;
  objc_storeStrong((id *)&self->_lastMatchedLocation, a3);
  v10 = v11;
  if (v8 != v9)
  {
    if (objc_msgSend(v11, "state") == 1)
      -[MNTraceNavigationEventRecorder _userGotOnRoute](self, "_userGotOnRoute");
    else
      -[MNTraceNavigationEventRecorder _userWentOffRoute](self, "_userWentOffRoute");
    v10 = v11;
  }

}

- (void)_recordDebugSettings
{
  void *v3;
  int HasValue;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v87;
  id v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HasValue = _GEOConfigHasValue();
  v5 = MEMORY[0x1E0C809B0];
  if (HasValue)
  {
    v84 = MEMORY[0x1E0C809B0];
    v85 = 3221225472;
    v86 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke;
    v87 = &unk_1E61D7778;
    v88 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v79 = v5;
    v80 = 3221225472;
    v81 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_2;
    v82 = &unk_1E61D7778;
    v83 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v74 = v5;
    v75 = 3221225472;
    v76 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_3;
    v77 = &unk_1E61D7778;
    v78 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v69 = v5;
    v70 = 3221225472;
    v71 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_4;
    v72 = &unk_1E61D7778;
    v73 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v64 = v5;
    v65 = 3221225472;
    v66 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_5;
    v67 = &unk_1E61D7778;
    v68 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v59 = v5;
    v60 = 3221225472;
    v61 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_6;
    v62 = &unk_1E61D7778;
    v63 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v54 = v5;
    v55 = 3221225472;
    v56 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_7;
    v57 = &unk_1E61D7778;
    v58 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v49 = v5;
    v50 = 3221225472;
    v51 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_8;
    v52 = &unk_1E61D7778;
    v53 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v44 = v5;
    v45 = 3221225472;
    v46 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_9;
    v47 = &unk_1E61D7778;
    v48 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v39 = v5;
    v40 = 3221225472;
    v41 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_10;
    v42 = &unk_1E61D7778;
    v43 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v34 = v5;
    v35 = 3221225472;
    v36 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_11;
    v37 = &unk_1E61D7778;
    v38 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v29 = v5;
    v30 = 3221225472;
    v31 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_12;
    v32 = &unk_1E61D7778;
    v33 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v24 = v5;
    v25 = 3221225472;
    v26 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_13;
    v27 = &unk_1E61D7778;
    v28 = v3;
    GEOConfigGetPropertiesForKey();

  }
  if (_GEOConfigHasValue())
  {
    v19 = v5;
    v20 = 3221225472;
    v21 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_14;
    v22 = &unk_1E61D7778;
    v23 = v3;
    GEOConfigGetPropertiesForKey();

  }
  objc_msgSend(v3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v89, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v13, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTraceRecorder recordDebugSetting:settingValue:](self->_traceRecorder, "recordDebugSetting:settingValue:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v89, 16);
    }
    while (v10);
  }

}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_14(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_msgSend(a5, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (void)_recordEvent:(int64_t)a3 description:(id)a4
{
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    MNTraceNavigationEventTypeAsString(a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6)
      v10 = v6;
    else
      v10 = &stru_1E61D9090;
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "Recording event [%@] %@", (uint8_t *)&v12, 0x16u);

  }
  if (v6)
    v11 = v6;
  else
    v11 = &stru_1E61D9090;
  -[MNTraceRecorder recordNavigationEvent:forLocation:description:](self->_traceRecorder, "recordNavigationEvent:forLocation:description:", a3, self->_lastMatchedLocation, v11);

}

- (void)_userGotOnRoute
{
  NSError *previousSuppressedRerouteError;

  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 5, 0);
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;

}

- (void)_userWentOffRoute
{
  unint64_t v3;
  const __CFString *v4;

  v3 = -[MNLocation state](self->_lastMatchedLocation, "state");
  if (v3 == 2)
  {
    v4 = CFSTR("on road");
  }
  else
  {
    if (v3)
      return;
    v4 = CFSTR("off road");
  }
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 6, v4);
}

- (id)_descriptionForWaypoint:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "geoMapItem");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "geoMapItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "contactAddressType"),
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "navDisplayNameWithSpecialContacts:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navDisplayNameWithSpecialContacts:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navDisplayAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%@) | %@"), v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "navDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navDisplayAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ | %@"), v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_stringForSignDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
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

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "junction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "junction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "maneuverType");
    v8 = CFSTR("NO_TURN");
    switch((int)v7)
    {
      case 0:
        break;
      case 1:
        v8 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v8 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v8 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v8 = CFSTR("U_TURN");
        break;
      case 5:
        v8 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v8 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v8 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 11:
        v8 = CFSTR("OFF_RAMP");
        break;
      case 12:
        v8 = CFSTR("ON_RAMP");
        break;
      case 16:
        v8 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 17:
        v8 = CFSTR("START_ROUTE");
        break;
      case 18:
        v8 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 20:
        v8 = CFSTR("KEEP_LEFT");
        break;
      case 21:
        v8 = CFSTR("KEEP_RIGHT");
        break;
      case 22:
        v8 = CFSTR("ENTER_FERRY");
        break;
      case 23:
        v8 = CFSTR("EXIT_FERRY");
        break;
      case 24:
        v8 = CFSTR("CHANGE_FERRY");
        break;
      case 25:
        v8 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 26:
        v8 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 27:
        v8 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 28:
        v8 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 29:
        v8 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 30:
        v8 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 33:
        v8 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 34:
        v8 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 35:
        v8 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 39:
        v8 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 41:
        v8 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 42:
        v8 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 43:
        v8 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 44:
        v8 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 45:
        v8 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 46:
        v8 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 47:
        v8 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 48:
        v8 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 49:
        v8 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 50:
        v8 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 51:
        v8 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 52:
        v8 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 53:
        v8 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 54:
        v8 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 55:
        v8 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 56:
        v8 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 57:
        v8 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 58:
        v8 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 59:
        v8 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 60:
        v8 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 61:
        v8 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 62:
        v8 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 63:
        v8 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 64:
        v8 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 65:
        v8 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 66:
        v8 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 80:
        v8 = CFSTR("TOLL_STATION");
        break;
      case 81:
        v8 = CFSTR("ENTER_TUNNEL");
        break;
      case 82:
        v8 = CFSTR("WAYPOINT_STOP");
        break;
      case 83:
        v8 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 84:
        v8 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 85:
        v8 = CFSTR("RESUME_ROUTE");
        break;
      case 86:
        v8 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 87:
        v8 = CFSTR("CUSTOM");
        break;
      case 88:
        v8 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }

    -[__CFString capitalizedString](v8, "capitalizedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_1E61D9090);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "appendFormat:", CFSTR("(%@)"), v10);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryStrings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "optionsWithArgumentHandler:", &__block_literal_global_39);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithOptions:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v11, "addObject:", v15);
  objc_msgSend(v3, "secondaryStrings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "optionsWithArgumentHandler:", &__block_literal_global_26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCreateAttributedString:", 1);
  objc_msgSend(v17, "stringWithOptions:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v11, "addObject:", v19);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" | "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v20);

  return v4;
}

void __60__MNTraceNavigationEventRecorder__stringForSignDescription___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "distanceFormat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFormatOptions:", 1);

}

void __60__MNTraceNavigationEventRecorder__stringForSignDescription___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "artworkFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedStringHandler:", &__block_literal_global_28);

  objc_msgSend(v2, "distanceFormat");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFormatOptions:", 1);
}

id __60__MNTraceNavigationEventRecorder__stringForSignDescription___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);

  return v5;
}

- (id)_descriptionForARInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v3, "arrowLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "maneuverType");
  v7 = CFSTR("NO_TURN");
  switch((int)v6)
  {
    case 0:
      break;
    case 1:
      v7 = CFSTR("LEFT_TURN");
      break;
    case 2:
      v7 = CFSTR("RIGHT_TURN");
      break;
    case 3:
      v7 = CFSTR("STRAIGHT_AHEAD");
      break;
    case 4:
      v7 = CFSTR("U_TURN");
      break;
    case 5:
      v7 = CFSTR("FOLLOW_ROAD");
      break;
    case 6:
      v7 = CFSTR("ENTER_ROUNDABOUT");
      break;
    case 7:
      v7 = CFSTR("EXIT_ROUNDABOUT");
      break;
    case 11:
      v7 = CFSTR("OFF_RAMP");
      break;
    case 12:
      v7 = CFSTR("ON_RAMP");
      break;
    case 16:
      v7 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      break;
    case 17:
      v7 = CFSTR("START_ROUTE");
      break;
    case 18:
      v7 = CFSTR("ARRIVE_AT_DESTINATION");
      break;
    case 20:
      v7 = CFSTR("KEEP_LEFT");
      break;
    case 21:
      v7 = CFSTR("KEEP_RIGHT");
      break;
    case 22:
      v7 = CFSTR("ENTER_FERRY");
      break;
    case 23:
      v7 = CFSTR("EXIT_FERRY");
      break;
    case 24:
      v7 = CFSTR("CHANGE_FERRY");
      break;
    case 25:
      v7 = CFSTR("START_ROUTE_WITH_U_TURN");
      break;
    case 26:
      v7 = CFSTR("U_TURN_AT_ROUNDABOUT");
      break;
    case 27:
      v7 = CFSTR("LEFT_TURN_AT_END");
      break;
    case 28:
      v7 = CFSTR("RIGHT_TURN_AT_END");
      break;
    case 29:
      v7 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      break;
    case 30:
      v7 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      break;
    case 33:
      v7 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      break;
    case 34:
      v7 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      break;
    case 35:
      v7 = CFSTR("U_TURN_WHEN_POSSIBLE");
      break;
    case 39:
      v7 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      break;
    case 41:
      v7 = CFSTR("ROUNDABOUT_EXIT_1");
      break;
    case 42:
      v7 = CFSTR("ROUNDABOUT_EXIT_2");
      break;
    case 43:
      v7 = CFSTR("ROUNDABOUT_EXIT_3");
      break;
    case 44:
      v7 = CFSTR("ROUNDABOUT_EXIT_4");
      break;
    case 45:
      v7 = CFSTR("ROUNDABOUT_EXIT_5");
      break;
    case 46:
      v7 = CFSTR("ROUNDABOUT_EXIT_6");
      break;
    case 47:
      v7 = CFSTR("ROUNDABOUT_EXIT_7");
      break;
    case 48:
      v7 = CFSTR("ROUNDABOUT_EXIT_8");
      break;
    case 49:
      v7 = CFSTR("ROUNDABOUT_EXIT_9");
      break;
    case 50:
      v7 = CFSTR("ROUNDABOUT_EXIT_10");
      break;
    case 51:
      v7 = CFSTR("ROUNDABOUT_EXIT_11");
      break;
    case 52:
      v7 = CFSTR("ROUNDABOUT_EXIT_12");
      break;
    case 53:
      v7 = CFSTR("ROUNDABOUT_EXIT_13");
      break;
    case 54:
      v7 = CFSTR("ROUNDABOUT_EXIT_14");
      break;
    case 55:
      v7 = CFSTR("ROUNDABOUT_EXIT_15");
      break;
    case 56:
      v7 = CFSTR("ROUNDABOUT_EXIT_16");
      break;
    case 57:
      v7 = CFSTR("ROUNDABOUT_EXIT_17");
      break;
    case 58:
      v7 = CFSTR("ROUNDABOUT_EXIT_18");
      break;
    case 59:
      v7 = CFSTR("ROUNDABOUT_EXIT_19");
      break;
    case 60:
      v7 = CFSTR("SHARP_LEFT_TURN");
      break;
    case 61:
      v7 = CFSTR("SHARP_RIGHT_TURN");
      break;
    case 62:
      v7 = CFSTR("SLIGHT_LEFT_TURN");
      break;
    case 63:
      v7 = CFSTR("SLIGHT_RIGHT_TURN");
      break;
    case 64:
      v7 = CFSTR("CHANGE_HIGHWAY");
      break;
    case 65:
      v7 = CFSTR("CHANGE_HIGHWAY_LEFT");
      break;
    case 66:
      v7 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      break;
    case 80:
      v7 = CFSTR("TOLL_STATION");
      break;
    case 81:
      v7 = CFSTR("ENTER_TUNNEL");
      break;
    case 82:
      v7 = CFSTR("WAYPOINT_STOP");
      break;
    case 83:
      v7 = CFSTR("WAYPOINT_STOP_LEFT");
      break;
    case 84:
      v7 = CFSTR("WAYPOINT_STOP_RIGHT");
      break;
    case 85:
      v7 = CFSTR("RESUME_ROUTE");
      break;
    case 86:
      v7 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      break;
    case 87:
      v7 = CFSTR("CUSTOM");
      break;
    case 88:
      v7 = CFSTR("TURN_AROUND");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@ | %@]"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationCoordinate");
  if (v11 >= -180.0 && v11 <= 180.0 && v10 >= -90.0 && v10 <= 90.0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "locationCoordinate");
    v14 = v13;
    objc_msgSend(v3, "locationCoordinate");
    v16 = v15;
    objc_msgSend(v3, "locationCoordinate");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%f, %f | %dm"), v14, v16, (int)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

  }
  objc_msgSend(v3, "heading");
  if (v19 >= 0.0)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "heading");
    LODWORD(v22) = llround(v21);
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%d°"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v23);

  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" | "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" (%@)"), v24);

  }
  return v8;
}

- (void)_didUpdateArrivalInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "vehicleParkingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v17, "vehicleParkingInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "walkingRouteDisplayETAInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v17, "vehicleParkingInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "walkingRouteDisplayETAInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remainingMinutesToEndOfRoute");

      GEOStringForDuration();
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR("(none)");
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_msgSend(v17, "arrivalState");
    if (v14 > 6)
      v15 = CFSTR("MNArrivalState_Unknown");
    else
      v15 = off_1E61D7800[v14];
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, leg: %d, walking duration: %@"), v15, objc_msgSend(v17, "legIndex"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_msgSend(v17, "arrivalState");
    if (v11 > 6)
      v12 = CFSTR("MNArrivalState_Unknown");
    else
      v12 = off_1E61D7800[v11];
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@, leg: %d"), v12, objc_msgSend(v17, "legIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 18, v16);

}

- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  MNTraceRecorder *traceRecorder;
  void *v22;
  id v23;

  v7 = a7;
  v8 = a6;
  objc_msgSend(a4, "route", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  if (v7)
  {
    -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 2, 0);
  }
  else
  {
    objc_msgSend(v11, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37A0];
    v14 = objc_msgSend(v23, "transportType");
    if (v14 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E61D7888[(int)v14];
    }
    -[__CFString capitalizedString](v15, "capitalizedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a5 - 1) > 3)
      v17 = CFSTR("None");
    else
      v17 = off_1E61D7838[a5 - 1];
    objc_msgSend(v12, "humanDescriptionWithAddressAndLatLng");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@ to [%@] via %@"), v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v20, "appendFormat:", CFSTR(", isResumingMultipointRoute: %d"), 1);
    -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 1, v20);
    -[MNTraceNavigationEventRecorder _recordDebugSettings](self, "_recordDebugSettings");
    traceRecorder = self->_traceRecorder;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceRecorder setNavigationStartDate:](traceRecorder, "setNavigationStartDate:", v22);

  }
}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  uint64_t v6;
  id v7;

  if (a4 == -1)
    v6 = 0xFFFFFFFFLL;
  else
    v6 = (a4 + 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Step #%d (step index: %d, segment index: %d)"), v6, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 7, v7);

}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  const __CFString *v7;
  id v8;

  if (a6 - 1 > 5)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E61D7858[a6 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("From waypoint: %d reason: %@"), a4, a5, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 19, v8);

}

- (void)navigationSession:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 8, v5);

}

- (void)navigationSession:(id)a3 didSuppressReroute:(id)a4
{
  id v6;
  NSError *previousSuppressedRerouteError;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
    if (!previousSuppressedRerouteError
      || (v8 = -[NSError code](previousSuppressedRerouteError, "code"), v8 != objc_msgSend(v6, "code")))
    {
      objc_msgSend(v6, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 11, v10);

      objc_storeStrong((id *)&self->_previousSuppressedRerouteError, a4);
    }
  }

}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSError *previousSuppressedRerouteError;
  id v19;

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a4;
  objc_msgSend(v10, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7 - 1 > 0xE)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E61D78C0[a7 - 1];
  objc_msgSend(v10, "route");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serverRouteID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "route");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "uniqueRouteID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ | %@ | %@ | %@"), v12, v13, v15, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 12, v19);
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;

}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSError *previousSuppressedRerouteError;
  id v20;
  id v21;

  v7 = *(_QWORD *)&a4;
  v20 = (id)MEMORY[0x1E0CB3940];
  v9 = a5;
  objc_msgSend(v9, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E61D7888[(int)v7];
  }
  -[__CFString capitalizedString](v12, "capitalizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 - 1 > 0xE)
    v14 = CFSTR("Unknown");
  else
    v14 = off_1E61D78C0[a6 - 1];
  objc_msgSend(v9, "route");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serverRouteID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "route");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "uniqueRouteID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ | ChangedTransportType: %@ | %@ | %@ | %@"), v11, v13, v14, v16, v18);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 12, v21);
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;

}

- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MNTraceNavigationEventRecorder *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v19 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "route");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "route");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueRouteID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v14, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v17);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    self = v19;
    v5 = v20;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 13, v18);

}

- (void)navigationSession:(id)a3 didUpdateDestination:(id)a4
{
  id v5;

  -[MNTraceNavigationEventRecorder _descriptionForWaypoint:](self, "_descriptionForWaypoint:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 14, v5);

}

- (void)navigationSession:(id)a3 didRerouteWithWaypoints:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[MNTraceNavigationEventRecorder _descriptionForWaypoint:](self, "_descriptionForWaypoint:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 15, v13);

}

- (void)navigationSession:(id)a3 didInsertWaypoint:(id)a4
{
  id v5;

  -[MNTraceNavigationEventRecorder _descriptionForWaypoint:](self, "_descriptionForWaypoint:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 16, v5);

}

- (void)navigationSession:(id)a3 didRemoveWaypoint:(id)a4
{
  id v5;

  -[MNTraceNavigationEventRecorder _descriptionForWaypoint:](self, "_descriptionForWaypoint:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 17, v5);

}

- (void)navigationSession:(id)a3 didAnnounce:(id)a4 stage:(unint64_t)a5
{
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 21, a4, a5);
}

- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4
{
  void *v5;
  void *v6;
  NSUUID *currentPrimarySignID;
  unint64_t v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSUUID *v14;
  NSUUID *v15;
  void *v16;
  void *v17;
  NSUUID *currentSecondarySignID;
  unint64_t v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSUUID *v25;
  NSUUID *v26;
  id v27;

  v27 = a4;
  objc_msgSend(v27, "primarySign");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  currentPrimarySignID = self->_currentPrimarySignID;
  v8 = v6;
  v9 = currentPrimarySignID;
  if (v8 | (unint64_t)v9)
  {
    v10 = v9;
    v11 = objc_msgSend((id)v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v27, "primarySign");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceNavigationEventRecorder _stringForSignDescription:](self, "_stringForSignDescription:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 22, v13);
      objc_msgSend(v5, "uniqueID");
      v14 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v15 = self->_currentPrimarySignID;
      self->_currentPrimarySignID = v14;

    }
  }
  objc_msgSend(v27, "secondarySign");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  currentSecondarySignID = self->_currentSecondarySignID;
  v19 = v17;
  v20 = currentSecondarySignID;
  if (v19 | (unint64_t)v20)
  {
    v21 = v20;
    v22 = objc_msgSend((id)v19, "isEqual:", v20);

    if ((v22 & 1) == 0)
    {
      if (v16)
      {
        objc_msgSend(v27, "secondarySign");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTraceNavigationEventRecorder _stringForSignDescription:](self, "_stringForSignDescription:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 23, v24);
      }
      else
      {
        -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 24, 0);
      }
      objc_msgSend(v16, "uniqueID");
      v25 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v26 = self->_currentSecondarySignID;
      self->_currentSecondarySignID = v25;

    }
  }

}

- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7 == -[NSArray count](self->_lastARInfos, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_lastARInfos, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "guidanceEventID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "guidanceEventID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10;
        v14 = v12;
        if (v13 | v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend((id)v13, "isEqual:", v14);

          if ((v16 & 1) == 0)
            goto LABEL_9;
        }
        else
        {

        }
        ++v8;
      }
      while (v8 < objc_msgSend(v6, "count"));
    }
  }
  else
  {
LABEL_9:
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__MNTraceNavigationEventRecorder_navigationSession_updateSignsWithARInfo___block_invoke;
    v19[3] = &unk_1E61D77E0;
    v19[4] = self;
    objc_msgSend(v6, "_geo_map:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" /// "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 29, v18);
    objc_storeStrong((id *)&self->_lastARInfos, a4);

  }
}

uint64_t __74__MNTraceNavigationEventRecorder_navigationSession_updateSignsWithARInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_descriptionForARInfo:", a2);
}

- (void)navigationSession:(id)a3 showLaneDirections:(id)a4
{
  void *v5;
  NSUUID *laneGuidanceID;
  unint64_t v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSUUID *v12;
  NSUUID *v13;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  laneGuidanceID = self->_laneGuidanceID;
  v7 = v5;
  v8 = laneGuidanceID;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v14, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 25, v11);

      objc_msgSend(v14, "uniqueID");
      v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v13 = self->_laneGuidanceID;
      self->_laneGuidanceID = v12;

    }
  }

}

- (void)navigationSession:(id)a3 hideLaneDirectionsForId:(id)a4
{
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 26, 0);
}

- (void)navigationSession:(id)a3 showJunctionView:(id)a4
{
  void *v5;
  NSUUID *junctionViewID;
  unint64_t v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSUUID *v12;
  NSUUID *v13;
  id v14;

  v14 = a4;
  objc_msgSend(v14, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  junctionViewID = self->_junctionViewID;
  v7 = v5;
  v8 = junctionViewID;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v14, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 27, v11);

      objc_msgSend(v14, "uniqueID");
      v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v13 = self->_junctionViewID;
      self->_junctionViewID = v12;

    }
  }

}

- (void)navigationSession:(id)a3 hideJunctionViewForId:(id)a4
{
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 28, 0);
}

- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v6;

  objc_msgSend(a4, "description", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 10, v6);

}

- (void)navigationSession:(id)a3 didReceiveTransitAlert:(id)a4
{
  id v5;

  objc_msgSend(a4, "description", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 20, v5);

}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  MNTraceRecorder *traceRecorder;
  id v10;

  v10 = a4;
  v5 = objc_msgSend(v10, "type");
  if (v5 == 4)
  {
    objc_msgSend(v10, "arrivalInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceNavigationEventRecorder _didUpdateArrivalInfo:](self, "_didUpdateArrivalInfo:", v8);
LABEL_8:

    goto LABEL_9;
  }
  if (v5 == 2)
  {
    v6 = objc_msgSend(v10, "reason") - 1;
    if (v6 > 9)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E61D7938[v6];
    -[MNTraceNavigationEventRecorder _recordEvent:description:](self, "_recordEvent:description:", 3, v7);
    traceRecorder = self->_traceRecorder;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceRecorder setNavigationEndDate:](traceRecorder, "setNavigationEndDate:", v8);
    goto LABEL_8;
  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastARInfos, 0);
  objc_storeStrong((id *)&self->_junctionViewID, 0);
  objc_storeStrong((id *)&self->_laneGuidanceID, 0);
  objc_storeStrong((id *)&self->_currentSecondarySignID, 0);
  objc_storeStrong((id *)&self->_currentPrimarySignID, 0);
  objc_storeStrong((id *)&self->_previousSuppressedRerouteError, 0);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
}

@end
