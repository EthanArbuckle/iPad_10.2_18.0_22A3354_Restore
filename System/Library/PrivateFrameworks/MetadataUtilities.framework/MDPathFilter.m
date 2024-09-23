@implementation MDPathFilter

- (MDPathFilter)initWithMDPlist:(_MDPlistContainer *)a3
{
  MDPathFilter *v4;
  MDPathFilter *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t var2;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  $931575D2DB9AA82C8240DDD2E2E52BBF *commonValues;
  __int128 v56;
  $37FF168C8709F524D812460C59637AB1 v57;
  __int128 v58;
  $37FF168C8709F524D812460C59637AB1 v59;
  __int128 v60;
  $37FF168C8709F524D812460C59637AB1 reference;
  __int128 v62;
  $37FF168C8709F524D812460C59637AB1 v63;
  uint64_t v64;
  __int128 v65;
  $37FF168C8709F524D812460C59637AB1 v66;
  objc_super v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)MDPathFilter;
  v4 = -[MDPathFilter init](&v67, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_plist = (_MDPlistContainer *)CFRetain(a3);
    v65 = 0uLL;
    v66 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/COMMON", (uint64_t)&v65, v6, v7, v8, v9, v10);
    v64 = 0;
    v62 = v65;
    v63 = v66;
    v5->_commonValues = ($931575D2DB9AA82C8240DDD2E2E52BBF *)_MDPlistDataGetBytePtr((uint64_t *)&v62, &v64);
    v62 = 0uLL;
    v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/PREFIXES", (uint64_t)&v62, v11, v12, v13, v14, v15);
    *(_OWORD *)&v5->_prefixesDictionary.containerBytes = v62;
    v5->_prefixesDictionary.reference = v63;
    v62 = 0uLL;
    v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/EXTENSIONS", (uint64_t)&v62, v16, v17, v18, v19, v20);
    *(_OWORD *)&v5->_extensionsDictionary.containerBytes = v62;
    v5->_extensionsDictionary.reference = v63;
    v62 = 0uLL;
    v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/HIDDEN_EXTENSIONS", (uint64_t)&v62, v21, v22, v23, v24, v25);
    *(_OWORD *)&v5->_hiddenExtensionsDictionary.containerBytes = v62;
    v5->_hiddenExtensionsDictionary.reference = v63;
    v62 = 0uLL;
    v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/ROOT_ARRAY", (uint64_t)&v62, v26, v27, v28, v29, v30);
    *(_OWORD *)&v5->_rootArray.containerBytes = v62;
    v5->_rootArray.reference = v63;
    v63 = 0;
    v62 = 0uLL;
    var2 = v5->_commonValues->var2;
    v60 = *(_OWORD *)&v5->_rootArray.containerBytes;
    reference = v5->_rootArray.reference;
    _MDPlistArrayGetPlistObjectAtIndex((uint64_t)&v60, var2, v32, v33, v34, v35, v36, v37, &v62);
    v60 = v62;
    reference = v63;
    if (_MDPlistGetPlistObjectType((uint64_t)&v60) != 240)
      -[MDPathFilter initWithMDPlist:].cold.1(&v62, v38, v39, v40, v41, v42, v43, v44);
    v60 = v62;
    reference = v63;
    v5->_rootElement = ($52079F86ABBA964433EE826DA835B8B1 *)arrayObjectToElementRecord((uint64_t)&v60, v38, v39, v40, v41, v42, v43, v44);
    reference = 0;
    v60 = 0uLL;
    _MDPlistGetRootPlistObjectFromPlist((uint64_t)v5->_plist, v45, v46, v47, v48, v49, (uint64_t)&v60);
    v58 = 0uLL;
    v59 = 0;
    v56 = v60;
    v57 = reference;
    if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v56, "IS_DATA_ROSP", 12, (uint64_t)&v58, v50, v51, v52, v53))
    {
      v56 = v58;
      v57 = v59;
      v5->_isDataROSP = _MDPlistNumberGetIntValue((uint64_t)&v56) != 0;
    }
    commonValues = v5->_commonValues;
    v5->_mountDepth = commonValues->var0;
    v5->_defaultRule = *(unint64_t *)((char *)&commonValues->var3 + 6);
    v5->_inheritMask = *(_QWORD *)(&commonValues->var2 + 1);
    v5->_processExtensions = commonValues->var1 != 0;
    v5->_auxValueCount = HIWORD(commonValues->var7);
    v5->_auxValues = (unint64_t *)&commonValues->var8;
  }
  return v5;
}

