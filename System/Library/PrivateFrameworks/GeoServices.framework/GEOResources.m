@implementation GEOResources

- (id)preferedURLSetFor:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[GEOResources urlInfoSets](self, "urlInfoSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v5)
  {

    v8 = 0;
    v7 = 0;
    goto LABEL_21;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (!objc_msgSend(v11, "hasDataSet"))
      {
        v14 = v8;
        v15 = v7;
        v8 = v11;
LABEL_12:
        v16 = v11;

        v7 = v15;
        continue;
      }
      v12 = objc_msgSend(v11, "hasDataSet");
      if (v20)
      {
        if (v12)
        {
          v13 = objc_msgSend(v11, "dataSet");
          v14 = v7;
          v15 = v11;
          if (v13 == objc_msgSend(v20, "identifier"))
            goto LABEL_12;
        }
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v6);

  if (!v8)
  {
LABEL_21:
    v17 = 0;
    goto LABEL_23;
  }
  if (v7)
  {
    v17 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v17, "mergeFrom:", v7);
    if (objc_msgSend(v7, "alternateResourcesURLsCount"))
    {
      objc_msgSend(v7, "alternateResourcesURLs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAlternateResourcesURLs:", v18);

    }
    objc_msgSend(v17, "setDataSet:", 0);
    objc_msgSend(v17, "setHasDataSet:", 0);
  }
  else
  {
    v8 = v8;
    v17 = v8;
  }
LABEL_23:

  return v17;
}

- (NSMutableArray)urlInfoSets
{
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  return self->_urlInfoSets;
}

- (void)_readUrlInfoSets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrlInfoSets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (id)preferredDataSetForMapsABClient
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapsAbClientMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientDatasetMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOResources preferredDataSetForClientDatasetMetadata:](self, "preferredDataSetForClientDatasetMetadata:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)preferredDataSetForClientDatasetMetadata:(id)a3
{
  id v4;
  int UInteger;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_GEOConfigHasValue(GeoServicesConfig_DataSetID, (uint64_t)off_1EDF4CEF8))
  {
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_DataSetID, (uint64_t)off_1EDF4CEF8);
  }
  else
  {
    if (!objc_msgSend(v4, "hasDatasetId"))
      goto LABEL_15;
    UInteger = objc_msgSend(v4, "datasetId");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEOResources dataSets](self, "dataSets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_7:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      if (objc_msgSend(v11, "identifier") == UInteger)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    v12 = v11;

    if (v12)
      goto LABEL_16;
  }
  else
  {
LABEL_13:

  }
LABEL_15:
  -[GEOResources dataSets](self, "dataSets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v12;
}

- (NSMutableArray)dataSets
{
  -[GEOResources _readDataSets]((uint64_t)self);
  return self->_dataSets;
}

- (void)_readDataSets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDataSets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (unint64_t)tileGroupsCount
{
  -[GEOResources _readTileGroups]((uint64_t)self);
  return -[NSMutableArray count](self->_tileGroups, "count");
}

- (void)_readTileGroups
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileGroups_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (id)tileGroupAtIndex:(unint64_t)a3
{
  -[GEOResources _readTileGroups]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tileGroups, "objectAtIndex:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t n;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ii;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t jj;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t kk;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t mm;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t nn;
  void *v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i1;
  void *v79;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i2;
  void *v84;
  NSMutableArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i3;
  void *v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i4;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  NSMutableArray *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t i5;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  NSMutableArray *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t i6;
  void *v132;
  NSMutableArray *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t i7;
  void *v137;
  uint64_t v138;
  void *v139;
  NSMutableArray *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t i8;
  void *v144;
  NSMutableArray *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t i9;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  NSMutableArray *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t i10;
  void *v172;
  uint64_t v173;
  void *v174;
  NSMutableArray *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t i11;
  void *v179;
  NSMutableArray *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t i12;
  void *v184;
  NSMutableArray *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t i13;
  void *v189;
  NSMutableArray *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t i14;
  void *v194;
  id v195;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  _BYTE v293[128];
  _BYTE v294[128];
  _BYTE v295[128];
  _BYTE v296[128];
  _BYTE v297[128];
  _BYTE v298[128];
  _BYTE v299[128];
  _BYTE v300[128];
  _BYTE v301[128];
  _BYTE v302[128];
  _BYTE v303[128];
  _BYTE v304[128];
  _BYTE v305[128];
  _BYTE v306[128];
  _BYTE v307[128];
  _BYTE v308[128];
  _BYTE v309[128];
  _BYTE v310[128];
  _BYTE v311[128];
  _BYTE v312[128];
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  uint64_t v317;

  v317 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 7) & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOResourcesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_176;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOResources readAll:](self, "readAll:", 0);
  v292 = 0u;
  v291 = 0u;
  v290 = 0u;
  v289 = 0u;
  v9 = self->_tileGroups;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v289, v316, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v290;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v290 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v289 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTileGroup:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v289, v316, 16);
    }
    while (v10);
  }

  v288 = 0u;
  v287 = 0u;
  v286 = 0u;
  v285 = 0u;
  v14 = self->_tileSets;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v285, v315, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v286;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v286 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v285 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTileSet:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v285, v315, 16);
    }
    while (v15);
  }

  v284 = 0u;
  v283 = 0u;
  v282 = 0u;
  v281 = 0u;
  v19 = self->_styleSheets;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v281, v314, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v282;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v282 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v281 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStyleSheet:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v281, v314, 16);
    }
    while (v20);
  }

  v280 = 0u;
  v279 = 0u;
  v278 = 0u;
  v277 = 0u;
  v24 = self->_textures;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v277, v313, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v278;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v278 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v277 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTexture:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v277, v313, 16);
    }
    while (v25);
  }

  v276 = 0u;
  v275 = 0u;
  v274 = 0u;
  v273 = 0u;
  v29 = self->_fonts;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v273, v312, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v274;
    do
    {
      for (n = 0; n != v30; ++n)
      {
        if (*(_QWORD *)v274 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v273 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFont:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v273, v312, 16);
    }
    while (v30);
  }

  v272 = 0u;
  v271 = 0u;
  v270 = 0u;
  v269 = 0u;
  v34 = self->_icons;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v269, v311, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v270;
    do
    {
      for (ii = 0; ii != v35; ++ii)
      {
        if (*(_QWORD *)v270 != v36)
          objc_enumerationMutation(v34);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v269 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIcon:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v269, v311, 16);
    }
    while (v35);
  }

  v268 = 0u;
  v267 = 0u;
  v266 = 0u;
  v265 = 0u;
  v39 = self->_regionalResources;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v265, v310, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v266;
    do
    {
      for (jj = 0; jj != v40; ++jj)
      {
        if (*(_QWORD *)v266 != v41)
          objc_enumerationMutation(v39);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v265 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRegionalResource:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v265, v310, 16);
    }
    while (v40);
  }

  v264 = 0u;
  v263 = 0u;
  v262 = 0u;
  v261 = 0u;
  v44 = self->_xmls;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v261, v309, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v262;
    do
    {
      for (kk = 0; kk != v45; ++kk)
      {
        if (*(_QWORD *)v262 != v46)
          objc_enumerationMutation(v44);
        v48 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v261 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addXml:", v48);

      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v261, v309, 16);
    }
    while (v45);
  }

  v259 = 0u;
  v260 = 0u;
  v257 = 0u;
  v258 = 0u;
  v49 = self->_attributions;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v257, v308, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v258;
    do
    {
      for (mm = 0; mm != v50; ++mm)
      {
        if (*(_QWORD *)v258 != v51)
          objc_enumerationMutation(v49);
        v53 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v257 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAttribution:", v53);

      }
      v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v257, v308, 16);
    }
    while (v50);
  }

  v54 = -[NSString copyWithZone:](self->_authToken, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v54;

  v56 = -[NSString copyWithZone:](self->_resourcesURL, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v56;

  v58 = -[NSString copyWithZone:](self->_searchAttributionManifestURL, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v58;

  v60 = -[NSString copyWithZone:](self->_directionsURL, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v60;

  v62 = -[NSString copyWithZone:](self->_etaURL, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v62;

  v64 = -[NSString copyWithZone:](self->_releaseInfo, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v64;

  v66 = -[NSString copyWithZone:](self->_batchReverseGeocoderURL, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v66;

  v68 = -[NSString copyWithZone:](self->_simpleETAURL, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v68;

  v255 = 0u;
  v256 = 0u;
  v253 = 0u;
  v254 = 0u;
  v70 = self->_styleSheetChecksums;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v253, v307, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v254;
    do
    {
      for (nn = 0; nn != v71; ++nn)
      {
        if (*(_QWORD *)v254 != v72)
          objc_enumerationMutation(v70);
        v74 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v253 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStyleSheetChecksum:", v74);

      }
      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v253, v307, 16);
    }
    while (v71);
  }

  v251 = 0u;
  v252 = 0u;
  v249 = 0u;
  v250 = 0u;
  v75 = self->_textureChecksums;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v249, v306, 16);
  if (v76)
  {
    v77 = *(_QWORD *)v250;
    do
    {
      for (i1 = 0; i1 != v76; ++i1)
      {
        if (*(_QWORD *)v250 != v77)
          objc_enumerationMutation(v75);
        v79 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v249 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTextureChecksum:", v79);

      }
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v249, v306, 16);
    }
    while (v76);
  }

  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  v80 = self->_fontChecksums;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v245, v305, 16);
  if (v81)
  {
    v82 = *(_QWORD *)v246;
    do
    {
      for (i2 = 0; i2 != v81; ++i2)
      {
        if (*(_QWORD *)v246 != v82)
          objc_enumerationMutation(v80);
        v84 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v245 + 1) + 8 * i2), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFontChecksum:", v84);

      }
      v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v245, v305, 16);
    }
    while (v81);
  }

  v243 = 0u;
  v244 = 0u;
  v241 = 0u;
  v242 = 0u;
  v85 = self->_iconChecksums;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v241, v304, 16);
  if (v86)
  {
    v87 = *(_QWORD *)v242;
    do
    {
      for (i3 = 0; i3 != v86; ++i3)
      {
        if (*(_QWORD *)v242 != v87)
          objc_enumerationMutation(v85);
        v89 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v241 + 1) + 8 * i3), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIconChecksum:", v89);

      }
      v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v241, v304, 16);
    }
    while (v86);
  }

  v239 = 0u;
  v240 = 0u;
  v237 = 0u;
  v238 = 0u;
  v90 = self->_xmlChecksums;
  v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v237, v303, 16);
  if (v91)
  {
    v92 = *(_QWORD *)v238;
    do
    {
      for (i4 = 0; i4 != v91; ++i4)
      {
        if (*(_QWORD *)v238 != v92)
          objc_enumerationMutation(v90);
        v94 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v237 + 1) + 8 * i4), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addXmlChecksum:", v94);

      }
      v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v237, v303, 16);
    }
    while (v91);
  }

  v95 = -[NSString copyWithZone:](self->_addressCorrectionInitURL, "copyWithZone:", a3);
  v96 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v95;

  v97 = -[NSString copyWithZone:](self->_addressCorrectionUpdateURL, "copyWithZone:", a3);
  v98 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v97;

  v99 = -[NSString copyWithZone:](self->_polyLocationShiftURL, "copyWithZone:", a3);
  v100 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v99;

  v101 = -[NSString copyWithZone:](self->_problemSubmissionURL, "copyWithZone:", a3);
  v102 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v101;

  v103 = -[NSString copyWithZone:](self->_problemStatusURL, "copyWithZone:", a3);
  v104 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v103;

  v105 = -[NSString copyWithZone:](self->_reverseGeocoderVersionsURL, "copyWithZone:", a3);
  v106 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v105;

  v107 = -[NSString copyWithZone:](self->_problemCategoriesURL, "copyWithZone:", a3);
  v108 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v107;

  v109 = -[NSString copyWithZone:](self->_announcementsURL, "copyWithZone:", a3);
  v110 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v109;

  v235 = 0u;
  v236 = 0u;
  v233 = 0u;
  v234 = 0u;
  v111 = self->_announcementsSupportedLanguages;
  v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v233, v302, 16);
  if (v112)
  {
    v113 = *(_QWORD *)v234;
    do
    {
      for (i5 = 0; i5 != v112; ++i5)
      {
        if (*(_QWORD *)v234 != v113)
          objc_enumerationMutation(v111);
        v115 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v233 + 1) + 8 * i5), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAnnouncementsSupportedLanguages:", v115);

      }
      v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v233, v302, 16);
    }
    while (v112);
  }

  v116 = -[NSString copyWithZone:](self->_dispatcherURL, "copyWithZone:", a3);
  v117 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v116;

  v118 = -[NSString copyWithZone:](self->_problemOptInURL, "copyWithZone:", a3);
  v119 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v118;

  v120 = -[GEOVersionManifest copyWithZone:](self->_versionManifest, "copyWithZone:", a3);
  v121 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v120;

  v122 = -[NSString copyWithZone:](self->_abExperimentURL, "copyWithZone:", a3);
  v123 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v122;

  v124 = -[NSString copyWithZone:](self->_businessPortalBaseURL, "copyWithZone:", a3);
  v125 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v124;

  v126 = -[NSString copyWithZone:](self->_logMessageUsageURL, "copyWithZone:", a3);
  v127 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v126;

  v231 = 0u;
  v232 = 0u;
  v229 = 0u;
  v230 = 0u;
  v128 = self->_locationShiftEnabledRegions;
  v129 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v229, v301, 16);
  if (v129)
  {
    v130 = *(_QWORD *)v230;
    do
    {
      for (i6 = 0; i6 != v129; ++i6)
      {
        if (*(_QWORD *)v230 != v130)
          objc_enumerationMutation(v128);
        v132 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v229 + 1) + 8 * i6), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocationShiftEnabledRegion:", v132);

      }
      v129 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v229, v301, 16);
    }
    while (v129);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 492) = self->_locationShiftVersion;
    *(_QWORD *)(v5 + 496) |= 1uLL;
  }
  v227 = 0u;
  v228 = 0u;
  v225 = 0u;
  v226 = 0u;
  v133 = self->_resources;
  v134 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v225, v300, 16);
  if (v134)
  {
    v135 = *(_QWORD *)v226;
    do
    {
      for (i7 = 0; i7 != v134; ++i7)
      {
        if (*(_QWORD *)v226 != v135)
          objc_enumerationMutation(v133);
        v137 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v225 + 1) + 8 * i7), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addResource:", v137);

      }
      v134 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v225, v300, 16);
    }
    while (v134);
  }

  v138 = -[NSString copyWithZone:](self->_spatialLookupURL, "copyWithZone:", a3);
  v139 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v138;

  v223 = 0u;
  v224 = 0u;
  v221 = 0u;
  v222 = 0u;
  v140 = self->_dataSets;
  v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v221, v299, 16);
  if (v141)
  {
    v142 = *(_QWORD *)v222;
    do
    {
      for (i8 = 0; i8 != v141; ++i8)
      {
        if (*(_QWORD *)v222 != v142)
          objc_enumerationMutation(v140);
        v144 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v221 + 1) + 8 * i8), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDataSet:", v144);

      }
      v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v221, v299, 16);
    }
    while (v141);
  }

  v219 = 0u;
  v220 = 0u;
  v217 = 0u;
  v218 = 0u;
  v145 = self->_dataSetURLOverrides;
  v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v217, v298, 16);
  if (v146)
  {
    v147 = *(_QWORD *)v218;
    do
    {
      for (i9 = 0; i9 != v146; ++i9)
      {
        if (*(_QWORD *)v218 != v147)
          objc_enumerationMutation(v145);
        v149 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v217 + 1) + 8 * i9), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDataSetURLOverride:", v149);

      }
      v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v217, v298, 16);
    }
    while (v146);
  }

  v150 = -[NSString copyWithZone:](self->_realtimeTrafficProbeURL, "copyWithZone:", a3);
  v151 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v150;

  v152 = -[NSString copyWithZone:](self->_batchTrafficProbeURL, "copyWithZone:", a3);
  v153 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v152;

  v154 = -[NSString copyWithZone:](self->_proactiveRoutingURL, "copyWithZone:", a3);
  v155 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v154;

  v156 = -[NSString copyWithZone:](self->_logMessageUsageV3URL, "copyWithZone:", a3);
  v157 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v156;

  v158 = -[NSString copyWithZone:](self->_backgroundDispatcherURL, "copyWithZone:", a3);
  v159 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v158;

  v160 = -[NSString copyWithZone:](self->_bluePOIDispatcherURL, "copyWithZone:", a3);
  v161 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v160;

  v162 = -[NSString copyWithZone:](self->_backgroundRevGeoURL, "copyWithZone:", a3);
  v163 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v162;

  v164 = -[NSString copyWithZone:](self->_wifiConnectionQualityProbeURL, "copyWithZone:", a3);
  v165 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v164;

  v166 = -[NSString copyWithZone:](self->_muninBaseURL, "copyWithZone:", a3);
  v167 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v166;

  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  v168 = self->_muninVersions;
  v169 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v168, "countByEnumeratingWithState:objects:count:", &v213, v297, 16);
  if (v169)
  {
    v170 = *(_QWORD *)v214;
    do
    {
      for (i10 = 0; i10 != v169; ++i10)
      {
        if (*(_QWORD *)v214 != v170)
          objc_enumerationMutation(v168);
        v172 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * i10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMuninVersion:", v172);

      }
      v169 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v168, "countByEnumeratingWithState:objects:count:", &v213, v297, 16);
    }
    while (v169);
  }

  v173 = -[NSString copyWithZone:](self->_authProxyURL, "copyWithZone:", a3);
  v174 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v173;

  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  v175 = self->_urlInfoSets;
  v176 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v209, v296, 16);
  if (v176)
  {
    v177 = *(_QWORD *)v210;
    do
    {
      for (i11 = 0; i11 != v176; ++i11)
      {
        if (*(_QWORD *)v210 != v177)
          objc_enumerationMutation(v175);
        v179 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v209 + 1) + 8 * i11), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addUrlInfoSet:", v179);

      }
      v176 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v209, v296, 16);
    }
    while (v176);
  }

  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  v180 = self->_muninBuckets;
  v181 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v205, v295, 16);
  if (v181)
  {
    v182 = *(_QWORD *)v206;
    do
    {
      for (i12 = 0; i12 != v181; ++i12)
      {
        if (*(_QWORD *)v206 != v182)
          objc_enumerationMutation(v180);
        v184 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v205 + 1) + 8 * i12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMuninBucket:", v184);

      }
      v181 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v205, v295, 16);
    }
    while (v181);
  }

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v185 = self->_displayStrings;
  v186 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v185, "countByEnumeratingWithState:objects:count:", &v201, v294, 16);
  if (v186)
  {
    v187 = *(_QWORD *)v202;
    do
    {
      for (i13 = 0; i13 != v186; ++i13)
      {
        if (*(_QWORD *)v202 != v187)
          objc_enumerationMutation(v185);
        v189 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v201 + 1) + 8 * i13), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisplayStrings:", v189);

      }
      v186 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v185, "countByEnumeratingWithState:objects:count:", &v201, v294, 16);
    }
    while (v186);
  }

  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v190 = self->_offlineMetadatas;
  v191 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v197, v293, 16);
  if (v191)
  {
    v192 = *(_QWORD *)v198;
    do
    {
      for (i14 = 0; i14 != v191; ++i14)
      {
        if (*(_QWORD *)v198 != v192)
          objc_enumerationMutation(v190);
        v194 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v197 + 1) + 8 * i14), "copyWithZone:", a3, (_QWORD)v197);
        objc_msgSend((id)v5, "addOfflineMetadata:", v194);

      }
      v191 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v197, v293, 16);
    }
    while (v191);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  v195 = (id)v5;
LABEL_176:

  return (id)v5;
}

