@implementation GEOPDPlaceRequest

- (NSMutableArray)requestedComponents
{
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  return self->_requestedComponents;
}

- (void)addRequestedComponents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[GEOPDPlaceRequest addRequestedComponent:](self, "addRequestedComponent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addRequestedComponent:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsRequestedComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsRequestedComponent:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readRequestedComponents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestedComponents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOPDPlaceRequest)initWithData:(id)a3
{
  GEOPDPlaceRequest *v3;
  GEOPDPlaceRequest *v4;
  GEOPDPlaceRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceRequest;
  v3 = -[GEOPDPlaceRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

+ (id)createRequestedComponentsForReason:(unint64_t)a3 traits:(id)a4 count:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
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
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
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
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  uint64_t v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  _QWORD v250[4];
  id v251;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v250[0] = MEMORY[0x1E0C809B0];
  v250[1] = 3221225472;
  v250[2] = __86__GEOPDPlaceRequest_PlaceDataExtras__createRequestedComponentsForReason_traits_count___block_invoke;
  v250[3] = &unk_1E1C20E50;
  v10 = v9;
  v251 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v250);
  v12 = 0;
  if ((uint64_t)a3 <= 10)
  {
    if (a3 && a3 != 3)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (a3 == 31)
  {
LABEL_19:
    v12 = 1;
    goto LABEL_20;
  }
  if (a3 != 11)
  {
LABEL_20:
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
      case 3uLL:
        if ((_DWORD)v5)
        {
          if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1EDF4E468))
          {
            objc_msgSend(a1, "componentInfoWithType:count:traits:", 5, v5, v8);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v11)[2](v11, v25);

          }
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, v5, v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v26);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, v5, v8);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v27);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, v5, v8);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v28);

        }
        if (v12)
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 3, 1, v8);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v29);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 52, 2, v8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v30);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 77, 1, v8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v31);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 4, 1, v8);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v32);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 64, 0x7FFFFFFFLL, v8);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v33);

        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1EDF4DED8))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 9, 0x7FFFFFFFLL, v8);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v34);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 53, 1, v8);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v35);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v36);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 24, 1, v8);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v37);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 20, 1, v8);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v38);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 10, 1, v8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v39);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 11, 1, v8);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v40);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 21, 1, v8);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v41);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 16, 0x7FFFFFFFLL, v8);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v42);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 23, 6, v8);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v43);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_RealTimeEVCharger, (uint64_t)off_1EDF4B178))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 97, 1, v8);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v44);

        }
        if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1EDF4B188))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 98, 1, v8);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v45);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 105, 1, v8);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v46);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 106, 1, v8);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v47);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 104, 1, v8);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v48);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 84, objc_msgSend(v8, "photoAlbumCount"), v8);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v49);

        if (objc_msgSend(v8, "photosCount"))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, objc_msgSend(v8, "photosCount"), v8);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v50);

        }
        if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 102, 0x7FFFFFFFLL, v8);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v51);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 15, 0x7FFFFFFFLL, v8);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v52);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 86, 1, v8);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v53);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 22, 1, v8);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v54);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 83, 1, v8);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v55);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 92, 1, v8);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v56);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 103, 1, v8);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v57);

        if ((_DWORD)v5)
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 41, v5, v8);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v58);

        }
        if (objc_msgSend(v8, "reviewUserPhotosCount"))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 7, objc_msgSend(v8, "reviewUserPhotosCount"), v8);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v59);

        }
        +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isMuninEnabled");

        if (v61)
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 56, 1, v8);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v62);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 55, 1, v8);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v63);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 59, 1, v8);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v64);

        }
        if (GEOConfigGetBOOL(GeoServicesConfig_PlaceCardUseDynamicLayout, (uint64_t)off_1EDF4DB48))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 60, 1, v8);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v65);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 57, 1, v8);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v66);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 38, 1, v8);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v67);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 54, 1, v8);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v68);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 50, 1, v8);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v69);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 13, 1, v8);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v70);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 63, 0x7FFFFFFFLL, v8);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v71);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 39, 1, v8);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v72);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleStonehenge, (uint64_t)off_1EDF4B008))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 72, 1, v8);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v73);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 70, 1, v8);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v74);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 40, 4, v8);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v75);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 66, 0x7FFFFFFFLL, v8);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v76);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 89, 0x7FFFFFFFLL, v8);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v77);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 33, 1, v8);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v78);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 30, v5, v8);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v79);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 36, 3, v8);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v80);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 62, 1, v8);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v81);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 48, 1, v8);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v82);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_ShouldEnableLagunaBeach, (uint64_t)off_1EDF4AF68))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 73, 1, v8);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v83);

        }
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", a3, 5, v8);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v84);

        objc_msgSend(a1, "publisherComponentInfoForReason:count:traits:", a3, 1, v8);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v85);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1EDF4B048))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 85, 1, v8);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v86);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 88, 1, v8);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v87);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 87, 1, v8);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v88);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 96, 1, v8);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v89);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 94, 0x7FFFFFFFLL, v8);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v90);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 76, 1, v8);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v91);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 83, 1, v8);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v92);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1EDF4B088))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 93, 1, v8);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v93);

        }
        if (!GEOConfigGetBOOL(MapsFeaturesConfig_HikingiOSEnabled, (uint64_t)off_1EDF4B198)
          || !objc_msgSend(v8, "wantsRouteCreationTip"))
        {
          goto LABEL_89;
        }
        v94 = a1;
        v95 = 99;
        v96 = 1;
LABEL_88:
        objc_msgSend(v94, "componentInfoWithType:count:traits:", v95, v96, v8);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v173);

LABEL_89:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 42, 1, v8);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v174);

        v23 = a1;
        v24 = 44;
        goto LABEL_90;
      case 2uLL:
        if ((_DWORD)v5)
        {
          if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent_AC, (uint64_t)off_1EDF4DEC8))
          {
            objc_msgSend(a1, "componentInfoWithType:count:traits:", 5, v5, v8);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v11)[2](v11, v116);

          }
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, v5, v8);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v117);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 64, 0x7FFFFFFFLL, v8);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v118);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, v5, v8);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v119);

          if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent_AC, (uint64_t)off_1EDF4DEE8))
          {
            objc_msgSend(a1, "componentInfoWithType:count:traits:", 9, 0x7FFFFFFFLL, v8);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v11)[2](v11, v120);

          }
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, v5, v8);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v121);

        }
        if (objc_msgSend(v8, "photosCount"))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, objc_msgSend(v8, "photosCount"), v8);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v122);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v123);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 30, v5, v8);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v124);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 16, 0x7FFFFFFFLL, v8);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v125);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 27, 1, v8);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v126);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 48, 1, v8);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v127);

        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 2, v5, v8);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v128);

        objc_msgSend(a1, "publisherComponentInfoForReason:count:traits:", 2, v5, v8);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v129);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 83, 1, v8);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v130);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 104, 1, v8);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v131);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 23, 6, v8);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v132);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1EDF4B088))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 93, 1, v8);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v133);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 42, 1, v8);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v134);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 44, 1, v8);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v135);

        v23 = a1;
        v24 = 103;
        goto LABEL_90;
      case 4uLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 10, 1, v8);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v98);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 24, 1, v8);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v99);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 20, 1, v8);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v100);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 11, 1, v8);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v101);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 4, 1, v8);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v102);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 69, 1, v8);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v103);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 67, 1, v8);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v104);

        v23 = a1;
        v24 = 68;
        goto LABEL_90;
      case 5uLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 20, 1, v8);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v136);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 11, 1, v8);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v137);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 67, 1, v8);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v138);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 68, 1, v8);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v139);

        v23 = a1;
        v24 = 10;
        goto LABEL_90;
      case 6uLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 10, 1, v8);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v140);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 11, 1, v8);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v141);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 4, 1, v8);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v142);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 69, 1, v8);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v143);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 67, 1, v8);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v144);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 68, 1, v8);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v145);

        v23 = a1;
        v24 = 20;
        goto LABEL_90;
      case 7uLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 10, 1, v8);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v146);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 20, 1, v8);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v147);

        v23 = a1;
        v24 = 11;
        goto LABEL_90;
      case 8uLL:
        if (GEOConfigGetBOOL(GeoServicesConfig_PlaceCardUseDynamicLayout, (uint64_t)off_1EDF4DB48))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 60, 1, v8);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v148);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, 1, v8);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v149);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 57, 1, v8);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v150);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 4, 1, v8);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v151);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 54, 1, v8);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v152);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 64, 0x7FFFFFFFLL, v8);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v153);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, 1, v8);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v154);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 50, 1, v8);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v155);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, 1, v8);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v156);

        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1EDF4DED8))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 9, 0x7FFFFFFFLL, v8);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v157);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, 1, v8);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v158);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 40, 1, v8);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v159);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v160);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 66, 0x7FFFFFFFLL, v8);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v161);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 89, 0x7FFFFFFFLL, v8);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v162);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 16, 0x7FFFFFFFLL, v8);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v163);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 48, 1, v8);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v164);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 84, objc_msgSend(v8, "photoAlbumCount"), v8);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v165);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 83, 1, v8);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v166);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 86, 1, v8);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v167);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 88, 1, v8);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v168);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 102, 0x7FFFFFFFLL, v8);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v169);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 92, 1, v8);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v170);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 52, 2, v8);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v171);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 96, 1, v8);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v172);

        v94 = a1;
        v95 = 94;
        v96 = 0x7FFFFFFFLL;
        goto LABEL_88;
      case 9uLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, 1, v8);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v105);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 4, 1, v8);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v106);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, 1, v8);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v107);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, 1, v8);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v108);

        v23 = a1;
        v24 = 16;
        goto LABEL_110;
      case 0xAuLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, 1, v8);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v179);

        v23 = a1;
        v24 = 58;
        goto LABEL_90;
      case 0xBuLL:
        goto LABEL_8;
      case 0xCuLL:
        v23 = a1;
        v24 = 26;
        goto LABEL_122;
      case 0xDuLL:
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 13, 0x7FFFFFFFLL, v8);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v109);

        objc_msgSend(a1, "publisherComponentInfoForReason:count:traits:", 13, 1, v8);
        v110 = objc_claimAutoreleasedReturnValue();
        goto LABEL_109;
      case 0xEuLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 4, 1, v8);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v180);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 64, 0x7FFFFFFFLL, v8);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v181);

        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1EDF4DED8))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 9, 0x7FFFFFFFLL, v8);
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v182);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 53, 1, v8);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v183);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v184);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 24, 1, v8);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v185);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 20, 1, v8);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v186);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 10, 1, v8);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v187);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 11, 1, v8);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v188);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1EDF4B048)
          && (objc_msgSend(v8, "navigating") & 1) == 0)
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 82, 1, v8);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v189);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, 1, v8);
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v190);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, 1, v8);
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v191);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, 1, v8);
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v192);

        }
        if ((objc_msgSend(v8, "navigating") & 1) != 0)
          goto LABEL_93;
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 14, 1, v8);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v193);

        v194 = a1;
        v195 = 14;
        goto LABEL_116;
      case 0xFuLL:
      case 0x12uLL:
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", a3, v5, v8);
        v97 = objc_claimAutoreleasedReturnValue();
        goto LABEL_92;
      case 0x10uLL:
        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1EDF4E468))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 5, v5, v8);
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v196);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, v5, v8);
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v197);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, v5, v8);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v198);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, v5, v8);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v199);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 64, 0x7FFFFFFFLL, v8);
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v200);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v201);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 16, 0x7FFFFFFFLL, v8);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v202);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, 1, v8);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v203);

        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 16, v5, v8);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v204);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 74, 0x7FFFFFFFLL, v8);
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v205);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 76, 1, v8);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v206);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1EDF4B048))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 40, 1, v8);
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v207);

        }
        v23 = a1;
        v24 = 88;
        goto LABEL_90;
      case 0x11uLL:
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 17, v5, v8);
        v110 = objc_claimAutoreleasedReturnValue();
LABEL_109:
        v208 = (void *)v110;
        v11[2](v11, v110);

        v23 = a1;
        v24 = 1;
LABEL_110:
        v175 = 0x7FFFFFFFLL;
        goto LABEL_91;
      case 0x13uLL:
        goto LABEL_18;
      case 0x14uLL:
        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1EDF4E468))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 5, 1, v8);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v209);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, 1, v8);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v210);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, 1, v8);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v211);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, 1, v8);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v212);

        v20 = a1;
        v21 = 4;
        goto LABEL_17;
      case 0x15uLL:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 10, 1, v8);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v213);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 24, 1, v8);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v214);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 20, 1, v8);
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v215);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 11, 1, v8);
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v216);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 79, 1, v8);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v217);

        v23 = a1;
        v24 = 21;
        goto LABEL_90;
      case 0x16uLL:
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 22, 1, v8);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v218);

        v194 = a1;
        v195 = 22;
LABEL_116:
        objc_msgSend(v194, "publisherComponentInfoForReason:count:traits:", v195, 1, v8);
        v97 = objc_claimAutoreleasedReturnValue();
        goto LABEL_92;
      case 0x17uLL:
        if (!GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1EDF4B048))
          goto LABEL_93;
        goto LABEL_64;
      case 0x18uLL:
        if (!GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1EDF4B048))
          goto LABEL_93;
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 24, 0x7FFFFFFFLL, v8);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v111);

        objc_msgSend(a1, "publisherComponentInfoForReason:count:traits:", 24, 1, v8);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v112);

LABEL_64:
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 82, 1, v8);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v113);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, 1, v8);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v114);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, 1, v8);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v115);

LABEL_65:
        v23 = a1;
        v24 = 1;
        goto LABEL_90;
      case 0x19uLL:
        v23 = a1;
        v24 = 84;
        goto LABEL_90;
      case 0x1AuLL:
        v23 = a1;
        v24 = 91;
        goto LABEL_90;
      case 0x1BuLL:
        if (!GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1EDF4B088))
          goto LABEL_93;
        v23 = a1;
        v24 = 95;
        goto LABEL_90;
      case 0x1CuLL:
        goto LABEL_65;
      case 0x1DuLL:
        if (!GEOConfigGetBOOL(MapsFeaturesConfig_RealTimeEVCharger, (uint64_t)off_1EDF4B178))
          goto LABEL_93;
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 97, 1, v8);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v219);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, v5, v8);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v220);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, v5, v8);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v221);

        v23 = a1;
        v24 = 23;
LABEL_122:
        v175 = v5;
        goto LABEL_91;
      case 0x1EuLL:
        if (!GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1EDF4B188))
          goto LABEL_93;
        v23 = a1;
        v24 = 99;
        goto LABEL_90;
      case 0x1FuLL:
        if ((_DWORD)v5)
        {
          if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1EDF4E468))
          {
            objc_msgSend(a1, "componentInfoWithType:count:traits:", 5, v5, v8);
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v11)[2](v11, v222);

          }
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, v5, v8);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v223);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, v5, v8);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v224);

          objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, v5, v8);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v225);

        }
        if (v12)
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 3, 1, v8);
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v226);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 52, 2, v8);
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v227);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 77, 1, v8);
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v228);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 4, 1, v8);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v229);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 64, 0x7FFFFFFFLL, v8);
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v230);

        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1EDF4DED8))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 9, 0x7FFFFFFFLL, v8);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v231);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 53, 1, v8);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v232);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v233);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 24, 1, v8);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v234);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 10, 1, v8);
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v235);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 16, 0x7FFFFFFFLL, v8);
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v236);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 23, 6, v8);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v237);

        if (objc_msgSend(v8, "photosCount"))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, objc_msgSend(v8, "photosCount"), v8);
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v238);

        }
        objc_msgSend(a1, "collectionComponentInfoForReason:count:traits:", 31, 5, v8);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v239);

        objc_msgSend(a1, "publisherComponentInfoForReason:count:traits:", 31, 1, v8);
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v240);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 88, 1, v8);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v241);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 87, 1, v8);
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v242);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 84, objc_msgSend(v8, "photoAlbumCount"), v8);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v243);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 50, 1, v8);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v244);

        if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1EDF4B088))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 93, 1, v8);
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v245);

        }
        if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
        {
          objc_msgSend(a1, "componentInfoWithType:count:traits:", 102, 0x7FFFFFFFLL, v8);
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v246);

        }
        objc_msgSend(a1, "componentInfoWithType:count:traits:", 105, 1, v8);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v247);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 106, 1, v8);
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v248);

        objc_msgSend(a1, "componentInfoWithType:count:traits:", 104, 1, v8);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v249);

        if (!GEOConfigGetBOOL(MapsFeaturesConfig_RealTimeEVCharger, (uint64_t)off_1EDF4B178))
          goto LABEL_93;
        v23 = a1;
        v24 = 97;
        goto LABEL_90;
      default:
        goto LABEL_93;
    }
  }
  v12 = 1;
  objc_msgSend(a1, "componentInfoWithType:count:traits:", 51, 1, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v13);

LABEL_8:
  if ((_DWORD)v5)
  {
    if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1EDF4E468))
    {
      objc_msgSend(a1, "componentInfoWithType:count:traits:", 5, v5, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v14);

    }
    objc_msgSend(a1, "componentInfoWithType:count:traits:", 31, 1, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v15);

    objc_msgSend(a1, "componentInfoWithType:count:traits:", 1, 1, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v16);

    objc_msgSend(a1, "componentInfoWithType:count:traits:", 2, 1, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v17);

  }
  if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1EDF4DED8))
  {
    objc_msgSend(a1, "componentInfoWithType:count:traits:", 9, 0x7FFFFFFFLL, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v18);

  }
  if (v12)
  {
    objc_msgSend(a1, "componentInfoWithType:count:traits:", 3, 1, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v19);

  }
  v20 = a1;
  v21 = 64;
LABEL_17:
  objc_msgSend(v20, "componentInfoWithType:count:traits:", v21, 1, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v22);

LABEL_18:
  v23 = a1;
  v24 = 77;
LABEL_90:
  v175 = 1;
LABEL_91:
  objc_msgSend(v23, "componentInfoWithType:count:traits:", v24, v175, v8);
  v97 = objc_claimAutoreleasedReturnValue();
LABEL_92:
  v176 = (void *)v97;
  v11[2](v11, v97);

LABEL_93:
  v177 = (void *)objc_msgSend(v10, "copy");

  return v177;
}

uint64_t __86__GEOPDPlaceRequest_PlaceDataExtras__createRequestedComponentsForReason_traits_count___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

+ (id)componentInfoWithType:(int)a3 count:(unsigned int)a4 traits:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  GEOPDComponentInfo *v8;
  GEOPDOfflineAreaFilter *v9;
  GEOPDComponentFilter *v10;
  GEOPDCategorizedPhotosFilter *v11;
  void *v12;
  id *v13;
  uint64_t v14;
  int v15;
  GEOPDOfflineAreaFilter *v16;
  uint64_t v17;
  uint64_t v18;
  GEOPDComponentFilter *v19;
  GEOPDRelatedPlaceFilter *v20;
  void *v21;
  id *v22;
  _BYTE *v23;
  GEOPDComponentFilter *v24;
  id v25;
  GEOPDComponentFilter *v26;
  GEOPDFactoidFilter *v27;
  void *v28;
  GEOPDComponentFilter *v29;
  GEOPDComponentFilter *v30;
  GEOPDComponentFilter *v31;
  GEOPDTooltipFilter *v32;
  void *v33;
  char v34;
  GEOPDComponentFilter *v35;
  GEOPDAmenitiesFilter *v36;
  void *v37;
  GEOPDComponentFilter *v38;
  GEOPDQuickLinkFilter *v39;
  void *v40;
  int Integer;
  GEOPDComponentFilter *v42;
  GEOPDComponentFilter *v43;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = -[GEOPDComponentInfo initWithType:count:]([GEOPDComponentInfo alloc], "initWithType:count:", v6, v5);
  if ((int)v6 <= 54)
  {
    if ((int)v6 <= 14)
    {
      if ((_DWORD)v6 == 1)
      {
        if (objc_msgSend(v7, "hasDeviceSpokenLocale"))
        {
          v9 = -[GEOPDComponentFilter initEntityFilterWithSpokenNames]([GEOPDComponentFilter alloc], "initEntityFilterWithSpokenNames");
          goto LABEL_26;
        }
      }
      else
      {
        if ((_DWORD)v6 == 7)
        {
          v9 = -[GEOPDComponentFilter initReviewUserPhotoFilterWithTraits:]([GEOPDComponentFilter alloc], "initReviewUserPhotoFilterWithTraits:", v7);
          goto LABEL_26;
        }
        if ((_DWORD)v6 == 11 && objc_msgSend(v7, "hasTransitScheduleFilter"))
        {
          v9 = -[GEOPDComponentFilter initTransitScheduleFilterWithTraits:]([GEOPDComponentFilter alloc], "initTransitScheduleFilterWithTraits:", v7);
LABEL_26:
          v16 = v9;
          -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v9);
LABEL_61:

          goto LABEL_62;
        }
      }
      goto LABEL_62;
    }
    switch((int)v6)
    {
      case 23:
        v26 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v26);

        v27 = objc_alloc_init(GEOPDFactoidFilter);
        -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDComponentFilter setFactoidFilter:]((uint64_t)v28, v27);

        -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        v16 = (GEOPDOfflineAreaFilter *)objc_claimAutoreleasedReturnValue();
        -[GEOPDComponentFilter factoidFilter]((id *)&v16->super.super.isa);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
          break;
        *(_BYTE *)(v17 + 20) |= 1u;
        goto LABEL_49;
      case 24:
      case 25:
      case 27:
      case 28:
      case 29:
        goto LABEL_62;
      case 26:
        v9 = -[GEOPDComponentFilter initCaptionedPhotoFilterWithTraits:]([GEOPDComponentFilter alloc], "initCaptionedPhotoFilterWithTraits:", v7);
        goto LABEL_26;
      case 30:
        v9 = -[GEOPDComponentFilter initResultSnippetFilterWithTraits:]([GEOPDComponentFilter alloc], "initResultSnippetFilterWithTraits:", v7);
        goto LABEL_26;
      case 31:
        +[GEOAddressObject libraryVersion](GEOAddressObject, "libraryVersion");
        v16 = (GEOPDOfflineAreaFilter *)objc_claimAutoreleasedReturnValue();
        if (-[GEOPDOfflineAreaFilter length](v16, "length"))
        {
          v25 = -[GEOPDComponentFilter initAddressObjectFilterWithLibraryVersion:]([GEOPDComponentFilter alloc], "initAddressObjectFilterWithLibraryVersion:", v16);
          -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v25);
        }
        else
        {
          v25 = v8;
          v8 = 0;
        }
        goto LABEL_60;
      default:
        switch((int)v6)
        {
          case '$':
            v9 = -[GEOPDComponentFilter initTipUserPhotoFilterWithTraits:]([GEOPDComponentFilter alloc], "initTipUserPhotoFilterWithTraits:", v7);
            goto LABEL_26;
          case '%':
          case '&':
          case '\'':
          case ')':
          case '+':
            goto LABEL_62;
          case '(':
            v38 = objc_alloc_init(GEOPDComponentFilter);
            -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v38);

            v39 = objc_alloc_init(GEOPDQuickLinkFilter);
            -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDComponentFilter setQuickLinkFilter:]((uint64_t)v40, v39);

            Integer = GEOConfigGetInteger(GeoServicesConfig_MaxQuickLinkItemsCount, (uint64_t)off_1EDF4DEB8);
            -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
            v16 = (GEOPDOfflineAreaFilter *)objc_claimAutoreleasedReturnValue();
            -[GEOPDComponentFilter quickLinkFilter]((id *)&v16->super.super.isa);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              *(_BYTE *)(v17 + 20) |= 1u;
              *(_DWORD *)(v17 + 16) = Integer;
            }
            goto LABEL_56;
          case '*':
            v42 = objc_alloc_init(GEOPDComponentFilter);
            -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v42);

            v16 = objc_alloc_init(GEOPDOfflineAreaFilter);
            -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            -[GEOPDComponentFilter setOfflineAreaFilter:]((uint64_t)v25, v16);
            goto LABEL_60;
          case ',':
            v43 = objc_alloc_init(GEOPDComponentFilter);
            -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v43);

            v16 = objc_alloc_init(GEOPDSupportsOfflineMapsFilter);
            -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            -[GEOPDComponentFilter setSupportsOfflineMapsFilter:]((uint64_t)v25, v16);
            goto LABEL_60;
          default:
            if ((_DWORD)v6 != 15)
              goto LABEL_62;
            v35 = objc_alloc_init(GEOPDComponentFilter);
            -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v35);

            v36 = objc_alloc_init(GEOPDAmenitiesFilter);
            -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDComponentFilter setAmenitiesFilter:]((uint64_t)v37, v36);

            -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
            v16 = (GEOPDOfflineAreaFilter *)objc_claimAutoreleasedReturnValue();
            -[GEOPDComponentFilter amenitiesFilter]((id *)&v16->super.super.isa);
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_56;
            *(_BYTE *)(v17 + 20) |= 1u;
            break;
        }
