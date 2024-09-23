@implementation MKSizedTransitArtwork

- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4
{
  return -[MKSizedTransitArtwork initWithArtwork:shieldSize:artworkCache:](self, "initWithArtwork:shieldSize:artworkCache:", a3, a4, 0);
}

- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4 artworkCache:(id)a5
{
  return -[MKSizedTransitArtwork initWithArtwork:shieldSize:fallbackShieldSize:artworkCache:](self, "initWithArtwork:shieldSize:fallbackShieldSize:artworkCache:", a3, a4, a4, a5);
}

- (MKSizedTransitArtwork)initWithArtwork:(id)a3 shieldSize:(int64_t)a4 fallbackShieldSize:(int64_t)a5 artworkCache:(id)a6
{
  id v11;
  id v12;
  MKSizedTransitArtwork *v13;
  MKSizedTransitArtwork *v14;
  MKArtworkDataSourceCache *v15;
  MKArtworkDataSourceCache *artworkCache;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MKSizedTransitArtwork;
  v13 = -[MKSizedTransitArtwork init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_artwork, a3);
    v14->_shieldSize = a4;
    v14->_fallbackShieldSize = a5;
    if (v12)
    {
      v15 = (MKArtworkDataSourceCache *)v12;
    }
    else
    {
      +[MKArtworkDataSourceCache sharedInstance](MKArtworkDataSourceCache, "sharedInstance");
      v15 = (MKArtworkDataSourceCache *)objc_claimAutoreleasedReturnValue();
    }
    artworkCache = v14->_artworkCache;
    v14->_artworkCache = v15;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[MKSizedTransitArtwork isEqualToTransitArtworkViewMode:](self, "isEqualToTransitArtworkViewMode:", v4);

  return v5;
}

