@implementation GEOPDPlaceCollection

+ (id)collectionComponentsForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__GEOPDPlaceCollection_PlaceDataExtras__collectionComponentsForPlaceData___block_invoke;
  v10[3] = &unk_1E1C098A8;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateComponentOfType:enumerationOptions:usingBlock:", 65, 1, v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __74__GEOPDPlaceCollection_PlaceDataExtras__collectionComponentsForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[GEOPDComponent values](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (v9 && *(_QWORD *)(v9 + 392))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v3, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)collectionTitle
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollection displayTitles]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)collectionLongTitle
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollection longTitles]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)collectionDescription
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollection collectionDescriptions]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)collectionHTMLDescription
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollection collectionDescriptionHtmls]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)publisherDescriptionOfCollectionItem
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollection collectionItemDescriptions]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)publisherHTMLDescriptionOfCollectionItem
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollection collectionItemDescriptionHtmls]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[GEOPDPlaceCollection _readCollectionId](result);
    if ((objc_msgSend(*(id *)(v3 + 80), "hasGreenTeaWithValue:", a2) & 1) == 0)
    {
      -[GEOPDPlaceCollection _readItemIds](v3);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v4 = *(id *)(v3 + 112);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v19;
LABEL_5:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2) & 1) != 0)
            break;
          if (v6 == ++v8)
          {
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
            if (v6)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        -[GEOPDPlaceCollection _readPlaceCollectionItems](v3);
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v4 = *(id *)(v3 + 176);
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (!v9)
        {
LABEL_20:

          -[GEOPDPlaceCollection _readPublisher](v3);
          if ((-[GEOPDPublisher hasGreenTeaWithValue:](*(_QWORD *)(v3 + 192), a2) & 1) == 0)
          {
            -[GEOPDPlaceCollection _readPublisherId](v3);
            return objc_msgSend(*(id *)(v3 + 184), "hasGreenTeaWithValue:", a2);
          }
          return 1;
        }
        v10 = v9;
        v11 = *(_QWORD *)v15;
LABEL_13:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v4);
          v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if (v13)
          {
            -[GEOPDPlaceCollectionItem _readItemId](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
            if ((objc_msgSend(*(id *)(v13 + 56), "hasGreenTeaWithValue:", a2, (_QWORD)v14) & 1) != 0)
              break;
          }
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            if (v10)
              goto LABEL_13;
            goto LABEL_20;
          }
        }
      }

    }
    return 1;
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
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
  uint64_t i5;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i6;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
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
  uint64_t v97;
  id obj;
  uint64_t v99;
  uint64_t v100;
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
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  uint64_t v191;

  v191 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x10u;
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDPlaceCollection readAll:](a1, 0);
      v168 = 0u;
      v167 = 0u;
      v166 = 0u;
      v165 = 0u;
      v5 = *(id *)(a1 + 104);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v165, v189, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v166;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v166 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * i), "clearUnknownFields:", 1);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v165, v189, 16);
        }
        while (v7);
      }

      v164 = 0u;
      v162 = 0u;
      v163 = 0u;
      v161 = 0u;
      v10 = *(id *)(a1 + 72);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v161, v188, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v162;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v162 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * j), "clearUnknownFields:", 1);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v161, v188, 16);
        }
        while (v12);
      }

      v159 = 0u;
      v160 = 0u;
      v157 = 0u;
      v158 = 0u;
      v15 = *(id *)(a1 + 168);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v157, v187, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v158;
        do
        {
          for (k = 0; k != v17; ++k)
          {
            if (*(_QWORD *)v158 != v18)
              objc_enumerationMutation(v15);
            -[GEOPDCaptionedPhoto clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * k));
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v157, v187, 16);
        }
        while (v17);
      }

      objc_msgSend(*(id *)(a1 + 80), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 184), "clearUnknownFields:", 1);
      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      v20 = *(id *)(a1 + 176);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v153, v186, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v154;
        do
        {
          for (m = 0; m != v22; ++m)
          {
            if (*(_QWORD *)v154 != v23)
              objc_enumerationMutation(v20);
            -[GEOPDPlaceCollectionItem clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * m));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v153, v186, 16);
        }
        while (v22);
      }

      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v25 = *(id *)(a1 + 200);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v149, v185, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v150;
        do
        {
          for (n = 0; n != v27; ++n)
          {
            if (*(_QWORD *)v150 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * n), "clearUnknownFields:", 1);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v149, v185, 16);
        }
        while (v27);
      }

      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v30 = *(id *)(a1 + 112);
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v145, v184, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v146;
        do
        {
          for (ii = 0; ii != v32; ++ii)
          {
            if (*(_QWORD *)v146 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * ii), "clearUnknownFields:", 1);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v145, v184, 16);
        }
        while (v32);
      }

      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v35 = *(id *)(a1 + 40);
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v141, v183, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v142;
        do
        {
          for (jj = 0; jj != v37; ++jj)
          {
            if (*(_QWORD *)v142 != v38)
              objc_enumerationMutation(v35);
            objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * jj), "clearUnknownFields:", 1);
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v141, v183, 16);
        }
        while (v37);
      }

      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v40 = *(id *)(a1 + 48);
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v137, v182, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v138;
        do
        {
          for (kk = 0; kk != v42; ++kk)
          {
            if (*(_QWORD *)v138 != v43)
              objc_enumerationMutation(v40);
            objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * kk), "clearUnknownFields:", 1);
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v137, v182, 16);
        }
        while (v42);
      }

      -[GEOPDPublisher clearUnknownFields:](*(_QWORD *)(a1 + 192));
      -[GEOPDCaptionedPhoto clearUnknownFields:](*(_QWORD *)(a1 + 32));
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      v45 = *(id *)(a1 + 56);
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v133, v181, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v134;
        do
        {
          for (mm = 0; mm != v47; ++mm)
          {
            if (*(_QWORD *)v134 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * mm), "clearUnknownFields:", 1);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v133, v181, 16);
        }
        while (v47);
      }

      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v50 = *(id *)(a1 + 64);
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v129, v180, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v130;
        do
        {
          for (nn = 0; nn != v52; ++nn)
          {
            if (*(_QWORD *)v130 != v53)
              objc_enumerationMutation(v50);
            objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * nn), "clearUnknownFields:", 1);
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v129, v180, 16);
        }
        while (v52);
      }

      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v55 = *(id *)(a1 + 96);
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v125, v179, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v126;
        do
        {
          for (i1 = 0; i1 != v57; ++i1)
          {
            if (*(_QWORD *)v126 != v58)
              objc_enumerationMutation(v55);
            objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * i1), "clearUnknownFields:", 1);
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v125, v179, 16);
        }
        while (v57);
      }

      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v60 = *(id *)(a1 + 88);
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v121, v178, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v122;
        do
        {
          for (i2 = 0; i2 != v62; ++i2)
          {
            if (*(_QWORD *)v122 != v63)
              objc_enumerationMutation(v60);
            objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i2), "clearUnknownFields:", 1);
          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v121, v178, 16);
        }
        while (v62);
      }

      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v65 = *(id *)(a1 + 144);
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v117, v177, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v118;
        do
        {
          for (i3 = 0; i3 != v67; ++i3)
          {
            if (*(_QWORD *)v118 != v68)
              objc_enumerationMutation(v65);
            objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i3), "clearUnknownFields:", 1);
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v117, v177, 16);
        }
        while (v67);
      }

      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v70 = *(id *)(a1 + 136);
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v113, v176, 16);
      if (v71)
      {
        v72 = v71;
        v73 = *(_QWORD *)v114;
        do
        {
          for (i4 = 0; i4 != v72; ++i4)
          {
            if (*(_QWORD *)v114 != v73)
              objc_enumerationMutation(v70);
            objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i4), "clearUnknownFields:", 1);
          }
          v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v113, v176, 16);
        }
        while (v72);
      }

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v97 = a1;
      obj = *(id *)(a1 + 152);
      v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v175, 16);
      if (v100)
      {
        v99 = *(_QWORD *)v110;
        do
        {
          for (i5 = 0; i5 != v100; ++i5)
          {
            if (*(_QWORD *)v110 != v99)
              objc_enumerationMutation(obj);
            v76 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i5);
            if (v76)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v76 + 76) |= 4u;
              *(_BYTE *)(v76 + 76) |= 0x80u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v76 + 64));
              v77 = *(void **)(v76 + 16);
              *(_QWORD *)(v76 + 16) = 0;

              -[GEOPDMediaLink readAll:](v76, 0);
              v172 = 0u;
              v171 = 0u;
              v170 = 0u;
              v169 = 0u;
              v78 = *(id *)(v76 + 48);
              v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v169, v190, 16);
              if (v79)
              {
                v80 = v79;
                v81 = *(_QWORD *)v170;
                do
                {
                  for (i6 = 0; i6 != v80; ++i6)
                  {
                    if (*(_QWORD *)v170 != v81)
                      objc_enumerationMutation(v78);
                    v83 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * i6);
                    if (v83)
                    {
                      os_unfair_lock_lock_with_options();
                      *(_BYTE *)(v83 + 52) |= 1u;
                      *(_BYTE *)(v83 + 52) |= 8u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v83 + 48));
                      v84 = *(void **)(v83 + 16);
                      *(_QWORD *)(v83 + 16) = 0;

                      -[GEOPDThirdPartyLink readAll:](v83, 0);
                    }
                  }
                  v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v169, v190, 16);
                }
                while (v80);
              }

              v85 = *(_QWORD *)(v76 + 32);
              if (v85)
              {
                v86 = *(void **)(v85 + 8);
                *(_QWORD *)(v85 + 8) = 0;

              }
            }
          }
          v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v175, 16);
        }
        while (v100);
      }

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v87 = *(id *)(v97 + 120);
      v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v105, v174, 16);
      if (v88)
      {
        v89 = v88;
        v90 = *(_QWORD *)v106;
        do
        {
          for (i7 = 0; i7 != v89; ++i7)
          {
            if (*(_QWORD *)v106 != v90)
              objc_enumerationMutation(v87);
            -[GEOPDCaptionedPhoto clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i7));
          }
          v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v105, v174, 16);
        }
        while (v89);
      }

      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v92 = *(id *)(v97 + 128);
      v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v101, v173, 16);
      if (v93)
      {
        v94 = v93;
        v95 = *(_QWORD *)v102;
        do
        {
          for (i8 = 0; i8 != v94; ++i8)
          {
            if (*(_QWORD *)v102 != v95)
              objc_enumerationMutation(v92);
            objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i8), "clearUnknownFields:", 1, v97);
          }
          v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v101, v173, 16);
        }
        while (v94);
      }

    }
  }
}

- (GEOPDPlaceCollection)init
{
  GEOPDPlaceCollection *v2;
  GEOPDPlaceCollection *v3;
  GEOPDPlaceCollection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceCollection;
  v2 = -[GEOPDPlaceCollection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceCollection)initWithData:(id)a3
{
  GEOPDPlaceCollection *v3;
  GEOPDPlaceCollection *v4;
  GEOPDPlaceCollection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceCollection;
  v3 = -[GEOPDPlaceCollection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayTitles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayTitles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)displayTitles
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readDisplayTitles]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (void)addDisplayTitle:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readDisplayTitles]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsDisplayTitle:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x8000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsDisplayTitle:(uint64_t)a1
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

- (void)_readCollectionDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionDescriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionDescriptions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readCollectionDescriptions]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)addCollectionDescription:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readCollectionDescriptions]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionDescription:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x800u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionDescription:(uint64_t)a1
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

- (void)_readPhotos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 242) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotos_tags_5461);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)photos
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readPhotos]((uint64_t)a1);
    a1 = (id *)v1[21];
  }
  return a1;
}

- (void)addPhoto:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readPhotos]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsPhoto:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x400000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsPhoto:(uint64_t)a1
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