LABEL_49:
        *(_BYTE *)(v17 + 16) = 1;
        break;
    }
LABEL_56:

    goto LABEL_61;
  }
  if ((int)v6 > 67)
  {
    if ((int)v6 > 98)
    {
      if ((_DWORD)v6 == 99)
      {
        v31 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v31);

        v32 = objc_alloc_init(GEOPDTooltipFilter);
        -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDComponentFilter setToolTipFilter:]((uint64_t)v33, v32);

        v34 = objc_msgSend(v7, "wantsRouteCreationTip");
        -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        v16 = (GEOPDOfflineAreaFilter *)objc_claimAutoreleasedReturnValue();
        -[GEOPDComponentFilter toolTipFilter]((id *)&v16->super.super.isa);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          *(_BYTE *)(v17 + 20) |= 1u;
          *(_BYTE *)(v17 + 16) = v34;
        }
        goto LABEL_56;
      }
      if ((_DWORD)v6 != 103)
        goto LABEL_62;
      v24 = objc_alloc_init(GEOPDComponentFilter);
      -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v24);

      v16 = objc_alloc_init(GEOPDForwardInfoFilter);
      -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentFilter setForwardInfoFilter:]((uint64_t)v25, v16);
LABEL_60:

      goto LABEL_61;
    }
    if ((_DWORD)v6 == 68)
    {
      if (objc_msgSend(v7, "hasTransitTripStopTimeFilter"))
      {
        v9 = -[GEOPDComponentFilter initTransitTripStopTimeFilterWithTraits:]([GEOPDComponentFilter alloc], "initTransitTripStopTimeFilterWithTraits:", v7);
        goto LABEL_26;
      }
      goto LABEL_62;
    }
    if ((_DWORD)v6 != 84)
      goto LABEL_62;
    v10 = objc_alloc_init(GEOPDComponentFilter);
    -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v10);

    v11 = objc_alloc_init(GEOPDCategorizedPhotosFilter);
    -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentFilter setCategorizedPhotosFilter:]((uint64_t)v12, v11);

    -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentFilter categorizedPhotosFilter](v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      *(_BYTE *)(v14 + 80) |= 0x80u;
      *(_BYTE *)(v14 + 80) |= 2u;
      *(_DWORD *)(v14 + 72) = 0;
    }

    v15 = objc_msgSend(v7, "photosCount");
    -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
    v16 = (GEOPDOfflineAreaFilter *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentFilter categorizedPhotosFilter]((id *)&v16->super.super.isa);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_56;
    *(_BYTE *)(v17 + 80) |= 0x80u;
    *(_BYTE *)(v17 + 80) |= 1u;
    v18 = 68;
LABEL_33:
    *(_DWORD *)(v17 + v18) = v15;
    goto LABEL_56;
  }
  if ((int)v6 > 58)
  {
    if ((_DWORD)v6 == 59)
    {
      v30 = objc_alloc_init(GEOPDComponentFilter);
      -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v30);

      v16 = objc_alloc_init(GEOPDStorefrontPresentationFilter);
      -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentFilter setStorefrontPresentationFilter:]((uint64_t)v25, v16);
      goto LABEL_60;
    }
    if ((_DWORD)v6 != 66)
      goto LABEL_62;
    v19 = objc_alloc_init(GEOPDComponentFilter);
    -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v19);

    v20 = objc_alloc_init(GEOPDRelatedPlaceFilter);
    -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentFilter setRelatedPlaceFilter:]((uint64_t)v21, v20);

    -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
    v22 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentFilter relatedPlaceFilter](v22);
    v23 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v23[24] |= 2u;
      v23[20] = 1;
    }

    v15 = objc_msgSend(v7, "relatedPlaceItemCount");
    -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
    v16 = (GEOPDOfflineAreaFilter *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentFilter relatedPlaceFilter]((id *)&v16->super.super.isa);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_56;
    *(_BYTE *)(v17 + 24) |= 1u;
    v18 = 16;
    goto LABEL_33;
  }
  if ((_DWORD)v6 == 55)
  {
    v29 = objc_alloc_init(GEOPDComponentFilter);
    -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v29);

    v16 = objc_alloc_init(GEOPDStorefrontFilter);
    -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentFilter setStorefrontFilter:]((uint64_t)v25, v16);
    goto LABEL_60;
  }
  if ((_DWORD)v6 == 57)
  {
    v9 = -[GEOPDComponentFilter initAnnotatedItemListFilterWithTraits:]([GEOPDComponentFilter alloc], "initAnnotatedItemListFilterWithTraits:", v7);
    goto LABEL_26;
  }
LABEL_62:

  return v8;
}

- (id)_initWithTraits:(id)a3 includeHistoricalLocations:(BOOL)a4 supportedMapsResultTypes:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  GEOPDAnalyticMetadata *v11;
  GEOPDClientMetadata *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  GEOPDMapsSuggestionsTouristInfo *v25;
  double v26;
  void *v27;
  GEOPDPlaceRequest *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v34.receiver = self;
  v34.super_class = (Class)GEOPDPlaceRequest;
  v10 = -[GEOPDPlaceRequest init](&v34, sel_init);
  if (v10)
  {
    v11 = -[GEOPDAnalyticMetadata initWithTraits:]([GEOPDAnalyticMetadata alloc], "initWithTraits:", v8);
    -[GEOPDPlaceRequest setAnalyticMetadata:](v10, "setAnalyticMetadata:", v11);
    v12 = -[GEOPDClientMetadata initWithTraits:]([GEOPDClientMetadata alloc], "initWithTraits:", v8);
    if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1EDF4B088))
      -[GEOPDClientMetadata setSupportEnrichment:](v12, "setSupportEnrichment:", 1);
    if (v9)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            -[GEOPDClientMetadata addSupportedMapsResultType:](v12, "addSupportedMapsResultType:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "intValue", (_QWORD)v30));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v15);
      }

    }
    else
    {
      -[GEOPDClientMetadata addSupportedMapsResultType:](v12, "addSupportedMapsResultType:", 1);
    }
    -[GEOPDPlaceRequest setClientMetadata:](v10, "setClientMetadata:", v12, (_QWORD)v30);
    if (objc_msgSend(v8, "deviceDisplayLanguagesCount"))
    {
      objc_msgSend(v8, "deviceDisplayLanguages");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");
      -[GEOPDPlaceRequest setDisplayLanguages:](v10, "setDisplayLanguages:", v19);

    }
    if (objc_msgSend(v8, "hasDeviceSpokenLocale"))
    {
      objc_msgSend(v8, "deviceSpokenLocale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequest addSpokenLanguage:](v10, "addSpokenLanguage:", v20);

    }
    if (objc_msgSend(v8, "hasDisplayRegion"))
    {
      objc_msgSend(v8, "displayRegion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequest setDisplayRegion:](v10, "setDisplayRegion:", v21);

    }
    if (v6)
    {
      objc_msgSend(v8, "historicalLocations");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v8, "historicalLocations");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceRequest clientMetadata](v10, "clientMetadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setDeviceHistoricalLocations:", v23);

      }
    }
    if (objc_msgSend(v8, "hasIsTourist"))
    {
      v25 = objc_alloc_init(GEOPDMapsSuggestionsTouristInfo);
      objc_msgSend(v8, "isTourist");
      if (v25)
      {
        *(_BYTE *)&v25->_flags |= 1u;
        v25->_isTourist = v26;
      }
      -[GEOPDPlaceRequest clientMetadata](v10, "clientMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setMapsSuggestionsTouristInfo:", v25);

    }
    v28 = v10;

  }
  return v10;
}

- (void)setDisplayLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;

}

- (void)setClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (int)requestType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_requestType;
  else
    return 0;
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEOPDPlaceRequest _readClientMetadata]((uint64_t)self);
  return self->_clientMetadata;
}

- (void)_readClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetadata_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPlaceRequestParameters
{
  -[GEOPDPlaceRequest _readPlaceRequestParameters]((uint64_t)self);
  return self->_placeRequestParameters != 0;
}

- (GEOPDPlaceRequestParameters)placeRequestParameters
{
  -[GEOPDPlaceRequest _readPlaceRequestParameters]((uint64_t)self);
  return self->_placeRequestParameters;
}

- (void)_readPlaceRequestParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequestParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)setPlaceRequestParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_placeRequestParameters, a3);
}

- (BOOL)hasClientMetadata
{
  -[GEOPDPlaceRequest _readClientMetadata]((uint64_t)self);
  return self->_clientMetadata != 0;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDPlaceRequestClearSensitiveFields(self, a3, 1);
}

- (id)initForDatasetCheckWithTraits:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v4, 1, 0);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "addRequestedComponentsForReason:traits:count:", 1, v4, 0);
    objc_msgSend(v6, "setRequestType:", 24);
    v7 = v6;
  }

  return v6;
}

- (GEOPDPlaceRequest)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  GEOPDPlaceRequest *v11;
  GEOPDPlaceRequest *v12;
  GEOPDPlaceRequestParameters *v13;
  GEOPDPlaceRequest *v14;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = a5;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 1, 0);
  v12 = v11;
  if (v11)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v11, "addRequestedComponentsForReason:traits:count:", 0, v10, 1);
    v13 = -[GEOPDPlaceRequestParameters initWithMapItemToRefine:coordinate:traits:]([GEOPDPlaceRequestParameters alloc], "initWithMapItemToRefine:coordinate:traits:", v9, v10, var0, var1);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v12, "setPlaceRequestParameters:", v13);
    -[GEOPDPlaceRequest setRequestType:](v12, "setRequestType:", 7);
    v14 = v12;

  }
  return v12;
}

- (GEOPDPlaceRequest)initWithReverseGeocodeLocation:(id)a3 includeEntryPoints:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 placeTypeLimit:(int)a6 traits:(id)a7
{
  uint64_t v8;
  _BOOL8 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  GEOPDPlaceRequest *v14;
  GEOPDPlaceRequest *v15;
  GEOPDPlaceRequestParameters *v16;
  GEOPDPlaceRequest *v17;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  v14 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v13, 1, 0);
  v15 = v14;
  if (v14)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v14, "addRequestedComponentsForReason:traits:count:", !v10, v13, 1);
    v16 = -[GEOPDPlaceRequestParameters initWithReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:]([GEOPDPlaceRequestParameters alloc], "initWithReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:", v12, v9, v8);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v15, "setPlaceRequestParameters:", v16);
    -[GEOPDPlaceRequest setRequestType:](v15, "setRequestType:", 4);
    v17 = v15;

  }
  return v15;
}

- (void)addRequestedComponentsForReason:(unint64_t)a3 traits:(id)a4 count:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "createRequestedComponentsForReason:traits:count:", a3, v8, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[GEOPDPlaceRequest addRequestedComponents:](self, "addRequestedComponents:", v9);
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_requestType = a3;
}

- (GEOPDPlaceRequest)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  GEOPDPlaceRequest *v11;
  GEOPDPlaceRequestParameters *v12;
  GEOPDPlaceRequest *v13;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v9, 1, 0);
  v11 = v10;
  if (v10)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v10, "addRequestedComponentsForReason:traits:count:", 0, v9, v6);
    v12 = -[GEOPDPlaceRequestParameters initWithForwardGeocodeAddress:maxResults:traits:]([GEOPDPlaceRequestParameters alloc], "initWithForwardGeocodeAddress:maxResults:traits:", v8, v6, v9);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v11, "setPlaceRequestParameters:", v12);
    -[GEOPDPlaceRequest setRequestType:](v11, "setRequestType:", 2);
    v13 = v11;

  }
  return v11;
}

- (BOOL)shouldConsiderCaching
{
  return -[GEOPDPlaceRequest isForwardGeocoderRequest](self, "isForwardGeocoderRequest")
      || -[GEOPDPlaceRequest isCanonicalLocationSearchRequest](self, "isCanonicalLocationSearchRequest")
      || -[GEOPDPlaceRequest isMerchantRequest](self, "isMerchantRequest")
      || -[GEOPDPlaceRequest isPlaceRefinementRequest](self, "isPlaceRefinementRequest")
      || -[GEOPDPlaceRequest isBrandLookupRequest](self, "isBrandLookupRequest");
}

- (BOOL)isPlaceRefinementRequest
{
  uint64_t v3;
  _QWORD *v4;
  BOOL v5;

  if (-[GEOPDPlaceRequest requestType](self, "requestType") != 7
    || !-[GEOPDPlaceRequest hasPlaceRequestParameters](self, "hasPlaceRequestParameters"))
  {
    return 0;
  }
  -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters](v3);
    v5 = v4[37] != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isMerchantRequest
{
  uint64_t v3;
  _QWORD *v4;
  BOOL v5;

  if (-[GEOPDPlaceRequest requestType](self, "requestType") != 6
    || !-[GEOPDPlaceRequest hasPlaceRequestParameters](self, "hasPlaceRequestParameters"))
  {
    return 0;
  }
  -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters](v3);
    v5 = v4[31] != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isForwardGeocoderRequest
{
  uint64_t v3;
  _QWORD *v4;
  BOOL v5;

  if (-[GEOPDPlaceRequest requestType](self, "requestType") != 2
    || !-[GEOPDPlaceRequest hasPlaceRequestParameters](self, "hasPlaceRequestParameters"))
  {
    return 0;
  }
  -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readGeocodingParameters](v3);
    v5 = v4[23] != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isCanonicalLocationSearchRequest
{
  uint64_t v3;
  _QWORD *v4;
  BOOL v5;

  if (-[GEOPDPlaceRequest requestType](self, "requestType") != 3
    || !-[GEOPDPlaceRequest hasPlaceRequestParameters](self, "hasPlaceRequestParameters"))
  {
    return 0;
  }
  -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readCanonicalLocationSearchParameters](v3);
    v5 = v4[16] != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSData)handleData
{
  -[GEOPDPlaceRequest _readHandleData]((uint64_t)self);
  return self->_handleData;
}

- (void)_readHandleData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHandleData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

+ (id)collectionComponentInfoForReason:(unint64_t)a3 count:(unsigned int)a4 traits:(id)a5
{
  GEOPDComponentInfo *v6;
  GEOPDComponentFilter *v7;
  GEOPDPlaceCollectionFilter *v8;
  GEOPDPlaceCollectionFilter *v9;
  int *v10;
  char v11;
  char v12;
  char v13;
  int *v14;
  char v15;
  char v16;
  int *v17;

  v6 = -[GEOPDComponentInfo initWithType:count:]([GEOPDComponentInfo alloc], "initWithType:count:", 65, *(_QWORD *)&a4);
  v7 = objc_alloc_init(GEOPDComponentFilter);
  v8 = objc_alloc_init(GEOPDPlaceCollectionFilter);
  v9 = v8;
  switch(a3)
  {
    case 0uLL:
      if (v8)
      {
        v10 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
        v11 = 64;
        v12 = 1;
        v13 = 2;
        v14 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__enableCollectionItemDescription;
        goto LABEL_15;
      }
      goto LABEL_17;
    case 1uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x17uLL:
      goto LABEL_17;
    case 2uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x16uLL:
    case 0x18uLL:
      goto LABEL_2;
    case 3uLL:
      if (!v8)
        goto LABEL_17;
      v12 = 0;
      v14 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
      v13 = 64;
      v15 = 1;
      v16 = 2;
      v17 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__enableCollectionItemDescription;
      goto LABEL_12;
    case 0xFuLL:
      if (!v8)
        goto LABEL_17;
      v15 = 0;
      v12 = 1;
      v14 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__isCollectionView;
      v13 = 16;
      v16 = 64;
      v17 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
LABEL_12:
      *(_BYTE *)&v8->_flags |= v16;
      *((_BYTE *)&v8->super.super.isa + *v17) = v15;
      v10 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__enableMediaLink;
      v11 = 4;
      goto LABEL_15;
    case 0x10uLL:
      if (!v8)
        goto LABEL_17;
      v10 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__isCollectionView;
      v11 = 16;
      v12 = 1;
      v13 = 64;
      v14 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
LABEL_15:
      *(_BYTE *)&v8->_flags |= v13;
      *((_BYTE *)&v8->super.super.isa + *v14) = v12;
      goto LABEL_16;
    default:
      if (a3 != 31)
        goto LABEL_17;
LABEL_2:
      if (!v8)
        goto LABEL_17;
      v10 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
      v11 = 64;
LABEL_16:
      *(_BYTE *)&v8->_flags |= v11;
      *((_BYTE *)&v8->super.super.isa + *v10) = 1;
LABEL_17:
      -[GEOPDComponentFilter setPlaceCollectionFilter:]((uint64_t)v7, v8);
      -[GEOPDComponentInfo setFilter:]((uint64_t)v6, v7);

      return v6;
  }
}

+ (id)publisherComponentInfoForReason:(unint64_t)a3 count:(unsigned int)a4 traits:(id)a5
{
  GEOPDComponentInfo *v6;
  GEOPDComponentFilter *v7;
  GEOPDPublisherFilter *v8;
  GEOPDPublisherFilter *v9;
  char v10;

  v6 = -[GEOPDComponentInfo initWithType:count:]([GEOPDComponentInfo alloc], "initWithType:count:", 71, *(_QWORD *)&a4);
  v7 = objc_alloc_init(GEOPDComponentFilter);
  v8 = objc_alloc_init(GEOPDPublisherFilter);
  v9 = v8;
  v10 = a3 - 2;
  if (a3 - 2 <= 0x1D && ((0x20001801u >> v10) & 1) != 0 && v8)
  {
    *(_BYTE *)&v8->_flags |= 1u;
    v8->_partiallyClientize = (0x3FFFF7FFu >> v10) & 1;
  }
  -[GEOPDComponentFilter setPublisherFilter:]((uint64_t)v7, v8);
  -[GEOPDComponentInfo setFilter:]((uint64_t)v6, v7);

  return v6;
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
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

- (Class)responseClass
{
  return (Class)objc_opt_class();
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
  __int16 flags;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PBDataReader *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v27 = self->_reader;
    objc_sync_enter(v27);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v28);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v27);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceRequest readAll:](self, "readAll:", 0);
    if (self->_analyticMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_clientMetadata)
      PBDataWriterWriteSubmessage();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v6 = self->_displayLanguages;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v46;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v7);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = self->_spokenLanguages;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v42;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v11);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = self->_requestedComponents;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v38;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v15);
    }

    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_placeRequestParameters)
      PBDataWriterWriteSubmessage();
    if (self->_displayRegion)
      PBDataWriterWriteStringField();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = self->_auxiliaryTierRequestedComponents;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v34;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
      }
      while (v20);
    }

    if (self->_privacyMetadata)
      PBDataWriterWriteSubmessage();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v23 = self->_partiallyComposedSearchResultRequestedComponents;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v30;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
      }
      while (v24);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_handleData)
      PBDataWriterWriteDataField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v29);
  }

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
      v8 = (int *)&readAll__recursiveTag_4037;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4038;
    GEOPDPlaceRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (unsigned)requestTypeCode
{
  return 60;
}

- (BOOL)isBrandLookupRequest
{
  uint64_t v3;
  _QWORD *v4;
  BOOL v5;

  if (-[GEOPDPlaceRequest requestType](self, "requestType") != 30
    || !-[GEOPDPlaceRequest hasPlaceRequestParameters](self, "hasPlaceRequestParameters"))
  {
    return 0;
  }
  -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readBrandLookupParameters](v3);
    v5 = v4[14] != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenLanguages, 0);
  objc_storeStrong((id *)&self->_requestedComponents, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_placeRequestParameters, 0);
  objc_storeStrong((id *)&self->_partiallyComposedSearchResultRequestedComponents, 0);
  objc_storeStrong((id *)&self->_handleData, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_auxiliaryTierRequestedComponents, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDPlaceRequest)initWithMapItemToRefine:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "coordinate");
  v8 = -[GEOPDPlaceRequest initWithMapItemToRefine:coordinate:traits:](self, "initWithMapItemToRefine:coordinate:traits:", v7, v6);

  return v8;
}

- (id)cacheKey
{
  int v3;
  id *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v15;
  uint64_t v16;

  v3 = -[GEOPDPlaceRequest requestType](self, "requestType");
  if (v3 > 6)
  {
    if (v3 == 7)
    {
      -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequestParameters placeRefinementParameters](v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 5;
    }
    else
    {
      if (v3 != 30)
        return 0;
      -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequestParameters brandLookupParameters](v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 4;
    }
  }
  else if (v3 == 2)
  {
    -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters geocodingParameters](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  else
  {
    if (v3 != 3)
      return 0;
    -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters canonicalLocationSearchParameters](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 2;
  }
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GEOPDPlaceRequest displayLanguages](self, "displayLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", &stru_1E1C241D0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v11, "appendData:", v10);
    v15 = 0;
    v16 = 0;
    v12 = objc_retainAutorelease(v11);
    _GEOMurmurHash3_128_realign((const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), v6, &v15);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llx%llx"), v15, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  return 0;
}

- (NSMutableArray)displayLanguages
{
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  return self->_displayLanguages;
}

- (void)_readDisplayLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayLanguages_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (GEOPDPlaceRequest)init
{
  GEOPDPlaceRequest *v2;
  GEOPDPlaceRequest *v3;
  GEOPDPlaceRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceRequest;
  v2 = -[GEOPDPlaceRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readAnalyticMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticMetadata_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasAnalyticMetadata
{
  -[GEOPDPlaceRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata != 0;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEOPDPlaceRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata;
}

- (void)clearDisplayLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_displayLanguages, "removeAllObjects");
}

- (void)addDisplayLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsDisplayLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (unint64_t)displayLanguagesCount
{
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_displayLanguages, "count");
}

- (id)displayLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayLanguages, "objectAtIndex:", a3);
}

+ (Class)displayLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readSpokenLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenLanguages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)spokenLanguages
{
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
  return self->_spokenLanguages;
}

- (void)setSpokenLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *spokenLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  spokenLanguages = self->_spokenLanguages;
  self->_spokenLanguages = v4;

}

- (void)clearSpokenLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_spokenLanguages, "removeAllObjects");
}

- (void)addSpokenLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsSpokenLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)spokenLanguagesCount
{
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_spokenLanguages, "count");
}