- (BOOL)isEqualToTransitArtworkViewMode:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  BOOL v13;
  BOOL v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  _BOOL4 v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  _BOOL4 v45;
  BOOL v46;
  uint64_t v47;
  void *v48;
  void *v49;
  BOOL v50;
  BOOL v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  BOOL v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  BOOL v71;
  void *v72;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  void *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  char v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  BOOL v99;
  BOOL v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t i;
  unint64_t v106;
  uint64_t v107;
  void *v108;
  char v109;
  BOOL v111;
  BOOL v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  unint64_t v118;
  uint64_t v119;
  void *v120;
  char v121;
  BOOL v122;
  BOOL v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t k;
  void *v129;
  int v130;
  void *v131;
  unint64_t v132;
  void *v133;
  id v134;
  void *v135;
  char v136;
  id v137;
  id v138;
  void *v139;
  unint64_t obj;
  id obja;
  id objb;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  unint64_t v147;
  int v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  unint64_t v160;
  unint64_t v161;
  void *v162;
  unint64_t v163;
  void *v164;
  void *v165;
  unint64_t v166;
  void *v167;
  void *v168;
  unint64_t v169;
  void *v170;
  int v171;
  void *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "shieldSize");
  if (v6 == -[MKSizedTransitArtwork shieldSize](self, "shieldSize"))
  {
    objc_msgSend(v5, "artwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSizedTransitArtwork artwork](self, "artwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = (void *)v10;
    v12 = (v9 | v10) == 0;
    if (!(v9 | v10))
      goto LABEL_142;
    v13 = v9 != 0;
    if (v10)
    {
      v13 = 0;
      v14 = v9 == 0;
    }
    else
    {
      v14 = 0;
    }
    if (v14 || v13)
      goto LABEL_142;
    v15 = objc_msgSend((id)v9, "artworkSourceType");
    if (v15 != objc_msgSend(v11, "artworkSourceType")
      || (v16 = objc_msgSend((id)v9, "artworkUseType"), v16 != objc_msgSend(v11, "artworkUseType")))
    {

      v12 = 0;
LABEL_143:

      goto LABEL_144;
    }
    objc_msgSend((id)v9, "shieldDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shieldDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    v20 = v18;
    v21 = (void *)v20;
    if (!(v19 | v20))
    {
LABEL_11:
      objc_msgSend((id)v9, "iconDataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "iconDataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22;
      v25 = v23;
      v26 = (void *)v25;
      if (v24 | v25)
      {
        v50 = v24 != 0;
        if (v25)
        {
          v50 = 0;
          v51 = v24 == 0;
        }
        else
        {
          v51 = 0;
        }
        if (v51
          || v50
          || (v52 = objc_msgSend((id)v24, "iconType"), v52 != objc_msgSend(v26, "iconType"))
          || (v53 = objc_msgSend((id)v24, "cartoID"), v53 != objc_msgSend(v26, "cartoID"))
          || (v54 = objc_msgSend((id)v24, "defaultTransitType"),
              v54 != objc_msgSend(v26, "defaultTransitType"))
          || (v55 = objc_msgSend((id)v24, "iconAttributeKey"), v55 != objc_msgSend(v26, "iconAttributeKey")))
        {

LABEL_98:
          v12 = 0;
LABEL_140:

          goto LABEL_141;
        }
        v56 = objc_msgSend((id)v24, "iconAttributeValue");
        v57 = objc_msgSend(v26, "iconAttributeValue");

        if (v56 != v57)
          goto LABEL_98;
      }
      objc_msgSend((id)v9, "iconFallbackShieldDataSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "iconFallbackShieldDataSource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27;
      v30 = v28;
      v31 = (void *)v30;
      if (!(v29 | v30))
        goto LABEL_13;
      v58 = v29 != 0;
      if (v30)
      {
        v58 = 0;
        v59 = v29 == 0;
      }
      else
      {
        v59 = 0;
      }
      if (!v59 && !v58)
      {
        v60 = objc_msgSend((id)v29, "shieldType");
        if (v60 == objc_msgSend(v31, "shieldType"))
        {
          objc_msgSend((id)v29, "shieldText");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v167)
          {
            objc_msgSend(v31, "shieldText");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v150)
            {
              v155 = v26;
              v159 = (void *)v29;
              v150 = 0;
              v65 = 0;
              objc_msgSend(v159, "shieldColorString");
              goto LABEL_107;
            }
          }
          objc_msgSend((id)v29, "shieldText");
          v61 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "shieldText");
          v62 = objc_claimAutoreleasedReturnValue();
          v151 = (void *)v61;
          v63 = (void *)v61;
          v64 = (void *)v62;
          if ((objc_msgSend(v63, "isEqualToString:", v62) & 1) != 0)
          {
            v155 = v26;
            v159 = (void *)v29;
            v65 = 1;
            v145 = v64;
            objc_msgSend(v159, "shieldColorString");
LABEL_107:
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            if (v94 || (objc_msgSend(v31, "shieldColorString"), (v143 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v148 = v65;
              objc_msgSend(v159, "shieldColorString");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = v31;
              objc_msgSend(v31, "shieldColorString");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = objc_msgSend(v95, "isEqualToString:", v96);

              if (v94)
              {

                v31 = v172;
                v97 = v65;
                if (!v148)
                  goto LABEL_112;
                goto LABEL_111;
              }
              v31 = v172;
              v97 = v65;
              LOBYTE(v65) = v148;
              v98 = (void *)v143;
            }
            else
            {
              v98 = 0;
              v97 = 1;
            }

            if ((v65 & 1) == 0)
            {
LABEL_112:
              if (v167)
              {

                v29 = (unint64_t)v159;
                v26 = v155;
                if (!v97)
                  goto LABEL_97;
              }
              else
              {

                v29 = (unint64_t)v159;
                v26 = v155;
                if ((v97 & 1) == 0)
                  goto LABEL_97;
              }
LABEL_13:
              v170 = v31;
              objc_msgSend((id)v9, "textDataSource");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "textDataSource");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v32;
              v35 = v33;
              v36 = (void *)v35;
              v169 = v24;
              if (!(v34 | v35))
                goto LABEL_21;
              v37 = v34 != 0;
              if (v35)
              {
                v37 = 0;
                v38 = v34 == 0;
              }
              else
              {
                v38 = 0;
              }
              if (v38 || v37)
              {

LABEL_64:
                v40 = v36;
LABEL_138:
                v12 = 0;
                goto LABEL_139;
              }
              objc_msgSend((id)v34, "text");
              v165 = (void *)v34;
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "text");
              v40 = v36;
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v39;
              v43 = v41;
              if (!(v42 | v43))
              {

                v34 = (unint64_t)v165;
                v36 = v40;
                goto LABEL_21;
              }
              v69 = (void *)v43;
              v153 = v40;
              v70 = v42 != 0;
              if (v43)
              {
                v70 = 0;
                v71 = v42 == 0;
              }
              else
              {
                v71 = 0;
              }
              if (v71 || v70)
              {

                v34 = (unint64_t)v165;
              }
              else
              {
                v146 = (void *)v42;
                objc_msgSend((id)v42, "formatStrings");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = v69;
                objc_msgSend(v69, "formatStrings");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = v72;
                v75 = v73;
                v76 = (void *)v75;
                v139 = (void *)v74;
                if (!(v74 | v75))
                {
                  v150 = (void *)v75;
                  goto LABEL_75;
                }
                v99 = v74 != 0;
                if (v75)
                {
                  v99 = 0;
                  v100 = v74 == 0;
                }
                else
                {
                  v100 = 0;
                }
                if (!v100 && !v99)
                {
                  v101 = objc_msgSend((id)v74, "count");
                  v14 = v101 == objc_msgSend(v76, "count");
                  v74 = (unint64_t)v139;
                  if (v14)
                  {
                    v150 = v76;
                    v158 = v26;
                    v163 = v29;
                    v175 = 0u;
                    v176 = 0u;
                    v173 = 0u;
                    v174 = 0u;
                    obja = v139;
                    v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
                    if (v102)
                    {
                      v103 = v102;
                      v104 = 0;
                      v149 = *(_QWORD *)v174;
                      while (2)
                      {
                        for (i = 0; i != v103; ++i)
                        {
                          if (*(_QWORD *)v174 != v149)
                            objc_enumerationMutation(obja);
                          v106 = *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * i);
                          objc_msgSend(v150, "objectAtIndexedSubscript:", v104 + i);
                          v107 = objc_claimAutoreleasedReturnValue();
                          if (v106 | v107)
                          {
                            v108 = (void *)v107;
                            v109 = objc_msgSend((id)v106, "isEqual:", v107);

                            if ((v109 & 1) == 0)
                            {

                              v76 = v150;
                              v26 = v158;
                              v29 = v163;
                              goto LABEL_136;
                            }
                          }
                        }
                        v104 += i;
                        v103 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
                        if (v103)
                          continue;
                        break;
                      }
                    }

                    v26 = v158;
                    v29 = v163;
LABEL_75:
                    objc_msgSend(v146, "separators");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v144, "separators");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v79 = v77;
                    v147 = v78;
                    v157 = v26;
                    v161 = v29;
                    if (v79 | v147)
                    {
                      v111 = v79 != 0;
                      if (v147)
                      {
                        v111 = 0;
                        v112 = v79 == 0;
                      }
                      else
                      {
                        v112 = 0;
                      }
                      if (v112
                        || v111
                        || (v135 = (void *)v79,
                            v113 = objc_msgSend((id)v79, "count"),
                            v14 = v113 == objc_msgSend((id)v147, "count"),
                            v79 = (unint64_t)v135,
                            !v14))
                      {

                        goto LABEL_190;
                      }
                      v175 = 0u;
                      v176 = 0u;
                      v173 = 0u;
                      v174 = 0u;
                      v137 = v135;
                      v114 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
                      if (v114)
                      {
                        v115 = v114;
                        v116 = 0;
                        objb = *(id *)v174;
                        while (2)
                        {
                          for (j = 0; j != v115; ++j)
                          {
                            if (*(id *)v174 != objb)
                              objc_enumerationMutation(v137);
                            v118 = *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * j);
                            objc_msgSend((id)v147, "objectAtIndexedSubscript:", v116 + j);
                            v119 = objc_claimAutoreleasedReturnValue();
                            if (v118 | v119)
                            {
                              v120 = (void *)v119;
                              v121 = objc_msgSend((id)v118, "isEqual:", v119);

                              if ((v121 & 1) == 0)
                              {
                                v131 = v137;

LABEL_188:
                                goto LABEL_189;
                              }
                            }
                          }
                          v116 += j;
                          v115 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
                          if (v115)
                            continue;
                          break;
                        }
                      }

                    }
                    else
                    {
                      v135 = (void *)v79;
                    }
                    objc_msgSend(v146, "formatTokens");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v144, "formatTokens");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    v82 = v80;
                    obj = v81;
                    if (!(v82 | obj))
                    {
                      v132 = v82;
                      goto LABEL_79;
                    }
                    v122 = v82 != 0;
                    if (obj)
                    {
                      v122 = 0;
                      v123 = v82 == 0;
                    }
                    else
                    {
                      v123 = 0;
                    }
                    if (!v123 && !v122)
                    {
                      v124 = objc_msgSend((id)v82, "count");
                      if (v124 == objc_msgSend((id)obj, "count"))
                      {
                        v175 = 0u;
                        v176 = 0u;
                        v173 = 0u;
                        v174 = 0u;
                        v132 = v82;
                        v134 = (id)v82;
                        v125 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
                        if (v125)
                        {
                          v126 = v125;
                          v127 = 0;
                          v138 = *(id *)v174;
                          while (2)
                          {
                            for (k = 0; k != v126; ++k)
                            {
                              if (*(id *)v174 != v138)
                                objc_enumerationMutation(v134);
                              objc_msgSend((id)obj, "objectAtIndexedSubscript:", v127 + k, v132);
                              v129 = (void *)objc_claimAutoreleasedReturnValue();
                              v130 = GEOServerFormatTokenEqual();

                              if (!v130)
                              {
                                v131 = v134;

                                goto LABEL_188;
                              }
                            }
                            v127 += k;
                            v126 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v173, v177, 16);
                            if (v126)
                              continue;
                            break;
                          }
                        }

LABEL_79:
                        objc_msgSend(v146, "alternativeString", v132);
                        v83 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v144, "alternativeString");
                        v84 = objc_claimAutoreleasedReturnValue();
                        if (v83 | v84)
                          v136 = objc_msgSend((id)v83, "isEqual:", v84);
                        else
                          v136 = 1;

                        v36 = v153;
                        v34 = (unint64_t)v165;

                        v26 = v157;
                        v29 = v161;
                        if ((v136 & 1) != 0)
                        {
LABEL_21:
                          v166 = v34;
                          v44 = objc_msgSend((id)v9, "hasRoutingIncidentBadge");
                          if (v44 != objc_msgSend(v11, "hasRoutingIncidentBadge"))
                          {
                            v40 = v36;
                            v12 = 0;
                            v34 = v166;
LABEL_139:

                            v24 = v169;
                            goto LABEL_140;
                          }
                          v152 = v36;
                          objc_msgSend((id)v9, "accessibilityText");
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v66
                            || (objc_msgSend(v11, "accessibilityText"),
                                (v150 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                          {
                            v156 = v26;
                            v160 = v29;
                            objc_msgSend((id)v9, "accessibilityText");
                            v67 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v11, "accessibilityText");
                            v68 = (void *)objc_claimAutoreleasedReturnValue();
                            v12 = objc_msgSend(v67, "isEqualToString:", v68);

                            if (v66)
                            {

                              v26 = v156;
                              v29 = v160;
LABEL_105:
                              v34 = v166;
                              v40 = v152;
                              goto LABEL_139;
                            }
                            v26 = v156;
                            v29 = v160;
                            v92 = v150;
                          }
                          else
                          {
                            v92 = 0;
                            v12 = 1;
                          }

                          goto LABEL_105;
                        }
                        goto LABEL_64;
                      }
                    }

LABEL_189:
                    v79 = (unint64_t)v135;
LABEL_190:

                    v40 = v153;
                    v34 = (unint64_t)v165;

                    v12 = 0;
                    v26 = v157;
                    v29 = v161;
                    goto LABEL_139;
                  }
                }

LABEL_136:
                v34 = (unint64_t)v165;

                v40 = v153;
              }

              goto LABEL_138;
            }
LABEL_111:

            goto LABEL_112;
          }

          v93 = v150;
          if (v167)
            v93 = v167;

        }
      }

