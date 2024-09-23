@implementation ULBluetoothIdentityStore

+ (unsigned)maxEntriesInTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULBluetoothIdentityTableMaxRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = objc_msgSend(&unk_2511EDD50, "unsignedIntValue");
  v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return CFSTR("lastSeenTimeStamp");
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationBluetoothIdentityTable,ULBluetoothIdentityMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)_fetchBtIdentityEntriesByAndPredicates:(ULBluetoothIdentityStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  vector<CLMicroLocationBluetoothIdentityTable::Entry, std::allocator<CLMicroLocationBluetoothIdentityTable::Entry>> *result;

  ULDBUtils::fetchEntries<CLMicroLocationBluetoothIdentityTable,ULBluetoothIdentityMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)fetchAllRecordsWithLimit:(ULBluetoothIdentityStore *)self
{
  vector<CLMicroLocationBluetoothIdentityTable::Entry, std::allocator<CLMicroLocationBluetoothIdentityTable::Entry>> *result;

  ULDBUtils::fetchAllWithLimit<CLMicroLocationBluetoothIdentityTable,ULBluetoothIdentityMO>(self, a4, retstr);
  return result;
}

- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)fetchBtIdentityEntriesBetweenTimes:(ULBluetoothIdentityStore *)self toTime:(SEL)a3
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  Entry *var1;
  unint64_t v23;
  uint64_t v24;
  vector<CLMicroLocationBluetoothIdentityTable::Entry, std::allocator<CLMicroLocationBluetoothIdentityTable::Entry>> *result;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULDatabaseSelectionLimit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v13 = objc_msgSend(v12, "unsignedIntValue");
  else
    v13 = objc_msgSend(&unk_2511EDD38, "unsignedIntValue");
  v14 = v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K > %@ && %K <= %@"), CFSTR("lastSeenTimeStamp"), v17, CFSTR("lastSeenTimeStamp"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v19);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("lastSeenTimeStamp"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULBluetoothIdentityStore _fetchBtIdentityEntriesByAndPredicates:sortDescriptors:andLimit:](self, "_fetchBtIdentityEntriesByAndPredicates:sortDescriptors:andLimit:", v15, v21, v14);

  var1 = retstr->var1;
  v23 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((char *)var1 - (char *)retstr->var0) >> 3));
  if (var1 == retstr->var0)
    v24 = 0;
  else
    v24 = v23;
  std::__introsort<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *,false>((__int128 *)retstr->var0, (uint64_t)var1, v24, 1);

  return result;
}

