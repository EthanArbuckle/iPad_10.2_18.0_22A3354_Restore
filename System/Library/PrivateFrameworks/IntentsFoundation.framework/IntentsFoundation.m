uint64_t __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1D8259490](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_1D4181A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4181D2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void IFCombinePropertyListObject(SipHasher *a1, const __CFString *a2)
{
  CFTypeID v4;
  unint64_t value;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int c;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  const UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v67;
  unint64_t v68;
  unint64_t v69;
  int v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  char v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  int v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  CFIndex v103;
  CFIndex v104;
  CFIndex i;
  CFIndex Bytes;
  UInt8 *v107;
  unint64_t v108;
  unint64_t v109;
  int v110;
  unint64_t v111;
  unint64_t v112;
  UInt8 *v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  char v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  int v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  int v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  unint64_t v143;
  int v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  char v148;
  int v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  char v165;
  uint64_t v166;
  unint64_t v167;
  unint64_t v168;
  int v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  CFNumberType v178;
  unint64_t v179;
  unint64_t v180;
  int v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  BOOL v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t v188;
  uint64_t v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  unint64_t v194;
  uint64_t v195;
  unint64_t v196;
  unint64_t v197;
  uint64_t v198;
  char v199;
  uint64_t v200;
  unint64_t v201;
  unint64_t v202;
  int v203;
  unint64_t v204;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v208;
  unint64_t v209;
  uint64_t v210;
  unint64_t v211;
  double v212;
  unint64_t v213;
  unint64_t v214;
  int v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  unint64_t v220;
  unint64_t v221;
  unint64_t v222;
  uint64_t v223;
  unint64_t v224;
  CFIndex Count;
  CFIndex v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  unint64_t v234;
  int v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  unint64_t v241;
  uint64_t v242;
  unint64_t v243;
  CFIndex v244;
  const void *ValueAtIndex;
  unint64_t v246;
  CFIndex v247;
  unint64_t v248;
  unint64_t v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  int v256;
  unint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  uint64_t v263;
  unint64_t v264;
  const void **v265;
  const __CFArray *v266;
  __CFArray *MutableCopy;
  CFIndex j;
  const void *v269;
  const void *v270;
  CFIndex usedBufLen;
  UInt8 buffer[1024];
  uint64_t v273;
  CFRange v274;
  CFRange v275;

  v273 = *MEMORY[0x1E0C80C00];
  v4 = CFGetTypeID(a2);
  if (v4 == CFDataGetTypeID())
  {
    value = a1->_buffer.value;
    v6 = HIBYTE(value) & 7;
    v7 = 8 * v6;
    if (v6 == 7)
    {
      v8 = (171 << v7) | value & 0xFFFFFFFFFFFFFFLL;
      v9 = (value & 0xFF00000000000000) + 0x100000000000000;
      v10 = a1->_v3 ^ v8;
      a1->_v3 = v10;
      a1->_buffer.value = v9;
      c = a1->_c;
      if (a1->_c <= 0)
      {
        v12 = a1->_v0;
      }
      else
      {
        v12 = a1->_v0;
        v13 = a1->_v1;
        v14 = a1->_v2;
        do
        {
          v15 = v12 + v13;
          v16 = v15 ^ __ROR8__(v13, 51);
          v17 = v14 + v10;
          v18 = __ROR8__(v10, 48);
          v12 = (v17 ^ v18) + __ROR8__(v15, 32);
          v10 = v12 ^ __ROR8__(v17 ^ v18, 43);
          v19 = v17 + v16;
          v13 = v19 ^ __ROR8__(v16, 47);
          v14 = __ROR8__(v19, 32);
          --c;
        }
        while (c);
        a1->_v1 = v13;
        a1->_v2 = v14;
        a1->_v3 = v10;
      }
      a1->_v0 = v12 ^ v8;
    }
    else
    {
      a1->_buffer.value = ((171 << v7) | value) + 0x100000000000000;
    }
    BytePtr = CFDataGetBytePtr((CFDataRef)a2);
    Length = CFDataGetLength((CFDataRef)a2);
    if (Length >= 1)
    {
      v67 = &BytePtr[Length];
      v69 = a1->_v3;
      v68 = a1->_buffer.value;
      v70 = a1->_c;
      v71 = a1->_v0;
      v72 = a1->_v1;
      v73 = a1->_v2;
      do
      {
        v74 = v67 - BytePtr;
        if (v67 - BytePtr >= 8)
          v74 = 8;
        if (v74 > 7)
        {
          v75 = *(_QWORD *)BytePtr;
        }
        else
        {
          v75 = 0;
          switch(v74)
          {
            case 1uLL:
              goto LABEL_41;
            case 2uLL:
              goto LABEL_40;
            case 3uLL:
              goto LABEL_39;
            case 4uLL:
              goto LABEL_38;
            case 5uLL:
              goto LABEL_37;
            case 6uLL:
              goto LABEL_36;
            case 7uLL:
              v75 = (unint64_t)BytePtr[6] << 48;
LABEL_36:
              v75 |= (unint64_t)BytePtr[5] << 40;
LABEL_37:
              v75 |= (unint64_t)BytePtr[4] << 32;
LABEL_38:
              v75 |= (unint64_t)BytePtr[3] << 24;
LABEL_39:
              v75 |= (unint64_t)BytePtr[2] << 16;
LABEL_40:
              v75 |= (unint64_t)BytePtr[1] << 8;
LABEL_41:
              v75 |= *BytePtr;
              break;
            default:
              break;
          }
        }
        v76 = HIBYTE(v68) & 7;
        v77 = 8 * v76;
        v78 = v76 + v74;
        if (v76 + v74 <= 7)
        {
          v68 = ((v75 << v77) | v68) + (v74 << 56);
          a1->_buffer.value = v68;
        }
        else
        {
          v79 = (v75 << v77) | v68 & 0xFFFFFFFFFFFFFFLL;
          v80 = HIBYTE(v68) + v74;
          v81 = v75 >> -v77;
          if (v78 == 8)
            v81 = 0;
          v68 = v81 | (v80 << 56);
          v69 ^= v79;
          a1->_v3 = v69;
          a1->_buffer.value = v68;
          if (v70 >= 1)
          {
            v82 = v70;
            do
            {
              v83 = v71 + v72;
              v84 = v83 ^ __ROR8__(v72, 51);
              v85 = v73 + v69;
              v86 = __ROR8__(v69, 48);
              v71 = (v85 ^ v86) + __ROR8__(v83, 32);
              v69 = v71 ^ __ROR8__(v85 ^ v86, 43);
              v87 = v85 + v84;
              v72 = v87 ^ __ROR8__(v84, 47);
              v73 = __ROR8__(v87, 32);
              --v82;
            }
            while (v82);
            a1->_v1 = v72;
            a1->_v2 = v73;
            a1->_v3 = v69;
          }
          v71 ^= v79;
          a1->_v0 = v71;
        }
        BytePtr += 8;
      }
      while (BytePtr < v67);
    }
    return;
  }
  if (v4 == CFStringGetTypeID())
  {
    v20 = a1->_buffer.value;
    v21 = HIBYTE(v20) & 7;
    v22 = 8 * v21;
    if (v21 == 7)
    {
      v23 = (188 << v22) | v20 & 0xFFFFFFFFFFFFFFLL;
      v24 = (v20 & 0xFF00000000000000) + 0x100000000000000;
      v25 = a1->_v3 ^ v23;
      a1->_v3 = v25;
      a1->_buffer.value = v24;
      v26 = a1->_c;
      if (a1->_c <= 0)
      {
        v27 = a1->_v0;
      }
      else
      {
        v27 = a1->_v0;
        v28 = a1->_v1;
        v29 = a1->_v2;
        do
        {
          v30 = v27 + v28;
          v31 = v30 ^ __ROR8__(v28, 51);
          v32 = v29 + v25;
          v33 = __ROR8__(v25, 48);
          v27 = (v32 ^ v33) + __ROR8__(v30, 32);
          v25 = v27 ^ __ROR8__(v32 ^ v33, 43);
          v34 = v32 + v31;
          v28 = v34 ^ __ROR8__(v31, 47);
          v29 = __ROR8__(v34, 32);
          --v26;
        }
        while (v26);
        a1->_v1 = v28;
        a1->_v2 = v29;
        a1->_v3 = v25;
      }
      a1->_v0 = v27 ^ v23;
    }
    else
    {
      a1->_buffer.value = ((188 << v22) | v20) + 0x100000000000000;
    }
    v103 = CFStringGetLength(a2);
    if (v103 >= 1)
    {
      v104 = v103;
      for (i = 0; i < v104; i += Bytes)
      {
        usedBufLen = 0;
        v274.length = v104 - i;
        v274.location = i;
        Bytes = CFStringGetBytes(a2, v274, 0x100u, 0x3Fu, 0, buffer, 1024, &usedBufLen);
        if (usedBufLen >= 1)
        {
          v107 = &buffer[usedBufLen];
          v109 = a1->_v3;
          v108 = a1->_buffer.value;
          v110 = a1->_c;
          v111 = a1->_v0;
          v112 = a1->_v1;
          v113 = buffer;
          v114 = a1->_v2;
          do
          {
            v115 = v107 - v113;
            if (v107 - v113 >= 8)
              v115 = 8;
            if (v115 > 7)
            {
              v116 = *(_QWORD *)v113;
            }
            else
            {
              v116 = 0;
              switch(v115)
              {
                case 1uLL:
                  goto LABEL_77;
                case 2uLL:
                  goto LABEL_76;
                case 3uLL:
                  goto LABEL_75;
                case 4uLL:
                  goto LABEL_74;
                case 5uLL:
                  goto LABEL_73;
                case 6uLL:
                  goto LABEL_72;
                case 7uLL:
                  v116 = (unint64_t)v113[6] << 48;
LABEL_72:
                  v116 |= (unint64_t)v113[5] << 40;
LABEL_73:
                  v116 |= (unint64_t)v113[4] << 32;
LABEL_74:
                  v116 |= (unint64_t)v113[3] << 24;
LABEL_75:
                  v116 |= (unint64_t)v113[2] << 16;
LABEL_76:
                  v116 |= (unint64_t)v113[1] << 8;
LABEL_77:
                  v116 |= *v113;
                  break;
                default:
                  break;
              }
            }
            v117 = HIBYTE(v108) & 7;
            v118 = 8 * v117;
            v119 = v117 + v115;
            if (v117 + v115 <= 7)
            {
              v108 = ((v116 << v118) | v108) + (v115 << 56);
              a1->_buffer.value = v108;
            }
            else
            {
              v120 = (v116 << v118) | v108 & 0xFFFFFFFFFFFFFFLL;
              v121 = HIBYTE(v108) + v115;
              v122 = v116 >> -v118;
              if (v119 == 8)
                v122 = 0;
              v108 = v122 | (v121 << 56);
              v109 ^= v120;
              a1->_v3 = v109;
              a1->_buffer.value = v108;
              if (v110 >= 1)
              {
                v123 = v110;
                do
                {
                  v124 = v111 + v112;
                  v125 = v124 ^ __ROR8__(v112, 51);
                  v126 = v114 + v109;
                  v127 = __ROR8__(v109, 48);
                  v111 = (v126 ^ v127) + __ROR8__(v124, 32);
                  v109 = v111 ^ __ROR8__(v126 ^ v127, 43);
                  v128 = v126 + v125;
                  v112 = v128 ^ __ROR8__(v125, 47);
                  v114 = __ROR8__(v128, 32);
                  --v123;
                }
                while (v123);
                a1->_v1 = v112;
                a1->_v2 = v114;
                a1->_v3 = v109;
              }
              v111 ^= v120;
              a1->_v0 = v111;
            }
            v113 += 8;
          }
          while (v113 < v107);
        }
      }
    }
    return;
  }
  if (v4 == CFBooleanGetTypeID())
  {
    v35 = a1->_buffer.value;
    v36 = HIBYTE(v35) & 7;
    v37 = 8 * v36;
    if (v36 == 7)
    {
      v38 = (205 << v37) | v35 & 0xFFFFFFFFFFFFFFLL;
      v39 = (v35 & 0xFF00000000000000) + 0x100000000000000;
      v40 = a1->_v3 ^ v38;
      a1->_v3 = v40;
      a1->_buffer.value = v39;
      v41 = a1->_c;
      if (a1->_c <= 0)
      {
        v42 = a1->_v0;
      }
      else
      {
        v42 = a1->_v0;
        v43 = a1->_v1;
        v44 = a1->_v2;
        do
        {
          v45 = v42 + v43;
          v46 = v45 ^ __ROR8__(v43, 51);
          v47 = v44 + v40;
          v48 = __ROR8__(v40, 48);
          v42 = (v47 ^ v48) + __ROR8__(v45, 32);
          v40 = v42 ^ __ROR8__(v47 ^ v48, 43);
          v49 = v47 + v46;
          v43 = v49 ^ __ROR8__(v46, 47);
          v44 = __ROR8__(v49, 32);
          --v41;
        }
        while (v41);
        a1->_v1 = v43;
        a1->_v2 = v44;
        a1->_v3 = v40;
      }
      a1->_v0 = v42 ^ v38;
    }
    else
    {
      a1->_buffer.value = ((205 << v37) | v35) + 0x100000000000000;
    }
    v144 = CFBooleanGetValue((CFBooleanRef)a2);
    v145 = 171;
    if (!v144)
      v145 = 205;
    v146 = a1->_buffer.value;
    v147 = HIBYTE(v146) & 7;
    v148 = 8 * v147;
    if (v147 == 7)
    {
      v149 = a1->_c;
      v150 = a1->_v0;
      v151 = a1->_v1;
      v152 = a1->_v2;
      v153 = (v145 << v148) | v146 & 0xFFFFFFFFFFFFFFLL;
      v154 = (v146 & 0xFF00000000000000) + 0x100000000000000;
      v155 = a1->_v3 ^ v153;
      a1->_v3 = v155;
      a1->_buffer.value = v154;
      if (v149 >= 1)
      {
        do
        {
          v156 = v150 + v151;
          v157 = v156 ^ __ROR8__(v151, 51);
          v158 = v152 + v155;
          v159 = __ROR8__(v155, 48);
          v150 = (v158 ^ v159) + __ROR8__(v156, 32);
          v155 = v150 ^ __ROR8__(v158 ^ v159, 43);
          v160 = v158 + v157;
          v151 = v160 ^ __ROR8__(v157, 47);
          v152 = __ROR8__(v160, 32);
          --v149;
        }
        while (v149);
        a1->_v1 = v151;
        a1->_v2 = v152;
        a1->_v3 = v155;
      }
      v161 = v150 ^ v153;
      goto LABEL_141;
    }
    v162 = (v145 << v148) | v146;
LABEL_108:
    a1->_buffer.value = v162 + 0x100000000000000;
    return;
  }
  if (v4 == CFNumberGetTypeID())
  {
    v50 = a1->_buffer.value;
    v51 = HIBYTE(v50) & 7;
    v52 = 8 * v51;
    if (v51 == 7)
    {
      v53 = (222 << v52) | v50 & 0xFFFFFFFFFFFFFFLL;
      v54 = (v50 & 0xFF00000000000000) + 0x100000000000000;
      v55 = a1->_v3 ^ v53;
      a1->_v3 = v55;
      a1->_buffer.value = v54;
      v56 = a1->_c;
      if (a1->_c <= 0)
      {
        v57 = a1->_v0;
      }
      else
      {
        v57 = a1->_v0;
        v58 = a1->_v1;
        v59 = a1->_v2;
        do
        {
          v60 = v57 + v58;
          v61 = v60 ^ __ROR8__(v58, 51);
          v62 = v59 + v55;
          v63 = __ROR8__(v55, 48);
          v57 = (v62 ^ v63) + __ROR8__(v60, 32);
          v55 = v57 ^ __ROR8__(v62 ^ v63, 43);
          v64 = v62 + v61;
          v58 = v64 ^ __ROR8__(v61, 47);
          v59 = __ROR8__(v64, 32);
          --v56;
        }
        while (v56);
        a1->_v1 = v58;
        a1->_v2 = v59;
        a1->_v3 = v55;
      }
      a1->_v0 = v57 ^ v53;
    }
    else
    {
      a1->_buffer.value = ((222 << v52) | v50) + 0x100000000000000;
    }
    if (CFNumberIsFloatType((CFNumberRef)a2))
      v178 = kCFNumberDoubleType;
    else
      v178 = kCFNumberSInt64Type;
    CFNumberGetValue((CFNumberRef)a2, v178, buffer);
    v180 = a1->_v3;
    v179 = a1->_buffer.value;
    v181 = a1->_c;
    v182 = a1->_v0;
    v183 = a1->_v1;
    v184 = a1->_v2;
    v185 = (v179 & 0x700000000000000) == 0;
    v186 = 8 * (HIBYTE(v179) & 7);
    v187 = (*(_QWORD *)buffer << v186) | v179 & 0xFFFFFFFFFFFFFFLL;
    v188 = (v179 & 0xFF00000000000000) + 0x800000000000000;
    v189 = *(_QWORD *)buffer >> -(char)v186;
    if (v185)
      v189 = 0;
    v190 = v189 | v188;
    v191 = v180 ^ v187;
    a1->_v3 = v180 ^ v187;
    a1->_buffer.value = v190;
    if (v181 < 1)
      goto LABEL_140;
    do
    {
      v192 = v182 + v183;
      v193 = v192 ^ __ROR8__(v183, 51);
      v194 = v184 + v191;
      v195 = __ROR8__(v191, 48);
      v182 = (v194 ^ v195) + __ROR8__(v192, 32);
      v191 = v182 ^ __ROR8__(v194 ^ v195, 43);
      v196 = v194 + v193;
      v183 = v196 ^ __ROR8__(v193, 47);
      v184 = __ROR8__(v196, 32);
      --v181;
    }
    while (v181);
LABEL_139:
    a1->_v1 = v183;
    a1->_v2 = v184;
    a1->_v3 = v191;
LABEL_140:
    v161 = v182 ^ v187;
    goto LABEL_141;
  }
  if (v4 == CFDateGetTypeID())
  {
    v88 = a1->_buffer.value;
    v89 = HIBYTE(v88) & 7;
    v90 = 8 * v89;
    if (v89 == 7)
    {
      v91 = (241 << v90) | v88 & 0xFFFFFFFFFFFFFFLL;
      v92 = (v88 & 0xFF00000000000000) + 0x100000000000000;
      v93 = a1->_v3 ^ v91;
      a1->_v3 = v93;
      a1->_buffer.value = v92;
      v94 = a1->_c;
      if (a1->_c <= 0)
      {
        v95 = a1->_v0;
      }
      else
      {
        v95 = a1->_v0;
        v96 = a1->_v1;
        v97 = a1->_v2;
        do
        {
          v98 = v95 + v96;
          v99 = v98 ^ __ROR8__(v96, 51);
          v100 = v97 + v93;
          v101 = __ROR8__(v93, 48);
          v95 = (v100 ^ v101) + __ROR8__(v98, 32);
          v93 = v95 ^ __ROR8__(v100 ^ v101, 43);
          v102 = v100 + v99;
          v96 = v102 ^ __ROR8__(v99, 47);
          v97 = __ROR8__(v102, 32);
          --v94;
        }
        while (v94);
        a1->_v1 = v96;
        a1->_v2 = v97;
        a1->_v3 = v93;
      }
      a1->_v0 = v95 ^ v91;
    }
    else
    {
      a1->_buffer.value = ((241 << v90) | v88) + 0x100000000000000;
    }
    v212 = MEMORY[0x1D8259160](a2);
    v214 = a1->_v3;
    v213 = a1->_buffer.value;
    v215 = a1->_c;
    v182 = a1->_v0;
    v183 = a1->_v1;
    v184 = a1->_v2;
    v185 = (v213 & 0x700000000000000) == 0;
    v216 = 8 * (HIBYTE(v213) & 7);
    v187 = (*(_QWORD *)&v212 << v216) | v213 & 0xFFFFFFFFFFFFFFLL;
    v217 = (v213 & 0xFF00000000000000) + 0x800000000000000;
    v218 = *(_QWORD *)&v212 >> -(char)v216;
    if (v185)
      v218 = 0;
    v219 = v218 | v217;
    v191 = v214 ^ v187;
    a1->_v3 = v214 ^ v187;
    a1->_buffer.value = v219;
    if (v215 < 1)
      goto LABEL_140;
    do
    {
      v220 = v182 + v183;
      v221 = v220 ^ __ROR8__(v183, 51);
      v222 = v184 + v191;
      v223 = __ROR8__(v191, 48);
      v182 = (v222 ^ v223) + __ROR8__(v220, 32);
      v191 = v182 ^ __ROR8__(v222 ^ v223, 43);
      v224 = v222 + v221;
      v183 = v224 ^ __ROR8__(v221, 47);
      v184 = __ROR8__(v224, 32);
      --v215;
    }
    while (v215);
    goto LABEL_139;
  }
  if (v4 == CFArrayGetTypeID())
  {
    v129 = a1->_buffer.value;
    v130 = HIBYTE(v129) & 7;
    v131 = 8 * v130;
    if (v130 == 7)
    {
      v132 = (18 << v131) | v129 & 0xFFFFFFFFFFFFFFLL;
      v133 = (v129 & 0xFF00000000000000) + 0x100000000000000;
      v134 = a1->_v3 ^ v132;
      a1->_v3 = v134;
      a1->_buffer.value = v133;
      v135 = a1->_c;
      if (a1->_c <= 0)
      {
        v136 = a1->_v0;
      }
      else
      {
        v136 = a1->_v0;
        v137 = a1->_v1;
        v138 = a1->_v2;
        do
        {
          v139 = v136 + v137;
          v140 = v139 ^ __ROR8__(v137, 51);
          v141 = v138 + v134;
          v142 = __ROR8__(v134, 48);
          v136 = (v141 ^ v142) + __ROR8__(v139, 32);
          v134 = v136 ^ __ROR8__(v141 ^ v142, 43);
          v143 = v141 + v140;
          v137 = v143 ^ __ROR8__(v140, 47);
          v138 = __ROR8__(v143, 32);
          --v135;
        }
        while (v135);
        a1->_v1 = v137;
        a1->_v2 = v138;
        a1->_v3 = v134;
      }
      a1->_v0 = v136 ^ v132;
    }
    else
    {
      a1->_buffer.value = ((18 << v131) | v129) + 0x100000000000000;
    }
    Count = CFArrayGetCount((CFArrayRef)a2);
    v226 = Count;
    v228 = a1->_v3;
    v227 = a1->_buffer.value;
    v185 = (v227 & 0x700000000000000) == 0;
    v229 = 8 * (HIBYTE(v227) & 7);
    v230 = (Count << v229) | v227 & 0xFFFFFFFFFFFFFFLL;
    v231 = (v227 & 0xFF00000000000000) + 0x800000000000000;
    v232 = (unint64_t)Count >> -(char)v229;
    if (v185)
      v232 = 0;
    v233 = v232 | v231;
    v234 = v230 ^ v228;
    a1->_v3 = v230 ^ v228;
    a1->_buffer.value = v233;
    v235 = a1->_c;
    if (a1->_c <= 0)
    {
      v236 = a1->_v0;
    }
    else
    {
      v236 = a1->_v0;
      v237 = a1->_v1;
      v238 = a1->_v2;
      do
      {
        v239 = v236 + v237;
        v240 = v239 ^ __ROR8__(v237, 51);
        v241 = v238 + v234;
        v242 = __ROR8__(v234, 48);
        v236 = (v241 ^ v242) + __ROR8__(v239, 32);
        v234 = v236 ^ __ROR8__(v241 ^ v242, 43);
        v243 = v241 + v240;
        v237 = v243 ^ __ROR8__(v240, 47);
        v238 = __ROR8__(v243, 32);
        --v235;
      }
      while (v235);
      a1->_v1 = v237;
      a1->_v2 = v238;
      a1->_v3 = v234;
    }
    a1->_v0 = v236 ^ v230;
    if (Count >= 1)
    {
      v244 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, v244);
        IFCombinePropertyListObject(a1, ValueAtIndex);
        ++v244;
      }
      while (v226 != v244);
    }
  }
  else
  {
    if (v4 != CFDictionaryGetTypeID())
    {
      if (v4 != CFNullGetTypeID())
        return;
      v197 = a1->_buffer.value;
      v198 = HIBYTE(v197) & 7;
      v199 = 8 * v198;
      if (v198 != 7)
      {
        v162 = (52 << v199) | v197;
        goto LABEL_108;
      }
      v200 = (52 << v199) | v197 & 0xFFFFFFFFFFFFFFLL;
      v201 = (v197 & 0xFF00000000000000) + 0x100000000000000;
      v202 = a1->_v3 ^ v200;
      a1->_v3 = v202;
      a1->_buffer.value = v201;
      v203 = a1->_c;
      if (a1->_c <= 0)
      {
        v204 = a1->_v0;
      }
      else
      {
        v204 = a1->_v0;
        v205 = a1->_v1;
        v206 = a1->_v2;
        do
        {
          v207 = v204 + v205;
          v208 = v207 ^ __ROR8__(v205, 51);
          v209 = v206 + v202;
          v210 = __ROR8__(v202, 48);
          v204 = (v209 ^ v210) + __ROR8__(v207, 32);
          v202 = v204 ^ __ROR8__(v209 ^ v210, 43);
          v211 = v209 + v208;
          v205 = v211 ^ __ROR8__(v208, 47);
          v206 = __ROR8__(v211, 32);
          --v203;
        }
        while (v203);
        a1->_v1 = v205;
        a1->_v2 = v206;
        a1->_v3 = v202;
      }
      v161 = v204 ^ v200;
LABEL_141:
      a1->_v0 = v161;
      return;
    }
    v163 = a1->_buffer.value;
    v164 = HIBYTE(v163) & 7;
    v165 = 8 * v164;
    if (v164 == 7)
    {
      v166 = (35 << v165) | v163 & 0xFFFFFFFFFFFFFFLL;
      v167 = (v163 & 0xFF00000000000000) + 0x100000000000000;
      v168 = a1->_v3 ^ v166;
      a1->_v3 = v168;
      a1->_buffer.value = v167;
      v169 = a1->_c;
      if (a1->_c <= 0)
      {
        v170 = a1->_v0;
      }
      else
      {
        v170 = a1->_v0;
        v171 = a1->_v1;
        v172 = a1->_v2;
        do
        {
          v173 = v170 + v171;
          v174 = v173 ^ __ROR8__(v171, 51);
          v175 = v172 + v168;
          v176 = __ROR8__(v168, 48);
          v170 = (v175 ^ v176) + __ROR8__(v173, 32);
          v168 = v170 ^ __ROR8__(v175 ^ v176, 43);
          v177 = v175 + v174;
          v171 = v177 ^ __ROR8__(v174, 47);
          v172 = __ROR8__(v177, 32);
          --v169;
        }
        while (v169);
        a1->_v1 = v171;
        a1->_v2 = v172;
        a1->_v3 = v168;
      }
      a1->_v0 = v170 ^ v166;
    }
    else
    {
      a1->_buffer.value = ((35 << v165) | v163) + 0x100000000000000;
    }
    v246 = CFDictionaryGetCount((CFDictionaryRef)a2);
    v247 = v246;
    v249 = a1->_v3;
    v248 = a1->_buffer.value;
    v185 = (v248 & 0x700000000000000) == 0;
    v250 = 8 * (HIBYTE(v248) & 7);
    v251 = (v246 << v250) | v248 & 0xFFFFFFFFFFFFFFLL;
    v252 = (v248 & 0xFF00000000000000) + 0x800000000000000;
    v253 = v246 >> -(char)v250;
    if (v185)
      v253 = 0;
    v254 = v253 | v252;
    v255 = v251 ^ v249;
    a1->_v3 = v251 ^ v249;
    a1->_buffer.value = v254;
    v256 = a1->_c;
    if (a1->_c <= 0)
    {
      v257 = a1->_v0;
    }
    else
    {
      v257 = a1->_v0;
      v258 = a1->_v1;
      v259 = a1->_v2;
      do
      {
        v260 = v257 + v258;
        v261 = v260 ^ __ROR8__(v258, 51);
        v262 = v259 + v255;
        v263 = __ROR8__(v255, 48);
        v257 = (v262 ^ v263) + __ROR8__(v260, 32);
        v255 = v257 ^ __ROR8__(v262 ^ v263, 43);
        v264 = v262 + v261;
        v258 = v264 ^ __ROR8__(v261, 47);
        v259 = __ROR8__(v264, 32);
        --v256;
      }
      while (v256);
      a1->_v1 = v258;
      a1->_v2 = v259;
      a1->_v3 = v255;
    }
    a1->_v0 = v257 ^ v251;
    v265 = (const void **)malloc_type_malloc(8 * v246, 0xC0040B8AA526DuLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v265, 0);
    v266 = CFArrayCreate(0, v265, v247, 0);
    free(v265);
    MutableCopy = CFArrayCreateMutableCopy(0, v247, v266);
    CFRelease(v266);
    v275.location = 0;
    v275.length = v247;
    CFArraySortValues(MutableCopy, v275, (CFComparatorFunction)IFCFTypeCompare, 0);
    if (v247 >= 1)
    {
      for (j = 0; j != v247; ++j)
      {
        v269 = CFArrayGetValueAtIndex(MutableCopy, j);
        IFCombinePropertyListObject(a1, v269);
        v270 = CFDictionaryGetValue((CFDictionaryRef)a2, v269);
        IFCombinePropertyListObject(a1, v270);
      }
    }
    CFRelease(MutableCopy);
  }
}

