@implementation _OSLogIndexEnumerator

- (void)enumerateTracepointsInRange:(os_timesync_range_s *)a3 timesync:(_os_timesync_db_s *)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *p_var1;
  uint64_t v14;
  char *v15;
  _OSLogIndexEnumerator *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t i;
  os_timesync_range_s *v31;
  os_timesync_range_s *live_bound;
  uint64_t v33;
  unint64_t v34;
  _OSLogIndexEnumerator *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  _OWORD *v41;
  uint64_t v42;
  _OWORD *v43;
  id v44;
  void *v45;
  _OSLogIndexEnumerator *v46;
  id v47;
  void *v48;
  _OSLogIndexEnumerator *v49;
  id v50;
  _OSLogIndexEnumerator *v51;
  _OSLogIndexEnumerator *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  _OSLogIndexEnumerator *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  _OSLogIndexEnumerator *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  _OSLogIndexEnumerator *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  _OSLogIndexEnumerator *v73;
  _OSLogIndexEnumerator *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  BOOL v79;
  _OSLogIndexEnumerator *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _BOOL4 v88;
  BOOL v89;
  _OSLogIndexEnumerator *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  unint64_t next_major_time;
  _OSLogIndexEnumerator *v96;
  void *v97;
  unint64_t v98;
  uint64_t v99;
  _OSLogTracepointBuffer *tracepoints;
  uint64_t v101;
  id v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  _OSLogIndexEnumerator *v106;
  unint64_t v107;
  unint64_t *v109;
  unint64_t *v110;
  unint64_t *p_var2;
  uint64_t v112;
  uint64_t v113;
  _OSLogIndexEnumerator *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *context;
  _OSLogIndexEnumerator *v119;
  uint64_t v120;
  os_timesync_range_s *v121;
  _QWORD v122[4];
  id v123;
  uint64_t *v124;
  _QWORD *v125;
  uint64_t *v126;
  _QWORD *v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  unint64_t v135;
  _QWORD v136[3];
  char v137;
  _QWORD v138[2];
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  _OSLogIndexEnumerator *v144;
  _OSLogIndexEnumerator *v145;
  _QWORD *v146;
  _QWORD *v147;
  _QWORD v148[5];
  id v149;
  _QWORD v150[4];
  __int128 v151;
  uint64_t v152;

  v6 = *(_QWORD *)&a5;
  v152 = *MEMORY[0x1E0C80C00];
  v115 = a6;
  v121 = a3;
  if (a3->var0)
    v9 = *((_QWORD *)a3->var0 + 3);
  else
    v9 = 0;
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x2020000000;
  v137 = 0;
  v10 = *((_QWORD *)a4 + 10);
  v138[0] = 0;
  v138[1] = v10;
  if (!v9)
    goto LABEL_185;
  if ((v6 & 8) != 0)
    v11 = v9 - 1;
  else
    v11 = 0;
  v117 = 0;
  if ((v6 & 8) != 0)
    v12 = -1;
  else
    v12 = 0;
  p_var1 = &a3->var1;
  v110 = &a3->var1;
  p_var2 = &a3->var2;
  if ((v6 & 8) != 0)
    p_var1 = &a3->var2;
  v109 = p_var1;
  v14 = 1;
  if ((v6 & 8) != 0)
    v14 = -1;
  v112 = v14;
  v113 = v12;
  do
  {
    v15 = (char *)v121 + 16 * v11;
    v151 = *(_OWORD *)(v15 + 24);
    v116 = v11;
    v138[0] = v11;
    v16 = self;
    v17 = _os_trace_uuid_map_lookup(v121->var0, &v151);
    -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v9;
    if (v18)
    {
      do
      {
        v19 = _os_trace_uuid_map_lookup(v121->var0, (_QWORD *)objc_msgSend(v18, "bootUUID"));
        if (v19 == v17)
          break;
        if ((v6 & 8) != 0)
        {
          if (v19 <= v17)
            break;
        }
        else if (v19 >= v17)
        {
          break;
        }
        -[NSMutableArray removeObjectAtIndex:](self->_fileBootQ, "removeObjectAtIndex:", 0);
        -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");
        v20 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v20;
      }
      while (v20);

    }
    v119 = v16;
    -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      do
      {
        v22 = (_OWORD *)objc_msgSend(v21, "bootUUID");
        if (*v22 != v151)
          break;
        -[NSMutableArray removeObjectAtIndex:](self->_fileBootQ, "removeObjectAtIndex:", 0);
        if (objc_msgSend(v21, "_determineTimespan"))
        {
          -[NSMutableArray addObject:](self->_fileStartQ, "addObject:", v21);
          -[NSMutableArray addObject:](self->_fileEndQ, "addObject:", v21);
        }
        -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");
        v23 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v23;
      }
      while (v23);
    }
    -[NSMutableArray sortUsingFunction:context:](self->_fileStartQ, "sortUsingFunction:context:", _OSLogIndexOrderForOpening, v6);
    -[NSMutableArray sortUsingFunction:context:](self->_fileEndQ, "sortUsingFunction:context:", _OSLogIndexOrderForClosing, v6);

    v132 = 0;
    v133 = &v132;
    v24 = v113;
    v134 = 0x2020000000;
    if (!v117)
      v24 = *v109;
    v135 = v24;
    -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (!v25 || (v27 = (_QWORD *)objc_msgSend(v25, "bootUUID"), *v27 != *((_QWORD *)v15 + 3)))
    {

      v29 = v120;
      goto LABEL_177;
    }
    v28 = v27[1] == *((_QWORD *)v15 + 4);

    v29 = v120;
    if (!v28)
      goto LABEL_177;
    -[_OSLogTracepointBuffer beginInsertingTracepointsClippingFromTime:](self->_tracepoints, "beginInsertingTracepointsClippingFromTime:", 0);
    for (i = 0; i != 6; ++i)
    {
      v31 = self->_bounds[i];
      if (v31 && *(_OWORD *)&v31->var3[0][0] == v151)
        -[_OSLogTracepointBuffer insertNonsparsePoint:uuid:ttl:inMemory:](self->_tracepoints, "insertNonsparsePoint:uuid:ttl:inMemory:", v31->var1, v31->var3, (0x1E0E07030100uLL >> (8 * i)) & 0x1F, 0);
    }
    live_bound = self->_live_bound;
    if (live_bound && *(_OWORD *)&live_bound->var3[0][0] == v151)
      -[_OSLogTracepointBuffer insertNonsparsePoint:uuid:ttl:inMemory:](self->_tracepoints, "insertNonsparsePoint:uuid:ttl:inMemory:", live_bound->var1, live_bound->var3, 0, 1);
    -[_OSLogTracepointBuffer insertTimesyncPoints:forBoot:oldestContinuousTime:](self->_tracepoints, "insertTimesyncPoints:forBoot:oldestContinuousTime:", a4, &v151, v133[3]);
    v33 = -[_OSLogTracepointBuffer finishedInsertingTracepointsWithNextMajorTime:options:](self->_tracepoints, "finishedInsertingTracepointsWithNextMajorTime:options:", 0, v6);
    v128 = 0;
    v129 = &v128;
    v130 = 0x2020000000;
    v131 = 1;
    while (2)
    {
      context = (void *)MEMORY[0x1A1AEC1C8](v33);
      v34 = v133[3];
      v35 = v119;
      -[_OSLogTracepointBuffer beginInsertingTracepointsClippingFromTime:](self->_tracepoints, "beginInsertingTracepointsClippingFromTime:", v34);
      -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
        goto LABEL_68;
      -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      v39 = (v6 & 8) != 0 ? objc_msgSend(v37, "endTime") < v34 : objc_msgSend(v37, "oldestTime") > v34;

      if (v39)
        goto LABEL_68;
      v114 = v35;
      -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_67;
      while (1)
      {
        v41 = (_OWORD *)objc_msgSend(v40, "bootUUID");
        if (*v41 == v151)
          break;
        -[NSMutableArray removeObjectAtIndex:](self->_fileStartQ, "removeObjectAtIndex:", 0);
        -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
        v42 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)v42;
        if (!v42)
          goto LABEL_67;
      }
      while (1)
      {
        v43 = (_OWORD *)objc_msgSend(v40, "bootUUID");
        if (*v43 != v151)
        {
          v45 = v40;
          goto LABEL_66;
        }
        v44 = v40;
        v45 = v44;
        if ((v6 & 8) != 0)
          break;
        if (objc_msgSend(v44, "oldestTime") > v34)
          goto LABEL_65;

        if (objc_msgSend(v45, "endTime") >= v34)
        {
LABEL_59:
          v139 = 0;
          v46 = v114;
          v47 = v45;
          v48 = (void *)objc_msgSend(v47, "copyMappedChunkStore:", &v139);
          if (v48)
          {
            v49 = v46;
            v50 = v48;
            v150[0] = 0;
            v150[1] = v150;
            v150[2] = 0x2020000000;
            v150[3] = 0;
            v148[0] = 0;
            v148[1] = v148;
            v148[2] = 0x3032000000;
            v148[3] = __Block_byref_object_copy_;
            v148[4] = __Block_byref_object_dispose_;
            v149 = 0;
            v140 = MEMORY[0x1E0C809B0];
            v141 = 3221225472;
            v142 = ___oie_advance_cursor_open_store_block_invoke;
            v143 = &unk_1E4156D60;
            v146 = v150;
            v147 = v148;
            v51 = (_OSLogIndexEnumerator *)v50;
            v144 = v51;
            v52 = v49;
            v145 = v52;
            -[_OSLogIndexEnumerator enumerateChunksUsingBlock:](v51, "enumerateChunksUsingBlock:", &v140);
            -[NSMutableArray sortUsingFunction:context:](self->_catalogStartQ, "sortUsingFunction:context:", _OSLogIndexOrderForOpening, v6);

            _Block_object_dispose(v148, 8);
            _Block_object_dispose(v150, 8);

          }
        }
LABEL_62:
        -[NSMutableArray removeObjectAtIndex:](self->_fileStartQ, "removeObjectAtIndex:", 0);
        -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
          v45 = 0;
          goto LABEL_66;
        }
      }
      if (objc_msgSend(v44, "endTime") >= v34)
      {

        if (objc_msgSend(v45, "oldestTime") <= v34)
          goto LABEL_59;
        goto LABEL_62;
      }