- (void)_readCollectionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionId_tags_5462);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readCollectionId]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)setCollectionId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x1000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)_readPublisherId
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
  if ((*(_BYTE *)(a1 + 243) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherId_tags_0);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
}

- (void)setPublisherId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x1000000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 184), a2);

}

- (void)_readPlaceCollectionItems
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
  if ((*(_BYTE *)(a1 + 242) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCollectionItems_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
}

- (void)addPlaceCollectionItem:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readPlaceCollectionItems]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsPlaceCollectionItem:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x800000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsPlaceCollectionItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addSpokenTitle:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 243) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenTitles_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsSpokenTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x4000000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsSpokenTitle:(uint64_t)a1
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

- (void)_readItemIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 242) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItemIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)itemIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readItemIds]((uint64_t)a1);
    a1 = (id *)v1[14];
  }
  return a1;
}

- (void)addItemId:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readItemIds]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsItemId:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x10000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsItemId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addCollectionClassDisplayName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 240) & 0x80) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionClassDisplayNames_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsCollectionClassDisplayName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionClassDisplayName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addCollectionClassSpokenName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 1) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionClassSpokenNames_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsCollectionClassSpokenName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionClassSpokenName:(uint64_t)a1
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

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 243) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_5463);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)url
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readUrl]((uint64_t)a1);
    a1 = (id *)v1[26];
  }
  return a1;
}

- (void)setUrl:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x8000000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 208), a2);

}

- (void)_readAuthorName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 240) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthorName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)authorName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readAuthorName]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setAuthorName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x20u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readPublisher
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 243) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisher_tags_5464);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)publisher
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readPublisher]((uint64_t)a1);
    a1 = (id *)v1[24];
  }
  return a1;
}

- (void)setPublisher:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x2000000u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 192), a2);

}

- (void)_readAuthorPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 240) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthorPhoto_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)authorPhoto
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readAuthorPhoto]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setAuthorPhoto:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 240) |= 0x40u;
  *(_DWORD *)(a1 + 240) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (os_unfair_lock_s)errorState
{
  os_unfair_lock_s *v1;
  uint32_t os_unfair_lock_opaque;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_opaque = v1[60]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 56);
    if ((os_unfair_lock_opaque & 2) != 0)
      return (os_unfair_lock_s *)v1[57]._os_unfair_lock_opaque;
    else
      return 0;
  }
  return result;
}

- (void)addCollectionDescriptionBytes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionDescriptionBytes_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsCollectionDescriptionBytes:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionDescriptionBytes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readCollectionDescriptionHtmls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionDescriptionHtmls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionDescriptionHtmls
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readCollectionDescriptionHtmls]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addCollectionDescriptionHtml:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readCollectionDescriptionHtmls]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionDescriptionHtml:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionDescriptionHtml:(uint64_t)a1
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

- (void)_readCollectionItemDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionItemDescriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionItemDescriptions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readCollectionItemDescriptions]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)addCollectionItemDescription:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readCollectionItemDescriptions]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionItemDescription:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x4000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionItemDescription:(uint64_t)a1
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

- (void)_readCollectionItemDescriptionHtmls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 241) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionItemDescriptionHtmls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)collectionItemDescriptionHtmls
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readCollectionItemDescriptionHtmls]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)addCollectionItemDescriptionHtml:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readCollectionItemDescriptionHtmls]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsCollectionItemDescriptionHtml:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x2000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsCollectionItemDescriptionHtml:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readLongTitles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 242) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLongTitles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)longTitles
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readLongTitles]((uint64_t)a1);
    a1 = (id *)v1[18];
  }
  return a1;
}

- (void)addLongTitle:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readLongTitles]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsLongTitle:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x100000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsLongTitle:(uint64_t)a1
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

- (void)addLongSpokenTitle:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 242) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLongSpokenTitles_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsLongSpokenTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x80000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsLongSpokenTitle:(uint64_t)a1
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

- (void)_readMediaLinks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 242) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMediaLinks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (id)mediaLinks
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollection _readMediaLinks]((uint64_t)a1);
    a1 = (id *)v1[19];
  }
  return a1;
}

- (void)addMediaLink:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollection _readMediaLinks]((uint64_t)a1);
    -[GEOPDPlaceCollection _addNoFlagsMediaLink:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[60]._os_unfair_lock_opaque |= 0x200000u;
    os_unfair_lock_unlock(a1 + 56);
    a1[60]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_addNoFlagsMediaLink:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 152);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = v5;

      v4 = *(void **)(a1 + 152);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addItemPhoto:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 242) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItemPhotos_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsItemPhoto:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsItemPhoto:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addLocalizedCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 242) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedCategorys_tags_5467);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    -[GEOPDPlaceCollection _addNoFlagsLocalizedCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 240) |= 0x40000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
    *(_DWORD *)(a1 + 240) |= 0x10000000u;
  }
}

- (void)_addNoFlagsLocalizedCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDPlaceCollection;
  -[GEOPDPlaceCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceCollection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceCollection _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  id v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  id v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  void *v65;
  id v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t jj;
  void *v76;
  id v77;
  const __CFString *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t kk;
  void *v85;
  id v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  void *v99;
  void *v100;
  const __CFString *v101;
  id v102;
  uint64_t v103;
  __CFString *v104;
  const __CFString *v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t mm;
  void *v112;
  id v113;
  const __CFString *v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t nn;
  void *v121;
  id v122;
  const __CFString *v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i1;
  void *v130;
  id v131;
  const __CFString *v132;
  void *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t i2;
  void *v139;
  id v140;
  const __CFString *v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t i3;
  void *v148;
  id v149;
  const __CFString *v150;
  void *v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t i4;
  void *v157;
  id v158;
  const __CFString *v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t i5;
  void *v166;
  id v167;
  const __CFString *v168;
  void *v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i6;
  void *v175;
  id v176;
  const __CFString *v177;
  void *v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t i7;
  void *v184;
  id v185;
  const __CFString *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  id v191;
  id v192;
  id v193;
  _QWORD v195[4];
  id v196;
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
  _BYTE v265[128];
  _BYTE v266[128];
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  _BYTE v272[128];
  _BYTE v273[128];
  _BYTE v274[128];
  _BYTE v275[128];
  _BYTE v276[128];
  _BYTE v277[128];
  _BYTE v278[128];
  _BYTE v279[128];
  _BYTE v280[128];
  _BYTE v281[128];
  uint64_t v282;

  v282 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDPlaceCollection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v261 = 0u;
    v262 = 0u;
    v263 = 0u;
    v264 = 0u;
    v6 = *(id *)(a1 + 104);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v261, v281, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v262;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v262 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v261 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v261, v281, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("displayTitle");
    else
      v13 = CFSTR("display_title");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v257 = 0u;
    v258 = 0u;
    v259 = 0u;
    v260 = 0u;
    v15 = *(id *)(a1 + 72);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v257, v280, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v258;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v258 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addObject:", v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v257, v280, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("collectionDescription");
    else
      v22 = CFSTR("collection_description");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 168), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 168), "count"));
    v253 = 0u;
    v254 = 0u;
    v255 = 0u;
    v256 = 0u;
    v24 = *(id *)(a1 + 168);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v253, v279, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v254;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v254 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v253 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "addObject:", v30);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v253, v279, 16);
      }
      while (v26);
    }

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("photo"));
  }
  -[GEOPDPlaceCollection collectionId]((id *)a1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("collectionId");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("collection_id");
    }
    v35 = v33;

    objc_msgSend(v4, "setObject:forKey:", v35, v34);
  }

  -[GEOPDPlaceCollection _readPublisherId](a1);
  v36 = *(id *)(a1 + 184);
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("publisherId");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("publisher_id");
    }
    v40 = v38;

    objc_msgSend(v4, "setObject:forKey:", v40, v39);
  }

  if (objc_msgSend(*(id *)(a1 + 176), "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    v249 = 0u;
    v250 = 0u;
    v251 = 0u;
    v252 = 0u;
    v42 = *(id *)(a1 + 176);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v249, v278, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v250;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v250 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v47, "jsonRepresentation");
          else
            objc_msgSend(v47, "dictionaryRepresentation");
          v48 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "addObject:", v48);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v249, v278, 16);
      }
      while (v44);
    }

    if (a2)
      v49 = CFSTR("placeCollectionItem");
    else
      v49 = CFSTR("place_collection_item");
    objc_msgSend(v4, "setObject:forKey:", v41, v49);

  }
  if (objc_msgSend(*(id *)(a1 + 200), "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 200), "count"));
    v245 = 0u;
    v246 = 0u;
    v247 = 0u;
    v248 = 0u;
    v51 = *(id *)(a1 + 200);
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v245, v277, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v246;
      do
      {
        for (n = 0; n != v53; ++n)
        {
          if (*(_QWORD *)v246 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v245 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v56, "jsonRepresentation");
          else
            objc_msgSend(v56, "dictionaryRepresentation");
          v57 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v50, "addObject:", v57);
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v245, v277, 16);
      }
      while (v53);
    }

    if (a2)
      v58 = CFSTR("spokenTitle");
    else
      v58 = CFSTR("spoken_title");
    objc_msgSend(v4, "setObject:forKey:", v50, v58);

  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v241 = 0u;
    v242 = 0u;
    v243 = 0u;
    v244 = 0u;
    v60 = *(id *)(a1 + 112);
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v241, v276, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v242;
      do
      {
        for (ii = 0; ii != v62; ++ii)
        {
          if (*(_QWORD *)v242 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v241 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v65, "jsonRepresentation");
          else
            objc_msgSend(v65, "dictionaryRepresentation");
          v66 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "addObject:", v66);
        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v241, v276, 16);
      }
      while (v62);
    }

    if (a2)
      v67 = CFSTR("itemId");
    else
      v67 = CFSTR("item_id");
    objc_msgSend(v4, "setObject:forKey:", v59, v67);

  }
  if ((*(_BYTE *)(a1 + 240) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 232));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v69 = CFSTR("numItems");
    else
      v69 = CFSTR("num_items");
    objc_msgSend(v4, "setObject:forKey:", v68, v69);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v237 = 0u;
    v238 = 0u;
    v239 = 0u;
    v240 = 0u;
    v71 = *(id *)(a1 + 40);
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v237, v275, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v238;
      do
      {
        for (jj = 0; jj != v73; ++jj)
        {
          if (*(_QWORD *)v238 != v74)
            objc_enumerationMutation(v71);
          v76 = *(void **)(*((_QWORD *)&v237 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v76, "jsonRepresentation");
          else
            objc_msgSend(v76, "dictionaryRepresentation");
          v77 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "addObject:", v77);
        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v237, v275, 16);
      }
      while (v73);
    }

    if (a2)
      v78 = CFSTR("collectionClassDisplayName");
    else
      v78 = CFSTR("collection_class_display_name");
    objc_msgSend(v4, "setObject:forKey:", v70, v78);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v236 = 0u;
    v80 = *(id *)(a1 + 48);
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v233, v274, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v234;
      do
      {
        for (kk = 0; kk != v82; ++kk)
        {
          if (*(_QWORD *)v234 != v83)
            objc_enumerationMutation(v80);
          v85 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v85, "jsonRepresentation");
          else
            objc_msgSend(v85, "dictionaryRepresentation");
          v86 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v79, "addObject:", v86);
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v233, v274, 16);
      }
      while (v82);
    }

    if (a2)
      v87 = CFSTR("collectionClassSpokenName");
    else
      v87 = CFSTR("collection_class_spoken_name");
    objc_msgSend(v4, "setObject:forKey:", v79, v87);

  }
  if ((*(_BYTE *)(a1 + 240) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 160));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v89 = CFSTR("modifiedTime");
    else
      v89 = CFSTR("modified_time");
    objc_msgSend(v4, "setObject:forKey:", v88, v89);

  }
  -[GEOPDPlaceCollection url]((id *)a1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
    objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("url"));

  -[GEOPDPlaceCollection authorName]((id *)a1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    if (a2)
      v92 = CFSTR("authorName");
    else
      v92 = CFSTR("author_name");
    objc_msgSend(v4, "setObject:forKey:", v91, v92);
  }

  -[GEOPDPlaceCollection publisher]((id *)a1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v93, "jsonRepresentation");
    else
      objc_msgSend(v93, "dictionaryRepresentation");
    v95 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("publisher"));
  }

  if ((*(_BYTE *)(a1 + 240) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 236));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v97 = CFSTR("enableFallbackImagesForItems");
    else
      v97 = CFSTR("enable_fallback_images_for_items");
    objc_msgSend(v4, "setObject:forKey:", v96, v97);

  }
  -[GEOPDPlaceCollection authorPhoto]((id *)a1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98;
  if (v98)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v98, "jsonRepresentation");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = CFSTR("authorPhoto");
    }
    else
    {
      objc_msgSend(v98, "dictionaryRepresentation");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = CFSTR("author_photo");
    }
    v102 = v100;

    objc_msgSend(v4, "setObject:forKey:", v102, v101);
  }

  if ((*(_BYTE *)(a1 + 240) & 2) != 0)
  {
    v103 = *(int *)(a1 + 228);
    if (v103 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 228));
      v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v104 = off_1E1C0C018[v103];
    }
    if (a2)
      v105 = CFSTR("errorState");
    else
      v105 = CFSTR("error_state");
    objc_msgSend(v4, "setObject:forKey:", v104, v105);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v232 = 0u;
    v107 = *(id *)(a1 + 56);
    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v229, v273, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v230;
      do
      {
        for (mm = 0; mm != v109; ++mm)
        {
          if (*(_QWORD *)v230 != v110)
            objc_enumerationMutation(v107);
          v112 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * mm);
          if ((a2 & 1) != 0)
            objc_msgSend(v112, "jsonRepresentation");
          else
            objc_msgSend(v112, "dictionaryRepresentation");
          v113 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v106, "addObject:", v113);
        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v229, v273, 16);
      }
      while (v109);
    }

    if (a2)
      v114 = CFSTR("collectionDescriptionBytes");
    else
      v114 = CFSTR("collection_description_bytes");
    objc_msgSend(v4, "setObject:forKey:", v106, v114);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v225 = 0u;
    v226 = 0u;
    v227 = 0u;
    v228 = 0u;
    v116 = *(id *)(a1 + 64);
    v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v225, v272, 16);
    if (v117)
    {
      v118 = v117;
      v119 = *(_QWORD *)v226;
      do
      {
        for (nn = 0; nn != v118; ++nn)
        {
          if (*(_QWORD *)v226 != v119)
            objc_enumerationMutation(v116);
          v121 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * nn);
          if ((a2 & 1) != 0)
            objc_msgSend(v121, "jsonRepresentation");
          else
            objc_msgSend(v121, "dictionaryRepresentation");
          v122 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v115, "addObject:", v122);
        }
        v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v225, v272, 16);
      }
      while (v118);
    }

    if (a2)
      v123 = CFSTR("collectionDescriptionHtml");
    else
      v123 = CFSTR("collection_description_html");
    objc_msgSend(v4, "setObject:forKey:", v115, v123);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    v224 = 0u;
    v125 = *(id *)(a1 + 96);
    v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v221, v271, 16);
    if (v126)
    {
      v127 = v126;
      v128 = *(_QWORD *)v222;
      do
      {
        for (i1 = 0; i1 != v127; ++i1)
        {
          if (*(_QWORD *)v222 != v128)
            objc_enumerationMutation(v125);
          v130 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * i1);
          if ((a2 & 1) != 0)
            objc_msgSend(v130, "jsonRepresentation");
          else
            objc_msgSend(v130, "dictionaryRepresentation");
          v131 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v124, "addObject:", v131);
        }
        v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v221, v271, 16);
      }
      while (v127);
    }

    if (a2)
      v132 = CFSTR("collectionItemDescription");
    else
      v132 = CFSTR("collection_item_description");
    objc_msgSend(v4, "setObject:forKey:", v124, v132);

  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v217 = 0u;
    v218 = 0u;
    v219 = 0u;
    v220 = 0u;
    v134 = *(id *)(a1 + 88);
    v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v217, v270, 16);
    if (v135)
    {
      v136 = v135;
      v137 = *(_QWORD *)v218;
      do
      {
        for (i2 = 0; i2 != v136; ++i2)
        {
          if (*(_QWORD *)v218 != v137)
            objc_enumerationMutation(v134);
          v139 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * i2);
          if ((a2 & 1) != 0)
            objc_msgSend(v139, "jsonRepresentation");
          else
            objc_msgSend(v139, "dictionaryRepresentation");
          v140 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v133, "addObject:", v140);
        }
        v136 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v217, v270, 16);
      }
      while (v136);
    }

    if (a2)
      v141 = CFSTR("collectionItemDescriptionHtml");
    else
      v141 = CFSTR("collection_item_description_html");
    objc_msgSend(v4, "setObject:forKey:", v133, v141);

  }
  if (objc_msgSend(*(id *)(a1 + 144), "count"))
  {
    v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v216 = 0u;
    v143 = *(id *)(a1 + 144);
    v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v213, v269, 16);
    if (v144)
    {
      v145 = v144;
      v146 = *(_QWORD *)v214;
      do
      {
        for (i3 = 0; i3 != v145; ++i3)
        {
          if (*(_QWORD *)v214 != v146)
            objc_enumerationMutation(v143);
          v148 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i3);
          if ((a2 & 1) != 0)
            objc_msgSend(v148, "jsonRepresentation");
          else
            objc_msgSend(v148, "dictionaryRepresentation");
          v149 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v142, "addObject:", v149);
        }
        v145 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v213, v269, 16);
      }
      while (v145);
    }

    if (a2)
      v150 = CFSTR("longTitle");
    else
      v150 = CFSTR("long_title");
    objc_msgSend(v4, "setObject:forKey:", v142, v150);

  }
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v151 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v209 = 0u;
    v210 = 0u;
    v211 = 0u;
    v212 = 0u;
    v152 = *(id *)(a1 + 136);
    v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v209, v268, 16);
    if (v153)
    {
      v154 = v153;
      v155 = *(_QWORD *)v210;
      do
      {
        for (i4 = 0; i4 != v154; ++i4)
        {
          if (*(_QWORD *)v210 != v155)
            objc_enumerationMutation(v152);
          v157 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * i4);
          if ((a2 & 1) != 0)
            objc_msgSend(v157, "jsonRepresentation");
          else
            objc_msgSend(v157, "dictionaryRepresentation");
          v158 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v151, "addObject:", v158);
        }
        v154 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v209, v268, 16);
      }
      while (v154);
    }

    if (a2)
      v159 = CFSTR("longSpokenTitle");
    else
      v159 = CFSTR("long_spoken_title");
    objc_msgSend(v4, "setObject:forKey:", v151, v159);

  }
  if (objc_msgSend(*(id *)(a1 + 152), "count"))
  {
    v160 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 152), "count"));
    v205 = 0u;
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v161 = *(id *)(a1 + 152);
    v162 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v205, v267, 16);
    if (v162)
    {
      v163 = v162;
      v164 = *(_QWORD *)v206;
      do
      {
        for (i5 = 0; i5 != v163; ++i5)
        {
          if (*(_QWORD *)v206 != v164)
            objc_enumerationMutation(v161);
          v166 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * i5);
          if ((a2 & 1) != 0)
            objc_msgSend(v166, "jsonRepresentation");
          else
            objc_msgSend(v166, "dictionaryRepresentation");
          v167 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v160, "addObject:", v167);
        }
        v163 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v205, v267, 16);
      }
      while (v163);
    }

    if (a2)
      v168 = CFSTR("mediaLink");
    else
      v168 = CFSTR("media_link");
    objc_msgSend(v4, "setObject:forKey:", v160, v168);

  }
  if (objc_msgSend(*(id *)(a1 + 120), "count"))
  {
    v169 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    v201 = 0u;
    v202 = 0u;
    v203 = 0u;
    v204 = 0u;
    v170 = *(id *)(a1 + 120);
    v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v201, v266, 16);
    if (v171)
    {
      v172 = v171;
      v173 = *(_QWORD *)v202;
      do
      {
        for (i6 = 0; i6 != v172; ++i6)
        {
          if (*(_QWORD *)v202 != v173)
            objc_enumerationMutation(v170);
          v175 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * i6);
          if ((a2 & 1) != 0)
            objc_msgSend(v175, "jsonRepresentation");
          else
            objc_msgSend(v175, "dictionaryRepresentation");
          v176 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v169, "addObject:", v176);
        }
        v172 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v201, v266, 16);
      }
      while (v172);
    }

    if (a2)
      v177 = CFSTR("itemPhoto");
    else
      v177 = CFSTR("item_photo");
    objc_msgSend(v4, "setObject:forKey:", v169, v177);

  }
  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v178 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v197 = 0u;
    v198 = 0u;
    v199 = 0u;
    v200 = 0u;
    v179 = *(id *)(a1 + 128);
    v180 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v197, v265, 16);
    if (v180)
    {
      v181 = v180;
      v182 = *(_QWORD *)v198;
      do
      {
        for (i7 = 0; i7 != v181; ++i7)
        {
          if (*(_QWORD *)v198 != v182)
            objc_enumerationMutation(v179);
          v184 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * i7);
          if ((a2 & 1) != 0)
            objc_msgSend(v184, "jsonRepresentation");
          else
            objc_msgSend(v184, "dictionaryRepresentation");
          v185 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v178, "addObject:", v185);
        }
        v181 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v197, v265, 16);
      }
      while (v181);
    }

    if (a2)
      v186 = CFSTR("localizedCategory");
    else
      v186 = CFSTR("localized_category");
    objc_msgSend(v4, "setObject:forKey:", v178, v186);

  }
  v187 = *(void **)(a1 + 16);
  if (v187)
  {
    objc_msgSend(v187, "dictionaryRepresentation");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = v188;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v188, "count"));
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v195[0] = MEMORY[0x1E0C809B0];
      v195[1] = 3221225472;
      v195[2] = __50__GEOPDPlaceCollection__dictionaryRepresentation___block_invoke;
      v195[3] = &unk_1E1C00600;
      v191 = v190;
      v196 = v191;
      objc_msgSend(v189, "enumerateKeysAndObjectsUsingBlock:", v195);
      v192 = v191;

      v189 = v192;
    }
    objc_msgSend(v4, "setObject:forKey:", v189, CFSTR("Unknown Fields"));

  }
  v193 = v4;

  return v193;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceCollection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5552;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5553;
      GEOPDPlaceCollectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPlaceCollectionCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