- (GEOResources)init
{
  GEOResources *v2;
  GEOResources *v3;
  GEOResources *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOResources;
  v2 = -[GEOResources init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmls, 0);
  objc_storeStrong((id *)&self->_xmlChecksums, 0);
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, 0);
  objc_storeStrong((id *)&self->_versionManifest, 0);
  objc_storeStrong((id *)&self->_urlInfoSets, 0);
  objc_storeStrong((id *)&self->_tileSets, 0);
  objc_storeStrong((id *)&self->_tileGroups, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_textureChecksums, 0);
  objc_storeStrong((id *)&self->_styleSheets, 0);
  objc_storeStrong((id *)&self->_styleSheetChecksums, 0);
  objc_storeStrong((id *)&self->_spatialLookupURL, 0);
  objc_storeStrong((id *)&self->_simpleETAURL, 0);
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, 0);
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourcesURL, 0);
  objc_storeStrong((id *)&self->_releaseInfo, 0);
  objc_storeStrong((id *)&self->_regionalResources, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURL, 0);
  objc_storeStrong((id *)&self->_problemStatusURL, 0);
  objc_storeStrong((id *)&self->_problemOptInURL, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURL, 0);
  objc_storeStrong((id *)&self->_proactiveRoutingURL, 0);
  objc_storeStrong((id *)&self->_polyLocationShiftURL, 0);
  objc_storeStrong((id *)&self->_offlineMetadatas, 0);
  objc_storeStrong((id *)&self->_muninVersions, 0);
  objc_storeStrong((id *)&self->_muninBuckets, 0);
  objc_storeStrong((id *)&self->_muninBaseURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURL, 0);
  objc_storeStrong((id *)&self->_locationShiftEnabledRegions, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_storeStrong((id *)&self->_fontChecksums, 0);
  objc_storeStrong((id *)&self->_etaURL, 0);
  objc_storeStrong((id *)&self->_displayStrings, 0);
  objc_storeStrong((id *)&self->_dispatcherURL, 0);
  objc_storeStrong((id *)&self->_directionsURL, 0);
  objc_storeStrong((id *)&self->_dataSets, 0);
  objc_storeStrong((id *)&self->_dataSetURLOverrides, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURL, 0);
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, 0);
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, 0);
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_announcementsURL, 0);
  objc_storeStrong((id *)&self->_announcementsSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, 0);
  objc_storeStrong((id *)&self->_abExperimentURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSMutableArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSMutableArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSMutableArray *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSMutableArray *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSMutableArray *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSMutableArray *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  PBDataReader *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  uint64_t v224;

  v224 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOResourcesIsDirty((uint64_t)self) & 1) == 0)
  {
    v102 = self->_reader;
    objc_sync_enter(v102);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v103);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v102);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOResources readAll:](self, "readAll:", 0);
    v199 = 0u;
    v198 = 0u;
    v197 = 0u;
    v196 = 0u;
    v6 = self->_tileGroups;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v196, v223, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v197;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v197 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v196, v223, 16);
      }
      while (v7);
    }

    v195 = 0u;
    v194 = 0u;
    v193 = 0u;
    v192 = 0u;
    v10 = self->_tileSets;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v192, v222, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v193;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v193 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v192, v222, 16);
      }
      while (v11);
    }

    v191 = 0u;
    v190 = 0u;
    v189 = 0u;
    v188 = 0u;
    v14 = self->_styleSheets;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v188, v221, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v189;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v189 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v188, v221, 16);
      }
      while (v15);
    }

    v187 = 0u;
    v186 = 0u;
    v185 = 0u;
    v184 = 0u;
    v18 = self->_textures;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v184, v220, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v185;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v185 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteStringField();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v184, v220, 16);
      }
      while (v19);
    }

    v183 = 0u;
    v182 = 0u;
    v181 = 0u;
    v180 = 0u;
    v22 = self->_fonts;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v180, v219, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v181;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v181 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteStringField();
          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v180, v219, 16);
      }
      while (v23);
    }

    v179 = 0u;
    v178 = 0u;
    v177 = 0u;
    v176 = 0u;
    v26 = self->_icons;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v176, v218, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v177;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v177 != v28)
            objc_enumerationMutation(v26);
          PBDataWriterWriteStringField();
          ++v29;
        }
        while (v27 != v29);
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v176, v218, 16);
      }
      while (v27);
    }

    v175 = 0u;
    v174 = 0u;
    v173 = 0u;
    v172 = 0u;
    v30 = self->_regionalResources;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v172, v217, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v173;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v173 != v32)
            objc_enumerationMutation(v30);
          PBDataWriterWriteSubmessage();
          ++v33;
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v172, v217, 16);
      }
      while (v31);
    }

    v171 = 0u;
    v170 = 0u;
    v169 = 0u;
    v168 = 0u;
    v34 = self->_xmls;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v168, v216, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v169;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v169 != v36)
            objc_enumerationMutation(v34);
          PBDataWriterWriteStringField();
          ++v37;
        }
        while (v35 != v37);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v168, v216, 16);
      }
      while (v35);
    }

    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v38 = self->_attributions;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v164, v215, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v165;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v165 != v40)
            objc_enumerationMutation(v38);
          PBDataWriterWriteSubmessage();
          ++v41;
        }
        while (v39 != v41);
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v164, v215, 16);
      }
      while (v39);
    }

    if (self->_authToken)
      PBDataWriterWriteStringField();
    if (self->_resourcesURL)
      PBDataWriterWriteStringField();
    if (self->_searchAttributionManifestURL)
      PBDataWriterWriteStringField();
    if (self->_directionsURL)
      PBDataWriterWriteStringField();
    if (self->_etaURL)
      PBDataWriterWriteStringField();
    if (self->_releaseInfo)
      PBDataWriterWriteStringField();
    if (self->_batchReverseGeocoderURL)
      PBDataWriterWriteStringField();
    if (self->_simpleETAURL)
      PBDataWriterWriteStringField();
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v42 = self->_styleSheetChecksums;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v160, v214, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v161;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v161 != v44)
            objc_enumerationMutation(v42);
          PBDataWriterWriteStringField();
          ++v45;
        }
        while (v43 != v45);
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v160, v214, 16);
      }
      while (v43);
    }

    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v46 = self->_textureChecksums;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v156, v213, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v157;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v157 != v48)
            objc_enumerationMutation(v46);
          PBDataWriterWriteStringField();
          ++v49;
        }
        while (v47 != v49);
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v156, v213, 16);
      }
      while (v47);
    }

    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v50 = self->_fontChecksums;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v152, v212, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v153;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v153 != v52)
            objc_enumerationMutation(v50);
          PBDataWriterWriteStringField();
          ++v53;
        }
        while (v51 != v53);
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v152, v212, 16);
      }
      while (v51);
    }

    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v54 = self->_iconChecksums;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v148, v211, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v149;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v149 != v56)
            objc_enumerationMutation(v54);
          PBDataWriterWriteStringField();
          ++v57;
        }
        while (v55 != v57);
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v148, v211, 16);
      }
      while (v55);
    }

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    v58 = self->_xmlChecksums;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v144, v210, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v145;
      do
      {
        v61 = 0;
        do
        {
          if (*(_QWORD *)v145 != v60)
            objc_enumerationMutation(v58);
          PBDataWriterWriteStringField();
          ++v61;
        }
        while (v59 != v61);
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v144, v210, 16);
      }
      while (v59);
    }

    if (self->_addressCorrectionInitURL)
      PBDataWriterWriteStringField();
    if (self->_addressCorrectionUpdateURL)
      PBDataWriterWriteStringField();
    if (self->_polyLocationShiftURL)
      PBDataWriterWriteStringField();
    if (self->_problemSubmissionURL)
      PBDataWriterWriteStringField();
    if (self->_problemStatusURL)
      PBDataWriterWriteStringField();
    if (self->_reverseGeocoderVersionsURL)
      PBDataWriterWriteStringField();
    if (self->_problemCategoriesURL)
      PBDataWriterWriteStringField();
    if (self->_announcementsURL)
      PBDataWriterWriteStringField();
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v62 = self->_announcementsSupportedLanguages;
    v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v140, v209, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v141;
      do
      {
        v65 = 0;
        do
        {
          if (*(_QWORD *)v141 != v64)
            objc_enumerationMutation(v62);
          PBDataWriterWriteStringField();
          ++v65;
        }
        while (v63 != v65);
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v140, v209, 16);
      }
      while (v63);
    }

    if (self->_dispatcherURL)
      PBDataWriterWriteStringField();
    if (self->_problemOptInURL)
      PBDataWriterWriteStringField();
    if (self->_versionManifest)
      PBDataWriterWriteSubmessage();
    if (self->_abExperimentURL)
      PBDataWriterWriteStringField();
    if (self->_businessPortalBaseURL)
      PBDataWriterWriteStringField();
    if (self->_logMessageUsageURL)
      PBDataWriterWriteStringField();
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v66 = self->_locationShiftEnabledRegions;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v136, v208, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v137;
      do
      {
        v69 = 0;
        do
        {
          if (*(_QWORD *)v137 != v68)
            objc_enumerationMutation(v66);
          PBDataWriterWriteSubmessage();
          ++v69;
        }
        while (v67 != v69);
        v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v136, v208, 16);
      }
      while (v67);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v70 = self->_resources;
    v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v132, v207, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v133;
      do
      {
        v73 = 0;
        do
        {
          if (*(_QWORD *)v133 != v72)
            objc_enumerationMutation(v70);
          PBDataWriterWriteSubmessage();
          ++v73;
        }
        while (v71 != v73);
        v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v132, v207, 16);
      }
      while (v71);
    }

    if (self->_spatialLookupURL)
      PBDataWriterWriteStringField();
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v74 = self->_dataSets;
    v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v128, v206, 16);
    if (v75)
    {
      v76 = *(_QWORD *)v129;
      do
      {
        v77 = 0;
        do
        {
          if (*(_QWORD *)v129 != v76)
            objc_enumerationMutation(v74);
          PBDataWriterWriteSubmessage();
          ++v77;
        }
        while (v75 != v77);
        v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v128, v206, 16);
      }
      while (v75);
    }

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v78 = self->_dataSetURLOverrides;
    v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v124, v205, 16);
    if (v79)
    {
      v80 = *(_QWORD *)v125;
      do
      {
        v81 = 0;
        do
        {
          if (*(_QWORD *)v125 != v80)
            objc_enumerationMutation(v78);
          PBDataWriterWriteSubmessage();
          ++v81;
        }
        while (v79 != v81);
        v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v124, v205, 16);
      }
      while (v79);
    }

    if (self->_realtimeTrafficProbeURL)
      PBDataWriterWriteStringField();
    if (self->_batchTrafficProbeURL)
      PBDataWriterWriteStringField();
    if (self->_proactiveRoutingURL)
      PBDataWriterWriteStringField();
    if (self->_logMessageUsageV3URL)
      PBDataWriterWriteStringField();
    if (self->_backgroundDispatcherURL)
      PBDataWriterWriteStringField();
    if (self->_bluePOIDispatcherURL)
      PBDataWriterWriteStringField();
    if (self->_backgroundRevGeoURL)
      PBDataWriterWriteStringField();
    if (self->_wifiConnectionQualityProbeURL)
      PBDataWriterWriteStringField();
    if (self->_muninBaseURL)
      PBDataWriterWriteStringField();
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v82 = self->_muninVersions;
    v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v120, v204, 16);
    if (v83)
    {
      v84 = *(_QWORD *)v121;
      do
      {
        v85 = 0;
        do
        {
          if (*(_QWORD *)v121 != v84)
            objc_enumerationMutation(v82);
          PBDataWriterWriteSubmessage();
          ++v85;
        }
        while (v83 != v85);
        v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v120, v204, 16);
      }
      while (v83);
    }

    if (self->_authProxyURL)
      PBDataWriterWriteStringField();
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v86 = self->_urlInfoSets;
    v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v116, v203, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v117;
      do
      {
        v89 = 0;
        do
        {
          if (*(_QWORD *)v117 != v88)
            objc_enumerationMutation(v86);
          PBDataWriterWriteSubmessage();
          ++v89;
        }
        while (v87 != v89);
        v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v116, v203, 16);
      }
      while (v87);
    }

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v90 = self->_muninBuckets;
    v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v112, v202, 16);
    if (v91)
    {
      v92 = *(_QWORD *)v113;
      do
      {
        v93 = 0;
        do
        {
          if (*(_QWORD *)v113 != v92)
            objc_enumerationMutation(v90);
          PBDataWriterWriteSubmessage();
          ++v93;
        }
        while (v91 != v93);
        v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v112, v202, 16);
      }
      while (v91);
    }

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v94 = self->_displayStrings;
    v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v108, v201, 16);
    if (v95)
    {
      v96 = *(_QWORD *)v109;
      do
      {
        v97 = 0;
        do
        {
          if (*(_QWORD *)v109 != v96)
            objc_enumerationMutation(v94);
          PBDataWriterWriteSubmessage();
          ++v97;
        }
        while (v95 != v97);
        v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v108, v201, 16);
      }
      while (v95);
    }

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v98 = self->_offlineMetadatas;
    v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v104, v200, 16);
    if (v99)
    {
      v100 = *(_QWORD *)v105;
      do
      {
        v101 = 0;
        do
        {
          if (*(_QWORD *)v105 != v100)
            objc_enumerationMutation(v98);
          PBDataWriterWriteSubmessage();
          ++v101;
        }
        while (v99 != v101);
        v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v104, v200, 16);
      }
      while (v99);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v104);
  }

}

- (GEOResources)initWithData:(id)a3
{
  GEOResources *v3;
  GEOResources *v4;
  GEOResources *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOResources;
  v3 = -[GEOResources initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSMutableArray)tileGroups
{
  -[GEOResources _readTileGroups]((uint64_t)self);
  return self->_tileGroups;
}

- (void)setTileGroups:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tileGroups;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  tileGroups = self->_tileGroups;
  self->_tileGroups = v4;

}

- (void)clearTileGroups
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_tileGroups, "removeAllObjects");
}

- (void)addTileGroup:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readTileGroups]((uint64_t)self);
  -[GEOResources _addNoFlagsTileGroup:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTileGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 424);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 424);
      *(_QWORD *)(a1 + 424) = v5;

      v4 = *(void **)(a1 + 424);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

+ (Class)tileGroupType
{
  return (Class)objc_opt_class();
}

- (void)_readTileSets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileSets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)tileSets
{
  -[GEOResources _readTileSets]((uint64_t)self);
  return self->_tileSets;
}

- (void)setTileSets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tileSets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  tileSets = self->_tileSets;
  self->_tileSets = v4;

}

- (void)clearTileSets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_tileSets, "removeAllObjects");
}

- (void)addTileSet:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readTileSets]((uint64_t)self);
  -[GEOResources _addNoFlagsTileSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTileSet:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 432);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 432);
      *(_QWORD *)(a1 + 432) = v5;

      v4 = *(void **)(a1 + 432);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)tileSetsCount
{
  -[GEOResources _readTileSets]((uint64_t)self);
  return -[NSMutableArray count](self->_tileSets, "count");
}

- (id)tileSetAtIndex:(unint64_t)a3
{
  -[GEOResources _readTileSets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tileSets, "objectAtIndex:", a3);
}

+ (Class)tileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readStyleSheets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleSheets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)styleSheets
{
  -[GEOResources _readStyleSheets]((uint64_t)self);
  return self->_styleSheets;
}

- (void)setStyleSheets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *styleSheets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  styleSheets = self->_styleSheets;
  self->_styleSheets = v4;

}

- (void)clearStyleSheets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_styleSheets, "removeAllObjects");
}

- (void)addStyleSheet:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readStyleSheets]((uint64_t)self);
  -[GEOResources _addNoFlagsStyleSheet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsStyleSheet:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 400);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 400);
      *(_QWORD *)(a1 + 400) = v5;

      v4 = *(void **)(a1 + 400);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)styleSheetsCount
{
  -[GEOResources _readStyleSheets]((uint64_t)self);
  return -[NSMutableArray count](self->_styleSheets, "count");
}

- (id)styleSheetAtIndex:(unint64_t)a3
{
  -[GEOResources _readStyleSheets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_styleSheets, "objectAtIndex:", a3);
}

+ (Class)styleSheetType
{
  return (Class)objc_opt_class();
}

- (void)_readTextures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)textures
{
  -[GEOResources _readTextures]((uint64_t)self);
  return self->_textures;
}

- (void)setTextures:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *textures;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  textures = self->_textures;
  self->_textures = v4;

}

- (void)clearTextures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_textures, "removeAllObjects");
}

- (void)addTexture:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readTextures]((uint64_t)self);
  -[GEOResources _addNoFlagsTexture:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTexture:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 416);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 416);
      *(_QWORD *)(a1 + 416) = v5;

      v4 = *(void **)(a1 + 416);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)texturesCount
{
  -[GEOResources _readTextures]((uint64_t)self);
  return -[NSMutableArray count](self->_textures, "count");
}

- (id)textureAtIndex:(unint64_t)a3
{
  -[GEOResources _readTextures]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_textures, "objectAtIndex:", a3);
}

+ (Class)textureType
{
  return (Class)objc_opt_class();
}

- (void)_readFonts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFonts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)fonts
{
  -[GEOResources _readFonts]((uint64_t)self);
  return self->_fonts;
}

- (void)setFonts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *fonts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  fonts = self->_fonts;
  self->_fonts = v4;

}

- (void)clearFonts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_fonts, "removeAllObjects");
}

- (void)addFont:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readFonts]((uint64_t)self);
  -[GEOResources _addNoFlagsFont:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsFont:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 192);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = v5;

      v4 = *(void **)(a1 + 192);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)fontsCount
{
  -[GEOResources _readFonts]((uint64_t)self);
  return -[NSMutableArray count](self->_fonts, "count");
}

- (id)fontAtIndex:(unint64_t)a3
{
  -[GEOResources _readFonts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_fonts, "objectAtIndex:", a3);
}

+ (Class)fontType
{
  return (Class)objc_opt_class();
}

- (void)_readIcons
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIcons_tags_618);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)icons
{
  -[GEOResources _readIcons]((uint64_t)self);
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *icons;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  icons = self->_icons;
  self->_icons = v4;

}

- (void)clearIcons
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_icons, "removeAllObjects");
}

- (void)addIcon:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readIcons]((uint64_t)self);
  -[GEOResources _addNoFlagsIcon:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsIcon:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 208);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v5;

      v4 = *(void **)(a1 + 208);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)iconsCount
{
  -[GEOResources _readIcons]((uint64_t)self);
  return -[NSMutableArray count](self->_icons, "count");
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEOResources _readIcons]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_icons, "objectAtIndex:", a3);
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionalResources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)regionalResources
{
  -[GEOResources _readRegionalResources]((uint64_t)self);
  return self->_regionalResources;
}

- (void)setRegionalResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regionalResources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  regionalResources = self->_regionalResources;
  self->_regionalResources = v4;

}

- (void)clearRegionalResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_regionalResources, "removeAllObjects");
}

- (void)addRegionalResource:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readRegionalResources]((uint64_t)self);
  -[GEOResources _addNoFlagsRegionalResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsRegionalResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 328);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 328);
      *(_QWORD *)(a1 + 328) = v5;

      v4 = *(void **)(a1 + 328);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)regionalResourcesCount
{
  -[GEOResources _readRegionalResources]((uint64_t)self);
  return -[NSMutableArray count](self->_regionalResources, "count");
}

- (id)regionalResourceAtIndex:(unint64_t)a3
{
  -[GEOResources _readRegionalResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regionalResources, "objectAtIndex:", a3);
}

+ (Class)regionalResourceType
{
  return (Class)objc_opt_class();
}

- (void)_readXmls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 503) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readXmls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)xmls
{
  -[GEOResources _readXmls]((uint64_t)self);
  return self->_xmls;
}

- (void)setXmls:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *xmls;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  xmls = self->_xmls;
  self->_xmls = v4;

}

- (void)clearXmls
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_xmls, "removeAllObjects");
}

- (void)addXml:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readXmls]((uint64_t)self);
  -[GEOResources _addNoFlagsXml:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsXml:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 472);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 472);
      *(_QWORD *)(a1 + 472) = v5;

      v4 = *(void **)(a1 + 472);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)xmlsCount
{
  -[GEOResources _readXmls]((uint64_t)self);
  return -[NSMutableArray count](self->_xmls, "count");
}

- (id)xmlAtIndex:(unint64_t)a3
{
  -[GEOResources _readXmls]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_xmls, "objectAtIndex:", a3);
}

+ (Class)xmlType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 496) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributions_tags_620);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)attributions
{
  -[GEOResources _readAttributions]((uint64_t)self);
  return self->_attributions;
}

- (void)setAttributions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *attributions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  attributions = self->_attributions;
  self->_attributions = v4;

}

- (void)clearAttributions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_attributions, "removeAllObjects");
}

- (void)addAttribution:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readAttributions]((uint64_t)self);
  -[GEOResources _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)attributionsCount
{
  -[GEOResources _readAttributions]((uint64_t)self);
  return -[NSMutableArray count](self->_attributions, "count");
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEOResources _readAttributions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_attributions, "objectAtIndex:", a3);
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readAuthToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthToken_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAuthToken
{
  -[GEOResources _readAuthToken]((uint64_t)self);
  return self->_authToken != 0;
}

- (NSString)authToken
{
  -[GEOResources _readAuthToken]((uint64_t)self);
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000200uLL;
  objc_storeStrong((id *)&self->_authToken, a3);
}

- (void)_readResourcesURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResourcesURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasResourcesURL
{
  -[GEOResources _readResourcesURL]((uint64_t)self);
  return self->_resourcesURL != 0;
}

- (NSString)resourcesURL
{
  -[GEOResources _readResourcesURL]((uint64_t)self);
  return self->_resourcesURL;
}

- (void)setResourcesURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800040000000000uLL;
  objc_storeStrong((id *)&self->_resourcesURL, a3);
}

- (void)_readSearchAttributionManifestURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchAttributionManifestURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasSearchAttributionManifestURL
{
  -[GEOResources _readSearchAttributionManifestURL]((uint64_t)self);
  return self->_searchAttributionManifestURL != 0;
}

- (NSString)searchAttributionManifestURL
{
  -[GEOResources _readSearchAttributionManifestURL]((uint64_t)self);
  return self->_searchAttributionManifestURL;
}

- (void)setSearchAttributionManifestURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800200000000000uLL;
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, a3);
}

- (void)_readDirectionsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsURL_tags_621);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasDirectionsURL
{
  -[GEOResources _readDirectionsURL]((uint64_t)self);
  return self->_directionsURL != 0;
}

- (NSString)directionsURL
{
  -[GEOResources _readDirectionsURL]((uint64_t)self);
  return self->_directionsURL;
}

- (void)setDirectionsURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000040000uLL;
  objc_storeStrong((id *)&self->_directionsURL, a3);
}

- (void)_readEtaURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaURL_tags_622);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasEtaURL
{
  -[GEOResources _readEtaURL]((uint64_t)self);
  return self->_etaURL != 0;
}

- (NSString)etaURL
{
  -[GEOResources _readEtaURL]((uint64_t)self);
  return self->_etaURL;
}

- (void)setEtaURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000200000uLL;
  objc_storeStrong((id *)&self->_etaURL, a3);
}

- (void)_readReleaseInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReleaseInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasReleaseInfo
{
  -[GEOResources _readReleaseInfo]((uint64_t)self);
  return self->_releaseInfo != 0;
}

- (NSString)releaseInfo
{
  -[GEOResources _readReleaseInfo]((uint64_t)self);
  return self->_releaseInfo;
}

- (void)setReleaseInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800020000000000uLL;
  objc_storeStrong((id *)&self->_releaseInfo, a3);
}

- (void)_readBatchReverseGeocoderURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocoderURL_tags_623);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBatchReverseGeocoderURL
{
  -[GEOResources _readBatchReverseGeocoderURL]((uint64_t)self);
  return self->_batchReverseGeocoderURL != 0;
}

- (NSString)batchReverseGeocoderURL
{
  -[GEOResources _readBatchReverseGeocoderURL]((uint64_t)self);
  return self->_batchReverseGeocoderURL;
}

- (void)setBatchReverseGeocoderURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000001000uLL;
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, a3);
}

- (void)_readSimpleETAURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSimpleETAURL_tags_624);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasSimpleETAURL
{
  -[GEOResources _readSimpleETAURL]((uint64_t)self);
  return self->_simpleETAURL != 0;
}

- (NSString)simpleETAURL
{
  -[GEOResources _readSimpleETAURL]((uint64_t)self);
  return self->_simpleETAURL;
}

- (void)setSimpleETAURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800400000000000uLL;
  objc_storeStrong((id *)&self->_simpleETAURL, a3);
}

