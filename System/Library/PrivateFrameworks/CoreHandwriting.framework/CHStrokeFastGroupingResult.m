@implementation CHStrokeFastGroupingResult

- (CHStrokeFastGroupingResult)initWithFastGroupingClusters:(const void *)a3 clusteredStrokes:(id)a4 strokeProvider:(id)a5 strategyIdentifier:(id)a6 clutterFilter:(id)a7
{
  __objc2_class **v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  __objc2_class **v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  BOOL v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  unint64_t i;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int isHighDensityStroke;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  CHStrokeFastGroupingResult *v106;
  CHStrokeFastGroupingResult *v107;
  uint64_t *p_fastGroupingClusters;
  void *v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  objc_super v116;

  v11 = off_1E77EE000;
  v12 = a4;
  v114 = a5;
  v113 = a6;
  v13 = a7;
  objc_opt_self();
  v111 = v13;
  objc_msgSend_setWithCapacity_(MEMORY[0x1E0C99E20], v14, 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3), v15, v16, v17);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)a3;
  if (*(_QWORD *)a3 != *((_QWORD *)a3 + 1))
  {
    v112 = v12;
    do
    {
      v24 = v12;
      v25 = v114;
      v26 = v113;
      objc_opt_self();
      v27 = v11;
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v28, *(_QWORD *)(v23 + 56), v29, v30, v31);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD **)(v23 + 40);
      if (v37 != (_QWORD *)(v23 + 48))
      {
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(v24, v32, v37[4], v33, v34, v35);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_encodedStrokeIdentifier(v43, v44, v45, v46, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v36, v50, (uint64_t)v49, v51, v52, v53);

          v54 = (_QWORD *)v37[1];
          if (v54)
          {
            do
            {
              v55 = v54;
              v54 = (_QWORD *)*v54;
            }
            while (v54);
          }
          else
          {
            do
            {
              v55 = (_QWORD *)v37[2];
              v56 = *v55 == (_QWORD)v37;
              v37 = v55;
            }
            while (!v56);
          }
          v37 = v55;
        }
        while (v55 != (_QWORD *)(v23 + 48));
      }
      v11 = v27;
      sub_1BE896EC0((uint64_t)v27[84], v36, v25, v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v115, v39, (uint64_t)v38, v40, v41, v42);
      v23 += 72;
      v12 = v112;
    }
    while (v23 != *((_QWORD *)a3 + 1));
  }
  if (v111 && objc_msgSend_highDensityStrokeCount(v111, v18, v19, v20, v21, v22) >= 1)
  {
    v62 = (void *)MEMORY[0x1E0C99DE8];
    v63 = objc_msgSend_highDensityStrokeCount(v111, v57, v58, v59, v60, v61);
    objc_msgSend_arrayWithCapacity_(v62, v64, v63, v65, v66, v67);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend_count(v12, v68, v69, v70, v71, v72); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v75, i, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodedStrokeIdentifier(v79, v80, v81, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      isHighDensityStroke = objc_msgSend_isHighDensityStroke_(v111, v86, (uint64_t)v85, v87, v88, v89);

      if (isHighDensityStroke)
      {
        objc_msgSend_encodedStrokeIdentifier(v79, v91, v92, v93, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v73, v97, (uint64_t)v96, v98, v99, v100);

      }
    }
    sub_1BE896EC0((uint64_t)v11[84], v73, v114, v113);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v115, v102, (uint64_t)v101, v103, v104, v105);

  }
  v116.receiver = self;
  v116.super_class = (Class)CHStrokeFastGroupingResult;
  v106 = -[CHStrokeGroupingResult initWithStrokeGroups:createdStrokeGroups:deletedStrokeGroups:](&v116, sel_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_, v115, 0, 0);
  v107 = v106;
  if (v106)
  {
    p_fastGroupingClusters = (uint64_t *)&v106->_fastGroupingClusters;
    if (&v107->_fastGroupingClusters != a3)
      sub_1BE88C1BC(p_fastGroupingClusters, *(_QWORD *)a3, *((_QWORD *)a3 + 1), 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  }

  return v107;
}

- (vector<CHFastGroupingCluster,)fastGroupingClusters
{
  __compressed_pair<CHFastGroupingCluster *, std::allocator<CHFastGroupingCluster>> *p_end_cap;
  CHFastGroupingCluster *begin;
  CHFastGroupingCluster *end;
  vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *result;
  unint64_t v8;
  CHFastGroupingCluster *v9;

  retstr->__end_cap_.__value_ = 0;
  p_end_cap = &retstr->__end_cap_;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  begin = self->_fastGroupingClusters.__begin_;
  end = self->_fastGroupingClusters.__end_;
  result = (vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *)(end - begin);
  if (end != begin)
  {
    v8 = 0x8E38E38E38E38E39 * ((uint64_t)result >> 3);
    if (v8 >= 0x38E38E38E38E38FLL)
      sub_1BE61F930();
    v9 = (CHFastGroupingCluster *)operator new((size_t)result);
    retstr->__begin_ = v9;
    retstr->__end_ = v9;
    retstr->__end_cap_.__value_ = (CHFastGroupingCluster *)((char *)v9 + 72 * v8);
    result = (vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *)sub_1BE88C044((uint64_t)p_end_cap, (uint64_t)begin, (uint64_t)end, (uint64_t)v9);
    retstr->__end_ = (CHFastGroupingCluster *)result;
  }
  return result;
}

- (void).cxx_destruct
{
  vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *p_fastGroupingClusters;
  CHFastGroupingCluster *begin;
  CHFastGroupingCluster *end;
  CHFastGroupingCluster *v5;
  uint64_t v6;
  CHFastGroupingCluster *v7;

  p_fastGroupingClusters = &self->_fastGroupingClusters;
  begin = self->_fastGroupingClusters.__begin_;
  if (begin)
  {
    end = self->_fastGroupingClusters.__end_;
    v5 = self->_fastGroupingClusters.__begin_;
    if (end != begin)
    {
      v6 = (uint64_t)end - 32;
      do
      {
        v7 = (CHFastGroupingCluster *)(v6 - 40);
        sub_1BE62033C(v6, *(_QWORD **)(v6 + 8));
        sub_1BE67AC7C(v6 - 40, *(_QWORD **)(v6 - 32));
        v6 -= 72;
      }
      while (v7 != begin);
      v5 = p_fastGroupingClusters->__begin_;
    }
    p_fastGroupingClusters->__end_ = begin;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