- (id)spokenLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_spokenLanguages, "objectAtIndex:", a3);
}

+ (Class)spokenLanguageType
{
  return (Class)objc_opt_class();
}

- (void)setRequestedComponents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *requestedComponents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  requestedComponents = self->_requestedComponents;
  self->_requestedComponents = v4;

}

- (void)clearRequestedComponents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_requestedComponents, "removeAllObjects");
}

- (unint64_t)requestedComponentsCount
{
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  return -[NSMutableArray count](self->_requestedComponents, "count");
}

- (id)requestedComponentAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_requestedComponents, "objectAtIndex:", a3);
}

+ (Class)requestedComponentType
{
  return (Class)objc_opt_class();
}

- (BOOL)suppressResultsRequiringAttribution
{
  return self->_suppressResultsRequiringAttribution;
}

- (void)setSuppressResultsRequiringAttribution:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_suppressResultsRequiringAttribution = a3;
}

- (void)setHasSuppressResultsRequiringAttribution:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32764;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSuppressResultsRequiringAttribution
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasRequestType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 < 0x3F)
    return off_1E1C04C28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
  {
    v4 = 61;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
  {
    v4 = 62;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEOPDPlaceRequest _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOPDPlaceRequest _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (void)_readAuxiliaryTierRequestedComponents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuxiliaryTierRequestedComponents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)auxiliaryTierRequestedComponents
{
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  return self->_auxiliaryTierRequestedComponents;
}

- (void)setAuxiliaryTierRequestedComponents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *auxiliaryTierRequestedComponents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;
  self->_auxiliaryTierRequestedComponents = v4;

}

- (void)clearAuxiliaryTierRequestedComponents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_auxiliaryTierRequestedComponents, "removeAllObjects");
}

- (void)addAuxiliaryTierRequestedComponent:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsAuxiliaryTierRequestedComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsAuxiliaryTierRequestedComponent:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)auxiliaryTierRequestedComponentsCount
{
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  return -[NSMutableArray count](self->_auxiliaryTierRequestedComponents, "count");
}

- (id)auxiliaryTierRequestedComponentAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_auxiliaryTierRequestedComponents, "objectAtIndex:", a3);
}

+ (Class)auxiliaryTierRequestedComponentType
{
  return (Class)objc_opt_class();
}

- (void)_readPrivacyMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPrivacyMetadata
{
  -[GEOPDPlaceRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOPDPlaceRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x9000u;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (void)_readPartiallyComposedSearchResultRequestedComponents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPartiallyComposedSearchResultRequestedComponents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)partiallyComposedSearchResultRequestedComponents
{
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  return self->_partiallyComposedSearchResultRequestedComponents;
}

- (void)setPartiallyComposedSearchResultRequestedComponents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *partiallyComposedSearchResultRequestedComponents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;
  self->_partiallyComposedSearchResultRequestedComponents = v4;

}

- (void)clearPartiallyComposedSearchResultRequestedComponents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_partiallyComposedSearchResultRequestedComponents, "removeAllObjects");
}

- (void)addPartiallyComposedSearchResultRequestedComponent:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsPartiallyComposedSearchResultRequestedComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsPartiallyComposedSearchResultRequestedComponent:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)partiallyComposedSearchResultRequestedComponentsCount
{
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  return -[NSMutableArray count](self->_partiallyComposedSearchResultRequestedComponents, "count");
}

- (id)partiallyComposedSearchResultRequestedComponentAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_partiallyComposedSearchResultRequestedComponents, "objectAtIndex:", a3);
}