LABEL_65:

LABEL_66:
LABEL_67:

LABEL_68:
      -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v53)
        goto LABEL_93;
      -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v56 = (v6 & 8) != 0 ? objc_msgSend(v54, "endTime") < v34 : objc_msgSend(v54, "oldestTime") > v34;

      if (v56)
        goto LABEL_93;
      v57 = v35;
      -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if (!v58)
        goto LABEL_92;
      if ((v6 & 8) == 0)
      {
        if (objc_msgSend(v58, "oldestTime") <= v34)
          goto LABEL_78;
LABEL_186:
        qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_open_catalogs called with nothing to open yet";
        __break(1u);
LABEL_187:
        qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_open_subchunks called with nothing to open yet";
        __break(1u);
        goto LABEL_188;
      }
      if (objc_msgSend(v58, "endTime") < v34)
        goto LABEL_186;
LABEL_78:
      while (2)
      {
        v60 = v59;
        v61 = v60;
        if ((v6 & 8) == 0)
        {
          if (objc_msgSend(v60, "oldestTime") > v34)
            goto LABEL_90;

          if (objc_msgSend(v61, "endTime") < v34)
            goto LABEL_88;
LABEL_84:
          if (!self->_catalogFilter
            || (v62 = objc_retainAutorelease(v61), objc_msgSend(v62, "catalog"))
            && -[_OSLogCatalogFilter isKeptCatalog:](self->_catalogFilter, "isKeptCatalog:", objc_msgSend(objc_retainAutorelease(v62), "catalog")))
          {
            v63 = v57;
            v140 = MEMORY[0x1E0C809B0];
            v141 = 3221225472;
            v142 = ___oie_advance_cursor_open_catalog_block_invoke;
            v143 = &unk_1E4156D88;
            v144 = v63;
            objc_msgSend(v61, "enumerateSubchunksUsingBlock:", &v140);

          }
LABEL_88:
          -[NSMutableArray removeObjectAtIndex:](self->_catalogStartQ, "removeObjectAtIndex:", 0);
          -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v59)
          {
            v61 = 0;
            goto LABEL_91;
          }
          continue;
        }
        break;
      }
      if (objc_msgSend(v60, "endTime") >= v34)
      {

        if (objc_msgSend(v61, "oldestTime") <= v34)
          goto LABEL_84;
        goto LABEL_88;
      }