void __50__GEOPDPlaceCollection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (os_unfair_lock_s)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  os_unfair_lock_s *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEOLocalizedString *v15;
  GEOLocalizedString *v16;
  GEOLocalizedString *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  GEOLocalizedString *v26;
  GEOLocalizedString *v27;
  GEOLocalizedString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  GEOPDCaptionedPhoto *v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  GEOPDMapsIdentifier *v41;
  GEOPDMapsIdentifier *v42;
  GEOPDMapsIdentifier *v43;
  const __CFString *v44;
  void *v45;
  GEOPDMapsIdentifier *v46;
  GEOPDMapsIdentifier *v47;
  GEOPDMapsIdentifier *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  GEOPDPlaceCollectionItem *v57;
  void *v58;
  uint64_t v59;
  const __CFString *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  uint64_t v67;
  GEOLocalizedString *v68;
  GEOLocalizedString *v69;
  GEOLocalizedString *v70;
  const __CFString *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  uint64_t v78;
  GEOPDMapsIdentifier *v79;
  GEOPDMapsIdentifier *v80;
  GEOPDMapsIdentifier *v81;
  const __CFString *v82;
  void *v83;
  uint32_t v84;
  const __CFString *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t n;
  uint64_t v92;
  GEOLocalizedString *v93;
  GEOLocalizedString *v94;
  GEOLocalizedString *v95;
  const __CFString *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t ii;
  uint64_t v103;
  GEOLocalizedString *v104;
  GEOLocalizedString *v105;
  GEOLocalizedString *v106;
  const __CFString *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  GEOPDPublisher *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  char v120;
  const __CFString *v121;
  void *v122;
  GEOPDCaptionedPhoto *v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  id v127;
  int v128;
  const __CFString *v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t jj;
  uint64_t v136;
  GEOLocalizedBytes *v137;
  GEOLocalizedBytes *v138;
  GEOLocalizedBytes *v139;
  const __CFString *v140;
  void *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t kk;
  uint64_t v147;
  GEOLocalizedString *v148;
  GEOLocalizedString *v149;
  GEOLocalizedString *v150;
  const __CFString *v151;
  void *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t mm;
  uint64_t v158;
  GEOLocalizedString *v159;
  GEOLocalizedString *v160;
  GEOLocalizedString *v161;
  const __CFString *v162;
  void *v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t nn;
  uint64_t v169;
  GEOLocalizedString *v170;
  GEOLocalizedString *v171;
  GEOLocalizedString *v172;
  const __CFString *v173;
  void *v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t i1;
  uint64_t v180;
  GEOLocalizedString *v181;
  GEOLocalizedString *v182;
  GEOLocalizedString *v183;
  const __CFString *v184;
  void *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t i2;
  uint64_t v191;
  GEOLocalizedString *v192;
  GEOLocalizedString *v193;
  GEOLocalizedString *v194;
  const __CFString *v195;
  void *v196;
  void *v197;
  const __CFString *v198;
  const __CFString *v199;
  const __CFString *v200;
  const __CFString *v201;
  const __CFString *v202;
  const __CFString *v203;
  const __CFString *v204;
  const __CFString *v205;
  uint64_t v206;
  void *v207;
  GEOPDMediaLink *v208;
  GEOPDMediaLink *v209;
  id v210;
  GEOPDMediaLink *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  void *v215;
  id v216;
  void *v217;
  void *v218;
  void *v219;
  id v220;
  void *v221;
  void *v222;
  id v223;
  int v224;
  void *v225;
  id v226;
  int v227;
  void *v228;
  id v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t i3;
  void *v234;
  GEOPDThirdPartyLink *v235;
  id v236;
  void *v237;
  void *v238;
  id v239;
  void *v240;
  void *v241;
  id v242;
  void *v243;
  GEOPDMediaLinkPositionMetaData *v244;
  GEOPDMediaLinkPositionMetaData *v245;
  id v246;
  uint64_t v247;
  void *v248;
  int v249;
  void *v250;
  id v251;
  int v252;
  id v253;
  uint64_t v254;
  const __CFString *v255;
  void *v256;
  id v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  GEOPDCaptionedPhoto *v263;
  void *v264;
  uint64_t v265;
  const __CFString *v266;
  void *v267;
  id v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t i4;
  uint64_t v273;
  GEOLocalizedString *v274;
  GEOLocalizedString *v275;
  GEOLocalizedString *v276;
  void *v278;
  const __CFString *v279;
  const __CFString *v280;
  void *v281;
  const __CFString *v282;
  const __CFString *v283;
  const __CFString *v284;
  const __CFString *v285;
  const __CFString *v286;
  void *v287;
  os_unfair_lock_s *v288;
  id obj;
  uint64_t v290;
  uint64_t v291;
  int v292;
  void *v293;
  uint64_t v294;
  const __CFString *v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
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
  _BYTE v368[128];
  _BYTE v369[128];
  _BYTE v370[128];
  _BYTE v371[128];
  _BYTE v372[128];
  _BYTE v373[128];
  _BYTE v374[128];
  _BYTE v375[128];
  _BYTE v376[128];
  _BYTE v377[128];
  _BYTE v378[128];
  _BYTE v379[128];
  _BYTE v380[128];
  _BYTE v381[128];
  _BYTE v382[128];
  _BYTE v383[128];
  _BYTE v384[128];
  _BYTE v385[128];
  uint64_t v386;

  v386 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (os_unfair_lock_s *)(id)objc_msgSend(a1, "init");

  if (!v6)
    goto LABEL_486;
  if (a3)
    v7 = CFSTR("displayTitle");
  else
    v7 = CFSTR("display_title");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v363 = 0u;
    v362 = 0u;
    v361 = 0u;
    v360 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v360, v384, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v361;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v361 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v360 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v16 = -[GEOLocalizedString initWithJSON:](v15, "initWithJSON:", v14);
            else
              v16 = -[GEOLocalizedString initWithDictionary:](v15, "initWithDictionary:", v14);
            v17 = v16;
            -[GEOPDPlaceCollection addDisplayTitle:](v6, v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v360, v384, 16);
      }
      while (v11);
    }

  }
  if (a3)
    v18 = CFSTR("collectionDescription");
  else
    v18 = CFSTR("collection_description");
  objc_msgSend(v278, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v359 = 0u;
    v358 = 0u;
    v357 = 0u;
    v356 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v356, v383, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v357;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v357 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v356 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v27 = -[GEOLocalizedString initWithJSON:](v26, "initWithJSON:", v25);
            else
              v27 = -[GEOLocalizedString initWithDictionary:](v26, "initWithDictionary:", v25);
            v28 = v27;
            -[GEOPDPlaceCollection addCollectionDescription:](v6, v27);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v356, v383, 16);
      }
      while (v22);
    }

  }
  objc_msgSend(v278, "objectForKeyedSubscript:", CFSTR("photo"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v355 = 0u;
    v354 = 0u;
    v353 = 0u;
    v352 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v352, v382, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v353;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v353 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * v34);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = [GEOPDCaptionedPhoto alloc];
            if (v36)
              v37 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v36, v35, a3);
            else
              v37 = 0;
            -[GEOPDPlaceCollection addPhoto:](v6, v37);

          }
          ++v34;
        }
        while (v32 != v34);
        v38 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v352, v382, 16);
        v32 = v38;
      }
      while (v38);
    }

  }
  if (a3)
    v39 = CFSTR("collectionId");
  else
    v39 = CFSTR("collection_id");
  objc_msgSend(v278, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v42 = -[GEOPDMapsIdentifier initWithJSON:](v41, "initWithJSON:", v40);
    else
      v42 = -[GEOPDMapsIdentifier initWithDictionary:](v41, "initWithDictionary:", v40);
    v43 = v42;
    -[GEOPDPlaceCollection setCollectionId:]((uint64_t)v6, v42);

  }
  if (a3)
    v44 = CFSTR("publisherId");
  else
    v44 = CFSTR("publisher_id");
  objc_msgSend(v278, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v47 = -[GEOPDMapsIdentifier initWithJSON:](v46, "initWithJSON:", v45);
    else
      v47 = -[GEOPDMapsIdentifier initWithDictionary:](v46, "initWithDictionary:", v45);
    v48 = v47;
    -[GEOPDPlaceCollection setPublisherId:]((uint64_t)v6, v47);

  }
  if (a3)
    v49 = CFSTR("placeCollectionItem");
  else
    v49 = CFSTR("place_collection_item");
  objc_msgSend(v278, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v350 = 0u;
    v351 = 0u;
    v348 = 0u;
    v349 = 0u;
    v51 = v50;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v348, v381, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v349;
      do
      {
        v55 = 0;
        do
        {
          if (*(_QWORD *)v349 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v348 + 1) + 8 * v55);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v57 = [GEOPDPlaceCollectionItem alloc];
            if (v57)
              v58 = (void *)-[GEOPDPlaceCollectionItem _initWithDictionary:isJSON:](v57, v56, a3);
            else
              v58 = 0;
            -[GEOPDPlaceCollection addPlaceCollectionItem:](v6, v58);

          }
          ++v55;
        }
        while (v53 != v55);
        v59 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v348, v381, 16);
        v53 = v59;
      }
      while (v59);
    }

  }
  if (a3)
    v60 = CFSTR("spokenTitle");
  else
    v60 = CFSTR("spoken_title");
  objc_msgSend(v278, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v346 = 0u;
    v347 = 0u;
    v344 = 0u;
    v345 = 0u;
    v62 = v61;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v344, v380, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v345;
      do
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v345 != v65)
            objc_enumerationMutation(v62);
          v67 = *(_QWORD *)(*((_QWORD *)&v344 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v68 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v69 = -[GEOLocalizedString initWithJSON:](v68, "initWithJSON:", v67);
            else
              v69 = -[GEOLocalizedString initWithDictionary:](v68, "initWithDictionary:", v67);
            v70 = v69;
            -[GEOPDPlaceCollection addSpokenTitle:]((uint64_t)v6, v69);

          }
        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v344, v380, 16);
      }
      while (v64);
    }

  }
  if (a3)
    v71 = CFSTR("itemId");
  else
    v71 = CFSTR("item_id");
  objc_msgSend(v278, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v342 = 0u;
    v343 = 0u;
    v340 = 0u;
    v341 = 0u;
    v73 = v72;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v340, v379, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v341;
      do
      {
        for (m = 0; m != v75; ++m)
        {
          if (*(_QWORD *)v341 != v76)
            objc_enumerationMutation(v73);
          v78 = *(_QWORD *)(*((_QWORD *)&v340 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v79 = [GEOPDMapsIdentifier alloc];
            if ((a3 & 1) != 0)
              v80 = -[GEOPDMapsIdentifier initWithJSON:](v79, "initWithJSON:", v78);
            else
              v80 = -[GEOPDMapsIdentifier initWithDictionary:](v79, "initWithDictionary:", v78);
            v81 = v80;
            -[GEOPDPlaceCollection addItemId:](v6, v80);

          }
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v340, v379, 16);
      }
      while (v75);
    }

  }
  if (a3)
    v82 = CFSTR("numItems");
  else
    v82 = CFSTR("num_items");
  objc_msgSend(v278, "objectForKeyedSubscript:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v84 = objc_msgSend(v83, "unsignedIntValue");
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 4u;
    v6[58]._os_unfair_lock_opaque = v84;
  }

  if (a3)
    v85 = CFSTR("collectionClassDisplayName");
  else
    v85 = CFSTR("collection_class_display_name");
  objc_msgSend(v278, "objectForKeyedSubscript:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v292 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v338 = 0u;
    v339 = 0u;
    v336 = 0u;
    v337 = 0u;
    v87 = v86;
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v336, v378, 16);
    if (v88)
    {
      v89 = v88;
      v90 = *(_QWORD *)v337;
      do
      {
        for (n = 0; n != v89; ++n)
        {
          if (*(_QWORD *)v337 != v90)
            objc_enumerationMutation(v87);
          v92 = *(_QWORD *)(*((_QWORD *)&v336 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v93 = [GEOLocalizedString alloc];
            if ((v292 & 1) != 0)
              v94 = -[GEOLocalizedString initWithJSON:](v93, "initWithJSON:", v92);
            else
              v94 = -[GEOLocalizedString initWithDictionary:](v93, "initWithDictionary:", v92);
            v95 = v94;
            -[GEOPDPlaceCollection addCollectionClassDisplayName:]((uint64_t)v6, v94);

          }
        }
        v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v336, v378, 16);
      }
      while (v89);
    }

    a3 = v292;
  }

  if (a3)
    v96 = CFSTR("collectionClassSpokenName");
  else
    v96 = CFSTR("collection_class_spoken_name");
  objc_msgSend(v278, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v334 = 0u;
    v335 = 0u;
    v332 = 0u;
    v333 = 0u;
    v98 = v97;
    v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v332, v377, 16);
    if (v99)
    {
      v100 = v99;
      v101 = *(_QWORD *)v333;
      do
      {
        for (ii = 0; ii != v100; ++ii)
        {
          if (*(_QWORD *)v333 != v101)
            objc_enumerationMutation(v98);
          v103 = *(_QWORD *)(*((_QWORD *)&v332 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v104 = [GEOLocalizedString alloc];
            if ((v292 & 1) != 0)
              v105 = -[GEOLocalizedString initWithJSON:](v104, "initWithJSON:", v103);
            else
              v105 = -[GEOLocalizedString initWithDictionary:](v104, "initWithDictionary:", v103);
            v106 = v105;
            -[GEOPDPlaceCollection addCollectionClassSpokenName:]((uint64_t)v6, v105);

          }
        }
        v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v332, v377, 16);
      }
      while (v100);
    }

    a3 = v292;
  }

  if (a3)
    v107 = CFSTR("modifiedTime");
  else
    v107 = CFSTR("modified_time");
  objc_msgSend(v278, "objectForKeyedSubscript:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v108, "doubleValue");
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 1u;
    *(_QWORD *)&v6[40]._os_unfair_lock_opaque = v109;
  }

  objc_msgSend(v278, "objectForKeyedSubscript:", CFSTR("url"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = (void *)objc_msgSend(v110, "copy");
    -[GEOPDPlaceCollection setUrl:]((uint64_t)v6, v111);

  }
  if (a3)
    v112 = CFSTR("authorName");
  else
    v112 = CFSTR("author_name");
  objc_msgSend(v278, "objectForKeyedSubscript:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v114 = (void *)objc_msgSend(v113, "copy");
    -[GEOPDPlaceCollection setAuthorName:]((uint64_t)v6, v114);

  }
  objc_msgSend(v278, "objectForKeyedSubscript:", CFSTR("publisher"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = [GEOPDPublisher alloc];
    if (v116)
      v117 = (void *)-[GEOPDPublisher _initWithDictionary:isJSON:](v116, v115, a3);
    else
      v117 = 0;
    -[GEOPDPlaceCollection setPublisher:]((uint64_t)v6, v117);

  }
  if (a3)
    v118 = CFSTR("enableFallbackImagesForItems");
  else
    v118 = CFSTR("enable_fallback_images_for_items");
  objc_msgSend(v278, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v120 = objc_msgSend(v119, "BOOLValue");
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 8u;
    LOBYTE(v6[59]._os_unfair_lock_opaque) = v120;
  }

  if (a3)
    v121 = CFSTR("authorPhoto");
  else
    v121 = CFSTR("author_photo");
  objc_msgSend(v278, "objectForKeyedSubscript:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = [GEOPDCaptionedPhoto alloc];
    if (v123)
      v124 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v123, v122, a3);
    else
      v124 = 0;
    -[GEOPDPlaceCollection setAuthorPhoto:]((uint64_t)v6, v124);

  }
  if (a3)
    v125 = CFSTR("errorState");
  else
    v125 = CFSTR("error_state");
  objc_msgSend(v278, "objectForKeyedSubscript:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v127 = v126;
    if ((objc_msgSend(v127, "isEqualToString:", CFSTR("BROOKLYN_ERROR_STATE_UNKNOWN")) & 1) != 0)
    {
      v128 = 0;
    }
    else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("BROOKLYN_ERROR_STATE_SUPPRESSED")) & 1) != 0)
    {
      v128 = 1;
    }
    else if (objc_msgSend(v127, "isEqualToString:", CFSTR("BROOKLYN_ERROR_STATE_BLOCKED")))
    {
      v128 = 2;
    }
    else
    {
      v128 = 0;
    }

    goto LABEL_200;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v128 = objc_msgSend(v126, "intValue");