+ (Class)partiallyComposedSearchResultRequestedComponentType
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
  v8.super_class = (Class)GEOPDPlaceRequest;
  -[GEOPDPlaceRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  _QWORD v72[4];
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "analyticMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("analyticMetadata");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("analytic_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "clientMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("clientMetadata");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend((id)a1, "displayLanguages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("displayLanguage");
    else
      v14 = CFSTR("display_language");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend((id)a1, "spokenLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("spokenLanguage");
    else
      v16 = CFSTR("spoken_language");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v18 = *(id *)(a1 + 96);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v83 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("requestedComponent");
    else
      v25 = CFSTR("requested_component");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  v26 = *(_WORD *)(a1 + 132);
  if ((v26 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 129));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("suppressResultsRequiringAttribution");
    else
      v28 = CFSTR("suppress_results_requiring_attribution");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v26 = *(_WORD *)(a1 + 132);
  }
  if ((v26 & 1) != 0)
  {
    v29 = *(int *)(a1 + 124);
    if (v29 >= 0x3F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_1E1C04C28[v29];
    }
    if (a2)
      v31 = CFSTR("requestType");
    else
      v31 = CFSTR("request_type");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  objc_msgSend((id)a1, "placeRequestParameters");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("placeRequestParameters");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("place_request_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  objc_msgSend((id)a1, "displayRegion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    if (a2)
      v37 = CFSTR("displayRegion");
    else
      v37 = CFSTR("display_region");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v39 = *(id *)(a1 + 32);
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v79 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v44, "jsonRepresentation");
          else
            objc_msgSend(v44, "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v45);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
      }
      while (v41);
    }

    if (a2)
      v46 = CFSTR("auxiliaryTierRequestedComponent");
    else
      v46 = CFSTR("auxiliary_tier_requested_component");
    objc_msgSend(v4, "setObject:forKey:", v38, v46);

  }
  objc_msgSend((id)a1, "privacyMetadata");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("privacyMetadata");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("privacy_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v52 = *(id *)(a1 + 72);
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v75 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v57, "jsonRepresentation");
          else
            objc_msgSend(v57, "dictionaryRepresentation");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v58);

        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
      }
      while (v54);
    }

    if (a2)
      v59 = CFSTR("partiallyComposedSearchResultRequestedComponent");
    else
      v59 = CFSTR("partially_composed_search_result_requested_component");
    objc_msgSend(v4, "setObject:forKey:", v51, v59);

  }
  if ((*(_WORD *)(a1 + 132) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 128));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v61 = CFSTR("needLatency");
    else
      v61 = CFSTR("need_latency");
    objc_msgSend(v4, "setObject:forKey:", v60, v61);

  }
  objc_msgSend((id)a1, "handleData");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v62)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v62, "base64EncodedStringWithOptions:", 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("handleData"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("handle_data"));
    }
  }

  v65 = *(void **)(a1 + 16);
  if (v65)
  {
    objc_msgSend(v65, "dictionaryRepresentation");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v66;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v66, "count"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __47__GEOPDPlaceRequest__dictionaryRepresentation___block_invoke;
      v72[3] = &unk_1E1C00600;
      v69 = v68;
      v73 = v69;
      objc_msgSend(v67, "enumerateKeysAndObjectsUsingBlock:", v72);
      v70 = v69;

      v67 = v70;
    }
    objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDPlaceRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDPlaceRequest)initWithDictionary:(id)a3
{
  return (GEOPDPlaceRequest *)-[GEOPDPlaceRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDAnalyticMetadata *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOPDClientMetadata *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  GEOPDComponentInfo *v42;
  void *v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  id v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  GEOPDPlaceRequestParameters *v53;
  id v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  GEOPDComponentInfo *v66;
  void *v67;
  uint64_t v68;
  const __CFString *v69;
  void *v70;
  GEOPrivacyMetadata *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  GEOPDComponentInfo *v82;
  void *v83;
  uint64_t v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  void *v89;
  void *v91;
  void *v92;
  void *v93;
  id v94;
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
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_273;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_273;
  if ((_DWORD)a3)
    v6 = CFSTR("analyticMetadata");
  else
    v6 = CFSTR("analytic_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOPDAnalyticMetadata alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOPDAnalyticMetadata initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOPDAnalyticMetadata initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setAnalyticMetadata:", v9);

  }
  if ((_DWORD)a3)
    v11 = CFSTR("clientMetadata");
  else
    v11 = CFSTR("client_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOPDClientMetadata alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOPDClientMetadata initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOPDClientMetadata initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setClientMetadata:", v14);

  }
  if ((_DWORD)a3)
    v16 = CFSTR("displayLanguage");
  else
    v16 = CFSTR("display_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v94 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v112 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = (void *)objc_msgSend(v23, "copy");
            objc_msgSend(a1, "addDisplayLanguage:", v24);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
      }
      while (v20);
    }

    v5 = v94;
  }

  if ((_DWORD)a3)
    v25 = CFSTR("spokenLanguage");
  else
    v25 = CFSTR("spoken_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v108;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v108 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = (void *)objc_msgSend(v32, "copy");
            objc_msgSend(a1, "addSpokenLanguage:", v33);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
      }
      while (v29);
    }

    v5 = v94;
  }

  if ((_DWORD)a3)
    v34 = CFSTR("requestedComponent");
  else
    v34 = CFSTR("requested_component");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v91 = v35;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v104;
      do
      {
        v40 = 0;
        do
        {
          if (*(_QWORD *)v104 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v40);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v42 = [GEOPDComponentInfo alloc];
            if (v42)
              v43 = (void *)-[GEOPDComponentInfo _initWithDictionary:isJSON:]((uint64_t)v42, v41, a3);
            else
              v43 = 0;
            objc_msgSend(a1, "addRequestedComponent:", v43, v91);

          }
          ++v40;
        }
        while (v38 != v40);
        v44 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
        v38 = v44;
      }
      while (v44);
    }

    v35 = v91;
    v5 = v94;
  }

  if ((_DWORD)a3)
    v45 = CFSTR("suppressResultsRequiringAttribution");
  else
    v45 = CFSTR("suppress_results_requiring_attribution");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45, v91);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSuppressResultsRequiringAttribution:", objc_msgSend(v46, "BOOLValue"));

  if ((_DWORD)a3)
    v47 = CFSTR("requestType");
  else
    v47 = CFSTR("request_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = v48;
    if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v50 = 0;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
    {
      v50 = 1;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
    {
      v50 = 2;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
    {
      v50 = 3;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
    {
      v50 = 4;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
    {
      v50 = 5;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
    {
      v50 = 6;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
    {
      v50 = 7;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
    {
      v50 = 8;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
    {
      v50 = 9;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
    {
      v50 = 10;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v50 = 11;
    }
    else
    {
      if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
      {
        v50 = 12;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
      {
        v50 = 13;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
      {
        v50 = 14;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
      {
        v50 = 15;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
      {
        v50 = 16;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
      {
        v50 = 17;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
      {
        v50 = 18;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
      {
        v50 = 19;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
      {
        v50 = 20;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
      {
        v50 = 21;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
      {
        v50 = 22;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
      {
        v50 = 23;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
      {
        v50 = 24;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
      {
        v50 = 25;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
      {
        v50 = 26;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
      {
        v50 = 27;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
      {
        v50 = 28;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
      {
        v50 = 29;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
      {
        v50 = 30;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
      {
        v50 = 31;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
      {
        v50 = 32;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
      {
        v50 = 33;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
      {
        v50 = 34;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
      {
        v50 = 35;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
      {
        v50 = 36;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
      {
        v50 = 37;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
      {
        v50 = 38;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
      {
        v50 = 39;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
      {
        v50 = 40;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
      {
        v50 = 41;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
      {
        v50 = 42;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
      {
        v50 = 43;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
      {
        v50 = 44;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
      {
        v50 = 45;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
      {
        v50 = 46;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
      {
        v50 = 47;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
      {
        v50 = 48;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
      {
        v50 = 49;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
      {
        v50 = 50;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
      {
        v50 = 51;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
      {
        v50 = 52;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
      {
        v50 = 53;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
      {
        v50 = 54;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
      {
        v50 = 55;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
      {
        v50 = 56;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
      {
        v50 = 57;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
      {
        v50 = 58;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
      {
        v50 = 59;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
      {
        v50 = 60;
      }
      else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
      {
        v50 = 61;
      }
      else if (objc_msgSend(v49, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
      {
        v50 = 62;
      }
      else
      {
        v50 = 0;
      }
      v5 = v94;
    }

    goto LABEL_205;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = objc_msgSend(v48, "intValue");
LABEL_205:
    objc_msgSend(a1, "setRequestType:", v50);
  }

  if ((_DWORD)a3)
    v51 = CFSTR("placeRequestParameters");
  else
    v51 = CFSTR("place_request_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = [GEOPDPlaceRequestParameters alloc];
    if (v53)
      v54 = -[GEOPDPlaceRequestParameters _initWithDictionary:isJSON:](v53, v52, a3);
    else
      v54 = 0;
    objc_msgSend(a1, "setPlaceRequestParameters:", v54);

  }
  if ((_DWORD)a3)
    v55 = CFSTR("displayRegion");
  else
    v55 = CFSTR("display_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = (void *)objc_msgSend(v56, "copy");
    objc_msgSend(a1, "setDisplayRegion:", v57);

  }
  if ((_DWORD)a3)
    v58 = CFSTR("auxiliaryTierRequestedComponent");
  else
    v58 = CFSTR("auxiliary_tier_requested_component");
  objc_msgSend(v5, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v92 = v59;
    v60 = v59;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v100;
      do
      {
        v64 = 0;
        do
        {
          if (*(_QWORD *)v100 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v64);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v66 = [GEOPDComponentInfo alloc];
            if (v66)
              v67 = (void *)-[GEOPDComponentInfo _initWithDictionary:isJSON:]((uint64_t)v66, v65, a3);
            else
              v67 = 0;
            objc_msgSend(a1, "addAuxiliaryTierRequestedComponent:", v67, v92);

          }
          ++v64;
        }
        while (v62 != v64);
        v68 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
        v62 = v68;
      }
      while (v68);
    }

    v59 = v92;
    v5 = v94;
  }

  if ((_DWORD)a3)
    v69 = CFSTR("privacyMetadata");
  else
    v69 = CFSTR("privacy_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69, v92);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v71 = [GEOPrivacyMetadata alloc];
    if ((a3 & 1) != 0)
      v72 = -[GEOPrivacyMetadata initWithJSON:](v71, "initWithJSON:", v70);
    else
      v72 = -[GEOPrivacyMetadata initWithDictionary:](v71, "initWithDictionary:", v70);
    v73 = (void *)v72;
    objc_msgSend(a1, "setPrivacyMetadata:", v72);

  }
  if ((_DWORD)a3)
    v74 = CFSTR("partiallyComposedSearchResultRequestedComponent");
  else
    v74 = CFSTR("partially_composed_search_result_requested_component");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = v75;
    v76 = v75;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v96;
      do
      {
        v80 = 0;
        do
        {
          if (*(_QWORD *)v96 != v79)
            objc_enumerationMutation(v76);
          v81 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v80);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v82 = [GEOPDComponentInfo alloc];
            if (v82)
              v83 = (void *)-[GEOPDComponentInfo _initWithDictionary:isJSON:]((uint64_t)v82, v81, a3);
            else
              v83 = 0;
            objc_msgSend(a1, "addPartiallyComposedSearchResultRequestedComponent:", v83, v93);

          }
          ++v80;
        }
        while (v78 != v80);
        v84 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
        v78 = v84;
      }
      while (v84);
    }

    v75 = v93;
    v5 = v94;
  }

  if ((_DWORD)a3)
    v85 = CFSTR("needLatency");
  else
    v85 = CFSTR("need_latency");
  objc_msgSend(v5, "objectForKeyedSubscript:", v85, v93);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNeedLatency:", objc_msgSend(v86, "BOOLValue"));

  if ((_DWORD)a3)
    v87 = CFSTR("handleData");
  else
    v87 = CFSTR("handle_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v88, 0);
    objc_msgSend(a1, "setHandleData:", v89);

  }
LABEL_273:

  return a1;
}

- (GEOPDPlaceRequest)initWithJSON:(id)a3
{
  return (GEOPDPlaceRequest *)-[GEOPDPlaceRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceRequestIsValid((char *)a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_auxiliaryTierRequestedComponents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v9);
      if (v10)
      {
        if ((-[GEOPDComponentFilter hasGreenTeaWithValue:](*(_QWORD *)(v10 + 16), v3) & 1) != 0)
          goto LABEL_32;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOPDPlaceRequest _readClientMetadata]((uint64_t)self);
  if (!-[GEOPDClientMetadata hasGreenTeaWithValue:](self->_clientMetadata, "hasGreenTeaWithValue:", v3))
  {
    -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = self->_partiallyComposedSearchResultRequestedComponents;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
LABEL_14:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v5);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
        if (v16)
        {
          if ((-[GEOPDComponentFilter hasGreenTeaWithValue:](*(_QWORD *)(v16 + 16), v3) & 1) != 0)
            break;
        }
        if (v13 == ++v15)
        {
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          if (v13)
            goto LABEL_14;
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:

      -[GEOPDPlaceRequest _readPlaceRequestParameters]((uint64_t)self);
      if ((-[GEOPDPlaceRequestParameters hasGreenTeaWithValue:]((uint64_t)self->_placeRequestParameters, v3) & 1) != 0)
        return 1;
      -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v5 = self->_requestedComponents;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      if (!v17)
      {
LABEL_31:
        v11 = 0;
LABEL_33:

        return v11;
      }
      v18 = v17;
      v19 = *(_QWORD *)v24;
LABEL_24:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v5);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20);
        if (v21)
        {
          if ((-[GEOPDComponentFilter hasGreenTeaWithValue:](*(_QWORD *)(v21 + 16), v3) & 1) != 0)
            break;
        }
        if (v18 == ++v20)
        {
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          if (v18)
            goto LABEL_24;
          goto LABEL_31;
        }
      }
    }
LABEL_32:
    v11 = 1;
    goto LABEL_33;
  }
  return 1;
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
  __int16 flags;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  id *v25;
  id *v26;

  v26 = (id *)a3;
  -[GEOPDPlaceRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v26 + 1, self->_reader);
  *((_DWORD *)v26 + 28) = self->_readerMarkPos;
  *((_DWORD *)v26 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_analyticMetadata)
    objc_msgSend(v26, "setAnalyticMetadata:");
  if (self->_clientMetadata)
    objc_msgSend(v26, "setClientMetadata:");
  if (-[GEOPDPlaceRequest displayLanguagesCount](self, "displayLanguagesCount"))
  {
    objc_msgSend(v26, "clearDisplayLanguages");
    v4 = -[GEOPDPlaceRequest displayLanguagesCount](self, "displayLanguagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDPlaceRequest displayLanguageAtIndex:](self, "displayLanguageAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addDisplayLanguage:", v7);

      }
    }
  }
  if (-[GEOPDPlaceRequest spokenLanguagesCount](self, "spokenLanguagesCount"))
  {
    objc_msgSend(v26, "clearSpokenLanguages");
    v8 = -[GEOPDPlaceRequest spokenLanguagesCount](self, "spokenLanguagesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOPDPlaceRequest spokenLanguageAtIndex:](self, "spokenLanguageAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSpokenLanguage:", v11);

      }
    }
  }
  if (-[GEOPDPlaceRequest requestedComponentsCount](self, "requestedComponentsCount"))
  {
    objc_msgSend(v26, "clearRequestedComponents");
    v12 = -[GEOPDPlaceRequest requestedComponentsCount](self, "requestedComponentsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOPDPlaceRequest requestedComponentAtIndex:](self, "requestedComponentAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addRequestedComponent:", v15);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v26 + 129) = self->_suppressResultsRequiringAttribution;
    *((_WORD *)v26 + 66) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v26 + 31) = self->_requestType;
    *((_WORD *)v26 + 66) |= 1u;
  }
  if (self->_placeRequestParameters)
    objc_msgSend(v26, "setPlaceRequestParameters:");
  if (self->_displayRegion)
    objc_msgSend(v26, "setDisplayRegion:");
  if (-[GEOPDPlaceRequest auxiliaryTierRequestedComponentsCount](self, "auxiliaryTierRequestedComponentsCount"))
  {
    objc_msgSend(v26, "clearAuxiliaryTierRequestedComponents");
    v17 = -[GEOPDPlaceRequest auxiliaryTierRequestedComponentsCount](self, "auxiliaryTierRequestedComponentsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOPDPlaceRequest auxiliaryTierRequestedComponentAtIndex:](self, "auxiliaryTierRequestedComponentAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addAuxiliaryTierRequestedComponent:", v20);

      }
    }
  }
  if (self->_privacyMetadata)
    objc_msgSend(v26, "setPrivacyMetadata:");
  if (-[GEOPDPlaceRequest partiallyComposedSearchResultRequestedComponentsCount](self, "partiallyComposedSearchResultRequestedComponentsCount"))
  {
    objc_msgSend(v26, "clearPartiallyComposedSearchResultRequestedComponents");
    v21 = -[GEOPDPlaceRequest partiallyComposedSearchResultRequestedComponentsCount](self, "partiallyComposedSearchResultRequestedComponentsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[GEOPDPlaceRequest partiallyComposedSearchResultRequestedComponentAtIndex:](self, "partiallyComposedSearchResultRequestedComponentAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addPartiallyComposedSearchResultRequestedComponent:", v24);

      }
    }
  }
  v25 = v26;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v26 + 128) = self->_needLatency;
    *((_WORD *)v26 + 66) |= 2u;
  }
  if (self->_handleData)
  {
    objc_msgSend(v26, "setHandleData:");
    v25 = v26;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  __int16 flags;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  id v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  uint64_t v45;
  void *v46;
  PBUnknownFields *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
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
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceRequest readAll:](self, "readAll:", 0);
  v9 = -[GEOPDAnalyticMetadata copyWithZone:](self->_analyticMetadata, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDClientMetadata copyWithZone:](self->_clientMetadata, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v13 = self->_displayLanguages;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v66 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisplayLanguage:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v14);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v18 = self->_spokenLanguages;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v62 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSpokenLanguage:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v19);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v23 = self->_requestedComponents;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v58 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRequestedComponent:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v24);
  }

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 129) = self->_suppressResultsRequiringAttribution;
    *(_WORD *)(v5 + 132) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_requestType;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  v29 = -[GEOPDPlaceRequestParameters copyWithZone:](self->_placeRequestParameters, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v29;

  v31 = -[NSString copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v31;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v33 = self->_auxiliaryTierRequestedComponents;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v54;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAuxiliaryTierRequestedComponent:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    }
    while (v34);
  }

  v38 = -[GEOPrivacyMetadata copyWithZone:](self->_privacyMetadata, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v38;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v40 = self->_partiallyComposedSearchResultRequestedComponents;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v50;
    do
    {
      for (n = 0; n != v41; ++n)
      {
        if (*(_QWORD *)v50 != v42)
          objc_enumerationMutation(v40);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v49);
        objc_msgSend((id)v5, "addPartiallyComposedSearchResultRequestedComponent:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v41);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 128) = self->_needLatency;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  v45 = -[NSData copyWithZone:](self->_handleData, "copyWithZone:", a3, (_QWORD)v49);
  v46 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v45;

  v47 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v47;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDAnalyticMetadata *analyticMetadata;
  GEOPDClientMetadata *clientMetadata;
  NSMutableArray *displayLanguages;
  NSMutableArray *spokenLanguages;
  NSMutableArray *requestedComponents;
  __int16 flags;
  __int16 v11;
  GEOPDPlaceRequestParameters *placeRequestParameters;
  NSString *displayRegion;
  NSMutableArray *auxiliaryTierRequestedComponents;
  GEOPrivacyMetadata *privacyMetadata;
  NSMutableArray *partiallyComposedSearchResultRequestedComponents;
  __int16 v17;
  char v18;
  NSData *handleData;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  -[GEOPDPlaceRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  analyticMetadata = self->_analyticMetadata;
  if ((unint64_t)analyticMetadata | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:"))
      goto LABEL_39;
  }
  clientMetadata = self->_clientMetadata;
  if ((unint64_t)clientMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:"))
      goto LABEL_39;
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](displayLanguages, "isEqual:"))
      goto LABEL_39;
  }
  spokenLanguages = self->_spokenLanguages;
  if ((unint64_t)spokenLanguages | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](spokenLanguages, "isEqual:"))
      goto LABEL_39;
  }
  requestedComponents = self->_requestedComponents;
  if ((unint64_t)requestedComponents | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](requestedComponents, "isEqual:"))
      goto LABEL_39;
  }
  flags = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 66);
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) == 0)
      goto LABEL_39;
    if (self->_suppressResultsRequiringAttribution)
    {
      if (!*((_BYTE *)v4 + 129))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 129))
    {
      goto LABEL_39;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((flags & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 31))
      goto LABEL_39;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_39;
  }
  placeRequestParameters = self->_placeRequestParameters;
  if ((unint64_t)placeRequestParameters | *((_QWORD *)v4 + 10)
    && !-[GEOPDPlaceRequestParameters isEqual:](placeRequestParameters, "isEqual:"))
  {
    goto LABEL_39;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:"))
      goto LABEL_39;
  }
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;
  if ((unint64_t)auxiliaryTierRequestedComponents | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryTierRequestedComponents, "isEqual:"))
      goto LABEL_39;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:"))
      goto LABEL_39;
  }
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;
  if ((unint64_t)partiallyComposedSearchResultRequestedComponents | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](partiallyComposedSearchResultRequestedComponents, "isEqual:"))
      goto LABEL_39;
  }
  v17 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    if ((v17 & 2) == 0)
      goto LABEL_45;
LABEL_39:
    v18 = 0;
    goto LABEL_40;
  }
  if ((v17 & 2) == 0)
    goto LABEL_39;
  if (!self->_needLatency)
  {
    if (!*((_BYTE *)v4 + 128))
      goto LABEL_45;
    goto LABEL_39;
  }
  if (!*((_BYTE *)v4 + 128))
    goto LABEL_39;
LABEL_45:
  handleData = self->_handleData;
  if ((unint64_t)handleData | *((_QWORD *)v4 + 8))
    v18 = -[NSData isEqual:](handleData, "isEqual:");
  else
    v18 = 1;
LABEL_40:

  return v18;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  -[GEOPDPlaceRequest readAll:](self, "readAll:", 1);
  v17 = -[GEOPDAnalyticMetadata hash](self->_analyticMetadata, "hash");
  v16 = -[GEOPDClientMetadata hash](self->_clientMetadata, "hash");
  v15 = -[NSMutableArray hash](self->_displayLanguages, "hash");
  v14 = -[NSMutableArray hash](self->_spokenLanguages, "hash");
  v13 = -[NSMutableArray hash](self->_requestedComponents, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v4 = 2654435761 * self->_suppressResultsRequiringAttribution;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_requestType;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[GEOPDPlaceRequestParameters hash](self->_placeRequestParameters, "hash");
  v7 = -[NSString hash](self->_displayRegion, "hash");
  v8 = -[NSMutableArray hash](self->_auxiliaryTierRequestedComponents, "hash");
  v9 = -[GEOPrivacyMetadata hash](self->_privacyMetadata, "hash");
  v10 = -[NSMutableArray hash](self->_partiallyComposedSearchResultRequestedComponents, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v11 = 2654435761 * self->_needLatency;
  else
    v11 = 0;
  return v16 ^ v17 ^ v15 ^ v14 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSData hash](self->_handleData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPDAnalyticMetadata *analyticMetadata;
  uint64_t v6;
  GEOPDClientMetadata *clientMetadata;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  __int16 v24;
  GEOPDPlaceRequestParameters *placeRequestParameters;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  GEOPrivacyMetadata *privacyMetadata;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  analyticMetadata = self->_analyticMetadata;
  v6 = *((_QWORD *)v4 + 3);
  if (analyticMetadata)
  {
    if (v6)
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPDPlaceRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  clientMetadata = self->_clientMetadata;
  v8 = *((_QWORD *)v4 + 5);
  if (clientMetadata)
  {
    if (v8)
      -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOPDPlaceRequest setClientMetadata:](self, "setClientMetadata:");
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v9 = *((id *)v4 + 6);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v56 != v12)
          objc_enumerationMutation(v9);
        -[GEOPDPlaceRequest addDisplayLanguage:](self, "addDisplayLanguage:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v11);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = *((id *)v4 + 13);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(v14);
        -[GEOPDPlaceRequest addSpokenLanguage:](self, "addSpokenLanguage:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v16);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v19 = *((id *)v4 + 12);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v19);
        -[GEOPDPlaceRequest addRequestedComponent:](self, "addRequestedComponent:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v21);
  }

  v24 = *((_WORD *)v4 + 66);
  if ((v24 & 4) != 0)
  {
    self->_suppressResultsRequiringAttribution = *((_BYTE *)v4 + 129);
    *(_WORD *)&self->_flags |= 4u;
    v24 = *((_WORD *)v4 + 66);
  }
  if ((v24 & 1) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  placeRequestParameters = self->_placeRequestParameters;
  v26 = (void *)*((_QWORD *)v4 + 10);
  if (placeRequestParameters)
  {
    if (v26)
      -[GEOPDPlaceRequestParameters mergeFrom:](placeRequestParameters, v26);
  }
  else if (v26)
  {
    -[GEOPDPlaceRequest setPlaceRequestParameters:](self, "setPlaceRequestParameters:", *((_QWORD *)v4 + 10));
  }
  if (*((_QWORD *)v4 + 7))
    -[GEOPDPlaceRequest setDisplayRegion:](self, "setDisplayRegion:");
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v27 = *((id *)v4 + 4);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(v27);
        -[GEOPDPlaceRequest addAuxiliaryTierRequestedComponent:](self, "addAuxiliaryTierRequestedComponent:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v29);
  }

  privacyMetadata = self->_privacyMetadata;
  v33 = *((_QWORD *)v4 + 11);
  if (privacyMetadata)
  {
    if (v33)
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEOPDPlaceRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = *((id *)v4 + 9);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(v34);
        -[GEOPDPlaceRequest addPartiallyComposedSearchResultRequestedComponent:](self, "addPartiallyComposedSearchResultRequestedComponent:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * n), (_QWORD)v39);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v36);
  }

  if ((*((_WORD *)v4 + 66) & 2) != 0)
  {
    self->_needLatency = *((_BYTE *)v4 + 128);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 8))
    -[GEOPDPlaceRequest setHandleData:](self, "setHandleData:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDPlaceRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4042);
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
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x8008u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDPlaceRequest readAll:](self, "readAll:", 0);
    -[GEOPDAnalyticMetadata clearUnknownFields:](self->_analyticMetadata, "clearUnknownFields:", 1);
    -[GEOPDClientMetadata clearUnknownFields:](self->_clientMetadata, "clearUnknownFields:", 1);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_requestedComponents;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          -[GEOPDComponentInfo clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    -[GEOPDPlaceRequestParameters clearUnknownFields:]((uint64_t)self->_placeRequestParameters);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_auxiliaryTierRequestedComponents;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          -[GEOPDComponentInfo clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v16++), 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v14);
    }

    -[GEOPrivacyMetadata clearUnknownFields:](self->_privacyMetadata, "clearUnknownFields:", 1);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = self->_partiallyComposedSearchResultRequestedComponents;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[GEOPDComponentInfo clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

  }
}

- (BOOL)needLatency
{
  return self->_needLatency;
}

- (void)setNeedLatency:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_needLatency = a3;
}

- (void)setHasNeedLatency:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32766;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNeedLatency
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)hasHandleData
{
  -[GEOPDPlaceRequest _readHandleData]((uint64_t)self);
  return self->_handleData != 0;
}

- (void)setHandleData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  objc_storeStrong((id *)&self->_handleData, a3);
}

- (void)addPartiallyComposedSearchResultRequestedComponents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[GEOPDPlaceRequest addPartiallyComposedSearchResultRequestedComponent:](self, "addPartiallyComposedSearchResultRequestedComponent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)initForAutocompleteWithTraits:(id)a3 count:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  GEOPDPlaceRequest *v7;
  GEOPDAnalyticMetadata *v8;
  GEOPDClientMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOPDMapsSuggestionsTouristInfo *v14;
  double v15;
  void *v16;
  GEOPDPlaceRequest *v17;
  objc_super v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDPlaceRequest;
  v7 = -[GEOPDPlaceRequest init](&v19, sel_init);
  if (v7)
  {
    v8 = -[GEOPDAnalyticMetadata initWithTraits:]([GEOPDAnalyticMetadata alloc], "initWithTraits:", v6);
    -[GEOPDPlaceRequest setAnalyticMetadata:](v7, "setAnalyticMetadata:", v8);
    v9 = -[GEOPDClientMetadata initWithTraits:]([GEOPDClientMetadata alloc], "initWithTraits:", v6);
    if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1EDF4B088))
      -[GEOPDClientMetadata setSupportEnrichment:](v9, "setSupportEnrichment:", 1);
    -[GEOPDClientMetadata addSupportedMapsResultType:](v9, "addSupportedMapsResultType:", 1);
    if (objc_msgSend(v6, "supportAutocompletePublisherResults"))
      -[GEOPDClientMetadata addSupportedMapsResultType:](v9, "addSupportedMapsResultType:", 3);
    if (objc_msgSend(v6, "supportAutocompleteGuideResults"))
      -[GEOPDClientMetadata addSupportedMapsResultType:](v9, "addSupportedMapsResultType:", 2);
    -[GEOPDPlaceRequest setClientMetadata:](v7, "setClientMetadata:", v9);
    if (objc_msgSend(v6, "deviceDisplayLanguagesCount"))
    {
      objc_msgSend(v6, "deviceDisplayLanguages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      -[GEOPDPlaceRequest setDisplayLanguages:](v7, "setDisplayLanguages:", v11);

    }
    if (objc_msgSend(v6, "hasDeviceSpokenLocale"))
    {
      objc_msgSend(v6, "deviceSpokenLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequest addSpokenLanguage:](v7, "addSpokenLanguage:", v12);

    }
    if (objc_msgSend(v6, "hasDisplayRegion"))
    {
      objc_msgSend(v6, "displayRegion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequest setDisplayRegion:](v7, "setDisplayRegion:", v13);

    }
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v7, "addRequestedComponentsForReason:traits:count:", 2, v6, v4);
    if (objc_msgSend(v6, "hasIsTourist"))
    {
      v14 = objc_alloc_init(GEOPDMapsSuggestionsTouristInfo);
      objc_msgSend(v6, "isTourist");
      if (v14)
      {
        *(_BYTE *)&v14->_flags |= 1u;
        v14->_isTourist = v15;
      }
      -[GEOPDPlaceRequest clientMetadata](v7, "clientMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMapsSuggestionsTouristInfo:", v14);

    }
    v17 = v7;

  }
  return v7;
}

- (GEOPDPlaceRequest)initWithComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 traits:(id)a6
{
  id v10;
  id v11;
  GEOPDPlaceRequest *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  GEOPDComponentInfo *v22;
  GEOPDPlaceRequestParameters *v23;
  void *v24;
  GEOPDPlaceRequestParameters *v25;
  GEOPDPlaceRequest *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", a6, 0, 0);
  if (v12)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "intValue");
          objc_msgSend(v13, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "unsignedIntegerValue");

          v22 = -[GEOPDComponentInfo initWithType:count:]([GEOPDComponentInfo alloc], "initWithType:count:", v19, v21);
          -[GEOPDPlaceRequest addRequestedComponent:](v12, "addRequestedComponent:", v22);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v15);
    }

    v23 = [GEOPDPlaceRequestParameters alloc];
    v33 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:](v23, "initWithIdentifiers:resultProviderID:", v24, a5);

    -[GEOPDPlaceRequest setPlaceRequestParameters:](v12, "setPlaceRequestParameters:", v25);
    -[GEOPDPlaceRequest setRequestType:](v12, "setRequestType:", 23);
    v26 = v12;

    v10 = v28;
  }

  return v12;
}

- (GEOPDPlaceRequest)initWithIdentifiers:(id)a3 resultProviderID:(int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  GEOPDPlaceRequest *v11;
  GEOPDPlaceRequestParameters *v12;
  GEOPDPlaceRequest *v13;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v9, 1, &unk_1E1E85978);
  v11 = v10;
  if (v10)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v10, "addRequestedComponentsForReason:traits:count:", 0, v9, 1);
    v12 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:]([GEOPDPlaceRequestParameters alloc], "initWithIdentifiers:resultProviderID:", v8, v6);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v11, "setPlaceRequestParameters:", v12);
    -[GEOPDPlaceRequest setRequestType:](v11, "setRequestType:", 23);
    v13 = v11;

  }
  return v11;
}

- (GEOPDPlaceRequest)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOPDPlaceRequest *v11;
  GEOPDPlaceRequest *v12;
  GEOPDPlaceRequestParameters *v13;
  GEOPDPlaceRequest *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 1, 0);
  v12 = v11;
  if (v11)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v11, "addRequestedComponentsForReason:traits:count:", 0, v10, 1);
    v13 = -[GEOPDPlaceRequestParameters initWithExternalBusinessID:contentProvider:]([GEOPDPlaceRequestParameters alloc], "initWithExternalBusinessID:contentProvider:", v8, v9);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v12, "setPlaceRequestParameters:", v13);
    -[GEOPDPlaceRequest setRequestType:](v12, "setRequestType:", 17);
    v14 = v12;

  }
  return v12;
}

- (GEOPDPlaceRequest)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 industryCategory:(id)a5 industryCode:(id)a6 paymentNetwork:(id)a7 transactionDate:(id)a8 transactionLocation:(id)a9 traits:(id)a10
{
  uint64_t v11;

  LODWORD(v11) = 0;
  return -[GEOPDPlaceRequest initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:](self, "initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", a3, a4, 0, a5, a6, a7, a8, a9, 0,
           0,
           v11,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           a10);
}

- (GEOPDPlaceRequest)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 fuzzyMatched:(id)a34 coarseLocationUsed:(id)a35 bankTransactionType:(int)a36 bankTransactionStatus:(int)a37 bankAnonymisedUserId:(id)a38 otherBankTransactionLocations:(id)a39 bankTransactionDescription:(id)a40 bankTransactionTimestamp:(id)a41 bankRawMerchantCode:(id)a42 bankIndustryCategory:(id)a43 bankIndustryCode:(id)a44 bankTransactionCurrencyCode:(id)a45 bankMerchantInfo:(id)a46 baaCerts:(id)a47 baaSignature:(id)a48 bankBrandMUIDFallbackEnabled:(id)a49 bankIdentifier:(id)a50 bankTransactionDescriptionClean:(id)a51 bankPIIRedactionIsApplied:(id)a52 bankRotationPeriodsSinceEpoch:(id)a53 traits:(id)a54
{
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  GEOPDPlaceRequest *v66;
  GEOPDPlaceRequest *v67;
  GEOPDPlaceRequestParameters *v68;
  GEOPDPlaceRequest *v69;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  char v75;
  id v76;
  GEOPDPlaceRequest *v77;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v114;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;

  v120 = a3;
  v119 = a4;
  v118 = a5;
  v117 = a6;
  v116 = a7;
  v114 = a8;
  v112 = a9;
  v111 = a10;
  v110 = a11;
  v109 = a12;
  v108 = a14;
  v107 = a15;
  v57 = a16;
  v106 = a17;
  v104 = a18;
  v105 = a19;
  v101 = a20;
  v103 = a21;
  v102 = a22;
  v58 = a23;
  v89 = a24;
  v85 = a25;
  v87 = a26;
  v100 = a27;
  v99 = a28;
  v98 = a29;
  v97 = a30;
  v96 = a31;
  v95 = a32;
  v94 = a33;
  v93 = a34;
  v92 = a35;
  v91 = a38;
  v90 = a39;
  v88 = a40;
  v59 = a41;
  v82 = a42;
  v80 = a43;
  v86 = a44;
  v60 = a45;
  v79 = a46;
  v61 = a47;
  v62 = a48;
  v84 = a49;
  v83 = a50;
  v63 = a51;
  v81 = a52;
  v64 = a53;
  v65 = a54;
  v66 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v65, 1, 0);
  v67 = v66;
  if (v66)
  {
    v77 = v66;
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v66, "addRequestedComponentsForReason:traits:count:", 0, v65, 1);
    if (objc_msgSend(v65, "hasSupportsBrandFallback"))
      v75 = objc_msgSend(v65, "supportsBrandFallback");
    else
      v75 = 0;
    if (objc_msgSend(v65, "hasIsSettlement"))
      v74 = objc_msgSend(v65, "isSettlement");
    else
      v74 = 0;
    v76 = v57;
    if (objc_msgSend(v65, "hasIsRefund"))
      v73 = objc_msgSend(v65, "isRefund");
    else
      v73 = 0;
    BYTE2(v72) = v73;
    BYTE1(v72) = v74;
    LOBYTE(v72) = v75;
    LODWORD(v71) = a13;
    v68 = -[GEOPDPlaceRequestParameters initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:brandFallbackSupported:isSettlement:isRefund:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:]([GEOPDPlaceRequestParameters alloc], "initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:brandFallbackSupported:isSettlement:isRefund:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", v120, v119, v118, v117, v116, v114, v112, v111,
            v110,
            v109,
            v71,
            v108,
            v107,
            v57,
            v106,
            v104,
            v105,
            v101,
            v103,
            v102,
            v58,
            v89,
            v85,
            v87,
            v100,
            v99,
            v98,
            v97,
            v96,
            v95,
            v94,
            v72,
            v93,
            v92,
            __PAIR64__(a37, a36),
            v91,
            v90,
            v88,
            v59,
            v82,
            v80,
            v86,
            v60,
            v79,
            v61,
            v62,
            v84,
            v83,
            v63,
            v81,
            v64,
            v65);
    v67 = v77;
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v77, "setPlaceRequestParameters:", v68);

    v57 = v76;
    -[GEOPDPlaceRequest setRequestType:](v77, "setRequestType:", 6);
    v69 = v77;
  }

  return v67;
}

- (GEOPDPlaceRequest)initWithAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOPDPlaceRequest *v14;
  GEOPDPlaceRequest *v15;
  GEOPDPlaceRequestParameters *v16;
  GEOPDPlaceRequest *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v13, 1, 0);
  v15 = v14;
  if (v14)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v14, "addRequestedComponentsForReason:traits:count:", 0, v13, 1);
    v16 = -[GEOPDPlaceRequestParameters initWithAirportCode:terminalCode:gateCode:traits:]([GEOPDPlaceRequestParameters alloc], "initWithAirportCode:terminalCode:gateCode:traits:", v10, v11, v12, v13);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v15, "setPlaceRequestParameters:", v16);

    -[GEOPDPlaceRequest setRequestType:](v15, "setRequestType:", 48);
    v17 = v15;
  }

  return v15;
}

- (GEOPDPlaceRequest)initWithExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6 traits:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  GEOPDPlaceRequest *v17;
  GEOPDPlaceRequestParameters *v18;
  GEOPDPlaceRequest *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v16, 1, 0);
  if (v17)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v17, "addRequestedComponentsForReason:traits:count:", 0, v16, objc_msgSend(v12, "count"));
    v18 = -[GEOPDPlaceRequestParameters initWithExternalTransitStationCodes:sourceID:transactionDate:transactionLocation:]([GEOPDPlaceRequestParameters alloc], "initWithExternalTransitStationCodes:sourceID:transactionDate:transactionLocation:", v12, v13, v14, v15);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v17, "setPlaceRequestParameters:", v18);
    -[GEOPDPlaceRequest setRequestType:](v17, "setRequestType:", 21);
    v19 = v17;

  }
  return v17;
}

- (GEOPDPlaceRequest)initWithReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 traits:(id)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  double var1;
  double var0;
  id v11;
  GEOPDPlaceRequest *v12;
  GEOPDPlaceRequest *v13;
  GEOPDPlaceRequestParameters *v14;
  GEOPDPlaceRequest *v15;

  v6 = a5;
  v7 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a6;
  v12 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v11, 1, 0);
  v13 = v12;
  if (v12)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v12, "addRequestedComponentsForReason:traits:count:", !v7, v11, 1);
    v14 = -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:]([GEOPDPlaceRequestParameters alloc], "initWithReverseGeocodeCoordinate:preserveOriginalLocation:", v6, var0, var1);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v13, "setPlaceRequestParameters:", v14);
    -[GEOPDPlaceRequest setRequestType:](v13, "setRequestType:", 4);
    v15 = v13;

  }
  return v13;
}

- (GEOPDPlaceRequest)initWithReverseGeocodeCoordinate:(id)a3 floorOrdinal:(int)a4 includeEntryPoints:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  uint64_t v9;
  double var1;
  double var0;
  id v13;
  GEOPDPlaceRequest *v14;
  GEOPDPlaceRequest *v15;
  GEOPDPlaceRequestParameters *v16;
  GEOPDPlaceRequest *v17;

  v7 = a6;
  v8 = a5;
  v9 = *(_QWORD *)&a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v13 = a7;
  v14 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v13, 1, 0);
  v15 = v14;
  if (v14)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v14, "addRequestedComponentsForReason:traits:count:", !v8, v13, 1);
    v16 = -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:]([GEOPDPlaceRequestParameters alloc], "initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:", v7, v9, var0, var1);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v15, "setPlaceRequestParameters:", v16);
    -[GEOPDPlaceRequest setRequestType:](v15, "setRequestType:", 4);
    v17 = v15;

  }
  return v15;
}

- (GEOPDPlaceRequest)initWithBatchReverseGeocodeLocations:(id)a3 additionalPlaceTypes:(int *)a4 additionalPlaceTypesCount:(unint64_t)a5 traits:(id)a6
{
  id v10;
  id v11;
  GEOPDPlaceRequest *v12;
  GEOPDPlaceRequest *v13;
  GEOPDPlaceRequestParameters *v14;
  GEOPDPlaceRequest *v15;

  v10 = a3;
  v11 = a6;
  v12 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v11, 1, &unk_1E1E85990);
  v13 = v12;
  if (v12)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v12, "addRequestedComponentsForReason:traits:count:", 20, v11, 1);
    v14 = -[GEOPDPlaceRequestParameters initWithBatchReverseGeocodeLocations:additionalPlaceTypes:additionalPlaceTypesCount:traits:]([GEOPDPlaceRequestParameters alloc], "initWithBatchReverseGeocodeLocations:additionalPlaceTypes:additionalPlaceTypesCount:traits:", v10, a4, a5, v11);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v13, "setPlaceRequestParameters:", v14);
    -[GEOPDPlaceRequest setRequestType:](v13, "setRequestType:", 26);
    v15 = v13;

  }
  return v13;
}

- (GEOPDPlaceRequest)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  GEOPDPlaceRequest *v11;
  GEOPDPlaceRequestParameters *v12;
  GEOPDPlaceRequest *v13;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v9, 1, 0);
  v11 = v10;
  if (v10)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v10, "addRequestedComponentsForReason:traits:count:", 0, v9, v6);
    v12 = -[GEOPDPlaceRequestParameters initWithForwardGeocodeAddressString:maxResults:traits:]([GEOPDPlaceRequestParameters alloc], "initWithForwardGeocodeAddressString:maxResults:traits:", v8, v6, v9);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v11, "setPlaceRequestParameters:", v12);
    -[GEOPDPlaceRequest setRequestType:](v11, "setRequestType:", 2);
    v13 = v11;

  }
  return v11;
}

