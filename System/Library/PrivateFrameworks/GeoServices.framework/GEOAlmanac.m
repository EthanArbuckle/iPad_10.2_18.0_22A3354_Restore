@implementation GEOAlmanac

- (void)calculateAstronomicalTimeForLocation:(id)a3
{
  -[GEOAlmanac calculateAstronomicalTimeForLocation:altitudeInDegrees:](self, "calculateAstronomicalTimeForLocation:altitudeInDegrees:", a3.var0, a3.var1, -3.0);
}

- (void)calculateAstronomicalTimeForLocation:(id)a3 altitudeInDegrees:(double)a4
{
  double var1;
  double var0;
  id v8;

  var1 = a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:](self, "calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:", var0, var1, a4);

}

- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4
{
  -[GEOAlmanac calculateAstronomicalTimeForLocation:time:altitudeInDegrees:](self, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:", a3.var0, a3.var1, a4, -3.0);
}

- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5
{
  double var1;
  double var0;
  id v9;

  var1 = a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:](self, "calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:", var0, var1, a5);

}

- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 options:(unint64_t)a6
{
  double var1;
  double var0;
  id v10;

  var1 = a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:](self, "calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:", var0, var1, a5);

}

- (void)calculateAstronomicalTimeForLocation:(id)a3 date:(id)a4 altitudeInDegrees:(double)a5 options:(unint64_t)a6
{
  char v6;
  double v9;
  double v10;
  GEOAlmanacRiseTransitSet *previousRiseTransitSet;
  GEOAlmanacRiseTransitSet *currentRiseTransitSet;
  GEOAlmanacRiseTransitSet *nextRiseTransitSet;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  _BOOL8 v22;
  double v23;
  void (**v24)(_QWORD, _QWORD, double);
  double v25;
  double v26;
  GEOAlmanacRiseTransitSet *v27;
  uint64_t v28;
  int v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t v33;
  int v34;
  unint64_t v35;
  double v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  BOOL v45;
  _QWORD *v46;
  _QWORD *v47;
  double v48;
  _QWORD *v49;
  _QWORD *v50;
  int v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t *v54;
  BOOL v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  GEOAlmanacRiseTransitSet *v59;
  GEOAlmanacRiseTransitSet *v60;
  GEOAlmanacRiseTransitSet *v61;
  GEOAlmanacRiseTransitSet *v62;
  uint64_t *v63;
  uint64_t v64;
  void (**v65)(_QWORD, _QWORD, _QWORD);
  uint64_t *v66;
  uint64_t *v67;
  _QWORD *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  int v85;
  int v86;
  GEOAlmanacRiseTransitSet *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  GEOAlmanacRiseTransitSet *v100;
  GEOAlmanacRiseTransitSet *v101;
  uint64_t v102;
  int v103;
  _QWORD *v104;
  int v105;
  unint64_t v106;
  double v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  unint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  _QWORD *v116;
  GEOAlmanacRiseTransitSet *v117;
  GEOAlmanacRiseTransitSet *v118;
  BOOL v119;
  char v120;
  int v121;
  BOOL v122;
  char v123;
  NSObject *v124;
  int v125;
  NSObject *v126;
  $F24F406B2B787EFB06265DBA3D28CBD5 v127;
  id v128;
  id v129;
  void *v130;
  CAADynamicalTime *v131;
  double v132;
  NSObject *v133;
  NSObject *v134;
  $F24F406B2B787EFB06265DBA3D28CBD5 v135;
  id v136;
  id v137;
  void *v138;
  CAADynamicalTime *v139;
  double v140;
  NSObject *v141;
  $F24F406B2B787EFB06265DBA3D28CBD5 v142;
  id v143;
  id v144;
  void *v145;
  CAADynamicalTime *v146;
  double v147;
  double v148;
  id v149;
  void (**v150)(_QWORD, _QWORD, double);
  _QWORD v151[6];
  $F24F406B2B787EFB06265DBA3D28CBD5 v152;
  double v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  _QWORD *(*v161)(_QWORD *, _QWORD *);
  void (*v162)(uint64_t);
  const char *v163;
  _QWORD **v164;
  _QWORD *v165[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 v166;
  unint64_t v167;
  int v168;
  unint64_t v169;
  int v170;
  unint64_t v171;
  int v172;
  _QWORD v173[8];
  _QWORD v174[3];
  char v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  __n128 (*v179)(__n128 *, __n128 *);
  uint64_t (*v180)();
  const char *v181;
  uint64_t *v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  __n128 (*v187)(__n128 *, __n128 *);
  uint64_t (*v188)();
  const char *v189;
  uint64_t *v190;
  uint64_t *v191;
  _BYTE buf[32];
  _BYTE v193[32];
  double v194;
  uint64_t v195;

  v6 = a6;
  v195 = *MEMORY[0x1E0C80C00];
  v166 = a3;
  v149 = a4;
  objc_msgSend(v149, "geo_julianDay");
  v10 = v9;
  self->_location = ($AB5116BA7E623E054F959CECB034F4E7)v166;
  self->_altitude = a5;
  v158 = 0;
  v159 = &v158;
  v160 = 0x4812000000;
  v161 = __Block_byref_object_copy__89;
  v162 = __Block_byref_object_dispose__89;
  v165[0] = 0;
  v165[1] = 0;
  v163 = "";
  v164 = v165;
  previousRiseTransitSet = self->_previousRiseTransitSet;
  self->_previousRiseTransitSet = 0;

  currentRiseTransitSet = self->_currentRiseTransitSet;
  self->_currentRiseTransitSet = 0;

  nextRiseTransitSet = self->_nextRiseTransitSet;
  self->_nextRiseTransitSet = 0;

  GEOGetAlmanacLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68158211;
    *(_DWORD *)&buf[4] = 16;
    *(_WORD *)&buf[8] = 2097;
    *(_QWORD *)&buf[10] = &v166;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = a5;
    _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "location: [%{private,geo:coordinate}.*P] altitude: %f", buf, 0x1Cu);
  }

  GEOGetAlmanacLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (fabs(v166.var0) < 0.001)
      objc_msgSend(v17, "addObject:", CFSTR("latitude"));
    if (fabs(v166.var1) < 0.001)
      objc_msgSend(v18, "addObject:", CFSTR("longitude"));
    if (objc_msgSend(v18, "count"))
    {
      GEOGetAlmanacLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" & "));
        v20 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "location %{public}@ is effectively zero", buf, 0xCu);

      }
    }

  }
  GEOGetAlmanacLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v22)
  {
    v23 = CAADynamicalTime::UTC2TT((CAADynamicalTime *)v22, v10);
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v23;
    _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "today's julian date: %f ephemeris date: %f", buf, 0x16u);
  }

  v154 = 0;
  v155 = &v154;
  v156 = 0x2020000000;
  v157 = 0;
  v151[0] = MEMORY[0x1E0C809B0];
  v151[1] = 3221225472;
  v151[2] = __82__GEOAlmanac_calculateAstronomicalTimeForLocation_date_altitudeInDegrees_options___block_invoke;
  v151[3] = &unk_1E1C157D0;
  v152 = v166;
  v153 = a5;
  v151[4] = &v158;
  v151[5] = &v154;
  v24 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x18D765024](v151);
  v150 = v24;
  v24[2](v24, 0, v10);
  v24[2](v24, 1, v10 + -0.000694444444);
  if (!v159[8])
  {
    GEOGetAlmanacLog();
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v133, OS_LOG_TYPE_FAULT, "failed to find any rts events", buf, 2u);
    }

    if (!v159[8])
      goto LABEL_219;
  }
  v25 = v10;
  v26 = v10;
  v148 = a5;
  do
  {
    v27 = self->_currentRiseTransitSet;
    if (v27)
    {
      v28 = -[GEOAlmanacRiseTransitSet firstItem](v27, "firstItem");
      v30 = v159;
      v31 = (uint64_t *)v159[6];
      v32 = v159 + 7;
      v33 = (uint64_t)v31;
      if (v31 != v159 + 7)
      {
        v34 = v29;
        v35 = 0;
        v36 = *(double *)&v28;
        v37 = (_QWORD *)v159[6];
        do
        {
          v38 = (_QWORD *)v37[1];
          if (v38)
          {
            do
            {
              v39 = v38;
              v38 = (_QWORD *)*v38;
            }
            while (v38);
          }
          else
          {
            do
            {
              v39 = (_QWORD *)v37[2];
              v55 = *v39 == (_QWORD)v37;
              v37 = v39;
            }
            while (!v55);
          }
          ++v35;
          v37 = v39;
        }
        while (v39 != v32);
        v33 = v159[6];
        do
        {
          v40 = v35 >> 1;
          v41 = (_QWORD *)v33;
          if (v35 >= 2)
          {
            v42 = v35 >> 1;
            v43 = v33;
            do
            {
              v44 = *(_QWORD **)(v43 + 8);
              if (v44)
              {
                do
                {
                  v41 = v44;
                  v44 = (_QWORD *)*v44;
                }
                while (v44);
              }
              else
              {
                do
                {
                  v41 = *(_QWORD **)(v43 + 16);
                  v55 = *v41 == v43;
                  v43 = (uint64_t)v41;
                }
                while (!v55);
              }
              v43 = (uint64_t)v41;
              v45 = v42-- <= 1;
            }
            while (!v45);
          }
          if (_GEORiseTransitSetEventIsLessThan::operator()(*((_DWORD *)v41 + 10), v34, *((double *)v41 + 4), v36))
          {
            v46 = (_QWORD *)v41[1];
            if (v46)
            {
              do
              {
                v33 = (uint64_t)v46;
                v46 = (_QWORD *)*v46;
              }
              while (v46);
            }
            else
            {
              do
              {
                v33 = v41[2];
                v55 = *(_QWORD *)v33 == (_QWORD)v41;
                v41 = (_QWORD *)v33;
              }
              while (!v55);
            }
            v40 = v35 + ~v40;
          }
          v35 = v40;
        }
        while (v40);
      }
      v27 = self->_currentRiseTransitSet;
      if (v27)
      {
        v24 = v150;
        if (v32 != (_QWORD *)v33)
          goto LABEL_89;
      }
      else
      {
        v24 = v150;
      }
    }
    else
    {
      v30 = v159;
      v31 = (uint64_t *)v159[6];
    }
    v47 = v30 + 7;
    v33 = (uint64_t)v31;
    if (v31 != v30 + 7)
    {
      v33 = (uint64_t)v31;
      while (1)
      {
        v48 = *(double *)(v33 + 32);
        if (v48 >= v10 || vabdd_f64(v48, v10) < 0.0007)
          break;
        v49 = *(_QWORD **)(v33 + 8);
        if (v49)
        {
          do
          {
            v50 = v49;
            v49 = (_QWORD *)*v49;
          }
          while (v49);
        }
        else
        {
          do
          {
            v50 = *(_QWORD **)(v33 + 16);
            v55 = *v50 == v33;
            v33 = (uint64_t)v50;
          }
          while (!v55);
        }
        v33 = (uint64_t)v50;
        if (v50 == v47)
          goto LABEL_218;
      }
    }
    if ((_QWORD *)v33 == v47)
    {
LABEL_218:
      if (v30[8])
        goto LABEL_219;
      GEOGetAlmanacLog();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v126, OS_LOG_TYPE_FAULT, "failed to find requested JD", buf, 2u);
      }
      goto LABEL_226;
    }
    v51 = *(_DWORD *)(v33 + 40);
    if ((uint64_t *)v33 != v31 && v51 != 8)
    {
      v52 = (_QWORD *)v33;
      while (*(double *)(v33 + 32) - *((double *)v52 + 4) <= 1.1)
      {
        if (*((_DWORD *)v52 + 10) == 8)
        {
          v33 = (uint64_t)v52;
          break;
        }
        v53 = (uint64_t *)*v52;
        if (*v52)
        {
          do
          {
            v54 = v53;
            v53 = (uint64_t *)v53[1];
          }
          while (v53);
        }
        else
        {
          do
          {
            v54 = (uint64_t *)v52[2];
            v55 = *v54 == (_QWORD)v52;
            v52 = v54;
          }
          while (v55);
        }
        v52 = v54;
        if (v54 == v31)
          break;
      }
      v51 = *(_DWORD *)(v33 + 40);
    }
    v55 = v51 == 8 || v33 == (_QWORD)v47;
    if (!v55)
    {
      v56 = (_QWORD *)v33;
      while (*((double *)v56 + 4) - *(double *)(v33 + 32) <= 0.9)
      {
        if (*((_DWORD *)v56 + 10) == 8)
        {
          v33 = (uint64_t)v56;
          break;
        }
        v57 = (_QWORD *)v56[1];
        if (v57)
        {
          do
          {
            v58 = v57;
            v57 = (_QWORD *)*v57;
          }
          while (v57);
        }
        else
        {
          do
          {
            v58 = (_QWORD *)v56[2];
            v55 = *v58 == (_QWORD)v56;
            v56 = v58;
          }
          while (!v55);
        }
        v56 = v58;
        if (v58 == v47)
          break;
      }
    }