- (void)fetchBtIdentityEntriesBetweenTimes:(uint64_t)a3 toTime:(int)a4
{
  uint64_t v6;
  __int128 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  unint64_t v17;
  double v18;
  uint64_t v19;
  void **v20;
  uint64_t v21;
  char v22;
  void **v23;
  char v24;
  double v25;
  char *v26;
  unint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void **v32;
  char v33;
  char v34;
  void **v35;
  char v36;
  __int128 *v37;
  unint64_t v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  __int128 *v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  BOOL v48;
  _BOOL4 v49;
  double *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  __int128 *v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 **v60;
  uint64_t *v61;
  __int128 *v62;
  BOOL v64;
  uint64_t v65;
  __int128 *v66;
  __int128 *v67;
  double v68;
  __int128 v69;
  uint64_t v70;
  char v71;
  char v72;
  char v73;
  uint64_t v74;
  char *v75;
  void **v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  int64_t v81;
  int64_t v82;
  int64_t v83;
  uint64_t v84;
  double *v85;
  double v86;
  double *v87;
  uint64_t v88;
  uint64_t v89;
  double *v90;
  void **v91;
  __int128 v92;
  void **v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  int64_t v97;
  __int128 *v98;
  uint64_t v99;
  __int128 *v100;
  uint64_t v101;
  __int128 *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  int64_t v106;
  void **v107;
  void **v108;
  __int128 v109;
  void **v110;
  __int128 v111;
  void **v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  double v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  char *v122;
  void **v123;
  void **v124;
  __int128 v125;
  void **v126;
  char *v127;
  __int128 v128;
  void **v129;
  uint64_t v130;
  __int128 v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD *v135;
  __int128 *v136;
  double v137;
  __int128 v138;
  uint64_t v139;
  char v140;
  char v141;
  char v142;
  _QWORD *v143;
  void **v144;
  void **v145;
  double *v146;
  double v147;
  uint64_t v148;
  __int128 v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  char v153;
  void *v154;
  char v155;
  char v156;
  uint64_t v157;
  char v158;
  int v159;
  char v160;
  uint64_t v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  __int128 *v165;
  char v166;
  __int128 *v167;
  uint64_t v168;
  double *v169;
  _QWORD v170[2];
  _BYTE v171[15];
  __int128 v172;
  _BYTE v173[15];
  uint64_t v174[4];
  __int128 v175;
  uint64_t v176;

  v6 = a2;
  v7 = a1;
  v176 = *MEMORY[0x24BDAC8D0];
  v168 = a2;
  v169 = (double *)a1;
  while (2)
  {
    v8 = v6 - (_QWORD)v7;
    v9 = 0x8E38E38E38E38E39 * ((v6 - (uint64_t)v7) >> 3);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v168 = v6 - 72;
        if (*(double *)(v6 - 8) < *((double *)v7 + 8))
        {
          v60 = (__int128 **)&v169;
          v61 = &v168;
          goto LABEL_76;
        }
        return;
      case 3uLL:
        v168 = v6 - 72;
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v7, (double *)v7 + 9, v6 - 72);
        return;
      case 4uLL:
        v168 = v6 - 72;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((uint64_t)v7, (double *)v7 + 9, (uint64_t)(v7 + 9), v6 - 72);
        return;
      case 5uLL:
        v168 = v6 - 72;
        v174[0] = (uint64_t)v7;
        *(_QWORD *)&v175 = (char *)v7 + 72;
        *(_QWORD *)&v172 = v7 + 9;
        *(_QWORD *)v173 = (char *)v7 + 216;
        *(_QWORD *)v171 = v6 - 72;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((uint64_t)v7, (double *)v7 + 9, (uint64_t)(v7 + 9), (uint64_t)v7 + 216);
        if (*(double *)(v6 - 8) < *((double *)v7 + 35))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((__int128 **)v173, (uint64_t *)v171);
          if (*(double *)(*(_QWORD *)v173 + 64) < *((double *)v7 + 26))
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((__int128 **)&v172, (uint64_t *)v173);
            if (*(double *)(v172 + 64) < *((double *)v7 + 17))
            {
              std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((__int128 **)&v175, (uint64_t *)&v172);
              if (*(double *)(v175 + 64) < *((double *)v7 + 8))
              {
                v60 = (__int128 **)v174;
                v61 = (uint64_t *)&v175;
LABEL_76:
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>(v60, v61);
              }
            }
          }
        }
        return;
      default:
        if (v8 <= 1727)
        {
          v62 = (__int128 *)((char *)v7 + 72);
          v64 = v7 == (__int128 *)v6 || v62 == (__int128 *)v6;
          if ((a4 & 1) != 0)
          {
            if (!v64)
            {
              v65 = 0;
              v66 = v7;
              v164 = v6;
              do
              {
                v67 = v62;
                v68 = *((double *)v66 + 17);
                if (v68 < *((double *)v66 + 8))
                {
                  v69 = *v62;
                  *(_OWORD *)v174 = *(__int128 *)((char *)v66 + 113);
                  v70 = *((_QWORD *)v66 + 11);
                  *(_QWORD *)&v172 = *((_QWORD *)v66 + 12);
                  *(_QWORD *)((char *)&v172 + 7) = *(_QWORD *)((char *)v66 + 103);
                  v71 = *((_BYTE *)v66 + 111);
                  *((_QWORD *)v66 + 11) = 0;
                  *((_QWORD *)v66 + 12) = 0;
                  v72 = *((_BYTE *)v66 + 112);
                  *(uint64_t *)((char *)&v174[1] + 6) = *(_QWORD *)((char *)v66 + 127);
                  v73 = *((_BYTE *)v66 + 135);
                  *((_QWORD *)v66 + 13) = 0;
                  *((_QWORD *)v66 + 14) = 0;
                  *((_QWORD *)v66 + 15) = 0;
                  *((_QWORD *)v66 + 16) = 0;
                  v74 = v65;
                  v175 = v69;
                  while (1)
                  {
                    v75 = (char *)v7 + v74;
                    *(__int128 *)((char *)v7 + v74 + 72) = *(__int128 *)((char *)v7 + v74);
                    v76 = (void **)((char *)v7 + v74 + 88);
                    if (*((char *)v7 + v74 + 111) < 0)
                      operator delete(*v76);
                    *(_OWORD *)v76 = *((_OWORD *)v75 + 1);
                    *(_QWORD *)((char *)v7 + v74 + 104) = *((_QWORD *)v75 + 4);
                    v75[39] = 0;
                    v75[16] = 0;
                    v77 = v75 + 112;
                    if (v75[135] < 0)
                      operator delete(*(void **)v77);
                    v78 = (char *)v7 + v74;
                    *(_OWORD *)v77 = *(__int128 *)((char *)v7 + v74 + 40);
                    v79 = *(_QWORD *)((char *)v7 + v74 + 64);
                    *((_QWORD *)v77 + 2) = *(_QWORD *)((char *)v7 + v74 + 56);
                    v78[63] = 0;
                    v78[40] = 0;
                    *((_QWORD *)v78 + 17) = v79;
                    if (!v74)
                      break;
                    v74 -= 72;
                    if (v68 >= *((double *)v78 - 1))
                    {
                      v80 = (uint64_t)v7 + v74 + 72;
                      goto LABEL_103;
                    }
                  }
                  v80 = (uint64_t)v7;
LABEL_103:
                  *(_OWORD *)v80 = v175;
                  if (*(char *)(v80 + 39) < 0)
                    operator delete(*((void **)v78 + 2));
                  *((_QWORD *)v78 + 2) = v70;
                  *(_QWORD *)(v80 + 24) = v172;
                  *(_QWORD *)(v80 + 31) = *(_QWORD *)((char *)&v172 + 7);
                  *(_BYTE *)(v80 + 39) = v71;
                  v6 = v164;
                  if (*(char *)(v80 + 63) < 0)
                    operator delete(*((void **)v78 + 5));
                  v78[40] = v72;
                  *(_OWORD *)(v80 + 41) = *(_OWORD *)v174;
                  *(_QWORD *)(v80 + 55) = *(uint64_t *)((char *)&v174[1] + 6);
                  *(_BYTE *)(v80 + 63) = v73;
                  *(double *)(v80 + 64) = v68;
                }
                v62 = (__int128 *)((char *)v67 + 72);
                v65 += 72;
                v66 = v67;
              }
              while ((__int128 *)((char *)v67 + 72) != (__int128 *)v6);
            }
          }
          else if (!v64)
          {
            v135 = (_QWORD *)v7 + 17;
            do
            {
              v136 = v62;
              v137 = *((double *)v7 + 17);
              if (v137 < *((double *)v7 + 8))
              {
                v138 = *v62;
                *(_OWORD *)v174 = *(__int128 *)((char *)v7 + 113);
                v139 = *((_QWORD *)v7 + 11);
                *(_QWORD *)&v172 = *((_QWORD *)v7 + 12);
                *(_QWORD *)((char *)&v172 + 7) = *(_QWORD *)((char *)v7 + 103);
                v140 = *((_BYTE *)v7 + 111);
                *((_QWORD *)v7 + 11) = 0;
                *((_QWORD *)v7 + 12) = 0;
                v141 = *((_BYTE *)v7 + 112);
                *(uint64_t *)((char *)&v174[1] + 6) = *(_QWORD *)((char *)v7 + 127);
                v142 = *((_BYTE *)v7 + 135);
                *((_QWORD *)v7 + 13) = 0;
                *((_QWORD *)v7 + 14) = 0;
                *((_QWORD *)v7 + 15) = 0;
                *((_QWORD *)v7 + 16) = 0;
                v143 = v135;
                v175 = v138;
                do
                {
                  *((_OWORD *)v143 - 4) = *(_OWORD *)(v143 - 17);
                  v144 = (void **)(v143 - 6);
                  if (*((char *)v143 - 25) < 0)
                    operator delete(*v144);
                  *(_OWORD *)v144 = *(_OWORD *)(v143 - 15);
                  *(v143 - 4) = *(v143 - 13);
                  *((_BYTE *)v143 - 97) = 0;
                  *((_BYTE *)v143 - 120) = 0;
                  v145 = (void **)(v143 - 3);
                  if (*((char *)v143 - 1) < 0)
                    operator delete(*v145);
                  *(_OWORD *)v145 = *((_OWORD *)v143 - 6);
                  *(v143 - 1) = *(v143 - 10);
                  *((_BYTE *)v143 - 73) = 0;
                  *((_BYTE *)v143 - 96) = 0;
                  v146 = (double *)(v143 - 9);
                  *v143 = *(v143 - 9);
                  v147 = *((double *)v143 - 18);
                  v143 -= 9;
                }
                while (v137 < v147);
                *((_OWORD *)v146 - 4) = v175;
                if (*((char *)v146 - 25) < 0)
                  operator delete(*((void **)v146 - 6));
                *((_QWORD *)v146 - 6) = v139;
                v148 = v172;
                *(double *)((char *)v146 - 33) = *(double *)((char *)&v172 + 7);
                *((_QWORD *)v146 - 5) = v148;
                *((_BYTE *)v146 - 25) = v140;
                if (*((char *)v146 - 1) < 0)
                  operator delete(*((void **)v146 - 3));
                *((_BYTE *)v146 - 24) = v141;
                v149 = *(_OWORD *)v174;
                *(double *)((char *)v146 - 9) = *(double *)((char *)&v174[1] + 6);
                *(_OWORD *)((char *)v146 - 23) = v149;
                *((_BYTE *)v146 - 1) = v142;
                *v146 = v137;
              }
              v62 = (__int128 *)((char *)v136 + 72);
              v135 += 9;
              v7 = v136;
            }
            while ((__int128 *)((char *)v136 + 72) != (__int128 *)v6);
          }
        }
        else if (a3)
        {
          v10 = v9 >> 1;
          v11 = v6 - 72;
          if ((unint64_t)v8 < 0x2401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v7 + 9 * (v9 >> 1), (double *)v7, v11);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v7, (double *)v7 + 9 * (v9 >> 1), v11);
            v12 = 9 * v10;
            v13 = 9 * v10;
            v14 = v13 * 8 - 72;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>(v169 + 9, &v169[v13 - 9], v168 - 144);
            v13 += 9;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>(v169 + 18, &v169[v13], v168 - 216);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)((char *)v169 + v14), &v169[v12], (uint64_t)&v169[v13]);
            v174[0] = (uint64_t)&v169[v12];
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((__int128 **)&v169, v174);
          }
          v15 = a3 - 1;
          v16 = (__int128 *)v169;
          if ((a4 & 1) != 0)
          {
            v159 = a4;
            v17 = v168;
            v18 = v169[8];
          }
          else
          {
            v18 = v169[8];
            v17 = v168;
            if (*(v169 - 1) >= v18)
            {
              v30 = v15;
              *(_QWORD *)v171 = v168;
              v175 = *(_OWORD *)v169;
              v32 = (void **)(v169 + 2);
              v31 = *((_QWORD *)v169 + 2);
              *(double *)&v172 = v169[3];
              *(double *)((char *)&v172 + 7) = *(double *)((char *)v169 + 31);
              v33 = *((_BYTE *)v169 + 39);
              v169[2] = 0.0;
              *((_QWORD *)v16 + 3) = 0;
              *((_QWORD *)v16 + 4) = 0;
              v35 = (void **)v16 + 5;
              v34 = *((_BYTE *)v16 + 40);
              *(_OWORD *)v174 = *(__int128 *)((char *)v16 + 41);
              *(uint64_t *)((char *)&v174[1] + 6) = *(_QWORD *)((char *)v16 + 55);
              v36 = *((_BYTE *)v16 + 63);
              *((_QWORD *)v16 + 5) = 0;
              *((_QWORD *)v16 + 6) = 0;
              *((_QWORD *)v16 + 7) = 0;
              if (*(double *)(v17 - 8) <= v18)
              {
                v50 = (double *)v16 + 9;
                do
                {
                  v38 = (unint64_t)v50;
                  if ((unint64_t)v50 >= v17)
                    break;
                  v51 = v50[8];
                  v50 += 9;
                }
                while (v51 <= v18);
              }
              else
              {
                v37 = v16;
                do
                {
                  v38 = (unint64_t)v37 + 72;
                  v39 = *((double *)v37 + 17);
                  v37 = (__int128 *)((char *)v37 + 72);
                }
                while (v39 <= v18);
              }
              *(_QWORD *)v173 = v38;
              if (v38 >= v17)
                goto LABEL_55;
              do
              {
                v52 = *(double *)(v17 - 8);
                v17 -= 72;
              }
              while (v52 > v18);
              while (1)
              {
                *(_QWORD *)v171 = v17;
LABEL_55:
                if (v38 >= v17)
                  break;
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((__int128 **)v173, (uint64_t *)v171);
                v38 = *(_QWORD *)v173;
                do
                {
                  v53 = *(double *)(v38 + 136);
                  v38 += 72;
                }
                while (v53 <= v18);
                *(_QWORD *)v173 = v38;
                v17 = *(_QWORD *)v171;
                do
                {
                  v54 = *(double *)(v17 - 8);
                  v17 -= 72;
                }
                while (v54 > v18);
              }
              v55 = (__int128 *)(v38 - 72);
              if ((__int128 *)(v38 - 72) != v16)
              {
                *v16 = *v55;
                if (*((char *)v16 + 39) < 0)
                  operator delete(*v32);
                v56 = *(_OWORD *)(v38 - 56);
                *((_QWORD *)v16 + 4) = *(_QWORD *)(v38 - 40);
                *(_OWORD *)v32 = v56;
                *(_BYTE *)(v38 - 33) = 0;
                *(_BYTE *)(v38 - 56) = 0;
                if (*((char *)v16 + 63) < 0)
                  operator delete(*v35);
                v57 = *(_OWORD *)(v38 - 32);
                *((_QWORD *)v16 + 7) = *(_QWORD *)(v38 - 16);
                *(_OWORD *)v35 = v57;
                *(_BYTE *)(v38 - 9) = 0;
                *(_BYTE *)(v38 - 32) = 0;
                *((_QWORD *)v16 + 8) = *(_QWORD *)(v38 - 8);
              }
              *v55 = v175;
              if (*(char *)(v38 - 33) < 0)
                operator delete(*(void **)(v38 - 56));
              *(_QWORD *)(v38 - 56) = v31;
              v58 = v172;
              *(_QWORD *)(v38 - 41) = *(_QWORD *)((char *)&v172 + 7);
              *(_QWORD *)(v38 - 48) = v58;
              *(_BYTE *)(v38 - 33) = v33;
              if (*(char *)(v38 - 9) < 0)
                operator delete(*(void **)(v38 - 32));
              a4 = 0;
              *(_BYTE *)(v38 - 32) = v34;
              v59 = *(_OWORD *)v174;
              *(_QWORD *)(v38 - 17) = *(uint64_t *)((char *)&v174[1] + 6);
              *(_OWORD *)(v38 - 31) = v59;
              *(_BYTE *)(v38 - 9) = v36;
              *(double *)(v38 - 8) = v18;
              v7 = *(__int128 **)v173;
              v169 = *(double **)v173;
              a3 = v30;
LABEL_72:
              v6 = v168;
              continue;
            }
            v159 = a4;
          }
          v163 = v15;
          v19 = 0;
          v175 = *(_OWORD *)v169;
          v20 = (void **)(v169 + 2);
          v21 = *((_QWORD *)v169 + 2);
          *(double *)&v172 = v169[3];
          *(double *)((char *)&v172 + 7) = *(double *)((char *)v169 + 31);
          v22 = *((_BYTE *)v169 + 39);
          v169[2] = 0.0;
          *((_QWORD *)v16 + 3) = 0;
          *((_QWORD *)v16 + 4) = 0;
          v23 = (void **)v16 + 5;
          v155 = *((_BYTE *)v16 + 40);
          *(_OWORD *)v174 = *(__int128 *)((char *)v16 + 41);
          *(uint64_t *)((char *)&v174[1] + 6) = *(_QWORD *)((char *)v16 + 55);
          v24 = *((_BYTE *)v16 + 63);
          *((_QWORD *)v16 + 5) = 0;
          *((_QWORD *)v16 + 6) = 0;
          *((_QWORD *)v16 + 7) = 0;
          do
          {
            v25 = *(double *)((char *)v16 + v19 + 136);
            v19 += 72;
          }
          while (v25 < v18);
          v26 = (char *)v16 + v19;
          *(_QWORD *)v173 = (char *)v16 + v19;
          if (v19 == 72)
          {
            while ((unint64_t)v26 < v17)
            {
              v27 = v17 - 72;
              v29 = *(double *)(v17 - 8);
              v17 -= 72;
              if (v29 < v18)
                goto LABEL_25;
            }
            v27 = v17;
          }
          else
          {
            do
            {
              v27 = v17 - 72;
              v28 = *(double *)(v17 - 8);
              v17 -= 72;
            }
            while (v28 >= v18);
          }