- (void)_readStyleSheetChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleSheetChecksums_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)styleSheetChecksums
{
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  return self->_styleSheetChecksums;
}

- (void)setStyleSheetChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *styleSheetChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  styleSheetChecksums = self->_styleSheetChecksums;
  self->_styleSheetChecksums = v4;

}

- (void)clearStyleSheetChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_styleSheetChecksums, "removeAllObjects");
}

- (void)addStyleSheetChecksum:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsStyleSheetChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsStyleSheetChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 392);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 392);
      *(_QWORD *)(a1 + 392) = v5;

      v4 = *(void **)(a1 + 392);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)styleSheetChecksumsCount
{
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_styleSheetChecksums, "count");
}

- (id)styleSheetChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readStyleSheetChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_styleSheetChecksums, "objectAtIndex:", a3);
}

+ (Class)styleSheetChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readTextureChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextureChecksums_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)textureChecksums
{
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  return self->_textureChecksums;
}

- (void)setTextureChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *textureChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  textureChecksums = self->_textureChecksums;
  self->_textureChecksums = v4;

}

- (void)clearTextureChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_textureChecksums, "removeAllObjects");
}

- (void)addTextureChecksum:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsTextureChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsTextureChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 408);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 408);
      *(_QWORD *)(a1 + 408) = v5;

      v4 = *(void **)(a1 + 408);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)textureChecksumsCount
{
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_textureChecksums, "count");
}

- (id)textureChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readTextureChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_textureChecksums, "objectAtIndex:", a3);
}

+ (Class)textureChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readFontChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFontChecksums_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)fontChecksums
{
  -[GEOResources _readFontChecksums]((uint64_t)self);
  return self->_fontChecksums;
}

- (void)setFontChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *fontChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  fontChecksums = self->_fontChecksums;
  self->_fontChecksums = v4;

}

- (void)clearFontChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_fontChecksums, "removeAllObjects");
}

- (void)addFontChecksum:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readFontChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsFontChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsFontChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 184);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 184);
      *(_QWORD *)(a1 + 184) = v5;

      v4 = *(void **)(a1 + 184);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)fontChecksumsCount
{
  -[GEOResources _readFontChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_fontChecksums, "count");
}

- (id)fontChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readFontChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_fontChecksums, "objectAtIndex:", a3);
}

+ (Class)fontChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readIconChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconChecksums_tags_625);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)iconChecksums
{
  -[GEOResources _readIconChecksums]((uint64_t)self);
  return self->_iconChecksums;
}

- (void)setIconChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *iconChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  iconChecksums = self->_iconChecksums;
  self->_iconChecksums = v4;

}

- (void)clearIconChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_iconChecksums, "removeAllObjects");
}

- (void)addIconChecksum:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readIconChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsIconChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 200);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 200);
      *(_QWORD *)(a1 + 200) = v5;

      v4 = *(void **)(a1 + 200);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)iconChecksumsCount
{
  -[GEOResources _readIconChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_iconChecksums, "count");
}

- (id)iconChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readIconChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_iconChecksums, "objectAtIndex:", a3);
}

+ (Class)iconChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readXmlChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 503) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readXmlChecksums_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)xmlChecksums
{
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  return self->_xmlChecksums;
}

- (void)setXmlChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *xmlChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  xmlChecksums = self->_xmlChecksums;
  self->_xmlChecksums = v4;

}

- (void)clearXmlChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_xmlChecksums, "removeAllObjects");
}

- (void)addXmlChecksum:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  -[GEOResources _addNoFlagsXmlChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsXmlChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 464);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 464);
      *(_QWORD *)(a1 + 464) = v5;

      v4 = *(void **)(a1 + 464);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)xmlChecksumsCount
{
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_xmlChecksums, "count");
}

- (id)xmlChecksumAtIndex:(unint64_t)a3
{
  -[GEOResources _readXmlChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_xmlChecksums, "objectAtIndex:", a3);
}

+ (Class)xmlChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readAddressCorrectionInitURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 496) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionInitURL_tags_626);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAddressCorrectionInitURL
{
  -[GEOResources _readAddressCorrectionInitURL]((uint64_t)self);
  return self->_addressCorrectionInitURL != 0;
}

- (NSString)addressCorrectionInitURL
{
  -[GEOResources _readAddressCorrectionInitURL]((uint64_t)self);
  return self->_addressCorrectionInitURL;
}

- (void)setAddressCorrectionInitURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000008uLL;
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, a3);
}

- (void)_readAddressCorrectionUpdateURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 496) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURL_tags_627);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAddressCorrectionUpdateURL
{
  -[GEOResources _readAddressCorrectionUpdateURL]((uint64_t)self);
  return self->_addressCorrectionUpdateURL != 0;
}

- (NSString)addressCorrectionUpdateURL
{
  -[GEOResources _readAddressCorrectionUpdateURL]((uint64_t)self);
  return self->_addressCorrectionUpdateURL;
}

- (void)setAddressCorrectionUpdateURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000010uLL;
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, a3);
}

- (void)_readPolyLocationShiftURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPolyLocationShiftURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasPolyLocationShiftURL
{
  -[GEOResources _readPolyLocationShiftURL]((uint64_t)self);
  return self->_polyLocationShiftURL != 0;
}

- (NSString)polyLocationShiftURL
{
  -[GEOResources _readPolyLocationShiftURL]((uint64_t)self);
  return self->_polyLocationShiftURL;
}

- (void)setPolyLocationShiftURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000200000000uLL;
  objc_storeStrong((id *)&self->_polyLocationShiftURL, a3);
}

- (void)_readProblemSubmissionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemSubmissionURL_tags_628);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemSubmissionURL
{
  -[GEOResources _readProblemSubmissionURL]((uint64_t)self);
  return self->_problemSubmissionURL != 0;
}

- (NSString)problemSubmissionURL
{
  -[GEOResources _readProblemSubmissionURL]((uint64_t)self);
  return self->_problemSubmissionURL;
}

- (void)setProblemSubmissionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800004000000000uLL;
  objc_storeStrong((id *)&self->_problemSubmissionURL, a3);
}

- (void)_readProblemStatusURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemStatusURL_tags_629);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemStatusURL
{
  -[GEOResources _readProblemStatusURL]((uint64_t)self);
  return self->_problemStatusURL != 0;
}

- (NSString)problemStatusURL
{
  -[GEOResources _readProblemStatusURL]((uint64_t)self);
  return self->_problemStatusURL;
}

- (void)setProblemStatusURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800002000000000uLL;
  objc_storeStrong((id *)&self->_problemStatusURL, a3);
}

- (void)_readReverseGeocoderVersionsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReverseGeocoderVersionsURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasReverseGeocoderVersionsURL
{
  -[GEOResources _readReverseGeocoderVersionsURL]((uint64_t)self);
  return self->_reverseGeocoderVersionsURL != 0;
}

- (NSString)reverseGeocoderVersionsURL
{
  -[GEOResources _readReverseGeocoderVersionsURL]((uint64_t)self);
  return self->_reverseGeocoderVersionsURL;
}

- (void)setReverseGeocoderVersionsURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800100000000000uLL;
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, a3);
}

- (void)_readProblemCategoriesURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemCategoriesURL_tags_630);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemCategoriesURL
{
  -[GEOResources _readProblemCategoriesURL]((uint64_t)self);
  return self->_problemCategoriesURL != 0;
}

- (NSString)problemCategoriesURL
{
  -[GEOResources _readProblemCategoriesURL]((uint64_t)self);
  return self->_problemCategoriesURL;
}

- (void)setProblemCategoriesURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000800000000uLL;
  objc_storeStrong((id *)&self->_problemCategoriesURL, a3);
}

- (void)_readAnnouncementsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 496) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnouncementsURL_tags_631);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAnnouncementsURL
{
  -[GEOResources _readAnnouncementsURL]((uint64_t)self);
  return self->_announcementsURL != 0;
}

- (NSString)announcementsURL
{
  -[GEOResources _readAnnouncementsURL]((uint64_t)self);
  return self->_announcementsURL;
}

- (void)setAnnouncementsURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000040uLL;
  objc_storeStrong((id *)&self->_announcementsURL, a3);
}

- (void)_readAnnouncementsSupportedLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 496) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnouncementsSupportedLanguages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)announcementsSupportedLanguages
{
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  return self->_announcementsSupportedLanguages;
}

- (void)setAnnouncementsSupportedLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *announcementsSupportedLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  self->_announcementsSupportedLanguages = v4;

}

- (void)clearAnnouncementsSupportedLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_announcementsSupportedLanguages, "removeAllObjects");
}

- (void)addAnnouncementsSupportedLanguages:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  -[GEOResources _addNoFlagsAnnouncementsSupportedLanguages:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsAnnouncementsSupportedLanguages:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)announcementsSupportedLanguagesCount
{
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_announcementsSupportedLanguages, "count");
}

- (id)announcementsSupportedLanguagesAtIndex:(unint64_t)a3
{
  -[GEOResources _readAnnouncementsSupportedLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_announcementsSupportedLanguages, "objectAtIndex:", a3);
}

+ (Class)announcementsSupportedLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)_readDispatcherURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDispatcherURL_tags_632);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasDispatcherURL
{
  -[GEOResources _readDispatcherURL]((uint64_t)self);
  return self->_dispatcherURL != 0;
}

- (NSString)dispatcherURL
{
  -[GEOResources _readDispatcherURL]((uint64_t)self);
  return self->_dispatcherURL;
}

- (void)setDispatcherURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000080000uLL;
  objc_storeStrong((id *)&self->_dispatcherURL, a3);
}

- (void)_readProblemOptInURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemOptInURL_tags_633);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProblemOptInURL
{
  -[GEOResources _readProblemOptInURL]((uint64_t)self);
  return self->_problemOptInURL != 0;
}

- (NSString)problemOptInURL
{
  -[GEOResources _readProblemOptInURL]((uint64_t)self);
  return self->_problemOptInURL;
}

- (void)setProblemOptInURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800001000000000uLL;
  objc_storeStrong((id *)&self->_problemOptInURL, a3);
}

- (void)_readVersionManifest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 502) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersionManifest_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasVersionManifest
{
  -[GEOResources _readVersionManifest]((uint64_t)self);
  return self->_versionManifest != 0;
}

- (GEOVersionManifest)versionManifest
{
  -[GEOResources _readVersionManifest]((uint64_t)self);
  return self->_versionManifest;
}

- (void)setVersionManifest:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x880000000000000uLL;
  objc_storeStrong((id *)&self->_versionManifest, a3);
}

- (void)_readAbExperimentURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 496) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbExperimentURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAbExperimentURL
{
  -[GEOResources _readAbExperimentURL]((uint64_t)self);
  return self->_abExperimentURL != 0;
}

- (NSString)abExperimentURL
{
  -[GEOResources _readAbExperimentURL]((uint64_t)self);
  return self->_abExperimentURL;
}

- (void)setAbExperimentURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000004uLL;
  objc_storeStrong((id *)&self->_abExperimentURL, a3);
}

- (void)_readBusinessPortalBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessPortalBaseURL_tags_634);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBusinessPortalBaseURL
{
  -[GEOResources _readBusinessPortalBaseURL]((uint64_t)self);
  return self->_businessPortalBaseURL != 0;
}

- (NSString)businessPortalBaseURL
{
  -[GEOResources _readBusinessPortalBaseURL]((uint64_t)self);
  return self->_businessPortalBaseURL;
}

- (void)setBusinessPortalBaseURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000008000uLL;
  objc_storeStrong((id *)&self->_businessPortalBaseURL, a3);
}

- (void)_readLogMessageUsageURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMessageUsageURL_tags_635);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasLogMessageUsageURL
{
  -[GEOResources _readLogMessageUsageURL]((uint64_t)self);
  return self->_logMessageUsageURL != 0;
}

- (NSString)logMessageUsageURL
{
  -[GEOResources _readLogMessageUsageURL]((uint64_t)self);
  return self->_logMessageUsageURL;
}

- (void)setLogMessageUsageURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000008000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageURL, a3);
}

- (void)_readLocationShiftEnabledRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationShiftEnabledRegions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)locationShiftEnabledRegions
{
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  return self->_locationShiftEnabledRegions;
}

- (void)setLocationShiftEnabledRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *locationShiftEnabledRegions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  self->_locationShiftEnabledRegions = v4;

}

- (void)clearLocationShiftEnabledRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_locationShiftEnabledRegions, "removeAllObjects");
}

- (void)addLocationShiftEnabledRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  -[GEOResources _addNoFlagsLocationShiftEnabledRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsLocationShiftEnabledRegion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 216);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = v5;

      v4 = *(void **)(a1 + 216);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)locationShiftEnabledRegionsCount
{
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_locationShiftEnabledRegions, "count");
}

- (id)locationShiftEnabledRegionAtIndex:(unint64_t)a3
{
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_locationShiftEnabledRegions, "objectAtIndex:", a3);
}

+ (Class)locationShiftEnabledRegionType
{
  return (Class)objc_opt_class();
}

- (unsigned)locationShiftVersion
{
  os_unfair_lock_s *p_readerLock;
  $253DEAA7EC5C39FADD5BEFB730D1BE85 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_locationShiftVersion;
  else
    return 1;
}

- (void)setLocationShiftVersion:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000001uLL;
  self->_locationShiftVersion = a3;
}

- (void)setHasLocationShiftVersion:(BOOL)a3
{
  self->_flags = ($253DEAA7EC5C39FADD5BEFB730D1BE85)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x800000000000000);
}

- (BOOL)hasLocationShiftVersion
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResources_tags_637);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)resources
{
  -[GEOResources _readResources]((uint64_t)self);
  return self->_resources;
}

- (void)setResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *resources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  resources = self->_resources;
  self->_resources = v4;

}

- (void)clearResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_resources, "removeAllObjects");
}

- (void)addResource:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readResources]((uint64_t)self);
  -[GEOResources _addNoFlagsResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 352);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 352);
      *(_QWORD *)(a1 + 352) = v5;

      v4 = *(void **)(a1 + 352);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)resourcesCount
{
  -[GEOResources _readResources]((uint64_t)self);
  return -[NSMutableArray count](self->_resources, "count");
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEOResources _readResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_resources, "objectAtIndex:", a3);
}

+ (Class)resourceType
{
  return (Class)objc_opt_class();
}

- (void)_readSpatialLookupURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 501) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpatialLookupURL_tags_638);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasSpatialLookupURL
{
  -[GEOResources _readSpatialLookupURL]((uint64_t)self);
  return self->_spatialLookupURL != 0;
}

- (NSString)spatialLookupURL
{
  -[GEOResources _readSpatialLookupURL]((uint64_t)self);
  return self->_spatialLookupURL;
}

- (void)setSpatialLookupURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800800000000000uLL;
  objc_storeStrong((id *)&self->_spatialLookupURL, a3);
}

- (void)setDataSets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *dataSets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  dataSets = self->_dataSets;
  self->_dataSets = v4;

}

- (void)clearDataSets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_dataSets, "removeAllObjects");
}

- (void)addDataSet:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readDataSets]((uint64_t)self);
  -[GEOResources _addNoFlagsDataSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsDataSet:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 144);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

      v4 = *(void **)(a1 + 144);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)dataSetsCount
{
  -[GEOResources _readDataSets]((uint64_t)self);
  return -[NSMutableArray count](self->_dataSets, "count");
}

- (id)dataSetAtIndex:(unint64_t)a3
{
  -[GEOResources _readDataSets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_dataSets, "objectAtIndex:", a3);
}

+ (Class)dataSetType
{
  return (Class)objc_opt_class();
}

- (void)_readDataSetURLOverrides
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDataSetURLOverrides_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)dataSetURLOverrides
{
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  return self->_dataSetURLOverrides;
}

- (void)setDataSetURLOverrides:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *dataSetURLOverrides;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  dataSetURLOverrides = self->_dataSetURLOverrides;
  self->_dataSetURLOverrides = v4;

}

- (void)clearDataSetURLOverrides
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_dataSetURLOverrides, "removeAllObjects");
}

- (void)addDataSetURLOverride:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  -[GEOResources _addNoFlagsDataSetURLOverride:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsDataSetURLOverride:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)dataSetURLOverridesCount
{
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  return -[NSMutableArray count](self->_dataSetURLOverrides, "count");
}

- (id)dataSetURLOverrideAtIndex:(unint64_t)a3
{
  -[GEOResources _readDataSetURLOverrides]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_dataSetURLOverrides, "objectAtIndex:", a3);
}

+ (Class)dataSetURLOverrideType
{
  return (Class)objc_opt_class();
}

- (void)_readRealtimeTrafficProbeURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRealtimeTrafficProbeURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasRealtimeTrafficProbeURL
{
  -[GEOResources _readRealtimeTrafficProbeURL]((uint64_t)self);
  return self->_realtimeTrafficProbeURL != 0;
}

- (NSString)realtimeTrafficProbeURL
{
  -[GEOResources _readRealtimeTrafficProbeURL]((uint64_t)self);
  return self->_realtimeTrafficProbeURL;
}

- (void)setRealtimeTrafficProbeURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800008000000000uLL;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, a3);
}

- (void)_readBatchTrafficProbeURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchTrafficProbeURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBatchTrafficProbeURL
{
  -[GEOResources _readBatchTrafficProbeURL]((uint64_t)self);
  return self->_batchTrafficProbeURL != 0;
}

- (NSString)batchTrafficProbeURL
{
  -[GEOResources _readBatchTrafficProbeURL]((uint64_t)self);
  return self->_batchTrafficProbeURL;
}

- (void)setBatchTrafficProbeURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000002000uLL;
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, a3);
}

- (void)_readProactiveRoutingURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProactiveRoutingURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasProactiveRoutingURL
{
  -[GEOResources _readProactiveRoutingURL]((uint64_t)self);
  return self->_proactiveRoutingURL != 0;
}

- (NSString)proactiveRoutingURL
{
  -[GEOResources _readProactiveRoutingURL]((uint64_t)self);
  return self->_proactiveRoutingURL;
}

- (void)setProactiveRoutingURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000400000000uLL;
  objc_storeStrong((id *)&self->_proactiveRoutingURL, a3);
}

- (void)_readLogMessageUsageV3URL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMessageUsageV3URL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasLogMessageUsageV3URL
{
  -[GEOResources _readLogMessageUsageV3URL]((uint64_t)self);
  return self->_logMessageUsageV3URL != 0;
}

- (NSString)logMessageUsageV3URL
{
  -[GEOResources _readLogMessageUsageV3URL]((uint64_t)self);
  return self->_logMessageUsageV3URL;
}

- (void)setLogMessageUsageV3URL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000010000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, a3);
}

- (void)_readBackgroundDispatcherURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBackgroundDispatcherURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBackgroundDispatcherURL
{
  -[GEOResources _readBackgroundDispatcherURL]((uint64_t)self);
  return self->_backgroundDispatcherURL != 0;
}

- (NSString)backgroundDispatcherURL
{
  -[GEOResources _readBackgroundDispatcherURL]((uint64_t)self);
  return self->_backgroundDispatcherURL;
}

- (void)setBackgroundDispatcherURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000400uLL;
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, a3);
}

- (void)_readBluePOIDispatcherURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBluePOIDispatcherURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBluePOIDispatcherURL
{
  -[GEOResources _readBluePOIDispatcherURL]((uint64_t)self);
  return self->_bluePOIDispatcherURL != 0;
}

- (NSString)bluePOIDispatcherURL
{
  -[GEOResources _readBluePOIDispatcherURL]((uint64_t)self);
  return self->_bluePOIDispatcherURL;
}

- (void)setBluePOIDispatcherURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000004000uLL;
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, a3);
}

- (void)_readBackgroundRevGeoURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBackgroundRevGeoURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasBackgroundRevGeoURL
{
  -[GEOResources _readBackgroundRevGeoURL]((uint64_t)self);
  return self->_backgroundRevGeoURL != 0;
}

- (NSString)backgroundRevGeoURL
{
  -[GEOResources _readBackgroundRevGeoURL]((uint64_t)self);
  return self->_backgroundRevGeoURL;
}

- (void)setBackgroundRevGeoURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000800uLL;
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, a3);
}

- (void)_readWifiConnectionQualityProbeURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 503) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasWifiConnectionQualityProbeURL
{
  -[GEOResources _readWifiConnectionQualityProbeURL]((uint64_t)self);
  return self->_wifiConnectionQualityProbeURL != 0;
}

- (NSString)wifiConnectionQualityProbeURL
{
  -[GEOResources _readWifiConnectionQualityProbeURL]((uint64_t)self);
  return self->_wifiConnectionQualityProbeURL;
}

- (void)setWifiConnectionQualityProbeURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x900000000000000uLL;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, a3);
}

- (void)_readMuninBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuninBaseURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasMuninBaseURL
{
  -[GEOResources _readMuninBaseURL]((uint64_t)self);
  return self->_muninBaseURL != 0;
}

- (NSString)muninBaseURL
{
  -[GEOResources _readMuninBaseURL]((uint64_t)self);
  return self->_muninBaseURL;
}

- (void)setMuninBaseURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000020000000uLL;
  objc_storeStrong((id *)&self->_muninBaseURL, a3);
}

- (void)_readMuninVersions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuninVersions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)muninVersions
{
  -[GEOResources _readMuninVersions]((uint64_t)self);
  return self->_muninVersions;
}

- (void)setMuninVersions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *muninVersions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  muninVersions = self->_muninVersions;
  self->_muninVersions = v4;

}

- (void)clearMuninVersions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_muninVersions, "removeAllObjects");
}

- (void)addMuninVersion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readMuninVersions]((uint64_t)self);
  -[GEOResources _addNoFlagsMuninVersion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsMuninVersion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 256);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 256);
      *(_QWORD *)(a1 + 256) = v5;

      v4 = *(void **)(a1 + 256);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)muninVersionsCount
{
  -[GEOResources _readMuninVersions]((uint64_t)self);
  return -[NSMutableArray count](self->_muninVersions, "count");
}

- (id)muninVersionAtIndex:(unint64_t)a3
{
  -[GEOResources _readMuninVersions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_muninVersions, "objectAtIndex:", a3);
}