- (MDPathFilter)initWithData:(id)a3
{
  const void *v5;
  MDPathFilter *v6;

  if (!objc_msgSend(a3, "length"))
    return -[MDPathFilter initWithMDPlist:](self, "initWithMDPlist:", 0);
  v5 = (const void *)_MDPlistContainerCreateWithCopiedBytes(*MEMORY[0x1E0C9AE00], (unsigned __int16 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 1);
  v6 = -[MDPathFilter initWithMDPlist:](self, "initWithMDPlist:", v5);
  if (v5)
    CFRelease(v5);
  return v6;
}

- (void)dealloc
{
  _MDPlistContainer *plist;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  plist = self->_plist;
  if (plist)
    CFRelease(plist);
  v4.receiver = self;
  v4.super_class = (Class)MDPathFilter;
  -[MDPathFilter dealloc](&v4, sel_dealloc);
}

- (_MDPlistContainer)plist
{
  return self->_plist;
}

- (id)data
{
  _MDPlistContainer *plist;
  void *v4;
  uint64_t Bytes;
  uint64_t Length;
  void *v7;
  const char *v8;

  plist = self->_plist;
  v4 = (void *)MEMORY[0x1E0C99D50];
  if (plist)
  {
    Bytes = _MDPlistContainerGetBytes((uint64_t)plist);
    Length = _MDPlistContainerGetLength((uint64_t)self->_plist);
    v7 = v4;
    v8 = (const char *)Bytes;
  }
  else
  {
    v8 = "";
    v7 = (void *)MEMORY[0x1E0C99D50];
    Length = 0;
  }
  return (id)objc_msgSend(v7, "dataWithBytes:length:", v8, Length);
}

- (BOOL)isDataROSP
{
  return self->_isDataROSP;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filter:(SEL)a3 allowBundleCheck:(const char *)a4
{
  _QWORD *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  char *v12;
  char *v13;
  int v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $1CD0F41CAFB66BEF540F4446800F077B *result;
  uint64_t v20;
  uint64_t v21;
  uint64_t var1_high;
  _BOOL4 v23;
  int var2;
  int var3;
  uint64_t v26;
  uint64_t v27;
  int v28;
  __int16 v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  $1CD0F41CAFB66BEF540F4446800F077B *v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t IntValue;
  uint64_t v44;
  int v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  int v50;
  char *v51;
  uint64_t i;
  char *v53;
  int v54;
  char *v55;
  uint64_t v56;
  int v57;
  char *v58;
  unint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  __darwin_ct_rune_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _BOOL4 v100;
  uint64_t v101;
  _BOOL4 v102;
  int v103;
  int v104;
  int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  int v110;
  char *v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  int v124;
  int v125;
  uint64_t *v126;
  int v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t *v130;
  int v131;
  uint64_t *v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  BOOL v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  int v158;
  __int128 *v159;
  __int128 *v160;
  uint64_t v161;
  unsigned int v162;
  int v163;
  int v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  _BOOL4 v170;
  char *v171;
  int v172;
  $1CD0F41CAFB66BEF540F4446800F077B *v173;
  $1CD0F41CAFB66BEF540F4446800F077B *v174;
  char *v175;
  char *v176;
  int v177;
  int v178;
  int v179;
  uint64_t v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  _QWORD *v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  uint64_t v193;
  __int128 v194;
  uint64_t v195;
  __int128 v196;
  uint64_t v197;
  uint64_t v198;
  char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  unsigned __int8 *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  int v212;
  int v213;
  int v214;
  _BYTE v215[769];
  char __s[16];
  uint64_t v217;
  uint64_t v218;

  v5 = MEMORY[0x1E0C80A78](retstr, self, a3, a4, a5);
  v7 = v6;
  v188 = v5;
  v157 = v8;
  v218 = *MEMORY[0x1E0C80C00];
  bzero(v215, 0x400uLL);
  v9 = 0;
  v10 = v7 + 84;
  v11 = 47;
  do
  {
    if (v11 != v7[v9])
    {
      v10 = v7;
      goto LABEL_9;
    }
    v11 = aVarFoldersZzZy[++v9];
  }
  while (v9 != 84);
  v12 = strstr(v7 + 84, "/SMNopCopierSandbox-");
  if (v12)
  {
    v13 = v12;
    if ((unint64_t)__strlcpy_chk() <= 0x3FF)
    {
      v215[v13 - v10] = 0;
      v10 = v215;
      if (strchr(v13 + 20, 47))
        __strlcat_chk();
    }
  }
LABEL_9:
  v14 = *v10;
  v171 = v10;
  if (v14 == 47)
    j = (uint64_t)(v10 + 1);
  else
    j = (uint64_t)v10;
  bzero(&v198, 0x700uLL);
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)v188[15];
  v20 = *(_QWORD *)(&result->var7 + 1);
  v21 = v20 & 0x7FFFFFFFFFFFFFFFLL;
  var1_high = HIWORD(result->var1);
  v23 = HIWORD(result->var1) != 0;
  var2 = result->var2;
  var3 = result->var3;
  if (!*(_BYTE *)j)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = v157;
    goto LABEL_181;
  }
  v26 = 1;
  LODWORD(v198) = 1;
  v199 = (char *)j;
  v200 = 0;
  v201 = 0;
  v202 = v20 & 0x3FFFFFFFFFFFFFFFLL;
  v203 = var1_high;
  v204 = var2;
  v205 = var2;
  v27 = (uint64_t)v10;
  if (v14 == 47)
  {
    if (v10[1] && (v28 = *(_DWORD *)((char *)&result->var0 + 6)) != 0)
    {
      v206 = 3;
      v207 = v28;
      v208 = (unsigned __int8 *)(v10 + 1);
      v209 = 0;
      v210 = 0;
      v211 = v21;
      v212 = var1_high;
      v213 = var2;
      v26 = 2;
      v214 = var3;
    }
    else
    {
      v26 = 1;
    }
  }
  if (*((_BYTE *)v188 + 152))
  {
    v33 = v26;
    v34 = result;
    v35 = v21;
    v36 = var3;
    v37 = var2;
    v38 = var1_high;
    memset(__s, 0, sizeof(__s));
    v217 = 0;
    v196 = *(_OWORD *)(v188 + 9);
    v197 = v188[11];
    if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v196, ".*", -1, (uint64_t)__s, v26, v16, v17, v18))
    {
      v196 = *(_OWORD *)__s;
      v197 = v217;
      if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 226)
      {
        v196 = *(_OWORD *)__s;
        v197 = v217;
        if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 35)
        {
          v196 = *(_OWORD *)__s;
          v197 = v217;
          if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 227)
          {
            v196 = *(_OWORD *)__s;
            v197 = v217;
            if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 51)
              -[MDPathFilter filter:allowBundleCheck:].cold.5();
          }
        }
      }
      v196 = *(_OWORD *)__s;
      v197 = v217;
      IntValue = _MDPlistNumberGetIntValue((uint64_t)&v196);
      *((_DWORD *)v188 + 42) = BYTE2(IntValue);
      *((_DWORD *)v188 + 43) = (unsigned __int16)IntValue;
    }
    v196 = *(_OWORD *)(v188 + 9);
    v197 = v188[11];
    if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v196, "icloud", -1, (uint64_t)__s, v39, v40, v41, v42))
    {
      v196 = *(_OWORD *)__s;
      v197 = v217;
      if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 226)
      {
        v196 = *(_OWORD *)__s;
        v197 = v217;
        if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 35)
        {
          v196 = *(_OWORD *)__s;
          v197 = v217;
          if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 227)
          {
            v196 = *(_OWORD *)__s;
            v197 = v217;
            if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 51)
              -[MDPathFilter filter:allowBundleCheck:].cold.4();
          }
        }
      }
      v196 = *(_OWORD *)__s;
      v197 = v217;
      v44 = _MDPlistNumberGetIntValue((uint64_t)&v196);
      *((_DWORD *)v188 + 44) = BYTE2(v44);
      *((_DWORD *)v188 + 45) = (unsigned __int16)v44;
    }
    var1_high = v38;
    var2 = v37;
    var3 = v36;
    v21 = v35;
    result = v34;
    v26 = v33;
    v27 = (uint64_t)v10;
  }
  v156 = 0;
  v45 = 0;
  v177 = 0;
  v178 = 0;
  v159 = (__int128 *)(v188 + 9);
  v160 = (__int128 *)(v188 + 3);
  v161 = -v27;
  while (2)
  {
    v170 = v23;
    v172 = 0;
    v46 = v26;
LABEL_35:
    v47 = (char *)j;
LABEL_36:
    v158 = v45;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v180 = -j;
    v26 = v46;
    v51 = v47;
    while (2)
    {
      for (i = 0; ; ++i)
      {
        v53 = &v51[i];
        v54 = v51[i];
        if (v54 != 46)
          break;
        if ((unint64_t)v53 > v27)
          v50 |= v51[i - 1] == 47;
        v49 = v48;
LABEL_45:
        v48 = v53;
      }
      if (v51[i] && v54 != 47)
      {
        v53 = v48;
        goto LABEL_45;
      }
      v55 = &v51[i];
      v181 = v50;
      if (v48 && *((_BYTE *)v188 + 152))
      {
        if (v49 && j - v27 >= 21)
        {
          v56 = 0;
          v57 = 47;
          while (v57 == *(unsigned __int8 *)(j + v56 - 20))
          {
            v57 = aLibraryContain[++v56];
            if (v56 == 20)
              goto LABEL_53;
          }
        }
        v58 = &v51[i];
        v59 = (unint64_t)v48;
        if (v49)
        {
          v60 = 115;
          v61 = 1u;
          do
          {
            if (v60 != v48[v61])
            {
              v58 = &v51[i];
              v59 = (unint64_t)v48;
              goto LABEL_65;
            }
            v60 = aSb[v61++];
          }
          while (v61 != 4);
          v62 = v48 - v51 + 19;
          if (v62 == i)
            v58 = v48;
          else
            v58 = &v51[i];
          if (v62 == i)
            v59 = (unint64_t)v49;
          else
            v59 = (unint64_t)v48;
        }
LABEL_65:
        v173 = result;
        v175 = v49;
        v63 = v26;
        v167 = v21;
        v182 = var3;
        v185 = var2;
        v162 = var1_high;
        v64 = __s;
        bzero(__s, 0x400uLL);
        v66 = (char *)(v59 + 1);
        if ((char *)(v59 + 1) != v58)
        {
          v64 = __s;
          do
          {
            v67 = *v66++;
            *v64++ = __tolower(v67);
          }
          while (v66 != v58);
        }
        *v64 = 0;
        v196 = 0uLL;
        v197 = 0;
        v50 = v181;
        v165 = v63;
        if ((v181 & 1) != 0)
        {
          if (v59 == j
            && (v194 = *((_OWORD *)v188 + 6),
                v195 = v188[14],
                _MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, (uint64_t)&v58[~j], (uint64_t)&v196, v65, v16, v17, v18)))
          {
            v194 = v196;
            v195 = v197;
            v74 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            v68 = BYTE2(v74);
            v72 = (unsigned __int16)v74;
            if ((_WORD)v74)
            {
              LOBYTE(v179) = BYTE2(v74);
              v27 = (uint64_t)v171;
              v26 = v165;
              goto LABEL_92;
            }
          }
          else
          {
            v68 = 0;
          }
          v194 = *v159;
          v195 = v188[11];
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, (uint64_t)&v58[~v59], (uint64_t)&v196, v65, v16, v17, v18))
          {
            v194 = v196;
            v195 = v197;
            v71 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            LOBYTE(v179) = BYTE2(v71);
            v72 = (unsigned __int16)v71;
          }
          else
          {
            LOBYTE(v179) = v68;
            v72 = 0;
          }
          v27 = (uint64_t)v171;
          v26 = v165;
          if (v72 != *((_DWORD *)v188 + 45) && *((_DWORD *)v188 + 43))
          {
            v179 = *((_DWORD *)v188 + 42);
            v72 = *((_DWORD *)v188 + 43);
            v49 = v175;
            goto LABEL_91;
          }
LABEL_83:
          if (!v72)
            goto LABEL_84;
LABEL_92:
          v194 = 0uLL;
          v195 = 0;
          v192 = *v160;
          v193 = v188[5];
          v78 = v26;
          _MDPlistArrayGetPlistObjectAtIndex((uint64_t)&v192, (v72 - 1), v69, v70, v26, v16, v17, v18, &v194);
          v192 = v194;
          v193 = v195;
          v79 = _MDPlistPlistObjectToEmbeddedReference((uint64_t)&v192);
          v26 = v78;
          v164 = v79;
          v49 = v175;
        }
        else
        {
          v194 = *v159;
          v195 = v188[11];
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, (uint64_t)&v58[~v59], (uint64_t)&v196, v65, v16, v17, v18))
          {
            v194 = v196;
            v195 = v197;
            v73 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            v26 = v63;
            LOBYTE(v179) = BYTE2(v73);
            v72 = (unsigned __int16)v73;
            v27 = (uint64_t)v171;
            goto LABEL_83;
          }
          LOBYTE(v179) = 0;
          v27 = (uint64_t)v171;