LABEL_200:
    v6[60]._os_unfair_lock_opaque |= 0x10000000u;
    v6[60]._os_unfair_lock_opaque |= 2u;
    v6[57]._os_unfair_lock_opaque = v128;
  }

  if (a3)
    v129 = CFSTR("collectionDescriptionBytes");
  else
    v129 = CFSTR("collection_description_bytes");
  objc_msgSend(v278, "objectForKeyedSubscript:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v330 = 0u;
    v331 = 0u;
    v328 = 0u;
    v329 = 0u;
    v131 = v130;
    v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v328, v376, 16);
    if (v132)
    {
      v133 = v132;
      v134 = *(_QWORD *)v329;
      do
      {
        for (jj = 0; jj != v133; ++jj)
        {
          if (*(_QWORD *)v329 != v134)
            objc_enumerationMutation(v131);
          v136 = *(_QWORD *)(*((_QWORD *)&v328 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v137 = [GEOLocalizedBytes alloc];
            if ((a3 & 1) != 0)
              v138 = -[GEOLocalizedBytes initWithJSON:](v137, "initWithJSON:", v136);
            else
              v138 = -[GEOLocalizedBytes initWithDictionary:](v137, "initWithDictionary:", v136);
            v139 = v138;
            -[GEOPDPlaceCollection addCollectionDescriptionBytes:]((uint64_t)v6, v138);

          }
        }
        v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v328, v376, 16);
      }
      while (v133);
    }

  }
  if (a3)
    v140 = CFSTR("collectionDescriptionHtml");
  else
    v140 = CFSTR("collection_description_html");
  objc_msgSend(v278, "objectForKeyedSubscript:", v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v326 = 0u;
    v327 = 0u;
    v324 = 0u;
    v325 = 0u;
    v142 = v141;
    v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v324, v375, 16);
    if (v143)
    {
      v144 = v143;
      v145 = *(_QWORD *)v325;
      do
      {
        for (kk = 0; kk != v144; ++kk)
        {
          if (*(_QWORD *)v325 != v145)
            objc_enumerationMutation(v142);
          v147 = *(_QWORD *)(*((_QWORD *)&v324 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v148 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v149 = -[GEOLocalizedString initWithJSON:](v148, "initWithJSON:", v147);
            else
              v149 = -[GEOLocalizedString initWithDictionary:](v148, "initWithDictionary:", v147);
            v150 = v149;
            -[GEOPDPlaceCollection addCollectionDescriptionHtml:](v6, v149);

          }
        }
        v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v324, v375, 16);
      }
      while (v144);
    }

  }
  if (a3)
    v151 = CFSTR("collectionItemDescription");
  else
    v151 = CFSTR("collection_item_description");
  objc_msgSend(v278, "objectForKeyedSubscript:", v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v322 = 0u;
    v323 = 0u;
    v320 = 0u;
    v321 = 0u;
    v153 = v152;
    v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v320, v374, 16);
    if (v154)
    {
      v155 = v154;
      v156 = *(_QWORD *)v321;
      do
      {
        for (mm = 0; mm != v155; ++mm)
        {
          if (*(_QWORD *)v321 != v156)
            objc_enumerationMutation(v153);
          v158 = *(_QWORD *)(*((_QWORD *)&v320 + 1) + 8 * mm);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v159 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v160 = -[GEOLocalizedString initWithJSON:](v159, "initWithJSON:", v158);
            else
              v160 = -[GEOLocalizedString initWithDictionary:](v159, "initWithDictionary:", v158);
            v161 = v160;
            -[GEOPDPlaceCollection addCollectionItemDescription:](v6, v160);

          }
        }
        v155 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v320, v374, 16);
      }
      while (v155);
    }

  }
  if (a3)
    v162 = CFSTR("collectionItemDescriptionHtml");
  else
    v162 = CFSTR("collection_item_description_html");
  objc_msgSend(v278, "objectForKeyedSubscript:", v162);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v318 = 0u;
    v319 = 0u;
    v316 = 0u;
    v317 = 0u;
    v164 = v163;
    v165 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v316, v373, 16);
    if (v165)
    {
      v166 = v165;
      v167 = *(_QWORD *)v317;
      do
      {
        for (nn = 0; nn != v166; ++nn)
        {
          if (*(_QWORD *)v317 != v167)
            objc_enumerationMutation(v164);
          v169 = *(_QWORD *)(*((_QWORD *)&v316 + 1) + 8 * nn);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v170 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v171 = -[GEOLocalizedString initWithJSON:](v170, "initWithJSON:", v169);
            else
              v171 = -[GEOLocalizedString initWithDictionary:](v170, "initWithDictionary:", v169);
            v172 = v171;
            -[GEOPDPlaceCollection addCollectionItemDescriptionHtml:](v6, v171);

          }
        }
        v166 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v316, v373, 16);
      }
      while (v166);
    }

  }
  if (a3)
    v173 = CFSTR("longTitle");
  else
    v173 = CFSTR("long_title");
  objc_msgSend(v278, "objectForKeyedSubscript:", v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v314 = 0u;
    v315 = 0u;
    v312 = 0u;
    v313 = 0u;
    v175 = v174;
    v176 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v312, v372, 16);
    if (v176)
    {
      v177 = v176;
      v178 = *(_QWORD *)v313;
      do
      {
        for (i1 = 0; i1 != v177; ++i1)
        {
          if (*(_QWORD *)v313 != v178)
            objc_enumerationMutation(v175);
          v180 = *(_QWORD *)(*((_QWORD *)&v312 + 1) + 8 * i1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v181 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v182 = -[GEOLocalizedString initWithJSON:](v181, "initWithJSON:", v180);
            else
              v182 = -[GEOLocalizedString initWithDictionary:](v181, "initWithDictionary:", v180);
            v183 = v182;
            -[GEOPDPlaceCollection addLongTitle:](v6, v182);

          }
        }
        v177 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v312, v372, 16);
      }
      while (v177);
    }

  }
  if (a3)
    v184 = CFSTR("longSpokenTitle");
  else
    v184 = CFSTR("long_spoken_title");
  objc_msgSend(v278, "objectForKeyedSubscript:", v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v310 = 0u;
    v311 = 0u;
    v308 = 0u;
    v309 = 0u;
    v186 = v185;
    v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v308, v371, 16);
    if (v187)
    {
      v188 = v187;
      v189 = *(_QWORD *)v309;
      do
      {
        for (i2 = 0; i2 != v188; ++i2)
        {
          if (*(_QWORD *)v309 != v189)
            objc_enumerationMutation(v186);
          v191 = *(_QWORD *)(*((_QWORD *)&v308 + 1) + 8 * i2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v192 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v193 = -[GEOLocalizedString initWithJSON:](v192, "initWithJSON:", v191);
            else
              v193 = -[GEOLocalizedString initWithDictionary:](v192, "initWithDictionary:", v191);
            v194 = v193;
            -[GEOPDPlaceCollection addLongSpokenTitle:]((uint64_t)v6, v193);

          }
        }
        v188 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v308, v371, 16);
      }
      while (v188);
    }

  }
  if (a3)
    v195 = CFSTR("mediaLink");
  else
    v195 = CFSTR("media_link");
  v196 = v278;
  objc_msgSend(v278, "objectForKeyedSubscript:", v195);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v306 = 0u;
    v307 = 0u;
    v304 = 0u;
    v305 = 0u;
    obj = v197;
    v291 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v304, v370, 16);
    if (!v291)
      goto LABEL_449;
    v198 = CFSTR("adam_id");
    v290 = *(_QWORD *)v305;
    if (a3)
      v198 = CFSTR("adamId");
    v295 = v198;
    if (a3)
      v199 = CFSTR("subId");
    else
      v199 = CFSTR("sub_id");
    v200 = CFSTR("media_type");
    if (a3)
      v200 = CFSTR("mediaType");
    v285 = v200;
    v286 = v199;
    v201 = CFSTR("mediaSubType");
    if (!a3)
      v201 = CFSTR("media_sub_type");
    v284 = v201;
    v202 = CFSTR("third_party_link");
    if (a3)
      v202 = CFSTR("thirdPartyLink");
    v283 = v202;
    if (a3)
      v203 = CFSTR("mediaLinkPositionMetaData");
    else
      v203 = CFSTR("media_link_position_meta_data");
    v282 = v203;
    if (a3)
      v204 = CFSTR("collectionItemIndex");
    else
      v204 = CFSTR("collection_item_index");
    v205 = CFSTR("media_link_position");
    if (a3)
      v205 = CFSTR("mediaLinkPosition");
    v279 = v205;
    v280 = v204;
    v287 = v197;
    v288 = v6;
    while (1)
    {
      v206 = 0;
      do
      {
        if (*(_QWORD *)v305 != v290)
          objc_enumerationMutation(obj);
        v294 = v206;
        v207 = *(void **)(*((_QWORD *)&v304 + 1) + 8 * v206);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v208 = [GEOPDMediaLink alloc];
          if (v208)
          {
            v209 = v208;
            v210 = v207;
            v211 = v209;
            v212 = v210;
            v213 = -[GEOPDMediaLink init](v211, "init");
            if (v213)
            {
              objc_msgSend(v212, "objectForKeyedSubscript:", v295);
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v293 = v212;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v215 = (void *)objc_msgSend(v214, "copy");
                v216 = v215;
                *(_BYTE *)(v213 + 76) |= 8u;
                *(_BYTE *)(v213 + 76) |= 0x80u;
                v217 = v215;
                v212 = v293;
                objc_storeStrong((id *)(v213 + 24), v217);

              }
              objc_msgSend(v212, "objectForKeyedSubscript:", v286);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v219 = (void *)objc_msgSend(v218, "copy");
                v220 = v219;
                *(_BYTE *)(v213 + 76) |= 0x20u;
                *(_BYTE *)(v213 + 76) |= 0x80u;
                v221 = v219;
                v212 = v293;
                objc_storeStrong((id *)(v213 + 40), v221);

              }
              objc_msgSend(v212, "objectForKeyedSubscript:", v285);
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v223 = v222;
                if ((objc_msgSend(v223, "isEqualToString:", CFSTR("MEDIA_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v224 = 0;
                }
                else if ((objc_msgSend(v223, "isEqualToString:", CFSTR("MEDIA_TYPE_MUSIC")) & 1) != 0)
                {
                  v224 = 1;
                }
                else if ((objc_msgSend(v223, "isEqualToString:", CFSTR("MEDIA_TYPE_PODCASTS")) & 1) != 0)
                {
                  v224 = 2;
                }
                else if ((objc_msgSend(v223, "isEqualToString:", CFSTR("MEDIA_TYPE_BOOKS")) & 1) != 0)
                {
                  v224 = 3;
                }
                else if ((objc_msgSend(v223, "isEqualToString:", CFSTR("MEDIA_TYPE_FITNESS")) & 1) != 0)
                {
                  v224 = 4;
                }
                else if (objc_msgSend(v223, "isEqualToString:", CFSTR("MEDIA_TYPE_APP")))
                {
                  v224 = 5;
                }
                else
                {
                  v224 = 0;
                }

LABEL_355:
                *(_BYTE *)(v213 + 76) |= 0x80u;
                *(_BYTE *)(v213 + 76) |= 2u;
                *(_DWORD *)(v213 + 72) = v224;
                v212 = v293;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v224 = objc_msgSend(v222, "intValue");
                  goto LABEL_355;
                }
              }

              objc_msgSend(v212, "objectForKeyedSubscript:", v284);
              v225 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v226 = v225;
                if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_UNKNOWN")) & 1) != 0)
                {
                  v227 = 0;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_SONG")) & 1) != 0)
                {
                  v227 = 1;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_ALBUM")) & 1) != 0)
                {
                  v227 = 2;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_ARTIST")) & 1) != 0)
                {
                  v227 = 3;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_PLAYLIST")) & 1) != 0)
                {
                  v227 = 4;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_RADIO_STATION")) & 1) != 0)
                {
                  v227 = 5;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_MUSIC_VIDEO")) & 1) != 0)
                {
                  v227 = 6;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_SUPER_ROOM")) & 1) != 0)
                {
                  v227 = 7;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_ARTIST_INTERVIEW")) & 1) != 0)
                {
                  v227 = 8;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_EPISODE")) & 1) != 0)
                {
                  v227 = 9;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_SHOW")) & 1) != 0)
                {
                  v227 = 10;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_CHANNEL")) & 1) != 0)
                {
                  v227 = 11;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_BOOK")) & 1) != 0)
                {
                  v227 = 12;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_AUTHOR")) & 1) != 0)
                {
                  v227 = 13;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_INSTRUCTOR")) & 1) != 0)
                {
                  v227 = 14;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_CLASS")) & 1) != 0)
                {
                  v227 = 15;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_CLASS_TYPE")) & 1) != 0)
                {
                  v227 = 16;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_APPS")) & 1) != 0)
                {
                  v227 = 17;
                }
                else if ((objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_STORY")) & 1) != 0)
                {
                  v227 = 18;
                }
                else if (objc_msgSend(v226, "isEqualToString:", CFSTR("MEDIA_SUBTYPE_AUDIO_BOOK")))
                {
                  v227 = 19;
                }
                else
                {
                  v227 = 0;
                }

LABEL_402:
                *(_BYTE *)(v213 + 76) |= 0x80u;
                *(_BYTE *)(v213 + 76) |= 1u;
                *(_DWORD *)(v213 + 68) = v227;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v227 = objc_msgSend(v225, "intValue");
                  goto LABEL_402;
                }
              }

              objc_msgSend(v212, "objectForKeyedSubscript:", v283);
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v367 = 0u;
                v366 = 0u;
                v365 = 0u;
                v364 = 0u;
                v281 = v228;
                v229 = v228;
                v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v364, v385, 16);
                if (v230)
                {
                  v231 = v230;
                  v232 = *(_QWORD *)v365;
                  do
                  {
                    for (i3 = 0; i3 != v231; ++i3)
                    {
                      if (*(_QWORD *)v365 != v232)
                        objc_enumerationMutation(v229);
                      v234 = *(void **)(*((_QWORD *)&v364 + 1) + 8 * i3);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v235 = [GEOPDThirdPartyLink alloc];
                        if (v235)
                        {
                          v236 = v234;
                          v235 = -[GEOPDThirdPartyLink init](v235, "init");
                          if (v235)
                          {
                            objc_msgSend(v236, "objectForKeyedSubscript:", v295);
                            v237 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v238 = (void *)objc_msgSend(v237, "copy");
                              v239 = v238;
                              *(_BYTE *)&v235->_flags |= 2u;
                              *(_BYTE *)&v235->_flags |= 8u;
                              objc_storeStrong((id *)&v235->_adamId, v238);

                            }
                            objc_msgSend(v236, "objectForKeyedSubscript:", CFSTR("url"));
                            v240 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v241 = (void *)objc_msgSend(v240, "copy");
                              v242 = v241;
                              *(_BYTE *)&v235->_flags |= 4u;
                              *(_BYTE *)&v235->_flags |= 8u;
                              objc_storeStrong((id *)&v235->_url, v241);

                            }
                          }

                        }
                        -[GEOPDMediaLink addThirdPartyLink:](v213, v235);

                      }
                    }
                    v231 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v364, v385, 16);
                  }
                  while (v231);
                }

                a3 = v292;
                v197 = v287;
                v212 = v293;
                v228 = v281;
              }

              objc_msgSend(v212, "objectForKeyedSubscript:", v282);
              v243 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v244 = [GEOPDMediaLinkPositionMetaData alloc];
                if (v244)
                {
                  v245 = v244;
                  v246 = v243;
                  v247 = -[GEOPDMediaLinkPositionMetaData init](v245, "init");
                  if (v247)
                  {
                    objc_msgSend(v246, "objectForKeyedSubscript:", v280);
                    v248 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v249 = objc_msgSend(v248, "intValue");
                      *(_BYTE *)(v247 + 24) |= 1u;
                      *(_DWORD *)(v247 + 16) = v249;
                    }

                    objc_msgSend(v246, "objectForKeyedSubscript:", v279);
                    v250 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v251 = v250;
                      if ((objc_msgSend(v251, "isEqualToString:", CFSTR("MEDIA_LINK_POSITION_UNKNOWN")) & 1) != 0)
                      {
                        v252 = 0;
                      }
                      else if ((objc_msgSend(v251, "isEqualToString:", CFSTR("MEDIA_LINK_POSITION_ABOVE")) & 1) != 0)
                      {
                        v252 = 1;
                      }
                      else if (objc_msgSend(v251, "isEqualToString:", CFSTR("MEDIA_LINK_POSITION_BELOW")))
                      {
                        v252 = 2;
                      }
                      else
                      {
                        v252 = 0;
                      }

LABEL_438:
                      *(_BYTE *)(v247 + 24) |= 2u;
                      *(_DWORD *)(v247 + 20) = v252;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v252 = objc_msgSend(v250, "intValue");
                        goto LABEL_438;
                      }
                    }

                  }
                }
                else
                {
                  v247 = 0;
                }
                v253 = (id)v247;
                *(_BYTE *)(v213 + 76) |= 0x10u;
                *(_BYTE *)(v213 + 76) |= 0x80u;
                objc_storeStrong((id *)(v213 + 32), (id)v247);

                v197 = v287;
                v212 = v293;
              }

            }
          }
          else
          {
            v213 = 0;
          }
          -[GEOPDPlaceCollection addMediaLink:](v288, (void *)v213);

          v6 = v288;
        }
        v206 = v294 + 1;
      }
      while (v294 + 1 != v291);
      v254 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v304, v370, 16);
      v291 = v254;
      if (!v254)
      {
LABEL_449:

        v196 = v278;
        break;
      }
    }
  }

  if (a3)
    v255 = CFSTR("itemPhoto");
  else
    v255 = CFSTR("item_photo");
  objc_msgSend(v196, "objectForKeyedSubscript:", v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v302 = 0u;
    v303 = 0u;
    v300 = 0u;
    v301 = 0u;
    v257 = v256;
    v258 = objc_msgSend(v257, "countByEnumeratingWithState:objects:count:", &v300, v369, 16);
    if (v258)
    {
      v259 = v258;
      v260 = *(_QWORD *)v301;
      do
      {
        v261 = 0;
        do
        {
          if (*(_QWORD *)v301 != v260)
            objc_enumerationMutation(v257);
          v262 = *(void **)(*((_QWORD *)&v300 + 1) + 8 * v261);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v263 = [GEOPDCaptionedPhoto alloc];
            if (v263)
              v264 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v263, v262, a3);
            else
              v264 = 0;
            -[GEOPDPlaceCollection addItemPhoto:]((uint64_t)v6, v264);

          }
          ++v261;
        }
        while (v259 != v261);
        v265 = objc_msgSend(v257, "countByEnumeratingWithState:objects:count:", &v300, v369, 16);
        v259 = v265;
      }
      while (v265);
    }

  }
  if (a3)
    v266 = CFSTR("localizedCategory");
  else
    v266 = CFSTR("localized_category");
  objc_msgSend(v278, "objectForKeyedSubscript:", v266);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v298 = 0u;
    v299 = 0u;
    v296 = 0u;
    v297 = 0u;
    v268 = v267;
    v269 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v296, v368, 16);
    if (v269)
    {
      v270 = v269;
      v271 = *(_QWORD *)v297;
      do
      {
        for (i4 = 0; i4 != v270; ++i4)
        {
          if (*(_QWORD *)v297 != v271)
            objc_enumerationMutation(v268);
          v273 = *(_QWORD *)(*((_QWORD *)&v296 + 1) + 8 * i4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v274 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v275 = -[GEOLocalizedString initWithJSON:](v274, "initWithJSON:", v273);
            else
              v275 = -[GEOLocalizedString initWithDictionary:](v274, "initWithDictionary:", v273);
            v276 = v275;
            -[GEOPDPlaceCollection addLocalizedCategory:]((uint64_t)v6, v275);

          }
        }
        v270 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v296, v368, 16);
      }
      while (v270);
    }

  }
  v5 = v278;
