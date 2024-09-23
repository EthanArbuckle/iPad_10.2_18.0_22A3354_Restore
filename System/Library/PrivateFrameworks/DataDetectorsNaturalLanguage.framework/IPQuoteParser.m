@implementation IPQuoteParser

+ (id)strippedQuoteBlockWithHtml:(id)a3
{
  const __CFString *v3;
  __CFString *v4;
  CFIndex Length;
  const __CFString *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  UniChar *v18;
  uint64_t v19;
  UniChar v20;
  unint64_t v21;
  uint64_t v22;
  UniChar *v23;
  unint64_t v24;
  UniChar v25;
  uint64_t v26;
  UniChar *v27;
  uint64_t v28;
  UniChar v29;
  BOOL v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  UniChar *v35;
  uint64_t v36;
  UniChar v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  BOOL v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  UniChar *v54;
  uint64_t v55;
  UniChar v56;
  __CFString *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  UniChar *v62;
  uint64_t v63;
  UniChar v64;
  BOOL v65;
  int v66;
  _BOOL4 v67;
  _BOOL4 v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 v75;
  _BOOL4 v76;
  unint64_t v77;
  _BOOL4 v78;
  _BOOL4 v79;
  int v80;
  _BOOL4 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  UniChar *v87;
  uint64_t v88;
  UniChar v89;
  unint64_t v90;
  BOOL v91;
  uint64_t v92;
  unint64_t v93;
  BOOL v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __CFString *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  UniChar v104;
  unsigned int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  UniChar v111;
  _BOOL8 v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  CFIndex v116;
  CFIndex v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  UniChar *v124;
  uint64_t v125;
  UniChar v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __CFString *v133;
  __CFString *v134;
  __CFString *v135;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  CFIndex v141;
  uint64_t v142;
  int v143;
  _BOOL4 v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  UniChar v153[8];
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  CFStringRef theString1[2];
  __int128 v162;
  __int128 v163;
  uint64_t v164;
  UniChar buffer[8];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  CFStringRef theString[2];
  __int128 v174;
  __int128 v175;
  uint64_t v176;
  CFRange v177;
  CFRange v178;
  CFRange v179;
  CFRange v180;
  CFRange v181;
  CFRange v182;
  CFRange v183;
  CFRange v184;
  CFRange v185;
  CFRange v186;
  CFRange v187;
  CFRange v188;
  CFRange v189;

  v3 = (const __CFString *)a3;
  v4 = (__CFString *)v3;
  if (!v3)
  {
    v135 = 0;
    goto LABEL_332;
  }
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  *(_OWORD *)buffer = 0u;
  v166 = 0u;
  Length = CFStringGetLength(v3);
  theString[0] = v4;
  *((_QWORD *)&v174 + 1) = 0;
  *(_QWORD *)&v175 = Length;
  CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v4);
  CStringPtr = 0;
  theString[1] = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
  *((_QWORD *)&v175 + 1) = 0;
  v176 = 0;
  *(_QWORD *)&v174 = CStringPtr;
  if (Length < 1)
    goto LABEL_326;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v151 = 0;
  v152 = 0;
  v142 = 0;
  v139 = 0;
  v140 = 0;
  v146 = 0;
  v147 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v143 = 0;
  v148 = Length - 14;
  v150 = 0;
  v15 = MEMORY[0x24BDAC740];
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v149 = -1;
  v141 = Length;
  do
  {
    if (v13 < 0)
    {
      if (v10)
        goto LABEL_121;
      v20 = 0;
LABEL_19:
      if (v8 && !v9)
      {
        if (v11)
        {
          v14 = 0;
          v10 = 0;
          v9 = 0;
          v11 = 1;
        }
        else if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = 0;
          v11 = 0;
          v10 = 0;
          v9 = 0;
          v16 = (*((_QWORD *)&v174 + 1) + v13) & ~((*((_QWORD *)&v174 + 1) + v13) >> 63);
        }
        else
        {
          v14 = 0;
          v11 = v20 <= 0x20u && ((1 << v20) & 0x100002600) != 0;
          v10 = 0;
          v9 = 0;
        }
        goto LABEL_122;
      }
      if (v8 | v9)
      {
        v10 = 0;
        goto LABEL_122;
      }
      v9 = 0;
      v10 = 0;
      if (v20 > 0xCu)
      {
        if (v20 != 32)
        {
          if (v20 != 13)
          {
LABEL_32:
            v30 = v12 > 0 && v151 == 0;
            v31 = v30;
            v143 |= v31;
            if (v12 | v151)
            {
              v10 = 0;
              v9 = 0;
              v8 = 0;
            }
            else
            {
              v71 = v14 || v149 < 0;
              v14 = 0;
              v151 = 0;
              v12 = 0;
              if (v71)
                v72 = 0;
              else
                v72 = v149;
              v73 = v150;
              if (v71)
                v73 = 0;
              v149 = v72;
              v150 = v73;
              v30 = !v71;
              v74 = v142;
              if (!v30)
                v74 = v13;
              v142 = v74;
              v10 = 0;
              v9 = 0;
              v8 = 0;
            }
            goto LABEL_122;
          }
LABEL_68:
          v40 = v151;
          v41 = v12 | v151;
          v42 = v13 + ~v142;
          v44 = v149;
          v43 = v150;
          if (v149)
            v42 = v150;
          v45 = -1;
          if (v149 <= 3)
            v45 = v149 + 1;
          if (!v41)
          {
            v14 = 1;
            v40 = 0;
          }
          v151 = v40;
          if (v41)
          {
            v46 = v146;
          }
          else
          {
            v12 = 0;
            v46 = 0;
          }
          v47 = v147;
          if (!v41)
            v47 = 0;
          v146 = v46;
          v147 = v47;
          if (!v41)
          {
            v44 = v45;
            v43 = v42;
          }
          v149 = v44;
          v150 = v43;
          v10 = 0;
          v9 = 0;
          v8 = 0;
          goto LABEL_122;
        }
      }
      else if (v20 != 9)
      {
        if (v20 != 10)
          goto LABEL_32;
        goto LABEL_68;
      }
      v8 = 0;
      goto LABEL_122;
    }
    v17 = v175;
    if ((uint64_t)v175 > v13)
    {
      v18 = (UniChar *)theString[1];
      if (theString[1])
      {
        v19 = *((_QWORD *)&v174 + 1) + v13;
        goto LABEL_10;
      }
      if (!(_QWORD)v174)
      {
        if (v176 <= v13 || (v38 = *((_QWORD *)&v175 + 1), *((uint64_t *)&v175 + 1) > v13))
        {
          v39 = v13 - 4;
          if ((unint64_t)v13 < 4)
            v39 = 0;
          if (v39 + 64 < (uint64_t)v175)
            v17 = v39 + 64;
          *((_QWORD *)&v175 + 1) = v39;
          v176 = v17;
          v177.location = *((_QWORD *)&v174 + 1) + v39;
          v177.length = v17 - v39;
          CFStringGetCharacters(theString[0], v177, buffer);
          v15 = MEMORY[0x24BDAC740];
          v38 = *((_QWORD *)&v175 + 1);
        }
        v19 = v13 - v38;
        v18 = buffer;
LABEL_10:
        v20 = v18[v19];
        if (v10)
          goto LABEL_24;
        goto LABEL_11;
      }
      v20 = *(char *)(v174 + *((_QWORD *)&v174 + 1) + v13);
      if (!v10)
        goto LABEL_11;
LABEL_24:
      *(_OWORD *)theString1 = *(_OWORD *)theString;
      v162 = v174;
      v163 = v175;
      v164 = v176;
      v157 = v169;
      v158 = v170;
      v159 = v171;
      v160 = v172;
      *(_OWORD *)v153 = *(_OWORD *)buffer;
      v154 = v166;
      v155 = v167;
      v156 = v168;
      v26 = v175;
      if ((uint64_t)v175 <= v13)
        goto LABEL_121;
      v27 = (UniChar *)theString1[1];
      if (theString1[1])
      {
        v28 = *((_QWORD *)&v162 + 1) + v13;
      }
      else
      {
        if ((_QWORD)v162)
        {
          v29 = *(char *)(v162 + *((_QWORD *)&v162 + 1) + v13);
          goto LABEL_52;
        }
        if (v164 <= v13 || (v50 = *((_QWORD *)&v163 + 1), *((uint64_t *)&v163 + 1) > v13))
        {
          v51 = v13 - 4;
          if ((unint64_t)v13 < 4)
            v51 = 0;
          if (v51 + 64 < (uint64_t)v175)
            v26 = v51 + 64;
          *((_QWORD *)&v163 + 1) = v51;
          v164 = v26;
          v178.location = *((_QWORD *)&v162 + 1) + v51;
          v178.length = v26 - v51;
          CFStringGetCharacters(theString1[0], v178, v153);
          v15 = MEMORY[0x24BDAC740];
          v50 = *((_QWORD *)&v163 + 1);
        }
        v28 = v13 - v50;
        v27 = v153;
      }
      v29 = v27[v28];
LABEL_52:
      if (v29 != 45)
        goto LABEL_121;
      v33 = v13 + 1;
      v34 = v163;
      if ((uint64_t)v163 <= v13 + 1)
        goto LABEL_121;
      v35 = (UniChar *)theString1[1];
      if (theString1[1])
      {
        v36 = *((_QWORD *)&v162 + 1) + v33;
      }
      else
      {
        if ((_QWORD)v162)
        {
          v37 = *(char *)(v162 + *((_QWORD *)&v162 + 1) + v33);
LABEL_116:
          if (v37 == 45)
          {
            v137 = v16;
            v57 = v4;
            v58 = v12;
            v59 = v8;
            v60 = v13 + 2;
            v61 = v163;
            if ((uint64_t)v163 <= v13 + 2)
            {
              v10 = 1;
LABEL_183:
              v8 = v59;
              v12 = v58;
              v4 = v57;
              v16 = v137;
              goto LABEL_122;
            }
            v62 = (UniChar *)theString1[1];
            if (theString1[1])
            {
              v63 = *((_QWORD *)&v162 + 1) + v60;
            }
            else
            {
              if ((_QWORD)v162)
              {
                v64 = *(char *)(v162 + *((_QWORD *)&v162 + 1) + v60);
LABEL_181:
                v10 = v64 != 62;
                if (v64 == 62)
                  v13 += 2;
                goto LABEL_183;
              }
              if (v164 <= v60 || (v97 = *((_QWORD *)&v163 + 1), *((uint64_t *)&v163 + 1) > v60))
              {
                v98 = v13 - 2;
                if ((unint64_t)v13 < 2)
                  v98 = 0;
                if (v98 + 64 < (uint64_t)v163)
                  v61 = v98 + 64;
                *((_QWORD *)&v163 + 1) = v98;
                v164 = v61;
                v182.location = *((_QWORD *)&v162 + 1) + v98;
                v182.length = v61 - v98;
                CFStringGetCharacters(theString1[0], v182, v153);
                v15 = MEMORY[0x24BDAC740];
                v97 = *((_QWORD *)&v163 + 1);
              }
              v63 = v60 - v97;
              v62 = v153;
            }
            v64 = v62[v63];
            goto LABEL_181;
          }
LABEL_121:
          v10 = 1;
          goto LABEL_122;
        }
        if (v164 <= v33 || (v83 = *((_QWORD *)&v163 + 1), *((uint64_t *)&v163 + 1) > v33))
        {
          v84 = v13 - 3;
          if ((unint64_t)v13 < 3)
            v84 = 0;
          if (v84 + 64 < (uint64_t)v163)
            v34 = v84 + 64;
          *((_QWORD *)&v163 + 1) = v84;
          v164 = v34;
          v180.location = *((_QWORD *)&v162 + 1) + v84;
          v180.length = v34 - v84;
          CFStringGetCharacters(theString1[0], v180, v153);
          v15 = MEMORY[0x24BDAC740];
          v83 = *((_QWORD *)&v163 + 1);
        }
        v36 = v33 - v83;
        v35 = v153;
      }
      v37 = v35[v36];
      goto LABEL_116;
    }
    v20 = 0;
    if (v10)
      goto LABEL_24;
