@implementation GEMagicKit

+ (magic_set)sharedMagicCookie
{
  __objc2_meth_list **p_class_meths;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD **v13;
  char *v14;
  char *v15;
  const char *v16;
  char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  char v25;
  _QWORD *v26;
  int v27;
  char *v28;
  char *v29;
  char *v30;
  int **v31;
  int **v32;
  char *v33;
  int v36;
  char *v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  size_t st_size;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int **v61;
  DIR *v62;
  DIR *v63;
  int **v64;
  void *v65;
  size_t v66;
  unint64_t v67;
  dirent *v68;
  const char *d_name;
  char *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  char **v81;
  char *v82;
  uint64_t v83;
  void **v84;
  void *v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  char v94;
  unint64_t v95;
  unsigned int v96;
  unsigned int *v97;
  unsigned int v98;
  uint64_t v99;
  unsigned __int8 **v100;
  unsigned __int8 *v101;
  unint64_t v102;
  unsigned int *v103;
  unsigned int v104;
  unsigned __int8 *v105;
  unsigned __int8 v106;
  unsigned __int8 v107;
  const char *v108;
  int v109;
  const char *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  char *v114;
  char *v115;
  int v116;
  uint64_t v117;
  unsigned int v118;
  int v119;
  int v120;
  unsigned __int8 v121;
  _BYTE *v122;
  uint64_t v123;
  unsigned __int8 *v124;
  unint64_t v125;
  uint64_t v126;
  unsigned int *v127;
  uint64_t v128;
  unsigned int v129;
  unsigned int *v130;
  int *v131;
  unint64_t v132;
  int v133;
  int **v134;
  char v135;
  int *v136;
  _QWORD *v137;
  unsigned int v138;
  int v139;
  int *v140;
  uint64_t v141;
  int v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unsigned int v150;
  BOOL v151;
  int *v152;
  int **v153;
  size_t v154;
  ssize_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unsigned int *v161;
  int v162;
  unsigned int v163;
  int *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char v170;
  char v171;
  int *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  int *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  unint64_t v191;
  unsigned int *v192;
  unsigned int v193;
  unsigned int v194;
  unsigned int v195;
  unsigned int v196;
  uint64_t v197;
  char v198;
  char v199;
  uint64_t v200;
  int8x16_t *v201;
  unsigned int v202;
  uint64_t v203;
  uint64_t v205;
  char v206;
  _QWORD *v207;
  _QWORD *v208;
  int **v209;
  uint64_t v210;
  int *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  int *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  char v223;
  int v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  int *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  int *v242;
  char v244;
  char *__s;
  char *v246;
  int v247;
  int **v248;
  void **v249;
  char v250;
  uint64_t v251;
  unsigned int *v252;
  stat v253;
  char *v254;
  int v255;
  char *v256[2];
  __int128 v257;
  uint64_t v258;

  v258 = *MEMORY[0x24BDAC8D0];
  p_class_meths = &OBJC_PROTOCOL___NSObject.class_meths;
  if (sharedMagicCookie_sharedCookie)
    return (magic_set *)p_class_meths[498];
  v3 = malloc_type_calloc(1uLL, 0x120uLL, 0x10700403DB5B4F0uLL);
  v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 17) = 0;
    v3[5] = 0;
    v3[6] = 0;
    v3[4] = 0;
    v3[2] = 10;
    v5 = malloc_type_malloc(0xA0uLL, 0x816EEC7DuLL);
    v4[3] = v5;
    if (v5)
    {
      *((_DWORD *)v4 + 18) = 0;
      *((_DWORD *)v4 + 16) = -1;
      *v4 = 0;
      v4[1] = 0;
      v4[10] = "unknown";
      v4[11] = 0;
      v4[33] = 0x800800000320032;
      *((_DWORD *)v4 + 68) = 536871168;
      v4[35] = 0x100000;
    }
    else
    {
      free(v4);
      v4 = 0;
    }
  }
  sharedMagicCookie_sharedCookie = (uint64_t)v4;
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("magic"), CFSTR("mgc")), "fileSystemRepresentation");
  v13 = (_QWORD **)sharedMagicCookie_sharedCookie;
  if (!sharedMagicCookie_sharedCookie)
  {
LABEL_242:
    v241 = (void *)MEMORY[0x24BDBCE88];
    v242 = __error();
    objc_msgSend(v241, "raise:format:", CFSTR("MagicKit"), CFSTR("There was an error opening the magic database: %s"), strerror(*v242));
    p_class_meths = &OBJC_PROTOCOL___NSObject.class_meths;
    return (magic_set *)p_class_meths[498];
  }
  v14 = (char *)v6;
  file_reset(sharedMagicCookie_sharedCookie, 0, v7, v8, v9, v10, v11, v12);
  if (v14)
    goto LABEL_24;
  v14 = getenv("MAGIC");
  if (v14)
    goto LABEL_24;
  if (get_default_magic_default_magic)
  {
    free((void *)get_default_magic_default_magic);
    get_default_magic_default_magic = 0;
  }
  v15 = getenv("HOME");
  if (!v15)
    goto LABEL_23;
  v16 = v15;
  v256[0] = 0;
  memset(&v253, 0, sizeof(v253));
  if (asprintf(v256, "%s/.magic.mgc", v15) < 0)
    goto LABEL_23;
  v17 = v256[0];
  if (stat(v256[0], &v253) != -1)
    goto LABEL_14;
  free(v17);
  if ((asprintf(v256, "%s/.magic", v16) & 0x80000000) == 0)
  {
    v17 = v256[0];
    if (stat(v256[0], &v253) == -1)
    {
LABEL_22:
      get_default_magic_default_magic = 0;
      free(v17);
      goto LABEL_23;
    }
    if ((v253.st_mode & 0xF000) != 0x4000)
    {
LABEL_14:
      if ((asprintf((char **)&get_default_magic_default_magic, "%s:%s", v17, "/etc/magic") & 0x80000000) == 0)
      {
        free(v17);
        v14 = (char *)get_default_magic_default_magic;
        if (!get_default_magic_default_magic)
          goto LABEL_242;
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    free(v17);
    if ((asprintf(v256, "%s/%s", v16, "/.magic/magic.mgc") & 0x80000000) == 0)
    {
      v17 = v256[0];
      if (access(v256[0], 4) == -1)
        goto LABEL_22;
      goto LABEL_14;
    }
  }
LABEL_23:
  v14 = "/etc/magic";
LABEL_24:
  if ((init_file_tables_done & 1) == 0)
  {
    init_file_tables_done = 1;
    v18 = "invalid";
    do
    {
      v19 = *((int *)v18 + 6);
      if ((int)v19 >= 51)
        __assert_rtn("init_file_tables", "apprentice.c", 407, "p->type < FILE_NAMES_SIZE");
      file_names[v19] = v18;
      file_formats[v19] = *((_DWORD *)v18 + 7);
      v20 = v18 + 32;
      v21 = *((_QWORD *)v18 + 6);
      v18 += 32;
    }
    while (v21);
    if (v20 - "invalid" != 1632)
      __assert_rtn("init_file_tables", "apprentice.c", 411, "p - type_tbl == FILE_NAMES_SIZE");
  }
  v22 = strdup(v14);
  if (!v22)
  {
    v223 = strlen(v14);
    v224 = *__error();
    file_error((int)v13, v224, "cannot allocate %zu bytes", v225, v226, v227, v228, v229, v223);
    goto LABEL_242;
  }
  __s = v22;
  v23 = 0;
  v24 = 1;
  do
  {
    v25 = v24;
    mlist_free(v13[v23]);
    v26 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A00403F8C4432uLL);
    if (!v26)
    {
      v13[v23] = 0;
      v230 = __error();
      file_error((int)v13, *v230, "cannot allocate %zu bytes", v231, v232, v233, v234, v235, 40);
      if ((v25 & 1) == 0)
      {
        mlist_free(*v13);
        *v13 = 0;
      }
      free(__s);
      goto LABEL_242;
    }
    v24 = 0;
    v26[3] = v26;
    v26[4] = v26;
    v13[v23] = v26;
    v23 = 1;
  }
  while ((v25 & 1) != 0);
  v27 = -1;
  v28 = __s;
  do
  {
    v247 = v27;
    v29 = v28;
    v30 = strchr(v28, 58);
    if (v30)
      *v30++ = 0;
    if (!*v29)
    {
      v27 = v247;
      break;
    }
    v246 = v30;
    memset(&v253, 0, sizeof(v253));
    v31 = (int **)malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040EA71619DuLL);
    v32 = v31;
    if (!v31)
    {
      v38 = __error();
      file_error((int)v13, *v38, "cannot allocate %zu bytes", v39, v40, v41, v42, v43, 48);
LABEL_64:
      v37 = 0;
      goto LABEL_65;
    }
    *((_DWORD *)v31 + 4) = 0;
    v256[0] = 0;
    v33 = v29 - 1;
    while (*++v33)
      ;
    if (v33 >= v29)
    {
      v44 = "c";
      while (1)
      {
        v45 = v44;
        if (v44[1] != *v33)
          break;
        --v33;
        if (v44 >= ".mgc")
        {
          --v44;
          if (v33 >= v29)
            continue;
        }
        if (v45 >= ".mgc")
          break;
        goto LABEL_43;
      }
    }
    --v33;
    while (*++v33)
      ;
LABEL_43:
    v36 = (_DWORD)v33 - (_DWORD)v29 + 1;
    if ((*((_WORD *)v13 + 34) & 0x410) != 0)
    {
      if (asprintf(v256, "%.*s.mime%s", v36, v29, ".mgc") < 0)
        goto LABEL_64;
      v37 = v256[0];
      if (access(v256[0], 4) != -1)
      {
        *((_DWORD *)v13 + 17) &= 0x10u;
        if (!v37)
          goto LABEL_65;
        goto LABEL_60;
      }
      free(v37);
    }
    if (asprintf(v256, "%.*s%s", v36, v29, ".mgc") < 0)
      goto LABEL_64;
    if (strstr(v29, ".mime"))
      *((_DWORD *)v13 + 17) &= 0x10u;
    v37 = v256[0];
    if (!v256[0])
      goto LABEL_65;
LABEL_60:
    v46 = open(v37, 0);
    if (v46 != -1)
    {
      v47 = v46;
      if (fstat(v46, &v253) == -1)
      {
        v143 = *__error();
      }
      else
      {
        st_size = v253.st_size;
        if (v253.st_size >= 8)
        {
          v32[1] = (int *)v253.st_size;
          *((_DWORD *)v32 + 4) = 1;
          v152 = (int *)malloc_type_malloc(st_size, 0xC8C2B308uLL);
          *v32 = v152;
          v153 = v32;
          v154 = (size_t)v32[1];
          if (v152)
          {
            v155 = read(v47, v152, v154);
            v32 = v153;
            if ((int *)v155 == v153[1])
            {
              close(v47);
              v161 = (unsigned int *)*v153;
              v162 = **v153;
              if (v162 == -249691108)
              {
                v163 = v161[1];
              }
              else
              {
                if (v162 != 470032113)
                {
                  goto LABEL_65;
                }
                v163 = bswap32(v161[1]);
              }
              if (v163 == 16)
              {
                v190 = (unint64_t)v153[1];
                if (376 * (v190 / 0x178) == v190)
                {
                  v191 = v190 / 0x178;
                  v192 = v161 + 94;
                  v153[3] = (int *)(v161 + 94);
                  v193 = v161[2];
                  v194 = bswap32(v193);
                  if (v162 != -249691108)
                    v193 = v194;
                  *((_DWORD *)v153 + 10) = v193;
                  v195 = v161[3];
                  v196 = bswap32(v195);
                  if (v162 != -249691108)
                    v195 = v196;
                  *((_DWORD *)v153 + 11) = v195;
                  v153[4] = (int *)&v192[94 * v193];
                  if (v195 + v193 + 1 == (_DWORD)v191)
                  {
                    if (v162 != -249691108)
                    {
                      v197 = 0;
                      v198 = 1;
                      do
                      {
                        v199 = v198;
                        v200 = *((unsigned int *)v153 + v197 + 10);
                        if ((_DWORD)v200)
                        {
                          v201 = (int8x16_t *)(v153[v197 + 3] + 6);
                          do
                          {
                            v201[-2].i16[4] = bswap32(v201[-2].u16[4]) >> 16;
                            *(int8x8_t *)((char *)v201[-1].i64 + 4) = vrev32_s8(*(int8x8_t *)((char *)v201[-1].i64 + 4));
                            v201[-1].i32[3] = bswap32(v201[-1].u32[3]);
                            v202 = v201[-2].u8[14];
                            v151 = v202 > 0x2E;
                            v203 = (1 << v202) & 0x6200001E2020;
                            if (v151 || v203 == 0)
                              *v201 = vrev64q_s8(*v201);
                            else
                              *(int8x8_t *)v201->i8 = vrev32_s8(*(int8x8_t *)v201->i8);
                            v201 = (int8x16_t *)((char *)v201 + 376);
                            --v200;
                          }
                          while (v200);
                        }
                        v198 = 0;
                        v197 = 1;
                      }
                      while ((v199 & 1) != 0);
                    }
                    free(v37);
                    goto LABEL_219;
                  }
                }
                else
                {
                }
              }
              else
              {
              }
              goto LABEL_65;
            }
            v184 = *__error();
            file_error((int)v13, v184, "error reading", v185, v186, v187, v188, v189, v244);
          }
          else
          {
            v178 = __error();
            file_error((int)v13, *v178, "cannot allocate %zu bytes", v179, v180, v181, v182, v183, v154);
            v32 = v153;
          }
        }
        else
        {
        }
      }
      close(v47);
    }
LABEL_65:
    apprentice_unmap(v32);
    free(v37);
    v60 = *((_DWORD *)v13 + 17);
    if ((v60 & 0x40) != 0)
    {
      v60 = *((_DWORD *)v13 + 17);
    }
    v255 = 0;
    *(_OWORD *)v256 = 0u;
    v257 = 0u;
    *((_DWORD *)v13 + 17) = v60 | 0x40;
    v61 = (int **)malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040EA71619DuLL);
    if (!v61)
    {
      v86 = __error();
      file_error((int)v13, *v86, "cannot allocate %zu bytes", v87, v88, v89, v90, v91, 48);
LABEL_95:
      v92 = -1;
      v27 = v247;
      goto LABEL_96;
    }
    v32 = v61;
    memset(&v253, 0, sizeof(v253));
    *((_DWORD *)v61 + 4) = 1;
    v254 = 0;
    if (stat(v29, &v253) || (v253.st_mode & 0xF000) != 0x4000)
    {
      load_1((uint64_t)v13, v29, &v255, (uint64_t)v256);
    }
    else
    {
      v62 = opendir(v29);
      if (!v62)
      {
        v65 = 0;
        v255 = 1;
        goto LABEL_85;
      }
      v63 = v62;
      v64 = v32;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      while (1)
      {
        v68 = readdir(v63);
        if (!v68)
          break;
        d_name = v68->d_name;
        if (v68->d_name[0] != 46)
        {
          if (asprintf(&v254, "%s/%s", v29, v68->d_name) < 0)
          {
            v170 = strlen(v29);
            v171 = v170 + strlen(d_name) + 2;
            v172 = __error();
            file_error((int)v13, *v172, "cannot allocate %zu bytes", v173, v174, v175, v176, v177, v171);
            ++v255;
            closedir(v63);
LABEL_192:
            v32 = v64;
            goto LABEL_85;
          }
          v70 = v254;
          if (stat(v254, &v253) != -1 && (v253.st_mode & 0xF000) == 0x8000)
          {
            if (v66 >= v67)
            {
              v67 = 2 * v67 + 2;
              v71 = malloc_type_realloc(v65, 8 * v67, 0x40669993uLL);
              if (!v71)
              {
                v217 = __error();
                file_error((int)v13, *v217, "cannot allocate %zu bytes", v218, v219, v220, v221, v222, 8 * v67);
                free(v254);
                closedir(v63);
                ++v255;
                goto LABEL_192;
              }
              v70 = v254;
              v65 = v71;
            }
            *((_QWORD *)v65 + v66++) = v70;
          }
          else
          {
            free(v70);
          }
        }
      }
      closedir(v63);
      v32 = v64;
      if (v65)
      {
        qsort(v65, v66, 8uLL, (int (__cdecl *)(const void *, const void *))cmpstrp);
        if (v66)
        {
          v149 = 0;
          v150 = 1;
          do
          {
            load_1((uint64_t)v13, *((char **)v65 + v149), &v255, (uint64_t)v256);
            free(*((void **)v65 + v149));
            v149 = v150;
            v151 = v66 > v150++;
          }
          while (v151);
        }
        free(v65);
      }
    }
    if (v255)
      goto LABEL_84;
    v93 = 0;
    v94 = 1;
    v248 = v32;
    do
    {
      v250 = v94;
      v251 = v93;
      v95 = (unint64_t)&v256[2 * v93];
      v96 = *(_DWORD *)(v95 + 8);
      v97 = *(unsigned int **)v95;
      if (!v96)
        goto LABEL_153;
      v98 = 0;
      v249 = (void **)v95;
      v252 = (unsigned int *)(v95 | 8);
      do
      {
        v99 = v98;
        v100 = (unsigned __int8 **)&v97[4 * v98];
        v101 = *v100;
        if (*(_WORD *)*v100)
        {
          ++v98;
          continue;
        }
        v102 = v96;
        if (v96 <= v98 + 1)
          ++v98;
        else
          v98 = v96;
        v103 = &v97[4 * v99];
        do
        {
          v104 = v101[6];
          if (v104 <= 0x32)
          {
            v105 = *v100;
            if (((1 << v104) & 0x71C7FFFE1DFD6) != 0)
            {
              v106 = v105[2];
              goto LABEL_112;
            }
            if (((1 << v104) & 0xC2020) != 0)
            {
              v106 = v105[2];
              if ((v105[28] & 0x20) != 0)
              {
                v107 = v106 | 0x40;
                goto LABEL_113;
              }
LABEL_112:
              v107 = v106 | 0x20;
LABEL_113:
              v105[2] = v107;
              goto LABEL_114;
            }
            if (((1 << v104) & 0x120000) != 0)
            {
              v118 = *((_DWORD *)v105 + 7);
              v119 = v105[2];
              v120 = (v118 >> 1) & 0x20 | (((v118 >> 5) & 1) << 6) | v119;
              if ((v118 & 0x60) != 0)
              {
                v105[2] = (*((_DWORD *)v105 + 7) >> 1) & 0x20 | (((*((_DWORD *)v105 + 7) & 0x20) != 0) << 6) | v119;
                v119 |= (v118 >> 1) & 0x20 | (((v118 >> 5) & 1) << 6);
              }
              if ((v120 & 0x60) == 0)
              {
                if ((int)file_looks_utf8((uint64_t)(v101 + 32), v101[5], 0, 0) <= 0)
                  v121 = v119 | 0x20;
                else
                  v121 = v119 | 0x40;
                v105[2] = v121;
              }
            }
          }
LABEL_114:
          if ((*((_BYTE *)v13 + 68) & 1) != 0)
          {
            v109 = v101[224];
            v108 = (const char *)(v101 + 224);
            v110 = v108 - 64;
            v111 = "; ";
            if (!v109)
              v111 = "";
            if (!*(v108 - 64))
              v110 = "(no description)";
            v112 = "binary";
            if ((*(v108 - 222) & 0x20) == 0)
              v112 = "text";
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s%s%s: %s\n", v108, v111, v110, v112);
            v113 = *(_QWORD *)v103;
            if ((*(_BYTE *)(*(_QWORD *)v103 + 2) & 0x20) != 0)
            {
              v114 = strstr((char *)(v113 + 160), "text");
              if (v114)
              {
                v115 = v114;
                if (v114 != (char *)(v113 + 160))
                {
                  v116 = *(v114 - 1);
                  v117 = *(v114 - 1);
                  if (v116 < 0)
                  {
                    if (!__maskrune(v117, 0x4000uLL))
                      goto LABEL_143;
                  }
                  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v117 + 60) & 0x4000) == 0)
                  {
                    goto LABEL_143;
                  }
                  v113 = *(_QWORD *)v103;
                }
                v122 = v115 + 5;
                if (&v115[-v113 + 5] == (char *)288)
                  goto LABEL_142;
                v123 = *v122;
                if (!*v122)
                  goto LABEL_142;
                if ((v123 & 0x80) == 0)
                {
                  if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v123 + 60) & 0x4000) == 0)
                    goto LABEL_143;
LABEL_142:
                  fwrite("*** Possible binary test for text type\n", 0x27uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
                  goto LABEL_143;
                }
                if (__maskrune(v123, 0x4000uLL))
                  goto LABEL_142;
              }
            }
          }
