@implementation GEOMapURLParser

+ (BOOL)isValidMapURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("maps")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("https"))
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("collections.apple.com")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("https"))
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("guides.apple.com")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("http")) & 1) != 0
           || objc_msgSend(v5, "isEqualToString:", CFSTR("https")))
    {
      objc_msgSend(v3, "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "isEqualToString:", CFSTR("maps.apple.com"));

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (BOOL)isValidMapsCategoryURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("x-maps-category"));
  return (char)v3;
}

+ (BOOL)isValidMapsURLForAppendingSharedSessionID:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[GEOMapURLParser isValidMapURL:](GEOMapURLParser, "isValidMapURL:", v3)
    || +[GEOMapURLParser isValidMapsCategoryURL:](GEOMapURLParser, "isValidMapsCategoryURL:", v3);

  return v4;
}

- (GEOMapURLParser)initWithURL:(id)a3
{
  id v5;
  GEOMapURLParser *v6;
  GEOMapURLParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLParser;
  v6 = -[GEOMapURLParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (BOOL)parseIncludingCustomParameters:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  GEOUserSessionEntity *userSessionEntity;
  NSString *contentProvider;
  NSString *contentProviderID;
  NSString *lineName;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  NSString *label;
  void *v42;
  void *v43;
  int v44;
  int v45;
  id v46;
  NSString *v47;
  NSString *searchQuery;
  void *v49;
  uint64_t v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  float v55;
  float v56;
  float v57;
  float v58;
  void *v59;
  uint64_t v60;
  NSString *v61;
  NSString *v62;
  NSString *v63;
  NSString *v64;
  NSString *v65;
  NSString *addressString;
  void *v67;
  NSString *v68;
  NSString *directionsSourceAddressString;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  uint64_t v79;
  int v80;
  void *v81;
  uint64_t v82;
  GEOMapItemIdentifier *v83;
  unint64_t v84;
  NSString *v85;
  NSString *v86;
  double v87;
  double v88;
  GEOUserSessionEntity *v89;
  GEOUserSessionEntity *v90;
  GEOUserSessionEntity *v91;
  void *v92;
  void *v93;
  int v94;
  GEOMuninViewState *v95;
  GEOMuninViewState *muninViewState;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  NSString *v101;
  NSString *v102;
  id v103;
  int64_t v104;
  void *v105;
  char v106;
  GEOURLExtraStorage *v107;
  GEOURLExtraStorage *extraStorage;
  GEOURLCollectionStorage *v109;
  GEOURLCollectionStorage *collectionStorage;
  GEOURLCollectionStorage *v111;
  GEOURLCollectionStorage *v112;
  id v113;
  id v114;
  void *v115;
  GEOEnrichmentInfo *v116;
  GEOEnrichmentInfo *enrichmentInfo;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  GEOMapRegion *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  uint64_t v142;
  void *v143;
  NSString *v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  void *v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  double v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  NSString *v164;
  NSString *v165;
  id v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  double v175;
  double v176;
  void *v177;
  double v178;
  double v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  double v185;
  void *v186;
  double v187;
  void *v188;
  double v189;
  void *v190;
  double v191;
  NSArray *v192;
  NSArray *directionsDestinationAddressStrings;
  void *v195;
  _BOOL4 v196;
  void *v197;
  char v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  id v203;
  id v204;
  id v205;
  void *v206;
  void *v207;
  NSArray *obj;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  _BYTE v218[128];
  uint64_t v219;

  v3 = a3;
  v219 = *MEMORY[0x1E0C80C00];
  LODWORD(v5) = objc_msgSend((id)objc_opt_class(), "isValidMapURL:", self->_url);
  if (!(_DWORD)v5)
    return (char)v5;
  v205 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  self->_exactPositionSpecified = 0;
  self->_centerCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
  self->_searchCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
  self->_searchRegion.center = ($AB5116BA7E623E054F959CECB034F4E7)kGEOCoordinateRegionInvalid;
  __asm { FMOV            V9.2S, #-1.0 }
  *(_QWORD *)&self->_zoomLevel = _D9;
  self->_searchRegion.span = ($2AEA816EAF9616B0E64737FB4BB06332)unk_189CCD5A0;
  *(_QWORD *)&self->_mapType = 0x4FFFFFFFFLL;
  userSessionEntity = self->_userSessionEntity;
  self->_userSessionEntity = 0;

  *(_OWORD *)&self->_altitude = 0u;
  self->_tester = 0;
  *(_OWORD *)&self->_tilt = 0u;
  contentProvider = self->_contentProvider;
  self->_contentProvider = 0;

  contentProviderID = self->_contentProviderID;
  self->_contentProviderID = 0;

  lineName = self->_lineName;
  self->_lineName = 0;

  self->_lineMUID = 0;
  self->_favoritesType = 0;
  v15 = (void *)MEMORY[0x1E0CB3998];
  -[NSURL absoluteString](self->_url, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "queryItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count"))
  {
    objc_msgSend(v17, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length") && objc_msgSend(v19, "containsString:", CFSTR("=")))
    {
      -[NSURL absoluteString](self->_url, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v3;
      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("maps:"), CFSTR("maps:?"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("maps:??"), CFSTR("maps:?"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "queryItems");
      v25 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v25;
      v17 = v24;
      v3 = v21;
    }

  }
  v198 = (char)v5;
  v197 = v17;
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  obj = v18;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v213, v218, 16);
  if (!v26)
  {
    v201 = 0;
    v202 = 0;
    v199 = 0;
    v200 = 0;
    v206 = 0;
    v207 = 0;
    goto LABEL_176;
  }
  v27 = v26;
  v201 = 0;
  v202 = 0;
  v199 = 0;
  v200 = 0;
  v206 = 0;
  v207 = 0;
  v28 = *(_QWORD *)v214;
  *(double *)&v29 = 180.0;
  *(double *)&v30 = -90.0;
  *(double *)&v31 = 90.0;
  v32 = 2.0;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v214 != v28)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * v33);
      objc_msgSend(v34, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lowercaseString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "value");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37 && objc_msgSend(v37, "length"))
      {
        if (objc_msgSend(v36, "isEqualToString:", CFSTR("label")))
        {
          objc_msgSend(v34, "_geo_unescapedValue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "length"))
          {
            v40 = (NSString *)objc_msgSend(v39, "copy");
            label = self->_label;
            self->_label = v40;

          }
        }
        if (objc_msgSend(v36, "isEqualToString:", CFSTR("trackingmode")))
        {
          self->_trackingModeSpecified = 1;
          objc_msgSend(v34, "value");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          self->_trackingMode = objc_msgSend(v42, "integerValue");

          if (self->_trackingMode >= 3)
            self->_trackingMode = 0;
        }
        else if (objc_msgSend(v36, "isEqualToString:", CFSTR("t")))
        {
          objc_msgSend(v34, "value");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "characterAtIndex:", 0);

          switch(v44)
          {
            case 'd':
              v45 = 4;
              goto LABEL_34;
            case 'e':
            case 'f':
            case 'g':
            case 'i':
            case 'j':
            case 'l':
              goto LABEL_33;
            case 'h':
              v51 = 2;
              goto LABEL_37;
            case 'k':
              v51 = 1;
              goto LABEL_37;
            case 'm':
              self->_mapType = 0;
              break;
            default:
              if (v44 == 114)
              {
                v51 = 3;
LABEL_37:
                self->_mapType = v51;
              }
              else
              {
LABEL_33:
                v45 = -1;
LABEL_34:
                self->_mapType = v45;
              }
              break;
          }
        }
        else
        {
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("q")))
          {
            objc_msgSend(v34, "_geo_unescapedValue");
            v46 = (id)objc_claimAutoreleasedReturnValue();
            v47 = (NSString *)objc_msgSend(v46, "copy");
            searchQuery = self->_searchQuery;
            self->_searchQuery = v47;
LABEL_26:

LABEL_27:
            goto LABEL_52;
          }
          if ((objc_msgSend(v36, "isEqualToString:", CFSTR("near")) & 1) != 0
            || objc_msgSend(v36, "isEqualToString:", CFSTR("hnear")))
          {
            objc_msgSend(v34, "value");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "componentsSeparatedByString:", CFSTR(","));
            v50 = objc_claimAutoreleasedReturnValue();

            v207 = (void *)v50;
            goto LABEL_52;
          }
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("ll")))
          {
            objc_msgSend(v34, "value");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "componentsSeparatedByString:", CFSTR(","));
            v53 = objc_claimAutoreleasedReturnValue();

            v206 = (void *)v53;
            goto LABEL_52;
          }
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("z")))
          {
            objc_msgSend(v34, "value");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v54, "length"))
            {
              objc_msgSend(v54, "floatValue");
              v56 = v55;
              v57 = 31.0;
              if (v56 < 31.0)
                objc_msgSend(v54, "floatValue");
              if (v57 < v32)
                v57 = v32;
              self->_zoomLevel = v57;
            }
            goto LABEL_51;
          }
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("cd")))
          {
            objc_msgSend(v34, "value");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v54, "length"))
            {
              objc_msgSend(v54, "floatValue");
              self->_cameraDistance = v58;
            }
            goto LABEL_51;
          }
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("spn")))
          {
            objc_msgSend(v34, "value");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "componentsSeparatedByString:", CFSTR(","));
            v60 = objc_claimAutoreleasedReturnValue();

            v201 = (void *)v60;
            goto LABEL_52;
          }
          if (v3)
          {
            if (objc_msgSend(v36, "isEqualToString:", CFSTR("abpersonid")))
            {
              objc_msgSend(v34, "value");
              v46 = (id)objc_claimAutoreleasedReturnValue();
              v61 = (NSString *)objc_msgSend(v46, "copy");
              searchQuery = self->_abRecordID;
              self->_abRecordID = v61;
              goto LABEL_26;
            }
            if (objc_msgSend(v36, "isEqualToString:", CFSTR("abaddressid")))
            {
              objc_msgSend(v34, "value");
              v46 = (id)objc_claimAutoreleasedReturnValue();
              v62 = (NSString *)objc_msgSend(v46, "copy");
              searchQuery = self->_abAddressID;
              self->_abAddressID = v62;
              goto LABEL_26;
            }
            if (objc_msgSend(v36, "isEqualToString:", CFSTR("cncontactidentifier")))
            {
              objc_msgSend(v34, "value");
              v46 = (id)objc_claimAutoreleasedReturnValue();
              v63 = (NSString *)objc_msgSend(v46, "copy");
              searchQuery = self->_cnContactIdentifier;
              self->_cnContactIdentifier = v63;
              goto LABEL_26;
            }
            if (objc_msgSend(v36, "isEqualToString:", CFSTR("cnaddressidentifier")))
            {
              objc_msgSend(v34, "value");
              v46 = (id)objc_claimAutoreleasedReturnValue();
              v64 = (NSString *)objc_msgSend(v46, "copy");
              searchQuery = self->_cnAddressIdentifier;
              self->_cnAddressIdentifier = v64;
              goto LABEL_26;
            }
          }
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("address")))
          {
            objc_msgSend(v34, "_geo_unescapedValue");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v54, "length"))
            {
              v65 = (NSString *)objc_msgSend(v54, "copy");
              addressString = self->_addressString;
              self->_addressString = v65;
              goto LABEL_68;
            }
            goto LABEL_51;
          }
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("saddr")))
          {
            objc_msgSend(v34, "_geo_unescapedValue");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = (NSString *)objc_msgSend(v67, "copy");
            directionsSourceAddressString = self->_directionsSourceAddressString;
            self->_directionsSourceAddressString = v68;

            if (self->_transportType == 4 && -[NSString length](self->_directionsSourceAddressString, "length"))
              self->_transportType = -1;
          }
          else
          {
            if (objc_msgSend(v36, "isEqualToString:", CFSTR("daddr")))
            {
              objc_msgSend(v34, "_geo_unescapedValue");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "componentsSeparatedByString:", CFSTR(" to:"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v54, "count"))
              {
                v196 = v3;
                if (!v205)
                  v205 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v211 = 0u;
                v212 = 0u;
                v209 = 0u;
                v210 = 0u;
                v195 = v54;
                v203 = v54;
                v71 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v209, v217, 16);
                if (v71)
                {
                  v72 = v71;
                  v73 = *(_QWORD *)v210;
                  do
                  {
                    for (i = 0; i != v72; ++i)
                    {
                      if (*(_QWORD *)v210 != v73)
                        objc_enumerationMutation(v203);
                      v75 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * i);
                      if (objc_msgSend(v75, "length"))
                        objc_msgSend(v205, "addObject:", v75);
                    }
                    v72 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v209, v217, 16);
                  }
                  while (v72);
                }

                if (self->_transportType == 4)
                {
                  v3 = v196;
                  if (objc_msgSend(v205, "count"))
                    self->_transportType = -1;
                }
                else
                {
                  v3 = v196;
                }
                v54 = v195;
              }
              goto LABEL_51;
            }
            if (objc_msgSend(v36, "isEqualToString:", CFSTR("dirflg")))
            {
              objc_msgSend(v34, "value");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v76, "characterAtIndex:", 0);

              if (v77 > 113)
              {
                if (v77 == 114)
                {
                  v80 = 1;
                }
                else
                {
                  if (v77 != 119)
                    goto LABEL_52;
                  v80 = 2;
                }
                goto LABEL_109;
              }
              if (v77 == 99)
              {
                v80 = 3;
LABEL_109:
                self->_transportType = v80;
                goto LABEL_52;
              }
              if (v77 == 100)
                self->_transportType = 0;
            }
            else if (objc_msgSend(v36, "isEqualToString:", CFSTR("sll")))
            {
              objc_msgSend(v34, "value");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "componentsSeparatedByString:", CFSTR(","));
              v79 = objc_claimAutoreleasedReturnValue();

              v199 = (void *)v79;
            }
            else if (objc_msgSend(v36, "isEqualToString:", CFSTR("sspn")))
            {
              objc_msgSend(v34, "value");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "componentsSeparatedByString:", CFSTR(","));
              v82 = objc_claimAutoreleasedReturnValue();

              v200 = (void *)v82;
            }
            else
            {
              if (objc_msgSend(v36, "isEqualToString:", CFSTR("placeid")))
              {
                objc_msgSend(v34, "_geo_unescapedValue");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v54, "length"))
                {
                  v83 = -[GEOMapItemIdentifier initWithMapsIdentifierString:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifierString:", v54);
                  if (-[GEOMapItemIdentifier isValid](v83, "isValid"))
                    v84 = -[GEOMapItemIdentifier muid](v83, "muid");
                  else
                    v84 = 1;
                  self->_searchUID = v84;

                }
                goto LABEL_51;
              }
              if (objc_msgSend(v36, "isEqualToString:", CFSTR("lsp")))
              {
                objc_msgSend(v34, "value");
                v46 = (id)objc_claimAutoreleasedReturnValue();
                self->_searchProviderID = objc_msgSend(v46, "intValue");
                goto LABEL_27;
              }
              if (objc_msgSend(v36, "isEqualToString:", CFSTR("auid")))
              {
                objc_msgSend(v34, "value");
                v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                self->_searchUID = strtoull((const char *)objc_msgSend(v46, "UTF8String"), 0, 0);
                goto LABEL_27;
              }
              if (objc_msgSend(v36, "isEqualToString:", CFSTR("cp")))
              {
                objc_msgSend(v34, "_geo_unescapedValue");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v54, "length"))
                {
                  v85 = (NSString *)objc_msgSend(v54, "copy");
                  addressString = self->_contentProvider;
                  self->_contentProvider = v85;
                  goto LABEL_68;
                }
                goto LABEL_51;
              }
              if (objc_msgSend(v36, "isEqualToString:", CFSTR("cpid")))
              {
                objc_msgSend(v34, "_geo_unescapedValue");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v54, "length"))
                {
                  v86 = (NSString *)objc_msgSend(v54, "copy");
                  addressString = self->_contentProviderID;
                  self->_contentProviderID = v86;
LABEL_68:

                }