LABEL_11:
    if (v20 == 62)
    {
      v14 = 0;
      if (!v8 || v9)
      {
        v10 = 0;
        goto LABEL_122;
      }
      v32 = Length - v16;
      if (Length < v16)
      {
        v14 = 0;
        v10 = 0;
        v9 = 0;
        goto LABEL_122;
      }
      if (v32 < 0xA)
      {
        if (v151)
          v65 = 1;
        else
          v65 = v12 <= 0;
        v66 = !v65;
        v143 |= v66;
        if (v32 < 4)
        {
          v144 = v11;
          if (v32 == 3)
          {
            v138 = v12;
            v76 = 0;
            v68 = 0;
            v67 = 0;
            v75 = -[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("div"), 1, v16, 3) == 0;
          }
          else
          {
            v77 = v16;
            if (v32 < 2)
            {
              v76 = 0;
              v79 = 0;
              v67 = 0;
              v75 = 0;
              v78 = 0;
              goto LABEL_153;
            }
            v138 = v12;
            v76 = 0;
            v68 = 0;
            v67 = 0;
            v75 = 0;
          }
LABEL_152:
          v77 = v16;
          v78 = -[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("br"), 1, v16, 2) == 0;
          v15 = MEMORY[0x24BDAC740];
          v79 = v68;
          v12 = v138;
LABEL_153:
          v80 = 0;
          if (!v78 && !v75 && !v76 || v12 | v151)
          {
            v81 = 0;
          }
          else
          {
            v81 = v149 == 0;
            v82 = v150;
            if (!v149)
              v82 = v152 + ~v142;
            v150 = v82;
            if (v149 >= 4)
            {
              v146 = 0;
              v147 = 0;
              v81 = 0;
              v149 = -1;
            }
            else
            {
              ++v149;
            }
            v80 = 1;
          }
          if (v76 || v79)
          {
            v90 = v140;
            v16 = v77;
            if (v150 >= 1)
            {
LABEL_188:
              v91 = !v81;
              v92 = v146;
              if (!v91)
                v92 = v13 - v90;
              v146 = v92;
              v93 = v147;
              if (!v91)
                v93 = v90;
              v147 = v93;
            }
          }
          else
          {
            v94 = v150 > 0 && v78;
            v90 = v140;
            v16 = v77;
            if (v94)
              goto LABEL_188;
          }
          v11 = v144;
          if (v75 || v67)
          {
            v140 = v152;
          }
          else
          {
            if (v78)
              v90 = v16 + 3;
            v140 = v90;
          }
          goto LABEL_203;
        }
LABEL_131:
        v138 = v12;
        v67 = -[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("span"), 1, v16, 4) == 0;
        v144 = v11;
        v68 = v32 >= 5
           && -[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("/span"), 1, v16, 5) == 0;
        v75 = -[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("div"), 1, v16, 3) == 0;
        v76 = -[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("/div"), 1, v16, 4) == 0;
        goto LABEL_152;
      }
      if (-[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("blockquote"), 1, v16, 10))
      {
        if (!v151
          || v32 < 0xB
          || -[__CFString compare:options:range:](v4, "compare:options:range:", CFSTR("/blockquote"), 1, v16, 11))
        {
          if (v151)
            v48 = 1;
          else
            v48 = v12 <= 0;
          v49 = !v48;
          v143 |= v49;
          goto LABEL_131;
        }
        if (v151 == 1)
        {
          v80 = 0;
          v151 = 0;
          v12 = v13 - v139 + 1;
        }
        else
        {
          --v151;
          v80 = 0;
        }
        v15 = MEMORY[0x24BDAC740];
LABEL_203:
        v10 = 0;
        v9 = 0;
        --v8;
        v14 = v80 != 0;
        goto LABEL_122;
      }
      v15 = MEMORY[0x24BDAC740];
      if (v151)
      {
        v80 = 0;
        ++v151;
        goto LABEL_203;
      }
      if (v12 >= 1)
      {
        if ((v143 & 1) != 0)
          goto LABEL_325;
        v143 = 0;
        v80 = 0;
        goto LABEL_209;
      }
      if (v149 < 0 || (v122 = v142 + v150, v142 + v150 < 0) || (v123 = v175, (uint64_t)v175 <= v122))
      {
        v80 = 0;
        v151 = 1;
        v139 = v152;
        goto LABEL_203;
      }
      v124 = (UniChar *)theString[1];
      if (theString[1])
      {
        v125 = *((_QWORD *)&v174 + 1) + v122;
      }
      else
      {
        if ((_QWORD)v174)
        {
          v126 = *(char *)(v174 + *((_QWORD *)&v174 + 1) + v122);
          goto LABEL_311;
        }
        if (v176 <= v122 || (v131 = *((_QWORD *)&v175 + 1), *((uint64_t *)&v175 + 1) > v122))
        {
          v132 = v122 - 4;
          if ((unint64_t)v122 < 4)
            v132 = 0;
          if (v132 + 64 < (uint64_t)v175)
            v123 = v132 + 64;
          *((_QWORD *)&v175 + 1) = v132;
          v176 = v123;
          v186.location = *((_QWORD *)&v174 + 1) + v132;
          v186.length = v123 - v132;
          CFStringGetCharacters(theString[0], v186, buffer);
          v15 = MEMORY[0x24BDAC740];
          v131 = *((_QWORD *)&v175 + 1);
        }
        v125 = v122 - v131;
        v124 = buffer;
      }
      v126 = v124[v125];
LABEL_311:
      v80 = 0;
      v129 = v142;
      if (v146 > 0)
        v129 = v147;
      v30 = v126 == 58;
      v130 = v152;
      if (v30)
        v130 = v129;
      v139 = v130;
LABEL_209:
      v151 = 1;
      goto LABEL_203;
    }
    if (v20 != 60)
      goto LABEL_19;
    v21 = v13 + 1;
    *(_OWORD *)theString1 = *(_OWORD *)theString;
    v162 = v174;
    v163 = v175;
    v164 = v176;
    v157 = v169;
    v158 = v170;
    v159 = v171;
    v160 = v172;
    *(_OWORD *)v153 = *(_OWORD *)buffer;
    v154 = v166;
    v155 = v167;
    v156 = v168;
    v22 = v175;
    if ((uint64_t)v175 <= v13 + 1)
      goto LABEL_233;
    v23 = (UniChar *)theString1[1];
    if (theString1[1])
    {
      v24 = *((_QWORD *)&v162 + 1) + v21;
    }
    else
    {
      if ((_QWORD)v162)
      {
        v25 = *(char *)(v162 + *((_QWORD *)&v162 + 1) + v21);
        goto LABEL_109;
      }
      if (v164 <= (uint64_t)v21 || (v69 = *((_QWORD *)&v163 + 1), *((uint64_t *)&v163 + 1) > (uint64_t)v21))
      {
        v70 = v13 - 3;
        if (v21 < 4)
          v70 = 0;
        if (v70 + 64 < (uint64_t)v175)
          v22 = v70 + 64;
        *((_QWORD *)&v163 + 1) = v70;
        v164 = v22;
        v179.location = *((_QWORD *)&v162 + 1) + v70;
        v179.length = v22 - v70;
        CFStringGetCharacters(theString1[0], v179, v153);
        v15 = MEMORY[0x24BDAC740];
        v69 = *((_QWORD *)&v163 + 1);
      }
      v24 = v21 - v69;
      v23 = v153;
    }
    v25 = v23[v24];