id _IFSetTransform(void *a1, uint64_t a2)
{
  void *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  Class *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a1;
  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "count");
  if (v4)
  {
    v5 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v3);
          v11 = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          if (v11)
            v5[v8++] = v11;
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }
    v12 = (void *)objc_opt_class();
    v13 = objc_msgSend(v12, "isSubclassOfClass:", objc_opt_class());
    v14 = (Class *)0x1E0C99E60;
    if (v13)
      v14 = (Class *)0x1E0C99E20;
    v15 = (void *)objc_msgSend(objc_alloc(*v14), "initWithObjects:count:", v5, v8);
    free(v5);
    return v15;
  }
  return v3;
}

void _IFAsyncArrayTransform(void *a1, char a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  char v8;
  size_t v9;
  void *v10;
  NSObject *v11;
  uint64_t i;
  uint64_t v13;
  NSObject *global_queue;
  const char *label;
  _QWORD block[8];
  char v19;
  _QWORD v20[8];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3 != 0;
  v9 = objc_msgSend(a1, "count");
  v10 = malloc_type_calloc(v9, 0x10uLL, 0x108004057E67DB5uLL);
  v11 = dispatch_group_create();
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      dispatch_group_enter(v11);
      v13 = objc_msgSend(a1, "objectAtIndex:", i);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = ___IFAsyncArrayTransform_block_invoke;
      v20[3] = &unk_1E97786D8;
      v21 = a2;
      v20[6] = v10;
      v20[7] = i;
      v20[4] = v11;
      v20[5] = &v22;
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(a4 + 16))(a4, v13, i, v20);
      v8 |= *((_BYTE *)v23 + 24) == 0;
      _Block_object_dispose(&v22, 8);
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___IFAsyncArrayTransform_block_invoke_2;
  block[3] = &unk_1E9778700;
  block[6] = v9;
  block[7] = v10;
  v19 = a2;
  block[4] = v11;
  block[5] = a5;
  if ((v8 & 1) != 0)
  {
    global_queue = a3;
    if (!a3)
    {
      global_queue = MEMORY[0x1E0C80D38];
      label = dispatch_queue_get_label(MEMORY[0x1E0C80D38]);
      if (label != dispatch_queue_get_label(0))
        global_queue = dispatch_get_global_queue(0, 0);
    }
    dispatch_group_notify(v11, global_queue, block);
  }
  else
  {
    ___IFAsyncArrayTransform_block_invoke_2((uint64_t)block);
  }
}