- (GEOPDPlaceRequest)initWithInitialRequestData:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  void *v10;
  GEOPDPlaceRequest *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v8, "addRequestedComponentsForReason:traits:count:", 0, v7, 1);
    objc_msgSend(v6, "placeRequestParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v10);

    -[GEOPDPlaceRequest setRequestType:](v9, "setRequestType:", objc_msgSend(v6, "requestType"));
    v11 = v9;
  }

  return v9;
}

- (GEOPDPlaceRequest)initWithPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  GEOPDPlaceRequestParameters *v10;
  GEOPDPlaceRequest *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 1, 0);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v8, "addRequestedComponentsForReason:traits:count:", 0, v7, 1);
    v10 = -[GEOPDPlaceRequestParameters initWithPlaceRefinementParameters:traits:]([GEOPDPlaceRequestParameters alloc], "initWithPlaceRefinementParameters:traits:", v6, v7);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v10);
    -[GEOPDPlaceRequest setRequestType:](v9, "setRequestType:", 7);
    v11 = v9;

  }
  return v9;
}

- (GEOPDPlaceRequest)initWithVendorSpecificPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  GEOPDPlaceRequestParameters *v10;
  GEOPDPlaceRequest *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 1, 0);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v8, "addRequestedComponentsForReason:traits:count:", 0, v7, 1);
    v10 = -[GEOPDPlaceRequestParameters initWithVendorSpecificPlaceRefinementParameters:traits:]([GEOPDPlaceRequestParameters alloc], "initWithVendorSpecificPlaceRefinementParameters:traits:", v6, v7);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v10);
    -[GEOPDPlaceRequest setRequestType:](v9, "setRequestType:", 17);
    v11 = v9;

  }
  return v9;
}

- (GEOPDPlaceRequest)initWithBrandMUID:(unint64_t)a3 traits:(id)a4
{
  id v6;
  GEOPDPlaceRequest *v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequestParameters *v9;
  GEOPDPlaceRequest *v10;

  v6 = a4;
  v7 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v6, 1, 0);
  v8 = v7;
  if (v7)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v7, "addRequestedComponentsForReason:traits:count:", 0, v6, 1);
    v9 = -[GEOPDPlaceRequestParameters initWithBrandMUID:traits:]([GEOPDPlaceRequestParameters alloc], "initWithBrandMUID:traits:", a3, v6);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v8, "setPlaceRequestParameters:", v9);
    -[GEOPDPlaceRequest setRequestType:](v8, "setRequestType:", 1);
    v10 = v8;

  }
  return v8;
}

- (id)_initWithTransitScheduleRequestForStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  GEOPDPlaceRequestParameters *v16;
  GEOPBTransitScheduleLookupParameters *v17;
  id v18;

  v9 = a6;
  v14 = a7;
  v15 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", a8, 1, 0);
  if (v15)
  {
    v16 = objc_alloc_init(GEOPDPlaceRequestParameters);
    v17 = objc_alloc_init(GEOPBTransitScheduleLookupParameters);
    -[GEOPDPlaceRequestParameters setTransitScheduleLookupParameter:]((uint64_t)v16, v17);
    -[GEOPBTransitScheduleLookupParameters setLineId:](v17, "setLineId:", a4);
    -[GEOPBTransitScheduleLookupParameters setReferenceTripId:](v17, "setReferenceTripId:", a5);
    -[GEOPBTransitScheduleLookupParameters setTransitId:](v17, "setTransitId:", a3);
    -[GEOPBTransitScheduleLookupParameters setRoutingParameters:](v17, "setRoutingParameters:", v14);
    -[GEOPBTransitScheduleLookupParameters setIncludeAllHeadsigns:](v17, "setIncludeAllHeadsigns:", 1);
    -[GEOPBTransitScheduleLookupParameters setIncludeAllDirectionNames:](v17, "setIncludeAllDirectionNames:", v9);
    objc_msgSend(v15, "setPlaceRequestParameters:", v16);
    objc_msgSend(v15, "setRequestType:", 39);
    v18 = v15;

  }
  return v15;
}

- (GEOPDPlaceRequest)initWithTransitScheduleAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  GEOPDPlaceRequest *v15;
  GEOPDPlaceRequest *v16;
  GEOPDPlaceRequest *v17;

  v9 = a6;
  v14 = a8;
  v15 = -[GEOPDPlaceRequest _initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:](self, "_initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, a7, v14);
  v16 = v15;
  if (v15)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v15, "addRequestedComponentsForReason:traits:count:", 4, v14, 1);
    v17 = v16;
  }

  return v16;
}

- (GEOPDPlaceRequest)initWithUpdatedTransitScheduleDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  GEOPDPlaceRequest *v15;
  GEOPDPlaceRequest *v16;

  v9 = a6;
  v14 = a8;
  v15 = -[GEOPDPlaceRequest _initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:](self, "_initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, a7, v14);
  v16 = v15;
  if (v15)
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v15, "addRequestedComponentsForReason:traits:count:", 5, v14, 1);

  return v16;
}

- (GEOPDPlaceRequest)initWithTransitTripDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  GEOPDPlaceRequest *v15;
  GEOPDPlaceRequest *v16;

  v9 = a6;
  v14 = a8;
  v15 = -[GEOPDPlaceRequest _initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:](self, "_initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, a7, v14);
  v16 = v15;
  if (v15)
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v15, "addRequestedComponentsForReason:traits:count:", 6, v14, 1);

  return v16;
}

- (GEOPDPlaceRequest)initWithTransitDeparturesAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  _BOOL8 v9;
  id v14;
  GEOPDPlaceRequest *v15;
  GEOPDPlaceRequest *v16;

  v9 = a6;
  v14 = a8;
  v15 = -[GEOPDPlaceRequest _initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:](self, "_initWithTransitScheduleRequestForStation:line:referenceTripId:includeAllDirectionNames:routingParameters:traits:", a3, a4, a5, v9, a7, v14);
  v16 = v15;
  if (v15)
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v15, "addRequestedComponentsForReason:traits:count:", 7, v14, 1);

  return v16;
}

- (GEOPDPlaceRequest)initWithNearbyTransitDeparturesWithLookupOrigin:(id)a3 userLocation:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOPDPlaceRequest *v11;
  GEOPDPlaceRequest *v12;
  GEOPDPlaceRequestParameters *v13;
  GEOWaypointLocation *v14;
  GEOWaypointTyped *v15;
  GEOPDTransitNearbyScheduleLookupOrigin *v16;
  GEOPDTransitNearbyScheduleLookupParameters *v17;
  GEOWaypointLocation *v18;
  GEOWaypointTyped *v19;
  GEOPDPlaceRequest *v20;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 1, 0);
  v12 = v11;
  if (v11)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v11, "addRequestedComponentsForReason:traits:count:", 21, v10, 1);
    v13 = objc_alloc_init(GEOPDPlaceRequestParameters);
    v14 = objc_alloc_init(GEOWaypointLocation);
    v22 = v8;
    -[GEOWaypointLocation setLocation:](v14, "setLocation:", v8);
    v15 = objc_alloc_init(GEOWaypointTyped);
    -[GEOWaypointTyped setWaypointLocation:](v15, "setWaypointLocation:", v14);
    -[GEOWaypointTyped setWaypointType:](v15, "setWaypointType:", 4);
    v16 = objc_alloc_init(GEOPDTransitNearbyScheduleLookupOrigin);
    -[GEOPDTransitNearbyScheduleLookupOrigin setWaypointTyped:]((uint64_t)v16, v15);
    v17 = objc_alloc_init(GEOPDTransitNearbyScheduleLookupParameters);
    -[GEOPDTransitNearbyScheduleLookupParameters addTransitNearbyScheduleLookupOrigin:]((uint64_t)v17, v16);
    if (v9)
    {
      v18 = objc_alloc_init(GEOWaypointLocation);
      -[GEOWaypointLocation setLocation:](v18, "setLocation:", v9);
      v19 = objc_alloc_init(GEOWaypointTyped);
      -[GEOWaypointTyped setWaypointLocation:](v19, "setWaypointLocation:", v18);
      -[GEOWaypointTyped setWaypointType:](v19, "setWaypointType:", 4);
      -[GEOPDTransitNearbyScheduleLookupParameters setUserLocation:]((uint64_t)v17, v19);

    }
    -[GEOPDPlaceRequestParameters setTransitNearbyScheduleLookupParameters:]((uint64_t)v13, v17);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v12, "setPlaceRequestParameters:", v13);
    -[GEOPDPlaceRequest setRequestType:](v12, "setRequestType:", 50);
    v20 = v12;

    v8 = v22;
  }

  return v12;
}

- (id)initForNearbyTransitPaymentLookupAtLocations:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  GEOPDTransitNearbyPaymentMethodLookupParameters *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOWaypointLocation *v16;
  GEOWaypointTyped *v17;
  GEOPDTransitNearbyPaymentMethodLookupOrigin *v18;
  id v19;
  GEOPDPlaceRequestParameters *v21;
  void *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 1, 0);
  v9 = v8;
  if (v8)
  {
    v22 = v8;
    objc_msgSend(v8, "addRequestedComponentsForReason:traits:count:", 26, v7, 1);
    v21 = objc_alloc_init(GEOPDPlaceRequestParameters);
    v10 = objc_alloc_init(GEOPDTransitNearbyPaymentMethodLookupParameters);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v6;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v16 = objc_alloc_init(GEOWaypointLocation);
          -[GEOWaypointLocation setLocation:](v16, "setLocation:", v15);
          v17 = objc_alloc_init(GEOWaypointTyped);
          -[GEOWaypointTyped setWaypointLocation:](v17, "setWaypointLocation:", v16);
          -[GEOWaypointTyped setWaypointType:](v17, "setWaypointType:", 4);
          v18 = objc_alloc_init(GEOPDTransitNearbyPaymentMethodLookupOrigin);
          -[GEOPDTransitNearbyPaymentMethodLookupOrigin setWaypointTyped:]((uint64_t)v18, v17);
          -[GEOPDTransitNearbyPaymentMethodLookupParameters addTransitNearbyPaymentMethodLookupOrigin:]((uint64_t)v10, v18);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    -[GEOPDPlaceRequestParameters setTransitNearbyPaymentMethodLookupParameters:]((uint64_t)v21, v10);
    v9 = v22;
    objc_msgSend(v22, "setPlaceRequestParameters:", v21);
    objc_msgSend(v22, "setRequestType:", 57);
    v19 = v22;

    v6 = v23;
  }

  return v9;
}

- (GEOPDPlaceRequest)initWithTripIds:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  GEOPDTransitVehiclePositionParameters *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOPDPlaceRequestParameters *v16;
  GEOPDPlaceRequest *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 1, 0);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v8, "addRequestedComponentsForReason:traits:count:", 0, v7, 1);
    v10 = objc_alloc_init(GEOPDTransitVehiclePositionParameters);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "unsignedLongLongValue", (_QWORD)v19);
          if (v10)
            PBRepeatedUInt64Add();
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    v16 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setTransitVehiclePositionParameters:]((uint64_t)v16, v10);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v16);
    -[GEOPDPlaceRequest setRequestType:](v9, "setRequestType:", 37);
    v17 = v9;

  }
  return v9;
}

- (GEOPDPlaceRequest)initWithCanonicalLocationSearchQueryString:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  GEOPDPlaceRequestParameters *v10;
  GEOPDPlaceRequest *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 1, 0);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v8, "addRequestedComponentsForReason:traits:count:", 0, v7, 1);
    v10 = -[GEOPDPlaceRequestParameters initWithCanonicalLocationSearchQueryString:]([GEOPDPlaceRequestParameters alloc], "initWithCanonicalLocationSearchQueryString:", v6);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v10);
    -[GEOPDPlaceRequest setRequestType:](v9, "setRequestType:", 3);
    v11 = v9;

  }
  return v9;
}

- (GEOPDPlaceRequest)initWithGeoMapItemIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  GEOPDPlaceRequest *v16;
  GEOPDPlaceRequestParameters *v17;
  GEOPDSearchParameters *v18;

  v8 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v13, 0, MEMORY[0x1E0C9AA60]);
  -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v16, "addRequestedComponentsForReason:traits:count:", 0, v13, v8);
  v17 = objc_alloc_init(GEOPDPlaceRequestParameters);
  v18 = -[GEOPDSearchParameters initWithGeoMapItemIdentifier:categoryID:maxResults:traits:searchSessionData:]([GEOPDSearchParameters alloc], "initWithGeoMapItemIdentifier:categoryID:maxResults:traits:searchSessionData:", v15, v14, v8, v13, v12);

  -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v17, v18);
  -[GEOPDPlaceRequest setPlaceRequestParameters:](v16, "setPlaceRequestParameters:", v17);
  -[GEOPDPlaceRequest setRequestType:](v16, "setRequestType:", 1);

  return v16;
}

- (GEOPDPlaceRequest)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 filters:(id)a9 suppressResultsRequiringAttribution:(BOOL)a10 traits:(id)a11 routeInfo:(id)a12 error:(id *)a13 searchSessionData:(id)a14
{
  uint64_t v14;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  GEOPDPlaceRequestParameters *v31;
  void *v32;
  GEOPDPlaceRequest *v33;
  id v35;
  id v36;
  id v37;

  v14 = *(_QWORD *)&a8;
  v37 = a3;
  v20 = a4;
  v36 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a9;
  v24 = a11;
  v25 = a12;
  v26 = a14;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v27, "addObject:", &unk_1E1E81EE0);
  if (!objc_msgSend(v24, "searchOriginationType"))
  {
    objc_msgSend(v27, "addObject:", &unk_1E1E81E98);
    objc_msgSend(v27, "addObject:", &unk_1E1E81EB0);
  }
  v28 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v24, 1, v27);
  v29 = v28;
  if (v28)
  {
    if (v21)
      v30 = 3;
    else
      v30 = 0;
    objc_msgSend(v28, "addRequestedComponentsForReason:traits:count:", v30, v24, v14);
    v35 = v22;
    v31 = -[GEOPDPlaceRequestParameters initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:traits:routeInfo:error:searchSessionData:]([GEOPDPlaceRequestParameters alloc], "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:filters:traits:routeInfo:error:searchSessionData:", v37, v20, v36, v21, v22, v14, v23, v24, v25, a13, v26);
    if (v31)
    {
      objc_msgSend(v29, "setPlaceRequestParameters:", v31);
      if (a10)
        objc_msgSend(v29, "setSuppressResultsRequiringAttribution:", 1);
      if (objc_msgSend(v24, "optimizeSearchRequestComponents"))
      {
        objc_msgSend((id)objc_opt_class(), "createRequestedComponentsForReason:traits:count:", 31, v24, v14);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addPartiallyComposedSearchResultRequestedComponents:", v32);

      }
      objc_msgSend(v29, "setRequestType:", 1);
      v33 = v29;
    }
    else
    {
      v33 = 0;
    }

    v22 = v35;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (GEOPDPlaceRequest)initWithSearchURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8
{
  uint64_t v9;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  GEOPDPlaceRequest *v18;
  GEOPDPlaceRequest *v19;
  GEOPDPlaceRequestParameters *v20;
  double v21;
  double v22;
  GEOPDPlaceRequestParameters *v23;
  uint64_t v24;
  GEOPDPlaceRequest *v25;

  v9 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v17, 1, 0);
  v19 = v18;
  if (v18)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v18, "addRequestedComponentsForReason:traits:count:", 0, v17, v9);
    if (v16 && objc_msgSend(v16, "length"))
    {
      v20 = [GEOPDPlaceRequestParameters alloc];
      objc_msgSend(v15, "coordinate");
      v23 = -[GEOPDPlaceRequestParameters initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:](v20, "initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:", v14, objc_msgSend(v15, "muid"), v11, v16, v21, v22);
      v24 = 17;
    }
    else
    {
      v23 = -[GEOPDPlaceRequestParameters initWithSearchURLQuery:identifier:]([GEOPDPlaceRequestParameters alloc], "initWithSearchURLQuery:identifier:", v14, v15);
      v24 = 7;
    }
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v19, "setPlaceRequestParameters:", v23);
    -[GEOPDPlaceRequest setRequestType:](v19, "setRequestType:", v24);
    v25 = v19;

  }
  return v19;
}

- (GEOPDPlaceRequest)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7;
  double var1;
  double var0;
  id v11;
  id v12;
  GEOPDPlaceRequest *v13;
  GEOPDPlaceRequest *v14;
  GEOPDPlaceRequestParameters *v15;
  GEOPDPlaceRequest *v16;

  v7 = *(_QWORD *)&a5;
  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a3;
  v12 = a6;
  v13 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v12, 1, 0);
  v14 = v13;
  if (v13)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v13, "addRequestedComponentsForReason:traits:count:", 0, v12, v7);
    v15 = -[GEOPDPlaceRequestParameters initWithSearchURLQuery:coordinate:maxResults:traits:]([GEOPDPlaceRequestParameters alloc], "initWithSearchURLQuery:coordinate:maxResults:traits:", v11, v7, v12, var0, var1);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v14, "setPlaceRequestParameters:", v15);
    -[GEOPDPlaceRequest setRequestType:](v14, "setRequestType:", 9);
    v16 = v14;

  }
  return v14;
}

- (GEOPDPlaceRequest)initWithAutocompleteFragment:(id)a3 type:(int)a4 traits:(id)a5 filters:(id)a6 retainedSearch:(id)a7 tappedQuerySuggestion:(id)a8 sessionData:(id)a9 error:(id *)a10
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  GEOPDAutocompleteParameters *v24;
  void *v25;
  GEOPDAutocompleteParametersFullEntriesOnly *v26;
  void *v27;
  void *v28;
  GEOPDPlaceRequest *v29;
  void *v30;
  void *v31;
  void *v32;
  GEOPDAutocompleteOriginationInfo *v33;
  unsigned int v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  GEOPDAutocompleteOriginationRoutePlanningParameters *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  unsigned int v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  GEOPDSSearchEvChargingParameters *v58;
  void *v59;
  id v60;
  GEOPDPlaceRequestParameters *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v14 = *(_QWORD *)&a4;
  v76 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = -[GEOPDPlaceRequest initForAutocompleteWithTraits:count:](self, "initForAutocompleteWithTraits:count:", v17, 0x7FFFFFFFLL);
  v23 = v22;
  if (v22)
  {
    v70 = v20;
    objc_msgSend(v22, "setRequestType:", 10);
    v24 = objc_alloc_init(GEOPDAutocompleteParameters);
    -[GEOPDAutocompleteParameters setRequestType:](v24, "setRequestType:", v14);
    if (v21)
    {
      -[GEOPDAutocompleteParameters setSupportAutocompleteSessionData:](v24, "setSupportAutocompleteSessionData:", 1);
      objc_msgSend(v21, "autocompleteSessionData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAutocompleteParameters setAutocompleteSessionData:](v24, "setAutocompleteSessionData:", v25);

    }
    v68 = v21;
    v69 = v19;
    switch((int)v14)
    {
      case 0:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersFullEntriesOnly);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v27);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        -[GEOPDAutocompleteParameters setFullEntries:](v24, "setFullEntries:", v26);
        goto LABEL_53;
      case 1:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersAllEntries);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v30);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        -[GEOPDAutocompleteParameters setAllEntries:](v24, "setAllEntries:", v26);
        goto LABEL_53;
      case 2:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersLocalitiesAndLandmarks);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v31);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        -[GEOPDAutocompleteParameters setLocalitiesAndLandmarks:](v24, "setLocalitiesAndLandmarks:", v26);
        goto LABEL_53;
      case 3:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersAllEntriesWithBrowse);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v32);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        v33 = objc_alloc_init(GEOPDAutocompleteOriginationInfo);
        v34 = objc_msgSend(v17, "devicePlatform") - 1;
        v35 = v18;
        if (v34 > 3)
          v36 = 0;
        else
          v36 = dword_189CE3CF0[v34];
        -[GEOPDAutocompleteOriginationInfo setClientSoftwarePlatform:](v33, "setClientSoftwarePlatform:", v36);
        -[GEOPDAutocompleteOriginationInfo setAutocompleteOriginationType:](v33, "setAutocompleteOriginationType:", objc_msgSend(v23, "autocompleteOriginationTypeFromTraits:", v17));
        if (-[GEOPDAutocompleteOriginationInfo autocompleteOriginationType](v33, "autocompleteOriginationType") == 1)
        {
          v41 = objc_alloc_init(GEOPDAutocompleteOriginationRoutePlanningParameters);
          objc_msgSend(v17, "autocompleteOriginationPreviousLatlng");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPDAutocompleteOriginationRoutePlanningParameters setPreviousLocation:](v41, "setPreviousLocation:", v42);

          -[GEOPDAutocompleteOriginationRoutePlanningParameters setIsEditServerRecommendedStop:](v41, "setIsEditServerRecommendedStop:", objc_msgSend(v17, "autocompleteOriginationEditingServerWaypoints"));
          -[GEOPDAutocompleteOriginationRoutePlanningParameters setIsRoutePlanningEditStopFillRequest:](v41, "setIsRoutePlanningEditStopFillRequest:", objc_msgSend(v17, "isRoutePlanningEditStopFillRequest"));
          -[GEOPDAutocompleteOriginationInfo setRoutePlanningParameters:](v33, "setRoutePlanningParameters:", v41);

        }
        -[GEOPDAutocompleteParametersFullEntriesOnly setAutocompleteOriginationInfo:](v26, "setAutocompleteOriginationInfo:", v33);
        v43 = objc_msgSend(v17, "navigating");
        if (v69)
          -[GEOPDAutocompleteParametersFullEntriesOnly setRetainedSearch:](v26, "setRetainedSearch:");
        -[GEOPDAutocompleteParametersFullEntriesOnly setInterleaveCategorySuggestions:](v26, "setInterleaveCategorySuggestions:", 1);
        objc_msgSend(v17, "venueIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setVenueIdentifier:](v26, "setVenueIdentifier:", v44);

        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportDirectionIntentSuggestions:](v26, "setSupportDirectionIntentSuggestions:", objc_msgSend(v17, "supportDirectionIntentAutocomplete") & (v43 ^ 1));
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportUnresolvedDirectionIntent:](v26, "setSupportUnresolvedDirectionIntent:", objc_msgSend(v17, "supportUnresolvedDirectionIntent") & (v43 ^ 1));
        if (objc_msgSend(v70, "conformsToProtocol:", &unk_1EDF8EAC8))
        {
          objc_msgSend(v70, "_placeDataAutocompleteEntry");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPDAutocompleteParametersFullEntriesOnly setQuerySuggestionEntry:](v26, "setQuerySuggestionEntry:", v45);

        }
        if (objc_msgSend(v17, "supportedAutocompleteListTypesCount"))
        {
          v46 = 0;
          do
          {
            v47 = objc_msgSend(v17, "supportedAutocompleteListTypeAtIndex:", v46);
            if (v47 <= 2)
              -[GEOPDAutocompleteParametersFullEntriesOnly addSupportedListType:](v26, "addSupportedListType:", v47);
            ++v46;
          }
          while (v46 < objc_msgSend(v17, "supportedAutocompleteListTypesCount"));
        }
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportClientRankingFeatureMetadata:](v26, "setSupportClientRankingFeatureMetadata:", objc_msgSend(v17, "supportClientRankingFeatureMetadata"));
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportSectionHeader:](v26, "setSupportSectionHeader:", objc_msgSend(v17, "autocompleteRequestSupportsSectionHeader"));
        if (objc_msgSend(v17, "supportedAutocompleteResultCellTypesCount"))
        {
          v48 = 0;
          do
          {
            v49 = objc_msgSend(v17, "supportedAutocompleteResultCellTypeAtIndex:", v48);
            switch((int)v49)
            {
              case 0:
              case 3:
                goto LABEL_31;
              case 1:
              case 2:
              case 4:
                if ((v43 & 1) == 0)
LABEL_31:
                  -[GEOPDAutocompleteParametersFullEntriesOnly addSupportedAutocompleteResultCellType:](v26, "addSupportedAutocompleteResultCellType:", v49);
                break;
              default:
                break;
            }
            ++v48;
          }
          while (v48 < objc_msgSend(v17, "supportedAutocompleteResultCellTypesCount", v49));
        }
        -[GEOPDAutocompleteParametersFullEntriesOnly setPlaceSummaryRevision:](v26, "setPlaceSummaryRevision:", objc_msgSend(v17, "placeSummaryRevision"));
        if ((v43 & 1) == 0 && objc_msgSend(v17, "knownRefinementTypesCount"))
        {
          v50 = 0;
          do
          {
            v51 = objc_msgSend(v17, "knownRefinementTypeAtIndex:", v50) - 1;
            if (v51 > 4)
              v52 = 0;
            else
              v52 = dword_189CE3CD0[v51];
            -[GEOPDAutocompleteParametersFullEntriesOnly addKnownRefinementType:](v26, "addKnownRefinementType:", v52);
            ++v50;
          }
          while (v50 < objc_msgSend(v17, "knownRefinementTypesCount"));
        }
        if (objc_msgSend(v17, "supportedPlaceSummaryFormatTypesCount"))
        {
          v53 = 0;
          do
          {
            v54 = objc_msgSend(v17, "supportedPlaceSummaryFormatTypeAtIndex:", v53);
            if (v54 - 1 >= 4)
              v55 = 0;
            else
              v55 = v54;
            -[GEOPDAutocompleteParametersFullEntriesOnly addSupportedPlaceSummaryFormatType:](v26, "addSupportedPlaceSummaryFormatType:", v55);
            ++v53;
          }
          while (v53 < objc_msgSend(v17, "supportedPlaceSummaryFormatTypesCount"));
        }
        -[GEOPDAutocompleteParametersFullEntriesOnly addSupportedHighlightType:](v26, "addSupportedHighlightType:", 0);
        -[GEOPDAutocompleteParametersFullEntriesOnly addSupportedHighlightType:](v26, "addSupportedHighlightType:", 1);
        -[GEOPDAutocompleteParametersFullEntriesOnly addSupportedHighlightType:](v26, "addSupportedHighlightType:", 2);
        objc_msgSend(v17, "evChargingPorts");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v56, "count"))
        {

        }
        else
        {
          v57 = objc_msgSend(v17, "preferredBrandsCount");

          if (!v57)
            goto LABEL_52;
        }
        v58 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
        objc_msgSend(v17, "evChargingPorts");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v58, v59);

        if (objc_msgSend(v17, "preferredBrandsCount"))
        {
          objc_msgSend(v17, "preferredBrands");
          objc_msgSend(v17, "preferredBrandsCount");
          -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v58);
        }
        -[GEOPDAutocompleteParametersFullEntriesOnly setEvChargingParameters:](v26, "setEvChargingParameters:", v58);

