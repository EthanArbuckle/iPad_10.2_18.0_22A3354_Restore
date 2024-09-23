@implementation NSError(MKErrorPrivate)

- (uint64_t)_mapkit_errorWithDirectionsError:()MKErrorPrivate
{
  return objc_msgSend(a1, "_mapkit_errorWithDirectionsError:stringTokens:", a3, 0);
}

- (id)_mapkit_errorWithDirectionsError:()MKErrorPrivate stringTokens:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  id v45;
  const __CFString *v47;
  __CFString *v48;
  uint64_t v49;
  __CFString *v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v45 = a1;
    goto LABEL_39;
  }
  v11 = objc_msgSend(a1, "code");
  v12 = objc_msgSend(v6, "firstDirectionsErrorCode");
  if (!v6 || (v13 = v12, v12 == 1))
  {
    if (v11 <= -29)
    {
      if (v11 == -402)
      {
        v13 = 5;
        goto LABEL_4;
      }
      if (v11 == -401)
      {
        v13 = 4;
        goto LABEL_4;
      }
    }
    else
    {
      switch(v11)
      {
        case -28:
          v13 = 17;
          goto LABEL_4;
        case -9:
          v13 = 2;
          goto LABEL_4;
        case -8:
          v13 = 1;
          goto LABEL_4;
      }
    }
    v13 = 3;
  }
LABEL_4:
  objc_msgSend(v6, "title");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_6;
  v15 = (void *)v14;
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v56 + 1) = 0;
  v55 = 1;
  *(_DWORD *)((char *)&v56 + 7) = 0;
  v57 = 0;
  *(_QWORD *)&v56 = 0;
  objc_msgSend(v16, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v17, &v55, v7);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_6:
    objc_msgSend(v6, "localizedTitle");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "content");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_9;
  v20 = (void *)v19;
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "content");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v53 + 1) = 0;
  v52 = 1;
  *(_DWORD *)((char *)&v53 + 7) = 0;
  v54 = 0;
  *(_QWORD *)&v53 = 0;
  objc_msgSend(v21, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v22, &v52, v7);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_9:
    objc_msgSend(v6, "localizedDescription");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v51 = v7;
  if (-[__CFString length](v18, "length") || -[__CFString length](v23, "length"))
  {
    v24 = v18;
  }
  else
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Directions Not Available"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v47 = &stru_1E20DFC00;
    v48 = CFSTR("Cannot locate the start location.");
    switch(v13)
    {
      case 0:
      case 1:
      case 16:
        v48 = CFSTR("A route could not be determined between these locations.");
        goto LABEL_66;
      case 2:
      case 22:
        v48 = CFSTR("Route information is not available at this moment. An internet connection is required.");
        goto LABEL_66;
      case 3:
        v48 = CFSTR("Route information is not available at this moment.");
        goto LABEL_66;
      case 4:
        goto LABEL_66;
      case 5:
        v48 = CFSTR("Cannot locate the end location.");
        goto LABEL_66;
      case 6:
        v48 = CFSTR("A route to the nearest road cannot be determined.");
        goto LABEL_66;
      case 7:
        v48 = CFSTR("A route to the destination from its nearest road cannot be determined");
        goto LABEL_66;
      case 8:
        v48 = CFSTR("A route cannot be determined from this start location.");
        goto LABEL_66;
      case 9:
        v48 = CFSTR("A route cannot be determined to this destination.");
        goto LABEL_66;
      case 10:
        _MKLocalizedStringFromThisBundle(CFSTR("Walking Directions Not Available"));
        v49 = objc_claimAutoreleasedReturnValue();

        v48 = CFSTR("A walking route cannot be determined. Walking is not allowed at the start location.");
        goto LABEL_65;
      case 11:
        _MKLocalizedStringFromThisBundle(CFSTR("Walking Directions Not Available"));
        v49 = objc_claimAutoreleasedReturnValue();

        v48 = CFSTR("A walking route cannot be determined. Walking is not allowed at the destination.");
        goto LABEL_65;
      case 12:
      case 15:
        goto LABEL_67;
      case 13:
        _MKLocalizedStringFromThisBundle(CFSTR("Walking Directions Not Available"));
        v49 = objc_claimAutoreleasedReturnValue();

        v48 = CFSTR("A walking route cannot be determined for this distance.");
        goto LABEL_65;
      case 14:
        v48 = CFSTR("A route is currently not available due to road conditions.");
        goto LABEL_66;
      case 18:
        v50 = CFSTR("EV directions aren't yet available here.");
        goto LABEL_63;
      case 19:
        _MKLocalizedStringFromThisBundle(CFSTR("EV Directions Not Available"));
        v49 = objc_claimAutoreleasedReturnValue();

        v48 = CFSTR("We could not find a route based on the range of the selected vehicle. You can view driving directions without EV information.");
        goto LABEL_65;
      case 20:
        v50 = CFSTR("EV Directions Not Available");
LABEL_63:
        _MKLocalizedStringFromThisBundle(v50);
        v49 = objc_claimAutoreleasedReturnValue();

        v48 = CFSTR("You can view driving directions without EV information.");
        goto LABEL_65;
      case 21:
        _MKLocalizedStringFromThisBundle(CFSTR("LPR Directions Not Available"));
        v49 = objc_claimAutoreleasedReturnValue();

        v48 = CFSTR("You can view driving directions without LPR information.");
LABEL_65:
        v24 = (__CFString *)v49;
LABEL_66:
        v47 = v24;
        _MKLocalizedStringFromThisBundle(v48);
        v24 = v23;
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_67:

        v24 = (__CFString *)v47;
        break;
      default:
        break;
    }
  }
  v25 = (void *)objc_opt_new();
  objc_msgSend(a1, "userInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(a1, "userInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("MKErrorGEOErrorUserInfo"));

  }
  v28 = -[__CFString length](v24, "length");
  v29 = (_QWORD *)MEMORY[0x1E0CB2D50];
  if (v28)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB2D50]);
  v30 = -[__CFString length](v23, "length");
  v31 = (_QWORD *)MEMORY[0x1E0CB2D68];
  if (v30)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(v6, "incidentMessage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v6, "incidentMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("MKErrorGEOTransitIncidentKey"));

  }
  if (v6)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v6, CFSTR("MKErrorDirectionsErrorInfoKey"));
  v58[0] = CFSTR("MKDirectionsErrorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = CFSTR("MKErrorGEOError");
  v59[0] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addEntriesFromDictionary:", v36);

  if (-[__CFString length](v24, "length"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, *v29);
  if (-[__CFString length](v23, "length"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, *v31);
  objc_msgSend(v6, "internalServerErrors");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v6, "internalServerErrors");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "componentsJoinedByString:", CFSTR(" | "));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n(internal error: %@)"), v23, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0CB2938]);

  }
  objc_msgSend(a1, "_mapkit_error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "domain");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "isEqualToString:", MKErrorDomain);

  if (v43)
    v44 = objc_msgSend(v41, "code");
  else
    v44 = 5;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKErrorDomain, v44, v25);
  v45 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v51;
LABEL_39:

  return v45;
}

- (BOOL)_mapkit_isDirectionsError
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("MKDirectionsErrorCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (uint64_t)_mapkit_directionsErrorCode
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("MKDirectionsErrorCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_mapkit_isLocationAuthorizationError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", MKLocationErrorDomain);

  return v3 && objc_msgSend(a1, "code") < 3;
}

- (uint64_t)_mapkit_underlyingGEOError
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("MKErrorGEOError"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (id)_mapkit_transitIncident
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("MKErrorGEOTransitIncidentKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