LABEL_143:
          if (++v99 >= v102)
            goto LABEL_150;
          v124 = (unsigned __int8 *)*((_QWORD *)v103 + 2);
          v103 += 4;
          v101 = v124;
        }
        while (*(_WORD *)v124);
        v98 = v99;
LABEL_150:
        v96 = *v252;
      }
      while (v98 < v96);
      v32 = v248;
      v97 = (unsigned int *)*v249;
LABEL_153:
      v125 = v96;
      if (v97)
        qsort(v97, v96, 0x10uLL, (int (__cdecl *)(const void *, const void *))apprentice_sort);
      if (!(_DWORD)v125)
      {
        v140 = (int *)malloc_type_malloc(0, 0xCFC100B3uLL);
        v32[v251 + 3] = v140;
        if (v140)
        {
          v138 = 0;
          goto LABEL_168;
        }
        v135 = 0;
LABEL_190:
        v164 = __error();
        file_error((int)v13, *v164, "cannot allocate %zu bytes", v165, v166, v167, v168, v169, v135);
        v65 = 0;
        ++v255;
        goto LABEL_85;
      }
      v126 = 0;
      v127 = v97;
      while (1)
      {
        v128 = v126 + 1;
        if (!**(_WORD **)v127 && *(_BYTE *)(*(_QWORD *)v127 + 6) == 3)
          break;
        v127 += 4;
        ++v126;
        if (v125 == v128)
          goto LABEL_160;
      }
      if (v125 > v128)
        LODWORD(v128) = v125;
      v141 = 4;
      while (++v126 < v125)
      {
        v142 = **(unsigned __int16 **)&v127[v141];
        v141 += 4;
        if (!v142)
        {
          LODWORD(v128) = v126;
          break;
        }
      }
      if ((_DWORD)v128 != (_DWORD)v125)
      {
        v13[11] = (_QWORD *)*(unsigned int *)(*(_QWORD *)&v97[4 * v128] + 20);
        file_magwarn((uint64_t)v13, "level 0 \"default\" did not sort last", v72, v73, v74, v75, v76, v77, v244);
      }