LABEL_51:

                goto LABEL_52;
              }
              v204 = (id)v31;
              v87 = *(double *)&v30;
              v88 = *(double *)&v29;
              if (objc_msgSend(v36, "isEqualToString:", CFSTR("user_session_entity")))
              {
                v89 = self->_userSessionEntity;
                if (!v89)
                {
                  v90 = objc_alloc_init(GEOUserSessionEntity);
                  v91 = self->_userSessionEntity;
                  self->_userSessionEntity = v90;

                  v89 = self->_userSessionEntity;
                }
                objc_msgSend(v34, "value");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                -[GEOUserSessionEntity updateWithSessionEntityString:](v89, "updateWithSessionEntityString:", v92);

              }
              else
              {
                +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_msgSend(v93, "isMuninEnabled");

                if (v94 && objc_msgSend(&unk_1E1E85468, "containsObject:", v36))
                {
                  -[GEOMapURLParser restoreCodableOfClass:queryItem:key:compressedKey:](self, "restoreCodableOfClass:queryItem:key:compressedKey:", objc_opt_class(), v34, CFSTR("_mvs"), CFSTR("_mvsc"));
                  v95 = (GEOMuninViewState *)objc_claimAutoreleasedReturnValue();
                  muninViewState = self->_muninViewState;
                  self->_muninViewState = v95;

                }
                if (objc_msgSend(v36, "isEqualToString:", CFSTR("cam")))
                {
                  objc_msgSend(v34, "value");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "componentsSeparatedByString:", CFSTR(","));
                  v98 = objc_claimAutoreleasedReturnValue();

                  v202 = (void *)v98;
                }
                else
                {
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("lineid")))
                  {
                    objc_msgSend(v34, "value");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    self->_lineMUID = objc_msgSend(v99, "longLongValue");

                  }
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("name")))
                  {
                    objc_msgSend(v34, "_geo_unescapedValue");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v100, "length"))
                    {
                      v101 = (NSString *)objc_msgSend(v100, "copy");
                      v102 = self->_lineName;
                      self->_lineName = v101;

                    }
                  }
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("showfavorites")))
                  {
                    objc_msgSend(v34, "_geo_unescapedValue");
                    v103 = (id)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v103, "isEqual:", CFSTR("pl")) & 1) != 0)
                    {
                      v104 = 1;
                    }
                    else if (objc_msgSend(v103, "isEqual:", CFSTR("tl")))
                    {
                      v104 = 2;
                    }
                    else
                    {
                      v104 = 0;
                    }

                    self->_favoritesType = v104;
                  }
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("tester")))
                  {
                    objc_msgSend(v34, "value");
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    v106 = objc_msgSend(v105, "isEqualToString:", CFSTR("tester"));

                    if ((v106 & 1) != 0)
                    {
                      self->_tester = 1;

                      v139 = v207;
                      directionsDestinationAddressStrings = obj;
                      v138 = v205;
                      v5 = v197;
                      v143 = v201;
                      v145 = v199;
                      goto LABEL_209;
                    }
                  }
                  if (objc_msgSend(&unk_1E1E85480, "containsObject:", v36))
                  {
                    -[GEOMapURLParser restoreCodableOfClass:queryItem:key:compressedKey:](self, "restoreCodableOfClass:queryItem:key:compressedKey:", objc_opt_class(), v34, CFSTR("_ext"), CFSTR("_extc"));
                    v107 = (GEOURLExtraStorage *)objc_claimAutoreleasedReturnValue();
                    extraStorage = self->_extraStorage;
                    self->_extraStorage = v107;

                  }
                  if (objc_msgSend(&unk_1E1E85498, "containsObject:", v36))
                  {
                    -[GEOMapURLParser restoreCodableOfClass:queryItem:key:compressedKey:](self, "restoreCodableOfClass:queryItem:key:compressedKey:", objc_opt_class(), v34, CFSTR("_col"), CFSTR("_colc"));
                    v109 = (GEOURLCollectionStorage *)objc_claimAutoreleasedReturnValue();
                    collectionStorage = self->_collectionStorage;
                    self->_collectionStorage = v109;

                  }
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("ug")))
                  {
                    -[GEOMapURLParser restoreCodableOfClass:queryItem:key:compressedKey:](self, "restoreCodableOfClass:queryItem:key:compressedKey:", objc_opt_class(), v34, CFSTR("ug"), 0);
                    v111 = (GEOURLCollectionStorage *)objc_claimAutoreleasedReturnValue();
                    v112 = self->_collectionStorage;
                    self->_collectionStorage = v111;

                  }
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("pg")))
                  {
                    objc_msgSend(v34, "value");
                    v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    self->_curatedCollectionMUID = strtoull((const char *)objc_msgSend(v113, "UTF8String"), 0, 0);

                  }
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("pp")))
                  {
                    objc_msgSend(v34, "value");
                    v114 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    self->_publisherMUID = strtoull((const char *)objc_msgSend(v114, "UTF8String"), 0, 0);

                  }
                  if (objc_msgSend(&unk_1E1E854B0, "containsObject:", v36))
                  {
                    -[GEOMapURLParser restoreCodableOfClass:queryItem:key:compressedKey:](self, "restoreCodableOfClass:queryItem:key:compressedKey:", objc_opt_class(), v34, CFSTR("_ei"), CFSTR("_eic"));
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v115)
                    {
                      v116 = -[GEOEnrichmentInfo initWithEnrichmentInfo:]([GEOEnrichmentInfo alloc], "initWithEnrichmentInfo:", v115);
                      enrichmentInfo = self->_enrichmentInfo;
                      self->_enrichmentInfo = v116;

                    }
                  }
                  if (objc_msgSend(v36, "isEqualToString:", CFSTR("_odr")))
                  {
                    objc_msgSend(v34, "value");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v118, "componentsSeparatedByString:", CFSTR(","));
                    v119 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v119, "count") == 4)
                    {
                      objc_msgSend(v119, "objectAtIndex:", 0);
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v120, "doubleValue");
                      v122 = v121;
                      objc_msgSend(v119, "objectAtIndex:", 1);
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v123, "doubleValue");
                      v125 = v124;

                      objc_msgSend(v119, "objectAtIndex:", 2);
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v126, "doubleValue");
                      v128 = v127;
                      objc_msgSend(v119, "objectAtIndex:", 3);
                      v129 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v129, "doubleValue");
                      v131 = v130;

                      if (v125 >= -180.0
                        && v125 <= v88
                        && v122 >= v87
                        && v122 <= *(double *)&v204
                        && v131 >= -180.0
                        && v131 <= v88
                        && v128 >= v87
                        && v128 <= *(double *)&v204)
                      {
                        v132 = objc_alloc_init(GEOMapRegion);
                        -[GEOMapRegion setNorthLat:](v132, "setNorthLat:", v122);
                        -[GEOMapRegion setWestLng:](v132, "setWestLng:", v125);
                        -[GEOMapRegion setSouthLat:](v132, "setSouthLat:", v128);
                        -[GEOMapRegion setEastLng:](v132, "setEastLng:", v131);
                        objc_storeStrong((id *)&self->_offlineDownloadRegion, v132);

                      }
                    }

                  }
                }
              }
              *(double *)&v29 = v88;
              *(double *)&v30 = v87;
              v31 = (uint64_t)v204;
              v32 = 2.0;
            }
          }
        }
      }