+ (Class)muninVersionType
{
  return (Class)objc_opt_class();
}

- (void)_readAuthProxyURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 497) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthProxyURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (BOOL)hasAuthProxyURL
{
  -[GEOResources _readAuthProxyURL]((uint64_t)self);
  return self->_authProxyURL != 0;
}

- (NSString)authProxyURL
{
  -[GEOResources _readAuthProxyURL]((uint64_t)self);
  return self->_authProxyURL;
}

- (void)setAuthProxyURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000000000100uLL;
  objc_storeStrong((id *)&self->_authProxyURL, a3);
}

- (void)setUrlInfoSets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *urlInfoSets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  urlInfoSets = self->_urlInfoSets;
  self->_urlInfoSets = v4;

}

- (void)clearUrlInfoSets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_urlInfoSets, "removeAllObjects");
}

- (void)addUrlInfoSet:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  -[GEOResources _addNoFlagsUrlInfoSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsUrlInfoSet:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 440);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 440);
      *(_QWORD *)(a1 + 440) = v5;

      v4 = *(void **)(a1 + 440);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)urlInfoSetsCount
{
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  return -[NSMutableArray count](self->_urlInfoSets, "count");
}

- (id)urlInfoSetAtIndex:(unint64_t)a3
{
  -[GEOResources _readUrlInfoSets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_urlInfoSets, "objectAtIndex:", a3);
}

+ (Class)urlInfoSetType
{
  return (Class)objc_opt_class();
}

- (void)_readMuninBuckets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 499) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuninBuckets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)muninBuckets
{
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  return self->_muninBuckets;
}

- (void)setMuninBuckets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *muninBuckets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  muninBuckets = self->_muninBuckets;
  self->_muninBuckets = v4;

}

- (void)clearMuninBuckets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_muninBuckets, "removeAllObjects");
}

- (void)addMuninBucket:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  -[GEOResources _addNoFlagsMuninBucket:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsMuninBucket:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 248);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 248);
      *(_QWORD *)(a1 + 248) = v5;

      v4 = *(void **)(a1 + 248);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)muninBucketsCount
{
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  return -[NSMutableArray count](self->_muninBuckets, "count");
}

- (id)muninBucketAtIndex:(unint64_t)a3
{
  -[GEOResources _readMuninBuckets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_muninBuckets, "objectAtIndex:", a3);
}

+ (Class)muninBucketType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayStrings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 498) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayStrings_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)displayStrings
{
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  return self->_displayStrings;
}

- (void)setDisplayStrings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayStrings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  displayStrings = self->_displayStrings;
  self->_displayStrings = v4;

}

- (void)clearDisplayStrings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_displayStrings, "removeAllObjects");
}

- (void)addDisplayStrings:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  -[GEOResources _addNoFlagsDisplayStrings:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsDisplayStrings:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)displayStringsCount
{
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  return -[NSMutableArray count](self->_displayStrings, "count");
}

- (id)displayStringsAtIndex:(unint64_t)a3
{
  -[GEOResources _readDisplayStrings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayStrings, "objectAtIndex:", a3);
}

+ (Class)displayStringsType
{
  return (Class)objc_opt_class();
}

- (void)_readOfflineMetadatas
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 488));
    if ((*(_BYTE *)(a1 + 500) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOResourcesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineMetadatas_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
  }
}

- (NSMutableArray)offlineMetadatas
{
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  return self->_offlineMetadatas;
}

- (void)setOfflineMetadatas:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *offlineMetadatas;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  offlineMetadatas = self->_offlineMetadatas;
  self->_offlineMetadatas = v4;

}

- (void)clearOfflineMetadatas
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_offlineMetadatas, "removeAllObjects");
}

- (void)addOfflineMetadata:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  -[GEOResources _addNoFlagsOfflineMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
}

- (void)_addNoFlagsOfflineMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 264);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 264);
      *(_QWORD *)(a1 + 264) = v5;

      v4 = *(void **)(a1 + 264);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)offlineMetadatasCount
{
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  return -[NSMutableArray count](self->_offlineMetadatas, "count");
}

- (id)offlineMetadataAtIndex:(unint64_t)a3
{
  -[GEOResources _readOfflineMetadatas]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_offlineMetadatas, "objectAtIndex:", a3);
}

+ (Class)offlineMetadataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOResources;
  -[GEOResources description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResources dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResources _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t n;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t ii;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t jj;
  void *v96;
  id v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t kk;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t mm;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t nn;
  void *v130;
  id v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t i1;
  void *v138;
  id v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t i2;
  void *v146;
  id v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i3;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  id v162;
  _QWORD v164[4];
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  uint64_t v231;

  v231 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 424), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 424), "count"));
    v214 = 0u;
    v215 = 0u;
    v216 = 0u;
    v217 = 0u;
    v6 = *(id *)(a1 + 424);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v214, v230, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v215;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v215 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v214, v230, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("tileGroup"));
  }
  if (objc_msgSend(*(id *)(a1 + 432), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 432), "count"));
    v210 = 0u;
    v211 = 0u;
    v212 = 0u;
    v213 = 0u;
    v14 = *(id *)(a1 + 432);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v210, v229, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v211;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v211 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "addObject:", v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v210, v229, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("tileSet"));
  }
  if (*(_QWORD *)(a1 + 400))
  {
    objc_msgSend((id)a1, "styleSheets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("styleSheet"));

  }
  if (*(_QWORD *)(a1 + 416))
  {
    objc_msgSend((id)a1, "textures");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("texture"));

  }
  if (*(_QWORD *)(a1 + 192))
  {
    objc_msgSend((id)a1, "fonts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("font"));

  }
  if (*(_QWORD *)(a1 + 208))
  {
    objc_msgSend((id)a1, "icons");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("icon"));

  }
  if (objc_msgSend(*(id *)(a1 + 328), "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 328), "count"));
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v209 = 0u;
    v26 = *(id *)(a1 + 328);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v206, v228, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v207;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v207 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v31, "jsonRepresentation");
          else
            objc_msgSend(v31, "dictionaryRepresentation");
          v32 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "addObject:", v32);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v206, v228, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("regionalResource"));
  }
  if (*(_QWORD *)(a1 + 472))
  {
    objc_msgSend((id)a1, "xmls");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("xml"));

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v202 = 0u;
    v203 = 0u;
    v204 = 0u;
    v205 = 0u;
    v35 = *(id *)(a1 + 64);
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v202, v227, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v203;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v203 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v40, "jsonRepresentation");
          else
            objc_msgSend(v40, "dictionaryRepresentation");
          v41 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "addObject:", v41);
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v202, v227, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("attribution"));
  }
  objc_msgSend((id)a1, "authToken");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("authToken"));

  objc_msgSend((id)a1, "resourcesURL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("resourcesURL"));

  objc_msgSend((id)a1, "searchAttributionManifestURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("searchAttributionManifestURL"));

  objc_msgSend((id)a1, "directionsURL");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("directionsURL"));

  objc_msgSend((id)a1, "etaURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("etaURL"));

  objc_msgSend((id)a1, "releaseInfo");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("releaseInfo"));

  objc_msgSend((id)a1, "batchReverseGeocoderURL");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("batchReverseGeocoderURL"));

  objc_msgSend((id)a1, "simpleETAURL");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("simpleETAURL"));

  if (*(_QWORD *)(a1 + 392))
  {
    objc_msgSend((id)a1, "styleSheetChecksums");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("styleSheetChecksum"));

  }
  if (*(_QWORD *)(a1 + 408))
  {
    objc_msgSend((id)a1, "textureChecksums");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("textureChecksum"));

  }
  if (*(_QWORD *)(a1 + 184))
  {
    objc_msgSend((id)a1, "fontChecksums");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("fontChecksum"));

  }
  if (*(_QWORD *)(a1 + 200))
  {
    objc_msgSend((id)a1, "iconChecksums");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("iconChecksum"));

  }
  if (*(_QWORD *)(a1 + 464))
  {
    objc_msgSend((id)a1, "xmlChecksums");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("xmlChecksum"));

  }
  objc_msgSend((id)a1, "addressCorrectionInitURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("addressCorrectionInitURL"));

  objc_msgSend((id)a1, "addressCorrectionUpdateURL");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("addressCorrectionUpdateURL"));

  objc_msgSend((id)a1, "polyLocationShiftURL");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("polyLocationShiftURL"));

  objc_msgSend((id)a1, "problemSubmissionURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("problemSubmissionURL"));

  objc_msgSend((id)a1, "problemStatusURL");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("problemStatusURL"));

  objc_msgSend((id)a1, "reverseGeocoderVersionsURL");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("reverseGeocoderVersionsURL"));

  objc_msgSend((id)a1, "problemCategoriesURL");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("problemCategoriesURL"));

  objc_msgSend((id)a1, "announcementsURL");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("announcementsURL"));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend((id)a1, "announcementsSupportedLanguages");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("announcementsSupportedLanguages"));

  }
  objc_msgSend((id)a1, "dispatcherURL");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("dispatcherURL"));

  objc_msgSend((id)a1, "problemOptInURL");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("problemOptInURL"));

  objc_msgSend((id)a1, "versionManifest");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v66)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v66, "jsonRepresentation");
    else
      objc_msgSend(v66, "dictionaryRepresentation");
    v68 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("versionManifest"));
  }

  objc_msgSend((id)a1, "abExperimentURL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
    objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("abExperimentURL"));

  objc_msgSend((id)a1, "businessPortalBaseURL");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
    objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("businessPortalBaseURL"));

  objc_msgSend((id)a1, "logMessageUsageURL");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("logMessageUsageURL"));

  if (objc_msgSend(*(id *)(a1 + 216), "count"))
  {
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 216), "count"));
    v198 = 0u;
    v199 = 0u;
    v200 = 0u;
    v201 = 0u;
    v73 = *(id *)(a1 + 216);
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v198, v226, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v199;
      do
      {
        for (n = 0; n != v75; ++n)
        {
          if (*(_QWORD *)v199 != v76)
            objc_enumerationMutation(v73);
          v78 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v78, "jsonRepresentation");
          else
            objc_msgSend(v78, "dictionaryRepresentation");
          v79 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "addObject:", v79);
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v198, v226, 16);
      }
      while (v75);
    }

    objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("locationShiftEnabledRegion"));
  }
  if ((*(_BYTE *)(a1 + 496) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 492));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("locationShiftVersion"));

  }
  if (objc_msgSend(*(id *)(a1 + 352), "count"))
  {
    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 352), "count"));
    v194 = 0u;
    v195 = 0u;
    v196 = 0u;
    v197 = 0u;
    v82 = *(id *)(a1 + 352);
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v194, v225, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v195;
      do
      {
        for (ii = 0; ii != v84; ++ii)
        {
          if (*(_QWORD *)v195 != v85)
            objc_enumerationMutation(v82);
          v87 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v87, "jsonRepresentation");
          else
            objc_msgSend(v87, "dictionaryRepresentation");
          v88 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v81, "addObject:", v88);
        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v194, v225, 16);
      }
      while (v84);
    }

    objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("resource"));
  }
  objc_msgSend((id)a1, "spatialLookupURL");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
    objc_msgSend(v4, "setObject:forKey:", v89, CFSTR("spatialLookupURL"));

  if (objc_msgSend(*(id *)(a1 + 144), "count"))
  {
    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
    v190 = 0u;
    v191 = 0u;
    v192 = 0u;
    v193 = 0u;
    v91 = *(id *)(a1 + 144);
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v190, v224, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v191;
      do
      {
        for (jj = 0; jj != v93; ++jj)
        {
          if (*(_QWORD *)v191 != v94)
            objc_enumerationMutation(v91);
          v96 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v96, "jsonRepresentation");
          else
            objc_msgSend(v96, "dictionaryRepresentation");
          v97 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v90, "addObject:", v97);
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v190, v224, 16);
      }
      while (v93);
    }

    objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("dataSet"));
  }
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v186 = 0u;
    v187 = 0u;
    v188 = 0u;
    v189 = 0u;
    v99 = *(id *)(a1 + 136);
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v186, v223, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v187;
      do
      {
        for (kk = 0; kk != v101; ++kk)
        {
          if (*(_QWORD *)v187 != v102)
            objc_enumerationMutation(v99);
          v104 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v104, "jsonRepresentation");
          else
            objc_msgSend(v104, "dictionaryRepresentation");
          v105 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v98, "addObject:", v105);
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v186, v223, 16);
      }
      while (v101);
    }

    objc_msgSend(v4, "setObject:forKey:", v98, CFSTR("dataSetURLOverride"));
  }
  objc_msgSend((id)a1, "realtimeTrafficProbeURL");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
    objc_msgSend(v4, "setObject:forKey:", v106, CFSTR("realtimeTrafficProbeURL"));

  objc_msgSend((id)a1, "batchTrafficProbeURL");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
    objc_msgSend(v4, "setObject:forKey:", v107, CFSTR("batchTrafficProbeURL"));

  objc_msgSend((id)a1, "proactiveRoutingURL");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
    objc_msgSend(v4, "setObject:forKey:", v108, CFSTR("proactiveRoutingURL"));

  objc_msgSend((id)a1, "logMessageUsageV3URL");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
    objc_msgSend(v4, "setObject:forKey:", v109, CFSTR("logMessageUsageV3URL"));

  objc_msgSend((id)a1, "backgroundDispatcherURL");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
    objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("backgroundDispatcherURL"));

  objc_msgSend((id)a1, "bluePOIDispatcherURL");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
    objc_msgSend(v4, "setObject:forKey:", v111, CFSTR("bluePOIDispatcherURL"));

  objc_msgSend((id)a1, "backgroundRevGeoURL");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v112)
    objc_msgSend(v4, "setObject:forKey:", v112, CFSTR("backgroundRevGeoURL"));

  objc_msgSend((id)a1, "wifiConnectionQualityProbeURL");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v113)
    objc_msgSend(v4, "setObject:forKey:", v113, CFSTR("wifiConnectionQualityProbeURL"));

  objc_msgSend((id)a1, "muninBaseURL");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v114)
    objc_msgSend(v4, "setObject:forKey:", v114, CFSTR("muninBaseURL"));

  if (objc_msgSend(*(id *)(a1 + 256), "count"))
  {
    v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v185 = 0u;
    v116 = *(id *)(a1 + 256);
    v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v182, v222, 16);
    if (v117)
    {
      v118 = v117;
      v119 = *(_QWORD *)v183;
      do
      {
        for (mm = 0; mm != v118; ++mm)
        {
          if (*(_QWORD *)v183 != v119)
            objc_enumerationMutation(v116);
          v121 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * mm);
          if ((a2 & 1) != 0)
            objc_msgSend(v121, "jsonRepresentation");
          else
            objc_msgSend(v121, "dictionaryRepresentation");
          v122 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v115, "addObject:", v122);
        }
        v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v182, v222, 16);
      }
      while (v118);
    }

    objc_msgSend(v4, "setObject:forKey:", v115, CFSTR("muninVersion"));
  }
  objc_msgSend((id)a1, "authProxyURL");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
    objc_msgSend(v4, "setObject:forKey:", v123, CFSTR("authProxyURL"));

  if (objc_msgSend(*(id *)(a1 + 440), "count"))
  {
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 440), "count"));
    v178 = 0u;
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v125 = *(id *)(a1 + 440);
    v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v178, v221, 16);
    if (v126)
    {
      v127 = v126;
      v128 = *(_QWORD *)v179;
      do
      {
        for (nn = 0; nn != v127; ++nn)
        {
          if (*(_QWORD *)v179 != v128)
            objc_enumerationMutation(v125);
          v130 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * nn);
          if ((a2 & 1) != 0)
            objc_msgSend(v130, "jsonRepresentation");
          else
            objc_msgSend(v130, "dictionaryRepresentation");
          v131 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v124, "addObject:", v131);
        }
        v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v178, v221, 16);
      }
      while (v127);
    }

    objc_msgSend(v4, "setObject:forKey:", v124, CFSTR("urlInfoSet"));
  }
  if (objc_msgSend(*(id *)(a1 + 248), "count"))
  {
    v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 248), "count"));
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    v133 = *(id *)(a1 + 248);
    v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v174, v220, 16);
    if (v134)
    {
      v135 = v134;
      v136 = *(_QWORD *)v175;
      do
      {
        for (i1 = 0; i1 != v135; ++i1)
        {
          if (*(_QWORD *)v175 != v136)
            objc_enumerationMutation(v133);
          v138 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * i1);
          if ((a2 & 1) != 0)
            objc_msgSend(v138, "jsonRepresentation");
          else
            objc_msgSend(v138, "dictionaryRepresentation");
          v139 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v132, "addObject:", v139);
        }
        v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v174, v220, 16);
      }
      while (v135);
    }

    objc_msgSend(v4, "setObject:forKey:", v132, CFSTR("muninBucket"));
  }
  if (objc_msgSend(*(id *)(a1 + 168), "count"))
  {
    v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 168), "count"));
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v141 = *(id *)(a1 + 168);
    v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v170, v219, 16);
    if (v142)
    {
      v143 = v142;
      v144 = *(_QWORD *)v171;
      do
      {
        for (i2 = 0; i2 != v143; ++i2)
        {
          if (*(_QWORD *)v171 != v144)
            objc_enumerationMutation(v141);
          v146 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * i2);
          if ((a2 & 1) != 0)
            objc_msgSend(v146, "jsonRepresentation");
          else
            objc_msgSend(v146, "dictionaryRepresentation");
          v147 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v140, "addObject:", v147);
        }
        v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v170, v219, 16);
      }
      while (v143);
    }

    objc_msgSend(v4, "setObject:forKey:", v140, CFSTR("displayStrings"));
  }
  if (objc_msgSend(*(id *)(a1 + 264), "count"))
  {
    v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 264), "count"));
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v149 = *(id *)(a1 + 264);
    v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v166, v218, 16);
    if (v150)
    {
      v151 = v150;
      v152 = *(_QWORD *)v167;
      do
      {
        for (i3 = 0; i3 != v151; ++i3)
        {
          if (*(_QWORD *)v167 != v152)
            objc_enumerationMutation(v149);
          v154 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i3);
          if ((a2 & 1) != 0)
            objc_msgSend(v154, "jsonRepresentation");
          else
            objc_msgSend(v154, "dictionaryRepresentation");
          v155 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v148, "addObject:", v155);
        }
        v151 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v166, v218, 16);
      }
      while (v151);
    }

    objc_msgSend(v4, "setObject:forKey:", v148, CFSTR("offlineMetadata"));
  }
  v156 = *(void **)(a1 + 16);
  if (v156)
  {
    objc_msgSend(v156, "dictionaryRepresentation");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v157;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v157, "count"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v164[0] = MEMORY[0x1E0C809B0];
      v164[1] = 3221225472;
      v164[2] = __42__GEOResources__dictionaryRepresentation___block_invoke;
      v164[3] = &unk_1E1C00600;
      v160 = v159;
      v165 = v160;
      objc_msgSend(v158, "enumerateKeysAndObjectsUsingBlock:", v164);
      v161 = v160;

      v158 = v161;
    }
    objc_msgSend(v4, "setObject:forKey:", v158, CFSTR("Unknown Fields"));

  }
  v162 = v4;

  return v162;
}