LABEL_160:
      v129 = 0;
      v130 = v97 + 2;
      v131 = (int *)(v97 + 2);
      v132 = v125;
      do
      {
        v133 = *v131;
        v131 += 4;
        v129 += v133;
        --v132;
      }
      while (v132);
      v134 = &v32[v251];
      v135 = 120 * v129;
      v136 = (int *)malloc_type_malloc(376 * v129, 0xCFC100B3uLL);
      v134[3] = v136;
      v137 = v134 + 3;
      if (!v136)
        goto LABEL_190;
      v138 = 0;
      do
      {
        memcpy((void *)(*v137 + 376 * v138), *((const void **)v130 - 1), 376 * *v130);
        v139 = *v130;
        v130 += 4;
        v138 += v139;
        --v125;
      }
      while (v125);
LABEL_168:
      v94 = 0;
      *((_DWORD *)v32 + v251 + 10) = v138;
      v93 = 1;
    }
    while ((v250 & 1) != 0);
LABEL_84:
    v65 = 0;
LABEL_85:
    free(v65);
    v78 = 0;
    v79 = 1;
    do
    {
      v80 = v79;
      v81 = &v256[2 * v78];
      v82 = *v81;
      if (*v81)
      {
        v83 = *((unsigned int *)v81 + 2);
        if ((_DWORD)v83)
        {
          v84 = (void **)*v81;
          do
          {
            v85 = *v84;
            v84 += 2;
            free(v85);
            --v83;
          }
          while (v83);
        }
        free(v82);
      }
      v79 = 0;
      v78 = 1;
    }
    while ((v80 & 1) != 0);
    if (v255)
    {
      apprentice_unmap(v32);
      goto LABEL_95;
    }