LABEL_109:
    if (v25 != 33)
      goto LABEL_233;
    v52 = v13 + 2;
    v53 = v163;
    if ((uint64_t)v163 <= v13 + 2)
      goto LABEL_233;
    v54 = (UniChar *)theString1[1];
    if (theString1[1])
    {
      v55 = *((_QWORD *)&v162 + 1) + v52;
    }
    else
    {
      if ((_QWORD)v162)
      {
        v56 = *(char *)(v162 + *((_QWORD *)&v162 + 1) + v52);
        goto LABEL_174;
      }
      if (v164 <= v52 || (v95 = *((_QWORD *)&v163 + 1), *((uint64_t *)&v163 + 1) > v52))
      {
        v96 = v13 - 2;
        if (v21 < 3)
          v96 = 0;
        if (v96 + 64 < (uint64_t)v163)
          v53 = v96 + 64;
        *((_QWORD *)&v163 + 1) = v96;
        v164 = v53;
        v181.location = *((_QWORD *)&v162 + 1) + v96;
        v181.length = v53 - v96;
        CFStringGetCharacters(theString1[0], v181, v153);
        v15 = MEMORY[0x24BDAC740];
        v95 = *((_QWORD *)&v163 + 1);
      }
      v55 = v52 - v95;
      v54 = v153;
    }
    v56 = v54[v55];