LABEL_90:

LABEL_91:
      -[NSMutableArray sortUsingFunction:context:](self->_subchunkStartQ, "sortUsingFunction:context:", _OSLogIndexOrderForOpening, v6);
      -[NSMutableArray sortUsingFunction:context:](self->_subchunkEndQ, "sortUsingFunction:context:", _OSLogIndexOrderForClosing, v6);

LABEL_92:
LABEL_93:
      -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v64)
        goto LABEL_114;
      -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      v67 = (v6 & 8) != 0 ? objc_msgSend(v65, "endTime") < v34 : objc_msgSend(v65, "oldestTime") > v34;

      if (v67)
        goto LABEL_114;
      v68 = v35;
      -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v69;
      if (!v69)
        goto LABEL_113;
      if ((v6 & 8) == 0)
      {
        if (objc_msgSend(v69, "oldestTime") <= v34)
          goto LABEL_103;
        goto LABEL_187;
      }
      if (objc_msgSend(v69, "endTime") < v34)
        goto LABEL_187;
LABEL_103:
      while (2)
      {
        v71 = v70;
        v72 = v71;
        if ((v6 & 8) == 0)
        {
          if (objc_msgSend(v71, "oldestTime") > v34)
            goto LABEL_112;

          if (objc_msgSend(v72, "endTime") < v34)
            goto LABEL_110;
LABEL_109:
          v73 = v68;
          v74 = v72;
          v140 = MEMORY[0x1E0C809B0];
          v141 = 3221225472;
          v142 = ___oie_advance_cursor_open_subchunk_block_invoke;
          v143 = &unk_1E4156DB0;
          v144 = v73;
          v145 = v74;
          LODWORD(v146) = v6;
          -[_OSLogIndexEnumerator enumerateChunksUsingBlock:](v74, "enumerateChunksUsingBlock:", &v140);

LABEL_110:
          -[NSMutableArray removeObjectAtIndex:](self->_subchunkStartQ, "removeObjectAtIndex:", 0);
          -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v70)
            goto LABEL_113;
          continue;
        }
        break;
      }
      if (objc_msgSend(v71, "endTime") >= v34)
      {

        if (objc_msgSend(v72, "oldestTime") <= v34)
          goto LABEL_109;
        goto LABEL_110;
      }