LABEL_486:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceCollectionReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v74;
  void *v75;
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
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceCollectionIsDirty((uint64_t)self) & 1) == 0)
  {
    v74 = self->_reader;
    objc_sync_enter(v74);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v75);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v74);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceCollection readAll:]((uint64_t)self, 0);
    v143 = 0u;
    v142 = 0u;
    v141 = 0u;
    v140 = 0u;
    v6 = self->_displayTitles;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v141;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v141 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
      }
      while (v7);
    }

    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v10 = self->_collectionDescriptions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v136, v159, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v137;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v137 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v136, v159, 16);
      }
      while (v11);
    }

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v14 = self->_photos;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v132, v158, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v133;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v133 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v132, v158, 16);
      }
      while (v15);
    }

    if (self->_collectionId)
      PBDataWriterWriteSubmessage();
    if (self->_publisherId)
      PBDataWriterWriteSubmessage();
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v18 = self->_placeCollectionItems;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v128, v157, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v129;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v129 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v128, v157, 16);
      }
      while (v19);
    }

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v22 = self->_spokenTitles;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v124, v156, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v125;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v125 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v124, v156, 16);
      }
      while (v23);
    }

    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v26 = self->_itemIds;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v120, v155, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v121;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v121 != v28)
            objc_enumerationMutation(v26);
          PBDataWriterWriteSubmessage();
          ++v29;
        }
        while (v27 != v29);
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v120, v155, 16);
      }
      while (v27);
    }

    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v30 = self->_collectionClassDisplayNames;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v116, v154, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v117;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v117 != v32)
            objc_enumerationMutation(v30);
          PBDataWriterWriteSubmessage();
          ++v33;
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v116, v154, 16);
      }
      while (v31);
    }

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v34 = self->_collectionClassSpokenNames;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v112, v153, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v113;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v113 != v36)
            objc_enumerationMutation(v34);
          PBDataWriterWriteSubmessage();
          ++v37;
        }
        while (v35 != v37);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v112, v153, 16);
      }
      while (v35);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_url)
      PBDataWriterWriteStringField();
    if (self->_authorName)
      PBDataWriterWriteStringField();
    if (self->_publisher)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_authorPhoto)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v38 = self->_collectionDescriptionBytes;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v108, v152, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v109;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v109 != v40)
            objc_enumerationMutation(v38);
          PBDataWriterWriteSubmessage();
          ++v41;
        }
        while (v39 != v41);
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v108, v152, 16);
      }
      while (v39);
    }

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v42 = self->_collectionDescriptionHtmls;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v104, v151, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v105;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v105 != v44)
            objc_enumerationMutation(v42);
          PBDataWriterWriteSubmessage();
          ++v45;
        }
        while (v43 != v45);
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v104, v151, 16);
      }
      while (v43);
    }

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v46 = self->_collectionItemDescriptions;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v100, v150, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v101;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v101 != v48)
            objc_enumerationMutation(v46);
          PBDataWriterWriteSubmessage();
          ++v49;
        }
        while (v47 != v49);
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v100, v150, 16);
      }
      while (v47);
    }

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v50 = self->_collectionItemDescriptionHtmls;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v96, v149, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v97;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v97 != v52)
            objc_enumerationMutation(v50);
          PBDataWriterWriteSubmessage();
          ++v53;
        }
        while (v51 != v53);
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v96, v149, 16);
      }
      while (v51);
    }

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v54 = self->_longTitles;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v92, v148, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v93;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v93 != v56)
            objc_enumerationMutation(v54);
          PBDataWriterWriteSubmessage();
          ++v57;
        }
        while (v55 != v57);
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v92, v148, 16);
      }
      while (v55);
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v58 = self->_longSpokenTitles;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v88, v147, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v89;
      do
      {
        v61 = 0;
        do
        {
          if (*(_QWORD *)v89 != v60)
            objc_enumerationMutation(v58);
          PBDataWriterWriteSubmessage();
          ++v61;
        }
        while (v59 != v61);
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v88, v147, 16);
      }
      while (v59);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v62 = self->_mediaLinks;
    v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v84, v146, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v85;
      do
      {
        v65 = 0;
        do
        {
          if (*(_QWORD *)v85 != v64)
            objc_enumerationMutation(v62);
          PBDataWriterWriteSubmessage();
          ++v65;
        }
        while (v63 != v65);
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v84, v146, 16);
      }
      while (v63);
    }

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v66 = self->_itemPhotos;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v80, v145, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v81;
      do
      {
        v69 = 0;
        do
        {
          if (*(_QWORD *)v81 != v68)
            objc_enumerationMutation(v66);
          PBDataWriterWriteSubmessage();
          ++v69;
        }
        while (v67 != v69);
        v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v80, v145, 16);
      }
      while (v67);
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v70 = self->_localizedCategorys;
    v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v76, v144, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v77;
      do
      {
        v73 = 0;
        do
        {
          if (*(_QWORD *)v77 != v72)
            objc_enumerationMutation(v70);
          PBDataWriterWriteSubmessage();
          ++v73;
        }
        while (v71 != v73);
        v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v76, v144, 16);
      }
      while (v71);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v76);
  }

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
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t ii;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t jj;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t kk;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t mm;
  void *v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t nn;
  void *v70;
  NSMutableArray *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i1;
  void *v75;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i2;
  void *v80;
  NSMutableArray *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i3;
  void *v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i4;
  void *v90;
  NSMutableArray *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i5;
  void *v95;
  NSMutableArray *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i6;
  void *v100;
  NSMutableArray *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i7;
  void *v105;
  PBUnknownFields *v106;
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
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceCollectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_133;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceCollection readAll:]((uint64_t)self, 0);
  v175 = 0u;
  v174 = 0u;
  v173 = 0u;
  v172 = 0u;
  v9 = self->_displayTitles;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v172, v192, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v173;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v173 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v172 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addDisplayTitle:]((os_unfair_lock_s *)v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v172, v192, 16);
    }
    while (v10);
  }

  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v14 = self->_collectionDescriptions;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v168, v191, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v169;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v169 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addCollectionDescription:]((os_unfair_lock_s *)v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v168, v191, 16);
    }
    while (v15);
  }

  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v19 = self->_photos;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v164, v190, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v165;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v165 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addPhoto:]((os_unfair_lock_s *)v5, v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v164, v190, 16);
    }
    while (v20);
  }

  v24 = -[GEOPDMapsIdentifier copyWithZone:](self->_collectionId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v24;

  v26 = -[GEOPDMapsIdentifier copyWithZone:](self->_publisherId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v26;

  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v28 = self->_placeCollectionItems;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v160, v189, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v161;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v161 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addPlaceCollectionItem:]((os_unfair_lock_s *)v5, v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v160, v189, 16);
    }
    while (v29);
  }

  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v33 = self->_spokenTitles;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v156, v188, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v157;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v157 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * n), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addSpokenTitle:](v5, v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v156, v188, 16);
    }
    while (v34);
  }

  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v38 = self->_itemIds;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v152, v187, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v153;
    do
    {
      for (ii = 0; ii != v39; ++ii)
      {
        if (*(_QWORD *)v153 != v40)
          objc_enumerationMutation(v38);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * ii), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addItemId:]((os_unfair_lock_s *)v5, v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v152, v187, 16);
    }
    while (v39);
  }

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_numItems;
    *(_DWORD *)(v5 + 240) |= 4u;
  }
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v43 = self->_collectionClassDisplayNames;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v148, v186, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v149;
    do
    {
      for (jj = 0; jj != v44; ++jj)
      {
        if (*(_QWORD *)v149 != v45)
          objc_enumerationMutation(v43);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * jj), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addCollectionClassDisplayName:](v5, v47);

      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v148, v186, 16);
    }
    while (v44);
  }

  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  v48 = self->_collectionClassSpokenNames;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v144, v185, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v145;
    do
    {
      for (kk = 0; kk != v49; ++kk)
      {
        if (*(_QWORD *)v145 != v50)
          objc_enumerationMutation(v48);
        v52 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * kk), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addCollectionClassSpokenName:](v5, v52);

      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v144, v185, 16);
    }
    while (v49);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 160) = self->_modifiedTime;
    *(_DWORD *)(v5 + 240) |= 1u;
  }
  v53 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v53;

  v55 = -[NSString copyWithZone:](self->_authorName, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v55;

  v57 = -[GEOPDPublisher copyWithZone:](self->_publisher, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v57;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 236) = self->_enableFallbackImagesForItems;
    *(_DWORD *)(v5 + 240) |= 8u;
  }
  v59 = -[GEOPDCaptionedPhoto copyWithZone:](self->_authorPhoto, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v59;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 228) = self->_errorState;
    *(_DWORD *)(v5 + 240) |= 2u;
  }
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  v61 = self->_collectionDescriptionBytes;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v140, v184, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v141;
    do
    {
      for (mm = 0; mm != v62; ++mm)
      {
        if (*(_QWORD *)v141 != v63)
          objc_enumerationMutation(v61);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * mm), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addCollectionDescriptionBytes:](v5, v65);

      }
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v140, v184, 16);
    }
    while (v62);
  }

  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v66 = self->_collectionDescriptionHtmls;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v136, v183, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v137;
    do
    {
      for (nn = 0; nn != v67; ++nn)
      {
        if (*(_QWORD *)v137 != v68)
          objc_enumerationMutation(v66);
        v70 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * nn), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addCollectionDescriptionHtml:]((os_unfair_lock_s *)v5, v70);

      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v136, v183, 16);
    }
    while (v67);
  }

  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v71 = self->_collectionItemDescriptions;
  v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v132, v182, 16);
  if (v72)
  {
    v73 = *(_QWORD *)v133;
    do
    {
      for (i1 = 0; i1 != v72; ++i1)
      {
        if (*(_QWORD *)v133 != v73)
          objc_enumerationMutation(v71);
        v75 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * i1), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addCollectionItemDescription:]((os_unfair_lock_s *)v5, v75);

      }
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v132, v182, 16);
    }
    while (v72);
  }

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v76 = self->_collectionItemDescriptionHtmls;
  v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v128, v181, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v129;
    do
    {
      for (i2 = 0; i2 != v77; ++i2)
      {
        if (*(_QWORD *)v129 != v78)
          objc_enumerationMutation(v76);
        v80 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * i2), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addCollectionItemDescriptionHtml:]((os_unfair_lock_s *)v5, v80);

      }
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v128, v181, 16);
    }
    while (v77);
  }

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v81 = self->_longTitles;
  v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v124, v180, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v125;
    do
    {
      for (i3 = 0; i3 != v82; ++i3)
      {
        if (*(_QWORD *)v125 != v83)
          objc_enumerationMutation(v81);
        v85 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * i3), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addLongTitle:]((os_unfair_lock_s *)v5, v85);

      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v124, v180, 16);
    }
    while (v82);
  }

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v86 = self->_longSpokenTitles;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v120, v179, 16);
  if (v87)
  {
    v88 = *(_QWORD *)v121;
    do
    {
      for (i4 = 0; i4 != v87; ++i4)
      {
        if (*(_QWORD *)v121 != v88)
          objc_enumerationMutation(v86);
        v90 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i4), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addLongSpokenTitle:](v5, v90);

      }
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v120, v179, 16);
    }
    while (v87);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v91 = self->_mediaLinks;
  v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v116, v178, 16);
  if (v92)
  {
    v93 = *(_QWORD *)v117;
    do
    {
      for (i5 = 0; i5 != v92; ++i5)
      {
        if (*(_QWORD *)v117 != v93)
          objc_enumerationMutation(v91);
        v95 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i5), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addMediaLink:]((os_unfair_lock_s *)v5, v95);

      }
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v116, v178, 16);
    }
    while (v92);
  }

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v96 = self->_itemPhotos;
  v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v112, v177, 16);
  if (v97)
  {
    v98 = *(_QWORD *)v113;
    do
    {
      for (i6 = 0; i6 != v97; ++i6)
      {
        if (*(_QWORD *)v113 != v98)
          objc_enumerationMutation(v96);
        v100 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i6), "copyWithZone:", a3);
        -[GEOPDPlaceCollection addItemPhoto:](v5, v100);

      }
      v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v112, v177, 16);
    }
    while (v97);
  }

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v101 = self->_localizedCategorys;
  v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v108, v176, 16);
  if (v102)
  {
    v103 = *(_QWORD *)v109;
    do
    {
      for (i7 = 0; i7 != v102; ++i7)
      {
        if (*(_QWORD *)v109 != v103)
          objc_enumerationMutation(v101);
        v105 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i7), "copyWithZone:", a3, (_QWORD)v108);
        -[GEOPDPlaceCollection addLocalizedCategory:](v5, v105);

      }
      v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v108, v176, 16);
    }
    while (v102);
  }

  v106 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v106;