void sub_1D418307C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id _IFArrayTransform(void *a1, uint64_t a2)
{
  size_t v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = objc_msgSend(a1, "count");
  if (!v4)
    return a1;
  v5 = v4;
  v6 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, objc_msgSend(a1, "objectAtIndex:", v7), v7);
    if (v9)
      v6[v8++] = v9;
    ++v7;
  }
  while (v5 != v7);
  v10 = (void *)objc_opt_class();
  v11 = (void *)objc_msgSend(_IFSafeAllocArrayOfClass(v10), "initWithObjects:count:", v6, v8);
  free(v6);
  return v11;
}

id _IFSafeAllocArrayOfClass(void *a1)
{
  int v1;
  Class *v2;

  v1 = objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class());
  v2 = (Class *)0x1E0C99D20;
  if (v1)
    v2 = (Class *)0x1E0C99DE8;
  return objc_alloc(*v2);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

id IFMergeDictionaries(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id *v14;
  id v15;
  id *v17;

  v10 = a1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id *)&a10;
  v12 = a9;
  if (v12)
  {
    v13 = v12;
    do
    {
      objc_msgSend(v11, "addEntriesFromDictionary:", v13);
      v14 = v17++;
      v15 = *v14;

      v13 = v15;
    }
    while (v15);
  }

  return v11;
}