- (id)jsonRepresentation
{
  return -[GEOResources _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOResources__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOResources)initWithDictionary:(id)a3
{
  return (GEOResources *)-[GEOResources _initWithDictionary:isJSON:]();
}

- (id)_initWithDictionary:isJSON:
{
  uint64_t v0;
  char v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  GEOTileGroup *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  GEOTileSet *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  GEORegionalResource *v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t jj;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t kk;
  uint64_t v71;
  GEOAttribution *v72;
  GEOAttribution *v73;
  GEOAttribution *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t mm;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t nn;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i1;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i2;
  uint64_t v102;
  GEOAttribution *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i3;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t i4;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t i5;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t i6;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t i7;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t i8;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  GEOVersionManifest *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t i9;
  uint64_t v199;
  GEOMapRegion *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t i10;
  uint64_t v209;
  GEOResource *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  id v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t i11;
  uint64_t v220;
  GEODataSetDescription *v221;
  uint64_t v222;
  void *v223;
  id v224;
  uint64_t v225;
  uint64_t i12;
  void *v227;
  GEODataSetURLOverride *v228;
  id v229;
  void *v230;
  unsigned int v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  void *v236;
  id v237;
  void *v238;
  void *v239;
  id v240;
  void *v241;
  void *v242;
  id v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  void *v248;
  id v249;
  void *v250;
  void *v251;
  id v252;
  void *v253;
  void *v254;
  id v255;
  void *v256;
  void *v257;
  id v258;
  void *v259;
  void *v260;
  id v261;
  void *v262;
  void *v263;
  id v264;
  void *v265;
  void *v266;
  id v267;
  void *v268;
  void *v269;
  id v270;
  void *v271;
  void *v272;
  id v273;
  void *v274;
  void *v275;
  id v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  id v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t i13;
  uint64_t v300;
  GEOMuninVersion *v301;
  uint64_t v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  id v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t i14;
  uint64_t v311;
  GEOURLInfoSet *v312;
  uint64_t v313;
  void *v314;
  void *v315;
  id v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t i15;
  uint64_t v320;
  GEOMuninBucket *v321;
  uint64_t v322;
  void *v323;
  void *v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t i16;
  uint64_t v329;
  GEODisplayString *v330;
  uint64_t v331;
  void *v332;
  void *v333;
  id v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t i17;
  uint64_t v338;
  GEOOfflineMetadata *v339;
  uint64_t v340;
  void *v341;
  void *v343;
  id v344;
  id obj;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  uint64_t v352;
  void *v353;
  id v354;
  uint64_t v355;
  void *v356;
  char v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  uint64_t v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  _BYTE v472[128];
  _BYTE v473[128];
  _BYTE v474[128];
  _BYTE v475[128];
  _BYTE v476[128];
  _BYTE v477[128];
  _BYTE v478[128];
  _BYTE v479[128];
  _BYTE v480[128];
  _BYTE v481[128];
  _BYTE v482[128];
  _BYTE v483[128];
  _BYTE v484[128];
  _BYTE v485[128];
  _BYTE v486[128];
  _BYTE v487[128];
  _BYTE v488[128];
  _BYTE v489[128];
  _BYTE v490[128];
  _BYTE v491[128];
  _BYTE v492[128];
  _BYTE v493[128];
  _BYTE v494[128];
  _BYTE v495[128];
  _BYTE v496[128];
  _BYTE v497[128];
  _BYTE v498[128];
  _BYTE v499[128];
  uint64_t v500;

  v0 = MEMORY[0x1E0C80A78]();
  v357 = v1;
  v2 = (id)v0;
  v500 = *MEMORY[0x1E0C80C00];
  v344 = v3;
  if (v2)
  {
    v2 = (id)objc_msgSend(v2, "init");

    v356 = v2;
    if (v2)
    {
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("tileGroup"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v453 = 0u;
        v452 = 0u;
        v451 = 0u;
        v450 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v450, v495, 16);
        if (v6)
        {
          v7 = *(_QWORD *)v451;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v451 != v7)
                objc_enumerationMutation(v5);
              v9 = *(_QWORD *)(*((_QWORD *)&v450 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v10 = [GEOTileGroup alloc];
                if ((v357 & 1) != 0)
                  v11 = -[GEOTileGroup initWithJSON:](v10, "initWithJSON:", v9);
                else
                  v11 = -[GEOTileGroup initWithDictionary:](v10, "initWithDictionary:", v9);
                v12 = (void *)v11;
                objc_msgSend(v356, "addTileGroup:", v11);

              }
            }
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v450, v495, 16);
          }
          while (v6);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("tileSet"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v449 = 0u;
        v448 = 0u;
        v447 = 0u;
        v446 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v446, v494, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v447;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v447 != v16)
                objc_enumerationMutation(v14);
              v18 = *(_QWORD *)(*((_QWORD *)&v446 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = [GEOTileSet alloc];
                if ((v357 & 1) != 0)
                  v20 = -[GEOTileSet initWithJSON:](v19, "initWithJSON:", v18);
                else
                  v20 = -[GEOTileSet initWithDictionary:](v19, "initWithDictionary:", v18);
                v21 = (void *)v20;
                objc_msgSend(v356, "addTileSet:", v20);

              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v446, v494, 16);
          }
          while (v15);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("styleSheet"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v445 = 0u;
        v444 = 0u;
        v443 = 0u;
        v442 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v442, v493, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v443;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v443 != v25)
                objc_enumerationMutation(v23);
              v27 = *(void **)(*((_QWORD *)&v442 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = (void *)objc_msgSend(v27, "copy");
                objc_msgSend(v356, "addStyleSheet:", v28);

              }
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v442, v493, 16);
          }
          while (v24);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("texture"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v441 = 0u;
        v440 = 0u;
        v439 = 0u;
        v438 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v438, v492, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v439;
          do
          {
            for (m = 0; m != v31; ++m)
            {
              if (*(_QWORD *)v439 != v32)
                objc_enumerationMutation(v30);
              v34 = *(void **)(*((_QWORD *)&v438 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35 = (void *)objc_msgSend(v34, "copy");
                objc_msgSend(v356, "addTexture:", v35);

              }
            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v438, v492, 16);
          }
          while (v31);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("font"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v437 = 0u;
        v436 = 0u;
        v435 = 0u;
        v434 = 0u;
        v37 = v36;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v434, v491, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v435;
          do
          {
            for (n = 0; n != v38; ++n)
            {
              if (*(_QWORD *)v435 != v39)
                objc_enumerationMutation(v37);
              v41 = *(void **)(*((_QWORD *)&v434 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = (void *)objc_msgSend(v41, "copy");
                objc_msgSend(v356, "addFont:", v42);

              }
            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v434, v491, 16);
          }
          while (v38);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("icon"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v433 = 0u;
        v432 = 0u;
        v431 = 0u;
        v430 = 0u;
        v44 = v43;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v430, v490, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v431;
          do
          {
            for (ii = 0; ii != v45; ++ii)
            {
              if (*(_QWORD *)v431 != v46)
                objc_enumerationMutation(v44);
              v48 = *(void **)(*((_QWORD *)&v430 + 1) + 8 * ii);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v49 = (void *)objc_msgSend(v48, "copy");
                objc_msgSend(v356, "addIcon:", v49);

              }
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v430, v490, 16);
          }
          while (v45);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("regionalResource"));
      v343 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v429 = 0u;
        v428 = 0u;
        v427 = 0u;
        v426 = 0u;
        obj = v343;
        v347 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v426, v489, 16);
        if (v347)
        {
          v346 = *(_QWORD *)v427;
          do
          {
            v50 = 0;
            do
            {
              if (*(_QWORD *)v427 != v346)
              {
                v51 = v50;
                objc_enumerationMutation(obj);
                v50 = v51;
              }
              v352 = v50;
              v52 = *(void **)(*((_QWORD *)&v426 + 1) + 8 * v50);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v53 = [GEORegionalResource alloc];
                if (v53)
                {
                  v354 = v52;
                  v54 = -[GEORegionalResource init](v53, "init");
                  if (v54)
                  {
                    objc_msgSend(v354, "objectForKeyedSubscript:", CFSTR("x"));
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v56 = objc_msgSend(v55, "unsignedIntValue");
                      *(_WORD *)(v54 + 96) |= 0x100u;
                      *(_WORD *)(v54 + 96) |= 1u;
                      *(_DWORD *)(v54 + 84) = v56;
                    }

                    objc_msgSend(v354, "objectForKeyedSubscript:", CFSTR("y"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v58 = objc_msgSend(v57, "unsignedIntValue");
                      *(_WORD *)(v54 + 96) |= 0x100u;
                      *(_WORD *)(v54 + 96) |= 2u;
                      *(_DWORD *)(v54 + 88) = v58;
                    }

                    objc_msgSend(v354, "objectForKeyedSubscript:", CFSTR("z"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v60 = objc_msgSend(v59, "unsignedIntValue");
                      *(_WORD *)(v54 + 96) |= 0x100u;
                      *(_WORD *)(v54 + 96) |= 4u;
                      *(_DWORD *)(v54 + 92) = v60;
                    }

                    objc_msgSend(v354, "objectForKeyedSubscript:", CFSTR("icon"));
                    v348 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v471 = 0u;
                      v470 = 0u;
                      v469 = 0u;
                      v468 = 0u;
                      v61 = v348;
                      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v468, v499, 16);
                      if (v62)
                      {
                        v63 = *(_QWORD *)v469;
                        do
                        {
                          for (jj = 0; jj != v62; ++jj)
                          {
                            if (*(_QWORD *)v469 != v63)
                              objc_enumerationMutation(v61);
                            v65 = *(void **)(*((_QWORD *)&v468 + 1) + 8 * jj);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v66 = (void *)objc_msgSend(v65, "copy");
                              -[GEORegionalResource addIcon:](v54, v66);

                            }
                          }
                          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v468, v499, 16);
                        }
                        while (v62);
                      }

                    }
                    objc_msgSend(v354, "objectForKeyedSubscript:", CFSTR("attribution"));
                    v349 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v467 = 0u;
                      v466 = 0u;
                      v465 = 0u;
                      v464 = 0u;
                      v67 = v349;
                      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v464, v498, 16);
                      if (v68)
                      {
                        v69 = *(_QWORD *)v465;
                        do
                        {
                          for (kk = 0; kk != v68; ++kk)
                          {
                            if (*(_QWORD *)v465 != v69)
                              objc_enumerationMutation(v67);
                            v71 = *(_QWORD *)(*((_QWORD *)&v464 + 1) + 8 * kk);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v72 = [GEOAttribution alloc];
                              if ((v357 & 1) != 0)
                                v73 = -[GEOAttribution initWithJSON:](v72, "initWithJSON:", v71);
                              else
                                v73 = -[GEOAttribution initWithDictionary:](v72, "initWithDictionary:", v71);
                              v74 = v73;
                              -[GEORegionalResource addAttribution:](v54, v73);

                            }
                          }
                          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v464, v498, 16);
                        }
                        while (v68);
                      }

                    }
                    objc_msgSend(v354, "objectForKeyedSubscript:", CFSTR("iconChecksum"));
                    v350 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v463 = 0u;
                      v462 = 0u;
                      v461 = 0u;
                      v460 = 0u;
                      v75 = v350;
                      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v460, v497, 16);
                      if (v76)
                      {
                        v77 = *(_QWORD *)v461;
                        do
                        {
                          for (mm = 0; mm != v76; ++mm)
                          {
                            if (*(_QWORD *)v461 != v77)
                              objc_enumerationMutation(v75);
                            v79 = *(void **)(*((_QWORD *)&v460 + 1) + 8 * mm);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v80 = (void *)objc_msgSend(v79, "copy");
                              -[GEORegionalResource addIconChecksum:](v54, v80);

                            }
                          }
                          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v460, v497, 16);
                        }
                        while (v76);
                      }

                    }
                    objc_msgSend(v354, "objectForKeyedSubscript:", CFSTR("tileRange"));
                    v351 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v459 = 0u;
                      v458 = 0u;
                      v457 = 0u;
                      v456 = 0u;
                      v81 = v351;
                      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v456, v496, 16);
                      if (v82)
                      {
                        v83 = *(_QWORD *)v457;
                        do
                        {
                          for (nn = 0; nn != v82; ++nn)
                          {
                            if (*(_QWORD *)v457 != v83)
                              objc_enumerationMutation(v81);
                            v85 = *(void **)(*((_QWORD *)&v456 + 1) + 8 * nn);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v454 = 0uLL;
                              v455 = 0;
                              _GEOTileSetRegionFromDictionaryRepresentation(v85, &v454);
                              os_unfair_lock_lock((os_unfair_lock_t)(v54 + 80));
                              if ((*(_WORD *)(v54 + 96) & 0x10) == 0)
                              {
                                v86 = *(void **)(v54 + 8);
                                if (v86)
                                {
                                  v87 = v86;
                                  objc_sync_enter(v87);
                                  GEORegionalResourceReadSpecified(v54, *(_QWORD *)(v54 + 8), (int *)&_readTileRanges_tags);
                                  objc_sync_exit(v87);

                                }
                              }
                              os_unfair_lock_unlock((os_unfair_lock_t)(v54 + 80));
                              if (-[GEORegionalResource _reserveTileRanges:](v54, 1uLL))
                              {
                                v88 = *(_QWORD *)(v54 + 24) + 24 * *(_QWORD *)(v54 + 32);
                                *(_OWORD *)v88 = v454;
                                *(_QWORD *)(v88 + 16) = v455;
                                ++*(_QWORD *)(v54 + 32);
                              }
                              os_unfair_lock_lock_with_options();
                              *(_WORD *)(v54 + 96) |= 0x10u;
                              os_unfair_lock_unlock((os_unfair_lock_t)(v54 + 80));
                              *(_WORD *)(v54 + 96) |= 0x100u;
                            }
                          }
                          v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v456, v496, 16);
                        }
                        while (v82);
                      }

                    }
                  }

                }
                else
                {
                  v54 = 0;
                }
                objc_msgSend(v356, "addRegionalResource:", v54, v343);

              }
              v50 = v352 + 1;
            }
            while (v352 + 1 != v347);
            v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v426, v489, 16);
            v347 = v89;
          }
          while (v89);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("xml"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v425 = 0u;
        v424 = 0u;
        v423 = 0u;
        v422 = 0u;
        v91 = v90;
        v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v422, v488, 16);
        if (v92)
        {
          v93 = *(_QWORD *)v423;
          do
          {
            for (i1 = 0; i1 != v92; ++i1)
            {
              if (*(_QWORD *)v423 != v93)
                objc_enumerationMutation(v91);
              v95 = *(void **)(*((_QWORD *)&v422 + 1) + 8 * i1);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v96 = (void *)objc_msgSend(v95, "copy");
                objc_msgSend(v356, "addXml:", v96);

              }
            }
            v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v422, v488, 16);
          }
          while (v92);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("attribution"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v421 = 0u;
        v420 = 0u;
        v419 = 0u;
        v418 = 0u;
        v98 = v97;
        v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v418, v487, 16);
        if (v99)
        {
          v100 = *(_QWORD *)v419;
          do
          {
            for (i2 = 0; i2 != v99; ++i2)
            {
              if (*(_QWORD *)v419 != v100)
                objc_enumerationMutation(v98);
              v102 = *(_QWORD *)(*((_QWORD *)&v418 + 1) + 8 * i2);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v103 = [GEOAttribution alloc];
                if ((v357 & 1) != 0)
                  v104 = -[GEOAttribution initWithJSON:](v103, "initWithJSON:", v102);
                else
                  v104 = -[GEOAttribution initWithDictionary:](v103, "initWithDictionary:", v102);
                v105 = (void *)v104;
                objc_msgSend(v356, "addAttribution:", v104, v343);

              }
            }
            v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v418, v487, 16);
          }
          while (v99);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("authToken"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v107 = (void *)objc_msgSend(v106, "copy");
        objc_msgSend(v356, "setAuthToken:", v107);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("resourcesURL"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v109 = (void *)objc_msgSend(v108, "copy");
        objc_msgSend(v356, "setResourcesURL:", v109);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("searchAttributionManifestURL"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v111 = (void *)objc_msgSend(v110, "copy");
        objc_msgSend(v356, "setSearchAttributionManifestURL:", v111);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("directionsURL"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v113 = (void *)objc_msgSend(v112, "copy");
        objc_msgSend(v356, "setDirectionsURL:", v113);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("etaURL"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v115 = (void *)objc_msgSend(v114, "copy");
        objc_msgSend(v356, "setEtaURL:", v115);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("releaseInfo"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v117 = (void *)objc_msgSend(v116, "copy");
        objc_msgSend(v356, "setReleaseInfo:", v117);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("batchReverseGeocoderURL"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v119 = (void *)objc_msgSend(v118, "copy");
        objc_msgSend(v356, "setBatchReverseGeocoderURL:", v119);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("simpleETAURL"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v121 = (void *)objc_msgSend(v120, "copy");
        objc_msgSend(v356, "setSimpleETAURL:", v121);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("styleSheetChecksum"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v416 = 0u;
        v417 = 0u;
        v414 = 0u;
        v415 = 0u;
        v123 = v122;
        v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v414, v486, 16);
        if (v124)
        {
          v125 = *(_QWORD *)v415;
          do
          {
            for (i3 = 0; i3 != v124; ++i3)
            {
              if (*(_QWORD *)v415 != v125)
                objc_enumerationMutation(v123);
              v127 = *(void **)(*((_QWORD *)&v414 + 1) + 8 * i3);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v128 = (void *)objc_msgSend(v127, "copy");
                objc_msgSend(v356, "addStyleSheetChecksum:", v128);

              }
            }
            v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v414, v486, 16);
          }
          while (v124);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("textureChecksum"));
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v412 = 0u;
        v413 = 0u;
        v410 = 0u;
        v411 = 0u;
        v130 = v129;
        v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v410, v485, 16);
        if (v131)
        {
          v132 = *(_QWORD *)v411;
          do
          {
            for (i4 = 0; i4 != v131; ++i4)
            {
              if (*(_QWORD *)v411 != v132)
                objc_enumerationMutation(v130);
              v134 = *(void **)(*((_QWORD *)&v410 + 1) + 8 * i4);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v135 = (void *)objc_msgSend(v134, "copy");
                objc_msgSend(v356, "addTextureChecksum:", v135);

              }
            }
            v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v410, v485, 16);
          }
          while (v131);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("fontChecksum"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v408 = 0u;
        v409 = 0u;
        v406 = 0u;
        v407 = 0u;
        v137 = v136;
        v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v406, v484, 16);
        if (v138)
        {
          v139 = *(_QWORD *)v407;
          do
          {
            for (i5 = 0; i5 != v138; ++i5)
            {
              if (*(_QWORD *)v407 != v139)
                objc_enumerationMutation(v137);
              v141 = *(void **)(*((_QWORD *)&v406 + 1) + 8 * i5);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v142 = (void *)objc_msgSend(v141, "copy");
                objc_msgSend(v356, "addFontChecksum:", v142);

              }
            }
            v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v406, v484, 16);
          }
          while (v138);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("iconChecksum"));
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v404 = 0u;
        v405 = 0u;
        v402 = 0u;
        v403 = 0u;
        v144 = v143;
        v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v402, v483, 16);
        if (v145)
        {
          v146 = *(_QWORD *)v403;
          do
          {
            for (i6 = 0; i6 != v145; ++i6)
            {
              if (*(_QWORD *)v403 != v146)
                objc_enumerationMutation(v144);
              v148 = *(void **)(*((_QWORD *)&v402 + 1) + 8 * i6);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v149 = (void *)objc_msgSend(v148, "copy");
                objc_msgSend(v356, "addIconChecksum:", v149);

              }
            }
            v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v402, v483, 16);
          }
          while (v145);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("xmlChecksum"));
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v400 = 0u;
        v401 = 0u;
        v398 = 0u;
        v399 = 0u;
        v151 = v150;
        v152 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v398, v482, 16);
        if (v152)
        {
          v153 = *(_QWORD *)v399;
          do
          {
            for (i7 = 0; i7 != v152; ++i7)
            {
              if (*(_QWORD *)v399 != v153)
                objc_enumerationMutation(v151);
              v155 = *(void **)(*((_QWORD *)&v398 + 1) + 8 * i7);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v156 = (void *)objc_msgSend(v155, "copy");
                objc_msgSend(v356, "addXmlChecksum:", v156);

              }
            }
            v152 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v398, v482, 16);
          }
          while (v152);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("addressCorrectionInitURL"));
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v158 = (void *)objc_msgSend(v157, "copy");
        objc_msgSend(v356, "setAddressCorrectionInitURL:", v158);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("addressCorrectionUpdateURL"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v160 = (void *)objc_msgSend(v159, "copy");
        objc_msgSend(v356, "setAddressCorrectionUpdateURL:", v160);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("polyLocationShiftURL"));
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v162 = (void *)objc_msgSend(v161, "copy");
        objc_msgSend(v356, "setPolyLocationShiftURL:", v162);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("problemSubmissionURL"));
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v164 = (void *)objc_msgSend(v163, "copy");
        objc_msgSend(v356, "setProblemSubmissionURL:", v164);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("problemStatusURL"));
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v166 = (void *)objc_msgSend(v165, "copy");
        objc_msgSend(v356, "setProblemStatusURL:", v166);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("reverseGeocoderVersionsURL"));
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v168 = (void *)objc_msgSend(v167, "copy");
        objc_msgSend(v356, "setReverseGeocoderVersionsURL:", v168);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("problemCategoriesURL"));
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v170 = (void *)objc_msgSend(v169, "copy");
        objc_msgSend(v356, "setProblemCategoriesURL:", v170);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("announcementsURL"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v172 = (void *)objc_msgSend(v171, "copy");
        objc_msgSend(v356, "setAnnouncementsURL:", v172);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("announcementsSupportedLanguages"));
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v396 = 0u;
        v397 = 0u;
        v394 = 0u;
        v395 = 0u;
        v174 = v173;
        v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v394, v481, 16);
        if (v175)
        {
          v176 = *(_QWORD *)v395;
          do
          {
            for (i8 = 0; i8 != v175; ++i8)
            {
              if (*(_QWORD *)v395 != v176)
                objc_enumerationMutation(v174);
              v178 = *(void **)(*((_QWORD *)&v394 + 1) + 8 * i8);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v179 = (void *)objc_msgSend(v178, "copy");
                objc_msgSend(v356, "addAnnouncementsSupportedLanguages:", v179);

              }
            }
            v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v394, v481, 16);
          }
          while (v175);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("dispatcherURL"));
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v181 = (void *)objc_msgSend(v180, "copy");
        objc_msgSend(v356, "setDispatcherURL:", v181);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("problemOptInURL"));
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v183 = (void *)objc_msgSend(v182, "copy");
        objc_msgSend(v356, "setProblemOptInURL:", v183);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("versionManifest"));
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v185 = [GEOVersionManifest alloc];
        if ((v357 & 1) != 0)
          v186 = -[GEOVersionManifest initWithJSON:](v185, "initWithJSON:", v184);
        else
          v186 = -[GEOVersionManifest initWithDictionary:](v185, "initWithDictionary:", v184);
        v187 = (void *)v186;
        objc_msgSend(v356, "setVersionManifest:", v186, v343);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("abExperimentURL"));
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v189 = (void *)objc_msgSend(v188, "copy");
        objc_msgSend(v356, "setAbExperimentURL:", v189);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("businessPortalBaseURL"));
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v191 = (void *)objc_msgSend(v190, "copy");
        objc_msgSend(v356, "setBusinessPortalBaseURL:", v191);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("logMessageUsageURL"));
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v193 = (void *)objc_msgSend(v192, "copy");
        objc_msgSend(v356, "setLogMessageUsageURL:", v193);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("locationShiftEnabledRegion"));
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v392 = 0u;
        v393 = 0u;
        v390 = 0u;
        v391 = 0u;
        v195 = v194;
        v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v390, v480, 16);
        if (v196)
        {
          v197 = *(_QWORD *)v391;
          do
          {
            for (i9 = 0; i9 != v196; ++i9)
            {
              if (*(_QWORD *)v391 != v197)
                objc_enumerationMutation(v195);
              v199 = *(_QWORD *)(*((_QWORD *)&v390 + 1) + 8 * i9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v200 = [GEOMapRegion alloc];
                if ((v357 & 1) != 0)
                  v201 = -[GEOMapRegion initWithJSON:](v200, "initWithJSON:", v199);
                else
                  v201 = -[GEOMapRegion initWithDictionary:](v200, "initWithDictionary:", v199);
                v202 = (void *)v201;
                objc_msgSend(v356, "addLocationShiftEnabledRegion:", v201, v343);

              }
            }
            v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v390, v480, 16);
          }
          while (v196);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("locationShiftVersion"));
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v356, "setLocationShiftVersion:", objc_msgSend(v203, "unsignedIntValue"));

      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("resource"));
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v388 = 0u;
        v389 = 0u;
        v386 = 0u;
        v387 = 0u;
        v205 = v204;
        v206 = objc_msgSend(v205, "countByEnumeratingWithState:objects:count:", &v386, v479, 16);
        if (v206)
        {
          v207 = *(_QWORD *)v387;
          do
          {
            for (i10 = 0; i10 != v206; ++i10)
            {
              if (*(_QWORD *)v387 != v207)
                objc_enumerationMutation(v205);
              v209 = *(_QWORD *)(*((_QWORD *)&v386 + 1) + 8 * i10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v210 = [GEOResource alloc];
                if ((v357 & 1) != 0)
                  v211 = -[GEOResource initWithJSON:](v210, "initWithJSON:", v209);
                else
                  v211 = -[GEOResource initWithDictionary:](v210, "initWithDictionary:", v209);
                v212 = (void *)v211;
                objc_msgSend(v356, "addResource:", v211, v343);

              }
            }
            v206 = objc_msgSend(v205, "countByEnumeratingWithState:objects:count:", &v386, v479, 16);
          }
          while (v206);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("spatialLookupURL"));
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v214 = (void *)objc_msgSend(v213, "copy");
        objc_msgSend(v356, "setSpatialLookupURL:", v214);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("dataSet"));
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v384 = 0u;
        v385 = 0u;
        v382 = 0u;
        v383 = 0u;
        v216 = v215;
        v217 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v382, v478, 16);
        if (v217)
        {
          v218 = *(_QWORD *)v383;
          do
          {
            for (i11 = 0; i11 != v217; ++i11)
            {
              if (*(_QWORD *)v383 != v218)
                objc_enumerationMutation(v216);
              v220 = *(_QWORD *)(*((_QWORD *)&v382 + 1) + 8 * i11);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v221 = [GEODataSetDescription alloc];
                if ((v357 & 1) != 0)
                  v222 = -[GEODataSetDescription initWithJSON:](v221, "initWithJSON:", v220);
                else
                  v222 = -[GEODataSetDescription initWithDictionary:](v221, "initWithDictionary:", v220);
                v223 = (void *)v222;
                objc_msgSend(v356, "addDataSet:", v222, v343);

              }
            }
            v217 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v382, v478, 16);
          }
          while (v217);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("dataSetURLOverride"));
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v380 = 0u;
        v381 = 0u;
        v378 = 0u;
        v379 = 0u;
        v224 = v353;
        v225 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v378, v477, 16);
        if (v225)
        {
          v355 = *(_QWORD *)v379;
          do
          {
            for (i12 = 0; i12 != v225; ++i12)
            {
              if (*(_QWORD *)v379 != v355)
                objc_enumerationMutation(v224);
              v227 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * i12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v228 = [GEODataSetURLOverride alloc];
                if (v228)
                {
                  v229 = v227;
                  v228 = -[GEODataSetURLOverride init](v228, "init");
                  if (v228)
                  {
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("dataSet"));
                    v230 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v231 = objc_msgSend(v230, "unsignedIntValue");
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      *(_DWORD *)&v228->_flags |= 1u;
                      v228->_dataSet = v231;
                    }

                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("directionsURL"));
                    v232 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v233 = (void *)objc_msgSend(v232, "copy");
                      v234 = v233;
                      *(_DWORD *)&v228->_flags |= 0x80u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_directionsURL, v233);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("etaURL"));
                    v235 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v236 = (void *)objc_msgSend(v235, "copy");
                      v237 = v236;
                      *(_DWORD *)&v228->_flags |= 0x200u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_etaURL, v236);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("batchReverseGeocoderURL"));
                    v238 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v239 = (void *)objc_msgSend(v238, "copy");
                      v240 = v239;
                      *(_DWORD *)&v228->_flags |= 0x20u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_batchReverseGeocoderURL, v239);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("simpleETAURL"));
                    v241 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v242 = (void *)objc_msgSend(v241, "copy");
                      v243 = v242;
                      *(_DWORD *)&v228->_flags |= 0x8000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_simpleETAURL, v242);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("addressCorrectionInitURL"));
                    v244 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v245 = (void *)objc_msgSend(v244, "copy");
                      v246 = v245;
                      *(_DWORD *)&v228->_flags |= 4u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_addressCorrectionInitURL, v245);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("addressCorrectionUpdateURL"));
                    v247 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v248 = (void *)objc_msgSend(v247, "copy");
                      v249 = v248;
                      *(_DWORD *)&v228->_flags |= 8u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_addressCorrectionUpdateURL, v248);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("problemSubmissionURL"));
                    v250 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v251 = (void *)objc_msgSend(v250, "copy");
                      v252 = v251;
                      *(_DWORD *)&v228->_flags |= 0x4000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemSubmissionURL, v251);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("problemStatusURL"));
                    v253 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v254 = (void *)objc_msgSend(v253, "copy");
                      v255 = v254;
                      *(_DWORD *)&v228->_flags |= 0x2000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemStatusURL, v254);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("problemCategoriesURL"));
                    v256 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v257 = (void *)objc_msgSend(v256, "copy");
                      v258 = v257;
                      *(_DWORD *)&v228->_flags |= 0x800u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemCategoriesURL, v257);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("announcementsURL"));
                    v259 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v260 = (void *)objc_msgSend(v259, "copy");
                      v261 = v260;
                      *(_DWORD *)&v228->_flags |= 0x10u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_announcementsURL, v260);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("dispatcherURL"));
                    v262 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v263 = (void *)objc_msgSend(v262, "copy");
                      v264 = v263;
                      *(_DWORD *)&v228->_flags |= 0x100u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_dispatcherURL, v263);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("problemOptInURL"));
                    v265 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v266 = (void *)objc_msgSend(v265, "copy");
                      v267 = v266;
                      *(_DWORD *)&v228->_flags |= 0x1000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_problemOptInURL, v266);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("businessPortalBaseURL"));
                    v268 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v269 = (void *)objc_msgSend(v268, "copy");
                      v270 = v269;
                      *(_DWORD *)&v228->_flags |= 0x40u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_businessPortalBaseURL, v269);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("logMessageUsageURL"));
                    v271 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v272 = (void *)objc_msgSend(v271, "copy");
                      v273 = v272;
                      *(_DWORD *)&v228->_flags |= 0x400u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_logMessageUsageURL, v272);

                    }
                    objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("spatialLookupURL"));
                    v274 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v275 = (void *)objc_msgSend(v274, "copy");
                      v276 = v275;
                      *(_DWORD *)&v228->_flags |= 0x10000u;
                      *(_DWORD *)&v228->_flags |= 0x20000u;
                      objc_storeStrong((id *)&v228->_spatialLookupURL, v275);

                    }
                  }

                }
                objc_msgSend(v356, "addDataSetURLOverride:", v228, v343);

              }
            }
            v225 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v378, v477, 16);
          }
          while (v225);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("realtimeTrafficProbeURL"));
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v278 = (void *)objc_msgSend(v277, "copy");
        objc_msgSend(v356, "setRealtimeTrafficProbeURL:", v278);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("batchTrafficProbeURL"));
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v280 = (void *)objc_msgSend(v279, "copy");
        objc_msgSend(v356, "setBatchTrafficProbeURL:", v280);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("proactiveRoutingURL"));
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v282 = (void *)objc_msgSend(v281, "copy");
        objc_msgSend(v356, "setProactiveRoutingURL:", v282);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("logMessageUsageV3URL"));
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v284 = (void *)objc_msgSend(v283, "copy");
        objc_msgSend(v356, "setLogMessageUsageV3URL:", v284);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("backgroundDispatcherURL"));
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v286 = (void *)objc_msgSend(v285, "copy");
        objc_msgSend(v356, "setBackgroundDispatcherURL:", v286);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("bluePOIDispatcherURL"));
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v288 = (void *)objc_msgSend(v287, "copy");
        objc_msgSend(v356, "setBluePOIDispatcherURL:", v288);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("backgroundRevGeoURL"));
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v290 = (void *)objc_msgSend(v289, "copy");
        objc_msgSend(v356, "setBackgroundRevGeoURL:", v290);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("wifiConnectionQualityProbeURL"));
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v292 = (void *)objc_msgSend(v291, "copy");
        objc_msgSend(v356, "setWifiConnectionQualityProbeURL:", v292);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("muninBaseURL"));
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v294 = (void *)objc_msgSend(v293, "copy");
        objc_msgSend(v356, "setMuninBaseURL:", v294);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("muninVersion"));
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v376 = 0u;
        v377 = 0u;
        v374 = 0u;
        v375 = 0u;
        v296 = v295;
        v297 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v374, v476, 16);
        if (v297)
        {
          v298 = *(_QWORD *)v375;
          do
          {
            for (i13 = 0; i13 != v297; ++i13)
            {
              if (*(_QWORD *)v375 != v298)
                objc_enumerationMutation(v296);
              v300 = *(_QWORD *)(*((_QWORD *)&v374 + 1) + 8 * i13);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v301 = [GEOMuninVersion alloc];
                if ((v357 & 1) != 0)
                  v302 = -[GEOMuninVersion initWithJSON:](v301, "initWithJSON:", v300);
                else
                  v302 = -[GEOMuninVersion initWithDictionary:](v301, "initWithDictionary:", v300);
                v303 = (void *)v302;
                objc_msgSend(v356, "addMuninVersion:", v302, v343);

              }
            }
            v297 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v374, v476, 16);
          }
          while (v297);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("authProxyURL"));
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v305 = (void *)objc_msgSend(v304, "copy");
        objc_msgSend(v356, "setAuthProxyURL:", v305);

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("urlInfoSet"));
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v372 = 0u;
        v373 = 0u;
        v370 = 0u;
        v371 = 0u;
        v307 = v306;
        v308 = objc_msgSend(v307, "countByEnumeratingWithState:objects:count:", &v370, v475, 16);
        if (v308)
        {
          v309 = *(_QWORD *)v371;
          do
          {
            for (i14 = 0; i14 != v308; ++i14)
            {
              if (*(_QWORD *)v371 != v309)
                objc_enumerationMutation(v307);
              v311 = *(_QWORD *)(*((_QWORD *)&v370 + 1) + 8 * i14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v312 = [GEOURLInfoSet alloc];
                if ((v357 & 1) != 0)
                  v313 = -[GEOURLInfoSet initWithJSON:](v312, "initWithJSON:", v311);
                else
                  v313 = -[GEOURLInfoSet initWithDictionary:](v312, "initWithDictionary:", v311);
                v314 = (void *)v313;
                objc_msgSend(v356, "addUrlInfoSet:", v313, v343);

              }
            }
            v308 = objc_msgSend(v307, "countByEnumeratingWithState:objects:count:", &v370, v475, 16);
          }
          while (v308);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("muninBucket"));
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v368 = 0u;
        v369 = 0u;
        v366 = 0u;
        v367 = 0u;
        v316 = v315;
        v317 = objc_msgSend(v316, "countByEnumeratingWithState:objects:count:", &v366, v474, 16);
        if (v317)
        {
          v318 = *(_QWORD *)v367;
          do
          {
            for (i15 = 0; i15 != v317; ++i15)
            {
              if (*(_QWORD *)v367 != v318)
                objc_enumerationMutation(v316);
              v320 = *(_QWORD *)(*((_QWORD *)&v366 + 1) + 8 * i15);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v321 = [GEOMuninBucket alloc];
                if ((v357 & 1) != 0)
                  v322 = -[GEOMuninBucket initWithJSON:](v321, "initWithJSON:", v320);
                else
                  v322 = -[GEOMuninBucket initWithDictionary:](v321, "initWithDictionary:", v320);
                v323 = (void *)v322;
                objc_msgSend(v356, "addMuninBucket:", v322, v343);

              }
            }
            v317 = objc_msgSend(v316, "countByEnumeratingWithState:objects:count:", &v366, v474, 16);
          }
          while (v317);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("displayStrings"));
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v364 = 0u;
        v365 = 0u;
        v362 = 0u;
        v363 = 0u;
        v325 = v324;
        v326 = objc_msgSend(v325, "countByEnumeratingWithState:objects:count:", &v362, v473, 16);
        if (v326)
        {
          v327 = *(_QWORD *)v363;
          do
          {
            for (i16 = 0; i16 != v326; ++i16)
            {
              if (*(_QWORD *)v363 != v327)
                objc_enumerationMutation(v325);
              v329 = *(_QWORD *)(*((_QWORD *)&v362 + 1) + 8 * i16);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v330 = [GEODisplayString alloc];
                if ((v357 & 1) != 0)
                  v331 = -[GEODisplayString initWithJSON:](v330, "initWithJSON:", v329);
                else
                  v331 = -[GEODisplayString initWithDictionary:](v330, "initWithDictionary:", v329);
                v332 = (void *)v331;
                objc_msgSend(v356, "addDisplayStrings:", v331, v343);

              }
            }
            v326 = objc_msgSend(v325, "countByEnumeratingWithState:objects:count:", &v362, v473, 16);
          }
          while (v326);
        }

      }
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("offlineMetadata"));
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v360 = 0u;
        v361 = 0u;
        v358 = 0u;
        v359 = 0u;
        v334 = v333;
        v335 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v358, v472, 16);
        if (v335)
        {
          v336 = *(_QWORD *)v359;
          do
          {
            for (i17 = 0; i17 != v335; ++i17)
            {
              if (*(_QWORD *)v359 != v336)
                objc_enumerationMutation(v334);
              v338 = *(_QWORD *)(*((_QWORD *)&v358 + 1) + 8 * i17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v339 = [GEOOfflineMetadata alloc];
                if ((v357 & 1) != 0)
                  v340 = -[GEOOfflineMetadata initWithJSON:](v339, "initWithJSON:", v338);
                else
                  v340 = -[GEOOfflineMetadata initWithDictionary:](v339, "initWithDictionary:", v338);
                v341 = (void *)v340;
                objc_msgSend(v356, "addOfflineMetadata:", v340, v343);

              }
            }
            v335 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v358, v472, 16);
          }
          while (v335);
        }

      }
      v2 = v356;

    }
  }

  return v2;
}