LABEL_133:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *displayTitles;
  NSMutableArray *collectionDescriptions;
  NSMutableArray *photos;
  GEOPDMapsIdentifier *collectionId;
  GEOPDMapsIdentifier *publisherId;
  NSMutableArray *placeCollectionItems;
  NSMutableArray *spokenTitles;
  NSMutableArray *itemIds;
  int v13;
  NSMutableArray *collectionClassDisplayNames;
  NSMutableArray *collectionClassSpokenNames;
  int v16;
  NSString *url;
  NSString *authorName;
  GEOPDPublisher *publisher;
  $5C185B3F1CE4A3565E103C9829A476EA flags;
  int v21;
  GEOPDCaptionedPhoto *authorPhoto;
  NSMutableArray *collectionDescriptionBytes;
  NSMutableArray *collectionDescriptionHtmls;
  NSMutableArray *collectionItemDescriptions;
  NSMutableArray *collectionItemDescriptionHtmls;
  NSMutableArray *longTitles;
  NSMutableArray *longSpokenTitles;
  NSMutableArray *mediaLinks;
  NSMutableArray *itemPhotos;
  NSMutableArray *localizedCategorys;
  char v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_72;
  -[GEOPDPlaceCollection readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceCollection readAll:]((uint64_t)v4, 1);
  displayTitles = self->_displayTitles;
  if ((unint64_t)displayTitles | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](displayTitles, "isEqual:"))
      goto LABEL_72;
  }
  collectionDescriptions = self->_collectionDescriptions;
  if ((unint64_t)collectionDescriptions | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](collectionDescriptions, "isEqual:"))
      goto LABEL_72;
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](photos, "isEqual:"))
      goto LABEL_72;
  }
  collectionId = self->_collectionId;
  if ((unint64_t)collectionId | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](collectionId, "isEqual:"))
      goto LABEL_72;
  }
  publisherId = self->_publisherId;
  if ((unint64_t)publisherId | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](publisherId, "isEqual:"))
      goto LABEL_72;
  }
  placeCollectionItems = self->_placeCollectionItems;
  if ((unint64_t)placeCollectionItems | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](placeCollectionItems, "isEqual:"))
      goto LABEL_72;
  }
  spokenTitles = self->_spokenTitles;
  if ((unint64_t)spokenTitles | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](spokenTitles, "isEqual:"))
      goto LABEL_72;
  }
  itemIds = self->_itemIds;
  if ((unint64_t)itemIds | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](itemIds, "isEqual:"))
      goto LABEL_72;
  }
  v13 = *((_DWORD *)v4 + 60);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_numItems != *((_DWORD *)v4 + 58))
      goto LABEL_72;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_72;
  }
  collectionClassDisplayNames = self->_collectionClassDisplayNames;
  if ((unint64_t)collectionClassDisplayNames | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](collectionClassDisplayNames, "isEqual:"))
  {
    goto LABEL_72;
  }
  collectionClassSpokenNames = self->_collectionClassSpokenNames;
  if ((unint64_t)collectionClassSpokenNames | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](collectionClassSpokenNames, "isEqual:"))
      goto LABEL_72;
  }
  v16 = *((_DWORD *)v4 + 60);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v16 & 1) == 0 || self->_modifiedTime != *((double *)v4 + 20))
      goto LABEL_72;
  }
  else if ((v16 & 1) != 0)
  {
    goto LABEL_72;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 26) && !-[NSString isEqual:](url, "isEqual:"))
    goto LABEL_72;
  authorName = self->_authorName;
  if ((unint64_t)authorName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](authorName, "isEqual:"))
      goto LABEL_72;
  }
  publisher = self->_publisher;
  if ((unint64_t)publisher | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOPDPublisher isEqual:](publisher, "isEqual:"))
      goto LABEL_72;
  }
  flags = self->_flags;
  v21 = *((_DWORD *)v4 + 60);
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v21 & 8) == 0)
      goto LABEL_72;
    if (self->_enableFallbackImagesForItems)
    {
      if (!*((_BYTE *)v4 + 236))
        goto LABEL_72;
    }
    else if (*((_BYTE *)v4 + 236))
    {
      goto LABEL_72;
    }
  }
  else if ((v21 & 8) != 0)
  {
    goto LABEL_72;
  }
  authorPhoto = self->_authorPhoto;
  if (!((unint64_t)authorPhoto | *((_QWORD *)v4 + 4)))
    goto LABEL_49;
  if (!-[GEOPDCaptionedPhoto isEqual:](authorPhoto, "isEqual:"))
  {
LABEL_72:
    v32 = 0;
    goto LABEL_73;
  }
  flags = self->_flags;
  v21 = *((_DWORD *)v4 + 60);