LABEL_52:
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportClientRankingCompositeFeatures:](v26, "setSupportClientRankingCompositeFeatures:", objc_msgSend(v17, "supportClientRankingCompositeFeatures"));
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportStructuredRapAffordance:](v26, "setSupportStructuredRapAffordance:", objc_msgSend(v17, "supportStructuredRapAffordance"));
        -[GEOPDAutocompleteParameters setAllEntriesWithBrowse:](v24, "setAllEntriesWithBrowse:", v26);
        -[GEOPDAutocompleteParameters setShouldPopulateMapsIdentifier:](v24, "setShouldPopulateMapsIdentifier:", 1);

        v18 = v35;
LABEL_53:

LABEL_54:
        v60 = v16;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v28 = v18;
        v61 = (GEOPDPlaceRequestParameters *)v18;
        v62 = -[GEOPDPlaceRequestParameters countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
        if (!v62)
          goto LABEL_62;
        v63 = v62;
        v64 = *(_QWORD *)v72;
        break;
      case 5:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersAddressOnly);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v37);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        -[GEOPDAutocompleteParameters setAddressOnly:](v24, "setAddressOnly:", v26);
        goto LABEL_53;
      case 7:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersBrandProfileSearch);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v38);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        -[GEOPDAutocompleteParameters setBrandProfileSearch:](v24, "setBrandProfileSearch:", v26);
        goto LABEL_53;
      case 8:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersOfflineRegionSearch);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v39);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        -[GEOPDAutocompleteParameters setOfflineRegionSearch:](v24, "setOfflineRegionSearch:", v26);
        goto LABEL_53;
      case 9:
        v26 = objc_alloc_init(GEOPDAutocompleteParametersPoiAddressOnly);
        +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v17);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAutocompleteParametersFullEntriesOnly setViewportInfo:](v26, "setViewportInfo:", v40);

        -[GEOPDAutocompleteParametersFullEntriesOnly setQuery:](v26, "setQuery:", v16);
        -[GEOPDAutocompleteParameters setPoiAddressOnly:](v24, "setPoiAddressOnly:", v26);
        goto LABEL_53;
      default:
        goto LABEL_54;
    }
    while (2)
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v72 != v64)
          objc_enumerationMutation(v61);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "applyToAutocompleteParameters:error:", v24, a10))
        {
          v29 = 0;
          v16 = v60;
          v21 = v68;
          goto LABEL_66;
        }
      }
      v63 = -[GEOPDPlaceRequestParameters countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      if (v63)
        continue;
      break;
    }
LABEL_62:

    v21 = v68;
    if (v68)
    {
      -[GEOPDAutocompleteParameters setSupportAutocompleteSessionData:](v24, "setSupportAutocompleteSessionData:", 1);
      objc_msgSend(v68, "autocompleteSessionData");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAutocompleteParameters setAutocompleteSessionData:](v24, "setAutocompleteSessionData:", v66);

    }
    v61 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setAutocompleteParameters:]((uint64_t)v61, v24);
    objc_msgSend(v23, "setPlaceRequestParameters:", v61);
    v29 = v23;
    v16 = v60;
LABEL_66:

    v19 = v69;
    v20 = v70;
  }
  else
  {
    v28 = v18;
    v29 = 0;
  }

  return v29;
}

- (int)autocompleteOriginationTypeFromTraits:(id)a3
{
  id v3;
  int v4;
  int v5;
  uint8_t v7[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "autocompleteOriginationType");
  v5 = v4;
  if (v4 != 3)
  {
    if (v4 == 2)
    {
      if ((objc_msgSend(v3, "navigating") & 1) != 0)
      {
        v5 = 2;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v7 = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: 0", v7, 2u);
        }
        v5 = 0;
      }
    }
    else
    {
      v5 = v4 == 1;
    }
  }

  return v5;
}

+ (id)comingledPhotoLookupRequestWithCategoryIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  id *v22;
  void *v23;
  GEOPDPlaceLookupParameters *v24;
  void *v25;
  GEOPDPlaceLookupParameters *v26;
  GEOPDPlaceRequestParameters *v27;
  void *v28;
  GEOPDPlaceRequestParameters *v29;
  int location;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  length = a5.length;
  location = a5.location;
  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v9 = a4;
  v10 = a6;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:]([GEOPDPlaceRequest alloc], "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 0, 0);
  objc_msgSend(v11, "setRequestType:", 5);
  objc_msgSend(v11, "addRequestedComponentsForReason:traits:count:", 25, v10, length);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v11, "requestedComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v17 && (*(_BYTE *)(v17 + 44) & 4) != 0 && *(_DWORD *)(v17 + 32) == 84)
        {
          -[GEOPDComponentInfo filter](*(id **)(*((_QWORD *)&v33 + 1) + 8 * i));
          v18 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDComponentFilter categorizedPhotosFilter](v18);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            *(_BYTE *)(v19 + 80) |= 0x80u;
            *(_BYTE *)(v19 + 80) |= 2u;
            *(_DWORD *)(v19 + 72) = location;
          }

          -[GEOPDComponentInfo filter]((id *)v17);
          v20 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDComponentFilter categorizedPhotosFilter](v20);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            *(_BYTE *)(v21 + 80) |= 0x80u;
            *(_BYTE *)(v21 + 80) |= 1u;
            *(_DWORD *)(v21 + 68) = length;
          }

          -[GEOPDComponentInfo filter]((id *)v17);
          v22 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDComponentFilter categorizedPhotosFilter](v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPDCategorizedPhotosFilter setCategoryId:]((uint64_t)v23, v32);

          goto LABEL_17;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_17:

  v24 = [GEOPDPlaceLookupParameters alloc];
  v38 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[GEOPDPlaceLookupParameters initWithIdentifiers:resultProviderID:](v24, "initWithIdentifiers:resultProviderID:", v25, objc_msgSend(v9, "resultProviderID"));

  v27 = [GEOPDPlaceRequestParameters alloc];
  v37 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:](v27, "initWithIdentifiers:resultProviderID:", v28, objc_msgSend(v9, "resultProviderID"));

  -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)v29, v26);
  objc_msgSend(v11, "setPlaceRequestParameters:", v29);

  return v11;
}

+ (id)photoLookupRequestWithVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length;
  int location;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id *v19;
  void *v20;
  GEOPDPlaceLookupParameters *v21;
  void *v22;
  GEOPDPlaceLookupParameters *v23;
  GEOPDPlaceRequestParameters *v24;
  void *v25;
  GEOPDPlaceRequestParameters *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  length = a5.length;
  location = a5.location;
  v36 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v10 = a4;
  v11 = a6;
  v12 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:]([GEOPDPlaceRequest alloc], "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v11, 0, 0);
  objc_msgSend(v12, "setRequestType:", 5);
  objc_msgSend(v12, "addRequestedComponentsForReason:traits:count:", 12, v11, length);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v12, "requestedComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (v18 && (*(_BYTE *)(v18 + 44) & 4) != 0 && *(_DWORD *)(v18 + 32) == 26)
        {
          *(_BYTE *)(v18 + 44) |= 2u;
          *(_DWORD *)(v18 + 28) = location;
          -[GEOPDComponentInfo filter]((id *)v18);
          v19 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDComponentFilter captionedPhotoFilter](v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOPDCaptionedPhotoFilter setVendorId:]((uint64_t)v20, v28);

          goto LABEL_13;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_13:

  v21 = [GEOPDPlaceLookupParameters alloc];
  v34 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[GEOPDPlaceLookupParameters initWithIdentifiers:resultProviderID:](v21, "initWithIdentifiers:resultProviderID:", v22, objc_msgSend(v10, "resultProviderID"));

  v24 = [GEOPDPlaceRequestParameters alloc];
  v33 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:](v24, "initWithIdentifiers:resultProviderID:", v25, objc_msgSend(v10, "resultProviderID"));

  -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)v26, v23);
  objc_msgSend(v12, "setPlaceRequestParameters:", v26);

  return v12;
}

- (id)initForCategoryListWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  GEOPDPlaceRequestParameters *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  v7 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v6, 1, 0);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addRequestedComponentsForReason:traits:count:", 1, v6, 0);
    objc_msgSend(v8, "setRequestType:", 11);
    v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    objc_msgSend(v8, "browseCategorySuggestionparametersWithTraits:isFromNoQueryState:", v6, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters setBrowseCategorySuggestionParameters:]((uint64_t)v9, v10);

    objc_msgSend(v8, "setPlaceRequestParameters:", v9);
    v11 = v8;

  }
  return v8;
}

- (id)browseCategorySuggestionparametersWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4
{
  id v6;
  GEOPDSearchBrowseCategorySuggestionParameters *v7;
  void *v8;
  char v9;
  char v10;
  int v11;
  int v12;
  int v13;
  double v14;
  void *v15;
  uint64_t v16;
  GEOPDSSearchEvChargingParameters *v17;
  void *v18;
  GEOPDSearchOriginationInfo *v19;

  v6 = a3;
  v7 = objc_alloc_init(GEOPDSearchBrowseCategorySuggestionParameters);
  +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBrowseCategorySuggestionParameters setViewportInfo:]((uint64_t)v7, v8);

  v9 = objc_msgSend(v6, "hasCarHeadunitInteractionModel");
  if (v7)
  {
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 0x10u;
    v7->_isCarplayRequest = v9;
  }
  if (objc_msgSend(v6, "hasIsWidgetRequest"))
  {
    v10 = objc_msgSend(v6, "isWidgetRequest");
    if (v7)
    {
      *(_WORD *)&v7->_flags |= 0x8000u;
      *(_WORD *)&v7->_flags |= 0x80u;
      v7->_isWidgetRequest = v10;
    }
  }
  if (objc_msgSend(v6, "hasNavigationTransportType"))
    v11 = -[GEOPDPlaceRequest userPreferredTransportTypeFromTransportType:](self, "userPreferredTransportTypeFromTransportType:", objc_msgSend(v6, "navigationTransportType"));
  else
    v11 = -[GEOPDPlaceRequest geoUserPreferredTransportType](self, "geoUserPreferredTransportType");
  if (v7)
  {
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 4u;
    v7->_preferredTransportType = v11;
  }
  objc_msgSend(v6, "engineTypes");
  objc_msgSend(v6, "engineTypesCount");
  -[GEOPDSearchBrowseCategorySuggestionParameters setEngineTypes:count:]((uint64_t)v7);
  v12 = objc_msgSend(v6, "navigating");
  if (v7)
  {
    if (v12)
      v13 = 2;
    else
      v13 = 1;
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 8u;
    v7->_suggestionType = v13;
    -[GEOPDPlaceRequest localTimestamp](self, "localTimestamp");
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 1u;
    v7->_requestLocalTimestamp = v14;
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 2u;
    v7->_minimumNumberOfCategories = 4;
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 0x40u;
    v7->_isFromNoQueryState = a4;
  }
  else
  {
    -[GEOPDPlaceRequest localTimestamp](self, "localTimestamp");
  }
  objc_msgSend(v6, "evChargingPorts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {

  }
  else
  {
    v16 = objc_msgSend(v6, "preferredBrandsCount");

    if (!v16)
      goto LABEL_22;
  }
  v17 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
  objc_msgSend(v6, "evChargingPorts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v17, v18);

  if (objc_msgSend(v6, "preferredBrandsCount"))
  {
    objc_msgSend(v6, "preferredBrands");
    objc_msgSend(v6, "preferredBrandsCount");
    -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v17);
  }
  -[GEOPDSearchBrowseCategorySuggestionParameters setEvChargingParameters:]((uint64_t)v7, v17);

LABEL_22:
  v19 = -[GEOPDSearchOriginationInfo initWithTraits:]([GEOPDSearchOriginationInfo alloc], "initWithTraits:", v6);
  -[GEOPDSearchBrowseCategorySuggestionParameters setSearchOriginationInfo:]((uint64_t)v7, v19);

  return v7;
}

- (double)localTimestamp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 60, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 28, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (int)userPreferredTransportTypeFromTransportType:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return dword_189CE3CB4[a3];
}

- (id)initForDFRCategoryListWithTraits:(id)a3
{

  return 0;
}

- (GEOPDPlaceRequest)initWithCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5 searchSessionData:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  GEOPDPlaceRequest *v13;
  GEOPDPlaceRequest *v14;
  GEOPDCategorySearchParameters *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  GEOPDSSearchEvChargingParameters *v30;
  void *v31;
  unsigned int v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  GEOPDSearchOriginationInfo *v39;
  char v40;
  GEOPDPlaceRequestParameters *v41;
  void *v42;
  void *v43;
  void *v44;
  GEOPDPlaceRequest *v45;
  void *v47;
  void *v48;
  void *v49;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v11, 1, &unk_1E1E859A8);
  v14 = v13;
  if (!v13)
    goto LABEL_48;
  v49 = v12;
  -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v13, "addRequestedComponentsForReason:traits:count:", 0, v11, v8);
  -[GEOPDPlaceRequest setRequestType:](v14, "setRequestType:", 12);
  v15 = objc_alloc_init(GEOPDCategorySearchParameters);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "components:fromDate:", 60, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "dateFromComponents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v18;
  v20 = objc_msgSend(v18, "hour");
  v21 = objc_msgSend(v16, "ordinalityOfUnit:inUnit:forDate:", 512, 4096, v19);
  if (v15)
  {
    if (v20 >= 0)
      v22 = v20;
    else
      v22 = v20 + 1;
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 2u;
    v15->_blurredHourOfDay = v22 & 0xFFFFFFFE;
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 4u;
    v15->_dayOfWeek = v21 - 1;
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 8u;
    v15->_maxResults = v8;
  }
  objc_msgSend(v10, "_suggestionEntryMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:]((uint64_t)v15, v23);

  +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategorySearchParameters setViewportInfo:]((uint64_t)v15, v24);

  LODWORD(v24) = objc_msgSend(v11, "searchRequestType");
  v25 = objc_msgSend(v11, "navigating");
  v26 = 1;
  switch((int)v24)
  {
    case 0:
      break;
    case 1:
      if (v25)
        v26 = 4;
      else
        v26 = 2;
      break;
    case 2:
      v26 = 5;
      break;
    default:
      v26 = 0;
      break;
  }
  if (v15)
  {
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 0x20u;
    v15->_searchType = v26;
    +[GEOPDETAFilter etaFilterForTraits:](GEOPDETAFilter, "etaFilterForTraits:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setEtaFilter:]((uint64_t)v15, v27);

    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 0x40u;
    v15->_supportCategorySearchResultSection = 1;
  }
  else
  {
    +[GEOPDETAFilter etaFilterForTraits:](GEOPDETAFilter, "etaFilterForTraits:", v11);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setEtaFilter:](0, v47);

  }
  objc_msgSend(v11, "evChargingPorts");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
  {

LABEL_18:
    v30 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    objc_msgSend(v11, "evChargingPorts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v30, v31);

    if (objc_msgSend(v11, "preferredBrandsCount"))
    {
      objc_msgSend(v11, "preferredBrands");
      objc_msgSend(v11, "preferredBrandsCount");
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v30);
    }
    -[GEOPDCategorySearchParameters setEvChargingParameters:]((uint64_t)v15, v30);

    goto LABEL_21;
  }
  v29 = objc_msgSend(v11, "preferredBrandsCount");

  if (v29)
    goto LABEL_18;
LABEL_21:
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1EDF4B018))
  {
    if (objc_msgSend(v11, "hasAuxiliaryTierNumResults"))
    {
      v32 = objc_msgSend(v11, "auxiliaryTierNumResults");
      if (v15)
      {
        *(_DWORD *)&v15->_flags |= 0x10000000u;
        *(_DWORD *)&v15->_flags |= 1u;
        v15->_auxiliaryTierNumResults = v32;
      }
    }
    if (objc_msgSend(v11, "supportedSearchTierTypesCount"))
    {
      v33 = 0;
      do
      {
        objc_msgSend(v11, "supportedSearchTierTypeAtIndex:", v33);
        -[GEOPDCategorySearchParameters addSupportedSearchTierType:]((os_unfair_lock_s *)v15);
        ++v33;
      }
      while (v33 < objc_msgSend(v11, "supportedSearchTierTypesCount"));
    }
    v34 = objc_msgSend(v11, "placeSummaryRevision");
    if (v15)
    {
      *(_DWORD *)&v15->_flags |= 0x10000000u;
      *(_DWORD *)&v15->_flags |= 0x10u;
      v15->_placeSummaryRevision = v34;
    }
    if (objc_msgSend(v11, "knownRefinementTypesCount"))
    {
      v35 = 0;
      do
      {
        objc_msgSend(v11, "knownRefinementTypeAtIndex:", v35);
        -[GEOPDCategorySearchParameters addKnownRefinementType:]((os_unfair_lock_s *)v15);
        ++v35;
      }
      while (v35 < objc_msgSend(v11, "knownRefinementTypesCount"));
    }
    objc_msgSend(v11, "resultRefinementQuery");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setResultRefinementQuery:]((uint64_t)v15, v36);

    objc_msgSend(v11, "previousSearchViewport");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setPreviousSearchViewport:]((uint64_t)v15, v37);

    if (objc_msgSend(v11, "supportedPlaceSummaryFormatTypesCount"))
    {
      v38 = 0;
      do
      {
        objc_msgSend(v11, "supportedPlaceSummaryFormatTypeAtIndex:", v38);
        -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:]((os_unfair_lock_s *)v15);
        ++v38;
      }
      while (v38 < objc_msgSend(v11, "supportedPlaceSummaryFormatTypesCount"));
    }
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1EDF4B018))
  {
    -[GEOPDCategorySearchParameters addSupportedSearchSectionType:]((os_unfair_lock_s *)v15);
    if ((objc_msgSend(v11, "navigating") & 1) == 0)
      -[GEOPDCategorySearchParameters addSupportedSearchSectionType:]((os_unfair_lock_s *)v15);
  }
  else if ((objc_msgSend(v11, "navigating") & 1) == 0)
  {
    -[GEOPDCategorySearchParameters addSupportedRelatedEntitySectionType:]((os_unfair_lock_s *)v15);
  }
  v39 = -[GEOPDSearchOriginationInfo initWithTraits:]([GEOPDSearchOriginationInfo alloc], "initWithTraits:", v11);
  -[GEOPDCategorySearchParameters setSearchOriginationInfo:]((uint64_t)v15, v39);

  v40 = objc_msgSend(v11, "supportStructuredRapAffordance");
  if (v15)
  {
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 0x100u;
    v15->_supportStructuredRapAffordance = v40;
  }
  v41 = objc_alloc_init(GEOPDPlaceRequestParameters);
  -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)v41, v15);
  if (objc_msgSend(v11, "optimizeSearchRequestComponents"))
  {
    objc_msgSend((id)objc_opt_class(), "createRequestedComponentsForReason:traits:count:", 31, v11, v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequest addPartiallyComposedSearchResultRequestedComponents:](v14, "addPartiallyComposedSearchResultRequestedComponents:", v42);

  }
  v12 = v49;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
  {
    objc_msgSend(v49, "searchSessionData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setSearchSessionData:]((uint64_t)v15, v43);

    objc_msgSend(v11, "userActionMetadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setSessionUserActionMetadata:]((uint64_t)v15, v44);

  }
  -[GEOPDPlaceRequest setPlaceRequestParameters:](v14, "setPlaceRequestParameters:", v41);
  v45 = v14;

LABEL_48:
  return v14;
}

- (GEOPDPlaceRequest)initWithCategory:(id)a3 routeInfo:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  uint64_t v9;
  id v12;
  _QWORD *v13;
  id v14;
  id v15;
  GEOPDPlaceRequest *v16;
  GEOPDPlaceRequest *v17;
  GEOPDCategorySearchParameters *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  GEOPDSSearchEvChargingParameters *v26;
  void *v27;
  void *v28;
  GEOPDSearchOriginationInfo *v29;
  char v30;
  int v31;
  unint64_t v32;
  void *v33;
  void *v34;
  GEOPDPlaceRequestParameters *v35;
  GEOPDPlaceRequest *v36;
  void *v38;
  void *v39;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v14, 1, 0);
  v17 = v16;
  if (!v16)
    goto LABEL_29;
  -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v16, "addRequestedComponentsForReason:traits:count:", 0, v14, v9);
  -[GEOPDPlaceRequest setRequestType:](v17, "setRequestType:", 12);
  v18 = objc_alloc_init(GEOPDCategorySearchParameters);
  v19 = (uint64_t)v18;
  if (v18)
  {
    *(_DWORD *)&v18->_flags |= 0x10000000u;
    *(_DWORD *)&v18->_flags |= 8u;
    v18->_maxResults = v9;
    objc_msgSend(v12, "_suggestionEntryMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:](v19, v20);

    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setViewportInfo:](v19, v21);

    *(_DWORD *)(v19 + 288) |= 0x10000000u;
    *(_DWORD *)(v19 + 288) |= 0x20u;
    *(_DWORD *)(v19 + 280) = 3;
  }
  else
  {
    objc_msgSend(v12, "_suggestionEntryMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:](0, v38);

    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setViewportInfo:](0, v39);

  }
  +[GEOPDETAFilter etaFilterForTraits:](GEOPDETAFilter, "etaFilterForTraits:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (-[GEOPDRecentRouteInfo _readEtaFilter]((uint64_t)v13), !v13[3]))
  {
    objc_msgSend(v22, "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDRecentRouteInfo setEtaFilter:]((uint64_t)v13, v23);

  }
  else
  {
    -[GEOPDCategorySearchParameters setEtaFilter:](v19, v22);
  }
  -[GEOPDCategorySearchParameters setRecentRouteInfo:](v19, v13);
  objc_msgSend(v14, "evChargingPorts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {

LABEL_11:
    v26 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    objc_msgSend(v14, "evChargingPorts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v26, v27);

    if (objc_msgSend(v14, "preferredBrandsCount"))
    {
      objc_msgSend(v14, "preferredBrands");
      objc_msgSend(v14, "preferredBrandsCount");
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v26);
    }
    -[GEOPDCategorySearchParameters setEvChargingParameters:](v19, v26);

    goto LABEL_14;
  }
  v25 = objc_msgSend(v14, "preferredBrandsCount");

  if (v25)
    goto LABEL_11;
LABEL_14:
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1EDF4B018))
  {
    objc_msgSend(v14, "previousSearchViewport");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setPreviousSearchViewport:](v19, v28);

  }
  v29 = -[GEOPDSearchOriginationInfo initWithTraits:]([GEOPDSearchOriginationInfo alloc], "initWithTraits:", v14);
  -[GEOPDCategorySearchParameters setSearchOriginationInfo:](v19, v29);

  v30 = objc_msgSend(v14, "supportStructuredRapAffordance");
  if (v19)
  {
    *(_DWORD *)(v19 + 288) |= 0x10000000u;
    *(_DWORD *)(v19 + 288) |= 0x100u;
    *(_BYTE *)(v19 + 286) = v30;
  }
  if (objc_msgSend(v14, "placeSummaryRevision"))
  {
    v31 = objc_msgSend(v14, "placeSummaryRevision");
    if (v19)
    {
      *(_DWORD *)(v19 + 288) |= 0x10000000u;
      *(_DWORD *)(v19 + 288) |= 0x10u;
      *(_DWORD *)(v19 + 276) = v31;
    }
    if (objc_msgSend(v14, "supportedPlaceSummaryFormatTypesCount"))
    {
      v32 = 0;
      do
      {
        objc_msgSend(v14, "supportedPlaceSummaryFormatTypeAtIndex:", v32);
        -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:]((os_unfair_lock_s *)v19);
        ++v32;
      }
      while (v32 < objc_msgSend(v14, "supportedPlaceSummaryFormatTypesCount"));
    }
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
  {
    if (v15)
    {
      objc_msgSend(v15, "searchSessionData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDCategorySearchParameters setSearchSessionData:](v19, v33);

    }
    objc_msgSend(v14, "userActionMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters setSessionUserActionMetadata:](v19, v34);

  }
  v35 = objc_alloc_init(GEOPDPlaceRequestParameters);
  -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)v35, (void *)v19);
  -[GEOPDPlaceRequest setPlaceRequestParameters:](v17, "setPlaceRequestParameters:", v35);
  v36 = v17;