LABEL_219:
    v205 = 0;
    v206 = 1;
    while (1)
    {
      v207 = v13[v205];
      v207[2] = 0;
      v208 = malloc_type_malloc(0x28uLL, 0x10A00403F8C4432uLL);
      if (!v208)
        break;
      v92 = v206 & 1;
      if ((v206 & 1) != 0)
        v209 = v32;
      else
        v209 = 0;
      v208[2] = v209;
      *v208 = v32[v205 + 3];
      *((_DWORD *)v208 + 2) = *((_DWORD *)v32 + v205 + 10);
      v210 = v207[4];
      *(_QWORD *)(v210 + 24) = v208;
      v208[3] = v207;
      v208[4] = v210;
      v207[4] = v208;
      v205 = 1;
      v206 = 0;
      if (!v92)
      {
        v27 = v247;
        goto LABEL_96;
      }
    }
    if ((v206 & 1) != 0)
    {
      apprentice_unmap(v32);
    }
    else
    {
      mlist_free(*v13);
      *v13 = 0;
      mlist_free(v13[1]);
      v13[1] = 0;
    }
    v27 = v247;
    v211 = __error();
    file_error((int)v13, *v211, "cannot allocate %zu bytes", v212, v213, v214, v215, v216, 40);
    v92 = -1;