LABEL_112:

LABEL_113:
LABEL_114:
      -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v75)
        goto LABEL_132;
      -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if ((v6 & 8) != 0)
      {
        v79 = objc_msgSend(v76, "oldestTime") > v34;

        if (!v79)
          goto LABEL_132;
      }
      else
      {
        v78 = objc_msgSend(v76, "endTime") < v34;

        if (!v78)
          goto LABEL_132;
      }
      v80 = v35;
      -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v81;
      if (!v81)
        goto LABEL_131;
      if ((v6 & 8) == 0)
      {
        if (objc_msgSend(v81, "endTime") < v34)
          goto LABEL_124;
LABEL_188:
        qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_close_subchunks called with nothing to close";
        __break(1u);
LABEL_189:
        qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_close_files called with nothing to close";
        __break(1u);
        goto LABEL_190;
      }
      if (objc_msgSend(v81, "oldestTime") <= v34)
        goto LABEL_188;
LABEL_124:
      while (2)
      {
        v83 = v82;
        v84 = v83;
        if ((v6 & 8) == 0)
        {
          if (objc_msgSend(v83, "endTime") >= v34)
            break;
          goto LABEL_128;
        }
        if (objc_msgSend(v83, "oldestTime") > v34)
        {
LABEL_128:

          -[NSMutableArray removeObjectAtIndex:](self->_subchunkEndQ, "removeObjectAtIndex:", 0);
          -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v82)
            goto LABEL_131;
          continue;
        }
        break;
      }