id _IFConcurrentArrayTransform(void *a1, uint64_t a2)
{
  id v3;
  size_t v4;
  size_t v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  v3 = a1;
  v4 = objc_msgSend(a1, "count");
  if (v4)
  {
    v5 = v4;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v23 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___IFConcurrentArrayTransform_block_invoke;
    block[3] = &unk_1E97786B0;
    block[4] = v3;
    block[5] = a2;
    block[6] = &v20;
    dispatch_apply(v5, 0, block);
    v6 = 0;
    v7 = 0;
    v8 = (_QWORD *)v21[3];
    do
    {
      if (v8[v6])
        ++v7;
      ++v6;
    }
    while (v5 != v6);
    if (v7 < v5)
    {
      v9 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
      v8 = v9;
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = *(_QWORD *)(v21[3] + 8 * v10);
        if (v12)
          v9[v11++] = v12;
        ++v10;
      }
      while (v5 != v10);
    }
    v13 = (void *)objc_opt_class();
    v14 = (void *)objc_msgSend(_IFSafeAllocArrayOfClass(v13), "initWithObjects:count:", v8, v7);
    v15 = 0;
    if (v5 <= 1)
      v16 = 1;
    else
      v16 = v5;
    do
    {
      v17 = *(void **)(v21[3] + 8 * v15);
      if (v17)

      ++v15;
    }
    while (v16 != v15);
    free((void *)v21[3]);
    if (v7 < v5)
      free(v8);
    v3 = v14;
    _Block_object_dispose(&v20, 8);
  }
  return v3;
}