LABEL_89:
    if ((v6 & 6) != 0 && !-[GEOAlmanacRiseTransitSet isIdeal](v27, "isIdeal"))
    {
      if (self->_currentRiseTransitSet)
      {
        v59 = self->_previousRiseTransitSet;
        self->_previousRiseTransitSet = 0;

        v60 = self->_nextRiseTransitSet;
        self->_nextRiseTransitSet = 0;

      }
      _getRTS<std::__tree_const_iterator<_GEORiseTransitSetEvent,std::__tree_node<_GEORiseTransitSetEvent,void *> *,long>,BOOL (*)(unsigned int,unsigned int)>(v33, v159 + 7);
      v61 = (GEOAlmanacRiseTransitSet *)objc_claimAutoreleasedReturnValue();
      v62 = self->_currentRiseTransitSet;
      self->_currentRiseTransitSet = v61;

    }
    if ((v6 & 1) != 0 && !-[GEOAlmanacRiseTransitSet isIdeal](self->_previousRiseTransitSet, "isIdeal"))
    {
      v63 = (uint64_t *)v159[6];
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x4012000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__118;
      *(_QWORD *)v193 = __Block_byref_object_dispose__119;
      *(_QWORD *)&v193[8] = "";
      *(_QWORD *)&v193[16] = v63;
      *(_QWORD *)&v193[24] = v63;
      v184 = 0;
      v185 = &v184;
      v186 = 0x4012000000;
      v187 = __Block_byref_object_copy__118;
      v188 = __Block_byref_object_dispose__119;
      v189 = "";
      v190 = v63;
      v191 = v63;
      v176 = 0;
      v177 = &v176;
      v178 = 0x4012000000;
      v179 = __Block_byref_object_copy__118;
      v180 = __Block_byref_object_dispose__119;
      v181 = "";
      v182 = v63;
      v183 = v63;
      v174[0] = 0;
      v174[1] = v174;
      v174[2] = 0x2020000000;
      v175 = 0;
      v173[0] = MEMORY[0x1E0C809B0];
      v173[1] = 3221225472;
      v173[2] = ___ZL7_getRTSINSt3__116reverse_iteratorINS0_21__tree_const_iteratorI23_GEORiseTransitSetEventPNS0_11__tree_nodeIS3_PvEElEEEEPFbjjEEP24GEOAlmanacRiseTransitSetT_SE_T0__block_invoke;
      v173[3] = &unk_1E1C15820;
      v173[4] = buf;
      v173[5] = &v176;
      v173[6] = &v184;
      v173[7] = v174;
      v64 = MEMORY[0x18D765024](v173);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v64;
      if ((uint64_t *)v33 != v63)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v64, v33, v33);
        v66 = *(uint64_t **)v33;
        v67 = *(uint64_t **)v33;
        v68 = (_QWORD *)v33;
        if (*(_QWORD *)v33)
        {
          do
          {
            v69 = v67;
            v67 = (uint64_t *)v67[1];
          }
          while (v67);
        }
        else
        {
          do
          {
            v69 = (uint64_t *)v68[2];
            v55 = *v69 == (_QWORD)v68;
            v68 = v69;
          }
          while (v55);
        }
        if (v69 != v63)
        {
          v70 = v33;
          if (v66)
          {
            do
            {
              v71 = (uint64_t)v66;
              v66 = (uint64_t *)v66[1];
            }
            while (v66);
          }
          else
          {
            do
            {
              v71 = *(_QWORD *)(v70 + 16);
              v55 = *(_QWORD *)v71 == v70;
              v70 = v71;
            }
            while (v55);
          }
          v72 = *v69;
          v73 = v69;
          if (*v69)
          {
            do
            {
              v74 = v72;
              v72 = *(_QWORD *)(v72 + 8);
            }
            while (v72);
          }
          else
          {
            do
            {
              v74 = v73[2];
              v55 = *(_QWORD *)v74 == (_QWORD)v73;
              v73 = (uint64_t *)v74;
            }
            while (v55);
          }
          v75 = *(_DWORD *)(v71 + 40);
          v76 = *(_DWORD *)(v74 + 40);
          if (v75 == 8)
          {
            if (v76 != 32)
              goto LABEL_140;
          }
          else if (v75 == 32)
          {
            if (v76 != 16)
              goto LABEL_140;
          }
          else if (v75 != 16 || v76 != 8)
          {
            goto LABEL_140;
          }
          ((void (**)(_QWORD, uint64_t, uint64_t *))v65)[2](v65, v33, v69);
          v77 = *v69;
          v78 = (uint64_t *)*v69;
          v79 = v69;
          if (*v69)
          {
            do
            {
              v80 = v78;
              v78 = (uint64_t *)v78[1];
            }
            while (v78);
          }
          else
          {
            do
            {
              v80 = (uint64_t *)v79[2];
              v55 = *v80 == (_QWORD)v79;
              v79 = v80;
            }
            while (v55);
          }
          if (v80 != v63)
          {
            if (v77)
            {
              do
              {
                v81 = v77;
                v77 = *(_QWORD *)(v77 + 8);
              }
              while (v77);
            }
            else
            {
              do
              {
                v81 = v69[2];
                v55 = *(_QWORD *)v81 == (_QWORD)v69;
                v69 = (uint64_t *)v81;
              }
              while (v55);
            }
            v82 = *v80;
            v83 = v80;
            if (*v80)
            {
              do
              {
                v84 = v82;
                v82 = *(_QWORD *)(v82 + 8);
              }
              while (v82);
            }
            else
            {
              do
              {
                v84 = v83[2];
                v55 = *(_QWORD *)v84 == (_QWORD)v83;
                v83 = (uint64_t *)v84;
              }
              while (v55);
            }
            v85 = *(_DWORD *)(v81 + 40);
            v86 = *(_DWORD *)(v84 + 40);
            if (v85 != 8)
            {
              if (v85 == 32)
              {
                if (v86 != 16)
                  goto LABEL_140;
              }
              else if (v85 != 16 || v86 != 8)
              {
                goto LABEL_140;
              }
              goto LABEL_139;
            }
            if (v86 == 32)
LABEL_139:
              ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), uint64_t))v65[2])(v65, v33);
          }
        }
      }