LABEL_52:

      ++v33;
    }
    while (v33 != v27);
    v133 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v213, v218, 16);
    v27 = v133;
  }
  while (v133);
LABEL_176:

  v5 = v197;
  objc_msgSend(v197, "host");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "lowercaseString");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v135, "isEqualToString:", CFSTR("guides.apple.com")) & 1) != 0)
  {
    objc_msgSend(v197, "path");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v136, "hasPrefix:", CFSTR("/all"));

    v138 = v205;
    v139 = v207;
    if (v137)
      self->_showAllCuratedCollections = 1;
  }
  else
  {

    v138 = v205;
    v139 = v207;
  }
  objc_msgSend(v197, "path");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = objc_msgSend(v140, "isEqualToString:", CFSTR("/car/destinations"));

  if (v141)
    self->_showCarDestinations = 1;
  v142 = objc_msgSend(v206, "count");
  self->_exactPositionSpecified = v142 == 2;
  v143 = v201;
  if (v142 != 2)
  {
    v144 = self->_searchQuery;
    v145 = v199;
    if (!v144)
      goto LABEL_191;
    -[NSString componentsSeparatedByString:](v144, "componentsSeparatedByString:", CFSTR("@"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v146, "count") == 2)
    {
      objc_msgSend(v146, "objectAtIndex:", 1);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "componentsSeparatedByString:", CFSTR(","));
      v148 = (void *)objc_claimAutoreleasedReturnValue();

      v145 = v199;
      self->_exactPositionSpecified = objc_msgSend(v148, "count") == 2;
      v206 = v148;
    }

    if (!self->_exactPositionSpecified)
      goto LABEL_191;
  }
  objc_msgSend(v206, "objectAtIndex:", 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "doubleValue");
  v151 = v150;
  objc_msgSend(v206, "objectAtIndex:", 1);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "doubleValue");
  self->_centerCoordinate.latitude = v151;
  self->_centerCoordinate.longitude = v153;

  if (self->_zoomLevel == -1.0 && objc_msgSend(v201, "count") == 2)
  {
    objc_msgSend(v201, "objectAtIndex:", 0);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "doubleValue");
    v156 = v155;
    objc_msgSend(v201, "objectAtIndex:", 1);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "doubleValue");
    self->_span.latitudeDelta = v156;
    self->_span.longitudeDelta = v158;

  }
  v145 = v199;
  if (!self->_exactPositionSpecified)