LABEL_96:
    v28 = v246;
    if (v27 <= v92)
      v27 = v92;
  }
  while (v246);
  free(__s);
  p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSObject + 32);
  if (v27 == -1)
  {
    mlist_free(*v13);
    *v13 = 0;
    mlist_free(v13[1]);
    v13[1] = 0;
    file_error((int)v13, 0, "could not find any valid magic files!", v236, v237, v238, v239, v240, v244);
    goto LABEL_242;
  }
  return (magic_set *)p_class_meths[498];
}

+ (id)magicForObject:(id)a3 decompress:(BOOL)a4
{
  uint64_t v6;
  magic_set *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;

  if (a4)
    v6 = 4;
  else
    v6 = 0;
  v7 = +[GEMagicKit sharedMagicCookie](GEMagicKit, "sharedMagicCookie");
  v8 = objc_msgSend(a1, "rawMagicOutputForObject:cookie:flags:", a3, v7, v6);
  v9 = (void *)objc_msgSend(a1, "rawMagicOutputForObject:cookie:flags:", a3, v7, v6 | 0x410);
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
    return 0;
  v11 = v9;
  v12 = (const __CFString *)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(";")),
                              "objectAtIndex:",
                              0);
  v13 = (id)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1660], v12, 0);
  if (!v13)
    return 0;
  else
    return -[GEMagicResult initWithMimeType:description:typeHierarchy:]([GEMagicResult alloc], "initWithMimeType:description:typeHierarchy:", v11, v8, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v13), "arrayByAddingObjectsFromArray:", +[GEMagicKit typeHierarchyForType:](GEMagicKit, "typeHierarchyForType:", v13)));
}