LABEL_84:
          if (v59 == j)
          {
            v76 = __s;
          }
          else
          {
            v75 = 0;
            do
            {
              __s[v75] = __tolower(*(char *)(j + v75));
              ++v75;
            }
            while (j + v75 != v59);
            v76 = &__s[v75];
            v50 = v181;
          }
          *v76 = 0;
          v194 = *((_OWORD *)v188 + 3);
          v195 = v188[8];
          v49 = v175;
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, v59 - j, (uint64_t)&v196, v26, v16, v17, v18))
          {
            v194 = v196;
            v195 = v197;
            v77 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            LOBYTE(v179) = BYTE2(v77);
            v72 = (unsigned __int16)v77;
            v26 = v165;
LABEL_91:
            if (v72 >= 1)
              goto LABEL_92;
            v164 = 0;
          }
          else
          {
            v164 = 0;
            v26 = v165;
          }
        }
        var1_high = v162;
        var3 = v182;
        var2 = v185;
        v21 = v167;
        result = v173;
        v55 = &v51[i];
      }
      else
      {
LABEL_53:
        v164 = 0;
        LOBYTE(v179) = 0;
      }
      v80 = 0;
      if (result && v55 != (char *)j)
      {
        memset(__s, 0, sizeof(__s));
        v217 = 0;
        v81 = *(unsigned int *)((char *)&result->var0 + 2);
        if ((_DWORD)v81)
        {
          v166 = v26;
          v168 = v21;
          v183 = var3;
          v186 = var2;
          v82 = var1_high;
          v83 = v55;
          v84 = (uint64_t)&v55[v180];
          _MDPlistEmbeddedReferenceToPlistObject(v188[1], v81, 241, (uint64_t)v55, v26, v16, v17, v18, &v191);
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v191, (char *)j, v84, (uint64_t)__s, v85, v86, v87, v88))
          {
            v196 = *(_OWORD *)__s;
            v197 = v217;
            if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 240)
              -[MDPathFilter filter:allowBundleCheck:].cold.3((__int128 *)__s, v89, v90, v91, v92, v93, v94, v95);
            v196 = *(_OWORD *)__s;
            v197 = v217;
            result = ($1CD0F41CAFB66BEF540F4446800F077B *)arrayObjectToElementRecord((uint64_t)&v196, v89, v90, v91, v92, v93, v94, v95);
            v80 = 1;
            v27 = (uint64_t)v171;
            var1_high = v82;
            var3 = v183;
            var2 = v186;
          }
          else
          {
            v80 = 0;
            var3 = 0;
            var2 = 0;
            v170 = 0;
            result = 0;
            v27 = (uint64_t)v171;
            var1_high = v82;
          }
          v26 = v166;
          v21 = v168;
          v50 = v181;
          v55 = v83;
        }
        else
        {
          v80 = 0;
          var3 = 0;
          var2 = 0;
          v170 = 0;
          result = 0;
        }
      }
      v163 = v80;
      if (v55 == (char *)j)
        v80 = 1;
      v96 = v21 & 0x3FFFFFFFFFFFFFFFLL;
      if (v80)
        v96 = v21;
      if (!result)
      {
        v21 = v96;
        break;
      }
      v170 = HIWORD(result->var1) != 0;
      if (HIWORD(result->var1))
        var1_high = HIWORD(result->var1);
      else
        var1_high = var1_high;
      var2 = result->var2;
      var3 = result->var3;
      v97 = *(_QWORD *)(&result->var7 + 1);
      v21 = (*(_QWORD *)&result->var4 & 0x1FFFFFFFFFFFFFFFLL ^ 0x3FFFFFFFFFFFFFFFLL) & v96 | v97;
      v98 = v188[2];
      v99 = *(_QWORD *)(v98 + 30);
      v100 = (v21 & v99) != 0 && (v99 & v96) == 0;
      v101 = *(_QWORD *)(v98 + 38);
      v102 = (v101 & v21) == 0;
      v145 = !v100 || !v102;
      v103 = v177;
      if (!v145)
        v103 = v161 + (_DWORD)v51 + i;
      v104 = v178;
      v105 = (v101 & v96) != 0 && v102;
      if (v105)
        v106 = 0;
      else
        v106 = v103;
      if ((v105 & ((unsigned __int16)v178 == 0)) != 0)
        v104 = v103;
      v177 = v106;
      v178 = v104;
      v107 = *(unint64_t *)((char *)&result[1].var0 + 4);
      if (v107)
      {
        if (*v55)
        {
          v108 = *(unint64_t *)((char *)&result[1].var1 + 4);
          v21 = v108 | (v107 & 0x1FFFFFFFFFFFFFFFLL ^ 0x3FFFFFFFFFFFFFFFLL) & v21;
          if (v108 < 0)
          {
            if (v54)
              v109 = 0;
            else
              v109 = result->var2;
            if (v54)
              v110 = 0;
            else
              v110 = result->var3;
            v198 = 1;
            v200 = 0;
            v201 = 0;
            v199 = v55;
            v202 = v21;
            v203 = var1_high;
            v204 = v109;
            v205 = v110;
            v26 = 1;
            if ((*(_QWORD *)(&result->var7 + 1) & 0x8000000000000000) == 0)
              goto LABEL_134;
LABEL_125:
            if (v54)
            {
              v198 = 1;
              v200 = 0;
              v201 = 0;
              v199 = v55;
              v202 = v21;
              v205 = 0;
              v26 = 1;
              v203 = var1_high;
              v204 = 0;
              goto LABEL_134;
            }
LABEL_177:
            LOBYTE(v23) = v170;
            goto LABEL_178;
          }
        }
      }
      if (v97 < 0)
        goto LABEL_125;