LABEL_97:
      goto LABEL_98;
    }
    v45 = v19 != 0;
    if (v20)
    {
      v45 = 0;
      v46 = v19 == 0;
    }
    else
    {
      v46 = 0;
    }
    if (!v46 && !v45)
    {
      v47 = objc_msgSend((id)v19, "shieldType");
      if (v47 == objc_msgSend(v21, "shieldType"))
      {
        objc_msgSend((id)v19, "shieldText");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v48)
        {
          objc_msgSend(v21, "shieldText");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v164)
          {
            v164 = 0;
            v171 = 0;
            goto LABEL_82;
          }
        }
        objc_msgSend((id)v19, "shieldText");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "shieldText");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v49, "isEqualToString:", v3) & 1) != 0)
        {
          v168 = v49;
          v171 = 1;
LABEL_82:
          v162 = v3;
          objc_msgSend((id)v19, "shieldColorString");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (v85 || (objc_msgSend(v21, "shieldColorString"), (v154 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend((id)v19, "shieldColorString");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "shieldColorString");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v86, "isEqualToString:", v87);

            if (v85)
            {

              v89 = v168;
              if (!v171)
                goto LABEL_87;
              goto LABEL_86;
            }
            v89 = v168;
            v90 = v171;
            v91 = (void *)v154;
          }
          else
          {
            v91 = 0;
            v88 = 1;
            v89 = v168;
            v90 = v171;
          }

          if ((v90 & 1) == 0)
          {
LABEL_87:
            if (!v48)

            if ((v88 & 1) != 0)
              goto LABEL_11;
LABEL_67:
            v12 = 0;
LABEL_141:

LABEL_142:
            goto LABEL_143;
          }
LABEL_86:

          goto LABEL_87;
        }

        if (v48)
        else

      }
    }

    goto LABEL_67;
  }
  v12 = 0;