LABEL_140:
      v87 = [GEOAlmanacRiseTransitSet alloc];
      v88 = *(uint64_t **)(*(_QWORD *)&buf[8] + 56);
      if (v88 == v63)
      {
        v171 = 0xBFF0000000000000;
        v91 = -1;
      }
      else
      {
        v89 = *v88;
        if (*v88)
        {
          do
          {
            v90 = v89;
            v89 = *(_QWORD *)(v89 + 8);
          }
          while (v89);
        }
        else
        {
          do
          {
            v90 = v88[2];
            v55 = *(_QWORD *)v90 == (_QWORD)v88;
            v88 = (uint64_t *)v90;
          }
          while (v55);
        }
        v171 = *(_QWORD *)(v90 + 32);
        v91 = *(_DWORD *)(v90 + 40);
      }
      v172 = v91;
      v92 = (uint64_t *)v185[7];
      if (v92 == v63)
      {
        v169 = 0xBFF0000000000000;
        v95 = -1;
      }
      else
      {
        v93 = *v92;
        if (*v92)
        {
          do
          {
            v94 = v93;
            v93 = *(_QWORD *)(v93 + 8);
          }
          while (v93);
        }
        else
        {
          do
          {
            v94 = v92[2];
            v55 = *(_QWORD *)v94 == (_QWORD)v92;
            v92 = (uint64_t *)v94;
          }
          while (v55);
        }
        v169 = *(_QWORD *)(v94 + 32);
        v95 = *(_DWORD *)(v94 + 40);
      }
      v170 = v95;
      v96 = (uint64_t *)v177[7];
      if (v96 == v63)
      {
        v167 = 0xBFF0000000000000;
        v99 = -1;
      }
      else
      {
        v97 = *v96;
        if (*v96)
        {
          do
          {
            v98 = v97;
            v97 = *(_QWORD *)(v97 + 8);
          }
          while (v97);
        }
        else
        {
          do
          {
            v98 = v96[2];
            v55 = *(_QWORD *)v98 == (_QWORD)v96;
            v96 = (uint64_t *)v98;
          }
          while (v55);
        }
        v167 = *(_QWORD *)(v98 + 32);
        v99 = *(_DWORD *)(v98 + 40);
      }
      v168 = v99;
      v100 = -[GEOAlmanacRiseTransitSet initWithRise:transit:set:](v87, "initWithRise:transit:set:", &v171, &v169, &v167);

      _Block_object_dispose(v174, 8);
      _Block_object_dispose(&v176, 8);
      _Block_object_dispose(&v184, 8);
      _Block_object_dispose(buf, 8);
      v101 = self->_previousRiseTransitSet;
      self->_previousRiseTransitSet = v100;

    }
    if ((v6 & 4) != 0
      && self->_currentRiseTransitSet
      && !-[GEOAlmanacRiseTransitSet isIdeal](self->_nextRiseTransitSet, "isIdeal"))
    {
      v102 = -[GEOAlmanacRiseTransitSet lastItem](self->_currentRiseTransitSet, "lastItem");
      v104 = v159 + 7;
      if ((uint64_t *)v33 != v159 + 7)
      {
        v105 = v103;
        v106 = 0;
        v107 = *(double *)&v102;
        v108 = (_QWORD *)v33;
        do
        {
          v109 = (_QWORD *)v108[1];
          if (v109)
          {
            do
            {
              v110 = v109;
              v109 = (_QWORD *)*v109;
            }
            while (v109);
          }
          else
          {
            do
            {
              v110 = (_QWORD *)v108[2];
              v55 = *v110 == (_QWORD)v108;
              v108 = v110;
            }
            while (!v55);
          }
          ++v106;
          v108 = v110;
        }
        while (v110 != v104);
        do
        {
          v111 = v106 >> 1;
          v112 = (_QWORD *)v33;
          if (v106 >= 2)
          {
            v113 = v106 >> 1;
            v114 = v33;
            do
            {
              v115 = *(_QWORD **)(v114 + 8);
              if (v115)
              {
                do
                {
                  v112 = v115;
                  v115 = (_QWORD *)*v115;
                }
                while (v115);
              }
              else
              {
                do
                {
                  v112 = *(_QWORD **)(v114 + 16);
                  v55 = *v112 == v114;
                  v114 = (uint64_t)v112;
                }
                while (!v55);
              }
              v114 = (uint64_t)v112;
              v45 = v113-- <= 1;
            }
            while (!v45);
          }
          if (!_GEORiseTransitSetEventIsLessThan::operator()(v105, *((_DWORD *)v112 + 10), v107, *((double *)v112 + 4)))
          {
            v116 = (_QWORD *)v112[1];
            if (v116)
            {
              do
              {
                v33 = (uint64_t)v116;
                v116 = (_QWORD *)*v116;
              }
              while (v116);
            }
            else
            {
              do
              {
                v33 = v112[2];
                v55 = *(_QWORD *)v33 == (_QWORD)v112;
                v112 = (_QWORD *)v33;
              }
              while (!v55);
            }
            v111 = v106 + ~v111;
          }
          v106 = v111;
        }
        while (v111);
      }
      if (v104 != (_QWORD *)v33)
      {
        _getRTS<std::__tree_const_iterator<_GEORiseTransitSetEvent,std::__tree_node<_GEORiseTransitSetEvent,void *> *,long>,BOOL (*)(unsigned int,unsigned int)>(v33, v104);
        v117 = (GEOAlmanacRiseTransitSet *)objc_claimAutoreleasedReturnValue();
        v118 = self->_nextRiseTransitSet;
        self->_nextRiseTransitSet = v117;

      }
    }
    if ((v6 & 1) != 0
      && ((v119 = -[GEOAlmanacRiseTransitSet isIdeal](self->_previousRiseTransitSet, "isIdeal"), v26 <= v10 + -2.0)
        ? (v120 = 1)
        : (v120 = v119),
          (v120 & 1) == 0))
    {
      v26 = v26 + -0.9;
      v24[2](v24, 0, v26);
      v121 = 1;
      if ((v6 & 4) == 0)
        continue;
    }
    else
    {
      v121 = 0;
      if ((v6 & 4) == 0)
        continue;
    }
    v122 = -[GEOAlmanacRiseTransitSet isIdeal](self->_nextRiseTransitSet, "isIdeal");
    v123 = v25 >= v10 + 2.0 || v122;
    if ((v123 & 1) == 0)
    {
      v25 = v25 + 0.9;
      v121 = 1;
      v24[2](v24, 1, v25);
    }
  }
  while (v121);
  if (*((int *)v155 + 6) >= 3)
  {
    GEOGetAlmanacLog();
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      v125 = *((_DWORD *)v155 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v125;
      _os_log_impl(&dword_1885A9000, v124, OS_LOG_TYPE_ERROR, "Created %d duplicate events, this would be a good thing to optimize.", buf, 8u);
    }

  }
  if ((v6 & 1) != 0 && !self->_previousRiseTransitSet)
  {
    GEOGetAlmanacLog();
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT))
    {
      v142 = v166;
      v143 = v149;
      v144 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v144, "stringFromDate:", v143);
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      v146 = v145;
      v147 = CAADynamicalTime::UTC2TT(v146, v10);
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "failed to find any previous rts events";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v142.var0;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v142.var1;
      *(_WORD *)v193 = 2048;
      *(double *)&v193[2] = v148;
      *(_WORD *)&v193[10] = 2112;
      *(_QWORD *)&v193[12] = v146;
      *(_WORD *)&v193[20] = 2048;
      *(double *)&v193[22] = v10;
      *(_WORD *)&v193[30] = 2048;
      v194 = v147;
      _os_log_impl(&dword_1885A9000, v141, OS_LOG_TYPE_FAULT, "%s for: [%f, %f] altitude: %f date: %@ julian date: %f ephemeris date: %f", buf, 0x48u);

    }
    v24 = v150;
  }
  if ((v6 & 6) != 0 && !self->_currentRiseTransitSet)
  {
    GEOGetAlmanacLog();
    v134 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT))
    {
      v135 = v166;
      v136 = v149;
      v137 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v137, "stringFromDate:", v136);
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      v139 = v138;
      v140 = CAADynamicalTime::UTC2TT(v139, v10);
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "failed to find any current rts events";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v135.var0;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v135.var1;
      *(_WORD *)v193 = 2048;
      *(double *)&v193[2] = v148;
      *(_WORD *)&v193[10] = 2112;
      *(_QWORD *)&v193[12] = v139;
      *(_WORD *)&v193[20] = 2048;
      *(double *)&v193[22] = v10;
      *(_WORD *)&v193[30] = 2048;
      v194 = v140;
      _os_log_impl(&dword_1885A9000, v134, OS_LOG_TYPE_FAULT, "%s for: [%f, %f] altitude: %f date: %@ julian date: %f ephemeris date: %f", buf, 0x48u);

    }
    v24 = v150;
  }
  if ((v6 & 4) != 0 && !self->_nextRiseTransitSet)
  {
    GEOGetAlmanacLog();
    v126 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT))
    {
      v127 = v166;
      v128 = v149;
      v129 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v129, "stringFromDate:", v128);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      v131 = v130;
      v132 = CAADynamicalTime::UTC2TT(v131, v10);
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = "failed to find any next rts events";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v127.var0;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v127.var1;
      *(_WORD *)v193 = 2048;
      *(double *)&v193[2] = v148;
      *(_WORD *)&v193[10] = 2112;
      *(_QWORD *)&v193[12] = v131;
      *(_WORD *)&v193[20] = 2048;
      *(double *)&v193[22] = v10;
      *(_WORD *)&v193[30] = 2048;
      v194 = v132;
      _os_log_impl(&dword_1885A9000, v126, OS_LOG_TYPE_FAULT, "%s for: [%f, %f] altitude: %f date: %@ julian date: %f ephemeris date: %f", buf, 0x48u);

      v24 = v150;
    }
    else
    {
      v24 = v150;
    }