LABEL_49:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_errorState != *((_DWORD *)v4 + 57))
      goto LABEL_72;
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_72;
  }
  collectionDescriptionBytes = self->_collectionDescriptionBytes;
  if ((unint64_t)collectionDescriptionBytes | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](collectionDescriptionBytes, "isEqual:"))
  {
    goto LABEL_72;
  }
  collectionDescriptionHtmls = self->_collectionDescriptionHtmls;
  if ((unint64_t)collectionDescriptionHtmls | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](collectionDescriptionHtmls, "isEqual:"))
      goto LABEL_72;
  }
  collectionItemDescriptions = self->_collectionItemDescriptions;
  if ((unint64_t)collectionItemDescriptions | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](collectionItemDescriptions, "isEqual:"))
      goto LABEL_72;
  }
  collectionItemDescriptionHtmls = self->_collectionItemDescriptionHtmls;
  if ((unint64_t)collectionItemDescriptionHtmls | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](collectionItemDescriptionHtmls, "isEqual:"))
      goto LABEL_72;
  }
  longTitles = self->_longTitles;
  if ((unint64_t)longTitles | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](longTitles, "isEqual:"))
      goto LABEL_72;
  }
  longSpokenTitles = self->_longSpokenTitles;
  if ((unint64_t)longSpokenTitles | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](longSpokenTitles, "isEqual:"))
      goto LABEL_72;
  }
  mediaLinks = self->_mediaLinks;
  if ((unint64_t)mediaLinks | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](mediaLinks, "isEqual:"))
      goto LABEL_72;
  }
  itemPhotos = self->_itemPhotos;
  if ((unint64_t)itemPhotos | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](itemPhotos, "isEqual:"))
      goto LABEL_72;
  }
  localizedCategorys = self->_localizedCategorys;
  if ((unint64_t)localizedCategorys | *((_QWORD *)v4 + 16))
    v32 = -[NSMutableArray isEqual:](localizedCategorys, "isEqual:");
  else
    v32 = 1;
LABEL_73:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double modifiedTime;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  -[GEOPDPlaceCollection readAll:]((uint64_t)self, 1);
  v37 = -[NSMutableArray hash](self->_displayTitles, "hash");
  v36 = -[NSMutableArray hash](self->_collectionDescriptions, "hash");
  v35 = -[NSMutableArray hash](self->_photos, "hash");
  v34 = -[GEOPDMapsIdentifier hash](self->_collectionId, "hash");
  v33 = -[GEOPDMapsIdentifier hash](self->_publisherId, "hash");
  v32 = -[NSMutableArray hash](self->_placeCollectionItems, "hash");
  v31 = -[NSMutableArray hash](self->_spokenTitles, "hash");
  v30 = -[NSMutableArray hash](self->_itemIds, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v29 = 2654435761 * self->_numItems;
  else
    v29 = 0;
  v3 = -[NSMutableArray hash](self->_collectionClassDisplayNames, "hash");
  v4 = -[NSMutableArray hash](self->_collectionClassSpokenNames, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    modifiedTime = self->_modifiedTime;
    v7 = -modifiedTime;
    if (modifiedTime >= 0.0)
      v7 = self->_modifiedTime;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v10 = fmod(v8, 1.84467441e19);
    v11 = 2654435761u * (unint64_t)v10;
    v12 = v11 + (unint64_t)v9;
    if (v9 <= 0.0)
      v12 = 2654435761u * (unint64_t)v10;
    v13 = v11 - (unint64_t)fabs(v9);
    if (v9 < 0.0)
      v5 = v13;
    else
      v5 = v12;
  }
  else
  {
    v5 = 0;
  }
  v14 = -[NSString hash](self->_url, "hash");
  v15 = -[NSString hash](self->_authorName, "hash");
  v16 = -[GEOPDPublisher hash](self->_publisher, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v17 = 2654435761 * self->_enableFallbackImagesForItems;
  else
    v17 = 0;
  v18 = -[GEOPDCaptionedPhoto hash](self->_authorPhoto, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v19 = 2654435761 * self->_errorState;
  else
    v19 = 0;
  v20 = v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v3 ^ v4 ^ v5 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[NSMutableArray hash](self->_collectionDescriptionBytes, "hash");
  v21 = -[NSMutableArray hash](self->_collectionDescriptionHtmls, "hash");
  v22 = v21 ^ -[NSMutableArray hash](self->_collectionItemDescriptions, "hash");
  v23 = v22 ^ -[NSMutableArray hash](self->_collectionItemDescriptionHtmls, "hash");
  v24 = v23 ^ -[NSMutableArray hash](self->_longTitles, "hash");
  v25 = v24 ^ -[NSMutableArray hash](self->_longSpokenTitles, "hash");
  v26 = v25 ^ -[NSMutableArray hash](self->_mediaLinks, "hash");
  v27 = v20 ^ v26 ^ -[NSMutableArray hash](self->_itemPhotos, "hash");
  return v27 ^ -[NSMutableArray hash](self->_localizedCategorys, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_spokenTitles, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_publisherId, 0);
  objc_storeStrong((id *)&self->_placeCollectionItems, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_mediaLinks, 0);
  objc_storeStrong((id *)&self->_longTitles, 0);
  objc_storeStrong((id *)&self->_longSpokenTitles, 0);
  objc_storeStrong((id *)&self->_localizedCategorys, 0);
  objc_storeStrong((id *)&self->_itemPhotos, 0);
  objc_storeStrong((id *)&self->_itemIds, 0);
  objc_storeStrong((id *)&self->_displayTitles, 0);
  objc_storeStrong((id *)&self->_collectionItemDescriptions, 0);
  objc_storeStrong((id *)&self->_collectionItemDescriptionHtmls, 0);
  objc_storeStrong((id *)&self->_collectionId, 0);
  objc_storeStrong((id *)&self->_collectionDescriptions, 0);
  objc_storeStrong((id *)&self->_collectionDescriptionHtmls, 0);
  objc_storeStrong((id *)&self->_collectionDescriptionBytes, 0);
  objc_storeStrong((id *)&self->_collectionClassSpokenNames, 0);
  objc_storeStrong((id *)&self->_collectionClassDisplayNames, 0);
  objc_storeStrong((id *)&self->_authorPhoto, 0);
  objc_storeStrong((id *)&self->_authorName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
