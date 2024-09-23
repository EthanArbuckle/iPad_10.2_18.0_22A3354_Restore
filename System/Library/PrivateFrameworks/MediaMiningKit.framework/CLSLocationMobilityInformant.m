@implementation CLSLocationMobilityInformant

+ (id)familyIdentifier
{
  __CFString *v2;

  v2 = CFSTR("com.apple.mediaminingkit.informant.core");
  return CFSTR("com.apple.mediaminingkit.informant.core");
}

+ (id)classIdentifier
{
  return CFSTR("locationspan");
}

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, double);
  void *v8;
  void *v9;
  char v11;
  void *v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x1D1796244](a4);
  -[CLSLocationMobilityInformant _locationMobilityClueForInvestigation:](self, "_locationMobilityClueForInvestigation:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (v11 = 0, ((void (**)(_QWORD, char *, double))v7)[2](v7, &v11, 0.5), v11))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v14 = 42;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    v9 = 0;
  }
  else if (v8)
  {
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)_locationMobilityClueForInvestigation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v3 = a3;
  objc_msgSend(v3, "clueCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__17;
  v22[4] = __Block_byref_object_dispose__18;
  v23 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __70__CLSLocationMobilityInformant__locationMobilityClueForInvestigation___block_invoke;
  v19 = &unk_1E84F6FE0;
  v21 = v22;
  v6 = v5;
  v20 = v6;
  objc_msgSend(v4, "enumerateLocationClues:", &v16);
  if (objc_msgSend(v6, "count", v16, v17, v18, v19))
  {
    v7 = objc_msgSend(v6, "countForObject:", CFSTR("Plane"));
    v8 = objc_msgSend(v6, "countForObject:", CFSTR("Car"));
    v9 = objc_msgSend(v6, "countForObject:", CFSTR("Pedestrian"));
    if (v7)
    {
      v10 = CFSTR("Plane");
      v11 = CFSTR("Plane");
    }
    else
    {
      v10 = 0;
    }
    if (v8 > v7 && v8 >= objc_msgSend(v4, "numberOfDays") + 1)
    {
      v13 = CFSTR("Car");

      v10 = CFSTR("Car");
    }
    else if (!v7)
    {
      v10 = 0;
      goto LABEL_12;
    }
    if (v9 <= objc_msgSend(v6, "countForObject:", v10))
    {
LABEL_13:
      +[CLSMeaningClue clueWithValue:forKey:](CLSMeaningClue, "clueWithValue:forKey:", v10, CFSTR("Location Mobility"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
LABEL_12:
    v14 = CFSTR("Pedestrian");

    v10 = CFSTR("Pedestrian");
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  _Block_object_dispose(v22, 8);
  return v12;
}

void __70__CLSLocationMobilityInformant__locationMobilityClueForInvestigation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  double v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "location");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    objc_msgSend(v4, "distanceFromLocation:", v3);
    if (v5 >= 1000.0)
    {
      v6 = CFSTR("Plane");
      if (v5 < 500000.0)
        v6 = CFSTR("Car");
      if (v5 >= 25000.0)
        v7 = v6;
      else
        v7 = CFSTR("Pedestrian");
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

@end