LABEL_191:
    *(_QWORD *)&self->_zoomLevel = _D9;
  if (objc_msgSend(v145, "count") != 2)
  {
    -[NSString componentsSeparatedByString:](self->_searchQuery, "componentsSeparatedByString:", CFSTR("@"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v159, "count") == 2)
    {
      objc_msgSend(v159, "objectAtIndex:", 1);
      v160 = v145;
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "componentsSeparatedByString:", CFSTR(","));
      v162 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v159, "objectAtIndex:", 0);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = (NSString *)objc_msgSend(v163, "copy");
      v165 = self->_searchQuery;
      self->_searchQuery = v164;

      v145 = (id)v162;
    }
    if (objc_msgSend(v145, "count") != 2)
    {
      v166 = v139;
      v167 = v145;
      v145 = v166;

    }
  }
  if (objc_msgSend(v145, "count") == 2)
  {
    objc_msgSend(v145, "objectAtIndex:", 0);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v145;
    objc_msgSend(v145, "objectAtIndex:", 1);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "doubleValue");
    v172 = v171;
    objc_msgSend(v170, "doubleValue");
    self->_searchCoordinate.latitude = v172;
    self->_searchCoordinate.longitude = v173;
    if (objc_msgSend(v200, "count") == 2)
    {
      objc_msgSend(v200, "objectAtIndex:", 0);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "doubleValue");
      v176 = v175;
      objc_msgSend(v200, "objectAtIndex:", 1);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "doubleValue");
      v179 = v178;

      v143 = v201;
      self->_searchRegion.center = self->_searchCoordinate;
      self->_searchRegion.span.latitudeDelta = v176;
      self->_searchRegion.span.longitudeDelta = v179;
    }

    v145 = v169;
  }
  if (objc_msgSend(v202, "count") == 3)
  {
    v180 = v145;
    v181 = 0;
    v182 = 2;
    v183 = 1;
    goto LABEL_206;
  }
  if (objc_msgSend(v202, "count") == 4)
  {
    v180 = v145;
    objc_msgSend(v202, "objectAtIndex:", 0);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "doubleValue");
    self->_altitude = v185;

    v182 = 3;
    v183 = 2;
    v181 = 1;