LABEL_134:
      if (LOWORD(result->var0))
      {
        v111 = v55;
        v174 = result;
        v176 = v49;
        v112 = v26;
        v169 = (char *)j;
        v113 = v21;
        v184 = var3;
        v187 = var2;
        v114 = var1_high;
        memset(__s, 0, sizeof(__s));
        v217 = 0;
        v115 = LOWORD(result->var0) - 1;
        v196 = *v160;
        v197 = v188[5];
        _MDPlistArrayGetPlistObjectAtIndex((uint64_t)&v196, v115, (uint64_t)"/Library/Containers/", (uint64_t)v55, v26, v16, v17, v18, (__int128 *)__s);
        v196 = *(_OWORD *)__s;
        v197 = v217;
        if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 240)
          -[MDPathFilter filter:allowBundleCheck:].cold.2((__int128 *)__s, v116, v117, v118, v119, v120, v121, v122);
        v123 = &v198 + 7 * v112;
        v196 = *(_OWORD *)__s;
        v197 = v217;
        v124 = _MDPlistPlistObjectToEmbeddedReference((uint64_t)&v196);
        *(_DWORD *)v123 = 2;
        *((_DWORD *)v123 + 1) = v124;
        v55 = v111;
        v123[1] = (uint64_t)v111;
        v123[2] = 0;
        v123[3] = 0;
        v123[4] = v113;
        v21 = v113;
        var1_high = v114;
        var3 = v184;
        var2 = v187;
        *((_DWORD *)v123 + 10) = v114;
        *((_DWORD *)v123 + 11) = v187;
        v26 = (v112 + 1);
        *((_DWORD *)v123 + 12) = v184;
        j = (uint64_t)v169;
        result = v174;
        v49 = v176;
        v27 = (uint64_t)v171;
        v50 = v181;
      }
      if (v54 == 47)
      {
        v125 = *(_DWORD *)((char *)&result->var1 + 2);
        if (v125 | v172 && (v179 & 2) == 0)
        {
          if (!v125)
            v125 = v172;
          v126 = &v198 + 7 * (int)v26;
          *(_DWORD *)v126 = 4;
          *((_DWORD *)v126 + 1) = v125;
          v126[1] = (uint64_t)&v51[i + 1];
          v126[2] = 0;
          v126[3] = 0;
          v126[4] = v21;
          *((_DWORD *)v126 + 10) = var1_high;
          *((_DWORD *)v126 + 11) = var2;
          *((_DWORD *)v126 + 12) = var3;
          v26 = (v26 + 1);
        }
        v127 = *(_DWORD *)((char *)&result->var0 + 6);
        if (v127 && (v179 & 2) == 0)
        {
          v128 = &v198 + 7 * (int)v26;
          *(_DWORD *)v128 = 3;
          *((_DWORD *)v128 + 1) = v127;
          v128[1] = (uint64_t)&v51[i + 1];
          v128[2] = 0;
          v128[3] = 0;
          v128[4] = v21;
          *((_DWORD *)v128 + 10) = var1_high;
          *((_DWORD *)v128 + 11) = var2;
          *((_DWORD *)v128 + 12) = var3;
          v26 = (v26 + 1);
        }
        if (v55 == (char *)j)
        {
          ++j;
          --v180;
          v51 = (char *)j;
          continue;
        }
      }
      break;
    }
    v47 = &v51[i];
    if (v164)
    {
      v158 = 0;
      v129 = &v198 + 7 * (int)v26;
      *(_DWORD *)v129 = 2;
      *((_DWORD *)v129 + 1) = v164;
      v129[1] = (uint64_t)v47;
      v129[2] = 0;
      v129[3] = 0;
      v129[4] = v21 | 0x2000000000000000;
      *((_DWORD *)v129 + 10) = var1_high;
      *((_DWORD *)v129 + 11) = var2;
      *((_DWORD *)v129 + 12) = var3;
      v26 = (v26 + 1);
    }
    if ((int)v26 >= 32)
      -[MDPathFilter filter:allowBundleCheck:].cold.1();
    v45 = v158;
    if (((v54 == 0) & v158) != 0)
      goto LABEL_177;
    if (((v163 | v158) & 1) != 0)
    {
      if (v54 == 47)
        v154 = v51 + 1;
      else
        v154 = v51;
      j = (uint64_t)&v154[i];
      v156 |= v54 == 0;
      v23 = v170;
      continue;
    }
    break;
  }
  v46 = (int)v26 - 1;
  v130 = &v198 + 7 * v46;
  v131 = *(_DWORD *)v130;
  if ((*(_DWORD *)v130 - 3) < 2)
  {
    v136 = &v198 + 7 * v46;
    _MDPlistEmbeddedReferenceToPlistObject(v188[1], *((unsigned int *)v136 + 1), 240, (uint64_t)v55, v26, v16, v17, v18, &v189);
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)arrayObjectToElementRecord((uint64_t)&v189, v137, v138, v139, v140, v141, v142, v143);
    for (j = v136[1]; *(_BYTE *)j && *(_BYTE *)j != 47; ++j)
      ;
    v172 = 0;
    v45 = 0;
    v144 = &v198 + 7 * v46;
    v21 = v144[4];
    var1_high = *((unsigned int *)v144 + 10);
    var2 = *((_DWORD *)v144 + 11);
    var3 = *((_DWORD *)v144 + 12);
    if (*(_BYTE *)j)
      v145 = *(_DWORD *)v130 == 4;
    else
      v145 = 0;
    v47 = (char *)j;
    v27 = (uint64_t)v171;
    if (v145)
    {
      v45 = 0;
      v172 = *(_DWORD *)((unint64_t)v136 | 4);
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (v131 == 2)
  {
    v146 = &v198 + 7 * v46;
    _MDPlistEmbeddedReferenceToPlistObject(v188[1], *((unsigned int *)v146 + 1), 240, (uint64_t)v55, v26, v16, v17, v18, &v190);
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)arrayObjectToElementRecord((uint64_t)&v190, v147, v148, v149, v150, v151, v152, v153);
    v172 = 0;
    v45 = 0;
    j = v146[1];
    v21 = v146[4];
    var1_high = *((unsigned int *)v146 + 10);
    var2 = *((_DWORD *)v146 + 11);
    var3 = *((_DWORD *)v146 + 12);
    v47 = (char *)j;
    v27 = (uint64_t)v171;
    goto LABEL_36;
  }
  v27 = (uint64_t)v171;
  if (v131 == 1)
  {
    v132 = &v198 + 7 * v46;
    v134 = v132[4];
    v133 = v132 + 4;
    v21 = v134;
    var1_high = *((unsigned int *)v133 + 2);
    if (v54 == 47 && *((_BYTE *)v188 + 152))
    {
      v172 = 0;
      var3 = 0;
      var2 = 0;
      v170 = 0;
      result = 0;
      *v133 = (v188[18] | 0x2000000000000000) & v21;
      v135 = &v198 + 7 * v46;
      *((_DWORD *)v135 + 11) = 0;
      *((_DWORD *)v135 + 12) = 0;
      v45 = 1;
      v46 = v26;
      goto LABEL_36;
    }
    LOBYTE(v23) = 0;
LABEL_178:
    v31 = 0x4000000000000000;
    if ((v156 & 1) == 0)
      v31 = 0;
    v32 = v157;
    v29 = v177;
    v30 = v178;
LABEL_181:
    *(_QWORD *)v32 = v31 | v21;
    if ((int)var1_high < 1)
      v155 = 0;
    else
      v155 = *(_QWORD *)(v188[20] + 8 * (var1_high - 1));
    *(_QWORD *)(v32 + 8) = v155;
    *(_WORD *)(v32 + 16) = var1_high;
    *(_WORD *)(v32 + 18) = v23;
    *(_WORD *)(v32 + 20) = var2;
    *(_WORD *)(v32 + 22) = var3;
    *(_WORD *)(v32 + 24) = v29;
    *(_WORD *)(v32 + 26) = v30;
  }
  else
  {
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)CFLog();
    __break(1u);
  }
  return result;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)iCloudPath:(SEL)a3 updateFilter:(const char *)a4
{
  $1CD0F41CAFB66BEF540F4446800F077B *result;
  $1CD0F41CAFB66BEF540F4446800F077B *v9;
  $1CD0F41CAFB66BEF540F4446800F077B *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uid_t st_uid;
  void *v18;
  char v19;
  NSObject *global_queue;
  char v21;
  uint64_t v22;
  uint64_t v23;
  $1CD0F41CAFB66BEF540F4446800F077B *v24;
  $1CD0F41CAFB66BEF540F4446800F077B *v25;
  uint64_t v26;
  void *v27;
  _QWORD handler[5];
  int out_token;
  stat __str;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (iCloudPath_updateFilter__gSetupCache != -1)
    dispatch_once(&iCloudPath_updateFilter__gSetupCache, &__block_literal_global_7);
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  if (!result)
    goto LABEL_10;
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B pathComponents](result, "pathComponents");
  if (!result)
    goto LABEL_10;
  v9 = result;
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B indexOfObject:](result, "indexOfObject:", CFSTR("Mobile Documents"));
  if ((unint64_t)result < 4 || result == ($1CD0F41CAFB66BEF540F4446800F077B *)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v11 = result;
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B count](v9, "count");
  v12 = (char *)&v11->var0 + 1;
  if (result <= ($1CD0F41CAFB66BEF540F4446800F077B *)((char *)&v11->var0 + 1))
    goto LABEL_10;
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_msgSend((id)-[$1CD0F41CAFB66BEF540F4446800F077B objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", (char *)&v11[-1].var7 + 5), "isEqualToString:", CFSTR("Library"));
  if (!(_DWORD)result)
    goto LABEL_10;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", -[$1CD0F41CAFB66BEF540F4446800F077B subarrayWithRange:](v9, "subarrayWithRange:", 0, v11));
  v14 = (void *)-[$1CD0F41CAFB66BEF540F4446800F077B objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v12);
  pthread_mutex_lock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  v15 = objc_msgSend((id)iCloudPath_updateFilter__gPerUserCacheMapping, "objectForKeyedSubscript:", v13);
  if (v15)
  {
    v16 = (void *)v15;
    st_uid = 0;
  }
  else
  {
    memset(&__str, 0, sizeof(__str));
    if (stat((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileSystemRepresentationWithPath:", v13), &__str))
    {
      result = ($1CD0F41CAFB66BEF540F4446800F077B *)pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
      goto LABEL_10;
    }
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend((id)iCloudPath_updateFilter__gPerUserCacheMapping, "setObject:forKeyedSubscript:", v16, v13);
    st_uid = __str.st_uid;
    if (!v16)
    {
      v19 = 0;
      v18 = 0;
      goto LABEL_16;
    }
  }
  v18 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", v14);
  v19 = 1;
LABEL_16:
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  if (st_uid)
  {
    out_token = 0;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    memset(&__str, 0, sizeof(__str));
    snprintf((char *)&__str, 0x100uLL, "user.uid.%d.BRContainerCacheDidChangeDistributedNotification", st_uid);
    global_queue = dispatch_get_global_queue(2, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__MDPathFilter_iCloudPath_updateFilter___block_invoke_2;
    handler[3] = &unk_1E4440E20;
    handler[4] = v16;
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)notify_register_dispatch((const char *)&__str, &out_token, global_queue, handler);
  }
  v21 = v19 ^ 1;
  if (v18)
    v21 = 1;
  if ((v21 & 1) != 0)
  {
    if (!v18)
      goto LABEL_10;
  }
  else
  {
    v22 = objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
    v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Application Support")), "stringByAppendingPathComponent:", CFSTR("CloudDocs")), "stringByAppendingPathComponent:", CFSTR("session")), "stringByAppendingPathComponent:", CFSTR("containers")), "stringByAppendingPathComponent:", v22), "stringByAppendingPathExtension:", CFSTR("plist"));
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v23);
    if (!result)
      goto LABEL_10;
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", result, 0, 0, 0);
    if (!result)
      goto LABEL_10;
    v24 = result;
    objc_opt_class();
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_opt_isKindOfClass();
    if ((result & 1) == 0)
      goto LABEL_10;
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v22);
    if (!result)
      goto LABEL_10;
    v25 = result;
    objc_opt_class();
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_opt_isKindOfClass();
    if ((result & 1) == 0)
      goto LABEL_10;
    v26 = -[$1CD0F41CAFB66BEF540F4446800F077B objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("BRContainerIsDocumentScopePublic"));
    v18 = &unk_1E4446C98;
    if (v26)
    {
      v27 = (void *)v26;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v27;
    }
    pthread_mutex_lock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v14);
    pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  }
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_msgSend(v18, "BOOLValue");
  if ((result & 1) == 0)
    a5->var0 = a5->var0 & 0xFFFFFFFFFFFFFFE7 | 8;
LABEL_10:
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)&a5->var1 + 4);
  return result;
}