LABEL_29:
  return v17;
}

- (GEOPDPlaceRequest)initWithSearchCategory:(id)a3 venueIdentifier:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  GEOPDPlaceRequest *v13;
  GEOPDPlaceRequest *v14;
  GEOPDSearchParameters *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  GEOPDSSearchEvChargingParameters *v24;
  void *v25;
  GEOPDSSearchFilter *v26;
  GEOPDSSearchVenueFilter *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  GEOPDSCategoryFilter *v31;
  void *v32;
  void *v33;
  void *v34;
  GEOPDPlaceRequestParameters *v35;
  GEOPDPlaceRequest *v36;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v12, 0, 0);
  v14 = v13;
  if (!v13)
    goto LABEL_26;
  -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v13, "addRequestedComponentsForReason:traits:count:", 8, v12, 1);
  -[GEOPDPlaceRequest setRequestType:](v14, "setRequestType:", 1);
  v15 = objc_alloc_init(GEOPDSearchParameters);
  v16 = (uint64_t)v15;
  if (v15)
  {
    *(_QWORD *)&v15->_flags |= 0x20000000002uLL;
    v15->_maxResults = v7;
  }
  objc_msgSend(v10, "_autocompleteEntry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchParameters setSuggestionEntry:](v16, v17);

  +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchParameters setViewportInfo:](v16, v18);

  v19 = objc_msgSend(v12, "searchRequestType");
  if (v19 > 3)
    v20 = 0;
  else
    v20 = dword_189CE3D00[v19];
  if (v16)
  {
    *(_QWORD *)(v16 + 372) |= 0x20000000008uLL;
    *(_DWORD *)(v16 + 352) = v20;
  }
  +[GEOPDETAFilter etaFilterForTraits:](GEOPDETAFilter, "etaFilterForTraits:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchParameters setEtaFilter:](v16, v21);

  objc_msgSend(v12, "evChargingPorts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {

LABEL_12:
    v24 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    objc_msgSend(v12, "evChargingPorts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v24, v25);

    if (objc_msgSend(v12, "preferredBrandsCount"))
    {
      objc_msgSend(v12, "preferredBrands");
      objc_msgSend(v12, "preferredBrandsCount");
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v24);
    }
    -[GEOPDSearchParameters setEvChargingParameters:](v16, v24);

    goto LABEL_15;
  }
  v23 = objc_msgSend(v12, "preferredBrandsCount");

  if (v23)
    goto LABEL_12;
LABEL_15:
  if (v11)
  {
    v26 = objc_alloc_init(GEOPDSSearchFilter);
    v27 = objc_alloc_init(GEOPDSSearchVenueFilter);
    objc_msgSend(v11, "placeDataVenueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSSearchVenueFilter setVenueFilter:]((uint64_t)v27, v28);

    if (v27)
    {
      *(_BYTE *)&v27->_flags |= 1u;
      v27->_venueSearchType = 1;
    }
    -[GEOPDSSearchFilter setVenueFilter:]((uint64_t)v26, v27);
    objc_msgSend(v10, "_suggestionEntryMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
    {
      v31 = objc_alloc_init(GEOPDSCategoryFilter);
      objc_msgSend(v10, "_suggestionEntryMetadata");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDSCategoryFilter setCategoryMetadata:]((uint64_t)v31, v32);

      -[GEOPDSSearchFilter setCategoryFilter:]((uint64_t)v26, v31);
    }
    -[GEOPDSearchParameters setSearchFilter:](v16, v26);

  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1EDF4B018))
  {
    objc_msgSend(v12, "previousSearchViewport");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setPreviousSearchViewport:](v16, v33);

  }
  if (objc_msgSend(v12, "optimizeSearchRequestComponents"))
  {
    objc_msgSend((id)objc_opt_class(), "createRequestedComponentsForReason:traits:count:", 31, v12, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequest addPartiallyComposedSearchResultRequestedComponents:](v14, "addPartiallyComposedSearchResultRequestedComponents:", v34);

  }
  v35 = objc_alloc_init(GEOPDPlaceRequestParameters);
  -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v35, (void *)v16);
  -[GEOPDPlaceRequest setPlaceRequestParameters:](v14, "setPlaceRequestParameters:", v35);
  v36 = v14;

LABEL_26:
  return v14;
}

- (GEOPDPlaceRequest)initWithCategoryMetadata:(id)a3 parentMuid:(unint64_t)a4 traits:(id)a5
{
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  GEOPDPlaceRequest *v11;
  GEOPDChildPlaceLookupByCategoryParameters *v12;
  GEOPDPlaceRequestParameters *v13;
  GEOPDPlaceRequest *v14;

  v8 = a3;
  v9 = a5;
  v10 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v9, 0, 0);
  v11 = v10;
  if (v10)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v10, "addRequestedComponentsForReason:traits:count:", 1, v9, 1);
    -[GEOPDPlaceRequest setRequestType:](v11, "setRequestType:", 42);
    v12 = objc_alloc_init(GEOPDChildPlaceLookupByCategoryParameters);
    -[GEOPDChildPlaceLookupByCategoryParameters setCategoryMetadata:]((uint64_t)v12, v8);
    if (v12)
    {
      *(_BYTE *)&v12->_flags |= 1u;
      v12->_parentMuid = a4;
    }
    v13 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setChildPlaceLookupByCategoryParameters:]((uint64_t)v13, v12);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v11, "setPlaceRequestParameters:", v13);
    v14 = v11;

  }
  return v11;
}

- (id)initForSearchFieldPlaceholderWithTraits:(id)a3
{
  id v4;
  id v5;
  void *v6;
  GEOPDSearchFieldPlaceholderParameters *v7;
  GEOPDSearchFieldPlaceholderParameters *v8;
  GEOPDPlaceRequestParameters *v9;
  id v10;

  v4 = a3;
  v5 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v4, 1, 0);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "addRequestedComponentsForReason:traits:count:", 1, v4, 0);
    objc_msgSend(v6, "setRequestType:", 15);
    v7 = objc_alloc_init(GEOPDSearchFieldPlaceholderParameters);
    v8 = v7;
    if (v7)
    {
      *(_BYTE *)&v7->_flags |= 1u;
      v7->_version = 1;
    }
    v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setSearchFieldPlaceholderParameters:]((uint64_t)v9, v8);
    objc_msgSend(v6, "setPlaceRequestParameters:", v9);
    v10 = v6;

  }
  return v6;
}

- (id)initForNearestTransitStationWithLine:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  id v11;
  void *v12;
  GEOPDPlaceRequestParameters *v13;
  GEOPDLocationDirectedSearchParameters *v14;
  GEOPDLocationDirectedSearchParameters *v15;
  GEOLatLng *v16;
  GEOPDNearestTransitParameters *v17;
  GEOPDNearestTransitParameters *v18;
  uint64_t v19;
  id v20;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = a5;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 1, 0);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "addRequestedComponentsForReason:traits:count:", 0, v10, 1);
    objc_msgSend(v12, "setRequestType:", 9);
    v13 = objc_alloc_init(GEOPDPlaceRequestParameters);
    v14 = objc_alloc_init(GEOPDLocationDirectedSearchParameters);
    v15 = v14;
    if (v14)
    {
      *(_WORD *)&v14->_flags |= 0x400u;
      *(_WORD *)&v14->_flags |= 2u;
      v14->_searchType = 2;
      *(_WORD *)&v14->_flags |= 0x400u;
      *(_WORD *)&v14->_flags |= 1u;
      v14->_maxResults = 1;
      *(_WORD *)&v14->_flags |= 0x400u;
      *(_WORD *)&v14->_flags |= 4u;
      v14->_sortOrder = 2;
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      v16 = objc_alloc_init(GEOLatLng);
      -[GEOLatLng setLat:](v16, "setLat:", var0);
      -[GEOLatLng setLng:](v16, "setLng:", var1);
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:]((uint64_t)v15, v16);

    }
    v17 = objc_alloc_init(GEOPDNearestTransitParameters);
    v18 = v17;
    if (v17)
    {
      *(_BYTE *)&v17->_flags |= 2u;
      v17->_isTransitOnly = 1;
      v19 = objc_msgSend(v9, "muid");
      *(_BYTE *)&v18->_flags |= 1u;
      v18->_lineMuid = v19;
    }
    else
    {
      objc_msgSend(v9, "muid");
    }
    -[GEOPDLocationDirectedSearchParameters setNearestTransitParameters:]((uint64_t)v15, v18);
    -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)v13, v15);
    objc_msgSend(v12, "setPlaceRequestParameters:", v13);
    v20 = v12;

  }
  return v12;
}

- (id)initForBrandLookupWithIMessageUid:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  GEOPDPlaceRequestParameters *v10;
  GEOPDBrandLookupParameters *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 1, 0);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "addRequestedComponentsForReason:traits:count:", 1, v7, 1);
    objc_msgSend(v9, "setRequestType:", 30);
    v10 = objc_alloc_init(GEOPDPlaceRequestParameters);
    objc_msgSend(v9, "setPlaceRequestParameters:", v10);

    v11 = objc_alloc_init(GEOPDBrandLookupParameters);
    objc_msgSend(v9, "placeRequestParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters setBrandLookupParameters:]((uint64_t)v12, v11);

    objc_msgSend(v9, "placeRequestParameters");
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters brandLookupParameters](v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDBrandLookupParameters setImessageUid:]((uint64_t)v14, v6);

    v15 = v9;
  }

  return v9;
}

- (id)initForWifiFingerprintLookupWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 entryTime:(unint64_t)a6 exitTime:(unint64_t)a7 traits:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  GEOPDPlaceRequestParameters *v19;
  GEOPDWifiFingerprintParameters *v20;
  void *v21;
  GEOPDWifiMeasurement *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  GEOPDWifiAccessPoint *v34;
  id *v35;
  void *v36;
  id *v37;
  uint64_t v38;
  id v39;
  unsigned int v41;
  unint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v16, 1, 0);
  v18 = v17;
  if (!v17)
    goto LABEL_25;
  v42 = a6;
  v41 = a5;
  objc_msgSend(v17, "addRequestedComponentsForReason:traits:count:", 11, v16, 1);
  objc_msgSend(v18, "setRequestType:", 32);
  v19 = objc_alloc_init(GEOPDPlaceRequestParameters);
  objc_msgSend(v18, "setPlaceRequestParameters:", v19);

  v20 = objc_alloc_init(GEOPDWifiFingerprintParameters);
  objc_msgSend(v18, "placeRequestParameters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters setWifiFingerprintParameters:]((uint64_t)v21, v20);

  v22 = objc_alloc_init(GEOPDWifiMeasurement);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v43 = v14;
  v23 = v14;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(v23);
        -[GEOPDWifiMeasurement addLocation:]((uint64_t)v22, *(void **)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v25);
  }
  v28 = a7;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = v15;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        v34 = -[GEOPDWifiAccessPoint initWithGEOWifiAccessPoint:]([GEOPDWifiAccessPoint alloc], "initWithGEOWifiAccessPoint:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
        -[GEOPDWifiMeasurement addWifiAccessPoint:]((uint64_t)v22, v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v31);
  }

  if (!v42)
    goto LABEL_19;
  if (v22)
  {
    *(_BYTE *)&v22->_flags |= 0x20u;
    *(_BYTE *)&v22->_flags |= 1u;
    v22->_entryTime = v42;
LABEL_19:
    if (v28 && v22)
    {
      *(_BYTE *)&v22->_flags |= 0x20u;
      *(_BYTE *)&v22->_flags |= 2u;
      v22->_exitTime = v28;
    }
  }
  objc_msgSend(v18, "placeRequestParameters");
  v35 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters wifiFingerprintParameters](v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDWifiFingerprintParameters addMeasurement:]((uint64_t)v36, v22);

  objc_msgSend(v18, "placeRequestParameters");
  v37 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters wifiFingerprintParameters](v37);
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    *(_BYTE *)(v38 + 28) |= 1u;
    *(_DWORD *)(v38 + 24) = v41;
  }

  v39 = v18;
  v14 = v43;
LABEL_25:

  return v18;
}

- (id)initForGeoIpLookupWithIpAddress:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GEOPDPlaceRequestParameters *v9;
  GEOPDIpGeoLookupParameters *v10;
  void *v11;
  id *v12;
  void *v13;

  v6 = a3;
  v7 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", a4, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setRequestType:", 34);
    v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    objc_msgSend(v8, "setPlaceRequestParameters:", v9);

    v10 = objc_alloc_init(GEOPDIpGeoLookupParameters);
    objc_msgSend(v8, "placeRequestParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters setIpGeoLookupParameters:]((uint64_t)v11, v10);

    objc_msgSend(v8, "placeRequestParameters");
    v12 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters ipGeoLookupParameters](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDIpGeoLookupParameters setIpAddress:]((uint64_t)v13, v6);

  }
  return v8;
}

- (id)initForTerritoryForLatLngsE7:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  GEOPDTerritoryLookupParameters *v10;
  void *v11;
  GEOPDPlaceRequestParameters *v12;
  void *v13;
  GEOPDPlaceRequest *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOPDPlaceRequest;
  v8 = -[GEOPDPlaceRequest init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest setRequestType:](v8, "setRequestType:", 49);
    v10 = objc_alloc_init(GEOPDTerritoryLookupParameters);
    v11 = (void *)objc_msgSend(v6, "mutableCopy");
    -[GEOPDTerritoryLookupParameters setLocations:]((uint64_t)v10, v11);

    v12 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v12);

    -[GEOPDPlaceRequest placeRequestParameters](v9, "placeRequestParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters setTerritoryLookupParameters:]((uint64_t)v13, v10);

    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v9, "addRequestedComponentsForReason:traits:count:", 19, v7, 1);
    v14 = v9;

  }
  return v9;
}

- (id)initForOfflineRegionNameSuggestionWithRegion:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  GEOPDOfflineRegionNameParameters *v10;
  GEOPDPlaceRequestParameters *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setRequestType:", 59);
    v10 = objc_alloc_init(GEOPDOfflineRegionNameParameters);
    -[GEOPDOfflineRegionNameParameters setRegion:]((uint64_t)v10, v6);
    v11 = objc_alloc_init(GEOPDPlaceRequestParameters);
    objc_msgSend(v9, "setPlaceRequestParameters:", v11);

    objc_msgSend(v9, "placeRequestParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters setOfflineRegionNameParameters:]((uint64_t)v12, v10);

    objc_msgSend(v9, "addRequestedComponentsForReason:traits:count:", 28, v7, 1);
    v13 = v9;

  }
  return v9;
}

- (id)initForSearchCapabilitiesWithTraits:(id)a3
{
  id v4;
  id v5;
  void *v6;
  GEOPDSearchCapabilitiesParameters *v7;
  void *v8;
  GEOPDPlaceRequestParameters *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v4, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRequestType:", 60);
    v7 = objc_alloc_init(GEOPDSearchCapabilitiesParameters);
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchCapabilitiesParameters setViewportInfo:]((uint64_t)v7, v8);

    v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    objc_msgSend(v6, "setPlaceRequestParameters:", v9);

    objc_msgSend(v6, "placeRequestParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters setSearchCapabilitiesParameters:]((uint64_t)v10, v7);

    v11 = v6;
  }

  return v6;
}

- (GEOPDPlaceRequest)initWithSpatialPlaceLookupParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  GEOPDBatchSpatialLookupParameters *v10;
  void *v11;
  GEOPDPlaceRequestParameters *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest setRequestType:](v8, "setRequestType:", 36);
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v9, "addRequestedComponentsForReason:traits:count:", 9, v7, 1);
    v10 = objc_alloc_init(GEOPDBatchSpatialLookupParameters);
    -[GEOPDPlaceRequest pdSpatialPlaceLookupParametersArrayForParameters:](v9, "pdSpatialPlaceLookupParametersArrayForParameters:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDBatchSpatialLookupParameters setSpatialPlaceLookups:]((uint64_t)v10, v11);

    v12 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)v12, v10);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v12);

  }
  return v9;
}

- (GEOPDPlaceRequest)initWithSpatialEventLookupParameters:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *v9;
  GEOPDBatchSpatialLookupParameters *v10;
  void *v11;
  GEOPDPlaceRequestParameters *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[GEOPDPlaceRequest setRequestType:](v8, "setRequestType:", 36);
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v9, "addRequestedComponentsForReason:traits:count:", 10, v7, 1);
    v10 = objc_alloc_init(GEOPDBatchSpatialLookupParameters);
    -[GEOPDPlaceRequest pdSpatialEventLookupParametersArrayForParameters:](v9, "pdSpatialEventLookupParametersArrayForParameters:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDBatchSpatialLookupParameters setSpatialEventLookups:]((uint64_t)v10, v11);

    v12 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)v12, v10);
    -[GEOPDPlaceRequest setPlaceRequestParameters:](v9, "setPlaceRequestParameters:", v12);

  }
  return v9;
}

- (id)initForSearchHomeWithTraits:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  id v8;
  GEOPDMapsSearchHomeParameters *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  GEOPDGuidesLocationsSuggestionParameters *v14;
  GEOPDCollectionSuggestionParameters *v15;
  GEOPDPublisherSuggestionParameters *v16;
  GEOPDSearchOriginationInfo *v17;
  GEOPDPlaceRequestParameters *v18;
  void *v19;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", &unk_1E1E81EE0);
  v6 = objc_msgSend(v4, "navigating");
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", &unk_1E1E81E98);
    objc_msgSend(v5, "addObject:", &unk_1E1E81EB0);
  }
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v4, 0, v7);

  if (v8)
  {
    objc_msgSend(v8, "setRequestType:", 44);
    v9 = objc_alloc_init(GEOPDMapsSearchHomeParameters);
    if (((v6 | GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1EDF4B048) ^ 1) & 1) == 0)
      -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
    -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
    if ((v6 & 1) == 0)
    {
      -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
      -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
    }
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localTimestamp");
    v12 = v11;
    objc_msgSend(v8, "browseCategorySuggestionparametersWithTraits:isFromNoQueryState:", v4, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDMapsSearchHomeParameters setSearchBrowseCategorySuggestionParameters:]((uint64_t)v9, v13);
    if ((v6 & 1) == 0)
    {
      v14 = objc_alloc_init(GEOPDGuidesLocationsSuggestionParameters);
      -[GEOPDGuidesLocationsSuggestionParameters setViewportInfo:]((uint64_t)v14, v10);
      -[GEOPDMapsSearchHomeParameters setGuidesLocationsSuggestionParameters:]((uint64_t)v9, v14);
      v15 = objc_alloc_init(GEOPDCollectionSuggestionParameters);
      -[GEOPDCollectionSuggestionParameters setViewportInfo:]((uint64_t)v15, v10);
      if (v15)
      {
        *(_BYTE *)&v15->_flags |= 0x40u;
        *(_BYTE *)&v15->_flags |= 1u;
        v15->_requestLocalTimestamp = v12;
      }
      -[GEOPDMapsSearchHomeParameters setCollectionSuggestionParameters:]((uint64_t)v9, v15);
      v16 = objc_alloc_init(GEOPDPublisherSuggestionParameters);
      -[GEOPDPublisherSuggestionParameters setViewportInfo:]((uint64_t)v16, v10);
      if (v16)
      {
        *(_BYTE *)&v16->_flags |= 1u;
        v16->_requestLocalTimestamp = v12;
      }
      -[GEOPDMapsSearchHomeParameters setPublisherSuggestionParameters:]((uint64_t)v9, v16);

    }
    v17 = -[GEOPDSearchOriginationInfo initWithTraits:]([GEOPDSearchOriginationInfo alloc], "initWithTraits:", v4);
    -[GEOPDMapsSearchHomeParameters setSearchOriginationInfo:]((uint64_t)v9, v17);

    v18 = objc_alloc_init(GEOPDPlaceRequestParameters);
    objc_msgSend(v8, "setPlaceRequestParameters:", v18);

    objc_msgSend(v8, "placeRequestParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters setMapsSearchHomeParameters:]((uint64_t)v19, v9);

    objc_msgSend(v8, "addRequestedComponentsForReason:traits:count:", 14, v4, 0);
  }

  return v8;
}