+ (id)rawMagicOutputForObject:(id)a3 cookie:(magic_set *)a4 flags:(int)a5
{
  unsigned __int8 *v7;
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
  const char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a4)
    *((_DWORD *)a4 + 17) = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (unsigned __int8 *)objc_msgSend(a3, "bytes");
    v8 = objc_msgSend(a3, "length");
    if (!a4)
      return 0;
    v15 = v8;
    if (file_reset((uint64_t)a4, 1, v9, v10, v11, v12, v13, v14) == -1
      || file_buffer((uint64_t)a4, -1, 0, v7, v15, v16, v17, v18) == -1)
    {
      return 0;
    }
    v19 = file_getbuffer((uint64_t)a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("MagicKit"), CFSTR("Invalid object (expected data or path string): %@"), a3);
      return 0;
    }
    v20 = (char *)objc_msgSend(a3, "fileSystemRepresentation");
    v19 = magic_file((const char *)a4, v20, v21, v22, v23, v24, v25, v26);
  }
  if (v19)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
  return 0;
}

+ (id)typeHierarchyForType:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[__CFDictionary objectForKey:](UTTypeCopyDeclaration((CFStringRef)a3), "objectForKey:", *MEMORY[0x24BDC1738]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v3);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(v4, "addObjectsFromArray:", +[GEMagicKit typeHierarchyForType:](GEMagicKit, "typeHierarchyForType:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)));
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v3);
    return 0;
  }
  return v4;
}