id __40__MDPathFilter_iCloudPath_updateFilter___block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  iCloudPath_updateFilter__gPerUserCacheMapping = (uint64_t)result;
  return result;
}

uint64_t __40__MDPathFilter_iCloudPath_updateFilter___block_invoke_2(uint64_t a1)
{
  pthread_mutex_lock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  return pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filterPartialPath:(SEL)a3
{
  const char *v4;
  $1CD0F41CAFB66BEF540F4446800F077B *v5;

  if (self->var1)
  {
    v4 = a4;
    v5 = self;
    if (!strcmp(a4, "."))
    {
      v4 = "/";
    }
    else if (*v4 == 46 && v4[1] == 47)
    {
      ++v4;
    }
    return ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B filter:allowBundleCheck:](v5, "filter:allowBundleCheck:", v4, 0);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    *(_DWORD *)&retstr->var6 = 0;
    *(_QWORD *)&retstr->var2 = 0;
  }
  return self;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filterFullPath:(SEL)a3
{
  $1CD0F41CAFB66BEF540F4446800F077B *v6;
  unint64_t var1;
  int var0_low;
  const char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  const char *v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  char v18;
  __int16 v19;
  __int16 v20;
  _OWORD v21[2];
  _OWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->var1)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    *(_DWORD *)&retstr->var6 = 0;
    *(_QWORD *)&retstr->var2 = 0;
    return self;
  }
  v6 = self;
  var1 = self[4].var1;
  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var0 = var1;
  *(_DWORD *)&retstr->var6 = 0;
  var0_low = LOWORD(self[4].var0);
  if (!LOBYTE(self[5].var6))
  {
    v9 = a4;
    if (LOWORD(self[4].var0))
      goto LABEL_28;
LABEL_12:
    v9 = a4;
    goto LABEL_33;
  }
  if (!LOWORD(self[4].var0))
    goto LABEL_12;
  if (var0_low == 2)
  {
    v12 = 0;
    v13 = a4 + 20;
    v14 = 47;
    while (v14 == a4[v12])
    {
      v14 = aSystemVolumesD[++v12];
      if (v12 == 20)
        goto LABEL_22;
    }
    v13 = 0;
LABEL_22:
    if (v13)
      v9 = v13;
    else
      v9 = a4;
    var0_low = 2;
  }
  else
  {
    v9 = a4;
    if (var0_low == 3)
    {
      v10 = 0;
      v11 = 47;
      while (v11 == a4[v10])
      {
        v11 = aSystemVolumesD[++v10];
        if (v10 == 20)
        {
LABEL_20:
          var0_low = 3;
          goto LABEL_27;
        }
      }
      v15 = 0;
      v16 = 47;
      while (v16 == a4[v15])
      {
        v16 = aSystemVolumesP[++v15];
        if (v15 == 23)
          goto LABEL_20;
      }
      var0_low = 1;
LABEL_27:
      v9 = a4;
    }
  }