void sub_1D41855C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _IFOrderedSetTransform(void *a1, uint64_t a2)
{
  void *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  Class *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a1;
  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "count");
  if (v4)
  {
    v5 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v3);
          v11 = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          if (v11)
            v5[v8++] = v11;
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }
    v12 = (void *)objc_opt_class();
    v13 = objc_msgSend(v12, "isSubclassOfClass:", objc_opt_class());
    v14 = (Class *)0x1E0C99E40;
    if (v13)
      v14 = (Class *)0x1E0C99E10;
    v15 = (void *)objc_msgSend(objc_alloc(*v14), "initWithObjects:count:", v5, v8);
    free(v5);
    return v15;
  }
  return v3;
}

void sub_1D4185D70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4185DCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFComparisonResult IFCFTypeCompare(const __CFString *a1, const __CFString *a2, void *a3)
{
  CFTypeID v6;
  CFTypeID v7;
  int Value;
  int v10;
  uint64_t v11;

  v6 = CFGetTypeID(a1);
  v7 = CFGetTypeID(a2);
  if (v6 == v7)
  {
    if (v6 == CFStringGetTypeID())
    {
      return CFStringCompare(a1, a2, 0x200uLL);
    }
    else if (v6 == CFNumberGetTypeID())
    {
      return CFNumberCompare((CFNumberRef)a1, (CFNumberRef)a2, a3);
    }
    else if (v6 == CFDateGetTypeID())
    {
      return CFDateCompare((CFDateRef)a1, (CFDateRef)a2, a3);
    }
    else if (v6 == CFBooleanGetTypeID())
    {
      Value = CFBooleanGetValue((CFBooleanRef)a1);
      v10 = CFBooleanGetValue((CFBooleanRef)a2);
      v11 = 1;
      if (Value)
        v11 = -1;
      if (Value == v10)
        return 0;
      else
        return v11;
    }
    else
    {
      return 0;
    }
  }
  else if (v6 < v7)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

void sub_1D4186CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D41894F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1E0C987B8](allocator, localeID);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