LABEL_226:

  }
LABEL_219:

  _Block_object_dispose(&v154, 8);
  _Block_object_dispose(&v158, 8);
  std::__tree<std::__value_type<std::pair<google::protobuf::Descriptor const*,int>,google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<google::protobuf::Descriptor const*,int>,google::protobuf::FieldDescriptor const*>,std::less<std::pair<google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<google::protobuf::Descriptor const*,int>,google::protobuf::FieldDescriptor const*>>>::destroy(v165[0]);

}

_QWORD *__82__GEOAlmanac_calculateAstronomicalTimeForLocation_date_altitudeInDegrees_options___block_invoke(uint64_t a1, char a2, double a3)
{
  __n128 v4;
  _QWORD *result;
  uint64_t v6;
  _GEORiseTransitSetEvent v7;
  _GEORiseTransitSetEvent v8;
  _GEORiseTransitSetEvent v9;
  char v10;
  double v11;
  _BYTE v12[312];
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v10 = a2;
  GEORiseTransitSet::GEORiseTransitSet((uint64_t)v12, (double *)(a1 + 48), &v11, (_QWORD *)(a1 + 64), &-[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:]::AccuracySeconds, &v10);
  _GEORiseTransitSetEvent::_GEORiseTransitSetEvent(&v9, (GEORiseTransitSet *)v12, 8u);
  _GEORiseTransitSetEvent::_GEORiseTransitSetEvent(&v8, (GEORiseTransitSet *)v12, 0x10u);
  _GEORiseTransitSetEvent::_GEORiseTransitSetEvent(&v7, (GEORiseTransitSet *)v12, 0x20u);
  if (v9.JD > 0.0
    && (std::__tree<_GEORiseTransitSetEvent,_GEORiseTransitSetEventIsLessThan,std::allocator<_GEORiseTransitSetEvent>>::__emplace_unique_key_args<_GEORiseTransitSetEvent,_GEORiseTransitSetEvent const&>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), v9.type, &v9, v9.JD) & 1) == 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  if (v8.JD > 0.0
    && (std::__tree<_GEORiseTransitSetEvent,_GEORiseTransitSetEventIsLessThan,std::allocator<_GEORiseTransitSetEvent>>::__emplace_unique_key_args<_GEORiseTransitSetEvent,_GEORiseTransitSetEvent const&>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), v8.type, &v8, v8.JD) & 1) == 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  v4.n128_u64[0] = *(_QWORD *)&v7.JD;
  if (v7.JD > 0.0
    && (std::__tree<_GEORiseTransitSetEvent,_GEORiseTransitSetEventIsLessThan,std::allocator<_GEORiseTransitSetEvent>>::__emplace_unique_key_args<_GEORiseTransitSetEvent,_GEORiseTransitSetEvent const&>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), v7.type, &v7, v7.JD) & 1) == 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  result = v14;
  if (v14 == v13)
  {
    v6 = 4;
    result = v13;
  }
  else
  {
    if (!v14)
      return result;
    v6 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(__n128))(*result + 8 * v6))(v4);
}