LABEL_131:
LABEL_132:
      -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v85)
        goto LABEL_150;
      -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v86;
      if ((v6 & 8) != 0)
      {
        v89 = objc_msgSend(v86, "oldestTime") > v34;

        if (!v89)
          goto LABEL_150;
      }
      else
      {
        v88 = objc_msgSend(v86, "endTime") < v34;

        if (!v88)
          goto LABEL_150;
      }
      v90 = v35;
      -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v91;
      if (!v91)
        goto LABEL_149;
      if ((v6 & 8) == 0)
      {
        if (objc_msgSend(v91, "endTime") < v34)
          goto LABEL_142;
        goto LABEL_189;
      }
      if (objc_msgSend(v91, "oldestTime") <= v34)
        goto LABEL_189;
LABEL_142:
      while (2)
      {
        v93 = v92;
        v94 = v93;
        if ((v6 & 8) == 0)
        {
          if (objc_msgSend(v93, "endTime") >= v34)
            break;
          goto LABEL_146;
        }
        if (objc_msgSend(v93, "oldestTime") > v34)
        {
LABEL_146:

          -[NSMutableArray removeObjectAtIndex:](self->_fileEndQ, "removeObjectAtIndex:", 0);
          -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v92)
            goto LABEL_149;
          continue;
        }
        break;
      }