LABEL_28:
  if (*v9 != 47)
  {
LABEL_32:
    if (!v6)
    {
LABEL_36:
      memset(v22, 0, 28);
      v18 = 1;
      goto LABEL_37;
    }
LABEL_33:
    self = ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B filter:allowBundleCheck:](v6, "filter:allowBundleCheck:", v9, 0);
    v18 = 0;
LABEL_37:
    *(_OWORD *)&retstr->var0 = v22[0];
    *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)v22 + 12);
    v19 = (_WORD)v9 - (_WORD)a4;
    if (retstr->var6)
      v20 = (_WORD)v9 - (_WORD)a4;
    else
      v20 = 0;
    retstr->var6 += v20;
    if (!retstr->var7)
      v19 = 0;
    retstr->var7 += v19;
    if ((retstr->var0 & 0x2000000000) != 0)
    {
      if ((v18 & 1) != 0)
      {
        memset(v22, 0, 28);
      }
      else
      {
        v21[0] = *(_OWORD *)&retstr->var0;
        *(_OWORD *)((char *)v21 + 12) = *(_OWORD *)((char *)&retstr->var1 + 4);
        self = ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B iCloudPath:updateFilter:](v6, "iCloudPath:updateFilter:", a4, v21);
      }
      *(_OWORD *)&retstr->var0 = v22[0];
      *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)v22 + 12);
    }
    return self;
  }
  v17 = var0_low + 1;
  while (1)
  {
    self = ($1CD0F41CAFB66BEF540F4446800F077B *)strchr((char *)v9 + 1, 47);
    if (!self)
      break;
    v9 = (const char *)self;
    if (--v17 <= 1)
      goto LABEL_32;
  }
  if (v17 == 2)
  {
    v9 = "/";
    if (!v6)
      goto LABEL_36;
    goto LABEL_33;
  }
  return self;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filterFullPathTestBundle:(SEL)a3
{
  __int16 v5;
  $1CD0F41CAFB66BEF540F4446800F077B *v6;
  unint64_t var1;
  int v8;
  const char *v9;
  __int16 v10;
  __int16 v11;
  _OWORD v12[2];

  if (self->var1)
  {
    v5 = (__int16)a4;
    v6 = self;
    var1 = self[4].var1;
    retstr->var1 = 0;
    *(_QWORD *)&retstr->var2 = 0;
    retstr->var0 = var1;
    *(_DWORD *)&retstr->var6 = 0;
    if (LOWORD(self[4].var0) && *a4 == 47)
    {
      v8 = LOWORD(self[4].var0) + 1;
      v9 = a4;
      while (1)
      {
        self = ($1CD0F41CAFB66BEF540F4446800F077B *)strchr((char *)v9 + 1, 47);
        if (!self)
          break;
        v9 = (const char *)self;
        if (--v8 <= 1)
        {
          if (v6)
            goto LABEL_10;
LABEL_21:
          memset(v12, 0, 28);
          goto LABEL_11;
        }
      }
      if (v8 != 2)
        return self;
      v9 = "/";
      if (!v6)
        goto LABEL_21;
    }
    else
    {
      v9 = a4;
    }
LABEL_10:
    self = ($1CD0F41CAFB66BEF540F4446800F077B *)-[$1CD0F41CAFB66BEF540F4446800F077B filter:allowBundleCheck:](v6, "filter:allowBundleCheck:", v9, 1);
LABEL_11:
    *(_OWORD *)&retstr->var0 = v12[0];
    *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)v12 + 12);
    v10 = (_WORD)v9 - v5;
    if (retstr->var6)
      v11 = (_WORD)v9 - v5;
    else
      v11 = 0;
    retstr->var6 += v11;
    if (!retstr->var7)
      v10 = 0;
    retstr->var7 += v10;
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    *(_DWORD *)&retstr->var6 = 0;
    *(_QWORD *)&retstr->var2 = 0;
  }
  return self;
}