- (void)calculateGeocentricDirectionForSunX:(double *)a3 Y:(double *)a4 Z:(double *)a5
{
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac calculateGeocentricDirectionForSunX:Y:Z:date:](self, "calculateGeocentricDirectionForSunX:Y:Z:date:", a3, a4, a5);

}

- (void)calculateGeocentricDirectionForSunX:(double *)a3 Y:(double *)a4 Z:(double *)a5 date:(id)a6
{
  double v9;
  double v10;
  CAADynamicalTime *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  uint64_t i;
  uint64_t v29;
  __int128 v30;
  double v31;
  double v32;
  uint64_t v33;
  __int128 v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  id v44;
  _QWORD v45[3];
  double v46[3];
  __int128 v47;
  double v48;
  __int128 v49;
  double v50;
  __int128 v51;
  double v52;
  __int128 v53;
  double v54;

  v44 = a6;
  objc_msgSend(v44, "geo_hoursAndMinutes");
  v10 = v9;
  v11 = (CAADynamicalTime *)objc_msgSend(v44, "geo_julianDay");
  v13 = CAADynamicalTime::UTC2TT(v11, v12);
  v14 = CAASun::EquatorialRectangularCoordinatesMeanEquinox(0, v13);
  v16 = v15;
  v18 = v17;
  CAAEarth::EclipticLongitude(0, v13);
  v20 = fmod(v19 + 180.0, 360.0);
  v21 = 0;
  if (v20 < 0.0)
    v20 = v20 + 360.0;
  v49 = 0uLL;
  v50 = 1.0;
  v22 = v20 + 180.0 + v10 * 15.0;
  v23 = 0.0;
  do
  {
    v23 = v23 + *(double *)((char *)&v49 + v21) * *(double *)((char *)&v49 + v21);
    v21 += 8;
  }
  while (v21 != 24);
  v24 = 0;
  v25 = 1.0 / sqrt(v23);
  do
  {
    *(double *)((char *)&v53 + v24) = v25 * *(double *)((char *)&v49 + v24);
    v24 += 8;
  }
  while (v24 != 24);
  v51 = v53;
  v52 = v54;
  v26 = v22 * -0.0174532925 * 0.5;
  v27 = sin(v26);
  for (i = 0; i != 24; i += 8)
    *(double *)((char *)&v53 + i) = v27 * *(double *)((char *)&v51 + i);
  v29 = 0;
  v30 = v53;
  v31 = v54;
  *(double *)v45 = v14;
  *(double *)&v45[1] = v16;
  *(double *)&v45[2] = v18;
  v43 = -v54;
  *(double *)&v49 = *((double *)&v53 + 1) * v18 - v54 * v16;
  *((double *)&v49 + 1) = v54 * v14 - *(double *)&v53 * v18;
  v50 = *(double *)&v53 * v16 - *((double *)&v53 + 1) * v14;
  do
  {
    *(double *)((char *)&v53 + v29) = *(double *)((char *)&v49 + v29) + *(double *)((char *)&v49 + v29);
    v29 += 8;
  }
  while (v29 != 24);
  v32 = cos(v26);
  v33 = 0;
  v34 = v53;
  v35 = v54;
  v51 = v53;
  v52 = v54;
  do
  {
    *(double *)((char *)&v53 + v33) = v32 * *(double *)((char *)&v51 + v33);
    v33 += 8;
  }
  while (v33 != 24);
  v36 = 0;
  v47 = v53;
  v48 = v54;
  do
  {
    *(double *)((char *)&v53 + v36 * 8) = *(double *)&v45[v36] + *(double *)((char *)&v47 + v36 * 8);
    ++v36;
  }
  while (v36 != 3);
  v37 = 0;
  v49 = v53;
  v50 = v54;
  v46[0] = *((double *)&v34 + 1) * v43 + *((double *)&v30 + 1) * v35;
  v46[1] = v35 * -*(double *)&v30 + v31 * *(double *)&v34;
  v46[2] = *(double *)&v34 * -*((double *)&v30 + 1) + *(double *)&v30 * *((double *)&v34 + 1);
  do
  {
    *(double *)((char *)&v53 + v37 * 8) = *(double *)((char *)&v49 + v37 * 8) + v46[v37];
    ++v37;
  }
  while (v37 != 3);
  v38 = 0;
  v39 = 0.0;
  do
  {
    v39 = v39 + *(double *)((char *)&v53 + v38) * *(double *)((char *)&v53 + v38);
    v38 += 8;
  }
  while (v38 != 24);
  v40 = 0;
  v41 = 1.0 / sqrt(v39);
  do
  {
    *(double *)((char *)&v53 + v40) = v41 * *(double *)((char *)&v53 + v40);
    v40 += 8;
  }
  while (v40 != 24);
  v42 = *((_QWORD *)&v53 + 1);
  *(_QWORD *)a3 = v53;
  *(_QWORD *)a4 = v42;
  *a5 = v54;

}