LABEL_149:
LABEL_150:
      next_major_time = _oie_get_next_major_time(v35, v6, &v151);
      -[_OSLogTracepointBuffer finishedInsertingTracepointsWithNextMajorTime:options:](self->_tracepoints, "finishedInsertingTracepointsWithNextMajorTime:options:", next_major_time, v6);
      -[NSMutableArray sortUsingSelector:](self->_oversizeChunks, "sortUsingSelector:", sel_compare_);
      v96 = v35;
      -[NSMutableArray firstObject](self->_oversizeChunks, "firstObject");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if (v97)
      {
        do
        {
          v98 = objc_msgSend(v97, "timestamp");
          if (v98 == v34)
            break;
          if ((v6 & 8) != 0)
          {
            if (v98 <= v34)
              break;
          }
          else if (v98 >= v34)
          {
            break;
          }
          -[NSMutableArray removeObjectAtIndex:](self->_oversizeChunks, "removeObjectAtIndex:", 0);
          -[NSMutableArray firstObject](self->_oversizeChunks, "firstObject");
          v99 = objc_claimAutoreleasedReturnValue();

          v97 = (void *)v99;
        }
        while (v99);

      }
      if (v120 == 1)
      {
        if ((v6 & 8) != 0)
        {
          if (next_major_time <= *v110)
            next_major_time = *v110;
        }
        else if (next_major_time >= *p_var2)
        {
          next_major_time = *p_var2;
        }
      }
      tracepoints = self->_tracepoints;
      v101 = v133[3];
      v122[0] = MEMORY[0x1E0C809B0];
      v122[1] = 3221225472;
      v122[2] = __81___OSLogIndexEnumerator_enumerateTracepointsInRange_timesync_options_usingBlock___block_invoke;
      v122[3] = &unk_1E4156BD0;
      v124 = &v132;
      v125 = v136;
      v102 = v115;
      v127 = v138;
      v123 = v102;
      v126 = &v128;
      -[_OSLogTracepointBuffer enumerateEventsFromTime:to:options:usingBlock:](tracepoints, "enumerateEventsFromTime:to:options:usingBlock:", v101, next_major_time, v6, v122);
      v103 = v133[3];
      if (v103 >= next_major_time)
        v104 = next_major_time;
      else
        v104 = v133[3];
      if (v103 <= next_major_time)
        v103 = next_major_time;
      if ((v6 & 8) != 0)
        v103 = v104;
      v133[3] = v103;

      objc_autoreleasePoolPop(context);
      v29 = v120;
      if (*((_BYTE *)v129 + 24))
      {
        v105 = v133[3];
        v106 = v96;
        v107 = _oie_get_next_major_time(v106, v6, &v151);
        if (v107 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          if (v107 == v105)
          {

            continue;
          }
          if ((v6 & 8) != 0)
          {
            if (v107 > v105)
              goto LABEL_190;
          }
          else if (v107 < v105)
          {
LABEL_190:
            qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: iteration skipped a major time";
            __break(1u);
          }
        }

        v29 = v120;
      }
      break;
    }
    _Block_object_dispose(&v128, 8);
LABEL_177:
    _Block_object_dispose(&v132, 8);
    v11 = v116 + v112;
    ++v117;
    v9 = v29 - 1;
  }
  while (v9);
LABEL_185:
  _Block_object_dispose(v136, 8);

}

- (void)_initTimesyncBounds:(id *)a3
{
  char *impl;
  unint64_t v6;
  uint64_t i;
  uint64_t var1;
  char *v9;
  _os_timesync_db_s *v10;
  uint64_t v11;
  uint64_t v12;
  os_timesync_range_s *v13;
  float *v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  impl = (char *)_timesync_range_create_impl((uint64_t)-[_OSLogIndex timesync](self->_index, "timesync"), 0, 0xFFFFFFFFFFFFFFFFLL, 0);
  v6 = _timesync_continuous_to_wall_time((uint64_t)-[_OSLogIndex timesync](self->_index, "timesync"), a3->var5.uuid, a3->var5.continuous, 0);
  for (i = 0; i != 5; ++i)
  {
    var1 = a3->var7[i].var1;
    v9 = (char *)_timesync_range_copy(impl);
    _timesync_range_intersect(v9, a3->var7[i].var0.uuid, (float *)a3->var7[i].var0.continuous, 0, 0);
    if (v6 >= 86400000000000 * var1)
    {
      v15 = 0uLL;
      v10 = -[_OSLogIndex timesync](self->_index, "timesync");
      v14 = 0;
      v15 = *(_OWORD *)_timesync_range_find_startboot((uint64_t)v10, v6 - 86400000000000 * var1, v6, (unint64_t *)&v14);
      _timesync_range_intersect(v9, &v15, v14, 0, 0);
    }
    v11 = 5;
    if ((_DWORD)var1 != 30)
      v11 = 0;
    if ((_DWORD)var1 == 14)
      v11 = 4;
    if ((_DWORD)var1 == 7)
      v11 = 3;
    if ((_DWORD)var1 == 3)
      v12 = 2;
    else
      v12 = 0;
    if ((_DWORD)var1 == 1)
      v12 = 1;
    if ((int)var1 <= 6)
      v11 = v12;
    self->_bounds[v11] = (os_timesync_range_s *)v9;
  }
  v13 = (os_timesync_range_s *)_timesync_range_copy(impl);
  self->_live_bound = v13;
  _timesync_range_intersect((char *)v13, a3->var4.uuid, (float *)a3->var4.continuous, 0, 0);
  _timesync_range_intersect(impl, a3, (float *)a3->var0.continuous, 0, 0);
  self->_bounds[0] = (os_timesync_range_s *)impl;
}