- (GEOResources)initWithJSON:(id)a3
{
  return (GEOResources *)-[GEOResources _initWithDictionary:isJSON:]();
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_723;
    else
      v8 = (int *)&readAll__nonRecursiveTag_724;
    GEOResourcesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOResourcesCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourcesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourcesReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOResources _readLocationShiftEnabledRegions]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_locationShiftEnabledRegions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t jj;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t kk;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t mm;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t nn;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t i1;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t i2;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t i3;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t i4;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t i5;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t i6;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t i7;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t i8;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t i9;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t i10;
  void *v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t i11;
  void *v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t i12;
  void *v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t i13;
  void *v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t i14;
  void *v99;
  id *v100;

  v100 = (id *)a3;
  -[GEOResources readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v100 + 1, self->_reader);
  *((_DWORD *)v100 + 120) = self->_readerMarkPos;
  *((_DWORD *)v100 + 121) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOResources tileGroupsCount](self, "tileGroupsCount"))
  {
    objc_msgSend(v100, "clearTileGroups");
    v4 = -[GEOResources tileGroupsCount](self, "tileGroupsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOResources tileGroupAtIndex:](self, "tileGroupAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addTileGroup:", v7);

      }
    }
  }
  if (-[GEOResources tileSetsCount](self, "tileSetsCount"))
  {
    objc_msgSend(v100, "clearTileSets");
    v8 = -[GEOResources tileSetsCount](self, "tileSetsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOResources tileSetAtIndex:](self, "tileSetAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addTileSet:", v11);

      }
    }
  }
  if (-[GEOResources styleSheetsCount](self, "styleSheetsCount"))
  {
    objc_msgSend(v100, "clearStyleSheets");
    v12 = -[GEOResources styleSheetsCount](self, "styleSheetsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOResources styleSheetAtIndex:](self, "styleSheetAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addStyleSheet:", v15);

      }
    }
  }
  if (-[GEOResources texturesCount](self, "texturesCount"))
  {
    objc_msgSend(v100, "clearTextures");
    v16 = -[GEOResources texturesCount](self, "texturesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOResources textureAtIndex:](self, "textureAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addTexture:", v19);

      }
    }
  }
  if (-[GEOResources fontsCount](self, "fontsCount"))
  {
    objc_msgSend(v100, "clearFonts");
    v20 = -[GEOResources fontsCount](self, "fontsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[GEOResources fontAtIndex:](self, "fontAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addFont:", v23);

      }
    }
  }
  if (-[GEOResources iconsCount](self, "iconsCount"))
  {
    objc_msgSend(v100, "clearIcons");
    v24 = -[GEOResources iconsCount](self, "iconsCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[GEOResources iconAtIndex:](self, "iconAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addIcon:", v27);

      }
    }
  }
  if (-[GEOResources regionalResourcesCount](self, "regionalResourcesCount"))
  {
    objc_msgSend(v100, "clearRegionalResources");
    v28 = -[GEOResources regionalResourcesCount](self, "regionalResourcesCount");
    if (v28)
    {
      v29 = v28;
      for (jj = 0; jj != v29; ++jj)
      {
        -[GEOResources regionalResourceAtIndex:](self, "regionalResourceAtIndex:", jj);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addRegionalResource:", v31);

      }
    }
  }
  if (-[GEOResources xmlsCount](self, "xmlsCount"))
  {
    objc_msgSend(v100, "clearXmls");
    v32 = -[GEOResources xmlsCount](self, "xmlsCount");
    if (v32)
    {
      v33 = v32;
      for (kk = 0; kk != v33; ++kk)
      {
        -[GEOResources xmlAtIndex:](self, "xmlAtIndex:", kk);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addXml:", v35);

      }
    }
  }
  if (-[GEOResources attributionsCount](self, "attributionsCount"))
  {
    objc_msgSend(v100, "clearAttributions");
    v36 = -[GEOResources attributionsCount](self, "attributionsCount");
    if (v36)
    {
      v37 = v36;
      for (mm = 0; mm != v37; ++mm)
      {
        -[GEOResources attributionAtIndex:](self, "attributionAtIndex:", mm);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addAttribution:", v39);

      }
    }
  }
  if (self->_authToken)
    objc_msgSend(v100, "setAuthToken:");
  if (self->_resourcesURL)
    objc_msgSend(v100, "setResourcesURL:");
  if (self->_searchAttributionManifestURL)
    objc_msgSend(v100, "setSearchAttributionManifestURL:");
  if (self->_directionsURL)
    objc_msgSend(v100, "setDirectionsURL:");
  if (self->_etaURL)
    objc_msgSend(v100, "setEtaURL:");
  if (self->_releaseInfo)
    objc_msgSend(v100, "setReleaseInfo:");
  if (self->_batchReverseGeocoderURL)
    objc_msgSend(v100, "setBatchReverseGeocoderURL:");
  if (self->_simpleETAURL)
    objc_msgSend(v100, "setSimpleETAURL:");
  if (-[GEOResources styleSheetChecksumsCount](self, "styleSheetChecksumsCount"))
  {
    objc_msgSend(v100, "clearStyleSheetChecksums");
    v40 = -[GEOResources styleSheetChecksumsCount](self, "styleSheetChecksumsCount");
    if (v40)
    {
      v41 = v40;
      for (nn = 0; nn != v41; ++nn)
      {
        -[GEOResources styleSheetChecksumAtIndex:](self, "styleSheetChecksumAtIndex:", nn);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addStyleSheetChecksum:", v43);

      }
    }
  }
  if (-[GEOResources textureChecksumsCount](self, "textureChecksumsCount"))
  {
    objc_msgSend(v100, "clearTextureChecksums");
    v44 = -[GEOResources textureChecksumsCount](self, "textureChecksumsCount");
    if (v44)
    {
      v45 = v44;
      for (i1 = 0; i1 != v45; ++i1)
      {
        -[GEOResources textureChecksumAtIndex:](self, "textureChecksumAtIndex:", i1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addTextureChecksum:", v47);

      }
    }
  }
  if (-[GEOResources fontChecksumsCount](self, "fontChecksumsCount"))
  {
    objc_msgSend(v100, "clearFontChecksums");
    v48 = -[GEOResources fontChecksumsCount](self, "fontChecksumsCount");
    if (v48)
    {
      v49 = v48;
      for (i2 = 0; i2 != v49; ++i2)
      {
        -[GEOResources fontChecksumAtIndex:](self, "fontChecksumAtIndex:", i2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addFontChecksum:", v51);

      }
    }
  }
  if (-[GEOResources iconChecksumsCount](self, "iconChecksumsCount"))
  {
    objc_msgSend(v100, "clearIconChecksums");
    v52 = -[GEOResources iconChecksumsCount](self, "iconChecksumsCount");
    if (v52)
    {
      v53 = v52;
      for (i3 = 0; i3 != v53; ++i3)
      {
        -[GEOResources iconChecksumAtIndex:](self, "iconChecksumAtIndex:", i3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addIconChecksum:", v55);

      }
    }
  }
  if (-[GEOResources xmlChecksumsCount](self, "xmlChecksumsCount"))
  {
    objc_msgSend(v100, "clearXmlChecksums");
    v56 = -[GEOResources xmlChecksumsCount](self, "xmlChecksumsCount");
    if (v56)
    {
      v57 = v56;
      for (i4 = 0; i4 != v57; ++i4)
      {
        -[GEOResources xmlChecksumAtIndex:](self, "xmlChecksumAtIndex:", i4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addXmlChecksum:", v59);

      }
    }
  }
  if (self->_addressCorrectionInitURL)
    objc_msgSend(v100, "setAddressCorrectionInitURL:");
  if (self->_addressCorrectionUpdateURL)
    objc_msgSend(v100, "setAddressCorrectionUpdateURL:");
  if (self->_polyLocationShiftURL)
    objc_msgSend(v100, "setPolyLocationShiftURL:");
  if (self->_problemSubmissionURL)
    objc_msgSend(v100, "setProblemSubmissionURL:");
  if (self->_problemStatusURL)
    objc_msgSend(v100, "setProblemStatusURL:");
  if (self->_reverseGeocoderVersionsURL)
    objc_msgSend(v100, "setReverseGeocoderVersionsURL:");
  if (self->_problemCategoriesURL)
    objc_msgSend(v100, "setProblemCategoriesURL:");
  if (self->_announcementsURL)
    objc_msgSend(v100, "setAnnouncementsURL:");
  if (-[GEOResources announcementsSupportedLanguagesCount](self, "announcementsSupportedLanguagesCount"))
  {
    objc_msgSend(v100, "clearAnnouncementsSupportedLanguages");
    v60 = -[GEOResources announcementsSupportedLanguagesCount](self, "announcementsSupportedLanguagesCount");
    if (v60)
    {
      v61 = v60;
      for (i5 = 0; i5 != v61; ++i5)
      {
        -[GEOResources announcementsSupportedLanguagesAtIndex:](self, "announcementsSupportedLanguagesAtIndex:", i5);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addAnnouncementsSupportedLanguages:", v63);

      }
    }
  }
  if (self->_dispatcherURL)
    objc_msgSend(v100, "setDispatcherURL:");
  if (self->_problemOptInURL)
    objc_msgSend(v100, "setProblemOptInURL:");
  if (self->_versionManifest)
    objc_msgSend(v100, "setVersionManifest:");
  if (self->_abExperimentURL)
    objc_msgSend(v100, "setAbExperimentURL:");
  if (self->_businessPortalBaseURL)
    objc_msgSend(v100, "setBusinessPortalBaseURL:");
  if (self->_logMessageUsageURL)
    objc_msgSend(v100, "setLogMessageUsageURL:");
  if (-[GEOResources locationShiftEnabledRegionsCount](self, "locationShiftEnabledRegionsCount"))
  {
    objc_msgSend(v100, "clearLocationShiftEnabledRegions");
    v64 = -[GEOResources locationShiftEnabledRegionsCount](self, "locationShiftEnabledRegionsCount");
    if (v64)
    {
      v65 = v64;
      for (i6 = 0; i6 != v65; ++i6)
      {
        -[GEOResources locationShiftEnabledRegionAtIndex:](self, "locationShiftEnabledRegionAtIndex:", i6);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addLocationShiftEnabledRegion:", v67);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v100 + 123) = self->_locationShiftVersion;
    v100[62] = (id)((unint64_t)v100[62] | 1);
  }
  if (-[GEOResources resourcesCount](self, "resourcesCount"))
  {
    objc_msgSend(v100, "clearResources");
    v68 = -[GEOResources resourcesCount](self, "resourcesCount");
    if (v68)
    {
      v69 = v68;
      for (i7 = 0; i7 != v69; ++i7)
      {
        -[GEOResources resourceAtIndex:](self, "resourceAtIndex:", i7);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addResource:", v71);

      }
    }
  }
  if (self->_spatialLookupURL)
    objc_msgSend(v100, "setSpatialLookupURL:");
  if (-[GEOResources dataSetsCount](self, "dataSetsCount"))
  {
    objc_msgSend(v100, "clearDataSets");
    v72 = -[GEOResources dataSetsCount](self, "dataSetsCount");
    if (v72)
    {
      v73 = v72;
      for (i8 = 0; i8 != v73; ++i8)
      {
        -[GEOResources dataSetAtIndex:](self, "dataSetAtIndex:", i8);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addDataSet:", v75);

      }
    }
  }
  if (-[GEOResources dataSetURLOverridesCount](self, "dataSetURLOverridesCount"))
  {
    objc_msgSend(v100, "clearDataSetURLOverrides");
    v76 = -[GEOResources dataSetURLOverridesCount](self, "dataSetURLOverridesCount");
    if (v76)
    {
      v77 = v76;
      for (i9 = 0; i9 != v77; ++i9)
      {
        -[GEOResources dataSetURLOverrideAtIndex:](self, "dataSetURLOverrideAtIndex:", i9);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addDataSetURLOverride:", v79);

      }
    }
  }
  if (self->_realtimeTrafficProbeURL)
    objc_msgSend(v100, "setRealtimeTrafficProbeURL:");
  if (self->_batchTrafficProbeURL)
    objc_msgSend(v100, "setBatchTrafficProbeURL:");
  if (self->_proactiveRoutingURL)
    objc_msgSend(v100, "setProactiveRoutingURL:");
  if (self->_logMessageUsageV3URL)
    objc_msgSend(v100, "setLogMessageUsageV3URL:");
  if (self->_backgroundDispatcherURL)
    objc_msgSend(v100, "setBackgroundDispatcherURL:");
  if (self->_bluePOIDispatcherURL)
    objc_msgSend(v100, "setBluePOIDispatcherURL:");
  if (self->_backgroundRevGeoURL)
    objc_msgSend(v100, "setBackgroundRevGeoURL:");
  if (self->_wifiConnectionQualityProbeURL)
    objc_msgSend(v100, "setWifiConnectionQualityProbeURL:");
  if (self->_muninBaseURL)
    objc_msgSend(v100, "setMuninBaseURL:");
  if (-[GEOResources muninVersionsCount](self, "muninVersionsCount"))
  {
    objc_msgSend(v100, "clearMuninVersions");
    v80 = -[GEOResources muninVersionsCount](self, "muninVersionsCount");
    if (v80)
    {
      v81 = v80;
      for (i10 = 0; i10 != v81; ++i10)
      {
        -[GEOResources muninVersionAtIndex:](self, "muninVersionAtIndex:", i10);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addMuninVersion:", v83);

      }
    }
  }
  if (self->_authProxyURL)
    objc_msgSend(v100, "setAuthProxyURL:");
  if (-[GEOResources urlInfoSetsCount](self, "urlInfoSetsCount"))
  {
    objc_msgSend(v100, "clearUrlInfoSets");
    v84 = -[GEOResources urlInfoSetsCount](self, "urlInfoSetsCount");
    if (v84)
    {
      v85 = v84;
      for (i11 = 0; i11 != v85; ++i11)
      {
        -[GEOResources urlInfoSetAtIndex:](self, "urlInfoSetAtIndex:", i11);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addUrlInfoSet:", v87);

      }
    }
  }
  if (-[GEOResources muninBucketsCount](self, "muninBucketsCount"))
  {
    objc_msgSend(v100, "clearMuninBuckets");
    v88 = -[GEOResources muninBucketsCount](self, "muninBucketsCount");
    if (v88)
    {
      v89 = v88;
      for (i12 = 0; i12 != v89; ++i12)
      {
        -[GEOResources muninBucketAtIndex:](self, "muninBucketAtIndex:", i12);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addMuninBucket:", v91);

      }
    }
  }
  if (-[GEOResources displayStringsCount](self, "displayStringsCount"))
  {
    objc_msgSend(v100, "clearDisplayStrings");
    v92 = -[GEOResources displayStringsCount](self, "displayStringsCount");
    if (v92)
    {
      v93 = v92;
      for (i13 = 0; i13 != v93; ++i13)
      {
        -[GEOResources displayStringsAtIndex:](self, "displayStringsAtIndex:", i13);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addDisplayStrings:", v95);

      }
    }
  }
  if (-[GEOResources offlineMetadatasCount](self, "offlineMetadatasCount"))
  {
    objc_msgSend(v100, "clearOfflineMetadatas");
    v96 = -[GEOResources offlineMetadatasCount](self, "offlineMetadatasCount");
    if (v96)
    {
      v97 = v96;
      for (i14 = 0; i14 != v97; ++i14)
      {
        -[GEOResources offlineMetadataAtIndex:](self, "offlineMetadataAtIndex:", i14);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addOfflineMetadata:", v99);

      }
    }
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *tileGroups;
  NSMutableArray *tileSets;
  NSMutableArray *styleSheets;
  NSMutableArray *textures;
  NSMutableArray *fonts;
  NSMutableArray *icons;
  NSMutableArray *regionalResources;
  NSMutableArray *xmls;
  NSMutableArray *attributions;
  NSString *authToken;
  NSString *resourcesURL;
  NSString *searchAttributionManifestURL;
  NSString *directionsURL;
  NSString *etaURL;
  NSString *releaseInfo;
  NSString *batchReverseGeocoderURL;
  NSString *simpleETAURL;
  NSMutableArray *styleSheetChecksums;
  NSMutableArray *textureChecksums;
  NSMutableArray *fontChecksums;
  NSMutableArray *iconChecksums;
  NSMutableArray *xmlChecksums;
  NSString *addressCorrectionInitURL;
  NSString *addressCorrectionUpdateURL;
  NSString *polyLocationShiftURL;
  NSString *problemSubmissionURL;
  NSString *problemStatusURL;
  NSString *reverseGeocoderVersionsURL;
  NSString *problemCategoriesURL;
  NSString *announcementsURL;
  NSMutableArray *announcementsSupportedLanguages;
  NSString *dispatcherURL;
  NSString *problemOptInURL;
  GEOVersionManifest *versionManifest;
  NSString *abExperimentURL;
  NSString *businessPortalBaseURL;
  NSString *logMessageUsageURL;
  NSMutableArray *locationShiftEnabledRegions;
  uint64_t v43;
  NSMutableArray *resources;
  NSString *spatialLookupURL;
  NSMutableArray *dataSets;
  NSMutableArray *dataSetURLOverrides;
  NSString *realtimeTrafficProbeURL;
  NSString *batchTrafficProbeURL;
  NSString *proactiveRoutingURL;
  NSString *logMessageUsageV3URL;
  NSString *backgroundDispatcherURL;
  NSString *bluePOIDispatcherURL;
  NSString *backgroundRevGeoURL;
  NSString *wifiConnectionQualityProbeURL;
  NSString *muninBaseURL;
  NSMutableArray *muninVersions;
  NSString *authProxyURL;
  NSMutableArray *urlInfoSets;
  NSMutableArray *muninBuckets;
  NSMutableArray *displayStrings;
  NSMutableArray *offlineMetadatas;
  char v63;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_121;
  -[GEOResources readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  tileGroups = self->_tileGroups;
  if ((unint64_t)tileGroups | *((_QWORD *)v4 + 53))
  {
    if (!-[NSMutableArray isEqual:](tileGroups, "isEqual:"))
      goto LABEL_121;
  }
  tileSets = self->_tileSets;
  if ((unint64_t)tileSets | *((_QWORD *)v4 + 54))
  {
    if (!-[NSMutableArray isEqual:](tileSets, "isEqual:"))
      goto LABEL_121;
  }
  styleSheets = self->_styleSheets;
  if ((unint64_t)styleSheets | *((_QWORD *)v4 + 50))
  {
    if (!-[NSMutableArray isEqual:](styleSheets, "isEqual:"))
      goto LABEL_121;
  }
  textures = self->_textures;
  if ((unint64_t)textures | *((_QWORD *)v4 + 52))
  {
    if (!-[NSMutableArray isEqual:](textures, "isEqual:"))
      goto LABEL_121;
  }
  fonts = self->_fonts;
  if ((unint64_t)fonts | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](fonts, "isEqual:"))
      goto LABEL_121;
  }
  icons = self->_icons;
  if ((unint64_t)icons | *((_QWORD *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](icons, "isEqual:"))
      goto LABEL_121;
  }
  regionalResources = self->_regionalResources;
  if ((unint64_t)regionalResources | *((_QWORD *)v4 + 41))
  {
    if (!-[NSMutableArray isEqual:](regionalResources, "isEqual:"))
      goto LABEL_121;
  }
  xmls = self->_xmls;
  if ((unint64_t)xmls | *((_QWORD *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](xmls, "isEqual:"))
      goto LABEL_121;
  }
  attributions = self->_attributions;
  if ((unint64_t)attributions | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:"))
      goto LABEL_121;
  }
  authToken = self->_authToken;
  if ((unint64_t)authToken | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](authToken, "isEqual:"))
      goto LABEL_121;
  }
  resourcesURL = self->_resourcesURL;
  if ((unint64_t)resourcesURL | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](resourcesURL, "isEqual:"))
      goto LABEL_121;
  }
  searchAttributionManifestURL = self->_searchAttributionManifestURL;
  if ((unint64_t)searchAttributionManifestURL | *((_QWORD *)v4 + 46))
  {
    if (!-[NSString isEqual:](searchAttributionManifestURL, "isEqual:"))
      goto LABEL_121;
  }
  directionsURL = self->_directionsURL;
  if ((unint64_t)directionsURL | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](directionsURL, "isEqual:"))
      goto LABEL_121;
  }
  etaURL = self->_etaURL;
  if ((unint64_t)etaURL | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](etaURL, "isEqual:"))
      goto LABEL_121;
  }
  releaseInfo = self->_releaseInfo;
  if ((unint64_t)releaseInfo | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](releaseInfo, "isEqual:"))
      goto LABEL_121;
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  if ((unint64_t)batchReverseGeocoderURL | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](batchReverseGeocoderURL, "isEqual:"))
      goto LABEL_121;
  }
  simpleETAURL = self->_simpleETAURL;
  if ((unint64_t)simpleETAURL | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](simpleETAURL, "isEqual:"))
      goto LABEL_121;
  }
  styleSheetChecksums = self->_styleSheetChecksums;
  if ((unint64_t)styleSheetChecksums | *((_QWORD *)v4 + 49))
  {
    if (!-[NSMutableArray isEqual:](styleSheetChecksums, "isEqual:"))
      goto LABEL_121;
  }
  textureChecksums = self->_textureChecksums;
  if ((unint64_t)textureChecksums | *((_QWORD *)v4 + 51))
  {
    if (!-[NSMutableArray isEqual:](textureChecksums, "isEqual:"))
      goto LABEL_121;
  }
  fontChecksums = self->_fontChecksums;
  if ((unint64_t)fontChecksums | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](fontChecksums, "isEqual:"))
      goto LABEL_121;
  }
  iconChecksums = self->_iconChecksums;
  if ((unint64_t)iconChecksums | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](iconChecksums, "isEqual:"))
      goto LABEL_121;
  }
  xmlChecksums = self->_xmlChecksums;
  if ((unint64_t)xmlChecksums | *((_QWORD *)v4 + 58))
  {
    if (!-[NSMutableArray isEqual:](xmlChecksums, "isEqual:"))
      goto LABEL_121;
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  if ((unint64_t)addressCorrectionInitURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](addressCorrectionInitURL, "isEqual:"))
      goto LABEL_121;
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  if ((unint64_t)addressCorrectionUpdateURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](addressCorrectionUpdateURL, "isEqual:"))
      goto LABEL_121;
  }
  polyLocationShiftURL = self->_polyLocationShiftURL;
  if ((unint64_t)polyLocationShiftURL | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](polyLocationShiftURL, "isEqual:"))
      goto LABEL_121;
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  if ((unint64_t)problemSubmissionURL | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](problemSubmissionURL, "isEqual:"))
      goto LABEL_121;
  }
  problemStatusURL = self->_problemStatusURL;
  if ((unint64_t)problemStatusURL | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](problemStatusURL, "isEqual:"))
      goto LABEL_121;
  }
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;
  if ((unint64_t)reverseGeocoderVersionsURL | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](reverseGeocoderVersionsURL, "isEqual:"))
      goto LABEL_121;
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  if ((unint64_t)problemCategoriesURL | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](problemCategoriesURL, "isEqual:"))
      goto LABEL_121;
  }
  announcementsURL = self->_announcementsURL;
  if ((unint64_t)announcementsURL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](announcementsURL, "isEqual:"))
      goto LABEL_121;
  }
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  if ((unint64_t)announcementsSupportedLanguages | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](announcementsSupportedLanguages, "isEqual:"))
      goto LABEL_121;
  }
  dispatcherURL = self->_dispatcherURL;
  if ((unint64_t)dispatcherURL | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](dispatcherURL, "isEqual:"))
      goto LABEL_121;
  }
  problemOptInURL = self->_problemOptInURL;
  if ((unint64_t)problemOptInURL | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](problemOptInURL, "isEqual:"))
      goto LABEL_121;
  }
  versionManifest = self->_versionManifest;
  if ((unint64_t)versionManifest | *((_QWORD *)v4 + 56))
  {
    if (!-[GEOVersionManifest isEqual:](versionManifest, "isEqual:"))
      goto LABEL_121;
  }
  abExperimentURL = self->_abExperimentURL;
  if ((unint64_t)abExperimentURL | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](abExperimentURL, "isEqual:"))
      goto LABEL_121;
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  if ((unint64_t)businessPortalBaseURL | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](businessPortalBaseURL, "isEqual:"))
      goto LABEL_121;
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  if ((unint64_t)logMessageUsageURL | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](logMessageUsageURL, "isEqual:"))
      goto LABEL_121;
  }
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  if ((unint64_t)locationShiftEnabledRegions | *((_QWORD *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](locationShiftEnabledRegions, "isEqual:"))
      goto LABEL_121;
  }
  v43 = *((_QWORD *)v4 + 62);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v43 & 1) == 0 || self->_locationShiftVersion != *((_DWORD *)v4 + 123))
      goto LABEL_121;
  }
  else if ((v43 & 1) != 0)
  {
LABEL_121:
    v63 = 0;
    goto LABEL_122;
  }
  resources = self->_resources;
  if ((unint64_t)resources | *((_QWORD *)v4 + 44)
    && !-[NSMutableArray isEqual:](resources, "isEqual:"))
  {
    goto LABEL_121;
  }
  spatialLookupURL = self->_spatialLookupURL;
  if ((unint64_t)spatialLookupURL | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](spatialLookupURL, "isEqual:"))
      goto LABEL_121;
  }
  dataSets = self->_dataSets;
  if ((unint64_t)dataSets | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](dataSets, "isEqual:"))
      goto LABEL_121;
  }
  dataSetURLOverrides = self->_dataSetURLOverrides;
  if ((unint64_t)dataSetURLOverrides | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](dataSetURLOverrides, "isEqual:"))
      goto LABEL_121;
  }
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;
  if ((unint64_t)realtimeTrafficProbeURL | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](realtimeTrafficProbeURL, "isEqual:"))
      goto LABEL_121;
  }
  batchTrafficProbeURL = self->_batchTrafficProbeURL;
  if ((unint64_t)batchTrafficProbeURL | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](batchTrafficProbeURL, "isEqual:"))
      goto LABEL_121;
  }
  proactiveRoutingURL = self->_proactiveRoutingURL;
  if ((unint64_t)proactiveRoutingURL | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](proactiveRoutingURL, "isEqual:"))
      goto LABEL_121;
  }
  logMessageUsageV3URL = self->_logMessageUsageV3URL;
  if ((unint64_t)logMessageUsageV3URL | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](logMessageUsageV3URL, "isEqual:"))
      goto LABEL_121;
  }
  backgroundDispatcherURL = self->_backgroundDispatcherURL;
  if ((unint64_t)backgroundDispatcherURL | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](backgroundDispatcherURL, "isEqual:"))
      goto LABEL_121;
  }
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;
  if ((unint64_t)bluePOIDispatcherURL | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](bluePOIDispatcherURL, "isEqual:"))
      goto LABEL_121;
  }
  backgroundRevGeoURL = self->_backgroundRevGeoURL;
  if ((unint64_t)backgroundRevGeoURL | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](backgroundRevGeoURL, "isEqual:"))
      goto LABEL_121;
  }
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;
  if ((unint64_t)wifiConnectionQualityProbeURL | *((_QWORD *)v4 + 57))
  {
    if (!-[NSString isEqual:](wifiConnectionQualityProbeURL, "isEqual:"))
      goto LABEL_121;
  }
  muninBaseURL = self->_muninBaseURL;
  if ((unint64_t)muninBaseURL | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](muninBaseURL, "isEqual:"))
      goto LABEL_121;
  }
  muninVersions = self->_muninVersions;
  if ((unint64_t)muninVersions | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](muninVersions, "isEqual:"))
      goto LABEL_121;
  }
  authProxyURL = self->_authProxyURL;
  if ((unint64_t)authProxyURL | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](authProxyURL, "isEqual:"))
      goto LABEL_121;
  }
  urlInfoSets = self->_urlInfoSets;
  if ((unint64_t)urlInfoSets | *((_QWORD *)v4 + 55))
  {
    if (!-[NSMutableArray isEqual:](urlInfoSets, "isEqual:"))
      goto LABEL_121;
  }
  muninBuckets = self->_muninBuckets;
  if ((unint64_t)muninBuckets | *((_QWORD *)v4 + 31))
  {
    if (!-[NSMutableArray isEqual:](muninBuckets, "isEqual:"))
      goto LABEL_121;
  }
  displayStrings = self->_displayStrings;
  if ((unint64_t)displayStrings | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](displayStrings, "isEqual:"))
      goto LABEL_121;
  }
  offlineMetadatas = self->_offlineMetadatas;
  if ((unint64_t)offlineMetadatas | *((_QWORD *)v4 + 33))
    v63 = -[NSMutableArray isEqual:](offlineMetadatas, "isEqual:");
  else
    v63 = 1;