- (NSDate)previousSunrise
{
  return -[GEOAlmanacRiseTransitSet rise](self->_previousRiseTransitSet, "rise");
}

- (NSDate)previousTransit
{
  return -[GEOAlmanacRiseTransitSet transit](self->_previousRiseTransitSet, "transit");
}

- (NSDate)previousSunset
{
  return -[GEOAlmanacRiseTransitSet set](self->_previousRiseTransitSet, "set");
}

- (NSDate)sunrise
{
  return -[GEOAlmanacRiseTransitSet rise](self->_currentRiseTransitSet, "rise");
}

- (NSDate)transit
{
  return -[GEOAlmanacRiseTransitSet transit](self->_currentRiseTransitSet, "transit");
}

- (NSDate)sunset
{
  return -[GEOAlmanacRiseTransitSet set](self->_currentRiseTransitSet, "set");
}

- (NSDate)nextSunrise
{
  return -[GEOAlmanacRiseTransitSet rise](self->_nextRiseTransitSet, "rise");
}

- (NSDate)nextTransit
{
  return -[GEOAlmanacRiseTransitSet transit](self->_nextRiseTransitSet, "transit");
}

- (NSDate)nextSunset
{
  return -[GEOAlmanacRiseTransitSet set](self->_nextRiseTransitSet, "set");
}