LABEL_206:
    objc_msgSend(v202, "objectAtIndex:", v181);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "doubleValue");
    self->_rotation = v187;

    objc_msgSend(v202, "objectAtIndex:", v183);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "doubleValue");
    self->_tilt = v189;

    objc_msgSend(v202, "objectAtIndex:", v182);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "doubleValue");
    self->_roll = v191;

    v145 = v180;
  }
  if (objc_msgSend(v138, "count"))
  {
    v192 = (NSArray *)objc_msgSend(v138, "copy");
    directionsDestinationAddressStrings = self->_directionsDestinationAddressStrings;
    self->_directionsDestinationAddressStrings = v192;
LABEL_209:

  }
  LOBYTE(v5) = v198;
  return (char)v5;
}

- (id)restoreCodableOfClass:(Class)a3 queryItem:(id)a4 key:(id)a5 compressedKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  uint64_t v20;
  uLongf v21;
  Bytef *v22;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
    goto LABEL_8;
  v15 = 0;
  if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) || !v14)
    goto LABEL_9;
  if (!objc_msgSend(v14, "length"))
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v13, "isEqualToString:", v9))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 0);
    v15 = (void *)objc_msgSend([a3 alloc], "initWithData:", v16);

    if (!v10)
      goto LABEL_9;
  }
  else
  {
    v15 = 0;
    if (!v10)
      goto LABEL_9;
  }
  if (objc_msgSend(v13, "isEqualToString:", v10))
  {
    v21 = 0;
    v22 = 0;
    v18 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 0));
    GEOZlibUncompress((const Bytef *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), &v22, &v21);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v22, v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend([a3 alloc], "initWithData:", v19);

      v15 = (void *)v20;
    }

  }
