@implementation MKRouteContextBuilder

- (id)buildRouteContextForRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSCache *v22;
  NSCache *routeOverlapCache;
  unint64_t i;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSCache *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _MKRouteContextBuilderCacheEntry *v43;
  NSCache *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSCache *v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  uint64_t v65;
  _MKRouteContextBuilderCacheEntry *v66;
  NSCache *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  uint64_t v74;
  unint64_t k;
  void *v76;
  BOOL v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  id v85;
  id v87;
  void *v88;
  void *v89;
  void *v91;
  id v92;
  os_log_t log;
  NSObject *loga;
  os_log_t logb;
  os_log_t logc;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t *v102;
  char *v103;
  char *v104;
  _BYTE v105[128];
  _QWORD v106[2];
  _BYTE buf[22];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v92 = a3;
  if (objc_msgSend(v92, "count") <= a4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v92, "objectAtIndexedSubscript:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v91 = v5;
  if (objc_msgSend(v5, "transportType") == 1)
    v6 = 1;
  else
    v6 = objc_msgSend(v91, "isWalkingOnlyTransitRoute");
  v97 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6558]), "initWithComposedRoute:useType:", v91, v6 ^ 1u);
  -[MKRouteContextBuilder _defaultPuckRadius](self, "_defaultPuckRadius");
  objc_msgSend(v97, "setPuckRadius:");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setLocale:", v8);

  _MKLocalizedStringFromThisBundle(CFSTR("AccessPointEntryName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setAccessPointEntryName:", v9);

  _MKLocalizedStringFromThisBundle(CFSTR("AccessPointExitName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setAccessPointExitName:", v10);

  v89 = (void *)objc_opt_new();
  v11 = objc_msgSend(v92, "count");
  v12 = v11;
  v102 = 0;
  v103 = 0;
  v104 = 0;
  *(_QWORD *)buf = &v102;
  buf[8] = 0;
  if (v11)
  {
    if (v11 >> 61)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v13 = v11;
    v14 = (uint64_t *)operator new(8 * v11);
    v102 = v14;
    v104 = (char *)&v14[v12];
    bzero(v14, 8 * v12);
    v103 = (char *)&v14[v13];
  }
  objc_msgSend(v97, "routeInfo");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v102[a4];
  v102[a4] = v15;

  if (objc_msgSend(v92, "count") == 1)
  {
    std::vector<RouteSection>::vector((char **)buf, objc_msgSend(v92, "count"));
    v17 = *v102;
    objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "endRouteCoordinate");
    v20 = *(_QWORD *)buf;
    **(_QWORD **)buf = v17;
    *(_QWORD *)(v20 + 8) = 0;
    *(_QWORD *)(v20 + 16) = v19;

    objc_msgSend(v97, "addShareSections:shareCount:");
    v21 = v97;
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
  }
  else
  {
    if (!self->_routeOverlapCache)
    {
      v22 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
      routeOverlapCache = self->_routeOverlapCache;
      self->_routeOverlapCache = v22;

      -[NSCache setCountLimit:](self->_routeOverlapCache, "setCountLimit:", 10);
    }
    v87 = objc_alloc_init(MEMORY[0x1E0D51938]);
    for (i = 0; i < objc_msgSend(v92, "count"); ++i)
    {
      objc_msgSend(v92, "objectAtIndex:", i);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if ((void *)v25 != v91)
      {
        v106[0] = v25;
        v106[1] = v91;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        v27 = _MKRouteContextBuilderCacheEntryKey(log);
        v28 = self->_routeOverlapCache;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
        v29 = objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](v28, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "overlapResults");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v29) = v31 == 0;

        if ((v29 & 1) != 0)
        {
          MKGetMKRouteContextBuilderLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v26, "uniqueRouteID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "UUIDString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "uniqueRouteID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "UUIDString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v40;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v42;
            _os_log_impl(&dword_18B0B0000, v38, OS_LOG_TYPE_INFO, "Calling findFirstUniqueRangeBetweenRoutes because no cache entry was found for route pair %@, %@", buf, 0x16u);

          }
          objc_msgSend(v87, "findFirstUniqueRangeBetweenRoute:andRoute:", v26, v91);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = -[_MKRouteContextBuilderCacheEntry initWithRoutes:]([_MKRouteContextBuilderCacheEntry alloc], "initWithRoutes:", log);

          -[_MKRouteContextBuilderCacheEntry setOverlapResults:](v43, "setOverlapResults:", v32);
          v44 = self->_routeOverlapCache;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v33 = objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](v44, "setObject:forKey:", v43, v33);
          v30 = v43;
        }
        else
        {
          objc_msgSend(v30, "overlapResults");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          MKGetMKRouteContextBuilderLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v26, "uniqueRouteID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "UUIDString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "uniqueRouteID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "UUIDString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v37;
            _os_log_impl(&dword_18B0B0000, v33, OS_LOG_TYPE_INFO, "Cache entry was found for route pair %@, %@", buf, 0x16u);

          }
        }
        v45 = v32;

        if (!objc_msgSend(v32, "count")
          || (objc_msgSend(v32, "objectAtIndexedSubscript:", 0),
              v46 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v46, "uniqueRanges"),
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              v48 = objc_msgSend(v47, "count") == 0,
              v47,
              v46,
              v48))
        {
          LODWORD(v51) = 0;
          LODWORD(v53) = 0;
          v54 = 0xBF80000000000000;
          v55 = 0xBF80000000000000;
        }
        else
        {
          objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "uniqueRanges");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "coordinateRangeAtIndex:", 0);
          v53 = v52;

          v54 = v51 & 0xFFFFFFFF00000000;
          v55 = v53 & 0xFFFFFFFF00000000;
        }
        v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC64C0]), "initWithComposedRoute:etaText:divergenceRouteCoordinate:convergenceRouteCoordinate:", v26, 0, v51 | v54, v53 | v55);
        objc_msgSend(v89, "addObject:", v56);
        v57 = (void *)v102[i];
        v102[i] = v56;

      }
    }
    objc_msgSend(v97, "setAlternateRoutes:", v89);
    v58 = _MKRouteContextBuilderCacheEntryKey(v92);
    v59 = self->_routeOverlapCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58);
    v60 = objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](v59, "objectForKey:", v60);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v88, "overlappingSections");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v60) = v61 == 0;

    MKGetMKRouteContextBuilderLog();
    loga = objc_claimAutoreleasedReturnValue();
    v62 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
    if ((v60 & 1) != 0)
    {
      if (v62)
      {
        objc_msgSend(v92, "valueForKey:", CFSTR("uniqueRouteID"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v64;
        _os_log_impl(&dword_18B0B0000, loga, OS_LOG_TYPE_INFO, "Calling findOverlappingSectionsForRoutes because no cache entry was found for route set %@", buf, 0xCu);

      }
      objc_msgSend(v87, "findOverlappingSectionsForRoutes:", v92);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = -[_MKRouteContextBuilderCacheEntry initWithRoutes:]([_MKRouteContextBuilderCacheEntry alloc], "initWithRoutes:", v92);
      logb = (os_log_t)v65;

      -[_MKRouteContextBuilderCacheEntry setOverlappingSections:](v66, "setOverlappingSections:", v65);
      v67 = self->_routeOverlapCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](v67, "setObject:forKey:", v66, v68);

      v88 = v66;
    }
    else
    {
      if (v62)
      {
        objc_msgSend(v92, "valueForKey:", CFSTR("uniqueRouteID"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v63;
        _os_log_impl(&dword_18B0B0000, loga, OS_LOG_TYPE_INFO, "Cache entry was found for route set %@", buf, 0xCu);

      }
      objc_msgSend(v88, "overlappingSections");
      logb = (os_log_t)objc_claimAutoreleasedReturnValue();
    }
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    logc = logb;
    v69 = -[NSObject countByEnumeratingWithState:objects:count:](logc, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
    if (v69)
    {
      v70 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v99 != v70)
            objc_enumerationMutation(logc);
          v72 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
          objc_msgSend(v72, "components");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          std::vector<RouteSection>::vector((char **)buf, objc_msgSend(v73, "count"));

          v74 = 0;
          for (k = 0; ; ++k)
          {
            objc_msgSend(v72, "components");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = k < objc_msgSend(v76, "count");

            if (!v77)
              break;
            objc_msgSend(v72, "components");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "objectAtIndexedSubscript:", k);
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            v80 = objc_msgSend(v79, "routeIndex");
            v81 = v102[v80];
            v82 = objc_msgSend(v79, "range");
            objc_msgSend(v79, "range");
            v83 = (_QWORD *)(*(_QWORD *)buf + v74);
            *v83 = v81;
            v83[1] = v82;
            v83[2] = v84;

            v74 += 24;
          }
          objc_msgSend(v97, "addShareSections:shareCount:");
          if (*(_QWORD *)buf)
          {
            *(_QWORD *)&buf[8] = *(_QWORD *)buf;
            operator delete(*(void **)buf);
          }
        }
        v69 = -[NSObject countByEnumeratingWithState:objects:count:](logc, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
      }
      while (v69);
    }

    v85 = v97;
  }
  *(_QWORD *)buf = &v102;
  std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v97;
}

- (id)buildRouteContextForAnchorPoints:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC6558]);
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAnchorPoint:useType:", v6, 1);

  -[MKRouteContextBuilder _defaultPuckRadius](self, "_defaultPuckRadius");
  objc_msgSend(v7, "setPuckRadius:");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v9);

  return v7;
}

- (float)_defaultPuckRadius
{
  double v2;

  +[_MKPuckAnnotationView baseDiameter](_MKUserLocationView, "baseDiameter");
  *(float *)&v2 = v2;
  return *(float *)&v2 * 0.5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeOverlapCache, 0);
}

@end