- (id)initPublisherViewWithPublisherIdentifier:(id)a3 keywordFilter:(id)a4 addressFilter:(id)a5 batchSize:(unsigned int)a6 withTraits:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  GEOPDPublisherViewParameters *v18;
  void *v19;
  void *v20;
  GEOPDPublisherViewResultFilter *v21;
  void *v22;
  int v23;
  void *v24;
  GEOPDPlaceRequestParameters *v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v15, 0, &unk_1E1E859C0);
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "setRequestType:", 46);
    v18 = objc_alloc_init(GEOPDPublisherViewParameters);
    objc_msgSend(v12, "mapsIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPublisherViewParameters setPublisherId:]((uint64_t)v18, v19);

    if (v18)
    {
      *(_BYTE *)&v18->_flags |= 0x20u;
      *(_BYTE *)&v18->_flags |= 1u;
      v18->_numClientizedResults = a6;
    }
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPublisherViewParameters setViewportInfo:]((uint64_t)v18, v20);

    if (v13)
    {
      v21 = objc_alloc_init(GEOPDPublisherViewResultFilter);
      objc_msgSend(v13, "keywordIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPublisherViewResultFilter setFilterKeyword:]((uint64_t)v21, v22);

      if (v21)
      {
        v23 = 2;
LABEL_10:
        *(_BYTE *)&v21->_flags |= 0x10u;
        *(_BYTE *)&v21->_flags |= 1u;
        v21->_filterType = v23;
      }
    }
    else
    {
      if (!v14)
      {
LABEL_12:
        objc_msgSend(v17, "addRequestedComponentsForReason:traits:count:", 13, v15, 1);
        v25 = objc_alloc_init(GEOPDPlaceRequestParameters);
        -[GEOPDPlaceRequestParameters setPublisherViewParameters:]((uint64_t)v25, v18);
        objc_msgSend(v17, "setPlaceRequestParameters:", v25);

        goto LABEL_13;
      }
      v21 = objc_alloc_init(GEOPDPublisherViewResultFilter);
      objc_msgSend(v14, "addressIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPublisherViewResultFilter setFilterAddress:]((uint64_t)v21, v24);

      if (v21)
      {
        v23 = 1;
        goto LABEL_10;
      }
    }
    -[GEOPDPublisherViewParameters setResultFilter:]((uint64_t)v18, v21);

    goto LABEL_12;
  }
LABEL_13:

  return v17;
}

- (GEOPDPlaceRequest)initWithGuideHomeWithFilter:(id)a3 guideLocation:(id)a4 withTraits:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOPDPlaceRequest *v11;
  GEOPDPlaceRequest *v12;
  GEOPDGuidesHomeParameters *v13;
  void *v14;
  GEOPDGuidesHomeResultFilter *v15;
  GEOPDGuidesHomeResultFilter *v16;
  void *v17;
  void *v18;
  GEOPDGuidesLocationEntry *v19;
  void *v20;
  void *v21;
  GEOPDPlaceRequestParameters *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 0, &unk_1E1E859D8);
  v12 = v11;
  if (v11)
  {
    -[GEOPDPlaceRequest setRequestType:](v11, "setRequestType:", 53);
    v13 = objc_alloc_init(GEOPDGuidesHomeParameters);
    -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDGuidesHomeParameters setViewportInfo:]((uint64_t)v13, v14);
    if (v8)
    {
      v15 = objc_alloc_init(GEOPDGuidesHomeResultFilter);
      v16 = v15;
      if (v15)
      {
        *(_BYTE *)&v15->_flags |= 0x10u;
        *(_BYTE *)&v15->_flags |= 1u;
        v15->_filterType = 1;
      }
      objc_msgSend(v8, "conceptFilter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDGuidesHomeResultFilter setFilterConcept:]((uint64_t)v16, v17);

      -[GEOPDGuidesHomeParameters setResultFilter:]((uint64_t)v13, v16);
    }
    objc_msgSend(v9, "pdWorldwideLocationEntry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_alloc_init(GEOPDGuidesLocationEntry);
      objc_msgSend(v9, "pdWorldwideLocationEntry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDGuidesLocationEntry setWorldwide:]((uint64_t)v19, v20);

      if (v19)
      {
        *(_WORD *)&v19->_flags |= 0x100u;
        *(_WORD *)&v19->_flags |= 2u;
        v19->_type = 2;
      }
    }
    else
    {
      objc_msgSend(v9, "pdLocationEntry");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_12:
        -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v12, "addRequestedComponentsForReason:traits:count:", 24, v10, 1);
        v22 = objc_alloc_init(GEOPDPlaceRequestParameters);
        -[GEOPDPlaceRequestParameters setGuidesHomeParameters:]((uint64_t)v22, v13);
        -[GEOPDPlaceRequest setPlaceRequestParameters:](v12, "setPlaceRequestParameters:", v22);

        goto LABEL_13;
      }
      objc_msgSend(v9, "pdLocationEntry");
      v19 = (GEOPDGuidesLocationEntry *)objc_claimAutoreleasedReturnValue();
    }
    -[GEOPDGuidesHomeParameters setGuidesLocationEntry:]((uint64_t)v13, v19);

    goto LABEL_12;
  }
LABEL_13:

  return v12;
}

- (id)initForCuratedCollectionLookupWithIdentifiers:(id)a3 isBatchLookup:(BOOL)a4 overrideSuppress:(BOOL)a5 traits:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  GEOPDPlaceRequestParameters *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id *v20;
  _BYTE *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v7 = a5;
  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v11, 0, &unk_1E1E859F0);
  if (v12)
  {
    v13 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:]([GEOPDPlaceRequestParameters alloc], "initWithIdentifiers:resultProviderID:", v10, 0);
    objc_msgSend(v12, "setPlaceRequestParameters:", v13);
    objc_msgSend(v12, "setRequestType:", 23);
    if (v8)
    {
      objc_msgSend(v12, "addRequestedComponentsForReason:traits:count:", 18, v11, 1);
    }
    else
    {
      objc_msgSend(v12, "addRequestedComponentsForReason:traits:count:", 15, v11, 1);
      if (v7)
      {
        v23 = v10;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v12, "requestedComponents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              if (v19 && (*(_BYTE *)(v19 + 44) & 4) != 0 && *(_DWORD *)(v19 + 32) == 65)
              {
                -[GEOPDComponentInfo filter]((id *)v19);
                v20 = (id *)objc_claimAutoreleasedReturnValue();
                -[GEOPDComponentFilter placeCollectionFilter](v20);
                v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  v21[28] |= 0x20u;
                  v21[24] = 1;
                }

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v16);
        }

        v10 = v23;
      }
    }

  }
  return v12;
}

- (id)initForGuideLocationLookupWithIdentifiers:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  GEOPDPlaceRequestParameters *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 0, &unk_1E1E85A08);
  if (v8)
  {
    v9 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:]([GEOPDPlaceRequestParameters alloc], "initWithIdentifiers:resultProviderID:", v6, 0);
    objc_msgSend(v8, "setPlaceRequestParameters:", v9);
    objc_msgSend(v8, "setRequestType:", 23);
    objc_msgSend(v8, "addRequestedComponentsForReason:traits:count:", 23, v7, 1);

  }
  return v8;
}

- (id)initForCuratedCollectionItemLookupWithIdentifiers:(id)a3 collectionIdentifier:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  id v21;
  GEOPDPlaceCollectionItemFilter *v22;
  void *v23;
  GEOPDComponentFilter *v24;
  GEOPDPlaceRequestParameters *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 0, &unk_1E1E85A20);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v28 = v9;
    v27 = (void *)v13;
    v26 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:]([GEOPDPlaceRequestParameters alloc], "initWithIdentifiers:resultProviderID:", v13, objc_msgSend(v9, "resultProviderID"));
    objc_msgSend(v11, "setPlaceRequestParameters:");
    objc_msgSend(v11, "setRequestType:", 23);
    objc_msgSend(v11, "addRequestedComponentsForReason:traits:count:", 16, v10, 1);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v11, "requestedComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v19 && (*(_BYTE *)(v19 + 44) & 4) != 0 && *(_DWORD *)(v19 + 32) == 74)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __116__GEOPDPlaceRequest_PlaceDataExtras__initForCuratedCollectionItemLookupWithIdentifiers_collectionIdentifier_traits___block_invoke;
            v30[3] = &unk_1E1C20E78;
            v31 = v20;
            v21 = v20;
            objc_msgSend(v29, "enumerateObjectsUsingBlock:", v30);
            v22 = objc_alloc_init(GEOPDPlaceCollectionItemFilter);
            v23 = (void *)objc_msgSend(v21, "copy");
            -[GEOPDPlaceCollectionItemFilter setItemIds:]((uint64_t)v22, v23);

            v24 = objc_alloc_init(GEOPDComponentFilter);
            -[GEOPDComponentFilter setPlaceCollectionItemFilter:]((uint64_t)v24, v22);
            -[GEOPDComponentInfo setFilter:](v19, v24);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    v9 = v28;
    v8 = v29;
  }

  return v11;
}

void __116__GEOPDPlaceRequest_PlaceDataExtras__initForCuratedCollectionItemLookupWithIdentifiers_collectionIdentifier_traits___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "mapsIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (GEOPDPlaceRequest)initWithAllCollectionViewWithBatchSize:(unsigned int)a3 keywordFilter:(id)a4 addressFilter:(id)a5 withTraits:(id)a6
{
  id v10;
  id v11;
  id v12;
  GEOPDPlaceRequest *v13;
  GEOPDPlaceRequest *v14;
  GEOPDAllCollectionsViewParameters *v15;
  void *v16;
  GEOPDAllCollectionsViewResultFilter *v17;
  void *v18;
  int v19;
  void *v20;
  GEOPDPlaceRequestParameters *v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v12, 0, &unk_1E1E85A38);
  v14 = v13;
  if (v13)
  {
    -[GEOPDPlaceRequest setRequestType:](v13, "setRequestType:", 47);
    v15 = objc_alloc_init(GEOPDAllCollectionsViewParameters);
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDAllCollectionsViewParameters setViewportInfo:]((uint64_t)v15, v16);

    if (v15)
    {
      *(_BYTE *)&v15->_flags |= 0x20u;
      *(_BYTE *)&v15->_flags |= 1u;
      v15->_numClientizedResults = a3;
    }
    if (v10)
    {
      v17 = objc_alloc_init(GEOPDAllCollectionsViewResultFilter);
      objc_msgSend(v10, "keywordIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAllCollectionsViewResultFilter setFilterKeyword:]((uint64_t)v17, v18);

      if (v17)
      {
        v19 = 2;
LABEL_10:
        *(_BYTE *)&v17->_flags |= 0x10u;
        *(_BYTE *)&v17->_flags |= 1u;
        v17->_filterType = v19;
      }
    }
    else
    {
      if (!v11)
      {
LABEL_12:
        -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v14, "addRequestedComponentsForReason:traits:count:", 17, v12, 1);
        v21 = objc_alloc_init(GEOPDPlaceRequestParameters);
        -[GEOPDPlaceRequestParameters setAllCollectionsViewParameters:]((uint64_t)v21, v15);
        -[GEOPDPlaceRequest setPlaceRequestParameters:](v14, "setPlaceRequestParameters:", v21);

        goto LABEL_13;
      }
      v17 = objc_alloc_init(GEOPDAllCollectionsViewResultFilter);
      objc_msgSend(v11, "addressIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAllCollectionsViewResultFilter setFilterAddress:]((uint64_t)v17, v20);

      if (v17)
      {
        v19 = 1;
        goto LABEL_10;
      }
    }
    -[GEOPDAllCollectionsViewParameters setResultFilter:]((uint64_t)v15, v17);

    goto LABEL_12;
  }
LABEL_13:

  return v14;
}

- (id)initCitySelectorViewWithTraits:(id)a3 batchSize:(unsigned int)a4
{
  id v6;
  id v7;
  void *v8;
  GEOPDAllGuidesLocationsViewParameters *v9;
  void *v10;
  GEOPDPlaceRequestParameters *v11;

  v6 = a3;
  v7 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v6, 0, &unk_1E1E85A50);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setRequestType:", 52);
    v9 = objc_alloc_init(GEOPDAllGuidesLocationsViewParameters);
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDAllGuidesLocationsViewParameters setViewportInfo:]((uint64_t)v9, v10);

    if (v9)
    {
      *(_BYTE *)&v9->_flags |= 1u;
      v9->_numClientizedResults = a4;
    }
    objc_msgSend(v8, "addRequestedComponentsForReason:traits:count:", 23, v6, 1);
    v11 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setAllGuidesLocationsViewParameters:]((uint64_t)v11, v9);
    objc_msgSend(v8, "setPlaceRequestParameters:", v11);

  }
  return v8;
}

- (id)initPlaceEnrichmentWithEnrichmentInfo:(id)a3 mapsIdentifier:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  GEOPDPlacecardEnrichmentParameters *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  GEOPDPlaceRequestParameters *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v10, 0, &unk_1E1E85A68);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setRequestType:", 58);
    v13 = objc_alloc_init(GEOPDPlacecardEnrichmentParameters);
    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "pdEnrichmentInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, 0);
    -[GEOPDPlacecardEnrichmentParameters setEnrichmentInfos:]((uint64_t)v13, v16);

    objc_msgSend(v9, "mapsIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlacecardEnrichmentParameters setMapsId:]((uint64_t)v13, v17);

    objc_msgSend(v12, "addRequestedComponentsForReason:traits:count:", 27, v10, 1);
    v18 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setPlacecardEnrichmentParameters:]((uint64_t)v18, v13);
    objc_msgSend(v12, "setPlaceRequestParameters:", v18);

  }
  return v12;
}

- (id)initEVChargerRefreshRequestWithMapsIdentifier:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  GEOPDPlaceRequestParameters *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 0, &unk_1E1E85A80);
  if (v8)
  {
    v9 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:]([GEOPDPlaceRequestParameters alloc], "initWithIdentifiers:resultProviderID:", v6, 0);
    objc_msgSend(v8, "setPlaceRequestParameters:", v9);
    objc_msgSend(v8, "setRequestType:", 23);
    objc_msgSend(v8, "addRequestedComponentsForReason:traits:count:", 29, v7, 1);

  }
  return v8;
}

- (id)initForHikingIntroTipWithMapItemIdentifier:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  id v8;
  GEOPDPlaceRequestParameters *v9;
  void *v10;
  GEOPDPlaceRequestParameters *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v7, 0, &unk_1E1E85A98);
  if (v8)
  {
    v9 = [GEOPDPlaceRequestParameters alloc];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:](v9, "initWithIdentifiers:resultProviderID:", v10, 0);

    objc_msgSend(v8, "setPlaceRequestParameters:", v11);
    objc_msgSend(v8, "setRequestType:", 23);
    objc_msgSend(v8, "addRequestedComponentsForReason:traits:count:", 30, v7, 1);

  }
  return v8;
}

- (id)initForMapsHomeWithTraits:(id)a3
{
  id v4;
  id v5;
  void *v6;
  GEOPDCollectionSuggestionParameters *v7;
  double v8;
  GEOPDMapsHomeParameters *v9;
  int BOOL;
  GEOPDPlaceRequestParameters *v11;

  v4 = a3;
  v5 = -[GEOPDPlaceRequest _initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:](self, "_initWithTraits:includeHistoricalLocations:supportedMapsResultTypes:", v4, 0, &unk_1E1E85AB0);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRequestType:", 51);
    v7 = objc_alloc_init(GEOPDCollectionSuggestionParameters);
    objc_msgSend(v6, "localTimestamp");
    if (v7)
    {
      *(_BYTE *)&v7->_flags |= 0x40u;
      *(_BYTE *)&v7->_flags |= 1u;
      v7->_requestLocalTimestamp = v8;
    }
    v9 = objc_alloc_init(GEOPDMapsHomeParameters);
    -[GEOPDMapsHomeParameters setCollectionSuggestionParameters:]((uint64_t)v9, v7);
    BOOL = GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1EDF4B048);
    if (v9 && BOOL)
    {
      *(_BYTE *)&v9->_flags |= 1u;
      v9->_shouldPopulateExploreGuidesEntry = 1;
    }
    v11 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setMapsHomeParameters:]((uint64_t)v11, v9);
    objc_msgSend(v6, "setPlaceRequestParameters:", v11);
    objc_msgSend(v6, "addRequestedComponentsForReason:traits:count:", 22, v4, 0);

  }
  return v6;
}

- (BOOL)hasResultProviderID
{
  int v3;
  id *v4;
  _BYTE *v5;
  int *v6;
  BOOL v7;

  v3 = -[GEOPDPlaceRequest requestType](self, "requestType");
  if (v3 == 23)
  {
    -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters](v4);
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = &OBJC_IVAR___GEOPDMapsIdentifierPlaceLookupParameters__flags;
      goto LABEL_7;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_8;
  }
  if (v3 != 5)
    return 0;
  -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters placeLookupParameters](v4);
  v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  v6 = &OBJC_IVAR___GEOPDPlaceLookupParameters__flags;
LABEL_7:
  v7 = v5[*v6] & 1;
LABEL_8:

  return v7;
}

- (int)resultProviderID
{
  int v3;
  id *v4;
  char *v5;
  int *v6;
  int v7;

  v3 = -[GEOPDPlaceRequest requestType](self, "requestType");
  if (v3 == 23)
  {
    -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters](v4);
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = &OBJC_IVAR___GEOPDMapsIdentifierPlaceLookupParameters__resultProviderId;
      goto LABEL_7;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_8;
  }
  if (v3 != 5)
    return 0;
  -[GEOPDPlaceRequest placeRequestParameters](self, "placeRequestParameters");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters placeLookupParameters](v4);
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  v6 = &OBJC_IVAR___GEOPDPlaceLookupParameters__resultProviderId;
LABEL_7:
  v7 = *(_DWORD *)&v5[*v6];
LABEL_8:

  return v7;
}

- (id)pdSpatialPlaceLookupParametersArrayForParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[GEOPDPlaceRequest pdSpatialPlaceLookupParametersForParameters:](self, "pdSpatialPlaceLookupParametersForParameters:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)pdSpatialPlaceLookupParametersForParameters:(id)a3
{
  id v3;
  GEOPDSpatialPlaceLookupParameters *v4;
  double v5;
  double v6;
  double v7;
  GEOLatLng *v8;
  GEOLatLng *v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int v22;
  int v23;
  char v24;
  __int16 flags;
  void *v26;
  void *v27;
  __int16 v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(GEOPDSpatialPlaceLookupParameters);
  objc_msgSend(v3, "coordinate");
  if (v6 < -180.0 || v6 > 180.0 || v5 < -90.0 || v5 > 90.0 || (objc_msgSend(v3, "radius"), v7 <= 0.0))
  {
    objc_msgSend(v3, "mapRegion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v3, "mapRegion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDSpatialPlaceLookupParameters setMapRegion:]((uint64_t)v4, v13);

    }
    v11 = objc_msgSend(v3, "maxResultCount");
    if (v4)
      goto LABEL_11;
  }
  else
  {
    v8 = [GEOLatLng alloc];
    objc_msgSend(v3, "coordinate");
    v9 = -[GEOLatLng initWithCoordinate:](v8, "initWithCoordinate:");
    -[GEOPDSpatialPlaceLookupParameters setCenter:]((uint64_t)v4, v9);

    objc_msgSend(v3, "radius");
    if (v4)
    {
      *(_WORD *)&v4->_flags |= 0x400u;
      *(_WORD *)&v4->_flags |= 2u;
      v4->_radius = (int)v10;
      v11 = objc_msgSend(v3, "maxResultCount");
LABEL_11:
      v14 = 0;
      *(_WORD *)&v4->_flags |= 0x400u;
      *(_WORD *)&v4->_flags |= 1u;
      v4->_count = v11;
      goto LABEL_12;
    }
    objc_msgSend(v3, "maxResultCount");
  }
  v14 = 1;
LABEL_12:
  objc_msgSend(v3, "categories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = v3;
    objc_msgSend(v3, "categories");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v22 = _GEOPDSpatialPlaceLookupCategoryForCategory(*(__CFString **)(*((_QWORD *)&v31 + 1) + 8 * i));
          if (v22)
          {
            v23 = v22;
            -[GEOPDSpatialPlaceLookupParameters addCategoryFilter:]((uint64_t)v4);
            v24 = v23 == 23 ? v14 : 1;
            if ((v24 & 1) == 0)
            {
              flags = (__int16)v4->_flags;
              if ((flags & 4) == 0)
              {
                *(_WORD *)&v4->_flags = flags | 0x400;
                *(_WORD *)&v4->_flags |= 4u;
                v4->_spatialPlaceLookupRequestVersion = 2;
              }
            }
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v19);
    }

    v3 = v30;
  }
  else
  {
    objc_msgSend(v3, "poiCategoryFilter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v3, "poiCategoryFilter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "applyFilterToPlaceParameters:", v4);

    }
  }
  if ((v14 & 1) == 0)
  {
    v28 = (__int16)v4->_flags;
    if ((v28 & 4) == 0)
    {
      *(_WORD *)&v4->_flags = v28 | 0x400;
      *(_WORD *)&v4->_flags |= 4u;
      v4->_spatialPlaceLookupRequestVersion = 1;
    }
  }

  return v4;
}

- (id)pdSpatialEventLookupParametersArrayForParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[GEOPDPlaceRequest pdSpatialEventLookupParametersForParameters:](self, "pdSpatialEventLookupParametersForParameters:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)pdSpatialEventLookupParametersForParameters:(id)a3
{
  id v3;
  GEOPDSpatialEventLookupParameters *v4;
  GEOLatLng *v5;
  GEOLatLng *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(GEOPDSpatialEventLookupParameters);
  v5 = [GEOLatLng alloc];
  objc_msgSend(v3, "coordinate");
  v6 = -[GEOLatLng initWithCoordinate:](v5, "initWithCoordinate:");
  -[GEOPDSpatialEventLookupParameters setCenter:]((uint64_t)v4, v6);

  v7 = objc_msgSend(v3, "maxResultCount");
  if (v4)
  {
    *(_BYTE *)&v4->_flags |= 0x40u;
    *(_BYTE *)&v4->_flags |= 2u;
    v4->_count = v7;
  }
  objc_msgSend(v3, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  objc_msgSend(v3, "dateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "duration");
  v14 = v13;

  if (v4)
  {
    *(_BYTE *)&v4->_flags |= 0x40u;
    *(_BYTE *)&v4->_flags |= 1u;
    *(_QWORD *)&v4->_timeRange._duration = v14 | ((unint64_t)v11 << 32);
    v4->_timeRange._has = ($B85216D09A238EDB5177F50F3CAD2EB5)3;
  }
  objc_msgSend(v3, "radius");
  if (v15 > 0.0)
  {
    objc_msgSend(v3, "radius");
    if (v4)
    {
      *(_BYTE *)&v4->_flags |= 0x40u;
      *(_BYTE *)&v4->_flags |= 4u;
      v4->_radius = (int)v16;
    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "categories", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        if (_GEOPDSpatialEventLookupCategoryForCategory(*(__CFString **)(*((_QWORD *)&v23 + 1) + 8 * i)))
          -[GEOPDSpatialEventLookupParameters addCategoryFilter:]((uint64_t)v4);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

  return v4;
}

@end