LABEL_144:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = 2654435761 * -[MKSizedTransitArtwork shieldSize](self, "shieldSize");
  v32 = 2654435761 * -[MKSizedTransitArtwork fallbackShieldSize](self, "fallbackShieldSize");
  -[MKSizedTransitArtwork artwork](self, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 2654435761 * (int)objc_msgSend(v3, "artworkSourceType");
  objc_msgSend(v3, "shieldDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 2654435761 * objc_msgSend(v4, "shieldType");
  objc_msgSend(v4, "shieldText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v5, "hash");
  objc_msgSend(v4, "shieldColorString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v6, "hash");

  objc_msgSend(v3, "iconDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 2654435761 * (int)objc_msgSend(v7, "iconType");
  v26 = 2654435761 * objc_msgSend(v7, "cartoID");
  v25 = 2654435761 * objc_msgSend(v7, "defaultTransitType");
  v24 = 2654435761 * objc_msgSend(v7, "iconAttributeKey");
  v23 = 2654435761 * objc_msgSend(v7, "iconAttributeValue");
  objc_msgSend(v3, "iconFallbackShieldDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 2654435761 * objc_msgSend(v8, "shieldType");
  objc_msgSend(v8, "shieldText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v9, "hash");
  objc_msgSend(v8, "shieldColorString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v10, "hash");

  objc_msgSend(v3, "textDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");

  v14 = 2654435761 * (int)objc_msgSend(v3, "artworkUseType");
  if (objc_msgSend(v3, "hasRoutingIncidentBadge"))
    v15 = 2654435761;
  else
    v15 = 0;
  objc_msgSend(v3, "accessibilityText", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v13 ^ v14 ^ v15 ^ v17;
}

- (id)imageToDisplayWithScreenScale:(double)a3 nightMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  -[MKSizedTransitArtwork artwork](self, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MKTransitArtworkDataSourceAllowMasking(v7);

  -[MKSizedTransitArtwork artworkCache](self, "artworkCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageForSizedArtwork:scale:nightMode:", self, v4, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  return v10;
}

- (id)badgeImageToDisplayWithScreenScale:(double)a3 nightMode:(BOOL)a4
{
  void *v4;
  void *v5;

  -[MKSizedTransitArtwork artwork](self, "artwork", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasRoutingIncidentBadge"))
  {
    MKTransitIncidentIcon();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (int64_t)fallbackShieldSize
{
  return self->_fallbackShieldSize;
}

- (MKArtworkDataSourceCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