LABEL_122:

  return v63;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  uint64_t v27;
  NSUInteger v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  -[GEOResources readAll:](self, "readAll:", 1);
  v61 = -[NSMutableArray hash](self->_tileGroups, "hash");
  v60 = -[NSMutableArray hash](self->_tileSets, "hash");
  v59 = -[NSMutableArray hash](self->_styleSheets, "hash");
  v58 = -[NSMutableArray hash](self->_textures, "hash");
  v57 = -[NSMutableArray hash](self->_fonts, "hash");
  v56 = -[NSMutableArray hash](self->_icons, "hash");
  v55 = -[NSMutableArray hash](self->_regionalResources, "hash");
  v54 = -[NSMutableArray hash](self->_xmls, "hash");
  v53 = -[NSMutableArray hash](self->_attributions, "hash");
  v52 = -[NSString hash](self->_authToken, "hash");
  v51 = -[NSString hash](self->_resourcesURL, "hash");
  v50 = -[NSString hash](self->_searchAttributionManifestURL, "hash");
  v49 = -[NSString hash](self->_directionsURL, "hash");
  v48 = -[NSString hash](self->_etaURL, "hash");
  v47 = -[NSString hash](self->_releaseInfo, "hash");
  v46 = -[NSString hash](self->_batchReverseGeocoderURL, "hash");
  v45 = -[NSString hash](self->_simpleETAURL, "hash");
  v44 = -[NSMutableArray hash](self->_styleSheetChecksums, "hash");
  v43 = -[NSMutableArray hash](self->_textureChecksums, "hash");
  v42 = -[NSMutableArray hash](self->_fontChecksums, "hash");
  v41 = -[NSMutableArray hash](self->_iconChecksums, "hash");
  v40 = -[NSMutableArray hash](self->_xmlChecksums, "hash");
  v39 = -[NSString hash](self->_addressCorrectionInitURL, "hash");
  v38 = -[NSString hash](self->_addressCorrectionUpdateURL, "hash");
  v37 = -[NSString hash](self->_polyLocationShiftURL, "hash");
  v36 = -[NSString hash](self->_problemSubmissionURL, "hash");
  v35 = -[NSString hash](self->_problemStatusURL, "hash");
  v34 = -[NSString hash](self->_reverseGeocoderVersionsURL, "hash");
  v33 = -[NSString hash](self->_problemCategoriesURL, "hash");
  v3 = -[NSString hash](self->_announcementsURL, "hash");
  v4 = -[NSMutableArray hash](self->_announcementsSupportedLanguages, "hash");
  v5 = -[NSString hash](self->_dispatcherURL, "hash");
  v6 = -[NSString hash](self->_problemOptInURL, "hash");
  v7 = -[GEOVersionManifest hash](self->_versionManifest, "hash");
  v8 = -[NSString hash](self->_abExperimentURL, "hash");
  v9 = -[NSString hash](self->_businessPortalBaseURL, "hash");
  v10 = -[NSString hash](self->_logMessageUsageURL, "hash");
  v11 = -[NSMutableArray hash](self->_locationShiftEnabledRegions, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_locationShiftVersion;
  else
    v12 = 0;
  v13 = v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v14 = v11 ^ v12 ^ -[NSMutableArray hash](self->_resources, "hash");
  v15 = v14 ^ -[NSString hash](self->_spatialLookupURL, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_dataSets, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_dataSetURLOverrides, "hash");
  v18 = v17 ^ -[NSString hash](self->_realtimeTrafficProbeURL, "hash");
  v19 = v18 ^ -[NSString hash](self->_batchTrafficProbeURL, "hash");
  v20 = v13 ^ v19 ^ -[NSString hash](self->_proactiveRoutingURL, "hash");
  v21 = -[NSString hash](self->_logMessageUsageV3URL, "hash");
  v22 = v21 ^ -[NSString hash](self->_backgroundDispatcherURL, "hash");
  v23 = v22 ^ -[NSString hash](self->_bluePOIDispatcherURL, "hash");
  v24 = v23 ^ -[NSString hash](self->_backgroundRevGeoURL, "hash");
  v25 = v24 ^ -[NSString hash](self->_wifiConnectionQualityProbeURL, "hash");
  v26 = v25 ^ -[NSString hash](self->_muninBaseURL, "hash");
  v27 = v26 ^ -[NSMutableArray hash](self->_muninVersions, "hash");
  v28 = v27 ^ -[NSString hash](self->_authProxyURL, "hash");
  v29 = v28 ^ -[NSMutableArray hash](self->_urlInfoSets, "hash");
  v30 = v20 ^ v29 ^ -[NSMutableArray hash](self->_muninBuckets, "hash");
  v31 = -[NSMutableArray hash](self->_displayStrings, "hash");
  return v30 ^ v31 ^ -[NSMutableArray hash](self->_offlineMetadatas, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t jj;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t kk;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t mm;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t nn;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i1;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i2;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i3;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i4;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i5;
  GEOVersionManifest *versionManifest;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i6;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i7;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i8;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i9;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t i10;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i11;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i12;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t i13;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i14;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  uint64_t v247;

  v247 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v222 = 0u;
  v221 = 0u;
  v220 = 0u;
  v219 = 0u;
  v5 = *((id *)v4 + 53);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v219, v246, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v220;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v220 != v8)
          objc_enumerationMutation(v5);
        -[GEOResources addTileGroup:](self, "addTileGroup:", *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v219, v246, 16);
    }
    while (v7);
  }

  v218 = 0u;
  v217 = 0u;
  v216 = 0u;
  v215 = 0u;
  v10 = *((id *)v4 + 54);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v215, v245, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v216;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v216 != v13)
          objc_enumerationMutation(v10);
        -[GEOResources addTileSet:](self, "addTileSet:", *(_QWORD *)(*((_QWORD *)&v215 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v215, v245, 16);
    }
    while (v12);
  }

  v214 = 0u;
  v213 = 0u;
  v212 = 0u;
  v211 = 0u;
  v15 = *((id *)v4 + 50);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v211, v244, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v212;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v212 != v18)
          objc_enumerationMutation(v15);
        -[GEOResources addStyleSheet:](self, "addStyleSheet:", *(_QWORD *)(*((_QWORD *)&v211 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v211, v244, 16);
    }
    while (v17);
  }

  v210 = 0u;
  v209 = 0u;
  v208 = 0u;
  v207 = 0u;
  v20 = *((id *)v4 + 52);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v207, v243, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v208;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v208 != v23)
          objc_enumerationMutation(v20);
        -[GEOResources addTexture:](self, "addTexture:", *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v207, v243, 16);
    }
    while (v22);
  }

  v206 = 0u;
  v205 = 0u;
  v204 = 0u;
  v203 = 0u;
  v25 = *((id *)v4 + 24);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v203, v242, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v204;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v204 != v28)
          objc_enumerationMutation(v25);
        -[GEOResources addFont:](self, "addFont:", *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v203, v242, 16);
    }
    while (v27);
  }

  v202 = 0u;
  v201 = 0u;
  v200 = 0u;
  v199 = 0u;
  v30 = *((id *)v4 + 26);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v199, v241, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v200;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v200 != v33)
          objc_enumerationMutation(v30);
        -[GEOResources addIcon:](self, "addIcon:", *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * ii));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v199, v241, 16);
    }
    while (v32);
  }

  v198 = 0u;
  v197 = 0u;
  v196 = 0u;
  v195 = 0u;
  v35 = *((id *)v4 + 41);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v195, v240, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v196;
    do
    {
      for (jj = 0; jj != v37; ++jj)
      {
        if (*(_QWORD *)v196 != v38)
          objc_enumerationMutation(v35);
        -[GEOResources addRegionalResource:](self, "addRegionalResource:", *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * jj));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v195, v240, 16);
    }
    while (v37);
  }

  v194 = 0u;
  v193 = 0u;
  v192 = 0u;
  v191 = 0u;
  v40 = *((id *)v4 + 59);
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v191, v239, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v192;
    do
    {
      for (kk = 0; kk != v42; ++kk)
      {
        if (*(_QWORD *)v192 != v43)
          objc_enumerationMutation(v40);
        -[GEOResources addXml:](self, "addXml:", *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * kk));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v191, v239, 16);
    }
    while (v42);
  }

  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v45 = *((id *)v4 + 8);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v187, v238, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v188;
    do
    {
      for (mm = 0; mm != v47; ++mm)
      {
        if (*(_QWORD *)v188 != v48)
          objc_enumerationMutation(v45);
        -[GEOResources addAttribution:](self, "addAttribution:", *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * mm));
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v187, v238, 16);
    }
    while (v47);
  }

  if (*((_QWORD *)v4 + 10))
    -[GEOResources setAuthToken:](self, "setAuthToken:");
  if (*((_QWORD *)v4 + 43))
    -[GEOResources setResourcesURL:](self, "setResourcesURL:");
  if (*((_QWORD *)v4 + 46))
    -[GEOResources setSearchAttributionManifestURL:](self, "setSearchAttributionManifestURL:");
  if (*((_QWORD *)v4 + 19))
    -[GEOResources setDirectionsURL:](self, "setDirectionsURL:");
  if (*((_QWORD *)v4 + 22))
    -[GEOResources setEtaURL:](self, "setEtaURL:");
  if (*((_QWORD *)v4 + 42))
    -[GEOResources setReleaseInfo:](self, "setReleaseInfo:");
  if (*((_QWORD *)v4 + 13))
    -[GEOResources setBatchReverseGeocoderURL:](self, "setBatchReverseGeocoderURL:");
  if (*((_QWORD *)v4 + 47))
    -[GEOResources setSimpleETAURL:](self, "setSimpleETAURL:");
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v50 = *((id *)v4 + 49);
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v183, v237, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v184;
    do
    {
      for (nn = 0; nn != v52; ++nn)
      {
        if (*(_QWORD *)v184 != v53)
          objc_enumerationMutation(v50);
        -[GEOResources addStyleSheetChecksum:](self, "addStyleSheetChecksum:", *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * nn));
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v183, v237, 16);
    }
    while (v52);
  }

  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v55 = *((id *)v4 + 51);
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v179, v236, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v180;
    do
    {
      for (i1 = 0; i1 != v57; ++i1)
      {
        if (*(_QWORD *)v180 != v58)
          objc_enumerationMutation(v55);
        -[GEOResources addTextureChecksum:](self, "addTextureChecksum:", *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * i1));
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v179, v236, 16);
    }
    while (v57);
  }

  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v60 = *((id *)v4 + 23);
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v175, v235, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v176;
    do
    {
      for (i2 = 0; i2 != v62; ++i2)
      {
        if (*(_QWORD *)v176 != v63)
          objc_enumerationMutation(v60);
        -[GEOResources addFontChecksum:](self, "addFontChecksum:", *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * i2));
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v175, v235, 16);
    }
    while (v62);
  }

  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v65 = *((id *)v4 + 25);
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v171, v234, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v172;
    do
    {
      for (i3 = 0; i3 != v67; ++i3)
      {
        if (*(_QWORD *)v172 != v68)
          objc_enumerationMutation(v65);
        -[GEOResources addIconChecksum:](self, "addIconChecksum:", *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * i3));
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v171, v234, 16);
    }
    while (v67);
  }

  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v70 = *((id *)v4 + 58);
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v167, v233, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v168;
    do
    {
      for (i4 = 0; i4 != v72; ++i4)
      {
        if (*(_QWORD *)v168 != v73)
          objc_enumerationMutation(v70);
        -[GEOResources addXmlChecksum:](self, "addXmlChecksum:", *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * i4));
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v167, v233, 16);
    }
    while (v72);
  }

  if (*((_QWORD *)v4 + 4))
    -[GEOResources setAddressCorrectionInitURL:](self, "setAddressCorrectionInitURL:");
  if (*((_QWORD *)v4 + 5))
    -[GEOResources setAddressCorrectionUpdateURL:](self, "setAddressCorrectionUpdateURL:");
  if (*((_QWORD *)v4 + 34))
    -[GEOResources setPolyLocationShiftURL:](self, "setPolyLocationShiftURL:");
  if (*((_QWORD *)v4 + 39))
    -[GEOResources setProblemSubmissionURL:](self, "setProblemSubmissionURL:");
  if (*((_QWORD *)v4 + 38))
    -[GEOResources setProblemStatusURL:](self, "setProblemStatusURL:");
  if (*((_QWORD *)v4 + 45))
    -[GEOResources setReverseGeocoderVersionsURL:](self, "setReverseGeocoderVersionsURL:");
  if (*((_QWORD *)v4 + 36))
    -[GEOResources setProblemCategoriesURL:](self, "setProblemCategoriesURL:");
  if (*((_QWORD *)v4 + 7))
    -[GEOResources setAnnouncementsURL:](self, "setAnnouncementsURL:");
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  v75 = *((id *)v4 + 6);
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v163, v232, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v164;
    do
    {
      for (i5 = 0; i5 != v77; ++i5)
      {
        if (*(_QWORD *)v164 != v78)
          objc_enumerationMutation(v75);
        -[GEOResources addAnnouncementsSupportedLanguages:](self, "addAnnouncementsSupportedLanguages:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * i5));
      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v163, v232, 16);
    }
    while (v77);
  }

  if (*((_QWORD *)v4 + 20))
    -[GEOResources setDispatcherURL:](self, "setDispatcherURL:");
  if (*((_QWORD *)v4 + 37))
    -[GEOResources setProblemOptInURL:](self, "setProblemOptInURL:");
  versionManifest = self->_versionManifest;
  v81 = *((_QWORD *)v4 + 56);
  if (versionManifest)
  {
    if (v81)
      -[GEOVersionManifest mergeFrom:](versionManifest, "mergeFrom:");
  }
  else if (v81)
  {
    -[GEOResources setVersionManifest:](self, "setVersionManifest:");
  }
  if (*((_QWORD *)v4 + 3))
    -[GEOResources setAbExperimentURL:](self, "setAbExperimentURL:");
  if (*((_QWORD *)v4 + 16))
    -[GEOResources setBusinessPortalBaseURL:](self, "setBusinessPortalBaseURL:");
  if (*((_QWORD *)v4 + 28))
    -[GEOResources setLogMessageUsageURL:](self, "setLogMessageUsageURL:");
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v82 = *((id *)v4 + 27);
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v159, v231, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v160;
    do
    {
      for (i6 = 0; i6 != v84; ++i6)
      {
        if (*(_QWORD *)v160 != v85)
          objc_enumerationMutation(v82);
        -[GEOResources addLocationShiftEnabledRegion:](self, "addLocationShiftEnabledRegion:", *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * i6));
      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v159, v231, 16);
    }
    while (v84);
  }

  if ((*((_BYTE *)v4 + 496) & 1) != 0)
  {
    self->_locationShiftVersion = *((_DWORD *)v4 + 123);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v87 = *((id *)v4 + 44);
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v155, v230, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v156;
    do
    {
      for (i7 = 0; i7 != v89; ++i7)
      {
        if (*(_QWORD *)v156 != v90)
          objc_enumerationMutation(v87);
        -[GEOResources addResource:](self, "addResource:", *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i7));
      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v155, v230, 16);
    }
    while (v89);
  }

  if (*((_QWORD *)v4 + 48))
    -[GEOResources setSpatialLookupURL:](self, "setSpatialLookupURL:");
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v92 = *((id *)v4 + 18);
  v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v151, v229, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v152;
    do
    {
      for (i8 = 0; i8 != v94; ++i8)
      {
        if (*(_QWORD *)v152 != v95)
          objc_enumerationMutation(v92);
        -[GEOResources addDataSet:](self, "addDataSet:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * i8));
      }
      v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v151, v229, 16);
    }
    while (v94);
  }

  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v97 = *((id *)v4 + 17);
  v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v147, v228, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v148;
    do
    {
      for (i9 = 0; i9 != v99; ++i9)
      {
        if (*(_QWORD *)v148 != v100)
          objc_enumerationMutation(v97);
        -[GEOResources addDataSetURLOverride:](self, "addDataSetURLOverride:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * i9));
      }
      v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v147, v228, 16);
    }
    while (v99);
  }

  if (*((_QWORD *)v4 + 40))
    -[GEOResources setRealtimeTrafficProbeURL:](self, "setRealtimeTrafficProbeURL:");
  if (*((_QWORD *)v4 + 14))
    -[GEOResources setBatchTrafficProbeURL:](self, "setBatchTrafficProbeURL:");
  if (*((_QWORD *)v4 + 35))
    -[GEOResources setProactiveRoutingURL:](self, "setProactiveRoutingURL:");
  if (*((_QWORD *)v4 + 29))
    -[GEOResources setLogMessageUsageV3URL:](self, "setLogMessageUsageV3URL:");
  if (*((_QWORD *)v4 + 11))
    -[GEOResources setBackgroundDispatcherURL:](self, "setBackgroundDispatcherURL:");
  if (*((_QWORD *)v4 + 15))
    -[GEOResources setBluePOIDispatcherURL:](self, "setBluePOIDispatcherURL:");
  if (*((_QWORD *)v4 + 12))
    -[GEOResources setBackgroundRevGeoURL:](self, "setBackgroundRevGeoURL:");
  if (*((_QWORD *)v4 + 57))
    -[GEOResources setWifiConnectionQualityProbeURL:](self, "setWifiConnectionQualityProbeURL:");
  if (*((_QWORD *)v4 + 30))
    -[GEOResources setMuninBaseURL:](self, "setMuninBaseURL:");
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v102 = *((id *)v4 + 32);
  v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v143, v227, 16);
  if (v103)
  {
    v104 = v103;
    v105 = *(_QWORD *)v144;
    do
    {
      for (i10 = 0; i10 != v104; ++i10)
      {
        if (*(_QWORD *)v144 != v105)
          objc_enumerationMutation(v102);
        -[GEOResources addMuninVersion:](self, "addMuninVersion:", *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * i10));
      }
      v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v143, v227, 16);
    }
    while (v104);
  }

  if (*((_QWORD *)v4 + 9))
    -[GEOResources setAuthProxyURL:](self, "setAuthProxyURL:");
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v107 = *((id *)v4 + 55);
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v139, v226, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v140;
    do
    {
      for (i11 = 0; i11 != v109; ++i11)
      {
        if (*(_QWORD *)v140 != v110)
          objc_enumerationMutation(v107);
        -[GEOResources addUrlInfoSet:](self, "addUrlInfoSet:", *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i11));
      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v139, v226, 16);
    }
    while (v109);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v112 = *((id *)v4 + 31);
  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v135, v225, 16);
  if (v113)
  {
    v114 = v113;
    v115 = *(_QWORD *)v136;
    do
    {
      for (i12 = 0; i12 != v114; ++i12)
      {
        if (*(_QWORD *)v136 != v115)
          objc_enumerationMutation(v112);
        -[GEOResources addMuninBucket:](self, "addMuninBucket:", *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i12));
      }
      v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v135, v225, 16);
    }
    while (v114);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v117 = *((id *)v4 + 21);
  v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v131, v224, 16);
  if (v118)
  {
    v119 = v118;
    v120 = *(_QWORD *)v132;
    do
    {
      for (i13 = 0; i13 != v119; ++i13)
      {
        if (*(_QWORD *)v132 != v120)
          objc_enumerationMutation(v117);
        -[GEOResources addDisplayStrings:](self, "addDisplayStrings:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i13));
      }
      v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v131, v224, 16);
    }
    while (v119);
  }

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v122 = *((id *)v4 + 33);
  v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v127, v223, 16);
  if (v123)
  {
    v124 = v123;
    v125 = *(_QWORD *)v128;
    do
    {
      for (i14 = 0; i14 != v124; ++i14)
      {
        if (*(_QWORD *)v128 != v125)
          objc_enumerationMutation(v122);
        -[GEOResources addOfflineMetadata:](self, "addOfflineMetadata:", *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i14), (_QWORD)v127);
      }
      v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v127, v223, 16);
    }
    while (v124);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOResourcesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_727);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSMutableArray *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v3 = a3;
  v151 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000002uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOResources readAll:](self, "readAll:", 0);
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v7 = self->_tileGroups;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v129, v149, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v130;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v130 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v129, v149, 16);
      }
      while (v9);
    }

    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v12 = self->_tileSets;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v125, v148, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v126;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v126 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v125, v148, 16);
      }
      while (v14);
    }

    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v17 = self->_regionalResources;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v121, v147, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v122;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v122 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v21);
          if (v22)
          {
            os_unfair_lock_lock_with_options();
            *(_WORD *)(v22 + 96) |= 8u;
            *(_WORD *)(v22 + 96) |= 0x100u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 80));
            v23 = *(void **)(v22 + 16);
            *(_QWORD *)(v22 + 16) = 0;

            -[GEORegionalResource readAll:](v22, 0);
            v135 = 0u;
            v136 = 0u;
            v133 = 0u;
            v134 = 0u;
            v24 = *(id *)(v22 + 48);
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v133, v150, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v134;
              do
              {
                v28 = 0;
                do
                {
                  if (*(_QWORD *)v134 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * v28++), "clearUnknownFields:", 1);
                }
                while (v26 != v28);
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v133, v150, 16);
              }
              while (v26);
            }

          }
          ++v21;
        }
        while (v21 != v19);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v121, v147, 16);
      }
      while (v19);
    }

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v29 = self->_attributions;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v117, v146, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v118;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v118 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * v33++), "clearUnknownFields:", 1);
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v117, v146, 16);
      }
      while (v31);
    }

    -[GEOVersionManifest clearUnknownFields:](self->_versionManifest, "clearUnknownFields:", 1);
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v34 = self->_locationShiftEnabledRegions;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v113, v145, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v114;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v114 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * v38++), "clearUnknownFields:", 1);
        }
        while (v36 != v38);
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v113, v145, 16);
      }
      while (v36);
    }

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v39 = self->_resources;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v109, v144, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v110;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v110 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * v43++), "clearUnknownFields:", 1);
        }
        while (v41 != v43);
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v109, v144, 16);
      }
      while (v41);
    }

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v44 = self->_dataSets;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v105, v143, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v106;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v106 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * v48++), "clearUnknownFields:", 1);
        }
        while (v46 != v48);
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v105, v143, 16);
      }
      while (v46);
    }

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v49 = self->_dataSetURLOverrides;
    v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v101, v142, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v102;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v102 != v52)
            objc_enumerationMutation(v49);
          v54 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v53);
          if (v54)
          {
            os_unfair_lock_lock_with_options();
            *(_DWORD *)(v54 + 160) |= 2u;
            *(_DWORD *)(v54 + 160) |= 0x20000u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v54 + 152));
            v55 = *(void **)(v54 + 16);
            *(_QWORD *)(v54 + 16) = 0;

            -[GEODataSetURLOverride readAll:](v54, 0);
          }
          ++v53;
        }
        while (v51 != v53);
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v101, v142, 16);
      }
      while (v51);
    }

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v56 = self->_muninVersions;
    v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v97, v141, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v98;
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v98 != v59)
            objc_enumerationMutation(v56);
          objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * v60++), "clearUnknownFields:", 1);
        }
        while (v58 != v60);
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v97, v141, 16);
      }
      while (v58);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v61 = self->_urlInfoSets;
    v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v93, v140, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v94;
      do
      {
        v65 = 0;
        do
        {
          if (*(_QWORD *)v94 != v64)
            objc_enumerationMutation(v61);
          objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * v65++), "clearUnknownFields:", 1);
        }
        while (v63 != v65);
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v93, v140, 16);
      }
      while (v63);
    }

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v66 = self->_muninBuckets;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v89, v139, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v90;
      do
      {
        v70 = 0;
        do
        {
          if (*(_QWORD *)v90 != v69)
            objc_enumerationMutation(v66);
          objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v70++), "clearUnknownFields:", 1);
        }
        while (v68 != v70);
        v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v89, v139, 16);
      }
      while (v68);
    }

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v71 = self->_displayStrings;
    v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v85, v138, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v86;
      do
      {
        v75 = 0;
        do
        {
          if (*(_QWORD *)v86 != v74)
            objc_enumerationMutation(v71);
          objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v75++), "clearUnknownFields:", 1);
        }
        while (v73 != v75);
        v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v85, v138, 16);
      }
      while (v73);
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v76 = self->_offlineMetadatas;
    v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v81, v137, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v82;
      do
      {
        v80 = 0;
        do
        {
          if (*(_QWORD *)v82 != v79)
            objc_enumerationMutation(v76);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * v80++), "clearUnknownFields:", 1, (_QWORD)v81);
        }
        while (v78 != v80);
        v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v81, v137, 16);
      }
      while (v78);
    }

  }
}

- (BOOL)isValid
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[GEOResources tileGroups](self, "tileGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[GEOResources tileSets](self, "tileSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

@end