+ (id)magicForFileAtPath:(id)a3
{
  return +[GEMagicKit magicForFileAtPath:decompress:](GEMagicKit, "magicForFileAtPath:decompress:", a3, 0);
}

+ (id)magicForFileAtURL:(id)a3
{
  return +[GEMagicKit magicForFileAtURL:decompress:](GEMagicKit, "magicForFileAtURL:decompress:", a3, 0);
}

+ (id)magicForData:(id)a3
{
  return +[GEMagicKit magicForData:decompress:](GEMagicKit, "magicForData:decompress:", a3, 0);
}

+ (id)magicForFileAtPath:(id)a3 decompress:(BOOL)a4
{
  return +[GEMagicKit magicForObject:decompress:](GEMagicKit, "magicForObject:decompress:", a3, a4);
}

+ (id)magicForFileAtURL:(id)a3 decompress:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (objc_msgSend(a3, "isFileURL"))
    return +[GEMagicKit magicForFileAtPath:decompress:](GEMagicKit, "magicForFileAtPath:decompress:", objc_msgSend(a3, "path"), v4);
  else
    return 0;
}

+ (id)magicForData:(id)a3 decompress:(BOOL)a4
{
  return +[GEMagicKit magicForObject:decompress:](GEMagicKit, "magicForObject:decompress:", a3, a4);
}

@end