- (unint64_t)trimBundlePath:(id *)a3 path:(const char *)a4 buffer:(char *)a5 length:(unint64_t)a6
{
  uint64_t var6;
  unint64_t v7;
  size_t v8;
  size_t v9;

  var6 = a3->var6;
  if (var6 + 1 < a6)
    v7 = var6 + 1;
  else
    v7 = a6;
  if (a3->var6)
    v8 = v7;
  else
    v8 = a6;
  v9 = strlcpy(a5, a4, v8);
  if (v9 + 1 < v8)
    return v9 + 1;
  else
    return v8;
}

- (unint64_t)filterSubAuxValues:(id *)a3 count:(int *)a4
{
  int var5;

  var5 = a3->var5;
  if (a4)
    *a4 = var5;
  if (var5)
    return &self->_auxValues[a3->var4];
  else
    return 0;
}

- (void)initWithMDPlist:(uint64_t)a3 .cold.1(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  OUTLINED_FUNCTION_0_1(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)filter:allowBundleCheck:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)filter:(uint64_t)a3 allowBundleCheck:(uint64_t)a4 .cold.2(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  OUTLINED_FUNCTION_0_1(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)filter:(uint64_t)a3 allowBundleCheck:(uint64_t)a4 .cold.3(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  OUTLINED_FUNCTION_0_1(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)filter:allowBundleCheck:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

- (void)filter:allowBundleCheck:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  __break(1u);
}

@end