- (void)dealloc
{
  uint64_t i;
  void ***v4;
  void ***live_bound;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  for (i = 64; i != 112; i += 8)
  {
    v4 = *(void ****)((char *)&self->super.isa + i);
    if (v4)
    {
      _os_trace_uuid_map_destroy(*v4);
      free(v4);
    }
  }
  live_bound = (void ***)self->_live_bound;
  if (live_bound)
  {
    _os_trace_uuid_map_destroy(*live_bound);
    free(live_bound);
  }
  v6.receiver = self;
  v6.super_class = (Class)_OSLogIndexEnumerator;
  -[_OSLogIndexEnumerator dealloc](&v6, sel_dealloc);
}

- (_OSLogIndexEnumerator)initWithIndex:(id)a3 metadata:(id *)a4 fileBootList:(id)a5 catalogFilter:(id)a6
{
  id v11;
  id v12;
  id v13;
  _OSLogIndexEnumerator *v14;
  _OSLogIndexEnumerator *v15;
  _OSLogTracepointBuffer *v16;
  _OSLogTracepointBuffer *tracepoints;
  uint64_t v18;
  NSMutableArray *fileBootQ;
  NSMutableArray *v20;
  NSMutableArray *fileStartQ;
  NSMutableArray *v22;
  NSMutableArray *fileEndQ;
  NSMutableArray *v24;
  NSMutableArray *catalogStartQ;
  NSMutableArray *v26;
  NSMutableArray *subchunkStartQ;
  NSMutableArray *v28;
  NSMutableArray *subchunkEndQ;
  NSMutableArray *v30;
  NSMutableArray *oversizeChunks;
  objc_super v33;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)_OSLogIndexEnumerator;
  v14 = -[_OSLogIndexEnumerator init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_index, a3);
    v16 = objc_alloc_init(_OSLogTracepointBuffer);
    tracepoints = v15->_tracepoints;
    v15->_tracepoints = v16;

    v18 = objc_msgSend(v12, "mutableCopy");
    fileBootQ = v15->_fileBootQ;
    v15->_fileBootQ = (NSMutableArray *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fileStartQ = v15->_fileStartQ;
    v15->_fileStartQ = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fileEndQ = v15->_fileEndQ;
    v15->_fileEndQ = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    catalogStartQ = v15->_catalogStartQ;
    v15->_catalogStartQ = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subchunkStartQ = v15->_subchunkStartQ;
    v15->_subchunkStartQ = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subchunkEndQ = v15->_subchunkEndQ;
    v15->_subchunkEndQ = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    oversizeChunks = v15->_oversizeChunks;
    v15->_oversizeChunks = v30;

    objc_storeStrong((id *)&v15->_catalogFilter, a6);
    if (a4)
      -[_OSLogIndexEnumerator _initTimesyncBounds:](v15, "_initTimesyncBounds:", a4);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogFilter, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_tracepoints, 0);
  objc_storeStrong((id *)&self->_oversizeChunks, 0);
  objc_storeStrong((id *)&self->_fileBootQ, 0);
  objc_storeStrong((id *)&self->_fileEndQ, 0);
  objc_storeStrong((id *)&self->_fileStartQ, 0);
  objc_storeStrong((id *)&self->_catalogStartQ, 0);
  objc_storeStrong((id *)&self->_subchunkEndQ, 0);
  objc_storeStrong((id *)&self->_subchunkStartQ, 0);
}

- (NSMutableArray)oversizeChunks
{
  return self->_oversizeChunks;
}

@end