LABEL_174:
    if (v56 == 45)
    {
      v85 = v13 + 3;
      v86 = v163;
      if ((uint64_t)v163 > v13 + 3)
      {
        v87 = (UniChar *)theString1[1];
        if (theString1[1])
        {
          v88 = *((_QWORD *)&v162 + 1) + v85;
        }
        else
        {
          if ((_QWORD)v162)
          {
            v89 = *(char *)(v162 + *((_QWORD *)&v162 + 1) + v85);
LABEL_231:
            if (v89 == 45)
            {
              v14 = 0;
              v10 = 1;
              v13 = v85;
              goto LABEL_122;
            }
            goto LABEL_233;
          }
          if (v164 <= v85 || (v127 = *((_QWORD *)&v163 + 1), *((uint64_t *)&v163 + 1) > v85))
          {
            v128 = v13 - 1;
            if (v21 < 2)
              v128 = 0;
            if (v128 + 64 < (uint64_t)v163)
              v86 = v128 + 64;
            *((_QWORD *)&v163 + 1) = v128;
            v164 = v86;
            v185.location = *((_QWORD *)&v162 + 1) + v128;
            v185.length = v86 - v128;
            CFStringGetCharacters(theString1[0], v185, v153);
            v85 = v13 + 3;
            v15 = MEMORY[0x24BDAC740];
            v127 = *((_QWORD *)&v163 + 1);
          }
          v88 = v85 - v127;
          v87 = v153;
        }
        v89 = v87[v88];
        goto LABEL_231;
      }
    }