LABEL_25:
          *(_QWORD *)v171 = v27;
          v7 = (__int128 *)((char *)v16 + v19);
          if ((unint64_t)v26 < v27)
          {
            do
            {
              std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((__int128 **)v173, (uint64_t *)v171);
              v7 = *(__int128 **)v173;
              do
              {
                v40 = *((double *)v7 + 17);
                v7 = (__int128 *)((char *)v7 + 72);
              }
              while (v40 < v18);
              *(_QWORD *)v173 = v7;
              v41 = *(_QWORD *)v171;
              do
              {
                v42 = *(double *)(v41 - 8);
                v41 -= 72;
              }
              while (v42 >= v18);
              *(_QWORD *)v171 = v41;
            }
            while ((unint64_t)v7 < v41);
          }
          v43 = (__int128 *)((char *)v7 - 72);
          if ((__int128 *)((char *)v7 - 72) != v16)
          {
            *v16 = *v43;
            if (*((char *)v16 + 39) < 0)
              operator delete(*v20);
            v44 = *(__int128 *)((char *)v7 - 56);
            *((_QWORD *)v16 + 4) = *((_QWORD *)v7 - 5);
            *(_OWORD *)v20 = v44;
            *((_BYTE *)v7 - 33) = 0;
            *((_BYTE *)v7 - 56) = 0;
            if (*((char *)v16 + 63) < 0)
              operator delete(*v23);
            v45 = *(v7 - 2);
            *((_QWORD *)v16 + 7) = *((_QWORD *)v7 - 2);
            *(_OWORD *)v23 = v45;
            *((_BYTE *)v7 - 9) = 0;
            *((_BYTE *)v7 - 32) = 0;
            *((_QWORD *)v16 + 8) = *((_QWORD *)v7 - 1);
          }
          *v43 = v175;
          if (*((char *)v7 - 33) < 0)
            operator delete(*((void **)v7 - 7));
          *((_QWORD *)v7 - 7) = v21;
          v46 = v172;
          *(_QWORD *)((char *)v7 - 41) = *(_QWORD *)((char *)&v172 + 7);
          *((_QWORD *)v7 - 6) = v46;
          *((_BYTE *)v7 - 33) = v22;
          a4 = v159;
          if (*((char *)v7 - 9) < 0)
            operator delete(*((void **)v7 - 4));
          *((_BYTE *)v7 - 32) = v155;
          v47 = *(_OWORD *)v174;
          *(_QWORD *)((char *)v7 - 17) = *(uint64_t *)((char *)&v174[1] + 6);
          *(__int128 *)((char *)v7 - 31) = v47;
          *((_BYTE *)v7 - 9) = v24;
          *((double *)v7 - 1) = v18;
          v48 = (unint64_t)v26 >= v27;
          a3 = v163;
          if (!v48)
          {
LABEL_42:
            std::__introsort<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *,false>(v169, (char *)v7 - 72, v163, v159 & 1);
            a4 = 0;
LABEL_43:
            v169 = (double *)v7;
            goto LABEL_72;
          }
          v49 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((uint64_t)v169, (uint64_t)v7 - 72);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((uint64_t)v7, v168))
          {
            if (v49)
              goto LABEL_43;
            goto LABEL_42;
          }
          if (!v49)
          {
            v168 = (uint64_t)v7 - 72;
            v7 = (__int128 *)v169;
            goto LABEL_72;
          }
        }
        else if (v7 != (__int128 *)v6)
        {
          v165 = (__int128 *)v6;
          v81 = (v9 - 2) >> 1;
          v82 = v81;
          do
          {
            v83 = v82;
            if (v81 >= v82)
            {
              v84 = (2 * v82) | 1;
              v85 = (double *)v7 + 9 * v84;
              if (2 * v83 + 2 < (uint64_t)v9 && *((double *)v7 + 9 * v84 + 8) < v85[17])
              {
                v85 += 9;
                v84 = 2 * v83 + 2;
              }
              v86 = *((double *)v7 + 9 * v83 + 8);
              if (v85[8] >= v86)
              {
                v87 = (double *)v7 + 9 * v83;
                v175 = *(_OWORD *)v87;
                v152 = *((_QWORD *)v87 + 2);
                v88 = *((_QWORD *)v87 + 3);
                *(double *)((char *)&v172 + 7) = *(double *)((char *)v87 + 31);
                *(_QWORD *)&v172 = v88;
                v150 = *((_BYTE *)v87 + 39);
                v87[2] = 0.0;
                v87[3] = 0.0;
                v87[4] = 0.0;
                v160 = *((_BYTE *)v87 + 40);
                v89 = *(_QWORD *)((char *)v87 + 55);
                *(_OWORD *)v174 = *(_OWORD *)((char *)v87 + 41);
                *(uint64_t *)((char *)&v174[1] + 6) = v89;
                v156 = *((_BYTE *)v87 + 63);
                v87[5] = 0.0;
                v87[6] = 0.0;
                v87[7] = 0.0;
                do
                {
                  v90 = v85;
                  *(_OWORD *)v87 = *(_OWORD *)v85;
                  v91 = (void **)(v87 + 2);
                  if (*((char *)v87 + 39) < 0)
                    operator delete(*v91);
                  v92 = *((_OWORD *)v90 + 1);
                  v87[4] = v90[4];
                  *(_OWORD *)v91 = v92;
                  *((_BYTE *)v90 + 39) = 0;
                  *((_BYTE *)v90 + 16) = 0;
                  v93 = (void **)(v87 + 5);
                  if (*((char *)v87 + 63) < 0)
                    operator delete(*v93);
                  v94 = *(_OWORD *)(v90 + 5);
                  v87[7] = v90[7];
                  *(_OWORD *)v93 = v94;
                  *((_BYTE *)v90 + 63) = 0;
                  *((_BYTE *)v90 + 40) = 0;
                  v87[8] = v90[8];
                  if (v81 < v84)
                    break;
                  v95 = (2 * v84) | 1;
                  v85 = (double *)v7 + 9 * v95;
                  if (2 * v84 + 2 < (uint64_t)v9 && *((double *)v7 + 9 * v95 + 8) < v85[17])
                  {
                    v85 += 9;
                    v95 = 2 * v84 + 2;
                  }
                  v87 = v90;
                  v84 = v95;
                }
                while (v85[8] >= v86);
                *(_OWORD *)v90 = v175;
                if (*((char *)v90 + 39) < 0)
                  operator delete(*((void **)v90 + 2));
                v96 = v172;
                *((_QWORD *)v90 + 2) = v152;
                *((_QWORD *)v90 + 3) = v96;
                *(double *)((char *)v90 + 31) = *(double *)((char *)&v172 + 7);
                *((_BYTE *)v90 + 39) = v150;
                if (*((char *)v90 + 63) < 0)
                  operator delete(*((void **)v90 + 5));
                *((_BYTE *)v90 + 40) = v160;
                *(_OWORD *)((char *)v90 + 41) = *(_OWORD *)v174;
                *(double *)((char *)v90 + 55) = *(double *)((char *)&v174[1] + 6);
                *((_BYTE *)v90 + 63) = v156;
                v90[8] = v86;
              }
            }
            v82 = v83 - 1;
          }
          while (v83);
          v97 = v8 / 0x48uLL;
          v98 = v165;
          do
          {
            v99 = 0;
            v100 = v98;
            v172 = *v7;
            v151 = *((_QWORD *)v7 + 2);
            *(_QWORD *)v171 = *((_QWORD *)v7 + 3);
            *(_QWORD *)&v171[7] = *(_QWORD *)((char *)v7 + 31);
            v153 = *((_BYTE *)v7 + 39);
            *((_QWORD *)v7 + 3) = 0;
            *((_QWORD *)v7 + 4) = 0;
            *((_QWORD *)v7 + 2) = 0;
            v101 = *((_QWORD *)v7 + 5);
            v170[0] = *((_QWORD *)v7 + 6);
            *(_QWORD *)((char *)v170 + 7) = *(_QWORD *)((char *)v7 + 55);
            v166 = *((_BYTE *)v7 + 63);
            *((_QWORD *)v7 + 6) = 0;
            *((_QWORD *)v7 + 7) = 0;
            *((_QWORD *)v7 + 5) = 0;
            v102 = v7;
            v157 = *((_QWORD *)v7 + 8);
            v161 = v101;
            do
            {
              v103 = v99 + 1;
              v104 = (char *)v102 + 72 * v99 + 72;
              v105 = 2 * v99;
              v99 = (2 * v99) | 1;
              v106 = v105 + 2;
              if (v106 < v97 && *((double *)v102 + 9 * v103 + 8) < *((double *)v104 + 17))
              {
                v104 += 72;
                v99 = v106;
              }
              *v102 = *(_OWORD *)v104;
              v107 = (void **)(v102 + 1);
              if (*((char *)v102 + 39) < 0)
                operator delete(*v107);
              v108 = (void **)(v104 + 16);
              v109 = *((_OWORD *)v104 + 1);
              *((_QWORD *)v102 + 4) = *((_QWORD *)v104 + 4);
              *(_OWORD *)v107 = v109;
              v104[39] = 0;
              v104[16] = 0;
              v110 = (void **)v102 + 5;
              if (*((char *)v102 + 63) < 0)
                operator delete(*v110);
              v111 = *(_OWORD *)(v104 + 40);
              *((_QWORD *)v102 + 7) = *((_QWORD *)v104 + 7);
              *(_OWORD *)v110 = v111;
              v104[63] = 0;
              v104[40] = 0;
              *((_QWORD *)v102 + 8) = *((_QWORD *)v104 + 8);
              v102 = (__int128 *)v104;
            }
            while (v99 <= (uint64_t)((unint64_t)(v97 - 2) >> 1));
            v112 = (void **)(v104 + 40);
            v98 = (__int128 *)((char *)v100 - 72);
            if (v104 == (char *)v100 - 72)
            {
              *(_OWORD *)v104 = v172;
              if (v104[39] < 0)
                operator delete(*v108);
              *((_QWORD *)v104 + 2) = v151;
              v132 = *(_QWORD *)v171;
              *(_QWORD *)(v104 + 31) = *(_QWORD *)&v171[7];
              *((_QWORD *)v104 + 3) = v132;
              v104[39] = v153;
              if (v104[63] < 0)
                operator delete(*v112);
              *((_QWORD *)v104 + 5) = v161;
              v133 = v170[0];
              *(_QWORD *)(v104 + 55) = *(_QWORD *)((char *)v170 + 7);
              *((_QWORD *)v104 + 6) = v133;
              v104[63] = v166;
              *((_QWORD *)v104 + 8) = v157;
            }
            else
            {
              *(_OWORD *)v104 = *v98;
              if (v104[39] < 0)
                operator delete(*v108);
              v113 = *(__int128 *)((char *)v100 - 56);
              *((_QWORD *)v104 + 4) = *((_QWORD *)v100 - 5);
              *(_OWORD *)v108 = v113;
              *((_BYTE *)v100 - 33) = 0;
              *((_BYTE *)v100 - 56) = 0;
              if (v104[63] < 0)
                operator delete(*v112);
              v114 = *(v100 - 2);
              *((_QWORD *)v104 + 7) = *((_QWORD *)v100 - 2);
              *(_OWORD *)v112 = v114;
              *((_BYTE *)v100 - 9) = 0;
              *((_BYTE *)v100 - 32) = 0;
              *((_QWORD *)v104 + 8) = *((_QWORD *)v100 - 1);
              *v98 = v172;
              if (*((char *)v100 - 33) < 0)
                operator delete(*((void **)v100 - 7));
              *((_QWORD *)v100 - 7) = v151;
              *((_QWORD *)v100 - 6) = *(_QWORD *)v171;
              *(_QWORD *)((char *)v100 - 41) = *(_QWORD *)&v171[7];
              *((_BYTE *)v100 - 33) = v153;
              if (*((char *)v100 - 9) < 0)
                operator delete(*((void **)v100 - 4));
              v115 = v170[0];
              *((_QWORD *)v100 - 4) = v161;
              *((_QWORD *)v100 - 3) = v115;
              *(_QWORD *)((char *)v100 - 17) = *(_QWORD *)((char *)v170 + 7);
              *((_BYTE *)v100 - 9) = v166;
              *((_QWORD *)v100 - 1) = v157;
              v116 = v104 + 72 - (char *)v7;
              if (v116 >= 73)
              {
                v117 = (v116 / 0x48uLL - 2) >> 1;
                v118 = *((double *)v104 + 8);
                if (*((double *)v7 + 9 * v117 + 8) < v118)
                {
                  v167 = (__int128 *)((char *)v100 - 72);
                  v175 = *(_OWORD *)v104;
                  v154 = (void *)*((_QWORD *)v104 + 2);
                  v119 = *((_QWORD *)v104 + 3);
                  *(_QWORD *)&v173[7] = *(_QWORD *)(v104 + 31);
                  *(_QWORD *)v173 = v119;
                  v120 = v104[39];
                  *v108 = 0;
                  *((_QWORD *)v104 + 3) = 0;
                  *((_QWORD *)v104 + 4) = 0;
                  v162 = v104[40];
                  v121 = *(_QWORD *)(v104 + 55);
                  *(_OWORD *)v174 = *(_OWORD *)(v104 + 41);
                  *(uint64_t *)((char *)&v174[1] + 6) = v121;
                  v158 = v104[63];
                  *v112 = 0;
                  *((_QWORD *)v104 + 6) = 0;
                  *((_QWORD *)v104 + 7) = 0;
                  do
                  {
                    v122 = (char *)v7 + 72 * v117;
                    *(_OWORD *)v104 = *(_OWORD *)v122;
                    v123 = (void **)(v104 + 16);
                    if (v104[39] < 0)
                      operator delete(*v123);
                    v124 = (void **)(v122 + 16);
                    v125 = *((_OWORD *)v122 + 1);
                    *((_QWORD *)v104 + 4) = *((_QWORD *)v122 + 4);
                    *(_OWORD *)v123 = v125;
                    v122[39] = 0;
                    v122[16] = 0;
                    v126 = (void **)(v104 + 40);
                    if (v104[63] < 0)
                      operator delete(*v126);
                    v127 = (char *)v7 + 72 * v117;
                    v128 = *(_OWORD *)(v127 + 40);
                    *((_QWORD *)v104 + 7) = *((_QWORD *)v127 + 7);
                    *(_OWORD *)v126 = v128;
                    v122[63] = 0;
                    v127[40] = 0;
                    *((_QWORD *)v104 + 8) = *((_QWORD *)v127 + 8);
                    if (!v117)
                      break;
                    v117 = (v117 - 1) >> 1;
                    v104 = v122;
                  }
                  while (*((double *)v7 + 9 * v117 + 8) < v118);
                  *(_OWORD *)v122 = v175;
                  if (v122[39] < 0)
                    operator delete(*v124);
                  v129 = (void **)(v127 + 40);
                  *v124 = v154;
                  v130 = *(_QWORD *)v173;
                  *(_QWORD *)(v122 + 31) = *(_QWORD *)&v173[7];
                  *((_QWORD *)v122 + 3) = v130;
                  v122[39] = v120;
                  if (v122[63] < 0)
                    operator delete(*v129);
                  *(_BYTE *)v129 = v162;
                  v131 = *(_OWORD *)v174;
                  *(_QWORD *)(v127 + 55) = *(uint64_t *)((char *)&v174[1] + 6);
                  *(_OWORD *)(v127 + 41) = v131;
                  v127[63] = v158;
                  *((double *)v127 + 8) = v118;
                  v98 = v167;
                }
              }
            }
          }
          while (v97-- > 2);
        }
        return;
    }
  }
}

@end