LABEL_9:

  return v15;
}

- (NSString)directionsDestinationAddressString
{
  void *v2;
  void *v3;

  -[GEOMapURLParser directionsDestinationAddressStrings](self, "directionsDestinationAddressStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)mapType
{
  return self->_mapType;
}

- (int)transportType
{
  return self->_transportType;
}

- (int)trackingMode
{
  return self->_trackingMode;
}

- (BOOL)trackingModeSpecified
{
  return self->_trackingModeSpecified;
}

- (BOOL)exactPositionSpecified
{
  return self->_exactPositionSpecified;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_centerCoordinate.latitude;
  longitude = self->_centerCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)span
{
  double latitudeDelta;
  double longitudeDelta;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitudeDelta = self->_span.latitudeDelta;
  longitudeDelta = self->_span.longitudeDelta;
  result.var1 = longitudeDelta;
  result.var0 = latitudeDelta;
  return result;
}

- (float)zoomLevel
{
  return self->_zoomLevel;
}

- (float)cameraDistance
{
  return self->_cameraDistance;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (NSString)directionsSourceAddressString
{
  return self->_directionsSourceAddressString;
}

- (NSArray)directionsDestinationAddressStrings
{
  return self->_directionsDestinationAddressStrings;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (NSString)label
{
  return self->_label;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)searchCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_searchCoordinate.latitude;
  longitude = self->_searchCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($140BDABED96B4E653C9F0DB440664A5C)searchRegion
{
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  $140BDABED96B4E653C9F0DB440664A5C result;

  latitude = self->_searchRegion.center.latitude;
  longitude = self->_searchRegion.center.longitude;
  latitudeDelta = self->_searchRegion.span.latitudeDelta;
  longitudeDelta = self->_searchRegion.span.longitudeDelta;
  result.var1.var1 = longitudeDelta;
  result.var1.var0 = latitudeDelta;
  result.var0.var1 = longitude;
  result.var0.var0 = latitude;
  return result;
}

- (int)searchProviderID
{
  return self->_searchProviderID;
}

- (unint64_t)searchUID
{
  return self->_searchUID;
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (NSString)contentProviderID
{
  return self->_contentProviderID;
}

- (NSString)abRecordID
{
  return self->_abRecordID;
}

- (NSString)abAddressID
{
  return self->_abAddressID;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (NSString)cnAddressIdentifier
{
  return self->_cnAddressIdentifier;
}

- (GEOUserSessionEntity)userSessionEntity
{
  return self->_userSessionEntity;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)rotation
{
  return self->_rotation;
}

- (double)tilt
{
  return self->_tilt;
}

- (double)roll
{
  return self->_roll;
}

- (unint64_t)lineMUID
{
  return self->_lineMUID;
}

- (NSString)lineName
{
  return self->_lineName;
}

- (int64_t)favoritesType
{
  return self->_favoritesType;
}

- (BOOL)tester
{
  return self->_tester;
}

- (GEOURLCollectionStorage)collectionStorage
{
  return self->_collectionStorage;
}

- (GEOURLExtraStorage)extraStorage
{
  return self->_extraStorage;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (BOOL)showCarDestinations
{
  return self->_showCarDestinations;
}

- (unint64_t)curatedCollectionMUID
{
  return self->_curatedCollectionMUID;
}

- (unint64_t)publisherMUID
{
  return self->_publisherMUID;
}

- (BOOL)showAllCuratedCollections
{
  return self->_showAllCuratedCollections;
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return self->_enrichmentInfo;
}

- (GEOMapRegion)offlineDownloadRegion
{
  return self->_offlineDownloadRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDownloadRegion, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_extraStorage, 0);
  objc_storeStrong((id *)&self->_collectionStorage, 0);
  objc_storeStrong((id *)&self->_lineName, 0);
  objc_storeStrong((id *)&self->_userSessionEntity, 0);
  objc_storeStrong((id *)&self->_cnAddressIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_abAddressID, 0);
  objc_storeStrong((id *)&self->_abRecordID, 0);
  objc_storeStrong((id *)&self->_contentProviderID, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_directionsDestinationAddressStrings, 0);
  objc_storeStrong((id *)&self->_directionsSourceAddressString, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