- (BOOL)isDayLight
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOAlmanac isDayLightForDate:](self, "isDayLightForDate:", v3);

  return (char)self;
}

- (BOOL)isDayLightForTime:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOAlmanac isDayLightForDate:](self, "isDayLightForDate:", v4);

  return (char)self;
}

- (BOOL)isDayLightForDate:(id)a3
{
  id v4;
  double longitude;
  double altitude;
  double latitude;
  double v8;
  double v9;
  double v10;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  longitude = self->_location.longitude;
  altitude = self->_altitude;
  latitude = self->_location.latitude;
  v9 = (v8 + *MEMORY[0x1E0C9ADF8]) / 86400.0;
  v23 = 0;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = v9 + 2440587.5;
  geo_getSunPosition((const GEODayCache *)&v12, latitude, -longitude);
  LOBYTE(self) = v10 - altitude >= 0.0;

  return (char)self;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p rise / transit / set> {\n"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("\tlocation: %f, %f x %f\n"), *(_QWORD *)&self->_location.latitude, *(_QWORD *)&self->_location.longitude, *(_QWORD *)&self->_altitude);
  -[GEOAlmanac previousSunrise](self, "previousSunrise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac previousTransit](self, "previousTransit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac previousSunset](self, "previousSunset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tprevious: %@ / %@ / %@\n"), v6, v7, v8);

  -[GEOAlmanac sunrise](self, "sunrise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac transit](self, "transit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac sunset](self, "sunset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcurrent:  %@ / %@ / %@\n"), v9, v10, v11);

  -[GEOAlmanac nextSunrise](self, "nextSunrise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac nextTransit](self, "nextTransit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlmanac nextSunset](self, "nextSunset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tnext:     %@ / %@ / %@\n"), v12, v13, v14);

  objc_msgSend(v3, "appendFormat:", CFSTR("\tprevious: %@\n"), self->_previousRiseTransitSet);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcurrent:  %@\n"), self->_currentRiseTransitSet);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tnext:     %@\n"), self->_nextRiseTransitSet);
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextRiseTransitSet, 0);
  objc_storeStrong((id *)&self->_currentRiseTransitSet, 0);
  objc_storeStrong((id *)&self->_previousRiseTransitSet, 0);
}

@end