LABEL_233:
    v99 = v4;
    v100 = v13 + 64;
    v101 = v13;
    do
    {
      v102 = v101++;
      if (v102 < -1 || (v103 = v175, (uint64_t)v175 <= v101))
      {
        v105 = 0;
LABEL_239:
        v106 = *(_DWORD *)(v15 + 4 * v105 + 60) & 0x4000;
        goto LABEL_240;
      }
      if (theString[1])
      {
        v104 = *((_WORD *)&theString[1]->isa + v102 + *((_QWORD *)&v174 + 1) + 1);
      }
      else if ((_QWORD)v174)
      {
        v104 = *(char *)(v174 + *((_QWORD *)&v174 + 1) + v102 + 1);
      }
      else
      {
        if (v176 <= v101 || (v107 = *((_QWORD *)&v175 + 1), *((uint64_t *)&v175 + 1) > v101))
        {
          v108 = v102 - 3;
          if ((unint64_t)v101 < 4)
            v108 = 0;
          if (v108 + 64 < (uint64_t)v175)
            v103 = v108 + 64;
          *((_QWORD *)&v175 + 1) = v108;
          v176 = v103;
          v183.location = *((_QWORD *)&v174 + 1) + v108;
          v183.length = v103 - v108;
          CFStringGetCharacters(theString[0], v183, buffer);
          v15 = MEMORY[0x24BDAC740];
          v107 = *((_QWORD *)&v175 + 1);
        }
        v104 = buffer[v102 + 1 - v107];
      }
      v105 = v104;
      if (v104 <= 0x7Fu)
        goto LABEL_239;
      v106 = __maskrune(v104, 0x4000uLL);
      v15 = MEMORY[0x24BDAC740];
LABEL_240:
      ++v100;
    }
    while (v106);
    v109 = v152;
    if (!v9)
      v109 = v13;
    v152 = v109;
    v8 += v9 == 0;
    if (v101 >= v148)
    {
      v14 = 0;
      v11 = 0;
      v10 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      *(_OWORD *)theString1 = *(_OWORD *)theString;
      v162 = v174;
      v163 = v175;
      v164 = v176;
      v157 = v169;
      v158 = v170;
      v159 = v171;
      v160 = v172;
      *(_OWORD *)v153 = *(_OWORD *)buffer;
      v154 = v166;
      v155 = v167;
      v156 = v168;
      v145 = v8;
      if (v102 < -1 || (v110 = v163, (uint64_t)v163 <= v101))
      {
        v111 = 0;
      }
      else if (theString1[1])
      {
        v111 = *((_WORD *)&theString1[1]->isa + *((_QWORD *)&v162 + 1) + v101);
      }
      else if ((_QWORD)v162)
      {
        v111 = *(char *)(v162 + *((_QWORD *)&v162 + 1) + v101);
      }
      else
      {
        if (v164 <= v101 || (v119 = *((_QWORD *)&v163 + 1), *((uint64_t *)&v163 + 1) > v101))
        {
          v120 = 4;
          if ((unint64_t)v101 < 4)
            v120 = v101;
          v121 = v101 - v120 + 64;
          if (v121 >= (uint64_t)v163)
            v121 = v163;
          *((_QWORD *)&v163 + 1) = v101 - v120;
          v164 = v121;
          if ((uint64_t)v163 >= v100 - v120)
            v110 = v100 - v120;
          v184.length = v110 + v120 - v101;
          v184.location = v101 - v120 + *((_QWORD *)&v162 + 1);
          CFStringGetCharacters(theString1[0], v184, v153);
          v119 = *((_QWORD *)&v163 + 1);
        }
        v111 = v153[v101 - v119];
      }
      v112 = v111 == 47;
      if (v111 == 47)
        v113 = -1;
      else
        v113 = 1;
      v114 = *((_QWORD *)&v162 + 1);
      if (v111 == 47)
        v115 = *((_QWORD *)&v162 + 1) + 1;
      else
        v115 = *((_QWORD *)&v162 + 1);
      v116 = v115 + v101;
      v117 = CFStringGetLength(theString1[0]) - v114 - v112;
      v118 = v117 - v101;
      if (v117 - v101 >= 5)
      {
        v187.location = v116;
        v187.length = 5;
        v4 = v99;
        if (CFStringCompareWithOptions(theString1[0], CFSTR("style"), v187, 1uLL) == kCFCompareEqualTo)
        {
          Length = v141;
          goto LABEL_279;
        }
        if (v118 >= 6)
        {
          v188.location = v116;
          v188.length = 6;
          Length = v141;
          if (CFStringCompareWithOptions(theString1[0], CFSTR("script"), v188, 1uLL) == kCFCompareEqualTo)
            goto LABEL_279;
        }
        else
        {
          Length = v141;
        }
      }
      else
      {
        v4 = v99;
        Length = v141;
        if (v117 - 4 != v101)
        {
LABEL_278:
          v113 = 0;
          goto LABEL_279;
        }
      }
      v189.location = v116;
      v189.length = 4;
      if (CFStringCompareWithOptions(theString1[0], CFSTR("head"), v189, 1uLL))
        goto LABEL_278;
LABEL_279:
      v14 = 0;
      v11 = 0;
      v10 = 0;
      v9 += v113;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      v8 = v145;
      v15 = MEMORY[0x24BDAC740];
    }
LABEL_122:
    ++v13;
  }
  while (v13 < Length);
  if (v12 >= 1)
  {
LABEL_325:
    -[__CFString stringByReplacingCharactersInRange:withString:](v4, "stringByReplacingCharactersInRange:withString:", v139, v12, &stru_24DAA6418);
    v133 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_327;
  }
LABEL_326:
  v133 = 0;
LABEL_327:
  if (v133)
    v134 = v133;
  else
    v134 = v4;
  v135 = v134;

LABEL_332:
  return v135;
}

@end
