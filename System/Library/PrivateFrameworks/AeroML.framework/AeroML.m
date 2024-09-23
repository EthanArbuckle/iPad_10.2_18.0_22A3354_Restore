uint64_t AMLPhotosSearchLabeledDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  unsigned int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  char v138;
  unsigned int v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t result;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  BOOL v152;
  uint64_t v153;
  uint64_t v154;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 384);
          *(_QWORD *)(a1 + 384) = v18;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_QWORD *)(a1 + 400) |= 0x1000000000000uLL;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_202;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_202:
          v151 = 392;
          goto LABEL_224;
        case 3u:
          *(_QWORD *)(a1 + 400) |= 0x20000000uLL;
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 240;
          goto LABEL_315;
        case 4u:
          *(_QWORD *)(a1 + 400) |= 0x4000000uLL;
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 216;
          goto LABEL_315;
        case 5u:
          *(_QWORD *)(a1 + 400) |= 0x100000000uLL;
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 264;
          goto LABEL_315;
        case 6u:
          *(_QWORD *)(a1 + 400) |= 0x80000000uLL;
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 256;
          goto LABEL_315;
        case 7u:
          *(_QWORD *)(a1 + 400) |= 0x40000000uLL;
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 248;
          goto LABEL_315;
        case 8u:
          *(_QWORD *)(a1 + 400) |= 0x8000000uLL;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 224;
          goto LABEL_315;
        case 9u:
          *(_QWORD *)(a1 + 400) |= 0x10000000uLL;
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 232;
          goto LABEL_315;
        case 0xAu:
          v42 = 0;
          v43 = 0;
          v22 = 0;
          *(_QWORD *)(a1 + 400) |= 0x800000000000uLL;
          while (2)
          {
            v44 = *v3;
            v45 = *(_QWORD *)(a2 + v44);
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
              *(_QWORD *)(a2 + v44) = v46;
              v22 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v15 = v43++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_206;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_206:
          v151 = 376;
          goto LABEL_224;
        case 0xBu:
          *(_QWORD *)(a1 + 400) |= 0x1000000uLL;
          v48 = *v3;
          v49 = *(_QWORD *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v49);
            *(_QWORD *)(a2 + v48) = v49 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 200;
          goto LABEL_315;
        case 0xCu:
          *(_QWORD *)(a1 + 400) |= 0x20000uLL;
          v50 = *v3;
          v51 = *(_QWORD *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v51);
            *(_QWORD *)(a2 + v50) = v51 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 144;
          goto LABEL_315;
        case 0xDu:
          v52 = 0;
          v53 = 0;
          v54 = 0;
          *(_QWORD *)(a1 + 400) |= 0x4000000000000uLL;
          while (2)
          {
            v55 = *v3;
            v56 = *(_QWORD *)(a2 + v55);
            v57 = v56 + 1;
            if (v56 == -1 || v57 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
              *(_QWORD *)(a2 + v55) = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                v15 = v53++ >= 9;
                if (v15)
                {
                  v54 = 0;
                  goto LABEL_210;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v54 = 0;
LABEL_210:
          v152 = v54 != 0;
          v153 = 397;
          goto LABEL_215;
        case 0xEu:
          *(_QWORD *)(a1 + 400) |= 1uLL;
          v59 = *v3;
          v60 = *(_QWORD *)(a2 + v59);
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 8;
          goto LABEL_315;
        case 0xFu:
          *(_QWORD *)(a1 + 400) |= 0x10000uLL;
          v61 = *v3;
          v62 = *(_QWORD *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v62);
            *(_QWORD *)(a2 + v61) = v62 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 136;
          goto LABEL_315;
        case 0x10u:
          *(_QWORD *)(a1 + 400) |= 0x80000uLL;
          v63 = *v3;
          v64 = *(_QWORD *)(a2 + v63);
          if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v64);
            *(_QWORD *)(a2 + v63) = v64 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 160;
          goto LABEL_315;
        case 0x11u:
          *(_QWORD *)(a1 + 400) |= 0x40000uLL;
          v65 = *v3;
          v66 = *(_QWORD *)(a2 + v65);
          if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v66);
            *(_QWORD *)(a2 + v65) = v66 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 152;
          goto LABEL_315;
        case 0x12u:
          *(_QWORD *)(a1 + 400) |= 0x200000uLL;
          v67 = *v3;
          v68 = *(_QWORD *)(a2 + v67);
          if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v68);
            *(_QWORD *)(a2 + v67) = v68 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 176;
          goto LABEL_315;
        case 0x13u:
          *(_QWORD *)(a1 + 400) |= 0x100000uLL;
          v69 = *v3;
          v70 = *(_QWORD *)(a2 + v69);
          if (v70 <= 0xFFFFFFFFFFFFFFF7 && v70 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v70);
            *(_QWORD *)(a2 + v69) = v70 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 168;
          goto LABEL_315;
        case 0x14u:
          *(_QWORD *)(a1 + 400) |= 0x4000uLL;
          v71 = *v3;
          v72 = *(_QWORD *)(a2 + v71);
          if (v72 <= 0xFFFFFFFFFFFFFFF7 && v72 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v72);
            *(_QWORD *)(a2 + v71) = v72 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 120;
          goto LABEL_315;
        case 0x15u:
          *(_QWORD *)(a1 + 400) |= 0x2000uLL;
          v73 = *v3;
          v74 = *(_QWORD *)(a2 + v73);
          if (v74 <= 0xFFFFFFFFFFFFFFF7 && v74 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v74);
            *(_QWORD *)(a2 + v73) = v74 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 112;
          goto LABEL_315;
        case 0x16u:
          *(_QWORD *)(a1 + 400) |= 0x100000000000uLL;
          v75 = *v3;
          v76 = *(_QWORD *)(a2 + v75);
          if (v76 <= 0xFFFFFFFFFFFFFFF7 && v76 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v76);
            *(_QWORD *)(a2 + v75) = v76 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 360;
          goto LABEL_315;
        case 0x17u:
          *(_QWORD *)(a1 + 400) |= 0x80000000000uLL;
          v77 = *v3;
          v78 = *(_QWORD *)(a2 + v77);
          if (v78 <= 0xFFFFFFFFFFFFFFF7 && v78 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v78);
            *(_QWORD *)(a2 + v77) = v78 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 352;
          goto LABEL_315;
        case 0x18u:
          *(_QWORD *)(a1 + 400) |= 0x1000uLL;
          v79 = *v3;
          v80 = *(_QWORD *)(a2 + v79);
          if (v80 <= 0xFFFFFFFFFFFFFFF7 && v80 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v80);
            *(_QWORD *)(a2 + v79) = v80 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 104;
          goto LABEL_315;
        case 0x19u:
          *(_QWORD *)(a1 + 400) |= 0x800uLL;
          v81 = *v3;
          v82 = *(_QWORD *)(a2 + v81);
          if (v82 <= 0xFFFFFFFFFFFFFFF7 && v82 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v82);
            *(_QWORD *)(a2 + v81) = v82 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 96;
          goto LABEL_315;
        case 0x1Au:
          *(_QWORD *)(a1 + 400) |= 0x40uLL;
          v83 = *v3;
          v84 = *(_QWORD *)(a2 + v83);
          if (v84 <= 0xFFFFFFFFFFFFFFF7 && v84 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v84);
            *(_QWORD *)(a2 + v83) = v84 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 56;
          goto LABEL_315;
        case 0x1Bu:
          *(_QWORD *)(a1 + 400) |= 0x20uLL;
          v85 = *v3;
          v86 = *(_QWORD *)(a2 + v85);
          if (v86 <= 0xFFFFFFFFFFFFFFF7 && v86 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v86);
            *(_QWORD *)(a2 + v85) = v86 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 48;
          goto LABEL_315;
        case 0x1Cu:
          *(_QWORD *)(a1 + 400) |= 4uLL;
          v87 = *v3;
          v88 = *(_QWORD *)(a2 + v87);
          if (v88 <= 0xFFFFFFFFFFFFFFF7 && v88 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v88);
            *(_QWORD *)(a2 + v87) = v88 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 24;
          goto LABEL_315;
        case 0x1Du:
          *(_QWORD *)(a1 + 400) |= 2uLL;
          v89 = *v3;
          v90 = *(_QWORD *)(a2 + v89);
          if (v90 <= 0xFFFFFFFFFFFFFFF7 && v90 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v90);
            *(_QWORD *)(a2 + v89) = v90 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 16;
          goto LABEL_315;
        case 0x1Eu:
          *(_QWORD *)(a1 + 400) |= 0x100uLL;
          v91 = *v3;
          v92 = *(_QWORD *)(a2 + v91);
          if (v92 <= 0xFFFFFFFFFFFFFFF7 && v92 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v92);
            *(_QWORD *)(a2 + v91) = v92 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 72;
          goto LABEL_315;
        case 0x1Fu:
          *(_QWORD *)(a1 + 400) |= 0x80uLL;
          v93 = *v3;
          v94 = *(_QWORD *)(a2 + v93);
          if (v94 <= 0xFFFFFFFFFFFFFFF7 && v94 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v94);
            *(_QWORD *)(a2 + v93) = v94 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 64;
          goto LABEL_315;
        case 0x20u:
          *(_QWORD *)(a1 + 400) |= 0x400uLL;
          v95 = *v3;
          v96 = *(_QWORD *)(a2 + v95);
          if (v96 <= 0xFFFFFFFFFFFFFFF7 && v96 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v96);
            *(_QWORD *)(a2 + v95) = v96 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 88;
          goto LABEL_315;
        case 0x21u:
          *(_QWORD *)(a1 + 400) |= 0x200uLL;
          v97 = *v3;
          v98 = *(_QWORD *)(a2 + v97);
          if (v98 <= 0xFFFFFFFFFFFFFFF7 && v98 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v98);
            *(_QWORD *)(a2 + v97) = v98 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 80;
          goto LABEL_315;
        case 0x22u:
          *(_QWORD *)(a1 + 400) |= 0x10uLL;
          v99 = *v3;
          v100 = *(_QWORD *)(a2 + v99);
          if (v100 <= 0xFFFFFFFFFFFFFFF7 && v100 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v100);
            *(_QWORD *)(a2 + v99) = v100 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 40;
          goto LABEL_315;
        case 0x23u:
          *(_QWORD *)(a1 + 400) |= 8uLL;
          v101 = *v3;
          v102 = *(_QWORD *)(a2 + v101);
          if (v102 <= 0xFFFFFFFFFFFFFFF7 && v102 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v102);
            *(_QWORD *)(a2 + v101) = v102 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 32;
          goto LABEL_315;
        case 0x24u:
          *(_QWORD *)(a1 + 400) |= 0x40000000000uLL;
          v103 = *v3;
          v104 = *(_QWORD *)(a2 + v103);
          if (v104 <= 0xFFFFFFFFFFFFFFF7 && v104 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v104);
            *(_QWORD *)(a2 + v103) = v104 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 344;
          goto LABEL_315;
        case 0x25u:
          *(_QWORD *)(a1 + 400) |= 0x20000000000uLL;
          v105 = *v3;
          v106 = *(_QWORD *)(a2 + v105);
          if (v106 <= 0xFFFFFFFFFFFFFFF7 && v106 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v106);
            *(_QWORD *)(a2 + v105) = v106 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 336;
          goto LABEL_315;
        case 0x26u:
          *(_QWORD *)(a1 + 400) |= 0x4000000000uLL;
          v107 = *v3;
          v108 = *(_QWORD *)(a2 + v107);
          if (v108 <= 0xFFFFFFFFFFFFFFF7 && v108 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v108);
            *(_QWORD *)(a2 + v107) = v108 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 312;
          goto LABEL_315;
        case 0x27u:
          *(_QWORD *)(a1 + 400) |= 0x2000000000uLL;
          v109 = *v3;
          v110 = *(_QWORD *)(a2 + v109);
          if (v110 <= 0xFFFFFFFFFFFFFFF7 && v110 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v110);
            *(_QWORD *)(a2 + v109) = v110 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 304;
          goto LABEL_315;
        case 0x28u:
          *(_QWORD *)(a1 + 400) |= 0x400000000uLL;
          v111 = *v3;
          v112 = *(_QWORD *)(a2 + v111);
          if (v112 <= 0xFFFFFFFFFFFFFFF7 && v112 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v112);
            *(_QWORD *)(a2 + v111) = v112 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 280;
          goto LABEL_315;
        case 0x29u:
          *(_QWORD *)(a1 + 400) |= 0x200000000uLL;
          v113 = *v3;
          v114 = *(_QWORD *)(a2 + v113);
          if (v114 <= 0xFFFFFFFFFFFFFFF7 && v114 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v114);
            *(_QWORD *)(a2 + v113) = v114 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 272;
          goto LABEL_315;
        case 0x2Au:
          *(_QWORD *)(a1 + 400) |= 0x10000000000uLL;
          v115 = *v3;
          v116 = *(_QWORD *)(a2 + v115);
          if (v116 <= 0xFFFFFFFFFFFFFFF7 && v116 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v116);
            *(_QWORD *)(a2 + v115) = v116 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 328;
          goto LABEL_315;
        case 0x2Bu:
          *(_QWORD *)(a1 + 400) |= 0x8000000000uLL;
          v117 = *v3;
          v118 = *(_QWORD *)(a2 + v117);
          if (v118 <= 0xFFFFFFFFFFFFFFF7 && v118 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v118);
            *(_QWORD *)(a2 + v117) = v118 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 320;
          goto LABEL_315;
        case 0x2Cu:
          *(_QWORD *)(a1 + 400) |= 0x1000000000uLL;
          v119 = *v3;
          v120 = *(_QWORD *)(a2 + v119);
          if (v120 <= 0xFFFFFFFFFFFFFFF7 && v120 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v120);
            *(_QWORD *)(a2 + v119) = v120 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 296;
          goto LABEL_315;
        case 0x2Du:
          *(_QWORD *)(a1 + 400) |= 0x800000000uLL;
          v121 = *v3;
          v122 = *(_QWORD *)(a2 + v121);
          if (v122 <= 0xFFFFFFFFFFFFFFF7 && v122 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v122);
            *(_QWORD *)(a2 + v121) = v122 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 288;
          goto LABEL_315;
        case 0x2Eu:
          *(_QWORD *)(a1 + 400) |= 0x8000uLL;
          v123 = *v3;
          v124 = *(_QWORD *)(a2 + v123);
          if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v124);
            *(_QWORD *)(a2 + v123) = v124 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 128;
          goto LABEL_315;
        case 0x2Fu:
          v125 = 0;
          v126 = 0;
          v127 = 0;
          *(_QWORD *)(a1 + 400) |= 0x2000000000000uLL;
          while (2)
          {
            v128 = *v3;
            v129 = *(_QWORD *)(a2 + v128);
            v130 = v129 + 1;
            if (v129 == -1 || v130 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v131 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v129);
              *(_QWORD *)(a2 + v128) = v130;
              v127 |= (unint64_t)(v131 & 0x7F) << v125;
              if (v131 < 0)
              {
                v125 += 7;
                v15 = v126++ >= 9;
                if (v15)
                {
                  v127 = 0;
                  goto LABEL_214;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v127 = 0;
LABEL_214:
          v152 = v127 != 0;
          v153 = 396;
LABEL_215:
          *(_BYTE *)(a1 + v153) = v152;
          continue;
        case 0x30u:
          v132 = 0;
          v133 = 0;
          v22 = 0;
          *(_QWORD *)(a1 + 400) |= 0x200000000000uLL;
          while (2)
          {
            v134 = *v3;
            v135 = *(_QWORD *)(a2 + v134);
            v136 = v135 + 1;
            if (v135 == -1 || v136 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v137 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v135);
              *(_QWORD *)(a2 + v134) = v136;
              v22 |= (unint64_t)(v137 & 0x7F) << v132;
              if (v137 < 0)
              {
                v132 += 7;
                v15 = v133++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_219;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_219:
          v151 = 368;
          goto LABEL_224;
        case 0x31u:
          v138 = 0;
          v139 = 0;
          v22 = 0;
          *(_QWORD *)(a1 + 400) |= 0x400000000000uLL;
          break;
        case 0x32u:
          *(_QWORD *)(a1 + 400) |= 0x2000000uLL;
          v144 = *v3;
          v145 = *(_QWORD *)(a2 + v144);
          if (v145 <= 0xFFFFFFFFFFFFFFF7 && v145 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v145);
            *(_QWORD *)(a2 + v144) = v145 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 208;
          goto LABEL_315;
        case 0x33u:
          *(_QWORD *)(a1 + 400) |= 0x800000uLL;
          v146 = *v3;
          v147 = *(_QWORD *)(a2 + v146);
          if (v147 <= 0xFFFFFFFFFFFFFFF7 && v147 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v147);
            *(_QWORD *)(a2 + v146) = v147 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 192;
          goto LABEL_315;
        case 0x35u:
          *(_QWORD *)(a1 + 400) |= 0x400000uLL;
          v149 = *v3;
          v150 = *(_QWORD *)(a2 + v149);
          if (v150 <= 0xFFFFFFFFFFFFFFF7 && v150 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v150);
            *(_QWORD *)(a2 + v149) = v150 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v154 = 184;
LABEL_315:
          *(_QWORD *)(a1 + v154) = v29;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v140 = *v3;
        v141 = *(_QWORD *)(a2 + v140);
        v142 = v141 + 1;
        if (v141 == -1 || v142 > *(_QWORD *)(a2 + *v4))
          break;
        v143 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v141);
        *(_QWORD *)(a2 + v140) = v142;
        v22 |= (unint64_t)(v143 & 0x7F) << v138;
        if ((v143 & 0x80) == 0)
          goto LABEL_221;
        v138 += 7;
        v15 = v139++ >= 9;
        if (v15)
        {
          LODWORD(v22) = 0;
          goto LABEL_223;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_221:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_223:
      v151 = 372;
LABEL_224:
      *(_DWORD *)(a1 + v151) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t AMLUserLevelPhotosSearchMetricsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  void *v48;
  uint64_t v49;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 104) |= 0x80u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_60;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_62;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_62:
          *(_BYTE *)(a1 + 100) = v20 != 0;
          continue;
        case 2u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 64;
          goto LABEL_58;
        case 3u:
          *(_BYTE *)(a1 + 104) |= 0x10u;
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v49 = 40;
          goto LABEL_79;
        case 4u:
          *(_BYTE *)(a1 + 104) |= 0x20u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v49 = 48;
          goto LABEL_79;
        case 5u:
          *(_BYTE *)(a1 + 104) |= 1u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v49 = 8;
          goto LABEL_79;
        case 6u:
          *(_BYTE *)(a1 + 104) |= 2u;
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v49 = 16;
          goto LABEL_79;
        case 7u:
          *(_BYTE *)(a1 + 104) |= 4u;
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v49 = 24;
          goto LABEL_79;
        case 8u:
          *(_BYTE *)(a1 + 104) |= 8u;
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v49 = 32;
LABEL_79:
          *(_QWORD *)(a1 + v49) = v30;
          continue;
        case 9u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 56;
          goto LABEL_58;
        case 0xAu:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_BYTE *)(a1 + 104) |= 0x40u;
          break;
        case 0xBu:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 72;
          goto LABEL_58;
        case 0xCu:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 80;
          goto LABEL_58;
        case 0xDu:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 88;
LABEL_58:
          v48 = *(void **)(a1 + v27);
          *(_QWORD *)(a1 + v27) = v26;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v44 = *v3;
        v45 = *(_QWORD *)(a2 + v44);
        v46 = v45 + 1;
        if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
          break;
        v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
        *(_QWORD *)(a2 + v44) = v46;
        v43 |= (unint64_t)(v47 & 0x7F) << v41;
        if ((v47 & 0x80) == 0)
          goto LABEL_64;
        v41 += 7;
        v15 = v42++ >= 9;
        if (v15)
        {
          LODWORD(v43) = 0;
          goto LABEL_66;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v43) = 0;
LABEL_66:
      *(_DWORD *)(a1 + 96) = v43;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_235F66278()
{
  uint64_t v0;

  v0 = sub_235F9B384();
  __swift_allocate_value_buffer(v0, qword_25639A730);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A730);
  return sub_235F9B378();
}

id sub_235F66318()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AMLStorageMetadata_donationMetadata);
}

uint64_t sub_235F66360()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AMLStorageMetadata_donationTime);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall AMLStorageMetadata.init(donationMetadata:donationTime:)(AMLStorageMetadata *__return_ptr retstr, AMLFeaturesDonationMetadata *donationMetadata, Swift::String donationTime)
{
  void *v3;
  id v4;
  void *v5;

  v4 = objc_allocWithZone((Class)OUTLINED_FUNCTION_12());
  v5 = (void *)OUTLINED_FUNCTION_11();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_initWithDonationMetadata_donationTime_, v3, v5);

  OUTLINED_FUNCTION_24();
}

id AMLStorageMetadata.init(donationMetadata:donationTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  objc_super v11;

  *(_QWORD *)(v8 + OBJC_IVAR___AMLStorageMetadata_donationMetadata) = a1;
  v9 = (_QWORD *)(v8 + OBJC_IVAR___AMLStorageMetadata_donationTime);
  *v9 = a2;
  v9[1] = a3;
  v11.super_class = (Class)AMLStorageMetadata;
  return OUTLINED_FUNCTION_22(a1, sel_init, a3, a4, a5, a6, a7, a8, v11);
}

void AMLStorageMetadata.init()()
{
  OUTLINED_FUNCTION_15();
  __break(1u);
}

uint64_t sub_235F66514()
{
  return OUTLINED_FUNCTION_14();
}

uint64_t sub_235F6656C(uint64_t a1)
{
  return OUTLINED_FUNCTION_4(a1);
}

uint64_t sub_235F66598()
{
  return OUTLINED_FUNCTION_14();
}

uint64_t sub_235F665F0(uint64_t a1)
{
  return OUTLINED_FUNCTION_4(a1);
}

void *sub_235F6661C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___AMLStorageFeatures_arrayProvider);
  v2 = v1;
  return v1;
}

void sub_235F66690(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___AMLStorageFeatures_arrayProvider);
  *(_QWORD *)(v1 + OBJC_IVAR___AMLStorageFeatures_arrayProvider) = a1;

}

id AMLStorageFeatures.init(featureProvider:batchProvider:arrayProvider:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v6 = OBJC_IVAR___AMLStorageFeatures_featureProvider;
  *(_QWORD *)&v3[OBJC_IVAR___AMLStorageFeatures_featureProvider] = 0;
  v7 = OBJC_IVAR___AMLStorageFeatures_batchProvider;
  *(_QWORD *)&v3[OBJC_IVAR___AMLStorageFeatures_batchProvider] = 0;
  v8 = OBJC_IVAR___AMLStorageFeatures_arrayProvider;
  *(_QWORD *)&v3[OBJC_IVAR___AMLStorageFeatures_arrayProvider] = 0;
  *(_QWORD *)&v3[v6] = a1;
  v9 = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)&v3[v7] = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v10 = *(void **)&v3[v8];
  *(_QWORD *)&v3[v8] = a3;
  v11 = a3;

  v21.receiver = v9;
  v21.super_class = (Class)AMLStorageFeatures;
  v19 = OUTLINED_FUNCTION_22(v12, sel_init, v13, v14, v15, v16, v17, v18, v21);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v19;
}

void AMLStorageFeatures.init()()
{
  OUTLINED_FUNCTION_15();
  __break(1u);
}

void *static AMLSpotlightStorage.featuresConfiguration(forConfigurationId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v4 + 16) = 0;
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2468]), sel_init);
  v6 = OUTLINED_FUNCTION_33();
  v7 = (void *)sub_235F9B444();
  objc_msgSend(v5, sel_setFetchAttributes_, v7);

  v8 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v9 = v5;
  v10 = OUTLINED_FUNCTION_3();
  v13 = sub_235F6ACD8(v10, v11, v12);
  v14 = (_QWORD *)OUTLINED_FUNCTION_1();
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = v4;
  v15 = MEMORY[0x24BDAC760];
  OUTLINED_FUNCTION_27((uint64_t)sub_235F671F4, MEMORY[0x24BDAC760], 1107296256, v20, v22);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_7(v13, sel_setFoundItemsHandler_);
  OUTLINED_FUNCTION_8();
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v6;
  OUTLINED_FUNCTION_27((uint64_t)sub_235F67260, v15, 1107296256, v21, v23);
  v16 = v6;
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_7(v13, sel_setCompletionHandler_);
  OUTLINED_FUNCTION_8();
  objc_msgSend(v13, sel_start);
  sub_235F9B570();

  OUTLINED_FUNCTION_2();
  v17 = *(void **)(v4 + 16);
  v18 = v17;
  swift_release();
  return v17;
}

uint64_t sub_235F66A70()
{
  uint64_t v0;

  OUTLINED_FUNCTION_21();
  return swift_deallocObject();
}

void sub_235F66A8C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  void *v27;
  void **v28;
  uint64_t v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD v35[4];
  id v36;

  v5 = a1;
  if (a1 >> 62)
  {
LABEL_30:
    swift_bridgeObjectRetain();
    v6 = sub_235F9B654();
    if (v6)
      goto LABEL_3;
LABEL_31:
    swift_bridgeObjectRelease();
    return;
  }
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_31;
LABEL_3:
  v28 = (void **)(a4 + 16);
  v7 = 4;
  v34 = v5 & 0xC000000000000001;
  v33 = v5;
  sub_235F6B254(0, &qword_256399598);
  v31 = v6;
  while (1)
  {
    a4 = v7 - 4;
    if (v34)
      v8 = (id)MEMORY[0x23B7E7818](v7 - 4, v5);
    else
      v8 = *(id *)(v5 + 8 * v7);
    v9 = v8;
    v10 = v7 - 3;
    if (__OFADD__(a4, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    v11 = objc_msgSend(v8, sel_attributeSet);
    v12 = sub_235F67184();
    if (!v12)
      break;
    v13 = v12;
    v14 = objc_msgSend(v11, sel_valueForCustomKey_, v12);

    if (v14
      && (v36 = v14,
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399600),
          (swift_dynamicCast() & 1) != 0))
    {
      v15 = v35[0];
      v16 = v35[1];
      sub_235F6B254(0, (unint64_t *)&unk_256399620);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399FC0);
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_235F9D670;
      *(_QWORD *)(v17 + 32) = sub_235F6B254(0, (unint64_t *)&unk_256399630);
      *(_QWORD *)(v17 + 40) = sub_235F6B254(0, (unint64_t *)&qword_256399FD0);
      *(_QWORD *)(v17 + 48) = sub_235F6B254(0, &qword_256399640);
      type metadata accessor for AMLFeaturesConfiguration(0);
      *(_QWORD *)(v17 + 56) = v18;
      type metadata accessor for AMLFeaturesSpecification(0);
      *(_QWORD *)(v17 + 64) = v19;
      *(_QWORD *)(v17 + 72) = sub_235F6B254(0, &qword_256399650);
      sub_235F6B0E4(v15, v16);
      sub_235F9B528();
      sub_235F6B140(v15, v16);
      swift_bridgeObjectRelease();
      if (!v35[3])
      {

        sub_235F6B140(v15, v16);
        sub_235F6B06C((uint64_t)v35, &qword_256399530);
LABEL_23:
        v6 = v31;
        v5 = v33;
        goto LABEL_24;
      }
      if ((swift_dynamicCast() & 1) == 0)
      {

        sub_235F6B140(v15, v16);
        goto LABEL_23;
      }
      v20 = v16;
      v32 = v36;
      v21 = objc_msgSend(v32, sel_configurationId);
      v22 = sub_235F9B3FC();
      v24 = v23;

      if (v22 == a2 && v24 == a3)
      {

        sub_235F6B140(v15, v20);
        swift_bridgeObjectRelease();

LABEL_28:
        swift_bridgeObjectRelease();
        swift_beginAccess();
        v27 = *v28;
        *v28 = v32;

        return;
      }
      v26 = sub_235F9B6C0();

      sub_235F6B140(v15, v20);
      swift_bridgeObjectRelease();

      v5 = v33;
      if ((v26 & 1) != 0)
        goto LABEL_28;

      v6 = v31;
    }
    else
    {

    }
LABEL_24:
    ++v7;
    if (v10 == v6)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

id sub_235F67184()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithKeyName_, v1);

  return v2;
}

uint64_t sub_235F671F4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_235F6B254(0, &qword_256399658);
  v2 = sub_235F9B450();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_235F67260(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void static AMLSpotlightStorage.metadata(forPhotoId:aroundTime:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_semaphore_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399490);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v8);
  v43 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235F9B18C();
  v41 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_10(v12, v40);
  v13 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v13 + 16) = 0;
  v14 = swift_allocBox();
  v42 = v15;
  v44 = v10;
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v10);
  v16 = OUTLINED_FUNCTION_1();
  *(_BYTE *)(v16 + 16) = 0;
  v17 = OUTLINED_FUNCTION_33();
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2468]), sel_init);
  v19 = (void *)sub_235F9B444();
  objc_msgSend(v18, sel_setFetchAttributes_, v19);

  v20 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v45 = v18;
  v21 = OUTLINED_FUNCTION_3();
  v24 = sub_235F6ACD8(v21, v22, v23);
  OUTLINED_FUNCTION_36(v24, sel_setPrivateIndex_);
  v25 = OUTLINED_FUNCTION_1();
  *(_QWORD *)(v25 + 16) = 0xD000000000000012;
  *(_QWORD *)(v25 + 24) = 0x8000000235F9EDA0;
  *(_QWORD *)(v25 + 32) = a1;
  *(_QWORD *)(v25 + 40) = a2;
  *(_QWORD *)(v25 + 48) = v13;
  *(double *)(v25 + 56) = a3;
  *(_QWORD *)(v25 + 64) = v4;
  *(_QWORD *)(v25 + 72) = v14;
  *(_QWORD *)(v25 + 80) = v16;
  v49 = sub_235F6AE38;
  v50 = v25;
  v26 = MEMORY[0x24BDAC760];
  v47 = MEMORY[0x24BDAC760];
  v48 = 1107296256;
  OUTLINED_FUNCTION_32((uint64_t)sub_235F671F4);
  swift_bridgeObjectRetain();
  swift_retain();
  v46 = v14;
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_7(v24, sel_setFoundItemsHandler_);
  OUTLINED_FUNCTION_8();
  v27 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v27 + 16) = v17;
  v49 = sub_235F6B28C;
  v50 = v27;
  v47 = v26;
  v48 = 1107296256;
  OUTLINED_FUNCTION_32((uint64_t)sub_235F67260);
  v28 = v17;
  swift_release();
  OUTLINED_FUNCTION_7(v24, sel_setCompletionHandler_);
  OUTLINED_FUNCTION_8();
  objc_msgSend(v24, sel_start);
  sub_235F9B570();
  OUTLINED_FUNCTION_2();
  v29 = *(void **)(v13 + 16);
  if (v29)
  {
    v30 = v42;
    OUTLINED_FUNCTION_2();
    v31 = v30;
    v32 = v43;
    sub_235F6AE70(v31, v43);
    v33 = v44;
    if (__swift_getEnumTagSinglePayload(v32, 1, v44) == 1)
    {
      v34 = v29;
      sub_235F6B06C(v32, &qword_256399490);
    }
    else
    {
      v36 = v40;
      v35 = v41;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v40, v32, v33);
      type metadata accessor for AMLUtilities();
      v37 = v29;
      sub_235F98BD4(v36);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v33);
    }
    v38 = v45;
    v39 = objc_allocWithZone((Class)AMLStorageMetadata);
    sub_235F6AEC4(v29);

  }
  else
  {

  }
  swift_release();
  swift_release();
  swift_release();

  OUTLINED_FUNCTION_5();
}

uint64_t sub_235F676C4(unint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, char *a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  __int128 v29;
  char *v30;
  uint64_t result;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  char *v59;
  _QWORD *v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  double v67;
  double v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  id v81;
  uint64_t v82;
  unint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _BYTE *v88;
  char *v89;
  id v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  char *v96;
  unint64_t v97;
  __int128 v98;
  unint64_t *v99;
  void **v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  __int128 v111;
  unint64_t v112;
  uint64_t v113;
  _BYTE *v114;
  char *v115;
  uint64_t v116;
  char *v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  id v121;
  unint64_t v122;
  __int128 v123;
  __int128 v124;

  v104 = a5;
  v103 = a4;
  v92 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399490);
  v15 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v17 = (char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v86 - v18;
  v102 = sub_235F9B18C();
  v20 = *(_QWORD **)(v102 - 8);
  v21 = MEMORY[0x24BDAC7A8](v102);
  v23 = (char *)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v101 = (char *)&v86 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v109 = (char *)&v86 - v26;
  v27 = (_BYTE *)swift_projectBox();
  if (a1 >> 62)
    goto LABEL_67;
  v28 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  v115 = (char *)v28;
  if (v28)
  {
    v91 = a3;
    v95 = v20;
    v96 = v19;
    v89 = v17;
    v100 = (void **)(a6 + 16);
    a6 = (char *)(a10 + 16);
    v119 = sub_235F6B254(0, &qword_256399598);
    v120 = a1 & 0xC000000000000001;
    swift_beginAccess();
    swift_beginAccess();
    v88 = v27;
    v27 = (_BYTE *)(a10 + 16);
    swift_beginAccess();
    swift_beginAccess();
    a3 = 0;
    a10 = 0;
    v113 = a1 & 0xFFFFFFFFFFFFFF8;
    v112 = a1 + 32;
    v99 = &v122;
    v118 = 0x8000000235F9E6C0;
    *((_QWORD *)&v29 + 1) = 14;
    v111 = xmmword_235F9D680;
    v94 = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v29 = 136315650;
    v98 = v29;
    v97 = 0x8000000235F9EFE0;
    v108 = a1;
    v114 = a6;
    v107 = v23;
    v17 = v115;
    while (1)
    {
      if (v120)
      {
        v30 = (char *)MEMORY[0x23B7E7818](a3, a1);
      }
      else
      {
        if ((unint64_t)a3 >= *(_QWORD *)(v113 + 16))
          goto LABEL_66;
        v30 = (char *)*(id *)(v112 + 8 * (_QWORD)a3);
      }
      v19 = v30;
      if (__OFADD__(a3++, 1))
      {
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        swift_bridgeObjectRetain();
        v28 = sub_235F9B654();
        goto LABEL_3;
      }
      v20 = objc_msgSend(v30, sel_attributeSet);
      result = (uint64_t)sub_235F67184();
      if (!result)
      {
        __break(1u);
LABEL_69:
        __break(1u);
        return result;
      }
      a6 = (char *)result;
      v33 = objc_msgSend(v20, sel_valueForCustomKey_, result);

      if (!v33)
        goto LABEL_50;
      v121 = v33;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399600);
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_50;
      v34 = a1;
      v23 = (char *)*((_QWORD *)&v123 + 1);
      v35 = v123;
      sub_235F6B254(0, (unint64_t *)&unk_256399620);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399FC0);
      v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = v111;
      *(_QWORD *)(v36 + 32) = sub_235F6B254(0, (unint64_t *)&unk_256399630);
      *(_QWORD *)(v36 + 40) = sub_235F6B254(0, (unint64_t *)&qword_256399FD0);
      *(_QWORD *)(v36 + 48) = sub_235F6B254(0, &qword_256399640);
      *(_QWORD *)(v36 + 56) = sub_235F6B254(0, &qword_256399648);
      type metadata accessor for AMLFeaturesDonationMetadata(0);
      *(_QWORD *)(v36 + 64) = v37;
      type metadata accessor for AMLFeaturesSpecification(0);
      *(_QWORD *)(v36 + 72) = v38;
      *(_QWORD *)(v36 + 80) = sub_235F6B254(0, &qword_256399650);
      sub_235F6B0E4(v35, (unint64_t)v23);
      v116 = v35;
      v117 = v23;
      sub_235F9B528();
      swift_bridgeObjectRelease();
      a1 = v34;
      if (!*((_QWORD *)&v124 + 1))
      {

        v70 = v116;
        a6 = v117;
        sub_235F6B140(v116, (unint64_t)v117);
        sub_235F6B140(v70, (unint64_t)a6);
        sub_235F6B06C((uint64_t)&v123, &qword_256399530);
        v17 = v115;
        v27 = v114;
        goto LABEL_51;
      }
      v39 = swift_dynamicCast();
      v23 = v107;
      v27 = v114;
      if ((v39 & 1) == 0)
      {

        v71 = v116;
        a6 = v117;
        sub_235F6B140(v116, (unint64_t)v117);
        sub_235F6B140(v71, (unint64_t)a6);
        v17 = v115;
        goto LABEL_51;
      }
      v40 = (char *)v121;
      sub_235F72838(v40);
      v17 = v115;
      v105 = v40;
      if (!v41)
        break;
      v42 = v41;
      *(_QWORD *)&v123 = 0;
      sub_235F9B6A8();
      v93 = v42;
      *(_QWORD *)&v123 = v92;
      *((_QWORD *)&v123 + 1) = v91;
      swift_bridgeObjectRetain();
      v43 = v93;
      sub_235F9B420();
      swift_bridgeObjectRelease();
      v110 = *((_QWORD *)&v123 + 1);
      v106 = v123;
      swift_beginAccess();
      if (*(_QWORD *)(v43 + 16))
      {
        v87 = 0;
        v27 = v114;
        while (1)
        {
          swift_bridgeObjectRetain();
          v44 = sub_235F7F384();
          if ((v45 & 1) != 0)
          {
            sub_235F6B0A8(*(_QWORD *)(v43 + 56) + 32 * v44, (uint64_t)&v123);
          }
          else
          {
            v123 = 0u;
            v124 = 0u;
          }
          swift_bridgeObjectRelease();
          if (!*((_QWORD *)&v124 + 1))
            goto LABEL_56;
          sub_235F6B06C((uint64_t)&v123, &qword_256399530);
          if (!*(_QWORD *)(v43 + 16))
            break;
          swift_bridgeObjectRetain();
          v46 = sub_235F7F384();
          if ((v47 & 1) != 0)
          {
            sub_235F6B0A8(*(_QWORD *)(v43 + 56) + 32 * v46, (uint64_t)&v123);
          }
          else
          {
            v123 = 0u;
            v124 = 0u;
          }
          swift_bridgeObjectRelease();
          if (!*((_QWORD *)&v124 + 1))
            goto LABEL_30;
          if (!swift_dynamicCast())
            goto LABEL_31;
          v48 = (uint64_t)v121;
          v49 = v122;
          v50 = v104;
          v51 = v103;
LABEL_32:
          if (v48 == v51 && v49 == v50)
          {
            swift_bridgeObjectRelease();
LABEL_41:
            v55 = *v100;
            v56 = v105;
            *v100 = v105;
            v90 = v56;

            v57 = objc_msgSend(v20, sel_contentCreationDate);
            if (!v57)
            {
              v62 = (uint64_t)v96;
              v63 = v102;
              __swift_storeEnumTagSinglePayload((uint64_t)v96, 1, 1, v102);
LABEL_59:

              v74 = v116;
              v75 = (unint64_t)v117;
              sub_235F6B140(v116, (unint64_t)v117);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v76 = v90;

              sub_235F6B140(v74, v75);
              sub_235F6B06C(v62, &qword_256399490);
              v77 = 1;
              v66 = v63;
              v78 = (uint64_t)v89;
              goto LABEL_63;
            }
            v58 = v57;
            v59 = v101;
            sub_235F9B168();

            v60 = v95;
            v61 = (void (*)(char *, char *, uint64_t))v95[4];
            v62 = (uint64_t)v96;
            v63 = v102;
            v61(v96, v59, v102);
            __swift_storeEnumTagSinglePayload(v62, 0, 1, v63);
            if (__swift_getEnumTagSinglePayload(v62, 1, v63) == 1)
              goto LABEL_59;
            v64 = v23;
            v65 = v109;
            v61(v109, (char *)v62, v63);
            ((void (*)(char *, char *, uint64_t))v60[2])(v64, v65, v63);
            if (a7 <= 0.0)
            {

              v79 = v116;
              v80 = (unint64_t)v117;
              sub_235F6B140(v116, (unint64_t)v117);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v81 = v90;

              sub_235F6B140(v79, v80);
              ((void (*)(char *, uint64_t))v60[1])(v64, v63);
              v66 = v63;
              goto LABEL_62;
            }
            v66 = v63;
            sub_235F9B15C();
            v68 = vabdd_f64(v67, a7);
            v69 = (void (*)(char *, uint64_t))v60[1];
            v69(v64, v66);
            if (v68 <= 900.0)
            {

              v82 = v116;
              v83 = (unint64_t)v117;
              sub_235F6B140(v116, (unint64_t)v117);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v84 = v90;

              sub_235F6B140(v82, v83);
LABEL_62:
              v78 = (uint64_t)v89;
              v61(v89, v109, v66);
              v77 = 0;
LABEL_63:
              v85 = (uint64_t)v88;
              __swift_storeEnumTagSinglePayload(v78, v77, 1, v66);
              sub_235F6B20C(v78, v85);
              *v114 = 1;
              return swift_bridgeObjectRelease();
            }
            v69(v109, v66);
            v43 = v93;
            a1 = v108;
            v27 = v114;
            v23 = v107;
            v17 = v115;
            if (!*(_QWORD *)(v93 + 16))
              goto LABEL_55;
          }
          else
          {
            v53 = sub_235F9B6C0();
            swift_bridgeObjectRelease();
            if ((v53 & 1) != 0)
              goto LABEL_41;
            result = swift_bridgeObjectRelease();
            v54 = v87 + 1;
            if (__OFADD__(v87, 1))
              goto LABEL_69;
            ++v87;
            *(_QWORD *)&v123 = v54;
            sub_235F9B6A8();
            *(_QWORD *)&v123 = v92;
            *((_QWORD *)&v123 + 1) = v91;
            swift_bridgeObjectRetain();
            sub_235F9B420();
            swift_bridgeObjectRelease();
            v110 = *((_QWORD *)&v123 + 1);
            v106 = v123;
            v43 = v93;
            v27 = v114;
            if (!*(_QWORD *)(v93 + 16))
              goto LABEL_55;
          }
        }
        v123 = 0u;
        v124 = 0u;
LABEL_30:
        sub_235F6B06C((uint64_t)&v123, &qword_256399530);
LABEL_31:
        v50 = v104;
        v51 = v103;
        v49 = 0xEE0064496F746F68;
        v48 = 0x5064696C61766E49;
        goto LABEL_32;
      }
      v27 = v114;
LABEL_55:
      v123 = 0u;
      v124 = 0u;
LABEL_56:

      v73 = v116;
      a6 = v117;
      sub_235F6B140(v116, (unint64_t)v117);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v19 = v105;

      sub_235F6B140(v73, (unint64_t)a6);
      sub_235F6B06C((uint64_t)&v123, &qword_256399530);
LABEL_51:
      if (*v27 == 1 || a3 == v17)
        return swift_bridgeObjectRelease();
    }

    v72 = v116;
    a6 = v117;
    sub_235F6B140(v116, (unint64_t)v117);

    sub_235F6B140(v72, (unint64_t)a6);
LABEL_50:

    goto LABEL_51;
  }
  return swift_bridgeObjectRelease();
}

void static AMLSpotlightStorage.metadata(forSession:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_semaphore_t v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void (*v33)(uint64_t, char *, uint64_t);
  NSObject *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  dispatch_semaphore_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;

  v51 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256399490) - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235F9B18C();
  v49 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_10(v9, v42);
  v10 = OUTLINED_FUNCTION_0();
  v11 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v12 = v11;
  v13 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v13 + 16) = v12;
  v52 = v13 + 16;
  v50 = OUTLINED_FUNCTION_33();
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2468]), sel_init);
  v15 = (void *)sub_235F9B444();
  objc_msgSend(v14, sel_setFetchAttributes_, v15);

  v16 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v44 = v14;
  v17 = OUTLINED_FUNCTION_3();
  v20 = sub_235F6ACD8(v17, v18, v19);
  OUTLINED_FUNCTION_36(v20, sel_setPrivateIndex_);
  v21 = (_QWORD *)OUTLINED_FUNCTION_1();
  v21[2] = a1;
  v21[3] = a2;
  v21[4] = v10;
  v21[5] = v13;
  v56 = sub_235F6AF74;
  v57 = v21;
  v22 = MEMORY[0x24BDAC760];
  v54 = MEMORY[0x24BDAC760];
  v55 = 1107296256;
  OUTLINED_FUNCTION_30((uint64_t)sub_235F671F4);
  swift_bridgeObjectRetain();
  v47 = v10;
  swift_retain();
  v46 = v13;
  swift_retain();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_7(v20, sel_setFoundItemsHandler_);
  OUTLINED_FUNCTION_8();
  v23 = OUTLINED_FUNCTION_0();
  v24 = v50;
  *(_QWORD *)(v23 + 16) = v50;
  v56 = sub_235F6B28C;
  v57 = (_QWORD *)v23;
  v54 = v22;
  v55 = 1107296256;
  v25 = OUTLINED_FUNCTION_30((uint64_t)sub_235F67260);
  v26 = v24;
  swift_release();
  objc_msgSend(v20, sel_setCompletionHandler_, v25);
  _Block_release(v25);
  v45 = v20;
  objc_msgSend(v20, sel_start);
  sub_235F9B570();
  v53 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_2();
  v27 = *(_QWORD *)(v10 + 16);
  if (v27 >> 62)
    goto LABEL_17;
  v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v28)
  {
    while (v28 >= 1)
    {
      v43 = v26;
      v26 = (v27 & 0xC000000000000001);
      OUTLINED_FUNCTION_2();
      v29 = 0;
      while (1)
      {
        v30 = v26 ? MEMORY[0x23B7E7818](v29, v27) : *(id *)(v27 + 8 * v29 + 32);
        v31 = v30;
        if (v29 >= *(_QWORD *)(*(_QWORD *)v52 + 16))
          break;
        sub_235F6AE70(*(_QWORD *)v52+ ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))+ *(_QWORD *)(v51 + 72) * v29, (uint64_t)v6);
        if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
        {
          sub_235F6B06C((uint64_t)v6, &qword_256399490);
        }
        else
        {
          v32 = v49;
          v33 = *(void (**)(uint64_t, char *, uint64_t))(v49 + 32);
          v50 = v31;
          v34 = v26;
          v35 = v27;
          v36 = v28;
          v37 = v7;
          v38 = v48;
          v33(v48, v6, v37);
          type metadata accessor for AMLUtilities();
          sub_235F98BD4(v38);
          v39 = v38;
          v7 = v37;
          v28 = v36;
          v27 = v35;
          v26 = v34;
          v31 = v50;
          (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v39, v7);
        }
        objc_allocWithZone((Class)AMLStorageMetadata);
        v40 = v31;
        v41 = sub_235F6AEC4(v40);
        MEMORY[0x23B7E7644]();
        if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          OUTLINED_FUNCTION_16();
        ++v29;
        sub_235F9B48C();
        sub_235F9B468();

        if (v28 == v29)
        {

          swift_bridgeObjectRelease();
          v26 = v43;
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_17:
      swift_bridgeObjectRetain();
      v28 = sub_235F9B654();
      if (!v28)
        goto LABEL_18;
    }
    __break(1u);
  }
  else
  {
LABEL_18:

    swift_bridgeObjectRelease();
LABEL_19:
    swift_release();
    swift_release();

    OUTLINED_FUNCTION_5();
  }
}

id sub_235F68C38(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id result;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v79;
  unint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t *v88;
  _QWORD *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  __int128 v105;
  _QWORD *v106;
  unint64_t v107;
  unint64_t v108;
  _QWORD *v109;
  unint64_t v110;
  uint64_t v111[4];
  id v112;

  v96 = a3;
  v95 = a2;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399490);
  v93 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v97 = (uint64_t)&v86 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v92 = (uint64_t)&v86 - v14;
  v15 = sub_235F9B18C();
  v94 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (uint64_t)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v91 = (char *)&v86 - v19;
  v110 = a1;
  if (a1 >> 62)
  {
LABEL_52:
    swift_bridgeObjectRetain();
    v20 = sub_235F9B654();
  }
  else
  {
    v20 = *(_QWORD *)((v110 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v102 = v20;
  if (!v20)
    return (id)swift_bridgeObjectRelease();
  v86 = v18;
  v90 = v15;
  v87 = v11;
  v89 = a4 + 2;
  v88 = (uint64_t *)(a5 + 16);
  a5 = sub_235F6B254(0, &qword_256399598);
  v11 = (char *)(v110 & 0xC000000000000001);
  v18 = 4;
  v108 = 0x8000000235F9E6C0;
  v109 = 0;
  *((_QWORD *)&v21 + 1) = 14;
  v105 = xmmword_235F9D680;
  v98 = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v21 = 136315650;
  v100 = v21;
  v99 = 0x8000000235F9EFC0;
  v15 = v102;
  v103 = a5;
  v104 = v110 & 0xC000000000000001;
  while (1)
  {
    if (v11)
      v22 = (id)MEMORY[0x23B7E7818](v18 - 4, v110);
    else
      v22 = *(id *)(v110 + 8 * v18);
    v23 = v22;
    v24 = v18 - 3;
    if (__OFADD__(v18 - 4, 1))
    {
      __break(1u);
      goto LABEL_52;
    }
    v25 = objc_msgSend(v22, sel_attributeSet);
    result = sub_235F67184();
    if (!result)
      break;
    v27 = result;
    a4 = objc_msgSend(v25, sel_valueForCustomKey_, result);

    if (a4
      && (v112 = a4,
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399600),
          (swift_dynamicCast() & 1) != 0))
    {
      v29 = v111[0];
      v28 = v111[1];
      sub_235F6B254(0, (unint64_t *)&unk_256399620);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399FC0);
      v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = v105;
      *(_QWORD *)(v30 + 32) = sub_235F6B254(0, (unint64_t *)&unk_256399630);
      *(_QWORD *)(v30 + 40) = sub_235F6B254(0, (unint64_t *)&qword_256399FD0);
      *(_QWORD *)(v30 + 48) = sub_235F6B254(0, &qword_256399640);
      *(_QWORD *)(v30 + 56) = sub_235F6B254(0, &qword_256399648);
      type metadata accessor for AMLFeaturesDonationMetadata(0);
      *(_QWORD *)(v30 + 64) = v31;
      type metadata accessor for AMLFeaturesSpecification(0);
      *(_QWORD *)(v30 + 72) = v32;
      *(_QWORD *)(v30 + 80) = sub_235F6B254(0, &qword_256399650);
      sub_235F6B0E4(v29, v28);
      v106 = (_QWORD *)v29;
      v107 = v28;
      a4 = v109;
      sub_235F9B528();
      v109 = a4;
      if (a4)
      {
        swift_bridgeObjectRelease();
        if (qword_2563993D0 != -1)
          swift_once();
        v33 = sub_235F9B384();
        __swift_project_value_buffer(v33, (uint64_t)qword_25639A730);
        v34 = v109;
        v35 = v109;
        v36 = v34;
        v37 = v34;
        v38 = v34;
        v39 = sub_235F9B36C();
        v40 = sub_235F9B51C();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = swift_slowAlloc();
          a4 = (_QWORD *)swift_slowAlloc();
          v101 = swift_slowAlloc();
          v111[0] = v101;
          *(_DWORD *)v41 = v100;
          sub_235F7EC30(0xD000000000000015, v99, v111);
          *(_QWORD *)(v41 + 4) = v42;
          *(_WORD *)(v41 + 12) = 2112;
          v43 = v34;
          v44 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)(v41 + 14) = v44;
          *a4 = v44;

          *(_WORD *)(v41 + 22) = 2080;
          swift_getErrorValue();
          v45 = sub_235F9B6E4();
          sub_235F7EC30(v45, v46, v111);
          *(_QWORD *)(v41 + 24) = v47;
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_235F59000, v39, v40, "%s: Encountered error while unarchiving Metadata: %@, description: %s", (uint8_t *)v41, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
          swift_arrayDestroy();
          MEMORY[0x23B7E7EE4](a4, -1, -1);
          v48 = v101;
          swift_arrayDestroy();
          MEMORY[0x23B7E7EE4](v48, -1, -1);
          MEMORY[0x23B7E7EE4](v41, -1, -1);

          v50 = (uint64_t)v106;
          v49 = v107;
          sub_235F6B140((uint64_t)v106, v107);

          sub_235F6B140(v50, v49);
        }
        else
        {
          v60 = (uint64_t)v106;
          v59 = v107;
          sub_235F6B140((uint64_t)v106, v107);

          sub_235F6B140(v60, v59);
        }
        v109 = 0;
        v15 = v102;
      }
      else
      {
        swift_bridgeObjectRelease();
        if (v111[3])
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v51 = v112;
            v52 = objc_msgSend(v51, sel_sessionId);
            v53 = sub_235F9B3FC();
            v55 = v54;

            if (v53 == v95 && v55 == v96)
            {
              swift_bridgeObjectRelease();
              v15 = v102;
LABEL_34:
              v65 = v89;
              swift_beginAccess();
              v66 = v51;
              MEMORY[0x23B7E7644]();
              if (*(_QWORD *)((*v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_235F9B474();
              sub_235F9B48C();
              sub_235F9B468();
              swift_endAccess();
              v67 = objc_msgSend(v25, sel_contentCreationDate);
              if (v67)
              {
                v68 = v67;
                v69 = v86;
                sub_235F9B168();

                v70 = *(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 32);
                v71 = v92;
                v72 = v69;
                v73 = v90;
                v70(v92, v72, v90);
                __swift_storeEnumTagSinglePayload(v71, 0, 1, v73);
                if (__swift_getEnumTagSinglePayload(v71, 1, v73) != 1)
                {
                  v74 = v91;
                  v70((uint64_t)v91, v71, v73);
                  v75 = (uint64_t)v87;
                  (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v87, v74, v73);
                  __swift_storeEnumTagSinglePayload(v75, 0, 1, v73);
                  v76 = v88;
                  swift_beginAccess();
                  v77 = *v76;
                  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  *v76 = v77;
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                  {
                    v77 = sub_235F7DF9C();
                    *v88 = v77;
                  }
                  a5 = v103;
                  v79 = *(_QWORD *)(v77 + 16);
                  if (v79 >= *(_QWORD *)(v77 + 24) >> 1)
                  {
                    v77 = sub_235F7DF9C();
                    *v88 = v77;
                  }
                  *(_QWORD *)(v77 + 16) = v79 + 1;
                  sub_235F6B1C4((uint64_t)v87, v77+ ((*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80))+ *(_QWORD *)(v93 + 72) * v79);
                  swift_endAccess();

                  a4 = v106;
                  v80 = v107;
                  sub_235F6B140((uint64_t)v106, v107);

                  sub_235F6B140((uint64_t)a4, v80);
                  (*(void (**)(char *, uint64_t))(v94 + 8))(v91, v90);
LABEL_49:
                  v11 = (char *)v104;
                  goto LABEL_29;
                }
              }
              else
              {
                v71 = v92;
                v73 = v90;
                __swift_storeEnumTagSinglePayload(v92, 1, 1, v90);
              }
              sub_235F6B06C(v71, &qword_256399490);
              __swift_storeEnumTagSinglePayload(v97, 1, 1, v73);
              v81 = v88;
              swift_beginAccess();
              v82 = *v81;
              v83 = swift_isUniquelyReferenced_nonNull_native();
              *v81 = v82;
              if ((v83 & 1) == 0)
              {
                v82 = sub_235F7DF9C();
                *v88 = v82;
              }
              a5 = v103;
              v84 = *(_QWORD *)(v82 + 16);
              if (v84 >= *(_QWORD *)(v82 + 24) >> 1)
              {
                v82 = sub_235F7DF9C();
                *v88 = v82;
              }
              *(_QWORD *)(v82 + 16) = v84 + 1;
              sub_235F6B1C4(v97, v82+ ((*(unsigned __int8 *)(v93 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80))+ *(_QWORD *)(v93 + 72) * v84);
              swift_endAccess();

              a4 = v106;
              v85 = v107;
              sub_235F6B140((uint64_t)v106, v107);

              sub_235F6B140((uint64_t)a4, v85);
              goto LABEL_49;
            }
            v57 = sub_235F9B6C0();
            swift_bridgeObjectRelease();
            v15 = v102;
            if ((v57 & 1) != 0)
              goto LABEL_34;

            a4 = v106;
            v58 = v107;
            sub_235F6B140((uint64_t)v106, v107);

            sub_235F6B140((uint64_t)a4, v58);
          }
          else
          {

            v64 = (uint64_t)v106;
            v63 = v107;
            sub_235F6B140((uint64_t)v106, v107);
            sub_235F6B140(v64, v63);
          }
        }
        else
        {

          v62 = (uint64_t)v106;
          v61 = v107;
          sub_235F6B140((uint64_t)v106, v107);
          sub_235F6B140(v62, v61);
          sub_235F6B06C((uint64_t)v111, &qword_256399530);
        }
      }
      a5 = v103;
      v11 = (char *)v104;
    }
    else
    {

    }
LABEL_29:
    ++v18;
    if (v24 == v15)
      return (id)swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t static AMLSpotlightStorage.features(forSpotlightId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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

  v4 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v4 + 16) = 0;
  v5 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v5 + 16) = 0;
  v6 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v6 + 16) = 0;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2468]), sel_init);
  v8 = (void *)sub_235F9B444();
  objc_msgSend(v7, sel_setFetchAttributes_, v8);

  v9 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v24 = v7;
  v10 = OUTLINED_FUNCTION_3();
  v13 = sub_235F6ACD8(v10, v11, v12);
  OUTLINED_FUNCTION_36(v13, sel_setPrivateIndex_);
  v14 = (_QWORD *)OUTLINED_FUNCTION_1();
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = v6;
  v14[5] = v5;
  v14[6] = v4;
  OUTLINED_FUNCTION_31((uint64_t)sub_235F671F4, v4, (uint64_t)v24, v27, v29, v31, v33, v35, v37, MEMORY[0x24BDAC760], 1107296256, v39, v41);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_7(v13, sel_setFoundItemsHandler_);
  OUTLINED_FUNCTION_8();
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v15;
  v16 = OUTLINED_FUNCTION_31((uint64_t)sub_235F67260, v23, v25, v28, v30, v32, v34, v36, v38, MEMORY[0x24BDAC760], 1107296256, v40, v42);
  v17 = v15;
  swift_release();
  objc_msgSend(v13, sel_setCompletionHandler_, v16);
  _Block_release(v16);
  objc_msgSend(v13, sel_start);
  v18 = sub_235F9B534();
  type metadata accessor for AMLStorageFeatures(v18);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2();
  v19 = *(id *)(v6 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  _sSo18AMLStorageFeaturesC6AeroMLE15featureProvider05batchF005arrayF0ABSo09MLFeatureF0_pSg_So07MLBatchF0_pSgSo012MLArrayBatchF0CSgtcfC_0();
  v21 = v20;
  swift_release();
  swift_release();
  swift_release();

  return v21;
}

void sub_235F69B6C(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id *v27;
  id *v28;
  id *v29;
  id *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  void **v53;
  unint64_t v54;
  id v55;
  id v56;
  uint64_t v57[3];
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;

  v11 = (unint64_t)a1;
  if (!((unint64_t)a1 >> 62))
  {
    v12 = *(_QWORD *)(((unint64_t)a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v12 = sub_235F9B654();
  if (!v12)
    goto LABEL_14;
LABEL_3:
  v52 = (uint64_t *)(a5 + 16);
  v53 = (void **)(a4 + 16);
  v51 = (uint64_t *)(a6 + 16);
  v13 = v11 & 0xC000000000000001;
  v14 = 4;
  while (1)
  {
    if (v13)
      v15 = (id)MEMORY[0x23B7E7818](v14 - 4, v11);
    else
      v15 = *(id *)(v11 + 8 * v14);
    v16 = (void *)(v14 - 3);
    if (__OFADD__(v14 - 4, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    v56 = v15;
    v17 = objc_msgSend(v15, sel_uniqueIdentifier);
    v18 = sub_235F9B3FC();
    v20 = v19;

    if (v18 == a2 && v20 == a3)
      break;
    v22 = sub_235F9B6C0();
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
      goto LABEL_16;

    ++v14;
    if (v16 == (void *)v12)
      goto LABEL_14;
  }
  swift_bridgeObjectRelease();
LABEL_16:
  v12 = 0xD000000000000012;
  v16 = v56;
  v55 = objc_msgSend(v56, sel_attributeSet, v51);
  sub_235F6B254(0, &qword_256399598);
  v23 = sub_235F67184();
  if (!v23)
  {
    __break(1u);
    return;
  }
  v24 = v23;
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v55, sel_valueForCustomKey_, v24);

  if (!v25)
  {

    return;
  }
  v58 = (uint64_t)v25;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399600);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_32;
  v14 = v60;
  v13 = v61;
  type metadata accessor for AMLFeaturesDonation(0);
  sub_235F6B0E4(v60, v61);
  v11 = 0;
  if (static AMLFeaturesDonation.decodeModelDataAsFeatureDictionaries(from:)())
  {
    v43 = objc_allocWithZone(MEMORY[0x24BDBFF60]);
    swift_bridgeObjectRetain();
    v45 = sub_235F725C8();
    swift_beginAccess();
    v46 = *v53;
    *v53 = v45;

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_235F9D690;
    v58 = 540689478;
    v59 = 0xE400000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399940);
    sub_235F9B3D8();
    sub_235F9B420();
    swift_bridgeObjectRelease();
    v16 = v56;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v47 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v47 + 32) = 540689478;
    *(_QWORD *)(v47 + 40) = 0xE400000000000000;
    sub_235F9B720();
    swift_bridgeObjectRelease();
    v48 = v52;
  }
  else
  {
    v44 = static AMLFeaturesDonation.decodeModelDataAsBatchProvider(from:)(v60, v61);
    v48 = v52;
    swift_beginAccess();
    *v52 = v44;
    swift_unknownObjectRelease();
  }
  swift_beginAccess();
  if (*v48 || (swift_beginAccess(), *v53))
  {
    sub_235F6B140(v14, v13);
    sub_235F6B140(v14, v13);
LABEL_32:

    return;
  }
LABEL_34:
  v49 = static AMLFeaturesDonation.decodeModelDataAsFeatureProvider(from:)(v14, v13);
  if (v11)
  {
    if (qword_2563993D0 != -1)
      swift_once();
    v26 = sub_235F9B384();
    __swift_project_value_buffer(v26, (uint64_t)qword_25639A730);
    v27 = (id *)(id)v11;
    v28 = (id *)(id)v11;
    v29 = (id *)(id)v11;
    v30 = (id *)(id)v11;
    v31 = sub_235F9B36C();
    v32 = sub_235F9B51C();
    if (os_log_type_enabled(v31, v32))
    {
      v54 = v13;
      v33 = swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      v35 = v14;
      v36 = swift_slowAlloc();
      v57[0] = v36;
      *(_DWORD *)v33 = 136315650;
      sub_235F7EC30(v12 + 7, 0x8000000235F9EF80, v57);
      v62 = v37;
      sub_235F9B5AC();
      *(_WORD *)(v33 + 12) = 2112;
      v38 = (id *)(id)v11;
      v39 = _swift_stdlib_bridgeErrorToNSError();
      v62 = v39;
      sub_235F9B5AC();
      *v34 = v39;

      *(_WORD *)(v33 + 22) = 2080;
      swift_getErrorValue();
      v40 = sub_235F9B6E4();
      sub_235F7EC30(v40, v41, v57);
      v62 = v42;
      sub_235F9B5AC();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_235F59000, v31, v32, "%s: Encountered error while unarchiving FeaturesDonation: %@, description: %s", (uint8_t *)v33, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      swift_arrayDestroy();
      MEMORY[0x23B7E7EE4](v34, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B7E7EE4](v36, -1, -1);
      MEMORY[0x23B7E7EE4](v33, -1, -1);

      sub_235F6B140(v35, v54);
      sub_235F6B140(v35, v54);
    }
    else
    {
      sub_235F6B140(v14, v13);

      sub_235F6B140(v14, v13);
    }
  }
  else
  {
    v50 = v49;
    sub_235F6B140(v14, v13);
    sub_235F6B140(v14, v13);

    swift_beginAccess();
    *v51 = v50;
    swift_unknownObjectRelease();
  }
}

void _sSo18AMLStorageFeaturesC6AeroMLE15featureProvider05batchF005arrayF0ABSo09MLFeatureF0_pSg_So07MLBatchF0_pSgSo012MLArrayBatchF0CSgtcfC_0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_12()), sel_initWithFeatureProvider_batchProvider_arrayProvider_, v2, v1, v0);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_24();
}

void sub_235F6A390()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = MEMORY[0x24BEE4AF8];
  v0 = (void *)OUTLINED_FUNCTION_13();
  v1 = (void *)OUTLINED_FUNCTION_11();
  v47 = v0;
  v2 = objc_msgSend(v0, sel_metadataForSession_, v1);

  type metadata accessor for AMLStorageMetadata(v3);
  v4 = sub_235F9B450();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_235F9B654();
    OUTLINED_FUNCTION_17();
    if (v5)
      goto LABEL_3;
LABEL_37:
    OUTLINED_FUNCTION_17();
LABEL_38:
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_20();
    return;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    goto LABEL_37;
LABEL_3:
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v52 = v4 & 0xC000000000000001;
    v10 = &selRef_setArrayProvider_;
    v43 = 0x8000000235F9EF60;
    v44 = MEMORY[0x24BEE4AD8] + 8;
    v45 = v5;
    v46 = v4;
    while (1)
    {
      if (v52)
        v11 = (id)MEMORY[0x23B7E7818](v9, v4);
      else
        v11 = *(id *)(v4 + 8 * v9 + 32);
      v12 = v11;
      v13 = objc_msgSend(v11, v10[19]);
      sub_235F9B3FC();

      v14 = objc_msgSend(v12, sel_donationMetadata);
      sub_235F72838(v14);
      if (v15)
      {
        v16 = v15;
        OUTLINED_FUNCTION_25();
        OUTLINED_FUNCTION_20();
        if (*(_QWORD *)(v16 + 16)
          && (v17 = sub_235F7F384(), (v18 & 1) != 0)
          && (OUTLINED_FUNCTION_18(v17, v18, v19, v20, v21, v22, v23, v24, v42, v43, v44, v45, v46, (uint64_t)v47, (uint64_t)v48, v49, v50), (swift_dynamicCast() & 1) != 0))
        {
          v8 = v54;
        }
        else
        {
          v8 = 0;
        }
        if (qword_256399438 != -1)
          swift_once();
        if (*(_QWORD *)(v16 + 16))
        {
          swift_bridgeObjectRetain();
          v25 = sub_235F7F384();
          if ((v26 & 1) != 0)
          {
            OUTLINED_FUNCTION_18(v25, v26, v27, v28, v29, v30, v31, v32, v42, v43, v44, v45, v46, (uint64_t)v47, (uint64_t)v48, v49, v50);
          }
          else
          {
            v55 = 0u;
            v56 = 0u;
          }
          OUTLINED_FUNCTION_20();
        }
        else
        {
          v55 = 0u;
          v56 = 0u;
        }
        OUTLINED_FUNCTION_35();
        if (!*((_QWORD *)&v56 + 1))
        {
          sub_235F6B06C((uint64_t)&v55, &qword_256399530);
LABEL_28:
          v6 = 0;
          v7 = 0;
          if (!v8)
            goto LABEL_33;
          goto LABEL_29;
        }
        if ((swift_dynamicCast() & 1) == 0)
          goto LABEL_28;
        v6 = v53;
        v7 = v54;
      }
      if (!v8)
        goto LABEL_33;
LABEL_29:
      if (v7)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v33 = (void *)sub_235F9B3F0();
        v51 = v8;
        OUTLINED_FUNCTION_20();
        v34 = objc_msgSend(v47, sel_featuresForSpotlightId_, v33);

        v49 = v6;
        v35 = (void *)sub_235F9B3F0();
        v50 = v7;
        OUTLINED_FUNCTION_25();
        v36 = objc_msgSend(v47, sel_featuresConfigurationForConfigurationId_, v35);

        v48 = v36;
        v37 = OUTLINED_FUNCTION_6((uint64_t)v48, sel_featureProvider);
        v38 = OUTLINED_FUNCTION_6((uint64_t)v37, sel_batchProvider);
        v39 = OUTLINED_FUNCTION_6((uint64_t)v38, sel_arrayProvider);
        v40 = objc_allocWithZone((Class)AMLClientDonations);
        v41 = v14;
        sub_235F82E60();
        MEMORY[0x23B7E7644]();
        if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          OUTLINED_FUNCTION_16();
        sub_235F9B48C();
        sub_235F9B468();

        v12 = v41;
        v14 = v48;
        v5 = v45;
        v4 = v46;
        v10 = &selRef_setArrayProvider_;
        v7 = v50;
        v8 = v51;
        goto LABEL_34;
      }
LABEL_33:
      swift_bridgeObjectRelease();
LABEL_34:
      ++v9;

      if (v5 == v9)
      {
        OUTLINED_FUNCTION_17();
        goto LABEL_38;
      }
    }
  }
  __break(1u);
}

uint64_t sub_235F6A8B4(double a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v2 = (void *)OUTLINED_FUNCTION_13();
  v3 = (void *)OUTLINED_FUNCTION_11();
  v4 = objc_msgSend(v2, sel_metadataForPhotoId_aroundTime_, v3, a1);

  if (!v4)
    return 0;
  v5 = objc_msgSend(v4, sel_donationMetadata);
  v6 = objc_msgSend(v4, sel_donationTime);
  sub_235F9B3FC();

  sub_235F72838(v5);
  v8 = v7;
  if (!v7)
    goto LABEL_13;
  sub_235F73174(v7, &v24);
  if (v25)
  {
    if ((OUTLINED_FUNCTION_9() & 1) != 0)
    {
      v9 = v23;
      goto LABEL_8;
    }
  }
  else
  {
    sub_235F6B06C((uint64_t)&v24, &qword_256399530);
  }
  v9 = 0;
LABEL_8:
  if (qword_256399438 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_235F73174(v8, &v24);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23();
  if (!v25)
  {
    sub_235F6B06C((uint64_t)&v24, &qword_256399530);
LABEL_17:
    v10 = 0;
    if (!v9)
      goto LABEL_13;
    goto LABEL_18;
  }
  if ((OUTLINED_FUNCTION_9() & 1) == 0)
    goto LABEL_17;
  v10 = v23;
  if (!v9)
  {
LABEL_13:

    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_23();
    return 0;
  }
LABEL_18:
  if (v10)
  {
    v13 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v2, sel_featuresForSpotlightId_, v13);

    v15 = (void *)sub_235F9B3F0();
    OUTLINED_FUNCTION_23();
    v16 = objc_msgSend(v2, sel_featuresConfigurationForConfigurationId_, v15);

    v17 = v16;
    v18 = OUTLINED_FUNCTION_6((uint64_t)v17, sel_featureProvider);
    v19 = OUTLINED_FUNCTION_6((uint64_t)v18, sel_batchProvider);
    v20 = OUTLINED_FUNCTION_6((uint64_t)v19, sel_arrayProvider);
    v21 = objc_allocWithZone((Class)AMLClientDonations);
    sub_235F82E60();
    v11 = v22;

    return v11;
  }
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_35();
  return 0;
}

id sub_235F6ABF8(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, double))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = sub_235F9B3FC();
  v9 = v8;
  swift_getObjCClassMetadata();
  v10 = (void *)a5(v7, v9, a1);
  OUTLINED_FUNCTION_17();
  return v10;
}

id _sSo18AMLStorageMetadataC6AeroMLEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_13()), sel_init);
}

id AMLSpotlightStorage.init()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  objc_super v9;

  v9.super_class = (Class)AMLSpotlightStorage;
  return OUTLINED_FUNCTION_22(a1, sel_init, a3, a4, a5, a6, a7, a8, v9);
}

id sub_235F6ACD8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;

  v5 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithQueryString_queryContext_, v5, a3);

  return v6;
}

uint64_t sub_235F6AD38()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_29();
  return swift_deallocObject();
}

void sub_235F6AD5C(unint64_t a1)
{
  uint64_t *v1;

  sub_235F66A8C(a1, v1[2], v1[3], v1[4]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void sub_235F6AD80()
{
  sub_235F9B57C();
  OUTLINED_FUNCTION_34();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E7E30]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_235F6ADE8()
{
  return swift_deallocObject();
}

uint64_t sub_235F6ADF8()
{
  OUTLINED_FUNCTION_19();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F6AE38(unint64_t a1)
{
  uint64_t v1;

  return sub_235F676C4(a1, *(_QWORD *)(v1 + 16), *(char **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(char **)(v1 + 48), *(double *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80));
}

uint64_t sub_235F6AE70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

id sub_235F6AEC4(void *a1)
{
  void *v1;
  void *v3;
  id v4;

  v3 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_initWithDonationMetadata_donationTime_, a1, v3);

  return v4;
}

uint64_t sub_235F6AF2C()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  return swift_deallocObject();
}

uint64_t sub_235F6AF48()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_29();
  swift_release();
  return swift_deallocObject();
}

id sub_235F6AF74(unint64_t a1)
{
  uint64_t v1;

  return sub_235F68C38(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD **)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_235F6AF80()
{
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_21();
  return swift_deallocObject();
}

uint64_t sub_235F6AF9C()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_29();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_235F6AFD0(id *a1)
{
  uint64_t *v1;

  sub_235F69B6C(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

void sub_235F6AFE0()
{
  uint64_t v0;

  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t type metadata accessor for AMLStorageFeatures(uint64_t a1)
{
  return sub_235F6B254(a1, &qword_2563994F0);
}

uint64_t type metadata accessor for AMLStorageMetadata(uint64_t a1)
{
  return sub_235F6B254(a1, &qword_2563994C0);
}

uint64_t type metadata accessor for AMLSpotlightStorage(uint64_t a1)
{
  return sub_235F6B254(a1, &qword_256399520);
}

void type metadata accessor for BMPhotosSearchType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256399528)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256399528);
  }
}

uint64_t sub_235F6B06C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235F6B0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235F6B0E4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_235F6B140(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_235F6B1C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F6B20C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F6B254(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return 0x296575727428;
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + v1) = a1;
  return swift_unknownObjectRelease();
}

id OUTLINED_FUNCTION_6(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_7(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

void OUTLINED_FUNCTION_8()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 224) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_getObjCClassFromMetadata();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_getObjCClassFromMetadata();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_235F9B474();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  return sub_235F6B0A8(*(_QWORD *)(v17 + 56) + 32 * a1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_22(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_27@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return _Block_copy((const void *)(v2 - 152));
}

void *OUTLINED_FUNCTION_31@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char aBlock, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  a12 = a1;
  a13 = v13;
  return _Block_copy(&aBlock);
}

void *OUTLINED_FUNCTION_32@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

dispatch_semaphore_t OUTLINED_FUNCTION_33()
{
  return dispatch_semaphore_create(0);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_36(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

uint64_t sub_235F6B4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, NSObject *a14)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  char *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  dispatch_group_t v35;
  uint64_t v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void *v48;
  id v49;
  NSObject *v50;
  id v51;
  void *v52;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  dispatch_group_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD aBlock[7];

  v72 = a8;
  v57 = a7;
  v60 = a5;
  v70 = a13;
  v71 = a12;
  v58 = a6;
  v59 = a14;
  v68 = a10;
  v69 = a11;
  v56 = a9;
  v15 = OUTLINED_FUNCTION_0_0();
  v65 = *(_QWORD *)(v15 - 8);
  v66 = v15;
  v67 = *(_QWORD *)(v65 + 64);
  MEMORY[0x24BDAC7A8](v15);
  v64 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_235F9B1B0();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC2480]), sel_init);
  v22 = (void *)sub_235F9B144();
  objc_msgSend(v21, sel_setContentCreationDate_, v22);

  v23 = (void *)sub_235F9B0E4();
  v24 = (void *)sub_235F9B3F0();
  objc_msgSend(v21, sel_setAttribute_forKey_, v23, v24);

  sub_235F9B1A4();
  v25 = sub_235F9B198();
  v62 = v26;
  v63 = v25;
  v27 = v26;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  v28 = objc_allocWithZone(MEMORY[0x24BDC2478]);
  swift_bridgeObjectRetain();
  v29 = v21;
  v61 = v29;
  v30 = v72;
  swift_bridgeObjectRetain();
  v31 = sub_235F6C238(v25, v27, a7, v30, v29);
  v32 = objc_msgSend(v31, sel_attributeSet);
  v33 = v56;
  v34 = (void *)sub_235F9B144();
  objc_msgSend(v32, sel_setContentCreationDate_, v34);

  sub_235F6B254(0, &qword_256399760);
  swift_bridgeObjectRetain();
  v60 = sub_235F6B8F0();
  v35 = v59;
  dispatch_group_enter(v59);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399768);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_235F9D6F0;
  *(_QWORD *)(v36 + 32) = v31;
  aBlock[0] = v36;
  sub_235F9B468();
  sub_235F6B254(0, &qword_256399658);
  v37 = v31;
  v55 = v37;
  v58 = sub_235F9B444();
  swift_bridgeObjectRelease();
  v38 = v64;
  v39 = v65;
  v40 = v33;
  v41 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v64, v40, v66);
  v42 = (*(unsigned __int8 *)(v39 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  OUTLINED_FUNCTION_1_0();
  v43 = (char *)swift_allocObject();
  v44 = v69;
  *((_QWORD *)v43 + 2) = v68;
  *((_QWORD *)v43 + 3) = v44;
  v45 = v57;
  *((_QWORD *)v43 + 4) = v37;
  *((_QWORD *)v43 + 5) = v45;
  *((_QWORD *)v43 + 6) = v72;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(&v43[v42], v38, v41);
  v46 = &v21[(_QWORD)v43];
  v47 = v70;
  *(_QWORD *)v46 = v71;
  *((_QWORD *)v46 + 1) = v47;
  *(_QWORD *)&v43[v27] = v35;
  aBlock[4] = sub_235F6C384;
  aBlock[5] = v43;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F67260;
  aBlock[3] = &block_descriptor_0;
  v48 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v49 = v55;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v50 = v35;
  swift_release();
  v51 = v60;
  v52 = (void *)v58;
  objc_msgSend(v60, sel_indexSearchableItems_completionHandler_, v58, v48);
  _Block_release(v48);

  return v63;
}

id sub_235F6B8F0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithName_, v1);

  return v2;
}

void sub_235F6B960(void *a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, NSObject *a10)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  os_log_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  os_log_t v81;
  uint64_t v82;
  _QWORD *v83;
  os_log_t v84;
  os_log_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  dispatch_group_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v88 = a2;
  v89 = a5;
  v91 = a10;
  v92 = a9;
  v16 = sub_235F9B18C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v83 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v83 - v21;
  if (a1)
  {
    v87 = a8;
    v23 = a1;
    if (qword_256399418 != -1)
      swift_once();
    v24 = sub_235F9B384();
    __swift_project_value_buffer(v24, (uint64_t)qword_25639A7F8);
    v90 = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, a7, v16);
    v25 = a1;
    v26 = a1;
    swift_bridgeObjectRetain();
    v27 = a4;
    v28 = a6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29 = a1;
    swift_bridgeObjectRetain();
    v30 = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31 = a1;
    v32 = sub_235F9B36C();
    v33 = sub_235F9B51C();
    v34 = v33;
    if (os_log_type_enabled(v32, v33))
    {
      v35 = swift_slowAlloc();
      v85 = v32;
      v36 = v35;
      v83 = (_QWORD *)swift_slowAlloc();
      v86 = swift_slowAlloc();
      v94 = v86;
      *(_DWORD *)v36 = 136316674;
      LODWORD(v84) = v34;
      swift_bridgeObjectRetain();
      sub_235F7EC30(v88, a3, &v94);
      v93 = v37;
      sub_235F9B5AC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2080;
      v38 = objc_msgSend(v30, sel_uniqueIdentifier);
      v39 = sub_235F9B3FC();
      v88 = v16;
      v40 = v39;
      v41 = v28;
      v43 = v42;

      sub_235F7EC30(v40, v43, &v94);
      v93 = v44;
      sub_235F9B5AC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 22) = 2080;
      swift_bridgeObjectRetain();
      sub_235F7EC30(v89, v41, &v94);
      v93 = v45;
      sub_235F9B5AC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 32) = 2080;
      sub_235F988C8();
      sub_235F7EC30(v46, v47, &v94);
      v93 = v48;
      sub_235F9B5AC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v20, v88);
      *(_WORD *)(v36 + 42) = 2080;
      v49 = v92;
      swift_bridgeObjectRetain();
      sub_235F7EC30(v87, v49, &v94);
      v93 = v50;
      sub_235F9B5AC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 52) = 2112;
      v51 = a1;
      v52 = _swift_stdlib_bridgeErrorToNSError();
      v93 = v52;
      sub_235F9B5AC();
      v53 = v83;
      *v83 = v52;

      *(_WORD *)(v36 + 62) = 2080;
      swift_getErrorValue();
      v54 = sub_235F9B6E4();
      sub_235F7EC30(v54, v55, &v94);
      v93 = v56;
      sub_235F9B5AC();
      swift_bridgeObjectRelease();

      v57 = v85;
      _os_log_impl(&dword_235F59000, v85, (os_log_type_t)v84, "%s: Index %s from bundle:%s at time: %s for session: %s has indexing error: %@, description: %s", (uint8_t *)v36, 0x48u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      swift_arrayDestroy();
      MEMORY[0x23B7E7EE4](v53, -1, -1);
      v58 = v86;
      swift_arrayDestroy();
      MEMORY[0x23B7E7EE4](v58, -1, -1);
      MEMORY[0x23B7E7EE4](v36, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v20, v16);
      swift_bridgeObjectRelease_n();

    }
  }
  else
  {
    if (qword_256399418 != -1)
      swift_once();
    v59 = sub_235F9B384();
    __swift_project_value_buffer(v59, (uint64_t)qword_25639A7F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v22, a7, v16);
    swift_bridgeObjectRetain_n();
    v60 = a4;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v61 = v60;
    v62 = sub_235F9B36C();
    v63 = sub_235F9B510();
    v64 = v63;
    if (os_log_type_enabled(v62, v63))
    {
      v65 = swift_slowAlloc();
      v90 = v17;
      v66 = v65;
      v86 = swift_slowAlloc();
      v94 = v86;
      *(_DWORD *)v66 = 136316162;
      LODWORD(v85) = v64;
      swift_bridgeObjectRetain();
      sub_235F7EC30(v88, a3, &v94);
      v93 = v67;
      v87 = a8;
      sub_235F9B5AC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v66 + 12) = 2080;
      v68 = objc_msgSend(v61, sel_uniqueIdentifier);
      v69 = sub_235F9B3FC();
      v88 = v16;
      v70 = v92;
      v84 = v62;
      v71 = a6;
      v72 = v69;
      v74 = v73;

      sub_235F7EC30(v72, v74, &v94);
      v93 = v75;
      sub_235F9B5AC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 22) = 2080;
      swift_bridgeObjectRetain();
      sub_235F7EC30(v89, v71, &v94);
      v93 = v76;
      sub_235F9B5AC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v66 + 32) = 2080;
      sub_235F988C8();
      sub_235F7EC30(v77, v78, &v94);
      v93 = v79;
      sub_235F9B5AC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v22, v88);
      *(_WORD *)(v66 + 42) = 2080;
      swift_bridgeObjectRetain();
      sub_235F7EC30(v87, v70, &v94);
      v93 = v80;
      sub_235F9B5AC();
      swift_bridgeObjectRelease_n();
      v81 = v84;
      _os_log_impl(&dword_235F59000, v84, (os_log_type_t)v85, "%s: Index %s from bundle: %s at time: %s for session: %s success!", (uint8_t *)v66, 0x34u);
      v82 = v86;
      swift_arrayDestroy();
      MEMORY[0x23B7E7EE4](v82, -1, -1);
      MEMORY[0x23B7E7EE4](v66, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);

      swift_bridgeObjectRelease_n();
    }
  }
  dispatch_group_leave(v91);
}

uint64_t sub_235F6C208()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AMLFeaturesStorage()
{
  return objc_opt_self();
}

id sub_235F6C238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v8;
  void *v9;
  id v10;

  if (!a2)
  {
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
LABEL_6:
  v10 = objc_msgSend(v5, sel_initWithUniqueIdentifier_domainIdentifier_attributeSet_, v8, v9, a5);

  return v10;
}

uint64_t sub_235F6C2E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = OUTLINED_FUNCTION_0_0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v2);
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_235F6C384(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(OUTLINED_FUNCTION_0_0() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_235F6B960(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + v5 + 8), *(NSObject **)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_235F9B18C();
}

_QWORD *sub_235F6C430()
{
  void *v0;
  unint64_t v1;
  char v2;
  void *v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t i;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  id v64;
  unint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  unint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  unint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103[2];
  __int128 v104;
  uint64_t v105;

  v3 = v0;
  v4 = (_QWORD *)sub_235F9B3E4();
  v100 = v3;
  v5 = objc_msgSend(v3, sel_featureNames);
  v6 = sub_235F9B4BC();

  v7 = 0;
  v98 = v6 + 56;
  v101 = v6;
  OUTLINED_FUNCTION_21_0();
  v10 = v9 & v8;
  v99 = (unint64_t)(v11 + 63) >> 6;
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_27_0();
  v96 = v12;
  v97 = v13;
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_27_0();
  v94 = v14;
  v95 = v15;
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_27_0();
  v92 = v16;
  v93 = v17;
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_27_0();
  v90 = v18;
  v91 = v19;
  if (!v10)
    goto LABEL_3;
LABEL_2:
  v20 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v20 | (v7 << 6); ; i = __clz(__rbit64(v23)) + (v7 << 6))
  {
    v25 = (uint64_t *)(*(_QWORD *)(v101 + 48) + 16 * i);
    v27 = *v25;
    v26 = v25[1];
    OUTLINED_FUNCTION_17_0();
    v28 = (void *)sub_235F9B3F0();
    v29 = objc_msgSend(v100, sel_featureValueForName_, v28);

    if (v29)
    {
      v31 = OUTLINED_FUNCTION_36_0(v30, sel_type);
      switch((unint64_t)v31)
      {
        case 0uLL:
          OUTLINED_FUNCTION_9_0(MEMORY[0x24BEE0D00]);
          *(_QWORD *)&v104 = v32 - 6;
          *((_QWORD *)&v104 + 1) = v95;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_125;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_24;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v34;
LABEL_24:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v36 = (_QWORD *)(v4[6] + 16 * v1);
          *v36 = v27;
          v36[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_135;
        case 1uLL:
          v64 = OUTLINED_FUNCTION_36_0((uint64_t)v31, sel_int64Value);
          v105 = MEMORY[0x24BEE4008];
          *(_QWORD *)&v104 = v64;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_129;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_68;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v65;
LABEL_68:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v66 = (_QWORD *)(v4[6] + 16 * v1);
          *v66 = v27;
          v66[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_139;
        case 2uLL:
          objc_msgSend(v29, sel_doubleValue);
          v105 = MEMORY[0x24BEE13C8];
          *(_QWORD *)&v104 = v56;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_127;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_50;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v57;
LABEL_50:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v58 = (_QWORD *)(v4[6] + 16 * v1);
          *v58 = v27;
          v58[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_137;
        case 3uLL:
          v59 = OUTLINED_FUNCTION_36_0((uint64_t)v31, sel_stringValue);
          v60 = sub_235F9B3FC();
          v1 = v61;

          v105 = MEMORY[0x24BEE0D00];
          *(_QWORD *)&v104 = v60;
          *((_QWORD *)&v104 + 1) = v1;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_128;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_59;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v62;
LABEL_59:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v63 = (_QWORD *)(v4[6] + 16 * v1);
          *v63 = v27;
          v63[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_138;
        case 4uLL:
          OUTLINED_FUNCTION_33_0(MEMORY[0x24BEE0D00]);
          *((_QWORD *)&v104 + 1) = v94;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_126;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_41;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v54;
LABEL_41:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v55 = (_QWORD *)(v4[6] + 16 * v1);
          *v55 = v27;
          v55[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_136;
        case 5uLL:
          OUTLINED_FUNCTION_34_0(MEMORY[0x24BEE0D00]);
          *(_QWORD *)&v104 = v70;
          *((_QWORD *)&v104 + 1) = v93;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_131;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_86;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v71;
LABEL_86:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v72 = (_QWORD *)(v4[6] + 16 * v1);
          *v72 = v27;
          v72[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_141;
        case 6uLL:
          OUTLINED_FUNCTION_34_0(MEMORY[0x24BEE0D00]);
          *(_QWORD *)&v104 = v73;
          *((_QWORD *)&v104 + 1) = v92;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_132;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_95;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v74;
LABEL_95:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v75 = (_QWORD *)(v4[6] + 16 * v1);
          *v75 = v27;
          v75[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_142;
        case 7uLL:
          OUTLINED_FUNCTION_9_0(MEMORY[0x24BEE0D00]);
          *(_QWORD *)&v104 = v67 + 3;
          *((_QWORD *)&v104 + 1) = v91;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_130;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_77;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v68;
LABEL_77:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v69 = (_QWORD *)(v4[6] + 16 * v1);
          *v69 = v27;
          v69[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_140;
        case 8uLL:
          OUTLINED_FUNCTION_33_0(MEMORY[0x24BEE0D00]);
          *((_QWORD *)&v104 + 1) = v90;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_133;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_104;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v76;
LABEL_104:
          if ((v2 & 1) != 0)
            goto LABEL_114;
          v4[(v1 >> 6) + 8] |= 1 << v1;
          v77 = (_QWORD *)(v4[6] + 16 * v1);
          *v77 = v27;
          v77[1] = v26;
          OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
          if (!v33)
            goto LABEL_116;
          goto LABEL_143;
        default:
          OUTLINED_FUNCTION_9_0(MEMORY[0x24BEE0D00]);
          *(_QWORD *)&v104 = v78 + 2;
          *((_QWORD *)&v104 + 1) = v96;
          OUTLINED_FUNCTION_3_0(&v104, v103);
          v102 = (uint64_t)v4;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_2_0();
          if (v33)
            goto LABEL_134;
          OUTLINED_FUNCTION_7_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
          if ((OUTLINED_FUNCTION_1_1() & 1) == 0)
            goto LABEL_113;
          OUTLINED_FUNCTION_0_1();
          OUTLINED_FUNCTION_5_0();
          if (!v35)
            goto LABEL_145;
          v1 = v79;
LABEL_113:
          if ((v2 & 1) != 0)
          {
LABEL_114:
            v80 = __swift_destroy_boxed_opaque_existential_0(v4[7] + 32 * v1);
            OUTLINED_FUNCTION_40(v80, v81, v82, v83, v84, v85, v86, v87, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, (uint64_t)v100,
              v101,
              v102,
              v103[0]);
          }
          else
          {
            v4[(v1 >> 6) + 8] |= 1 << v1;
            v88 = (_QWORD *)(v4[6] + 16 * v1);
            *v88 = v27;
            v88[1] = v26;
            OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v1));
            if (v33)
              goto LABEL_144;
LABEL_116:
            v4[2] = v37;
            OUTLINED_FUNCTION_17_0();
          }

          break;
      }
    }
    else
    {
      OUTLINED_FUNCTION_9_0(MEMORY[0x24BEE0D00]);
      *(_QWORD *)&v104 = v38 - 10;
      *((_QWORD *)&v104 + 1) = v97;
      OUTLINED_FUNCTION_3_0(&v104, v103);
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_2_0();
      if (v33)
        goto LABEL_122;
      v41 = v39;
      v1 = v40;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
      if ((OUTLINED_FUNCTION_1_1() & 1) != 0)
      {
        v42 = OUTLINED_FUNCTION_0_1();
        if ((v1 & 1) != (v43 & 1))
          goto LABEL_145;
        v41 = v42;
      }
      if ((v1 & 1) != 0)
      {
        v44 = __swift_destroy_boxed_opaque_existential_0(v4[7] + 32 * v41);
        OUTLINED_FUNCTION_40(v44, v45, v46, v47, v48, v49, v50, v51, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, (uint64_t)v100,
          v101,
          (uint64_t)v4,
          v103[0]);
      }
      else
      {
        v4[(v41 >> 6) + 8] |= 1 << v41;
        v52 = (_QWORD *)(v4[6] + 16 * v41);
        *v52 = v27;
        v52[1] = v26;
        OUTLINED_FUNCTION_4_0(v103, (_OWORD *)(v4[7] + 32 * v41));
        if (v33)
          goto LABEL_123;
        v4[2] = v53;
        OUTLINED_FUNCTION_17_0();
      }
    }
    OUTLINED_FUNCTION_39();
    swift_bridgeObjectRelease();
    if (v10)
      goto LABEL_2;
LABEL_3:
    v22 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
      goto LABEL_124;
    }
    if (v22 >= v99)
      goto LABEL_120;
    v23 = *(_QWORD *)(v98 + 8 * v22);
    ++v7;
    if (!v23)
    {
      v7 = v22 + 1;
      if (v22 + 1 >= v99)
        goto LABEL_120;
      v23 = *(_QWORD *)(v98 + 8 * v7);
      if (!v23)
      {
        v7 = v22 + 2;
        if (v22 + 2 >= v99)
          goto LABEL_120;
        v23 = *(_QWORD *)(v98 + 8 * v7);
        if (!v23)
          break;
      }
    }
LABEL_16:
    v10 = (v23 - 1) & v23;
  }
  v24 = v22 + 3;
  if (v24 < v99)
  {
    v23 = *(_QWORD *)(v98 + 8 * v24);
    if (!v23)
    {
      while (1)
      {
        v7 = v24 + 1;
        if (__OFADD__(v24, 1))
          break;
        if (v7 >= v99)
          goto LABEL_120;
        v23 = *(_QWORD *)(v98 + 8 * v7);
        ++v24;
        if (v23)
          goto LABEL_16;
      }
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      sub_235F9B6D8();
      __break(1u);
      JUMPOUT(0x235F6CF24);
    }
    v7 = v24;
    goto LABEL_16;
  }
LABEL_120:
  swift_release();
  return v4;
}

id sub_235F6CF68()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AMLPipelineLogger_featuresConfiguration);
}

void sub_235F6CFC0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___AMLPipelineLogger_featuresConfiguration);
  *(_QWORD *)(v1 + OBJC_IVAR___AMLPipelineLogger_featuresConfiguration) = a1;

}

void __swiftcall AMLPipelineLogger.init(featuresConfiguration:)(AMLPipelineLogger *__return_ptr retstr, AMLFeaturesConfiguration *featuresConfiguration)
{
  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_13()), sel_initWithFeaturesConfiguration_, featuresConfiguration);

}

id AMLPipelineLogger.init(featuresConfiguration:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  *(_QWORD *)(v1 + OBJC_IVAR___AMLPipelineLogger_featuresConfiguration) = a1;
  v3.super_class = (Class)AMLPipelineLogger;
  return objc_msgSendSuper2(&v3, sel_init);
}

void AMLPipelineLogger.copy(with:)(_QWORD *a1@<X8>)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;

  objc_msgSend(objc_allocWithZone((Class)AMLFeaturesDonation), sel_initWithFeaturesConfiguration_, objc_msgSend(v1, sel_featuresConfiguration));
  OUTLINED_FUNCTION_37();
  type metadata accessor for AMLFeaturesDonation(0);
  a1[3] = v4;
  *a1 = v2;
}

Swift::Void __swiftcall AMLPipelineLogger.encode(with:)(NSCoder with)
{
  void *v1;
  id v3;
  id v4;

  v3 = objc_msgSend(v1, sel_featuresConfiguration);
  v4 = (id)OUTLINED_FUNCTION_14_0();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

}

void __swiftcall AMLPipelineLogger.init(coder:)(AMLPipelineLogger_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_13()), sel_initWithCoder_, coder.super.isa);

}

id AMLPipelineLogger.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v2;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  objc_super v9;
  uint64_t v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  v4 = v1;
  v5 = objc_msgSend(a1, sel_decodeObjectForKey_, OUTLINED_FUNCTION_14_0());
  OUTLINED_FUNCTION_37();
  if (v2)
  {
    sub_235F9B5C4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_235F6D390((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {

    v7 = sub_235F6D3D8((uint64_t)v12);
LABEL_9:
    type metadata accessor for AMLPipelineLogger(v7);
    swift_deallocPartialClassInstance();
    return 0;
  }
  type metadata accessor for AMLFeaturesConfiguration(0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_9;
  }
  *(_QWORD *)&v4[OBJC_IVAR___AMLPipelineLogger_featuresConfiguration] = v10;

  v9.receiver = v4;
  v9.super_class = (Class)AMLPipelineLogger;
  v6 = objc_msgSendSuper2(&v9, sel_init);

  return v6;
}

uint64_t sub_235F6D390(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F6D3D8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399530);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AMLPipelineLogger(uint64_t a1)
{
  return sub_235F6B254(a1, (unint64_t *)&unk_2563997B0);
}

void sub_235F6D450(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSString *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void (*v45)(char *, uint64_t);
  id v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)();
  uint64_t v64;

  v5 = v4;
  v46 = a4;
  v52 = a3;
  v49 = a1;
  v50 = a2;
  v55 = sub_235F9B390();
  v58 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_42();
  v54 = v7;
  v8 = sub_235F9B3B4();
  v56 = *(_QWORD *)(v8 - 8);
  v57 = v8;
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_12_0(v10, (uint64_t)v46);
  v48 = sub_235F9B0D8();
  v11 = *(_QWORD *)(v48 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](v48);
  v47 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v46 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v59 = (char *)&v46 - v17;
  v18 = sub_235F9B39C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_25_0();
  v22 = v21 - v20;
  v23 = (void *)sub_235F6B254(0, &qword_2563997C0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 104))(v22, *MEMORY[0x24BEE5470], v18);
  v51 = sub_235F9B54C();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v22, v18);
  v24 = dispatch_group_create();
  v25 = NSTemporaryDirectory();
  OUTLINED_FUNCTION_22_0();

  sub_235F9B09C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_0();
  v26 = OUTLINED_FUNCTION_13_0();
  v27 = objc_msgSend(v26, sel_bundleIdentifier);

  v28 = sub_235F9B3FC();
  v30 = v29;
  OUTLINED_FUNCTION_35();

  v61 = v28;
  v62 = v30;
  OUTLINED_FUNCTION_6_0();
  v31 = OUTLINED_FUNCTION_13_0();
  sub_235F6E650(v31);
  sub_235F9B420();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_6_0();
  v32 = objc_msgSend(OUTLINED_FUNCTION_13_0(), sel_versionId);
  OUTLINED_FUNCTION_37();
  sub_235F9B3FC();

  sub_235F9B420();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  v33 = objc_msgSend(v46, sel_sessionId);
  OUTLINED_FUNCTION_22_0();

  sub_235F9B420();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_6_0();
  sub_235F9B420();
  OUTLINED_FUNCTION_18_0();
  sub_235F9B0A8();
  swift_bridgeObjectRelease();
  dispatch_group_enter(v24);
  v34 = v47;
  v35 = v48;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v47, v16, v48);
  v36 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = v52;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v37 + v36, v34, v35);
  *(_QWORD *)(v37 + ((v12 + v36 + 7) & 0xFFFFFFFFFFFFFFF8)) = v24;
  v63 = sub_235F6E6C0;
  v64 = v37;
  v61 = MEMORY[0x24BDAC760];
  v62 = 1107296256;
  v38 = OUTLINED_FUNCTION_32_0((uint64_t)sub_235F6D914);
  swift_bridgeObjectRetain();
  v39 = v24;
  v40 = v53;
  sub_235F9B3A8();
  v60 = MEMORY[0x24BEE4AF8];
  sub_235F6E6DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563997D0);
  sub_235F6E71C();
  v42 = v54;
  v41 = v55;
  sub_235F9B5D0();
  v43 = OUTLINED_FUNCTION_31_0();
  v44 = (void *)v51;
  MEMORY[0x23B7E774C](v43);
  _Block_release(v38);
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v42, v41);
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v40, v57);
  swift_release();
  sub_235F9B0B4();

  v45 = *(void (**)(char *, uint64_t))(v11 + 8);
  v45(v16, v35);
  v45(v59, v35);
  OUTLINED_FUNCTION_11_0();
}

uint64_t sub_235F6D914(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_235F6DA14(uint64_t a1, char *a2, uint64_t a3, void *a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSString *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  dispatch_group_t v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  dispatch_group_t v47;
  id v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)();
  uint64_t v66;

  v61 = a5;
  v48 = a4;
  v53 = a3;
  v58 = a2;
  v51 = a1;
  v56 = sub_235F9B390();
  v60 = *(_QWORD *)(v56 - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_12_0(v6, v46);
  v59 = sub_235F9B3B4();
  v57 = *(_QWORD *)(v59 - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_42();
  v54 = v8;
  v49 = OUTLINED_FUNCTION_16_0();
  v9 = *(_QWORD *)(v49 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v49);
  v50 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v46 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v46 - v15;
  v17 = sub_235F9B39C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_25_0();
  v21 = v20 - v19;
  v22 = (void *)sub_235F6B254(0, &qword_2563997C0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v21, *MEMORY[0x24BEE5470], v17);
  v52 = sub_235F9B54C();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
  v47 = dispatch_group_create();
  v23 = NSTemporaryDirectory();
  OUTLINED_FUNCTION_22_0();

  sub_235F9B09C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_0();
  v24 = OUTLINED_FUNCTION_19_0();
  v25 = objc_msgSend(v24, sel_bundleIdentifier);

  v26 = sub_235F9B3FC();
  v28 = v27;
  OUTLINED_FUNCTION_35();

  v63 = v26;
  v64 = v28;
  OUTLINED_FUNCTION_6_0();
  v29 = OUTLINED_FUNCTION_19_0();
  sub_235F6E650(v29);
  sub_235F9B420();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_6_0();
  v30 = OUTLINED_FUNCTION_19_0();
  v31 = objc_msgSend(v30, sel_versionId);

  sub_235F9B3FC();
  sub_235F9B420();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  v32 = objc_msgSend(v48, sel_sessionId);
  OUTLINED_FUNCTION_22_0();

  sub_235F9B420();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_6_0();
  sub_235F9B420();
  OUTLINED_FUNCTION_18_0();
  v58 = v16;
  v33 = v49;
  sub_235F9B0A8();
  OUTLINED_FUNCTION_17();
  v34 = v47;
  dispatch_group_enter(v47);
  v35 = v50;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v50, v14, v33);
  v36 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = v53;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v37 + v36, v35, v33);
  *(_QWORD *)(v37 + ((v10 + v36 + 7) & 0xFFFFFFFFFFFFFFF8)) = v34;
  v65 = sub_235F6E6C0;
  v66 = v37;
  v63 = MEMORY[0x24BDAC760];
  v64 = 1107296256;
  v38 = OUTLINED_FUNCTION_32_0((uint64_t)sub_235F6D914);
  OUTLINED_FUNCTION_17_0();
  v39 = v34;
  v40 = v54;
  sub_235F9B3A8();
  v62 = MEMORY[0x24BEE4AF8];
  sub_235F6E6DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563997D0);
  sub_235F6E71C();
  v42 = v55;
  v41 = v56;
  v43 = (void *)v52;
  sub_235F9B5D0();
  v44 = OUTLINED_FUNCTION_31_0();
  MEMORY[0x23B7E774C](v44);
  _Block_release(v38);
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v42, v41);
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v40, v59);
  swift_release();
  if ((v61 & 1) == 0)
    sub_235F9B534();
  sub_235F9B0B4();

  v45 = *(void (**)(char *, uint64_t))(v9 + 8);
  v45(v14, v33);
  v45(v58, v33);
  OUTLINED_FUNCTION_11_0();
}

void sub_235F6DF04(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34[2];

  v34[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = OUTLINED_FUNCTION_16_0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_25_0();
  v10 = v9 - v8;
  sub_235F6E460(a1);
  v11 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563997E0);
  v12 = (void *)sub_235F9B3C0();
  swift_release();
  v34[0] = 0;
  v13 = objc_msgSend(v11, sel_dataWithJSONObject_options_error_, v12, 1, v34);

  v14 = v34[0];
  if (v13)
  {
    sub_235F9B0F0();

    sub_235F9B108();
    v33 = a3;
    if (qword_256399418 != -1)
      swift_once();
    v26 = sub_235F9B384();
    __swift_project_value_buffer(v26, (uint64_t)qword_25639A7F8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
    v27 = sub_235F9B36C();
    v28 = sub_235F9B510();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v34[0] = (id)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v29 = 136315138;
      v30 = sub_235F9B0C0();
      OUTLINED_FUNCTION_30_0(v30, v31);
      OUTLINED_FUNCTION_35_0(v32);
      sub_235F9B5AC();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_24_0();
      _os_log_impl(&dword_235F59000, v27, v28, "logged pipeline to %s", v29, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_38();

    a3 = v33;
  }
  else
  {
    v15 = v14;
    v16 = (void *)sub_235F9B084();

    swift_willThrow();
    if (qword_256399418 != -1)
      swift_once();
    v17 = sub_235F9B384();
    __swift_project_value_buffer(v17, (uint64_t)qword_25639A7F8);
    v18 = v16;
    v19 = v16;
    v20 = sub_235F9B36C();
    v21 = sub_235F9B510();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v34[0] = (id)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v22 = 136315138;
      swift_getErrorValue();
      v23 = sub_235F9B6E4();
      OUTLINED_FUNCTION_30_0(v23, v24);
      OUTLINED_FUNCTION_35_0(v25);
      sub_235F9B5AC();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_10_0();
      _os_log_impl(&dword_235F59000, v20, v21, "logPipeline error with %s", v22, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();

  }
  dispatch_group_leave(a3);
}

void __swiftcall AMLPipelineLogger.init()(AMLPipelineLogger *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_13()), sel_init);
}

void AMLPipelineLogger.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_235F6E460(uint64_t a1)
{
  _QWORD *v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563997E8);
  v2 = (_QWORD *)sub_235F9B660();
  v3 = 0;
  v25 = a1;
  OUTLINED_FUNCTION_21_0();
  v6 = v5 & v4;
  v23 = a1 + 64;
  v24 = (unint64_t)(v7 + 63) >> 6;
  v9 = v8 + 64;
  if ((v5 & v4) == 0)
    goto LABEL_3;
LABEL_2:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v10 | (v3 << 6); ; i = __clz(__rbit64(v13)) + (v3 << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(v25 + 48) + 16 * i);
    v16 = *v15;
    v17 = v15[1];
    OUTLINED_FUNCTION_17_0();
    swift_unknownObjectRetain();
    v18 = sub_235F6C430();
    swift_unknownObjectRelease();
    *(_QWORD *)(v9 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v19 = (_QWORD *)(v2[6] + 16 * i);
    *v19 = v16;
    v19[1] = v17;
    *(_QWORD *)(v2[7] + 8 * i) = v18;
    v20 = v2[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
    {
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v2[2] = v22;
    if (v6)
      goto LABEL_2;
LABEL_3:
    v12 = v3 + 1;
    if (__OFADD__(v3, 1))
      goto LABEL_22;
    if (v12 >= v24)
      return;
    v13 = *(_QWORD *)(v23 + 8 * v12);
    ++v3;
    if (!v13)
    {
      v3 = v12 + 1;
      if (v12 + 1 >= v24)
        return;
      v13 = *(_QWORD *)(v23 + 8 * v3);
      if (!v13)
      {
        v3 = v12 + 2;
        if (v12 + 2 >= v24)
          return;
        v13 = *(_QWORD *)(v23 + 8 * v3);
        if (!v13)
          break;
      }
    }
LABEL_16:
    v6 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v24)
    return;
  v13 = *(_QWORD *)(v23 + 8 * v14);
  if (v13)
  {
    v3 = v14;
    goto LABEL_16;
  }
  while (1)
  {
    v3 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v3 >= v24)
      return;
    v13 = *(_QWORD *)(v23 + 8 * v3);
    ++v14;
    if (v13)
      goto LABEL_16;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_235F6E650(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_modelName);

  if (!v2)
    return 0;
  v3 = sub_235F9B3FC();

  return v3;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_235F6E6DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563997C8;
  if (!qword_2563997C8)
  {
    v1 = sub_235F9B390();
    result = MEMORY[0x23B7E7E48](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2563997C8);
  }
  return result;
}

unint64_t sub_235F6E71C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563997D8;
  if (!qword_2563997D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563997D0);
    result = MEMORY[0x23B7E7E48](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2563997D8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E7E3C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_OWORD *sub_235F6E7A4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = OUTLINED_FUNCTION_16_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_235F6E864()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_16_0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_235F6DF04(*(_QWORD *)(v0 + 16), v0 + v2, *(NSObject **)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_235F9B630();
}

uint64_t OUTLINED_FUNCTION_3_0(_OWORD *a1, _OWORD *a2)
{
  sub_235F6E7A4(a1, a2);
  return swift_isUniquelyReferenced_nonNull_native();
}

_OWORD *OUTLINED_FUNCTION_4_0(_OWORD *a1, _OWORD *a2)
{
  return sub_235F6E7A4(a1, a2);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_235F9B420();
}

void OUTLINED_FUNCTION_8_0()
{
  JUMPOUT(0x23B7E7EE4);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
}

void OUTLINED_FUNCTION_10_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_12_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

id OUTLINED_FUNCTION_13_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 4003));
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 136) = 0;
  *(_QWORD *)(v0 - 128) = 0xE000000000000000;
  return sub_235F9B5F4();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_235F9B0D8();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_235F9B420();
}

id OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 4003));
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_235F9B3FC();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_30_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_235F7EC30(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return 0;
}

void *OUTLINED_FUNCTION_32_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 112) = v1;
  return _Block_copy((const void *)(v2 - 136));
}

void OUTLINED_FUNCTION_33_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  *(_QWORD *)(v1 - 120) = 0xD00000000000001ELL;
}

void OUTLINED_FUNCTION_34_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
}

uint64_t OUTLINED_FUNCTION_35_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = a1;
  return v1 - 144;
}

id OUTLINED_FUNCTION_36_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_37()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_38()
{
  unint64_t v0;
  uint64_t v1;

  return sub_235F6B140(v1, v0);
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_bridgeObjectRelease();
}

_OWORD *OUTLINED_FUNCTION_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,__int128 a22)
{
  _OWORD *v22;

  return sub_235F6E7A4(&a22, v22);
}

id static AMLFeaturesDonation.decodeModelDataAsFeatureDictionaries(from:)()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  void *v11;
  id v12[6];

  v12[5] = *(id *)MEMORY[0x24BDAC8D0];
  objc_opt_self();
  OUTLINED_FUNCTION_76();
  v1 = (void *)sub_235F9B0E4();
  v12[0] = 0;
  v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 0, v12);

  v3 = v12[0];
  if (v2)
  {
    sub_235F9B5C4();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399808);
    swift_dynamicCast();
    return v12[0];
  }
  else
  {
    v5 = v3;
    sub_235F9B084();

    OUTLINED_FUNCTION_63();
    if (qword_256399418 != -1)
      swift_once();
    v6 = sub_235F9B384();
    __swift_project_value_buffer(v6, (uint64_t)qword_25639A7F8);
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_61();
    v7 = sub_235F9B36C();
    v8 = sub_235F9B51C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      OUTLINED_FUNCTION_61();
      v11 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v12[1] = v11;
      sub_235F9B5AC();
      *v10 = v11;
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_41();
      _os_log_impl(&dword_235F59000, v7, v8, "Encountered error while deserializing: %@", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();

    return (id)OUTLINED_FUNCTION_63();
  }
}

uint64_t static AMLFeaturesDonation.decodeModelDataAsBatchProvider(from:)(uint64_t a1, uint64_t a2)
{
  return sub_235F6EDC4(a1, a2, &qword_256399C90);
}

uint64_t static AMLFeaturesDonation.decodeModelDataAsFeatureProvider(from:)(uint64_t a1, uint64_t a2)
{
  return sub_235F6EDC4(a1, a2, &qword_256399870);
}

uint64_t sub_235F6EDC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  void *v4;
  void *v5;
  id v6;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_235F9B0E4();
  v6 = objc_msgSend(v4, sel_photosSearchModelDataFrom_, v5);

  if (v6)
  {
    sub_235F9B5C4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_235F72954((uint64_t)v8, (uint64_t)v9, &qword_256399530);
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    if ((swift_dynamicCast() & 1) != 0)
      return v11;
  }
  else
  {
    sub_235F729B0((uint64_t)v9, &qword_256399530);
  }
  return 0;
}

void sub_235F6EEE0()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void sub_235F6EF1C()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void sub_235F6EF4C(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  sub_235F9B3FC();
  v8 = a1;
  v6 = OUTLINED_FUNCTION_15_1();
  sub_235F6F01C(v6, v7, a4);

}

id sub_235F6EFB8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v3;

  a3();
  v3 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_27_1();
  return v3;
}

void sub_235F6EFEC()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F6F01C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *a3);
  *v4 = a1;
  v4[1] = a2;
  return swift_bridgeObjectRelease();
}

id sub_235F6F054()
{
  return OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMLFeaturesDonationStatus_group);
}

void sub_235F6F0A8(uint64_t a1)
{
  OUTLINED_FUNCTION_20_0(a1, OBJC_IVAR___AMLFeaturesDonationStatus_group);
}

id AMLFeaturesDonationStatus.init(metadataDonationId:featuresDonationId:configurationDonationId:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = objc_allocWithZone((Class)OUTLINED_FUNCTION_13());
  v9 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_25();
  v10 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_49();
  v11 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v8, sel_initWithMetadataDonationId_featuresDonationId_configurationDonationId_group_, v9, v10, v11, a7);

  return v12;
}

id AMLFeaturesDonationStatus.init(metadataDonationId:featuresDonationId:configurationDonationId:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  v8 = (_QWORD *)(v7 + OBJC_IVAR___AMLFeaturesDonationStatus_metadataDonationId);
  *v8 = a1;
  v8[1] = a2;
  v9 = (_QWORD *)(v7 + OBJC_IVAR___AMLFeaturesDonationStatus_featuresDonationId);
  *v9 = a3;
  v9[1] = a4;
  v10 = (_QWORD *)(v7 + OBJC_IVAR___AMLFeaturesDonationStatus_configurationDonationId);
  *v10 = a5;
  v10[1] = a6;
  *(_QWORD *)(v7 + OBJC_IVAR___AMLFeaturesDonationStatus_group) = a7;
  v12.super_class = (Class)AMLFeaturesDonationStatus;
  return objc_msgSendSuper2(&v12, sel_init);
}

void AMLFeaturesDonationStatus.copy(with:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v4 = OUTLINED_FUNCTION_31_1(a1, sel_metadataDonationId);
  OUTLINED_FUNCTION_75();

  v6 = OUTLINED_FUNCTION_31_1(v5, sel_featuresDonationId);
  v7 = OUTLINED_FUNCTION_75();
  v9 = v8;

  v11 = OUTLINED_FUNCTION_31_1(v10, sel_configurationDonationId);
  v12 = OUTLINED_FUNCTION_75();
  v14 = v13;

  v16 = OUTLINED_FUNCTION_31_1(v15, sel_group);
  v17 = objc_allocWithZone((Class)AMLFeaturesDonationStatus);
  v18 = OUTLINED_FUNCTION_15_1();
  v20 = sub_235F726A8(v18, v19, v7, v9, v12, v14, v16);
  type metadata accessor for AMLFeaturesDonationStatus((uint64_t)v20);
  a2[3] = v21;
  *a2 = v20;
}

void AMLFeaturesDonationStatus.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

id sub_235F6F43C()
{
  return OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMLFeaturesDonation_featuresConfiguration);
}

void sub_235F6F490(uint64_t a1)
{
  OUTLINED_FUNCTION_20_0(a1, OBJC_IVAR___AMLFeaturesDonation_featuresConfiguration);
}

void __swiftcall AMLFeaturesDonation.init(featuresConfiguration:)(AMLFeaturesDonation *__return_ptr retstr, AMLFeaturesConfiguration *featuresConfiguration)
{
  id v2;

  v2 = objc_allocWithZone((Class)OUTLINED_FUNCTION_13());
  OUTLINED_FUNCTION_32_1(v2, sel_initWithFeaturesConfiguration_);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_34();
}

id AMLFeaturesDonation.init(featuresConfiguration:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  objc_super v4;

  v2 = (_QWORD *)(v1 + OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  *(_QWORD *)(v1 + OBJC_IVAR___AMLFeaturesDonation_featuresConfiguration) = a1;
  v4.super_class = (Class)AMLFeaturesDonation;
  return objc_msgSendSuper2(&v4, sel_init);
}

void AMLFeaturesDonation.copy(with:)(_QWORD *a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(v1, sel_featuresConfiguration);
  v4 = OUTLINED_FUNCTION_7(objc_allocWithZone((Class)AMLFeaturesDonation), sel_initWithFeaturesConfiguration_);

  type metadata accessor for AMLFeaturesDonation(v5);
  a1[3] = v6;
  *a1 = v4;
}

uint64_t sub_235F6F5C0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD *__return_ptr))
{
  id v5;
  uint64_t v6;
  _QWORD v8[4];

  v5 = a1;
  a4(v8);

  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  v6 = sub_235F9B6B4();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v6;
}

Swift::Void __swiftcall AMLFeaturesDonation.encode(with:)(NSCoder with)
{
  id v2;
  id v3;

  v2 = OUTLINED_FUNCTION_31_1((uint64_t)with.super.isa, sel_featuresConfiguration);
  v3 = (id)OUTLINED_FUNCTION_14_0();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v2, v3);

}

void __swiftcall AMLFeaturesDonation.init(coder:)(AMLFeaturesDonation_optional *__return_ptr retstr, NSCoder coder)
{
  id v2;

  v2 = objc_allocWithZone((Class)OUTLINED_FUNCTION_13());
  OUTLINED_FUNCTION_32_1(v2, sel_initWithCoder_);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_34();
}

id AMLFeaturesDonation.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  objc_super v10;
  uint64_t v11;
  _OWORD v12[2];
  _BYTE v13[24];
  uint64_t v14;

  v3 = &v1[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration];
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = 0;
  v4 = v1;
  v5 = (void *)OUTLINED_FUNCTION_14_0();
  v6 = OUTLINED_FUNCTION_7(a1, sel_decodeObjectForKey_);

  if (v6)
  {
    sub_235F9B5C4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  sub_235F72954((uint64_t)v12, (uint64_t)v13, &qword_256399530);
  if (!v14)
  {

    sub_235F729B0((uint64_t)v13, &qword_256399530);
LABEL_9:
    sub_235F72808(*(_QWORD *)v3, *((_QWORD *)v3 + 1), *((void **)v3 + 2));

    type metadata accessor for AMLFeaturesDonation(v8);
    swift_deallocPartialClassInstance();
    return 0;
  }
  type metadata accessor for AMLFeaturesConfiguration(0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_9;
  }
  *(_QWORD *)&v4[OBJC_IVAR___AMLFeaturesDonation_featuresConfiguration] = v11;

  v10.receiver = v4;
  v10.super_class = (Class)AMLFeaturesDonation;
  v7 = objc_msgSendSuper2(&v10, sel_init);

  return v7;
}

unint64_t sub_235F6F8B4()
{
  char *v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v1 = v0;
  v2 = (uint64_t *)&v0[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration];
  v3 = *(_QWORD *)&v0[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration];
  v4 = *(_QWORD *)&v0[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration + 8];
  v5 = (void *)v2[2];
  if (v4)
  {
    v6 = v3;
  }
  else
  {
    v6 = sub_235F6F974(v1);
    v8 = v7;
    v9 = *v2;
    v10 = v2[1];
    v11 = (void *)v2[2];
    *v2 = v6;
    v2[1] = v12;
    v2[2] = (uint64_t)v7;
    swift_bridgeObjectRetain();
    v8;
    sub_235F72808(v9, v10, v11);
  }
  sub_235F72924(v3, v4, v5);
  return v6;
}

unint64_t sub_235F6F974(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  char **v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  void *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46[2];

  v46[1] = *(id *)MEMORY[0x24BDAC8D0];
  v44 = sub_235F9B18C();
  v2 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)objc_opt_self();
  v6 = &selRef_setArrayProvider_;
  v7 = objc_msgSend(a1, sel_featuresConfiguration);
  v46[0] = 0;
  v8 = objc_msgSend(v5, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v7, 1, v46);

  v9 = v46[0];
  if (v8)
  {
    v10 = sub_235F9B0F0();
    v12 = v11;

    if (sub_235F9B0FC() > 0)
      goto LABEL_10;
    sub_235F6B140(v10, v12);
  }
  else
  {
    v13 = v9;
    v14 = (void *)sub_235F9B084();

    swift_willThrow();
    if (qword_256399418 != -1)
      swift_once();
    v15 = sub_235F9B384();
    __swift_project_value_buffer(v15, (uint64_t)qword_25639A7F8);
    v16 = v14;
    v17 = v14;
    v18 = v14;
    v19 = v14;
    v20 = sub_235F9B36C();
    v21 = sub_235F9B51C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      v42 = (void *)swift_slowAlloc();
      v46[0] = v42;
      *(_DWORD *)v22 = 138412546;
      v24 = v14;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v45 = v25;
      v43 = v4;
      sub_235F9B5AC();
      *v23 = v25;

      *(_WORD *)(v22 + 12) = 2080;
      swift_getErrorValue();
      v26 = sub_235F9B6E4();
      sub_235F7EC30(v26, v27, (uint64_t *)v46);
      v45 = v28;
      v4 = v43;
      sub_235F9B5AC();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_235F59000, v20, v21, "Encountered error while archiving FeaturesConfiguration: %@, description: %s", (uint8_t *)v22, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      swift_arrayDestroy();
      v29 = v23;
      v6 = &selRef_setArrayProvider_;
      MEMORY[0x23B7E7EE4](v29, -1, -1);
      v30 = v42;
      swift_arrayDestroy();
      MEMORY[0x23B7E7EE4](v30, -1, -1);
      MEMORY[0x23B7E7EE4](v22, -1, -1);

    }
    else
    {

    }
  }
  v10 = 0;
  v12 = 0xF000000000000000;
LABEL_10:
  v31 = dispatch_group_create();
  type metadata accessor for AMLFeaturesStorage();
  swift_initStackObject();
  if (v12 >> 60 == 15)
  {
    swift_release();
    return 0xD000000000000018;
  }
  else
  {
    sub_235F6B0E4(v10, v12);
    v33 = objc_msgSend(a1, v6[40]);
    v34 = (uint64_t)v4;
    v35 = v2;
    v36 = objc_msgSend(v33, sel_bundleIdentifier);

    v37 = sub_235F9B3FC();
    v39 = v38;

    sub_235F9B174();
    v32 = sub_235F6B4AC(v10, v12, 0xD000000000000011, 0x8000000235F9E680, (void *)0xD000000000000029, 0x8000000235F9F660, v37, v39, v34, 0xD000000000000016, 0x8000000235F9F690, 16718, 0xE200000000000000, v31);
    swift_bridgeObjectRelease();
    swift_release();
    sub_235F728D4(v10, v12);
    sub_235F728D4(v10, v12);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v44);
  }
  return v32;
}

void sub_235F6FE98(uint64_t a1)
{
  void *v1;
  void *v2;
  unint64_t v3;
  os_log_type_t v4;
  void *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  os_log_type_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v5 = v1;
  v7 = (void *)objc_opt_self();
  v14 = OUTLINED_FUNCTION_38_0(v7, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_66((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21, v37, v38, v39, v41, v42, v43, 0);
  if (!a1)
  {
    OUTLINED_FUNCTION_47();

    swift_willThrow();
    if (qword_256399418 != -1)
      swift_once();
    v23 = OUTLINED_FUNCTION_19_1();
    v24 = __swift_project_value_buffer(v23, (uint64_t)qword_25639A7F8);
    v25 = v5;
    OUTLINED_FUNCTION_23_1();
    v26 = v25;
    OUTLINED_FUNCTION_23_1();
    sub_235F9B36C();
    v27 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_37_0(v27))
    {
      v28 = OUTLINED_FUNCTION_23_0();
      v40 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v28 = 136315394;
      v29 = objc_msgSend(v26, sel_featuresConfiguration);
      v30 = objc_msgSend(v29, sel_bundleIdentifier);

      sub_235F9B3FC();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_51(v31, v32, v33, v34, v35, v36);
      OUTLINED_FUNCTION_11_1();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2112;
      OUTLINED_FUNCTION_23_1();
      _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_13_1();
      *v40 = v26;
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_14_1(&dword_235F59000, v24, v4, "Encountered error from bundle: %s while archiving feature donation: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_4_1();

    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_4_1();

    goto LABEL_9;
  }
  v22 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_54();
  if (OUTLINED_FUNCTION_71() <= 0)
  {
    OUTLINED_FUNCTION_70();
LABEL_9:
    v22 = 0;
    v3 = 0xF000000000000000;
  }
  OUTLINED_FUNCTION_33_1();
  sub_235F728D4(v22, v3);
  OUTLINED_FUNCTION_12_1();
}

uint64_t sub_235F70120(uint64_t a1, unint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  dispatch_group_t v33;
  uint64_t inited;
  dispatch_group_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  dispatch_group_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  id v87;
  id v88;
  unint64_t v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint8_t *v99;
  NSObject *v100;
  os_log_type_t v101;
  _BOOL4 v102;
  uint64_t v103;
  uint8_t *v104;
  id v105;
  id v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  uint8_t *v113;
  uint8_t *v114;
  os_log_type_t v115;
  uint64_t v116;
  _QWORD *v117;
  NSObject *v118;
  id v119;
  id v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  uint8_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  id v153;
  NSObject *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  id v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  uint64_t result;
  uint64_t v171;
  uint64_t v172;
  NSObject *v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void (*v179)(char *, uint64_t);
  uint64_t v180;
  void (*v181)(_QWORD);
  unint64_t v182;
  char *v183;
  uint64_t v184;
  dispatch_group_t v185;
  unint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  __int128 v190;
  id v191;
  unint64_t v192;
  dispatch_group_t v193;
  uint64_t v194;
  unint64_t v195;
  void *v196;
  uint8_t *v197;
  char *v198;
  id v199;
  unint64_t v200;
  void *v201;
  _QWORD v202[14];

  v192 = a2;
  v175 = a1;
  v202[13] = *MEMORY[0x24BDAC8D0];
  v189 = sub_235F9B18C();
  v188 = *(_QWORD *)(v189 - 8);
  MEMORY[0x24BDAC7A8](v189);
  v198 = (char *)&v174 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v194 = sub_235F9B360();
  v5 = *(_QWORD *)(v194 - 8);
  v6 = MEMORY[0x24BDAC7A8](v194);
  v183 = (char *)&v174 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v174 - v8;
  v191 = (id)objc_opt_self();
  sub_235F90484(objc_msgSend(v191, sel_mainBundle));
  v11 = v10;
  v13 = v12;
  LODWORD(v196) = sub_235F9B564();
  if (qword_256399420 != -1)
    swift_once();
  v193 = a3;
  v195 = qword_25639A810;
  if (qword_256399428 != -1)
    swift_once();
  v14 = v194;
  v15 = __swift_project_value_buffer(v194, (uint64_t)qword_25639A818);
  v16 = *(void (**)(_QWORD))(v5 + 16);
  v180 = v15;
  v181 = v16;
  v16(v9);
  v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399918);
  v17 = OUTLINED_FUNCTION_53();
  v190 = xmmword_235F9D750;
  *(_OWORD *)(v17 + 16) = xmmword_235F9D750;
  v18 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
  v19 = sub_235F728E8();
  *(_QWORD *)(v17 + 64) = v19;
  if (v13)
    v20 = v11;
  else
    v20 = 0x6E776F6E6B6E55;
  v21 = 0xE700000000000000;
  if (v13)
    v21 = v13;
  v177 = v20;
  *(_QWORD *)(v17 + 32) = v20;
  *(_QWORD *)(v17 + 40) = v21;
  v176 = v21;
  v174 = v13;
  v22 = OUTLINED_FUNCTION_62();
  v23 = v197;
  v24 = OUTLINED_FUNCTION_40_0(v22, sel_featuresConfiguration);
  v25 = objc_msgSend(v24, sel_configurationId);

  v26 = sub_235F9B3FC();
  v28 = v27;

  *(_QWORD *)(v17 + 96) = v18;
  *(_QWORD *)(v17 + 104) = v19;
  v182 = v19;
  *(_QWORD *)(v17 + 72) = v26;
  *(_QWORD *)(v17 + 80) = v28;
  v29 = v23;
  sub_235F9B348();
  OUTLINED_FUNCTION_25();
  v179 = *(void (**)(char *, uint64_t))(v5 + 8);
  v179(v9, v14);
  sub_235F9B174();
  v30 = sub_235F6F8B4();
  v187 = v31;

  v33 = dispatch_group_create();
  type metadata accessor for AMLFeaturesStorage();
  inited = swift_initStackObject();
  v186 = v30;
  v185 = v33;
  v184 = inited;
  if (v192 >> 60 == 15)
  {
    v196 = (void *)0xD000000000000014;
    v195 = 0x8000000235F9F520;
    v35 = v193;
  }
  else
  {
    v36 = OUTLINED_FUNCTION_58();
    v38 = sub_235F6B0E4(v36, v37);
    v39 = objc_msgSend(OUTLINED_FUNCTION_36_1(v38, sel_featuresConfiguration), sel_bundleIdentifier);
    OUTLINED_FUNCTION_21_1();
    v40 = sub_235F9B3FC();
    OUTLINED_FUNCTION_54();
    v41 = v193;
    v43 = OUTLINED_FUNCTION_36_1(v42, sel_sessionId);
    v44 = OUTLINED_FUNCTION_22_0();
    v46 = v45;

    OUTLINED_FUNCTION_79();
    v47 = OUTLINED_FUNCTION_58();
    v196 = (void *)sub_235F6B4AC(v47, v48, 0xD000000000000012, v49, v50, v51, v40, v26, v171, v172, 0x8000000235F9F620, v44, v46, v33);
    v195 = v52;
    v53 = OUTLINED_FUNCTION_58();
    sub_235F728D4(v53, v54);
    OUTLINED_FUNCTION_9_1();
    v35 = v41;
    v29 = v197;
    swift_bridgeObjectRelease();
  }
  sub_235F90484(objc_msgSend(v191, sel_mainBundle));
  v56 = v55;
  v58 = v57;
  sub_235F72838(v35);
  v60 = v59;
  swift_bridgeObjectRelease();
  if (!v60)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399928);
    v78 = swift_initStackObject();
    *(_OWORD *)(v78 + 16) = v190;
    if (qword_256399438 != -1)
      swift_once();
    v79 = qword_25639A850;
    *(_QWORD *)(v78 + 32) = qword_25639A848;
    *(_QWORD *)(v78 + 40) = v79;
    v80 = swift_bridgeObjectRetain();
    v81 = OUTLINED_FUNCTION_36_1(v80, sel_featuresConfiguration);
    v82 = objc_msgSend(v81, sel_configurationId);

    v83 = sub_235F9B3FC();
    v85 = v84;

    *(_QWORD *)(v78 + 48) = v83;
    *(_QWORD *)(v78 + 56) = v85;
    *(_QWORD *)(v78 + 64) = 0xD000000000000012;
    *(_QWORD *)(v78 + 72) = 0x8000000235F9EF60;
    v86 = v195;
    *(_QWORD *)(v78 + 80) = v196;
    *(_QWORD *)(v78 + 88) = v86;
    swift_bridgeObjectRetain();
    v87 = (id)sub_235F9B3E4();
    if (v58)
    {
      swift_isUniquelyReferenced_nonNull_native();
      v199 = v87;
      sub_235F7F65C();
      v87 = v199;
      swift_bridgeObjectRelease();
    }
    v88 = -[NSObject sessionId](v35, sel_sessionId);
    v69 = (void *)OUTLINED_FUNCTION_65();
    v58 = v89;

    sub_235F94354((uint64_t)v87);
    OUTLINED_FUNCTION_64();
    v90 = objc_allocWithZone((Class)AMLFeaturesDonationMetadata);
    v75 = (_QWORD *)OUTLINED_FUNCTION_15_1();
    v77 = 0xD000000000000012;
    goto LABEL_27;
  }
  sub_235F72838(v35);
  v62 = v61;
  v202[0] = v61;
  if (qword_256399438 != -1)
    swift_once();
  v63 = swift_bridgeObjectRetain();
  v64 = OUTLINED_FUNCTION_36_1(v63, sel_featuresConfiguration);
  v65 = objc_msgSend(v64, sel_configurationId);

  v66 = (void *)sub_235F9B3FC();
  v68 = v67;

  v69 = (void *)MEMORY[0x24BEE0D00];
  v201 = (void *)MEMORY[0x24BEE0D00];
  v199 = v66;
  v200 = v68;
  if (!v62)
  {
    OUTLINED_FUNCTION_17_1();
    __break(1u);
    goto LABEL_47;
  }
  sub_235F94290((uint64_t)&v199);
  v201 = v69;
  v199 = v196;
  v200 = v195;
  v70 = v202[0];
  swift_bridgeObjectRetain();
  if (!v70)
  {
LABEL_47:
    OUTLINED_FUNCTION_17_1();
    __break(1u);
    goto LABEL_48;
  }
  v71 = sub_235F94290((uint64_t)&v199);
  v29 = v197;
  if (v58)
  {
    v201 = v69;
    v199 = v56;
    v200 = v58;
    if (v202[0])
    {
      v71 = sub_235F94290((uint64_t)&v199);
      goto LABEL_21;
    }
LABEL_48:
    result = OUTLINED_FUNCTION_17_1();
    __break(1u);
    return result;
  }
LABEL_21:
  v72 = OUTLINED_FUNCTION_28_1(v71, sel_sessionId);
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_68();
  v73 = v202[0];
  v74 = objc_allocWithZone((Class)AMLFeaturesDonationMetadata);
  v75 = v202;
  v76 = (uint64_t)v69;
  v77 = v73;
LABEL_27:
  v91 = sub_235F98380((uint64_t)v75, v76, v77);
  if (v91)
  {
    v92 = (void *)objc_opt_self();
    v199 = 0;
    v93 = v91;
    v94 = objc_msgSend(v92, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v93, 1, &v199);
    v95 = v199;
    v192 = (unint64_t)v93;
    if (v94)
    {
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_15_1();
      if (sub_235F9B0FC() <= 0)
      {
        v96 = OUTLINED_FUNCTION_15_1();
        sub_235F6B140(v96, v97);
        v69 = 0;
        v58 = 0xF000000000000000;
      }
    }
    else
    {
      OUTLINED_FUNCTION_47();

      swift_willThrow();
      if (qword_256399418 != -1)
        swift_once();
      v111 = OUTLINED_FUNCTION_19_1();
      v112 = __swift_project_value_buffer(v111, (uint64_t)qword_25639A7F8);
      v113 = v29;
      OUTLINED_FUNCTION_24_1();
      v114 = v113;
      OUTLINED_FUNCTION_24_1();
      sub_235F9B36C();
      v115 = OUTLINED_FUNCTION_46();
      if (os_log_type_enabled(v112, v115))
      {
        v116 = OUTLINED_FUNCTION_23_0();
        v117 = (_QWORD *)OUTLINED_FUNCTION_23_0();
        v118 = OUTLINED_FUNCTION_23_0();
        v193 = v118;
        v199 = v118;
        *(_DWORD *)v116 = 136315394;
        v191 = (id)(v116 + 4);
        v119 = OUTLINED_FUNCTION_40_0((uint64_t)v118, sel_featuresConfiguration);
        v120 = objc_msgSend(v119, sel_bundleIdentifier);

        v121 = sub_235F9B3FC();
        v123 = v122;

        sub_235F7EC30(v121, v123, (uint64_t *)&v199);
        v202[0] = v124;
        sub_235F9B5AC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v116 + 12) = 2112;
        OUTLINED_FUNCTION_24_1();
        v125 = _swift_stdlib_bridgeErrorToNSError();
        v202[0] = v125;
        sub_235F9B5AC();
        *v117 = v125;
        OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_14_1(&dword_235F59000, v112, v115, "Encountered error from bundle: %s while archiving AMLFeaturesDonationMetadata: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
        OUTLINED_FUNCTION_2_1();
        OUTLINED_FUNCTION_8_0();
      }
      OUTLINED_FUNCTION_5_1();

      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_5_1();

      v69 = 0;
      v58 = 0xF000000000000000;
      v29 = v197;
    }
    v193 = dispatch_group_create();
    v191 = (id)v58;
    v175 = (uint64_t)v69;
    if (v58 >> 60 == 15)
    {
      OUTLINED_FUNCTION_42_0();
      v132 = v187;
    }
    else
    {
      v133 = OUTLINED_FUNCTION_15_1();
      v135 = sub_235F6B0E4(v133, v134);
      v136 = OUTLINED_FUNCTION_36_1(v135, sel_featuresConfiguration);
      v137 = objc_msgSend(v136, sel_bundleIdentifier);

      v138 = sub_235F9B3FC();
      v140 = v139;

      v142 = OUTLINED_FUNCTION_28_1(v141, sel_sessionId);
      v143 = sub_235F9B3FC();
      v29 = v144;

      v173 = v193;
      OUTLINED_FUNCTION_79();
      v145 = OUTLINED_FUNCTION_15_1();
      sub_235F6B4AC(v145, v146, v147, v148, v149, v150, v138, v140, v171, v172, 0x8000000235F9F5B0, v143, (uint64_t)v29, v173);
      v151 = OUTLINED_FUNCTION_15_1();
      sub_235F728D4(v151, v152);
      OUTLINED_FUNCTION_9_1();
      v132 = v187;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_42_0();
    }
    v153 = objc_allocWithZone((Class)AMLFeaturesDonationStatus);
    v154 = v185;
    OUTLINED_FUNCTION_56();
    v196 = sub_235F726A8(v155, v156, v157, v158, (uint64_t)v69, v132, v154);
    sub_235F9B558();
    v195 = *(_QWORD *)(v58 + 2064);
    ((void (*)(char *, uint64_t, uint64_t))v29)(v183, v180, v194);
    v159 = OUTLINED_FUNCTION_53();
    *(_OWORD *)(v159 + 16) = v190;
    v160 = MEMORY[0x24BEE0D00];
    v161 = v182;
    *(_QWORD *)(v159 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v159 + 64) = v161;
    v162 = v176;
    *(_QWORD *)(v159 + 32) = v177;
    *(_QWORD *)(v159 + 40) = v162;
    v163 = OUTLINED_FUNCTION_28_1(v159, sel_featuresConfiguration);
    v164 = objc_msgSend(v163, sel_configurationId);

    v165 = sub_235F9B3FC();
    v167 = v166;

    *(_QWORD *)(v159 + 96) = v160;
    *(_QWORD *)(v159 + 104) = v161;
    *(_QWORD *)(v159 + 72) = v165;
    *(_QWORD *)(v159 + 80) = v167;
    sub_235F9B348();
    v168 = (id)v192;

    swift_release();
    OUTLINED_FUNCTION_9_1();
    sub_235F728D4(v175, (unint64_t)v191);

    v169 = OUTLINED_FUNCTION_49();
    ((void (*)(uint64_t))v179)(v169);
    (*(void (**)(char *, uint64_t))(v188 + 8))(v198, v189);
  }
  else
  {
    OUTLINED_FUNCTION_17_1();
    if (qword_256399418 != -1)
      swift_once();
    v98 = OUTLINED_FUNCTION_19_1();
    __swift_project_value_buffer(v98, (uint64_t)qword_25639A7F8);
    v99 = v29;
    v100 = sub_235F9B36C();
    v101 = sub_235F9B51C();
    v102 = os_log_type_enabled(v100, v101);
    v103 = v187;
    if (v102)
    {
      v104 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v199 = (id)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v104 = 136315138;
      v197 = v104 + 4;
      v105 = objc_msgSend(v99, (SEL)0x250758FA3);
      v106 = objc_msgSend(v105, sel_bundleIdentifier);

      sub_235F9B3FC();
      v107 = OUTLINED_FUNCTION_58();
      sub_235F7EC30(v107, v108, v109);
      v202[0] = v110;
      sub_235F9B5AC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235F59000, v100, v101, "Donation Metadata is nil from bundleId: %s", v104, 0xCu);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }

    v126 = v198;
    v127 = objc_allocWithZone((Class)AMLFeaturesDonationStatus);
    OUTLINED_FUNCTION_56();
    v196 = sub_235F726A8(v128, v129, v130, v131, v186, v103, v185);
    (*(void (**)(char *, uint64_t))(v188 + 8))(v126, v189);
  }
  return (uint64_t)v196;
}

uint64_t sub_235F7128C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t, uint64_t, void *);
  unint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, void *);
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
  char v19;
  char v20;
  unint64_t v21;
  char v22;
  _QWORD *v23;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t, void *);
  uint64_t (*v53)(uint64_t, uint64_t, void *);
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  _QWORD *v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t (*v64)(uint64_t, uint64_t, void *);
  uint64_t (*v65)(uint64_t, uint64_t, void *);
  os_log_type_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  dispatch_group_t v72;
  id v73;
  uint64_t result;
  id v75;
  const void *v76;
  uint64_t v77;
  uint64_t (*v80)(uint64_t, uint64_t, void *);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  _QWORD *v86;
  NSObject *v87;
  void *v88;
  _OWORD v89[2];
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t, void *);
  _OWORD v92[2];
  _QWORD v93[2];
  __int128 v94;
  id aBlock;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t, void *);
  __int128 v98;
  uint64_t v99;
  _QWORD v100[8];

  v7 = v4;
  v100[6] = *MEMORY[0x24BDAC8D0];
  v83 = *(_QWORD *)(a1 + 16);
  if (!v83)
    goto LABEL_36;
  v80 = v4;
  v82 = a1 + 32;
  v77 = a1;
  swift_bridgeObjectRetain();
  v8 = 0;
  v9 = MEMORY[0x24BEE4B00];
  while (2)
  {
    v84 = v8;
    sub_235F863C8(*(_QWORD *)(v82 + 8 * v8), v100);
    v10 = swift_bridgeObjectRetain();
    while (1)
    {
      sub_235F86404(v10, v11, v12, v13, v14, v15, v16, (uint64_t)v93);
      sub_235F72954((uint64_t)v93, (uint64_t)&aBlock, &qword_256399938);
      v7 = v97;
      if (!v97)
        break;
      v17 = v96;
      v90 = v96;
      v91 = v97;
      sub_235F6E7A4(&v98, v92);
      v93[0] = v17;
      v93[1] = v7;
      sub_235F6E7A4(v92, &v94);
      OUTLINED_FUNCTION_7_1();
      v18 = *(_QWORD *)(v9 + 16);
      OUTLINED_FUNCTION_48();
      if (!v18 || (OUTLINED_FUNCTION_48(), OUTLINED_FUNCTION_8_1(), v20 = v19, OUTLINED_FUNCTION_9_1(), (v20 & 1) == 0))
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v89);
        OUTLINED_FUNCTION_7_1();
        sub_235F7E138();
        v23 = v31;
        v32 = v31[2];
        v33 = (id)(v32 + 1);
        if (v32 >= v31[3] >> 1)
        {
          OUTLINED_FUNCTION_18_1();
          v23 = v39;
        }
        v23[2] = v33;
        sub_235F6E7A4(v89, &v23[4 * v32 + 4]);
        OUTLINED_FUNCTION_7_1();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        OUTLINED_FUNCTION_8_1();
        OUTLINED_FUNCTION_73();
        if (v27)
        {
          __break(1u);
          goto LABEL_53;
        }
        v5 = v34;
        v6 = v35;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399948);
        if ((OUTLINED_FUNCTION_26_0() & 1) != 0)
        {
          v36 = OUTLINED_FUNCTION_43();
          if ((v6 & 1) != (v37 & 1))
          {
LABEL_58:
            result = sub_235F9B6D8();
            __break(1u);
            return result;
          }
          v5 = v36;
        }
        if ((v6 & 1) != 0)
          goto LABEL_28;
        OUTLINED_FUNCTION_3_1();
        if (v27)
        {
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          swift_once();
          v62 = OUTLINED_FUNCTION_19_1();
          v63 = __swift_project_value_buffer(v62, (uint64_t)qword_25639A7F8);
          v64 = v7;
          OUTLINED_FUNCTION_72();
          v65 = v64;
          OUTLINED_FUNCTION_72();
          sub_235F9B36C();
          v66 = OUTLINED_FUNCTION_46();
          if (os_log_type_enabled(v63, v66))
          {
            v67 = OUTLINED_FUNCTION_23_0();
            v86 = (_QWORD *)OUTLINED_FUNCTION_23_0();
            v88 = (void *)OUTLINED_FUNCTION_23_0();
            aBlock = v88;
            *(_DWORD *)v67 = 136315394;
            v68 = OUTLINED_FUNCTION_40_0((uint64_t)v88, *(const char **)(isUniquelyReferenced_nonNull_native + 320));
            v69 = objc_msgSend(v68, (SEL)(v6 + 2760));

            sub_235F9B3FC();
            OUTLINED_FUNCTION_52();
            sub_235F7EC30((uint64_t)v68, v5, (uint64_t *)&aBlock);
            OUTLINED_FUNCTION_25_1();
            sub_235F9B5AC();

            OUTLINED_FUNCTION_25();
            *(_WORD *)(v67 + 12) = 2112;
            OUTLINED_FUNCTION_72();
            v70 = _swift_stdlib_bridgeErrorToNSError();
            v93[0] = v70;
            sub_235F9B5AC();
            *v86 = v70;
            OUTLINED_FUNCTION_22_1();
            OUTLINED_FUNCTION_22_1();
            _os_log_impl(&dword_235F59000, v63, v66, "Error [bundle: %s] while translating feature dictionaries: %@", (uint8_t *)v67, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
            OUTLINED_FUNCTION_6_1();
            OUTLINED_FUNCTION_8_0();
          }
          OUTLINED_FUNCTION_22_1();

          OUTLINED_FUNCTION_22_1();
          OUTLINED_FUNCTION_22_1();

          v72 = dispatch_group_create();
          v73 = objc_allocWithZone((Class)AMLFeaturesDonationStatus);
          v50 = (uint64_t)sub_235F726A8(1701736270, 0xE400000000000000, 1701736270, 0xE400000000000000, 1701736270, 0xE400000000000000, v72);
          goto LABEL_51;
        }
        goto LABEL_30;
      }
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_7_1();
      if (*(_QWORD *)(v9 + 16))
      {
        OUTLINED_FUNCTION_48();
        v21 = OUTLINED_FUNCTION_8_1();
        if ((v22 & 1) == 0)
        {
          OUTLINED_FUNCTION_9_1();
          goto LABEL_33;
        }
        v23 = *(_QWORD **)(*(_QWORD *)(v9 + 56) + 8 * v21);
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_9_1();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v89);
        OUTLINED_FUNCTION_7_1();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_235F7E138();
          v23 = v40;
        }
        v5 = v23[2];
        if (v5 >= v23[3] >> 1)
        {
          OUTLINED_FUNCTION_18_1();
          v23 = v41;
        }
        v23[2] = v5 + 1;
        sub_235F6E7A4(v89, &v23[4 * v5 + 4]);
        OUTLINED_FUNCTION_7_1();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        OUTLINED_FUNCTION_8_1();
        OUTLINED_FUNCTION_73();
        if (v27)
          goto LABEL_56;
        v5 = v25;
        v6 = v26;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399948);
        if ((OUTLINED_FUNCTION_26_0() & 1) != 0)
        {
          v28 = OUTLINED_FUNCTION_43();
          if ((v6 & 1) != (v29 & 1))
            goto LABEL_58;
          v5 = v28;
        }
        if ((v6 & 1) != 0)
        {
LABEL_28:
          v38 = *(_QWORD *)(v9 + 56);
          swift_bridgeObjectRelease();
          *(_QWORD *)(v38 + 8 * v5) = v23;
          goto LABEL_31;
        }
        OUTLINED_FUNCTION_3_1();
        if (v27)
          goto LABEL_57;
LABEL_30:
        *(_QWORD *)(v9 + 16) = v30;
        OUTLINED_FUNCTION_48();
LABEL_31:
        OUTLINED_FUNCTION_9_1();
        swift_bridgeObjectRelease();
        sub_235F729B0((uint64_t)v93, &qword_256399950);
        v10 = OUTLINED_FUNCTION_55();
      }
      else
      {
LABEL_33:
        OUTLINED_FUNCTION_55();
        sub_235F729B0((uint64_t)v93, &qword_256399950);
        v10 = OUTLINED_FUNCTION_9_1();
      }
    }
    v8 = v84 + 1;
    sub_235F72990();
    if (v84 + 1 != v83)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
  v7 = v80;
LABEL_36:
  v42 = (void *)objc_opt_self();
  OUTLINED_FUNCTION_62();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399940);
  v43 = (void *)sub_235F9B3C0();
  OUTLINED_FUNCTION_27_1();
  aBlock = 0;
  v44 = objc_msgSend(v42, sel_dataWithJSONObject_options_error_, v43, 0, &aBlock);

  v45 = aBlock;
  if (!v44)
  {
    OUTLINED_FUNCTION_47();

    swift_willThrow();
    if (qword_256399418 != -1)
      swift_once();
    v51 = OUTLINED_FUNCTION_19_1();
    __swift_project_value_buffer(v51, (uint64_t)qword_25639A7F8);
    v52 = v7;
    OUTLINED_FUNCTION_24_1();
    v53 = v52;
    OUTLINED_FUNCTION_24_1();
    v54 = sub_235F9B36C();
    v55 = sub_235F9B51C();
    v87 = v54;
    if (os_log_type_enabled(v54, v55))
    {
      v56 = OUTLINED_FUNCTION_23_0();
      v57 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      v85 = (void *)OUTLINED_FUNCTION_23_0();
      aBlock = v85;
      *(_DWORD *)v56 = 136315394;
      v58 = OUTLINED_FUNCTION_40_0((uint64_t)v85, sel_featuresConfiguration);
      v59 = objc_msgSend(v58, sel_bundleIdentifier);

      sub_235F9B3FC();
      OUTLINED_FUNCTION_52();
      sub_235F7EC30((uint64_t)v58, v5, (uint64_t *)&aBlock);
      OUTLINED_FUNCTION_25_1();
      sub_235F9B5AC();

      OUTLINED_FUNCTION_25();
      *(_WORD *)(v56 + 12) = 2112;
      OUTLINED_FUNCTION_24_1();
      v60 = _swift_stdlib_bridgeErrorToNSError();
      v93[0] = v60;
      sub_235F9B5AC();
      *v57 = v60;
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_14_1(&dword_235F59000, v87, v55, "Encountered error from bundle: %s while serializing batch features donation: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_5_1();

    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_5_1();

    goto LABEL_45;
  }
  OUTLINED_FUNCTION_45();

  OUTLINED_FUNCTION_49();
  if (sub_235F9B0FC() < 1)
  {
    OUTLINED_FUNCTION_35_1();
LABEL_45:
    v61 = objc_allocWithZone(MEMORY[0x24BDBFF60]);
    OUTLINED_FUNCTION_62();
    v33 = sub_235F725C8();
    v23 = OUTLINED_FUNCTION_7(objc_allocWithZone((Class)AMLArrayBatchProvider), sel_initWithMLArrayBatchProvider_);
    if (a3)
    {
      *((_QWORD *)&v98 + 1) = a3;
      v99 = a4;
      aBlock = (id)MEMORY[0x24BDAC760];
      v96 = 1107296256;
      v97 = sub_235F71C80;
      *(_QWORD *)&v98 = &block_descriptor_2;
      v71 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
LABEL_53:
      v71 = 0;
    }
    v75 = objc_msgSend(v7, sel_donateFeaturesBatch_metadata_completionBlock_, v23, a2, v71, v77);
    v76 = (const void *)OUTLINED_FUNCTION_76();
    _Block_release(v76);
    OUTLINED_FUNCTION_27_1();

    return (uint64_t)v7;
  }
  v46 = OUTLINED_FUNCTION_49();
  sub_235F6B0E4(v46, v47);
  v48 = OUTLINED_FUNCTION_49();
  v50 = sub_235F70120(v48, v49, a2);
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_35_1();
LABEL_51:
  OUTLINED_FUNCTION_27_1();
  return v50;
}

uint64_t sub_235F71C80(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_235F71DBC(uint64_t a1)
{
  void *v1;
  void *v2;
  unint64_t v3;
  os_log_type_t v4;
  void *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  os_log_type_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v5 = v1;
  v7 = (void *)objc_opt_self();
  v14 = OUTLINED_FUNCTION_38_0(v7, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_66((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21, v37, v38, v39, v41, v42, v43, 0);
  if (!a1)
  {
    OUTLINED_FUNCTION_47();

    swift_willThrow();
    if (qword_256399418 != -1)
      swift_once();
    v23 = OUTLINED_FUNCTION_19_1();
    v24 = __swift_project_value_buffer(v23, (uint64_t)qword_25639A7F8);
    v25 = v5;
    OUTLINED_FUNCTION_23_1();
    v26 = v25;
    OUTLINED_FUNCTION_23_1();
    sub_235F9B36C();
    v27 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_37_0(v27))
    {
      v28 = OUTLINED_FUNCTION_23_0();
      v40 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v28 = 136315394;
      v29 = objc_msgSend(v26, sel_featuresConfiguration);
      v30 = objc_msgSend(v29, sel_bundleIdentifier);

      sub_235F9B3FC();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_51(v31, v32, v33, v34, v35, v36);
      OUTLINED_FUNCTION_11_1();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2112;
      OUTLINED_FUNCTION_23_1();
      _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_13_1();
      *v40 = v26;
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_14_1(&dword_235F59000, v24, v4, "Encountered error from bundle: %s while archiving batch features donation: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_4_1();

    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_4_1();

    goto LABEL_9;
  }
  v22 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_54();
  if (OUTLINED_FUNCTION_71() <= 0)
  {
    OUTLINED_FUNCTION_70();
LABEL_9:
    v22 = 0;
    v3 = 0xF000000000000000;
  }
  OUTLINED_FUNCTION_33_1();
  sub_235F728D4(v22, v3);
  OUTLINED_FUNCTION_12_1();
}

void AMLFeaturesDonation.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

unint64_t AMLFeaturesDonation.description.getter()
{
  uint64_t v0;
  id v1;
  id v2;

  sub_235F9B5F4();
  v0 = swift_bridgeObjectRelease();
  v1 = OUTLINED_FUNCTION_28_1(v0, sel_featuresConfiguration);
  v2 = objc_msgSend(v1, sel_description);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_69();

  swift_bridgeObjectRelease();
  return 0xD00000000000002ELL;
}

id sub_235F72234(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t AMLFeaturesDonationMetadata.description.getter()
{
  void *v0;
  uint64_t v1;
  id v2;

  sub_235F9B5F4();
  v1 = sub_235F9B420();
  v2 = OUTLINED_FUNCTION_28_1(v1, sel_sessionId);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_69();
  swift_bridgeObjectRelease();
  sub_235F9B420();
  sub_235F72838(v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563998A8);
  sub_235F9B408();
  sub_235F9B420();
  OUTLINED_FUNCTION_27_1();
  return 0;
}

uint64_t static AMLFeaturesDonation.modelContentAsFeatureProvider(for:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = (void *)objc_opt_self();
  v2 = OUTLINED_FUNCTION_32_1(v1, sel_photosSearchModelContentForFeatureProvider_);
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_68();
  return v0;
}

void static AMLFeaturesDonation.modelContentAsBatchProvider(for:)()
{
  void *v0;
  id v1;

  v0 = (void *)objc_opt_self();
  v1 = OUTLINED_FUNCTION_32_1(v0, sel_photosSearchModelContentForBatchProvider_);
  sub_235F9B450();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_34();
}

void static AMLFeaturesDonation.modelContentAsArrayProvider(for:)(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  if (objc_msgSend(a1, sel_count))
  {
    v2 = (void *)objc_opt_self();
    v3 = OUTLINED_FUNCTION_32_1(v2, sel_photosSearchModelArrayForArrayProvider_);
    sub_235F9B450();
    OUTLINED_FUNCTION_21_1();
    sub_235F724A0(v1);
    OUTLINED_FUNCTION_64();
  }
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F724A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[5];
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v10 = MEMORY[0x24BEE4AF8];
    sub_235F7FCA0(0, v1, 0);
    v4 = a1 + 32;
    v2 = v10;
    do
    {
      sub_235F6B0A8(v4, (uint64_t)v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563997E0);
      swift_dynamicCast();
      v5 = v9[4];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F7FCA0(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v10;
      }
      v7 = *(_QWORD *)(v2 + 16);
      v6 = *(_QWORD *)(v2 + 24);
      if (v7 >= v6 >> 1)
      {
        sub_235F7FCA0(v6 > 1, v7 + 1, 1);
        v2 = v10;
      }
      *(_QWORD *)(v2 + 16) = v7 + 1;
      *(_QWORD *)(v2 + 8 * v7 + 32) = v5;
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_235F725C8()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399940);
  sub_235F9B3C0();
  OUTLINED_FUNCTION_76();
  swift_bridgeObjectRelease();
  v5[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v5);

  v3 = v5[0];
  if (!v2)
  {
    OUTLINED_FUNCTION_76();
    sub_235F9B084();

    OUTLINED_FUNCTION_63();
  }
  return v2;
}

id sub_235F726A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v9 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v7, sel_initWithMetadataDonationId_featuresDonationId_configurationDonationId_group_, v9, v10, v11, a7);

  return v12;
}

uint64_t sub_235F72768(uint64_t a1)
{
  if (a1 < 16)
    return 0;
  sub_235F9B5F4();
  return 0;
}

void type metadata accessor for AMLFeaturesDonationStatus(uint64_t a1)
{
  sub_235F727D4(a1, &qword_2563998D8);
}

void type metadata accessor for AMLFeaturesDonation(uint64_t a1)
{
  sub_235F727D4(a1, &qword_256399910);
}

void sub_235F727D4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_34();
}

void sub_235F72808(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

  }
}

void sub_235F72838(void *a1)
{
  if (objc_msgSend(a1, sel_metadata))
  {
    sub_235F9B3CC();
    OUTLINED_FUNCTION_21_1();
  }
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F72898(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_235F728A8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_235F728CC(uint64_t a1, uint64_t a2)
{
  sub_235F94308(a1, a2);
}

uint64_t sub_235F728D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_235F6B140(a1, a2);
  return a1;
}

unint64_t sub_235F728E8()
{
  unint64_t result;

  result = qword_256399920;
  if (!qword_256399920)
  {
    result = MEMORY[0x23B7E7E48](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256399920);
  }
  return result;
}

id sub_235F72924(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return a3;
  }
  return result;
}

void sub_235F72954(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_60();
  v4(v3);
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F72990()
{
  return swift_release();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void sub_235F729B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_34();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v0 + 8 * (v4 >> 6) + 64) |= 1 << v4;
  v5 = (_QWORD *)(*(_QWORD *)(v0 + 48) + 16 * v4);
  *v5 = v2;
  v5[1] = v3;
  *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v4) = v1;
}

void OUTLINED_FUNCTION_4_1()
{
  void *v0;

}

void OUTLINED_FUNCTION_5_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_235F6B0A8(v1, v0);
}

unint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_235F9B5AC();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_235F9B5AC();
}

void OUTLINED_FUNCTION_14_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_18_1()
{
  sub_235F7E138();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return sub_235F9B384();
}

void OUTLINED_FUNCTION_20_0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

void OUTLINED_FUNCTION_21_1()
{
  void *v0;

}

void OUTLINED_FUNCTION_22_1()
{
  void *v0;

}

id OUTLINED_FUNCTION_23_1()
{
  void *v0;

  return v0;
}

id OUTLINED_FUNCTION_24_1()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return sub_235F9B630();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_28_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_29_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

id OUTLINED_FUNCTION_31_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_32_1(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  uint64_t v0;
  NSObject *v1;
  unint64_t v2;

  return sub_235F70120(v0, v2, v1);
}

void OUTLINED_FUNCTION_34_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_35_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_235F6B140(v1, v0);
}

id OUTLINED_FUNCTION_36_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

BOOL OUTLINED_FUNCTION_37_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_38_0(id a1, SEL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  return objc_msgSend(a1, a2, v8, 0, va);
}

id OUTLINED_FUNCTION_40_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_41()
{
  void *v0;

}

unint64_t OUTLINED_FUNCTION_43()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_235F9B0F0();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_235F9B51C();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_235F9B084();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  unint64_t v7;
  va_list va;

  va_start(va, a6);
  sub_235F7EC30(v6, v7, (uint64_t *)va);
}

void OUTLINED_FUNCTION_52()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_54()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

void OUTLINED_FUNCTION_57()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_58()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_60()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_61()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_235F9B3FC();
}

id OUTLINED_FUNCTION_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  return a15;
}

void OUTLINED_FUNCTION_68()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_70()
{
  uint64_t v0;
  unint64_t v1;

  return sub_235F6B140(v0, v1);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_235F9B0FC();
}

id OUTLINED_FUNCTION_72()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_235F9B3FC();
}

uint64_t OUTLINED_FUNCTION_76()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_78()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

unint64_t sub_235F72D94()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_235F72DB0()
{
  uint64_t v0;

  v0 = type metadata accessor for AMLSODAUserHostEnvironment();
  sub_235F72DE8();
  return v0;
}

unint64_t sub_235F72DE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256399958;
  if (!qword_256399958)
  {
    v1 = type metadata accessor for AMLSODAUserHostEnvironment();
    result = MEMORY[0x23B7E7E48](&unk_235F9DAE8, v1);
    atomic_store(result, (unint64_t *)&qword_256399958);
  }
  return result;
}

uint64_t sub_235F72E28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t ObjCClassFromMetadata;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v0 = sub_235F9B090();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399960);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v8 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v9 = objc_msgSend(v8, sel_bundlePath);

  v10 = sub_235F9B3FC();
  v12 = v11;

  v15[0] = v10;
  v15[1] = v12;
  sub_235F9B420();
  sub_235F9B420();
  v13 = sub_235F9B0D8();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD7A0], v0);
  return sub_235F9B0CC();
}

uint64_t sub_235F72FC0()
{
  uint64_t v0;
  id v1;
  id v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256399968);
  sub_235F9B2DC();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_235F9D750;
  v1 = (id)*MEMORY[0x24BE0C0D8];
  OUTLINED_FUNCTION_0_2();
  v2 = (id)*MEMORY[0x24BE0C1C0];
  OUTLINED_FUNCTION_0_2();
  return v0;
}

uint64_t AMLSODAHostTask.__allocating_init(taskId:taskName:hostParams:)()
{
  swift_allocObject();
  return _s6AeroML15AMLSODAHostTaskC6taskId0E4Name10hostParamsACSS_SS23SearchOnDeviceAnalytics08SODAHostI0CSgtcfc_0();
}

uint64_t AMLSODAHostTask.__deallocating_deinit()
{
  _s6AeroML15AMLSODAHostTaskCfd_0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AMLSODAHostTask()
{
  uint64_t result;

  result = qword_256399970;
  if (!qword_256399970)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235F73124()
{
  return swift_initClassMetadata2();
}

uint64_t sub_235F73160()
{
  return type metadata accessor for AMLSODAHostTask();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_235F9B2D0();
}

void sub_235F73174(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a1 + 16) && (v4 = OUTLINED_FUNCTION_315(), (v5 & 1) != 0))
  {
    sub_235F6B0A8(*(_QWORD *)(v2 + 56) + 32 * v4, (uint64_t)a2);
  }
  else
  {
    *a2 = 0u;
    a2[1] = 0u;
    OUTLINED_FUNCTION_34();
  }
}

uint64_t sub_235F731BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  char v4;

  if (*(_QWORD *)(a3 + 16) && (v3 = OUTLINED_FUNCTION_315(), (v4 & 1) != 0))
    return OUTLINED_FUNCTION_314(v3);
  else
    return 0;
}

uint64_t sub_235F731FC(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  char v3;

  if (*(_QWORD *)(a2 + 16) && (v2 = sub_235F7F3E4(a1), (v3 & 1) != 0))
    return OUTLINED_FUNCTION_314(v2);
  else
    return 0;
}

void sub_235F7323C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  char v4;

  if (*(_QWORD *)(a3 + 16))
  {
    v3 = OUTLINED_FUNCTION_315();
    if ((v4 & 1) != 0)
    {
      OUTLINED_FUNCTION_314(v3);
      swift_bridgeObjectRetain();
    }
  }
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F73270()
{
  uint64_t v0;

  v0 = sub_235F9B384();
  __swift_allocate_value_buffer(v0, qword_25639A758);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A758);
  return sub_235F9B378();
}

uint64_t sub_235F732F0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v5;

  if ((a3 & 1) != 0)
    v3 = 0x72456D6F74737563;
  else
    v3 = 0x7461507974706D65;
  v5 = v3;
  sub_235F9B420();
  sub_235F9B420();
  return v5;
}

BOOL sub_235F7337C(char a1, char a2)
{
  return a1 == a2;
}

void sub_235F7338C()
{
  sub_235F9B744();
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F733AC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x50676E6967676F6CLL && a2 == 0xEB00000000687461;
  if (v3 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
  {
    OUTLINED_FUNCTION_27_1();
    return 0;
  }
  else
  {
    v6 = a1 == 0x64496B736174 && a2 == 0xE600000000000000;
    if (v6 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
    {
      OUTLINED_FUNCTION_27_1();
      return 1;
    }
    else if (a1 == 0x656D614E6B736174 && a2 == 0xE800000000000000)
    {
      OUTLINED_FUNCTION_27_1();
      return 2;
    }
    else
    {
      v8 = OUTLINED_FUNCTION_31_2();
      OUTLINED_FUNCTION_27_1();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_235F734D4()
{
  sub_235F9B738();
  sub_235F9B744();
  return sub_235F9B750();
}

uint64_t sub_235F73518(char a1)
{
  return *(_QWORD *)&aLoggingptaskid[8 * a1];
}

uint64_t sub_235F73538()
{
  uint64_t v0;

  return sub_235F732F0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

BOOL sub_235F73544(char *a1, char *a2)
{
  return sub_235F7337C(*a1, *a2);
}

uint64_t sub_235F73550()
{
  return sub_235F734D4();
}

void sub_235F73558()
{
  sub_235F7338C();
}

uint64_t sub_235F73560()
{
  sub_235F9B738();
  sub_235F9B744();
  return sub_235F9B750();
}

uint64_t sub_235F735A0()
{
  char *v0;

  return sub_235F73518(*v0);
}

uint64_t sub_235F735A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235F733AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235F735CC()
{
  return 0;
}

void sub_235F735D8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_235F735E4()
{
  sub_235F7385C();
  return sub_235F9B774();
}

uint64_t sub_235F7360C()
{
  sub_235F7385C();
  return sub_235F9B780();
}

_QWORD *AMLSODAConfig.__allocating_init(loggingPath:taskId:taskName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *result;

  result = (_QWORD *)OUTLINED_FUNCTION_1();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  result[7] = a6;
  return result;
}

_QWORD *AMLSODAConfig.init(loggingPath:taskId:taskName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  return v6;
}

uint64_t AMLSODAConfig.__allocating_init(from:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AMLSODAConfig.init(from:)();
  return v0;
}

_QWORD *AMLSODAConfig.init(from:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_56_0();
  v2 = v0;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563999C0);
  OUTLINED_FUNCTION_213();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_54_0();
  __swift_project_boxed_opaque_existential_0(v4, v4[3]);
  sub_235F7385C();
  sub_235F9B75C();
  if (v1)
  {
    type metadata accessor for AMLSODAConfig();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v0[2] = OUTLINED_FUNCTION_204();
    v0[3] = v6;
    v0[4] = OUTLINED_FUNCTION_204();
    v0[5] = v7;
    v9 = sub_235F9B684();
    v11 = v10;
    OUTLINED_FUNCTION_72_0();
    v2[6] = v9;
    v2[7] = v11;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2;
}

unint64_t sub_235F7385C()
{
  unint64_t result;

  result = qword_2563999C8;
  if (!qword_2563999C8)
  {
    result = MEMORY[0x23B7E7E48](&unk_235F9D994, &type metadata for AMLSODAConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563999C8);
  }
  return result;
}

uint64_t type metadata accessor for AMLSODAConfig()
{
  return objc_opt_self();
}

uint64_t sub_235F738B8()
{
  sub_235F9B5F4();
  OUTLINED_FUNCTION_69_0();
  sub_235F9B420();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_301();
  sub_235F9B420();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_301();
  sub_235F9B420();
  OUTLINED_FUNCTION_62();
  sub_235F9B420();
  OUTLINED_FUNCTION_27_1();
  sub_235F9B420();
  return 0;
}

uint64_t static AMLSODAConfig.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  BOOL v7;
  char v8;

  v4 = a1[2] == a2[2] && a1[3] == a2[3];
  if (v4 || (v5 = OUTLINED_FUNCTION_31_2(), result = 0, (v5 & 1) != 0))
  {
    v7 = a1[4] == a2[4] && a1[5] == a2[5];
    if (v7 || (v8 = OUTLINED_FUNCTION_31_2(), result = 0, (v8 & 1) != 0))
    {
      if (a1[6] == a2[6] && a1[7] == a2[7])
        return 1;
      else
        return sub_235F9B6C0();
    }
  }
  return result;
}

uint64_t AMLSODAConfig.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AMLSODAConfig.__deallocating_deinit()
{
  AMLSODAConfig.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_235F73A78(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999D0);
  OUTLINED_FUNCTION_233();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_25_0();
  v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_235F7385C();
  sub_235F9B768();
  OUTLINED_FUNCTION_121();
  if (!v1)
  {
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_121();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v8, v4);
}

uint64_t sub_235F73B80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AMLSODAConfig.__allocating_init(from:)();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_235F73BA8(_QWORD *a1)
{
  return sub_235F73A78(a1);
}

uint64_t sub_235F73BC8(_QWORD **a1, _QWORD **a2)
{
  return static AMLSODAConfig.== infix(_:_:)(*a1, *a2) & 1;
}

uint64_t sub_235F73BE8()
{
  return sub_235F738B8();
}

void sub_235F73C08()
{
  qword_25639A770 = 0x64695F7972657571;
  *(_QWORD *)algn_25639A778 = 0xE800000000000000;
}

void sub_235F73C2C()
{
  qword_25639A780 = 1802396018;
  *(_QWORD *)algn_25639A788 = 0xE400000000000000;
}

void sub_235F73C48()
{
  qword_25639A790 = 0x73745F6E776F6873;
  *(_QWORD *)algn_25639A798 = 0xE800000000000000;
}

void sub_235F73C6C()
{
  qword_25639A7A0 = 0x5F64656761676E65;
  *(_QWORD *)algn_25639A7A8 = 0xEA00000000007374;
}

void sub_235F73C94()
{
  qword_25639A7B0 = 0x6975675F72657375;
  *(_QWORD *)algn_25639A7B8 = 0xE900000000000064;
}

void sub_235F73CBC()
{
  strcpy((char *)&qword_25639A7C0, "cardSectionId");
  *(_WORD *)&algn_25639A7C8[6] = -4864;
}

void sub_235F73CEC()
{
  id v0;
  void *v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  OUTLINED_FUNCTION_69_0();
  v1 = (void *)sub_235F9B3F0();
  v2 = objc_msgSend(v0, sel_fileExistsAtPath_isDirectory_, v1, &v6);

  if (!v2 || (v6 & 1) == 0)
  {
    sub_235F9B5F4();
    swift_bridgeObjectRelease();
    sub_235F80BF8();
    swift_allocError();
    OUTLINED_FUNCTION_27_0();
    *(_QWORD *)v3 = v5;
    *(_QWORD *)(v3 + 8) = v4;
    *(_BYTE *)(v3 + 16) = 0;
    swift_willThrow();
  }
}

void sub_235F73E28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v2)
  {
    oslog = v2;
    -[NSObject logMessage:](v2, sel_logMessage_, a1);
  }
  else
  {
    if (qword_2563993D8 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_19_1();
    oslog = OUTLINED_FUNCTION_177(v3, (uint64_t)qword_25639A758);
    v4 = sub_235F9B51C();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_235F59000, oslog, v4, "AMLPhotosSearchPoirotMetricsLogging: Unable to get PETEventTracker2", v5, 2u);
      OUTLINED_FUNCTION_8_0();
    }
  }

}

uint64_t sub_235F73F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return sub_235F78D30(a1, a2, a3, a4, a5, 0, 0, a6);
}

void sub_235F73F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  BOOL v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;

  OUTLINED_FUNCTION_57_0();
  v2 = OUTLINED_FUNCTION_75_0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_168();
  MEMORY[0x24BDAC7A8](v4);
  v52 = (uint64_t)&v43 - v5;
  v6 = OUTLINED_FUNCTION_25_2();
  v53 = *(_QWORD **)(v6 - 8);
  v7 = v53;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_25_0();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_167();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v43 - v14;
  sub_235F9B27C();
  v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v7[2];
  v50(v1, v10, v6);
  sub_235F7F748();
  OUTLINED_FUNCTION_270();
  v16 = (void (*)(uint64_t, uint64_t))v53[1];
  v51 = v10;
  v17 = v10;
  v18 = v6;
  v49 = v16;
  v16(v17, v6);
  *(_QWORD *)(v1 + *(int *)(v11 + 36)) = v57;
  sub_235F7F788(v1, (uint64_t)v15);
  v19 = &v15[*(int *)(v11 + 36)];
  sub_235F9B4E0();
  OUTLINED_FUNCTION_198();
  if (!v30)
  {
    v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v47 = v15;
    v48 = MEMORY[0x24BEE4AD8] + 8;
    v45 = v19;
    v46 = v6;
    do
    {
      v53 = v20;
      v44 = v20 + 9;
      while (1)
      {
        sub_235F9B4F8();
        v21 = v52;
        OUTLINED_FUNCTION_130(v52, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
        OUTLINED_FUNCTION_105();
        v23 = v51;
        OUTLINED_FUNCTION_104(v51, (uint64_t)v15, v50);
        sub_235F9B4EC();
        v49(v23, v18);
        OUTLINED_FUNCTION_130(v0, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
        if (qword_256399400 != -1)
          swift_once();
        v24 = v3;
        v25 = v2;
        v26 = v0;
        sub_235F9B24C();
        if (!v56)
          goto LABEL_41;
        OUTLINED_FUNCTION_156();
        OUTLINED_FUNCTION_19_2();
        v28 = v54;
        v27 = v55;
        v29 = v53[2];
        if (!v29)
          goto LABEL_32;
        v30 = v53[4] == v54 && v53[5] == v55;
        if (!v30 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
        {
          if (v29 == 1)
            goto LABEL_32;
          v31 = v53[6] == v28 && v53[7] == v27;
          if (!v31 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
            break;
        }
LABEL_20:
        v3 = v24;
        v0 = v26;
        v2 = v25;
        OUTLINED_FUNCTION_209(v26, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
        OUTLINED_FUNCTION_35();
        v18 = v46;
        v15 = v47;
        OUTLINED_FUNCTION_201();
        OUTLINED_FUNCTION_198();
        if (v30)
          goto LABEL_39;
      }
      if (v29 != 2)
      {
        v32 = v44;
        v33 = 2;
        while (1)
        {
          v34 = v33 + 1;
          if (__OFADD__(v33, 1))
            break;
          v35 = *(v32 - 1) == v28 && *v32 == v27;
          if (v35 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
            goto LABEL_20;
          v32 += 2;
          ++v33;
          if (v34 == v29)
            goto LABEL_32;
        }
        __break(1u);
LABEL_41:
        __break(1u);
        return;
      }
LABEL_32:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        v2 = v25;
        v3 = v24;
        v36 = v53;
      }
      else
      {
        sub_235F7E1D8();
        v36 = v41;
        v2 = v25;
        v3 = v24;
      }
      v37 = v36[2];
      v38 = v37 + 1;
      v0 = v26;
      v39 = v45;
      v18 = v46;
      if (v37 >= v36[3] >> 1)
      {
        sub_235F7E1D8();
        v38 = v37 + 1;
        v36 = v42;
      }
      v15 = v47;
      v36[2] = v38;
      v40 = &v36[2 * v37];
      v40[4] = v28;
      v40[5] = v27;
      v20 = v36;
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
      v53 = *(_QWORD **)v39;
      OUTLINED_FUNCTION_201();
    }
    while (v53 != v57);
  }
LABEL_39:
  sub_235F729B0((uint64_t)v15, &qword_2563999F0);
  OUTLINED_FUNCTION_11_0();
}

void sub_235F74374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
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
  void (*v17)(uint64_t);
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __n128 *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;

  OUTLINED_FUNCTION_57_0();
  v43 = v5;
  v7 = v6;
  v50 = v8;
  v51 = OUTLINED_FUNCTION_75_0();
  v44 = *(_QWORD *)(v51 - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_168();
  MEMORY[0x24BDAC7A8](v10);
  v49 = (uint64_t)&v42 - v11;
  v12 = OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_147();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_95();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_38_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_137();
  sub_235F9B27C();
  v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v47(v2, v1, v12);
  sub_235F7F748();
  OUTLINED_FUNCTION_274();
  v17 = *(void (**)(uint64_t))(v4 + 8);
  v48 = v1;
  v46 = v17;
  ((void (*)(uint64_t, uint64_t))v17)(v1, v12);
  *(_QWORD *)(v2 + *(int *)(v14 + 36)) = v56;
  sub_235F7F788(v2, v0);
  v18 = (uint64_t *)(v0 + *(int *)(v14 + 36));
  v19 = *v18;
  v20 = OUTLINED_FUNCTION_46_0();
  v52 = v7;
  v21 = MEMORY[0x24BEE4AF8];
  if (v19 == v56)
  {
LABEL_2:
    OUTLINED_FUNCTION_217(v20, &qword_2563999F0);
    if ((v43 & 1) != 0)
    {
      v22 = MEMORY[0x24BEE0D00];
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
      v23 = (__n128 *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_290(v23, (__n128)xmmword_235F9D690);
      sub_235F9B5F4();
      OUTLINED_FUNCTION_228();
      OUTLINED_FUNCTION_227(0xD000000000000024);
      sub_235F9B420();
      OUTLINED_FUNCTION_180();
      v24 = OUTLINED_FUNCTION_17_0();
      MEMORY[0x23B7E7668](v24, v22);
      sub_235F9B420();
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_17();
      v25 = v56;
      v26 = v57;
      v23[3].n128_u64[1] = v22;
      v23[2].n128_u64[0] = v25;
      v23[2].n128_u64[1] = v26;
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_20();
    }
    OUTLINED_FUNCTION_11_0();
    return;
  }
  v45 = MEMORY[0x24BEE4AD8] + 8;
  v27 = v44;
  while (1)
  {
    sub_235F9B4F8();
    v28 = v49;
    OUTLINED_FUNCTION_104(v49, v29, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 16));
    OUTLINED_FUNCTION_105();
    v47(v48, v0, v12);
    sub_235F9B4EC();
    v30 = OUTLINED_FUNCTION_141();
    v46(v30);
    OUTLINED_FUNCTION_104(v3, v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 32));
    if (qword_256399400 != -1)
      swift_once();
    OUTLINED_FUNCTION_254();
    v31 = v52;
    if (!v55)
      break;
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_19_2();
    if (v53 == v50 && v54 == v31)
    {
      OUTLINED_FUNCTION_23();
    }
    else
    {
      v33 = OUTLINED_FUNCTION_31_2();
      OUTLINED_FUNCTION_35();
      if ((v33 & 1) == 0)
        goto LABEL_24;
    }
    if (qword_256399408 != -1)
      swift_once();
    OUTLINED_FUNCTION_254();
    if (!v55)
      goto LABEL_27;
    OUTLINED_FUNCTION_53_0();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_19_2();
    v35 = v53;
    v34 = v54;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_98();
      sub_235F7E1D8();
      v21 = v40;
    }
    v37 = *(_QWORD *)(v21 + 16);
    v36 = *(_QWORD *)(v21 + 24);
    if (v37 >= v36 >> 1)
    {
      OUTLINED_FUNCTION_299(v36);
      sub_235F7E1D8();
      v21 = v41;
    }
    *(_QWORD *)(v21 + 16) = v37 + 1;
    v38 = v21 + 16 * v37;
    *(_QWORD *)(v38 + 32) = v35;
    *(_QWORD *)(v38 + 40) = v34;
    v27 = v44;
LABEL_24:
    OUTLINED_FUNCTION_209(v3, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
    v39 = *v18;
    v20 = OUTLINED_FUNCTION_46_0();
    if (v39 == v56)
      goto LABEL_2;
  }
  __break(1u);
LABEL_27:
  __break(1u);
}

void sub_235F74760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t (*v57)(void);
  unint64_t v58;
  uint64_t (*v59)(void);
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  uint64_t *v90;
  uint64_t v91;
  BOOL v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  char v97;
  unint64_t v98;
  char v99;
  unint64_t v100;
  char v101;
  uint64_t *v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t v105;
  BOOL v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BOOL8 v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  __n128 *v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, _QWORD);
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t v129;
  __n128 *v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t v134[2];
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  unint64_t v151;
  char *v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;

  OUTLINED_FUNCTION_57_0();
  a19 = v23;
  a20 = v24;
  v140 = v25;
  v27 = v26;
  v142 = v28;
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999D8);
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v145 - 8));
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_139(v30);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999E0);
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v138 - 8));
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_135(v32, v134[0]);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999E8);
  OUTLINED_FUNCTION_138(v33, (uint64_t)&v162);
  OUTLINED_FUNCTION_5_2(v34);
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_42();
  v147 = v36;
  v146 = OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v146 - 8));
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_42();
  v149 = v38;
  v39 = OUTLINED_FUNCTION_309();
  OUTLINED_FUNCTION_138(v39, (uint64_t)&v161);
  OUTLINED_FUNCTION_5_2(v40);
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_64_0();
  v134[0] = v43;
  v44 = OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v44 - 8));
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_64_0();
  v155 = v47;
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_296();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v49);
  v51 = (char *)v134 - v50;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_275();
  MEMORY[0x24BDAC7A8](v54);
  v56 = (char *)v134 - v55;
  v139 = v27;
  sub_235F9B27C();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_170(v57);
  v58 = sub_235F7F748();
  OUTLINED_FUNCTION_207();
  sub_235F9B4D4();
  v59 = *(uint64_t (**)(void))(v21 + 8);
  v154 = v51;
  v60 = (uint64_t)v56;
  OUTLINED_FUNCTION_170(v59);
  *(_QWORD *)(v20 + *(int *)(v52 + 36)) = v165;
  sub_235F7F788(v20, (uint64_t)v56);
  v61 = (uint64_t *)&v56[*(int *)(v52 + 36)];
  v62 = *v61;
  OUTLINED_FUNCTION_207();
  sub_235F9B4E0();
  OUTLINED_FUNCTION_198();
  v159 = v22;
  if (v92)
  {
    v82 = MEMORY[0x24BEE4AF8];
    v78 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_4:
    v63 = MEMORY[0x24BEE0D00];
    sub_235F729B0(v60, &qword_2563999F0);
    if (*(_QWORD *)(v82 + 16))
    {
      v64 = (uint64_t)v78;
      OUTLINED_FUNCTION_160();
      v65 = sub_235F9B294();
      MEMORY[0x24BDAC7A8](v65);
      OUTLINED_FUNCTION_2_2();
      v66 = sub_235F757A0((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F7F9F0, v62, v82);
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v67);
      OUTLINED_FUNCTION_2_2();
      v155 = OUTLINED_FUNCTION_312((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F7FA08);
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v68);
      OUTLINED_FUNCTION_2_2();
      v158 = OUTLINED_FUNCTION_312((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F7FA3C);
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v69);
      OUTLINED_FUNCTION_2_2();
      v156 = OUTLINED_FUNCTION_128((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F7FA70);
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v70);
      OUTLINED_FUNCTION_2_2();
      v157 = OUTLINED_FUNCTION_313((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F7FAA0);
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v71);
      OUTLINED_FUNCTION_2_2();
      v72 = OUTLINED_FUNCTION_313((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F7FAD4);
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v73);
      OUTLINED_FUNCTION_2_2();
      v160 = OUTLINED_FUNCTION_128((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F7FB08);
      v74 = OUTLINED_FUNCTION_43_0();
      MEMORY[0x24BDAC7A8](v74);
      OUTLINED_FUNCTION_2_2();
      v75 = OUTLINED_FUNCTION_128((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F7FB3C);
      v76 = OUTLINED_FUNCTION_43_0();
      MEMORY[0x24BDAC7A8](v76);
      OUTLINED_FUNCTION_2_2();
      v81 = OUTLINED_FUNCTION_128((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F7FB70);
      OUTLINED_FUNCTION_62_0();
      if (*(_QWORD *)(v75 + 16))
      {
        if (qword_256399408 != -1)
LABEL_84:
          swift_once();
        v165 = v75;
        OUTLINED_FUNCTION_266();
        OUTLINED_FUNCTION_174();
        OUTLINED_FUNCTION_176(&qword_256399A10);
        v77 = v147;
        sub_235F9B2C4();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_52_0(v77, *(uint64_t (**)(uint64_t, _QWORD))(v148 + 8));
      }
      else
      {
        OUTLINED_FUNCTION_35();
      }
      if (*(_QWORD *)(v72 + 16))
      {
        if (qword_2563993F8 != -1)
          swift_once();
        v165 = v72;
        OUTLINED_FUNCTION_58_0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399A18);
        sub_235F7FBA0(&qword_256399A20, &qword_256399A18);
        v121 = v136;
        OUTLINED_FUNCTION_60();
        sub_235F9B2C4();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_52_0(v121, *(uint64_t (**)(uint64_t, _QWORD))(v137 + 8));
      }
      else
      {
        OUTLINED_FUNCTION_39();
      }
      if (*(_QWORD *)(v66 + 16))
      {
        v165 = v66;
        OUTLINED_FUNCTION_182();
        OUTLINED_FUNCTION_194(&qword_256399A30);
        OUTLINED_FUNCTION_69_0();
        sub_235F9B2C4();
        OUTLINED_FUNCTION_32_2();
        v122 = OUTLINED_FUNCTION_199();
        OUTLINED_FUNCTION_52_0(v122, v123);
      }
      else
      {
        OUTLINED_FUNCTION_9_1();
      }
      v124 = v143;
      if (*(_QWORD *)(v81 + 16))
      {
        v165 = v81;
        OUTLINED_FUNCTION_182();
        OUTLINED_FUNCTION_194(&qword_256399A10);
        OUTLINED_FUNCTION_69_0();
        OUTLINED_FUNCTION_126();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_152();
      }
      else
      {
        OUTLINED_FUNCTION_20();
      }
      v125 = v155;
      if (*(_QWORD *)(v155 + 16))
      {
        if (qword_2563993E0 != -1)
          swift_once();
        v165 = v125;
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_248();
        OUTLINED_FUNCTION_236(&qword_256399A30);
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_52_0(v64, *(uint64_t (**)(uint64_t, _QWORD))(v144 + 8));
      }
      else
      {
        OUTLINED_FUNCTION_20();
      }
      v126 = OUTLINED_FUNCTION_256();
      if (*(_QWORD *)(v126 + 16))
      {
        if (qword_2563993E8 != -1)
        {
          swift_once();
          v126 = OUTLINED_FUNCTION_256();
        }
        v165 = v126;
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_248();
        OUTLINED_FUNCTION_236(&qword_256399A30);
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_52_0(v64, *(uint64_t (**)(uint64_t, _QWORD))(v144 + 8));
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (*(_QWORD *)(v156 + 16))
      {
        v165 = v156;
        OUTLINED_FUNCTION_182();
        OUTLINED_FUNCTION_194(&qword_256399A10);
        OUTLINED_FUNCTION_69_0();
        OUTLINED_FUNCTION_126();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_152();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v127 = v157;
      if (*(_QWORD *)(v157 + 16))
      {
        if (qword_2563993F0 != -1)
          swift_once();
        v165 = v127;
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_248();
        OUTLINED_FUNCTION_236(&qword_256399A20);
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_52_0(v64, *(uint64_t (**)(uint64_t, _QWORD))(v137 + 8));
      }
      else
      {
        OUTLINED_FUNCTION_20();
      }
      v128 = v160;
      if (*(_QWORD *)(v160 + 16))
      {
        if (qword_256399400 != -1)
        {
          swift_once();
          v128 = v160;
        }
        v165 = v128;
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_248();
        OUTLINED_FUNCTION_236(&qword_256399A10);
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_32_2();
        (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v64, v124);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if ((v140 & 1) != 0)
      {
        v129 = v134[1];
        OUTLINED_FUNCTION_51_0();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
        v130 = (__n128 *)OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_143(v130, (__n128)xmmword_235F9D690);
        OUTLINED_FUNCTION_228();
        OUTLINED_FUNCTION_27_0();
        v165 = 0xD00000000000001ALL;
        v166 = v131;
        sub_235F9B228();
        OUTLINED_FUNCTION_289();
        OUTLINED_FUNCTION_27_1();
        v132 = v165;
        v133 = v166;
        v130[3].n128_u64[1] = MEMORY[0x24BEE0D00];
        v130[2].n128_u64[0] = v132;
        v130[2].n128_u64[1] = v133;
        OUTLINED_FUNCTION_12_2();
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_52_0(v129, *(uint64_t (**)(uint64_t, _QWORD))(v135 + 8));
      }
      OUTLINED_FUNCTION_107((uint64_t)&a15);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 32))(v142, v149, v146);
    }
    else
    {
      OUTLINED_FUNCTION_43_0();
      v116 = v139;
      if ((v140 & 1) != 0)
      {
        v117 = v134[0];
        OUTLINED_FUNCTION_51_0();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
        v118 = (__n128 *)OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_143(v118, (__n128)xmmword_235F9D690);
        OUTLINED_FUNCTION_228();
        OUTLINED_FUNCTION_227(0xD00000000000001ALL);
        sub_235F9B228();
        OUTLINED_FUNCTION_289();
        OUTLINED_FUNCTION_27_1();
        v119 = v165;
        v120 = v166;
        v118[3].n128_u64[1] = v63;
        v118[2].n128_u64[0] = v119;
        v118[2].n128_u64[1] = v120;
        OUTLINED_FUNCTION_12_2();
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_52_0(v117, *(uint64_t (**)(uint64_t, _QWORD))(v135 + 8));
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 16))(v142, v116, v146);
    }
    OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_11_0();
    return;
  }
  v78 = (_QWORD *)MEMORY[0x24BEE4B00];
  v153 = MEMORY[0x24BEE4AD8] + 8;
  v79 = v156;
  v80 = v157;
  v81 = v44;
  v82 = MEMORY[0x24BEE4AF8];
  v152 = v56;
  v151 = v58;
  v150 = v61;
  while (1)
  {
    v160 = v82;
    v158 = (uint64_t)v78;
    OUTLINED_FUNCTION_238();
    sub_235F9B4F8();
    v83 = v155;
    OUTLINED_FUNCTION_130(v155, v84, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 16));
    OUTLINED_FUNCTION_247((uint64_t)&v165);
    OUTLINED_FUNCTION_148();
    OUTLINED_FUNCTION_107((uint64_t)&a11);
    sub_235F9B4EC();
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_107((uint64_t)&a15);
    OUTLINED_FUNCTION_130(v80, v83, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 32));
    if (qword_256399408 != -1)
      swift_once();
    OUTLINED_FUNCTION_230();
    if (!v164)
      break;
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_19_2();
    v64 = v162;
    v85 = v163;
    v86 = v158;
    v87 = v160;
    if (qword_256399400 != -1)
      swift_once();
    OUTLINED_FUNCTION_230();
    if (!v164)
      goto LABEL_86;
    OUTLINED_FUNCTION_53_0();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_19_2();
    v66 = v162;
    v72 = v163;
    if (!*(_QWORD *)(v86 + 16))
      goto LABEL_23;
    OUTLINED_FUNCTION_17_0();
    v88 = OUTLINED_FUNCTION_205();
    if ((v89 & 1) == 0)
    {
      OUTLINED_FUNCTION_39();
LABEL_23:
      v75 = sub_235F9B234();
      v93 = v86;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v108 = OUTLINED_FUNCTION_98();
        sub_235F7E28C(v108, v109, v110, v87, &qword_256399BE8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
        v87 = v111;
      }
      v95 = *(_QWORD *)(v87 + 16);
      v94 = *(_QWORD *)(v87 + 24);
      if (v95 >= v94 >> 1)
      {
        v112 = OUTLINED_FUNCTION_298(v94);
        sub_235F7E28C(v112, v113, v114, v87, &qword_256399BE8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
        v87 = v115;
      }
      *(_QWORD *)(v87 + 16) = v95 + 1;
      v160 = v87;
      *(_QWORD *)(v87 + 8 * v95 + 32) = v75;
      v86 = v93;
      goto LABEL_28;
    }
    v90 = (uint64_t *)(*(_QWORD *)(v86 + 56) + 16 * v88);
    v75 = *v90;
    v91 = v90[1];
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_39();
    v92 = v75 == v64 && v91 == v85;
    if (v92)
    {
      OUTLINED_FUNCTION_17();
      goto LABEL_28;
    }
    v75 = OUTLINED_FUNCTION_31_2();
    OUTLINED_FUNCTION_27_1();
    if ((v75 & 1) == 0)
      goto LABEL_23;
LABEL_28:
    swift_isUniquelyReferenced_nonNull_native();
    v165 = v86;
    v96 = OUTLINED_FUNCTION_205();
    if (__OFADD__(*(_QWORD *)(v86 + 16), (v97 & 1) == 0))
    {
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    v98 = v96;
    v99 = v97;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399A00);
    v75 = (uint64_t)&v165;
    if ((sub_235F9B630() & 1) != 0)
    {
      v75 = v165;
      v100 = sub_235F7F384();
      if ((v99 & 1) != (v101 & 1))
        goto LABEL_87;
      v98 = v100;
    }
    v78 = (_QWORD *)v165;
    if ((v99 & 1) != 0)
    {
      v102 = (uint64_t *)(*(_QWORD *)(v165 + 56) + 16 * v98);
      swift_bridgeObjectRelease();
      *v102 = v64;
      v102[1] = v85;
    }
    else
    {
      OUTLINED_FUNCTION_100(v165 + 8 * (v98 >> 6));
      v103 = (uint64_t *)(v78[6] + 16 * v98);
      *v103 = v66;
      v103[1] = v72;
      v104 = (uint64_t *)(v78[7] + 16 * v98);
      *v104 = v64;
      v104[1] = v85;
      v105 = v78[2];
      v106 = __OFADD__(v105, 1);
      v107 = v105 + 1;
      if (v106)
        goto LABEL_83;
      v78[2] = v107;
      OUTLINED_FUNCTION_17_0();
    }
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_85();
    v79 = v156;
    v80 = v157;
    (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v157, v81);
    v62 = *v150;
    v60 = (uint64_t)v152;
    sub_235F9B4E0();
    OUTLINED_FUNCTION_198();
    v82 = v160;
    if (v92)
      goto LABEL_4;
  }
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  sub_235F9B6D8();
  __break(1u);
}

uint64_t sub_235F757A0(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_235F7FCF4();
    v6 = v16;
    v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      v10 = *v9++;
      v14 = v10;
      a1(&v15, &v14);
      if (v4)
        break;
      v4 = 0;
      v11 = v15;
      v16 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      if (v12 >= *(_QWORD *)(v6 + 24) >> 1)
      {
        sub_235F7FCF4();
        v6 = v16;
      }
      *(_QWORD *)(v6 + 16) = v12 + 1;
      *(_QWORD *)(v6 + 8 * v12 + 32) = v11;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_235F758A8(void (*a1)(_QWORD *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v18 = MEMORY[0x24BEE4AF8];
    sub_235F7FCD8();
    v6 = v18;
    v8 = (uint64_t *)(a3 + 32);
    while (1)
    {
      v9 = *v8++;
      v16 = v9;
      a1(v17, &v16);
      if (v4)
        break;
      v4 = 0;
      v11 = v17[0];
      v10 = v17[1];
      v18 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      if (v12 >= *(_QWORD *)(v6 + 24) >> 1)
      {
        sub_235F7FCD8();
        v6 = v18;
      }
      *(_QWORD *)(v6 + 16) = v12 + 1;
      v13 = v6 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v11;
      *(_QWORD *)(v13 + 40) = v10;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_235F759AC(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_235F7FCBC();
    v6 = v16;
    v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      v10 = *v9++;
      v14 = v10;
      a1(&v15, &v14);
      if (v4)
        break;
      v4 = 0;
      v11 = v15;
      v16 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      if (v12 >= *(_QWORD *)(v6 + 24) >> 1)
      {
        sub_235F7FCBC();
        v6 = v16;
      }
      *(_QWORD *)(v6 + 16) = v12 + 1;
      *(_DWORD *)(v6 + 4 * v12 + 32) = v11;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

void sub_235F75AB4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  OUTLINED_FUNCTION_57_0();
  v41 = v2;
  OUTLINED_FUNCTION_309();
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_95();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563999D8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999E0);
  v45 = *(_QWORD *)(v5 - 8);
  v46 = v5;
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_42();
  v44 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563999E8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_211();
  v9 = sub_235F9B264();
  v42 = *(_QWORD *)(v9 - 8);
  v43 = v9;
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_94();
  sub_235F9B294();
  sub_235F9B27C();
  v11 = sub_235F9B258();
  if (v11 < 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  v12 = sub_235F8F118(0, v11);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_7_2();
  v14 = sub_235F7657C((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80A80, v13, (uint64_t)v12);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_7_2();
  v0 = sub_235F766C8((void (*)(_QWORD *__return_ptr, _QWORD))sub_235F80A98, v15, (uint64_t)v12);
  OUTLINED_FUNCTION_55_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_7_2();
  v34 = OUTLINED_FUNCTION_292((void (*)(_QWORD *__return_ptr, _QWORD))sub_235F80ACC, v17);
  OUTLINED_FUNCTION_55_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_7_2();
  v35 = OUTLINED_FUNCTION_293((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80AE4, v19);
  OUTLINED_FUNCTION_55_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_7_2();
  v36 = OUTLINED_FUNCTION_292((void (*)(_QWORD *__return_ptr, _QWORD))sub_235F80B14, v21);
  OUTLINED_FUNCTION_55_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_7_2();
  v39 = OUTLINED_FUNCTION_292((void (*)(_QWORD *__return_ptr, _QWORD))sub_235F80B48, v23);
  OUTLINED_FUNCTION_55_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_7_2();
  v37 = OUTLINED_FUNCTION_293((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80B7C, v25);
  OUTLINED_FUNCTION_55_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_7_2();
  v38 = sub_235F766C8((void (*)(_QWORD *__return_ptr, _QWORD))sub_235F80BAC, v27, (uint64_t)v12);
  OUTLINED_FUNCTION_55_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_7_2();
  v40 = OUTLINED_FUNCTION_293((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80BE0, v29);
  OUTLINED_FUNCTION_278();
  if (*(_QWORD *)(v14 + 16))
  {
    if (qword_256399408 == -1)
    {
LABEL_4:
      OUTLINED_FUNCTION_34_2();
      OUTLINED_FUNCTION_174();
      OUTLINED_FUNCTION_176(&qword_256399A10);
      OUTLINED_FUNCTION_49();
      sub_235F9B2C4();
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_71_0();
      goto LABEL_6;
    }
LABEL_44:
    swift_once();
    goto LABEL_4;
  }
  OUTLINED_FUNCTION_35();
LABEL_6:
  if (*(_QWORD *)(v0 + 16))
  {
    if (qword_2563993F8 != -1)
      swift_once();
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_172();
    OUTLINED_FUNCTION_190(&qword_256399A20);
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_86();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
  }
  else
  {
    OUTLINED_FUNCTION_9_1();
  }
  if (*(_QWORD *)(v34 + 16))
  {
    OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_176(&qword_256399A30);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_197();
    sub_235F9B2C4();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_106();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v35 + 16))
  {
    OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_176(&qword_256399A10);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_162();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_71_0();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v36 + 16))
  {
    if (qword_2563993E0 != -1)
      swift_once();
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_172();
    OUTLINED_FUNCTION_190(&qword_256399A30);
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_106();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(_QWORD *)(v39 + 16))
  {
    if (qword_2563993E8 != -1)
      swift_once();
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_172();
    OUTLINED_FUNCTION_190(&qword_256399A30);
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_106();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v37 + 16))
  {
    OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_176(&qword_256399A10);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_162();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_71_0();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v38 + 16))
  {
    if (qword_2563993F0 != -1)
      swift_once();
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_172();
    OUTLINED_FUNCTION_190(&qword_256399A20);
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_86();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(_QWORD *)(v40 + 16))
  {
    if (qword_256399400 != -1)
      swift_once();
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_172();
    OUTLINED_FUNCTION_190(&qword_256399A10);
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_71_0();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if ((v41 & 1) != 0)
  {
    v30 = MEMORY[0x24BEE0D00];
    OUTLINED_FUNCTION_51_0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
    v31 = OUTLINED_FUNCTION_1();
    *(_OWORD *)(v31 + 16) = xmmword_235F9D690;
    sub_235F9B5F4();
    swift_bridgeObjectRelease();
    sub_235F9B420();
    OUTLINED_FUNCTION_180();
    OUTLINED_FUNCTION_153();
    sub_235F9B228();
    sub_235F9B420();
    OUTLINED_FUNCTION_20();
    *(_QWORD *)(v31 + 56) = v30;
    *(_QWORD *)(v31 + 32) = 0xD00000000000001DLL;
    *(_QWORD *)(v31 + 40) = 0x8000000235F9FB90;
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_27_1();
    v32 = OUTLINED_FUNCTION_199();
    OUTLINED_FUNCTION_52_0(v32, v33);
  }
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v1, v43);
  OUTLINED_FUNCTION_11_0();
}

uint64_t sub_235F76340@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(char *, uint64_t);
  uint64_t result;
  char v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _OWORD v25[2];

  v20 = a3;
  v5 = sub_235F9B240();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v19 - v10;
  sub_235F9B270();
  if (qword_256399400 != -1)
    swift_once();
  sub_235F9B24C();
  v12 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  result = v12(v11, v5);
  if (v24)
  {
    sub_235F6E7A4(&v23, v25);
    swift_dynamicCast();
    if (v21 == a1 && v22 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = sub_235F9B6C0();
      result = swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
        v16 = v20;
        *v20 = 0;
        v16[1] = 0;
        return result;
      }
    }
    sub_235F9B270();
    if (qword_256399408 != -1)
      swift_once();
    sub_235F9B24C();
    result = v12(v9, v5);
    if (v24)
    {
      sub_235F6E7A4(&v23, v25);
      result = swift_dynamicCast();
      v17 = v22;
      v18 = v20;
      *v20 = v21;
      v18[1] = v17;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_235F7657C(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v14 = *(_QWORD *)(a3 + 16);
  if (!v14)
    return MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v5 = 0;
  v6 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v18 = *(_QWORD *)(a3 + 8 * v5 + 32);
    a1(&v16, &v18);
    if (v3)
      break;
    v7 = v17;
    if (v17)
    {
      v8 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F7E1D8();
        v6 = v11;
      }
      v9 = *(_QWORD *)(v6 + 16);
      if (v9 >= *(_QWORD *)(v6 + 24) >> 1)
      {
        sub_235F7E1D8();
        v6 = v12;
      }
      *(_QWORD *)(v6 + 16) = v9 + 1;
      v10 = v6 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v8;
      *(_QWORD *)(v10 + 40) = v7;
    }
    if (v14 == ++v5)
    {
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_235F766C8(void (*a1)(_QWORD *__return_ptr, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v14)(_QWORD *__return_ptr, _QWORD);
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = MEMORY[0x24BEE4AF8];
  v14 = a1;
  while (1)
  {
    v16 = *(_QWORD *)(a3 + 8 * v7 + 32);
    a1(&v15, &v16);
    if (v3)
      break;
    if ((v15 & 0x100000000) == 0)
    {
      v9 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F7E354();
        v8 = v11;
      }
      v10 = *(_QWORD *)(v8 + 16);
      if (v10 >= *(_QWORD *)(v8 + 24) >> 1)
      {
        sub_235F7E354();
        v8 = v12;
      }
      *(_QWORD *)(v8 + 16) = v10 + 1;
      *(_DWORD *)(v8 + 4 * v10 + 32) = v9;
      a1 = v14;
    }
    if (v4 == ++v7)
    {
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_235F76814(void (*a1)(_QWORD *__return_ptr, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v15)(_QWORD *__return_ptr, _QWORD);
  uint64_t v16;
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = MEMORY[0x24BEE4AF8];
  v15 = a1;
  while (1)
  {
    v18 = *(_QWORD *)(a3 + 8 * v7 + 32);
    a1(&v16, &v18);
    if (v3)
      break;
    if ((v17 & 1) == 0)
    {
      v9 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F7E28C(0, *(_QWORD *)(v8 + 16) + 1, 1, v8, &qword_256399BB8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
        v8 = v12;
      }
      v11 = *(_QWORD *)(v8 + 16);
      v10 = *(_QWORD *)(v8 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_235F7E28C(v10 > 1, v11 + 1, 1, v8, &qword_256399BB8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
        v8 = v13;
      }
      *(_QWORD *)(v8 + 16) = v11 + 1;
      *(_QWORD *)(v8 + 8 * v11 + 32) = v9;
      a1 = v15;
    }
    if (v4 == ++v7)
    {
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_235F76980@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(char *, uint64_t);
  uint64_t result;
  char v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  _OWORD v24[2];

  v19 = a3;
  v5 = sub_235F9B240();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - v10;
  sub_235F9B270();
  if (qword_256399400 != -1)
    swift_once();
  sub_235F9B24C();
  v12 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  result = v12(v11, v5);
  if (v23)
  {
    sub_235F6E7A4(&v22, v24);
    swift_dynamicCast();
    if (v20 == a1 && v21 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = sub_235F9B6C0();
      result = swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
        v16 = v19;
        *v19 = 0;
        *((_BYTE *)v16 + 8) = 1;
        return result;
      }
    }
    sub_235F9B270();
    sub_235F9B24C();
    result = v12(v9, v5);
    if (v23)
    {
      sub_235F6E7A4(&v22, v24);
      v17 = v19;
      result = swift_dynamicCast();
      *((_BYTE *)v17 + 8) = 0;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_235F76BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_77_0(v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_74();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_97();
  if (qword_256399400 != -1)
    swift_once();
  OUTLINED_FUNCTION_212();
  OUTLINED_FUNCTION_149(v2);
  if (v16)
  {
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_19_2();
    if (v14 == v1 && v15 == v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_175();
      OUTLINED_FUNCTION_64();
      if ((v0 & 1) == 0)
      {
        *(_QWORD *)v13 = 0;
        *(_BYTE *)(v13 + 8) = 1;
LABEL_14:
        OUTLINED_FUNCTION_184();
        OUTLINED_FUNCTION_8_2();
        return;
      }
    }
    OUTLINED_FUNCTION_119();
    if (*v12 != -1)
      swift_once();
    OUTLINED_FUNCTION_83();
    OUTLINED_FUNCTION_149(v3);
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_19_2();
    *(_BYTE *)(v13 + 8) = 0;
    goto LABEL_14;
  }
  __break(1u);
  __break(1u);
}

void sub_235F76D14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_56_0();
  v16[1] = v1;
  v16[2] = v2;
  v4 = v3;
  v6 = v5;
  v17 = v7;
  sub_235F9B240();
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_167();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v16 - v10;
  OUTLINED_FUNCTION_269();
  if (qword_256399400 != -1)
    swift_once();
  sub_235F9B24C();
  OUTLINED_FUNCTION_149((uint64_t)v11);
  if (v20)
  {
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_19_2();
    if (v18 == v6 && v19 == v4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_235F9B6C0();
      OUTLINED_FUNCTION_64();
      if ((v6 & 1) == 0)
      {
        v13 = v17;
        *v17 = 0;
        v13[1] = 0;
LABEL_13:
        OUTLINED_FUNCTION_184();
        OUTLINED_FUNCTION_8_2();
        return;
      }
    }
    OUTLINED_FUNCTION_269();
    OUTLINED_FUNCTION_212();
    OUTLINED_FUNCTION_149(v0);
    if (v20)
    {
      OUTLINED_FUNCTION_28_2();
      OUTLINED_FUNCTION_19_2();
      v14 = v19;
      v15 = v17;
      *v17 = v18;
      v15[1] = v14;
      goto LABEL_13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_235F76EA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_77_0(v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_74();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_97();
  if (qword_256399400 != -1)
    swift_once();
  OUTLINED_FUNCTION_212();
  OUTLINED_FUNCTION_149(v2);
  if (v16)
  {
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_19_2();
    if (v14 == v1 && v15 == v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_175();
      OUTLINED_FUNCTION_64();
      if ((v0 & 1) == 0)
      {
        *(_DWORD *)v13 = 0;
        *(_BYTE *)(v13 + 4) = 1;
LABEL_14:
        OUTLINED_FUNCTION_184();
        OUTLINED_FUNCTION_8_2();
        return;
      }
    }
    OUTLINED_FUNCTION_119();
    if (*v12 != -1)
      swift_once();
    OUTLINED_FUNCTION_83();
    OUTLINED_FUNCTION_149(v3);
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_19_2();
    *(_BYTE *)(v13 + 4) = 0;
    goto LABEL_14;
  }
  __break(1u);
  __break(1u);
}

uint64_t sub_235F77014@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(char *, uint64_t);
  uint64_t result;
  char v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  _OWORD v27[2];

  v22 = a4;
  v7 = sub_235F9B240();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v21 - v12;
  v21 = a1;
  sub_235F9B270();
  if (qword_256399400 != -1)
    swift_once();
  sub_235F9B24C();
  v14 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  result = v14(v13, v7);
  if (v26)
  {
    sub_235F6E7A4(&v25, v27);
    swift_dynamicCast();
    if (v23 == a2 && v24 == a3)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = sub_235F9B6C0();
      result = swift_bridgeObjectRelease();
      if ((v17 & 1) == 0)
      {
        v18 = v22;
        *v22 = 0;
        v18[1] = 0;
        return result;
      }
    }
    sub_235F9B270();
    sub_235F9B24C();
    result = v14(v11, v7);
    if (v26)
    {
      sub_235F6E7A4(&v25, v27);
      result = swift_dynamicCast();
      v19 = v24;
      v20 = v22;
      *v22 = v23;
      v20[1] = v19;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_235F77224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t *, _QWORD);
  char *v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD);
  void (*v33)(uint64_t, uint64_t, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_36_2();
  v30 = v4;
  v31 = v5;
  v6 = OUTLINED_FUNCTION_75_0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_73_0();
  MEMORY[0x24BDAC7A8](v8);
  v34 = (char *)&v29 - v9;
  v10 = OUTLINED_FUNCTION_25_2();
  v32 = *(void (**)(_QWORD))(v10 - 8);
  v11 = v32;
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_94();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_21_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_137();
  sub_235F9B27C();
  v33 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v11 + 2);
  v33(v2, v3, v10);
  sub_235F7F748();
  OUTLINED_FUNCTION_263();
  v15 = OUTLINED_FUNCTION_207();
  v32 = v16;
  v16(v15);
  *(_QWORD *)(v2 + *(int *)(v12 + 36)) = v38;
  v17 = OUTLINED_FUNCTION_206();
  sub_235F7F788(v17, v18);
  v19 = (uint64_t *)(v1 + *(int *)(v12 + 36));
  v20 = *v19;
  v21 = OUTLINED_FUNCTION_109();
  if (v20 == v38)
  {
LABEL_2:
    OUTLINED_FUNCTION_217(v21, &qword_2563999F0);
LABEL_19:
    OUTLINED_FUNCTION_5();
  }
  else
  {
    v29 = MEMORY[0x24BEE4AD8] + 8;
    while (1)
    {
      v22 = (void (*)(uint64_t *, _QWORD))OUTLINED_FUNCTION_257();
      v23 = v34;
      (*(void (**)(char *))(v7 + 16))(v34);
      v22(&v38, 0);
      v33(v3, v1, v10);
      OUTLINED_FUNCTION_258();
      v24 = OUTLINED_FUNCTION_207();
      v32(v24);
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v0, v23, v6);
      if (qword_256399400 != -1)
        swift_once();
      OUTLINED_FUNCTION_253();
      if (!v37)
      {
        __break(1u);
        goto LABEL_21;
      }
      OUTLINED_FUNCTION_186();
      OUTLINED_FUNCTION_19_2();
      if (v35 == v30 && v36 == v31)
        break;
      v26 = OUTLINED_FUNCTION_31_2();
      OUTLINED_FUNCTION_35();
      if ((v26 & 1) != 0)
        goto LABEL_15;
      OUTLINED_FUNCTION_229();
      v27 = *v19;
      v21 = OUTLINED_FUNCTION_109();
      if (v27 == v38)
        goto LABEL_2;
    }
    swift_bridgeObjectRelease();
LABEL_15:
    if (qword_2563993F0 != -1)
      swift_once();
    OUTLINED_FUNCTION_253();
    if (v37)
    {
      OUTLINED_FUNCTION_186();
      OUTLINED_FUNCTION_19_2();
      v28 = OUTLINED_FUNCTION_229();
      OUTLINED_FUNCTION_217(v28, &qword_2563999F0);
      goto LABEL_19;
    }
LABEL_21:
    __break(1u);
  }
}

void sub_235F7754C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(void);
  uint64_t (*v59)(void);
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t, uint64_t);
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  unint64_t v91;
  unint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _BOOL8 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  __n128 *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, _QWORD);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD v135[2];
  uint64_t v136;
  unint64_t v137;

  OUTLINED_FUNCTION_57_0();
  a19 = v26;
  a20 = v27;
  v116 = v28;
  v30 = v29;
  v32 = v31;
  v109 = OUTLINED_FUNCTION_309();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v109 - 8));
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_135(v34, v108);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999D8);
  OUTLINED_FUNCTION_138(v35, (uint64_t)v135);
  OUTLINED_FUNCTION_5_2(v36);
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_139(v40);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999E0);
  OUTLINED_FUNCTION_138(v41, (uint64_t)&v134);
  OUTLINED_FUNCTION_5_2(v42);
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_139(v45);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999E8);
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v114 - 8));
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v49);
  v123 = (uint64_t)&v108 - v50;
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_213();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_38_1();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_64_0();
  v130 = v53;
  v54 = OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_223();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_54_0();
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_222();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_137();
  v117 = v32;
  sub_235F9B294();
  v110 = v30;
  sub_235F9B27C();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_170(v58);
  sub_235F7F748();
  OUTLINED_FUNCTION_274();
  v59 = *(uint64_t (**)(void))(v21 + 8);
  v131 = v24;
  OUTLINED_FUNCTION_170(v59);
  v60 = v132;
  *(_QWORD *)(v20 + *(int *)(v132 + 36)) = v136;
  sub_235F7F788(v20, v22);
  v61 = (uint64_t *)(v22 + *(int *)(v60 + 36));
  v62 = *v61;
  v63 = OUTLINED_FUNCTION_46_0();
  v125 = v54;
  v64 = MEMORY[0x24BEE4AF8];
  if (v62 == v136)
  {
LABEL_3:
    OUTLINED_FUNCTION_217(v63, &qword_2563999F0);
    if (*(_QWORD *)(v64 + 16))
    {
      v65 = OUTLINED_FUNCTION_160();
      MEMORY[0x24BDAC7A8](v65);
      OUTLINED_FUNCTION_3_2();
      v132 = sub_235F758A8((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F80DEC, v62, v64);
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v66);
      OUTLINED_FUNCTION_3_2();
      v67 = OUTLINED_FUNCTION_311((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80E00);
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v68);
      OUTLINED_FUNCTION_3_2();
      v69 = OUTLINED_FUNCTION_193((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80E14);
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v70);
      OUTLINED_FUNCTION_3_2();
      v71 = OUTLINED_FUNCTION_192((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F80E28);
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v72);
      OUTLINED_FUNCTION_3_2();
      v128 = OUTLINED_FUNCTION_193((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80E3C);
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_20_1();
      MEMORY[0x24BDAC7A8](v73);
      OUTLINED_FUNCTION_3_2();
      v130 = OUTLINED_FUNCTION_193((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80E50);
      v74 = OUTLINED_FUNCTION_25();
      MEMORY[0x24BDAC7A8](v74);
      OUTLINED_FUNCTION_3_2();
      v75 = OUTLINED_FUNCTION_192((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F80E64);
      v76 = OUTLINED_FUNCTION_25();
      MEMORY[0x24BDAC7A8](v76);
      OUTLINED_FUNCTION_3_2();
      v129 = OUTLINED_FUNCTION_311((void (*)(uint64_t *__return_ptr, uint64_t *))sub_235F80E78);
      v77 = OUTLINED_FUNCTION_25();
      MEMORY[0x24BDAC7A8](v77);
      OUTLINED_FUNCTION_3_2();
      v78 = OUTLINED_FUNCTION_192((void (*)(_QWORD *__return_ptr, uint64_t *))sub_235F80E8C);
      OUTLINED_FUNCTION_62_0();
      v136 = v71;
      OUTLINED_FUNCTION_182();
      OUTLINED_FUNCTION_194(&qword_256399A10);
      OUTLINED_FUNCTION_69_0();
      OUTLINED_FUNCTION_115();
      if (qword_2563993F8 != -1)
        swift_once();
      v136 = v67;
      OUTLINED_FUNCTION_48();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399A18);
      sub_235F7FBA0(&qword_256399A20, &qword_256399A18);
      OUTLINED_FUNCTION_281();
      v136 = v69;
      OUTLINED_FUNCTION_182();
      OUTLINED_FUNCTION_194(&qword_256399A30);
      OUTLINED_FUNCTION_69_0();
      OUTLINED_FUNCTION_197();
      sub_235F9B2C4();
      if (qword_256399408 != -1)
        swift_once();
      v136 = v132;
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_115();
      if (qword_2563993E0 != -1)
        swift_once();
      v136 = v128;
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_132();
      if (qword_2563993E8 != -1)
        swift_once();
      v136 = v130;
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_132();
      v136 = v75;
      OUTLINED_FUNCTION_69_0();
      OUTLINED_FUNCTION_115();
      if (qword_2563993F0 != -1)
        swift_once();
      v136 = v129;
      OUTLINED_FUNCTION_58_0();
      v79 = v112;
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_281();
      if (qword_256399400 != -1)
        swift_once();
      v136 = v78;
      OUTLINED_FUNCTION_58_0();
      v80 = v111;
      OUTLINED_FUNCTION_115();
      sub_235F9B288();
      sub_235F9B288();
      v81 = v121;
      OUTLINED_FUNCTION_206();
      sub_235F9B288();
      sub_235F9B288();
      v82 = v119;
      sub_235F9B288();
      v83 = v120;
      OUTLINED_FUNCTION_262();
      sub_235F9B288();
      v84 = v118;
      OUTLINED_FUNCTION_49();
      sub_235F9B288();
      sub_235F9B288();
      sub_235F9B288();
      OUTLINED_FUNCTION_202(v80);
      v85 = *(void (**)(uint64_t, uint64_t))(v113 + 8);
      v86 = v115;
      v85(v79, v115);
      OUTLINED_FUNCTION_202(v84);
      OUTLINED_FUNCTION_189(v83);
      OUTLINED_FUNCTION_189(v82);
      OUTLINED_FUNCTION_202(v122);
      OUTLINED_FUNCTION_189(v81);
      v85(v124, v86);
      OUTLINED_FUNCTION_202(v123);
      OUTLINED_FUNCTION_107((uint64_t)&a18);
    }
    else
    {
      OUTLINED_FUNCTION_25();
    }
    if ((v116 & 1) != 0)
    {
      v102 = MEMORY[0x24BEE0D00];
      OUTLINED_FUNCTION_51_0();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
      v103 = (__n128 *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_290(v103, (__n128)xmmword_235F9D690);
      sub_235F9B5F4();
      OUTLINED_FUNCTION_228();
      OUTLINED_FUNCTION_227(0xD00000000000001DLL);
      OUTLINED_FUNCTION_153();
      sub_235F9B228();
      OUTLINED_FUNCTION_289();
      OUTLINED_FUNCTION_20();
      v104 = v136;
      v105 = v137;
      v103[3].n128_u64[1] = v102;
      v103[2].n128_u64[0] = v104;
      v103[2].n128_u64[1] = v105;
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_27_1();
      v106 = OUTLINED_FUNCTION_199();
      OUTLINED_FUNCTION_52_0(v106, v107);
    }
    OUTLINED_FUNCTION_11_0();
  }
  else
  {
    v128 = 0x8000000235F9F760;
    v127 = MEMORY[0x24BEE4AD8] + 8;
    v126 = v61;
    while (1)
    {
      v132 = v64;
      sub_235F9B4F8();
      v87 = v130;
      OUTLINED_FUNCTION_104(v130, v88, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16));
      OUTLINED_FUNCTION_105();
      OUTLINED_FUNCTION_107((uint64_t)&a16);
      OUTLINED_FUNCTION_258();
      OUTLINED_FUNCTION_141();
      OUTLINED_FUNCTION_107((uint64_t)&a18);
      OUTLINED_FUNCTION_104(v23, v87, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 32));
      OUTLINED_FUNCTION_197();
      sub_235F9B24C();
      if (!v135[1])
        break;
      OUTLINED_FUNCTION_53_0();
      OUTLINED_FUNCTION_19_2();
      v64 = v132;
      if (v133)
      {
        v89 = sub_235F9B234();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v94 = OUTLINED_FUNCTION_98();
          sub_235F7E28C(v94, v95, v96, v64, &qword_256399BE8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
          v64 = v97;
        }
        v90 = v126;
        v92 = *(_QWORD *)(v64 + 16);
        v91 = *(_QWORD *)(v64 + 24);
        if (v92 >= v91 >> 1)
        {
          v98 = OUTLINED_FUNCTION_298(v91);
          sub_235F7E28C(v98, v99, v100, v64, &qword_256399BE8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
          v64 = v101;
        }
        *(_QWORD *)(v64 + 16) = v92 + 1;
        *(_QWORD *)(v64 + 8 * v92 + 32) = v89;
      }
      else
      {
        v90 = v126;
      }
      OUTLINED_FUNCTION_209(v23, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
      v62 = *v90;
      OUTLINED_FUNCTION_46_0();
      OUTLINED_FUNCTION_198();
      if (v93)
        goto LABEL_3;
    }
    __break(1u);
  }
}

uint64_t sub_235F78164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  __int128 v5;
  uint64_t v6;
  __int128 v7;

  v2 = OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_147();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_54_0();
  sub_235F9B270();
  OUTLINED_FUNCTION_69_0();
  OUTLINED_FUNCTION_197();
  sub_235F9B24C();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
  if (v6)
  {
    sub_235F6E7A4(&v5, &v7);
    return OUTLINED_FUNCTION_19_2();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_235F78238()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_24_2(v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_136();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_39_0();
  if (*v0 != -1)
    OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_110();
  if (v9)
  {
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    __break(1u);
  }
}

void sub_235F782B4()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;

  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_213();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_94();
  sub_235F9B270();
  OUTLINED_FUNCTION_212();
  v1 = OUTLINED_FUNCTION_207();
  v2(v1);
  if (v3)
  {
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    __break(1u);
  }
}

void sub_235F78358()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_24_2(v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_136();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_39_0();
  if (*v0 != -1)
    OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_110();
  if (v9)
  {
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    __break(1u);
  }
}

void sub_235F783D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_24_2(v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_136();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_39_0();
  if (*v0 != -1)
    OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_110();
  if (v9)
  {
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    __break(1u);
  }
}

void sub_235F78450()
{
  void *v0;
  uint64_t v1;
  void *v2;
  char v3;
  char v4;
  uint64_t v5;
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
  id v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_36_2();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_147();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_25_0();
  v12 = v11 - v10;
  sub_235F73CEC();
  v22 = v6;
  OUTLINED_FUNCTION_37_1();
  sub_235F9B12C();
  sub_235F9B15C();
  OUTLINED_FUNCTION_304(v12, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_235F9B324();
  OUTLINED_FUNCTION_307();
  sub_235F9B318();
  type metadata accessor for AMLSODAHostTask();
  OUTLINED_FUNCTION_307();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_18_2();
  swift_retain();
  _s6AeroML15AMLSODAHostTaskC6taskId0E4Name10hostParamsACSS_SS23SearchOnDeviceAnalytics08SODAHostI0CSgtcfc_0();
  v13 = OUTLINED_FUNCTION_153();
  v14 = swift_allocBox();
  v16 = v15;
  sub_235F9B294();
  v17 = swift_allocBox();
  sub_235F9B294();
  v18 = OUTLINED_FUNCTION_1();
  *(_QWORD *)(v18 + 16) = v17;
  *(_BYTE *)(v18 + 24) = v4 & 1;
  *(_QWORD *)(v18 + 32) = v14;
  *(_QWORD *)(v18 + 40) = v2;
  swift_retain();
  swift_retain();
  v19 = v2;
  sub_235F9B300();
  OUTLINED_FUNCTION_268();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_2();
  v20 = *(void (**)(uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v21 = OUTLINED_FUNCTION_141();
  v20(v21);
  OUTLINED_FUNCTION_124(v8, 0);
  OUTLINED_FUNCTION_2();
  ((void (*)(uint64_t, uint64_t, uint64_t))v20)(v22, v16, v13);
  OUTLINED_FUNCTION_124(v22, 0);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_235F78A78(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, char *, uint64_t);
  uint64_t v16;
  void (*v17)(uint64_t, char *, uint64_t);
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  LODWORD(v3) = a3;
  v4 = sub_235F9B2B8();
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v34 = (uint64_t)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235F9B2A0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - v11;
  v13 = swift_projectBox();
  v14 = swift_projectBox();
  sub_235F9B2E8();
  swift_beginAccess();
  v15 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 40);
  v15(v13, v12, v6);
  if ((v3 & 1) != 0)
  {
    sub_235F9B2AC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
    v16 = swift_allocObject();
    HIDWORD(v31) = (_DWORD)v3;
    v3 = (_QWORD *)v16;
    *(_OWORD *)(v16 + 16) = xmmword_235F9D690;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v13, v6);
    v17 = v15;
    v18 = sub_235F9B228();
    v30 = v10;
    v19 = v14;
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    v3[7] = MEMORY[0x24BEE0D00];
    v3[4] = v18;
    v3[5] = v21;
    v15 = v17;
    v14 = v19;
    v10 = v30;
    sub_235F9B720();
    LOBYTE(v3) = BYTE4(v31);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  }
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v13, v6);
  sub_235F7754C((uint64_t)v10, v3 & 1, v22, v23, v24, v25, v26, v27, v29, (uint64_t)v30, v31, v32, v33, v34, v35, v36, v37, v38, v39,
    v40);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_beginAccess();
  v15(v14, v12, v6);
  return 1;
}

uint64_t sub_235F78D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(void);
  unint64_t v32;
  uint64_t (*v33)(void);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t result;
  BOOL v40;
  int v41;
  _BOOL4 v43;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t);
  void *v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  double *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  double v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char v123;
  char v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  __int128 v130;
  uint64_t v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  uint64_t v160;
  NSObject *v161;
  id v162;
  os_log_type_t v163;
  uint8_t *v164;
  _QWORD *v165;
  id v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  _QWORD v179[4];
  uint64_t v180;
  void *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  _BOOL4 v185;
  const char *v186;
  id v187;
  __int128 v188;
  char *v189;
  _BOOL4 v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  __int128 v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  int v201;
  int v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  int v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  uint64_t v216;
  __int128 v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;

  v210 = a8;
  v204 = a7;
  v203 = a6;
  v202 = a5;
  v193 = a4;
  v192 = a3;
  v14 = OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v14 - 8));
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_21_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_64_0();
  v206 = v17;
  v18 = OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_54_0();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_73_0();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v179 - v23;
  v212 = a2;
  v207 = sub_235F7CEA0(a2, a1, v25, v26, v27, v28, v29, v30);
  v219 = MEMORY[0x24BEE4AF8];
  sub_235F9B27C();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_170(v31);
  v32 = sub_235F7F748();
  sub_235F9B4D4();
  v33 = *(uint64_t (**)(void))(v9 + 8);
  v205 = v11;
  v34 = (uint64_t)v24;
  OUTLINED_FUNCTION_170(v33);
  *(_QWORD *)(v8 + *(int *)(v20 + 36)) = v217;
  sub_235F7F788(v8, (uint64_t)v24);
  v35 = &v24[*(int *)(v20 + 36)];
  v36 = *(_QWORD *)v35;
  OUTLINED_FUNCTION_173();
  v40 = v36 == (_QWORD)v217;
  v38 = v208;
  if (v40)
  {
LABEL_3:
    sub_235F729B0(v34, &qword_2563999F0);
    swift_bridgeObjectRelease();
    return v219;
  }
  v191 = "Metrics.poirotRecipe";
  v40 = v192 == 0xD000000000000019 && v193 == 0x8000000235F9F860;
  v41 = v40;
  v201 = v41;
  v186 = "com.apple.mobileslideshow";
  v43 = v192 == 0xD000000000000013 && v193 == 0x8000000235F9F880;
  v190 = v43;
  v183 = "com.apple.Spotlight";
  v45 = v192 == 0xD000000000000011 && v193 == 0x8000000235F9F8A0;
  v185 = v45;
  v189 = (char *)&v217 + 8;
  v200 = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v37 = 138412290;
  v188 = v37;
  v197 = xmmword_235F9D690;
  OUTLINED_FUNCTION_27_0();
  v180 = v46;
  v195 = MEMORY[0x24BEE4AD0] + 8;
  v179[3] = 0x8000000235F9F8C0;
  OUTLINED_FUNCTION_27_0();
  v179[2] = v47;
  v179[1] = 0x8000000235F9F900;
  v179[0] = 0x8000000235F9F920;
  OUTLINED_FUNCTION_27_0();
  v184 = v48;
  v194 = v18;
  v196 = v32;
  v199 = v14;
  v209 = v10;
  v182 = v34;
  v198 = v35;
  while (1)
  {
    sub_235F9B4F8();
    OUTLINED_FUNCTION_104(v206, v49, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 16));
    OUTLINED_FUNCTION_247((uint64_t)&v217);
    OUTLINED_FUNCTION_148();
    OUTLINED_FUNCTION_107((uint64_t)&v221);
    sub_235F9B4EC();
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_107((uint64_t)&v220);
    v50 = OUTLINED_FUNCTION_206();
    OUTLINED_FUNCTION_104(v50, v51, v52);
    result = (uint64_t)objc_msgSend(objc_allocWithZone((Class)AMLPhotosSearchLabeledData), sel_init);
    if (!result)
      goto LABEL_118;
    v53 = (void *)result;
    if ((v201 & 1) != 0
      || (result = OUTLINED_FUNCTION_31_2(), ((result | v190) & 1) != 0)
      || (OUTLINED_FUNCTION_260(), result = OUTLINED_FUNCTION_31_2(), ((result | v185) & 1) != 0)
      || (OUTLINED_FUNCTION_260(), result = OUTLINED_FUNCTION_31_2(), (result & 1) != 0))
    {
      OUTLINED_FUNCTION_40_0(result, sel_setUiSurface_);
    }
    if (qword_256399400 != -1)
      swift_once();
    result = OUTLINED_FUNCTION_230();
    if (!v216)
      goto LABEL_119;
    OUTLINED_FUNCTION_157();
    OUTLINED_FUNCTION_19_2();
    sub_235F77224();
    v55 = v54;
    OUTLINED_FUNCTION_27_1();
    if (qword_256399408 != -1)
      swift_once();
    result = OUTLINED_FUNCTION_230();
    if (!v216)
      goto LABEL_120;
    OUTLINED_FUNCTION_157();
    OUTLINED_FUNCTION_19_2();
    v56 = v213;
    v57 = v214;
    v58 = OUTLINED_FUNCTION_291();
    sub_235F7323C(v58, v59, v207);
    v61 = v60;
    OUTLINED_FUNCTION_27_1();
    if (v61)
    {
      if (*(_QWORD *)(v61 + 16))
      {
        OUTLINED_FUNCTION_48();
        OUTLINED_FUNCTION_280();
        v62 = sub_235F7F384();
        if ((v63 & 1) != 0)
        {
          v64 = (double *)(*(_QWORD *)(v61 + 56) + (v62 << 6));
          v65 = *v64;
          v66 = v64[1];
          v67 = v64[4];
          v68 = v64[5];
          v69 = v64[6];
          v70 = v64[7];
          OUTLINED_FUNCTION_9_1();
          OUTLINED_FUNCTION_35();
          OUTLINED_FUNCTION_265((uint64_t)objc_msgSend(v53, sel_setHasEverClickInLastMonth_, v66), sel_setClickCountInLastMonthNormalizedAcrossItems_);
          OUTLINED_FUNCTION_265((uint64_t)objc_msgSend(v53, sel_setHasEverClickInLastWeek_, v65), sel_setClickCountInLastWeekNormalizedAcrossItems_);
          objc_msgSend(v53, sel_setClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems_, v68);
          objc_msgSend(v53, sel_setClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems_, v67);
          objc_msgSend(v53, sel_setClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems_, v69);
          objc_msgSend(v53, sel_setClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems_, v70);
          goto LABEL_41;
        }
        OUTLINED_FUNCTION_9_1();
      }
      OUTLINED_FUNCTION_35();
    }
LABEL_41:
    v71 = (void *)objc_opt_self();
    OUTLINED_FUNCTION_280();
    v72 = (void *)sub_235F9B3F0();
    v73 = objc_msgSend(v71, sel_clientDonationForPhotoId_aroundTime_, v72, v55);

    v211 = v73;
    if (!v73)
    {
      OUTLINED_FUNCTION_9_1();
LABEL_75:
      OUTLINED_FUNCTION_255();
      goto LABEL_76;
    }
    v74 = v73;
    v75 = objc_msgSend(v74, sel_featureProvider);
    if (!v75)
    {
      v113 = objc_msgSend(v74, sel_arrayProvider);
      if (v113)
      {
        v114 = v113;
        v187 = v74;
        type metadata accessor for AMLFeaturesDonation(0);
        static AMLFeaturesDonation.modelContentAsArrayProvider(for:)(v114);
        if (v115)
        {
          v116 = v115;
          if ((v210 & 1) != 0)
          {
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
            v34 = (uint64_t)v114;
            v117 = OUTLINED_FUNCTION_1();
            OUTLINED_FUNCTION_215((__n128 *)v117);
            sub_235F72768(33);
            swift_bridgeObjectRelease();
            *(_QWORD *)&v217 = 0xD00000000000001ELL;
            *((_QWORD *)&v217 + 1) = v180;
            OUTLINED_FUNCTION_280();
            sub_235F9B420();
            OUTLINED_FUNCTION_180();
            v118 = v217;
            *(_QWORD *)(v117 + 56) = MEMORY[0x24BEE0D00];
            *(_OWORD *)(v117 + 32) = v118;
            OUTLINED_FUNCTION_12_2();
            v114 = (void *)v34;
            swift_bridgeObjectRelease();
          }
          v18 = *(_QWORD *)(v116 + 16);
          if (!v18)
          {

            OUTLINED_FUNCTION_63_0((uint64_t)&v214);
            OUTLINED_FUNCTION_9_1();
            OUTLINED_FUNCTION_27_1();
            OUTLINED_FUNCTION_255();
            OUTLINED_FUNCTION_277();
            goto LABEL_76;
          }
          v181 = v114;
          v119 = 0;
          v34 = 0;
          while (2)
          {
            v120 = *(_QWORD *)(v116 + 8 * v34 + 32);
            v121 = *(_QWORD *)(v120 + 16);
            OUTLINED_FUNCTION_58_0();
            if (!v121)
              goto LABEL_117;
            v122 = sub_235F7F384();
            if ((v123 & 1) == 0)
              goto LABEL_117;
            sub_235F6B0A8(*(_QWORD *)(v120 + 56) + 32 * v122, (uint64_t)&v215);
            OUTLINED_FUNCTION_157();
            OUTLINED_FUNCTION_19_2();
            if (v213 == v56 && v214 == v57)
            {
              OUTLINED_FUNCTION_9_1();
            }
            else
            {
              v125 = OUTLINED_FUNCTION_31_2();
              OUTLINED_FUNCTION_43_0();
              if ((v125 & 1) == 0)
              {
                OUTLINED_FUNCTION_35();
                goto LABEL_68;
              }
            }
            OUTLINED_FUNCTION_20();
            v119 = v120;
            if ((v210 & 1) != 0)
            {
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
              v126 = OUTLINED_FUNCTION_1();
              OUTLINED_FUNCTION_215((__n128 *)v126);
              *(_QWORD *)&v217 = sub_235F72768(2);
              *((_QWORD *)&v217 + 1) = v127;
              v128 = MEMORY[0x24BEE0D00];
              v129 = (void *)sub_235F9B3C0();
              v215 = v129;
              sub_235F9B624();

              v130 = v217;
              *(_QWORD *)(v126 + 56) = v128;
              *(_OWORD *)(v126 + 32) = v130;
              OUTLINED_FUNCTION_12_2();
              OUTLINED_FUNCTION_20();
              v119 = v120;
            }
LABEL_68:
            if (v18 == ++v34)
            {
              OUTLINED_FUNCTION_9_1();
              OUTLINED_FUNCTION_27_1();
              OUTLINED_FUNCTION_277();
              if (v119)
              {
                OUTLINED_FUNCTION_78_0(&v217);
                v57 = v209;
                if (v218)
                  v131 = OUTLINED_FUNCTION_65_0();
                else
                  sub_235F729B0((uint64_t)&v217, &qword_256399530);
                OUTLINED_FUNCTION_40_0(v131, sel_setL1Score_);
                OUTLINED_FUNCTION_78_0(&v217);
                if (v218)
                  v169 = OUTLINED_FUNCTION_4_2();
                else
                  OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_40_0(v169, sel_setFreshness_);
                OUTLINED_FUNCTION_78_0(&v217);
                if (v218)
                  v170 = OUTLINED_FUNCTION_4_2();
                else
                  OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_40_0(v170, sel_setFavorited_);
                OUTLINED_FUNCTION_78_0(&v217);
                if (v218)
                  v171 = OUTLINED_FUNCTION_4_2();
                else
                  OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_40_0(v171, sel_setAestheticScore_);
                OUTLINED_FUNCTION_78_0(&v217);
                if (v218)
                  v172 = OUTLINED_FUNCTION_4_2();
                else
                  OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_40_0(v172, sel_setCurationScore_);
                OUTLINED_FUNCTION_78_0(&v217);
                if (v218)
                  v173 = OUTLINED_FUNCTION_4_2();
                else
                  OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_40_0(v173, sel_setMatchedPeopleRatio_);
                OUTLINED_FUNCTION_78_0(&v217);
                if (v218)
                  v174 = OUTLINED_FUNCTION_4_2();
                else
                  OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_40_0(v174, sel_setMatchedLocationRatio_);
                OUTLINED_FUNCTION_78_0(&v217);
                if (v218)
                  v175 = OUTLINED_FUNCTION_4_2();
                else
                  OUTLINED_FUNCTION_41_0();
                OUTLINED_FUNCTION_40_0(v175, sel_setMatchedSceneConfidence_);
                OUTLINED_FUNCTION_78_0(&v217);
                OUTLINED_FUNCTION_20();
                if (v218)
                {
                  v176 = OUTLINED_FUNCTION_4_2();
                  v177 = v181;
                  v178 = v187;
                }
                else
                {
                  OUTLINED_FUNCTION_41_0();
                  v178 = v187;
                  v177 = v181;
                }
                OUTLINED_FUNCTION_40_0(v176, sel_setMatchedSceneBoundingBox_);

              }
              else
              {
                OUTLINED_FUNCTION_63_0((uint64_t)&v208);
                OUTLINED_FUNCTION_63_0((uint64_t)&v214);
                OUTLINED_FUNCTION_255();
              }
              goto LABEL_76;
            }
            continue;
          }
        }
        OUTLINED_FUNCTION_9_1();

        OUTLINED_FUNCTION_63_0((uint64_t)&v214);
      }
      else
      {
        OUTLINED_FUNCTION_9_1();

      }
      goto LABEL_75;
    }
    v76 = v75;
    if ((v210 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
      v77 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_215((__n128 *)v77);
      *(_QWORD *)&v217 = 0;
      *((_QWORD *)&v217 + 1) = 0xE000000000000000;
      v187 = v76;
      v78 = v18;
      v79 = v34;
      v80 = v74;
      sub_235F9B5F4();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v217 = 0xD000000000000010;
      *((_QWORD *)&v217 + 1) = v184;
      v81 = objc_msgSend(v74, sel_description);
      sub_235F9B3FC();

      sub_235F9B420();
      v74 = v80;
      v34 = v79;
      v18 = v78;
      v76 = v187;
      swift_bridgeObjectRelease();
      v82 = v217;
      *(_QWORD *)(v77 + 56) = MEMORY[0x24BEE0D00];
      *(_OWORD *)(v77 + 32) = v82;
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_27_1();
    }
    v83 = OUTLINED_FUNCTION_280();
    sub_235F80524(v83, v84, v53);
    v85 = objc_msgSend((id)objc_opt_self(), sel_photosSearchDataMetricsForFeatureProvider_, v76);
    if (!v85)
    {

      swift_unknownObjectRelease();
      goto LABEL_75;
    }
    v86 = v85;
    v87 = OUTLINED_FUNCTION_40_0((uint64_t)objc_msgSend(v85, sel_L1Score), sel_setL1Score_);
    v88 = OUTLINED_FUNCTION_28_1((uint64_t)v87, sel_freshness);
    v89 = OUTLINED_FUNCTION_40_0((uint64_t)v88, sel_setFreshness_);
    v90 = OUTLINED_FUNCTION_28_1((uint64_t)v89, sel_photosFavorited);
    v91 = OUTLINED_FUNCTION_40_0((uint64_t)v90, sel_setFavorited_);
    v92 = OUTLINED_FUNCTION_28_1((uint64_t)v91, sel_aestheticScore);
    v93 = OUTLINED_FUNCTION_40_0((uint64_t)v92, sel_setAestheticScore_);
    v94 = OUTLINED_FUNCTION_28_1((uint64_t)v93, sel_curationScore);
    v95 = OUTLINED_FUNCTION_40_0((uint64_t)v94, sel_setCurationScore_);
    v96 = OUTLINED_FUNCTION_28_1((uint64_t)v95, sel_matchedFieldsCount);
    v57 = v209;
    if ((~*(_QWORD *)&v97 & 0x7FF0000000000000) == 0)
      break;
    if (v97 <= -1.0)
      goto LABEL_115;
    if (v97 >= 4294967300.0)
      goto LABEL_116;
    v98 = OUTLINED_FUNCTION_40_0((uint64_t)v96, sel_setMatchedFieldsCount_);
    v99 = OUTLINED_FUNCTION_28_1((uint64_t)v98, sel_matchedPeopleRatio);
    v100 = OUTLINED_FUNCTION_40_0((uint64_t)v99, sel_setMatchedPeopleRatio_);
    v101 = OUTLINED_FUNCTION_28_1((uint64_t)v100, sel_matchedLocationRatio);
    v102 = OUTLINED_FUNCTION_40_0((uint64_t)v101, sel_setMatchedLocationRatio_);
    v103 = OUTLINED_FUNCTION_28_1((uint64_t)v102, sel_matchedSceneSynonymRatio);
    v104 = OUTLINED_FUNCTION_40_0((uint64_t)v103, sel_setMatchedSceneRatio_);
    v105 = OUTLINED_FUNCTION_28_1((uint64_t)v104, sel_matchedOCRCharacterMatchRatio);
    v106 = OUTLINED_FUNCTION_40_0((uint64_t)v105, sel_setMatchedOCRCharacterRatio_);
    v107 = OUTLINED_FUNCTION_28_1((uint64_t)v106, sel_matchedSceneConfidence);
    v108 = OUTLINED_FUNCTION_40_0((uint64_t)v107, sel_setMatchedSceneConfidence_);
    v109 = OUTLINED_FUNCTION_28_1((uint64_t)v108, sel_matchedSceneBoundingBox);
    v110 = OUTLINED_FUNCTION_40_0((uint64_t)v109, sel_setMatchedSceneBoundingBox_);
    v111 = OUTLINED_FUNCTION_28_1((uint64_t)v110, sel_matchedOCRImportance);
    OUTLINED_FUNCTION_40_0((uint64_t)v111, sel_setMatchedOCRImportance_);

    v112 = swift_unknownObjectRelease();
LABEL_76:
    v132 = OUTLINED_FUNCTION_40_0(v112, sel_setClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems_);
    v133 = OUTLINED_FUNCTION_40_0((uint64_t)v132, sel_setClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems_);
    v134 = OUTLINED_FUNCTION_40_0((uint64_t)v133, sel_setClickCountGivenLocationInLastMonthNormalizedAcrossItems_);
    v135 = OUTLINED_FUNCTION_40_0((uint64_t)v134, sel_setClickCountGivenLocationInLastWeekNormalizedAcrossItems_);
    v136 = OUTLINED_FUNCTION_40_0((uint64_t)v135, sel_setClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems_);
    v137 = OUTLINED_FUNCTION_40_0((uint64_t)v136, sel_setClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems_);
    v138 = OUTLINED_FUNCTION_40_0((uint64_t)v137, sel_setClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems_);
    v139 = OUTLINED_FUNCTION_40_0((uint64_t)v138, sel_setClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems_);
    OUTLINED_FUNCTION_40_0((uint64_t)v139, sel_setClipScore_);
    sub_235F7D630();
    v141 = OUTLINED_FUNCTION_40_0(v140, sel_setHasEverShareInLastMonth_);
    OUTLINED_FUNCTION_264((uint64_t)v141, sel_setShareCountInLastMonthNormalizedAcrossItems_);
    OUTLINED_FUNCTION_300();
    sub_235F7D63C();
    v143 = OUTLINED_FUNCTION_40_0(v142, sel_setHasEverShareInLastMonth_);
    v144 = OUTLINED_FUNCTION_264((uint64_t)v143, sel_setShareCountInLastWeekNormalizedAcrossItems_);
    v145 = OUTLINED_FUNCTION_40_0((uint64_t)v144, sel_setIsCompleteMatch_);
    v146 = OUTLINED_FUNCTION_40_0((uint64_t)v145, sel_setIsDuplicate_);
    v147 = OUTLINED_FUNCTION_40_0((uint64_t)v146, sel_setL2ModelScore_);
    v148 = OUTLINED_FUNCTION_40_0((uint64_t)v147, sel_setShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems_);
    v149 = OUTLINED_FUNCTION_40_0((uint64_t)v148, sel_setShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems_);
    v150 = OUTLINED_FUNCTION_40_0((uint64_t)v149, sel_setShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems_);
    v151 = OUTLINED_FUNCTION_40_0((uint64_t)v150, sel_setShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems_);
    v152 = OUTLINED_FUNCTION_40_0((uint64_t)v151, sel_setShareCountGivenLocationInLastMonthNormalizedAcrossItems_);
    v153 = OUTLINED_FUNCTION_40_0((uint64_t)v152, sel_setShareCountGivenLocationInLastWeekNormalizedAcrossItems_);
    v154 = OUTLINED_FUNCTION_40_0((uint64_t)v153, sel_setShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems_);
    v155 = OUTLINED_FUNCTION_40_0((uint64_t)v154, sel_setShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems_);
    v156 = OUTLINED_FUNCTION_40_0((uint64_t)v155, sel_setShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems_);
    OUTLINED_FUNCTION_40_0((uint64_t)v156, sel_setShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems_);
    v157 = sub_235F7D8C4();
    OUTLINED_FUNCTION_40_0(v157, sel_setClickOrder_);
    v158 = sub_235F7D524();
    OUTLINED_FUNCTION_40_0(v158, sel_setItemPosition_);
    if ((v202 & 1) != 0)
      sub_235F73E28((uint64_t)v53);
    v159 = v53;
    MEMORY[0x23B7E7644]();
    if (*(_QWORD *)((v219 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v219 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_235F9B474();
    sub_235F9B48C();
    sub_235F9B468();
    if (qword_2563993D8 != -1)
      swift_once();
    v160 = OUTLINED_FUNCTION_19_1();
    v161 = __swift_project_value_buffer(v160, (uint64_t)qword_25639A758);
    v162 = v159;
    sub_235F9B36C();
    v163 = OUTLINED_FUNCTION_183();
    if (os_log_type_enabled(v161, v163))
    {
      v164 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v165 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v164 = v188;
      *(_QWORD *)&v217 = v162;
      v166 = v162;
      sub_235F9B5AC();
      *v165 = v53;

      _os_log_impl(&dword_235F59000, v161, v163, "AMLPhotosSearchLabeledData: %@", v164, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_255();
      OUTLINED_FUNCTION_8_0();
    }

    v167 = v198;
    v38 = v208;
    OUTLINED_FUNCTION_209(v57, *(uint64_t (**)(uint64_t, uint64_t))(v208 + 8));
    v168 = *(_QWORD *)v167;
    OUTLINED_FUNCTION_173();
    if (v168 == (_QWORD)v217)
      goto LABEL_3;
  }
  __break(1u);
LABEL_115:
  __break(1u);
LABEL_116:
  __break(1u);
LABEL_117:
  result = OUTLINED_FUNCTION_20();
  __break(1u);
LABEL_118:
  __break(1u);
LABEL_119:
  __break(1u);
LABEL_120:
  __break(1u);
  return result;
}

void sub_235F7A178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t (*v49)(void);
  uint64_t v50;
  char **v51;
  char *v52;
  char v53;
  uint64_t v54;
  os_log_type_t v55;
  _DWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  os_log_type_t v60;
  _DWORD *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char *v76;
  char v77;
  char v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char *v87;
  char v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[3];
  char **v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  uint64_t v107[4];
  uint64_t v108;
  uint64_t v109;

  OUTLINED_FUNCTION_36_2();
  a21 = v26;
  a22 = v27;
  v99 = v28;
  v29 = OUTLINED_FUNCTION_75_0();
  v103 = *(_QWORD *)(v29 - 8);
  v104 = v29;
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_38_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_64_0();
  v100 = v32;
  v33 = OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v33 - 8));
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_95();
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_64_0();
  v38 = OUTLINED_FUNCTION_112(v37);
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v38 - 8));
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_275();
  v101 = v23;
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_222();
  MEMORY[0x24BDAC7A8](v41);
  v43 = (char *)v93 - v42;
  v44 = MEMORY[0x24BEE1768];
  OUTLINED_FUNCTION_148();
  v109 = sub_235F9B3E4();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_238();
  v108 = sub_235F9B3E4();
  OUTLINED_FUNCTION_203();
  v102 = v43;
  OUTLINED_FUNCTION_231();
  v45 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
  v45(v22, v38);
  OUTLINED_FUNCTION_203();
  OUTLINED_FUNCTION_231();
  v93[2] = v38;
  v93[1] = v45;
  v45(v22, v38);
  OUTLINED_FUNCTION_160();
  v46 = v97;
  v47 = v95;
  OUTLINED_FUNCTION_170(*(uint64_t (**)(void))(v97 + 16));
  v48 = sub_235F7F748();
  OUTLINED_FUNCTION_263();
  v49 = *(uint64_t (**)(void))(v46 + 8);
  v99 = v24;
  OUTLINED_FUNCTION_170(v49);
  v50 = v96;
  *(_QWORD *)(v47 + *(int *)(v96 + 36)) = v107[0];
  sub_235F7F788(v47, v44);
  v51 = (char **)(v44 + *(int *)(v50 + 36));
  v52 = *v51;
  OUTLINED_FUNCTION_109();
  OUTLINED_FUNCTION_286();
  if (v53)
  {
LABEL_3:
    sub_235F729B0(v44, &qword_2563999F0);
    if (qword_2563993D8 != -1)
LABEL_79:
      swift_once();
    v54 = OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_177(v54, (uint64_t)qword_25639A758);
    v55 = OUTLINED_FUNCTION_150();
    if (OUTLINED_FUNCTION_108(v55))
    {
      v56 = (_DWORD *)OUTLINED_FUNCTION_23_0();
      v107[0] = OUTLINED_FUNCTION_23_0();
      *v56 = 136315138;
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_266();
      sub_235F9B3D8();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_232(v57);
      sub_235F9B5AC();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_89(&dword_235F59000, v58, v59, "PhotosSearchClient plugin: weekly dict %s");
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }

    sub_235F9B36C();
    v60 = OUTLINED_FUNCTION_150();
    if (OUTLINED_FUNCTION_123(v60))
    {
      v61 = (_DWORD *)OUTLINED_FUNCTION_23_0();
      v107[0] = OUTLINED_FUNCTION_23_0();
      *v61 = 136315138;
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_37_1();
      v62 = sub_235F9B3D8();
      v64 = v63;
      OUTLINED_FUNCTION_25();
      sub_235F7EC30(v62, v64, v107);
      OUTLINED_FUNCTION_122(v65);
      OUTLINED_FUNCTION_111();
      OUTLINED_FUNCTION_90(&dword_235F59000, v66, v67, "PhotosSearchClient plugin: monthly dict %s");
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_256();
    OUTLINED_FUNCTION_308((uint64_t)&a10);
    OUTLINED_FUNCTION_127((uint64_t)v102);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_5();
    return;
  }
  v96 = MEMORY[0x24BEE4AD8] + 8;
  v95 = v48;
  v94 = v51;
  while (1)
  {
    v52 = (char *)OUTLINED_FUNCTION_257();
    v68 = v103;
    v69 = v100;
    OUTLINED_FUNCTION_130(v100, v70, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v103 + 16));
    OUTLINED_FUNCTION_247((uint64_t)v107);
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_107((uint64_t)&a16);
    OUTLINED_FUNCTION_258();
    OUTLINED_FUNCTION_107((uint64_t)&a15);
    OUTLINED_FUNCTION_130(v25, v69, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v68 + 32));
    if (qword_256399408 != -1)
      swift_once();
    OUTLINED_FUNCTION_129();
    if (!v106)
      break;
    OUTLINED_FUNCTION_113();
    OUTLINED_FUNCTION_19_2();
    if (qword_2563993F0 != -1)
      swift_once();
    OUTLINED_FUNCTION_129();
    if (!v106)
      goto LABEL_81;
    OUTLINED_FUNCTION_113();
    OUTLINED_FUNCTION_219();
    OUTLINED_FUNCTION_19_2();
    v71 = (double)v105;
    sub_235F9B120();
    if (v72 < v71)
    {
      v73 = v109;
      if (*(_QWORD *)(v109 + 16))
      {
        OUTLINED_FUNCTION_18_2();
        v74 = OUTLINED_FUNCTION_17_2();
        if ((v75 & 1) != 0)
        {
          v52 = *(char **)(*(_QWORD *)(v73 + 56) + 8 * v74);
          OUTLINED_FUNCTION_17();
          v76 = v52 + 1;
          if (__OFADD__(v52, 1))
            goto LABEL_73;
          OUTLINED_FUNCTION_18_2();
          OUTLINED_FUNCTION_84();
          v107[0] = v73;
          OUTLINED_FUNCTION_17_2();
          OUTLINED_FUNCTION_91();
          if (v77)
            goto LABEL_75;
          OUTLINED_FUNCTION_276();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
          OUTLINED_FUNCTION_47_0();
          OUTLINED_FUNCTION_302();
          if ((v78 & 1) != 0)
          {
            OUTLINED_FUNCTION_17_2();
            OUTLINED_FUNCTION_146();
            if (!v53)
              goto LABEL_82;
            v68 = v79;
          }
          v52 = (char *)v107[0];
          if ((v44 & 1) != 0)
          {
            *(_QWORD *)(*(_QWORD *)(v107[0] + 56) + 8 * v68) = v76;
LABEL_39:
            v109 = (uint64_t)v52;
            OUTLINED_FUNCTION_17();
            OUTLINED_FUNCTION_85();
            OUTLINED_FUNCTION_238();
            goto LABEL_40;
          }
          OUTLINED_FUNCTION_49_0();
          if (v77)
            goto LABEL_77;
          goto LABEL_38;
        }
        OUTLINED_FUNCTION_17();
      }
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_84();
      v107[0] = v73;
      OUTLINED_FUNCTION_17_2();
      OUTLINED_FUNCTION_91();
      if (v77)
      {
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
LABEL_77:
        __break(1u);
LABEL_78:
        __break(1u);
        goto LABEL_79;
      }
      OUTLINED_FUNCTION_276();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
      OUTLINED_FUNCTION_47_0();
      OUTLINED_FUNCTION_302();
      if ((v80 & 1) != 0)
      {
        OUTLINED_FUNCTION_17_2();
        OUTLINED_FUNCTION_146();
        if (!v53)
          goto LABEL_82;
        v68 = v81;
      }
      v52 = (char *)v107[0];
      if ((v44 & 1) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(v107[0] + 56) + 8 * v68) = 1;
        goto LABEL_39;
      }
      OUTLINED_FUNCTION_48_0();
      if (v77)
        goto LABEL_71;
LABEL_38:
      *((_QWORD *)v52 + 2) = v82;
      OUTLINED_FUNCTION_18_2();
      goto LABEL_39;
    }
LABEL_40:
    OUTLINED_FUNCTION_187();
    if (v83 < v71)
    {
      v84 = v108;
      if (*(_QWORD *)(v108 + 16))
      {
        OUTLINED_FUNCTION_18_2();
        v85 = OUTLINED_FUNCTION_17_2();
        if ((v86 & 1) != 0)
        {
          v52 = *(char **)(*(_QWORD *)(v84 + 56) + 8 * v85);
          OUTLINED_FUNCTION_17();
          v87 = v52 + 1;
          if (__OFADD__(v52, 1))
            goto LABEL_74;
          OUTLINED_FUNCTION_84();
          v107[0] = v84;
          OUTLINED_FUNCTION_17_2();
          OUTLINED_FUNCTION_91();
          if (v77)
            goto LABEL_76;
          OUTLINED_FUNCTION_276();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
          OUTLINED_FUNCTION_47_0();
          OUTLINED_FUNCTION_302();
          if ((v88 & 1) != 0)
          {
            OUTLINED_FUNCTION_17_2();
            OUTLINED_FUNCTION_146();
            if (!v53)
              goto LABEL_82;
            v68 = v89;
          }
          v52 = (char *)v107[0];
          if ((v44 & 1) != 0)
          {
            *(_QWORD *)(*(_QWORD *)(v107[0] + 56) + 8 * v68) = v87;
LABEL_65:
            v108 = (uint64_t)v52;
            OUTLINED_FUNCTION_17();
            OUTLINED_FUNCTION_85();
            OUTLINED_FUNCTION_210();
            OUTLINED_FUNCTION_238();
            goto LABEL_66;
          }
          OUTLINED_FUNCTION_49_0();
          if (v77)
            goto LABEL_78;
          goto LABEL_64;
        }
        OUTLINED_FUNCTION_17();
      }
      OUTLINED_FUNCTION_84();
      v107[0] = v84;
      OUTLINED_FUNCTION_17_2();
      OUTLINED_FUNCTION_91();
      if (v77)
        goto LABEL_70;
      OUTLINED_FUNCTION_276();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
      OUTLINED_FUNCTION_47_0();
      OUTLINED_FUNCTION_302();
      if ((v90 & 1) != 0)
      {
        OUTLINED_FUNCTION_17_2();
        OUTLINED_FUNCTION_146();
        if (!v53)
          goto LABEL_82;
        v68 = v91;
      }
      v52 = (char *)v107[0];
      if ((v44 & 1) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(v107[0] + 56) + 8 * v68) = 1;
        goto LABEL_65;
      }
      OUTLINED_FUNCTION_48_0();
      if (v77)
        goto LABEL_72;
LABEL_64:
      *((_QWORD *)v52 + 2) = v92;
      OUTLINED_FUNCTION_18_2();
      goto LABEL_65;
    }
    OUTLINED_FUNCTION_210();
    OUTLINED_FUNCTION_17();
LABEL_66:
    v52 = *v94;
    OUTLINED_FUNCTION_109();
    OUTLINED_FUNCTION_286();
    if (v53)
      goto LABEL_3;
  }
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  sub_235F9B6D8();
  __break(1u);
}

void sub_235F7AA60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
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
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_296();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_74();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_208();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v59 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399A08);
  v68 = OUTLINED_FUNCTION_171();
  v61 = OUTLINED_FUNCTION_171();
  OUTLINED_FUNCTION_179();
  v62 = v8;
  OUTLINED_FUNCTION_220();
  v9 = *(void (**)(uint64_t))(v1 + 8);
  v10 = OUTLINED_FUNCTION_141();
  v9(v10);
  OUTLINED_FUNCTION_179();
  v63 = v3;
  OUTLINED_FUNCTION_220();
  v59[1] = v9;
  v60 = v2;
  ((void (*)(uint64_t, uint64_t))v9)(v0, v2);
  sub_235F73F2C();
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v13 = v11 + 40;
    do
    {
      OUTLINED_FUNCTION_18_2();
      sub_235F74374();
      sub_235F77224();
      v15 = v14;
      OUTLINED_FUNCTION_17();
      sub_235F9B120();
      if (v16 < v15)
      {
        OUTLINED_FUNCTION_291();
        OUTLINED_FUNCTION_34_2();
        OUTLINED_FUNCTION_84();
        OUTLINED_FUNCTION_93();
        v68 = v69;
        OUTLINED_FUNCTION_39();
        OUTLINED_FUNCTION_85();
      }
      sub_235F9B120();
      if (v17 < v15)
      {
        OUTLINED_FUNCTION_291();
        OUTLINED_FUNCTION_84();
        OUTLINED_FUNCTION_93();
        v61 = v69;
        OUTLINED_FUNCTION_39();
      }
      swift_bridgeObjectRelease();
      v13 += 16;
      --v12;
    }
    while (v12);
  }
  OUTLINED_FUNCTION_25();
  v67 = v68 + 64;
  OUTLINED_FUNCTION_70_0();
  v20 = v19 & v18;
  OUTLINED_FUNCTION_259();
  v65 = v21;
  swift_bridgeObjectRetain();
  v22 = 0;
  *(_QWORD *)&v23 = 136315394;
  v66 = v23;
  v64 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    if (v20)
    {
      OUTLINED_FUNCTION_196();
      goto LABEL_30;
    }
    if (__OFADD__(v22, 1))
    {
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    OUTLINED_FUNCTION_288();
    if (v25 == v26)
      goto LABEL_35;
    v22 = v24;
    if (!*(_QWORD *)(v67 + 8 * v24))
    {
      v22 = v24 + 1;
      OUTLINED_FUNCTION_178();
      if (v25 == v26)
        goto LABEL_35;
      OUTLINED_FUNCTION_261();
      if (!v28)
      {
        v22 = v27 + 2;
        OUTLINED_FUNCTION_178();
        if (v25 == v26)
          goto LABEL_35;
        OUTLINED_FUNCTION_261();
        if (!v29)
          break;
      }
    }
LABEL_29:
    OUTLINED_FUNCTION_252();
LABEL_30:
    v32 = qword_2563993D8;
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_34_2();
    if (v32 != -1)
      swift_once();
    v33 = OUTLINED_FUNCTION_19_1();
    v34 = __swift_project_value_buffer(v33, (uint64_t)qword_25639A758);
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_34_2();
    sub_235F9B36C();
    v35 = OUTLINED_FUNCTION_183();
    if (OUTLINED_FUNCTION_246(v35))
    {
      v36 = OUTLINED_FUNCTION_23_0();
      v69 = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v36 = v66;
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_244();
      *(_QWORD *)(v36 + 4) = v37;
      OUTLINED_FUNCTION_241();
      *(_WORD *)(v36 + 12) = 2080;
      v38 = OUTLINED_FUNCTION_34_2();
      MEMORY[0x23B7E7668](v38, MEMORY[0x24BEE0D00]);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_243();
      *(_QWORD *)(v36 + 14) = v39;
      OUTLINED_FUNCTION_62_0();
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_154(&dword_235F59000, v34, (os_log_type_t)v12, "PhotosSearchClient plugin: assetsPresentedInEventWeek %s: %s", (uint8_t *)v36);
      OUTLINED_FUNCTION_242();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_62_0();
  }
  OUTLINED_FUNCTION_288();
  if (v25 == v26)
  {
LABEL_35:
    v40 = v68;
    swift_release();
    v41 = 1 << *(_BYTE *)(v40 + 32);
    v42 = -1;
    if (v41 < 64)
      v42 = ~(-1 << v41);
    v43 = v42 & *(_QWORD *)(v40 + 64);
    v65 = (unint64_t)(v41 + 63) >> 6;
    OUTLINED_FUNCTION_58_0();
    v44 = 0;
    v64 = MEMORY[0x24BEE4AD8] + 8;
    while (1)
    {
      if (v43)
      {
        OUTLINED_FUNCTION_196();
      }
      else
      {
        if (__OFADD__(v44, 1))
          goto LABEL_66;
        OUTLINED_FUNCTION_288();
        if (v25 == v26)
        {
LABEL_64:
          swift_release();
          OUTLINED_FUNCTION_127(v63);
          OUTLINED_FUNCTION_127((uint64_t)v62);
          OUTLINED_FUNCTION_5();
          return;
        }
        v44 = v45;
        if (!*(_QWORD *)(v67 + 8 * v45))
        {
          v44 = v45 + 1;
          OUTLINED_FUNCTION_178();
          if (v25 == v26)
            goto LABEL_64;
          OUTLINED_FUNCTION_261();
          if (!v47)
          {
            v44 = v46 + 2;
            OUTLINED_FUNCTION_178();
            if (v25 == v26)
              goto LABEL_64;
            OUTLINED_FUNCTION_261();
            if (!v48)
            {
              OUTLINED_FUNCTION_288();
              if (v25 == v26)
                goto LABEL_64;
              if (!*(_QWORD *)(v67 + 8 * v49))
              {
                while (1)
                {
                  v44 = v49 + 1;
                  if (__OFADD__(v49, 1))
                    goto LABEL_68;
                  OUTLINED_FUNCTION_178();
                  if (v25 == v26)
                    goto LABEL_64;
                  v49 = v50 + 1;
                  if (*(_QWORD *)(v67 + 8 * v44))
                    goto LABEL_58;
                }
              }
              v44 = v49;
            }
          }
        }
LABEL_58:
        OUTLINED_FUNCTION_252();
      }
      v51 = qword_2563993D8;
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_34_2();
      if (v51 != -1)
        swift_once();
      v52 = OUTLINED_FUNCTION_19_1();
      v53 = __swift_project_value_buffer(v52, (uint64_t)qword_25639A758);
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_34_2();
      sub_235F9B36C();
      v54 = OUTLINED_FUNCTION_183();
      if (OUTLINED_FUNCTION_246(v54))
      {
        v55 = OUTLINED_FUNCTION_23_0();
        v69 = OUTLINED_FUNCTION_23_0();
        *(_DWORD *)v55 = v66;
        OUTLINED_FUNCTION_18_2();
        OUTLINED_FUNCTION_244();
        *(_QWORD *)(v55 + 4) = v56;
        OUTLINED_FUNCTION_241();
        *(_WORD *)(v55 + 12) = 2080;
        v57 = OUTLINED_FUNCTION_34_2();
        MEMORY[0x23B7E7668](v57, MEMORY[0x24BEE0D00]);
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_243();
        *(_QWORD *)(v55 + 14) = v58;
        OUTLINED_FUNCTION_62_0();
        OUTLINED_FUNCTION_39();
        OUTLINED_FUNCTION_154(&dword_235F59000, v53, (os_log_type_t)v12, "PhotosSearchClient plugin: assetsPresentedInEventMonth %s: %s", (uint8_t *)v55);
        OUTLINED_FUNCTION_242();
        OUTLINED_FUNCTION_8_0();
      }

      OUTLINED_FUNCTION_62_0();
      OUTLINED_FUNCTION_62_0();
    }
  }
  if (*(_QWORD *)(v67 + 8 * v30))
  {
    v22 = v30;
    goto LABEL_29;
  }
  while (1)
  {
    v22 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    OUTLINED_FUNCTION_178();
    if (v25 == v26)
      goto LABEL_35;
    v30 = v31 + 1;
    if (*(_QWORD *)(v67 + 8 * v22))
      goto LABEL_29;
  }
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
}

void sub_235F7B0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  void (*v44)(uint64_t, uint64_t);
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  id v70;
  uint64_t v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  BOOL v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  __int128 v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  os_log_type_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id *v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  os_log_type_t v127;
  _DWORD *v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  os_log_type_t v135;
  _DWORD *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  double v146;
  uint64_t (*v147)(uint64_t, uint64_t);
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD v151[7];
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  __int128 v165;
  _QWORD *v166;
  _QWORD *v167;
  uint64_t v168;
  void (*v169)(uint64_t, uint64_t, uint64_t);
  _QWORD *v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176[4];
  uint64_t v177;
  uint64_t v178;

  OUTLINED_FUNCTION_36_2();
  a21 = v25;
  a22 = v26;
  v155 = v27;
  v28 = OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_138(v28, (uint64_t)&a11);
  OUTLINED_FUNCTION_5_2(v29);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v31);
  v160 = (char *)v151 - v32;
  v168 = OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v168 - 8));
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_139(v34);
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_64_0();
  v38 = OUTLINED_FUNCTION_112(v37);
  OUTLINED_FUNCTION_223();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_21_2();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_222();
  MEMORY[0x24BDAC7A8](v41);
  v43 = (char *)v151 - v42;
  OUTLINED_FUNCTION_203();
  v156 = v43;
  OUTLINED_FUNCTION_231();
  v44 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  OUTLINED_FUNCTION_189(v22);
  OUTLINED_FUNCTION_203();
  v157 = v24;
  OUTLINED_FUNCTION_231();
  v151[6] = v38;
  v151[5] = v44;
  v44(v22, v38);
  v45 = objc_msgSend((id)objc_opt_self(), sel_sharedPhotoLibrary);
  v46 = objc_msgSend(v45, sel_librarySpecificFetchOptions);
  objc_msgSend(v46, sel_setFetchLimit_, 1000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
  v47 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v47 + 16) = xmmword_235F9D670;
  *(_QWORD *)(v47 + 32) = sub_235F9B3FC();
  *(_QWORD *)(v47 + 40) = v48;
  *(_QWORD *)(v47 + 48) = sub_235F9B3FC();
  *(_QWORD *)(v47 + 56) = v49;
  *(_QWORD *)(v47 + 64) = sub_235F9B3FC();
  *(_QWORD *)(v47 + 72) = v50;
  *(_QWORD *)(v47 + 80) = sub_235F9B3FC();
  *(_QWORD *)(v47 + 88) = v51;
  *(_QWORD *)(v47 + 96) = sub_235F9B3FC();
  *(_QWORD *)(v47 + 104) = v52;
  *(_QWORD *)(v47 + 112) = sub_235F9B3FC();
  *(_QWORD *)(v47 + 120) = v53;
  sub_235F904E4();
  v54 = OUTLINED_FUNCTION_58_0();
  v55 = sub_235F8F040(v54);
  OUTLINED_FUNCTION_35();
  v56 = (void *)objc_opt_self();
  v57 = (void *)sub_235F9B444();
  v151[3] = v46;
  v58 = objc_msgSend(v56, sel_fetchAssetsWithLocalIdentifiers_options_, v57, v46);

  v151[4] = v45;
  v59 = objc_msgSend(v45, sel_librarySpecificFetchOptions);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399768);
  v60 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v60 + 16) = xmmword_235F9D780;
  sub_235F80A44();
  *(_QWORD *)(v60 + 32) = sub_235F9B594();
  *(_QWORD *)(v60 + 40) = sub_235F9B594();
  v176[0] = v60;
  sub_235F9B468();
  sub_235F90528(v176[0]);
  objc_msgSend(v59, sel_setIncludeTorsoAndFaceDetectionData_, 1);
  v61 = (void *)objc_opt_self();
  v151[2] = v58;
  v151[1] = v59;
  v62 = objc_msgSend(v61, sel_fetchFacesGroupedByAssetLocalIdentifierForAssets_options_, v58, v59);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B80);
  v63 = sub_235F9B3CC();

  v64 = v55[2];
  if (v64)
  {
    v167 = v55;
    v65 = v55 + 5;
    v169 = (void (*)(uint64_t, uint64_t, uint64_t))v63;
    v170 = (_QWORD *)MEMORY[0x24BEE4B00];
    do
    {
      v66 = *(v65 - 1);
      v67 = *v65;
      v62 = *(id *)(v63 + 16);
      OUTLINED_FUNCTION_166();
      if (v62 && (v68 = OUTLINED_FUNCTION_191(), (v69 & 1) != 0))
        v70 = objc_msgSend((id)OUTLINED_FUNCTION_314(v68), sel_count);
      else
        v70 = 0;
      v71 = (uint64_t)v170;
      OUTLINED_FUNCTION_84();
      v176[0] = v71;
      OUTLINED_FUNCTION_191();
      OUTLINED_FUNCTION_250();
      if (__OFADD__(v74, v75))
      {
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
      v76 = v72;
      v62 = v73;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
      if ((sub_235F9B630() & 1) != 0)
      {
        v77 = OUTLINED_FUNCTION_191();
        if ((v62 & 1) != (v78 & 1))
          goto LABEL_73;
        v76 = v77;
      }
      v170 = (_QWORD *)v176[0];
      if ((v62 & 1) != 0)
      {
        *(_QWORD *)(v170[7] + 8 * v76) = v70;
      }
      else
      {
        OUTLINED_FUNCTION_100((uint64_t)&v170[v76 >> 6]);
        v80 = (_QWORD *)(v79[6] + 16 * v76);
        *v80 = v66;
        v80[1] = v67;
        *(_QWORD *)(v79[7] + 8 * v76) = v70;
        v81 = v79[2];
        v82 = __OFADD__(v81, 1);
        v83 = v81 + 1;
        if (v82)
          goto LABEL_69;
        v170[2] = v83;
        OUTLINED_FUNCTION_166();
      }
      v65 += 2;
      OUTLINED_FUNCTION_111();
      OUTLINED_FUNCTION_85();
      --v64;
      v63 = (uint64_t)v169;
    }
    while (v64);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_238();
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v170 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  swift_release();
  v166 = v170 + 8;
  OUTLINED_FUNCTION_70_0();
  v86 = v85 & v84;
  OUTLINED_FUNCTION_259();
  v167 = v87;
  swift_bridgeObjectRetain();
  v88 = 0;
  *(_QWORD *)&v89 = 136315394;
  v165 = v89;
  v164 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    if (v86)
    {
      v90 = __clz(__rbit64(v86));
      v86 &= v86 - 1;
      v91 = v90 | (v88 << 6);
      goto LABEL_38;
    }
    v92 = v88 + 1;
    if (__OFADD__(v88, 1))
      goto LABEL_68;
    v93 = v168;
    if (v92 >= (uint64_t)v167)
      break;
    ++v88;
    if (!v166[v92])
    {
      v88 = v92 + 1;
      OUTLINED_FUNCTION_226();
      if (v94 == v82)
        break;
      OUTLINED_FUNCTION_224();
      if (!v96)
      {
        v88 = v95 + 2;
        OUTLINED_FUNCTION_226();
        if (v94 == v82)
          break;
        OUTLINED_FUNCTION_224();
        if (!v98)
        {
          v99 = v97 + 3;
          if (v99 >= (uint64_t)v167)
            break;
          if (!v166[v99])
          {
            while (1)
            {
              v88 = v99 + 1;
              if (__OFADD__(v99, 1))
                break;
              OUTLINED_FUNCTION_226();
              if (v94 == v82)
                goto LABEL_43;
              OUTLINED_FUNCTION_224();
              v99 = v100 + 1;
              if (v101)
                goto LABEL_37;
            }
LABEL_70:
            __break(1u);
LABEL_71:
            swift_once();
LABEL_46:
            v126 = OUTLINED_FUNCTION_19_1();
            OUTLINED_FUNCTION_177(v126, (uint64_t)qword_25639A758);
            v127 = OUTLINED_FUNCTION_150();
            if (OUTLINED_FUNCTION_108(v127))
            {
              v128 = (_DWORD *)OUTLINED_FUNCTION_23_0();
              v176[0] = OUTLINED_FUNCTION_23_0();
              *v128 = 136315138;
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_166();
              v129 = OUTLINED_FUNCTION_234();
              v131 = v130;
              OUTLINED_FUNCTION_111();
              sub_235F7EC30(v129, v131, v176);
              OUTLINED_FUNCTION_297(v132);
              sub_235F9B5AC();
              OUTLINED_FUNCTION_25();
              OUTLINED_FUNCTION_89(&dword_235F59000, v133, v134, "PhotosSearchClient plugin: photoIDCountGivenFaceCountDictWeek %s");
              OUTLINED_FUNCTION_6_1();
              OUTLINED_FUNCTION_8_0();
            }

            sub_235F9B36C();
            v135 = OUTLINED_FUNCTION_150();
            if (OUTLINED_FUNCTION_123(v135))
            {
              v136 = (_DWORD *)OUTLINED_FUNCTION_23_0();
              v176[0] = OUTLINED_FUNCTION_23_0();
              *v136 = 136315138;
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_37_1();
              OUTLINED_FUNCTION_234();
              OUTLINED_FUNCTION_25();
              OUTLINED_FUNCTION_114();
              OUTLINED_FUNCTION_122(v137);
              OUTLINED_FUNCTION_43_0();
              OUTLINED_FUNCTION_90(&dword_235F59000, v138, v139, "PhotosSearchClient plugin: photoIDCountGivenFaceCountDictMonth %s");
              OUTLINED_FUNCTION_6_1();
              OUTLINED_FUNCTION_8_0();
            }
            OUTLINED_FUNCTION_63_0((uint64_t)&v174);
            OUTLINED_FUNCTION_63_0((uint64_t)&v173);
            OUTLINED_FUNCTION_63_0((uint64_t)&v172);

            OUTLINED_FUNCTION_63_0((uint64_t)&v175);
            OUTLINED_FUNCTION_308((uint64_t)v176);
            OUTLINED_FUNCTION_127((uint64_t)v156);
            OUTLINED_FUNCTION_2();
            OUTLINED_FUNCTION_2();
            OUTLINED_FUNCTION_5();
            return;
          }
          v88 = v99;
        }
      }
    }
LABEL_37:
    OUTLINED_FUNCTION_251();
    v86 = v103 & v102;
    v91 = v104 + (v88 << 6);
LABEL_38:
    v105 = (uint64_t *)(v170[6] + 16 * v91);
    v107 = *v105;
    v106 = v105[1];
    v108 = *(_QWORD *)(v170[7] + 8 * v91);
    v109 = qword_2563993D8;
    OUTLINED_FUNCTION_17_0();
    if (v109 != -1)
      swift_once();
    v110 = OUTLINED_FUNCTION_19_1();
    v111 = __swift_project_value_buffer(v110, (uint64_t)qword_25639A758);
    OUTLINED_FUNCTION_17_0();
    sub_235F9B36C();
    v112 = OUTLINED_FUNCTION_183();
    v62 = (id)v112;
    if (os_log_type_enabled(v111, v112))
    {
      v113 = OUTLINED_FUNCTION_23_0();
      v114 = OUTLINED_FUNCTION_23_0();
      v169 = (void (*)(uint64_t, uint64_t, uint64_t))v88;
      v176[0] = v114;
      *(_DWORD *)v113 = v165;
      OUTLINED_FUNCTION_17_0();
      sub_235F7EC30(v107, v106, v176);
      *(_QWORD *)(v113 + 4) = v115;
      OUTLINED_FUNCTION_241();
      *(_WORD *)(v113 + 12) = 2048;
      *(_QWORD *)(v113 + 14) = v108;
      OUTLINED_FUNCTION_154(&dword_235F59000, v111, (os_log_type_t)v62, "assetID: %s, faceCount: %ld", (uint8_t *)v113);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_62_0();
  }
LABEL_43:
  swift_release();
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399B70);
  OUTLINED_FUNCTION_60();
  v178 = OUTLINED_FUNCTION_294();
  OUTLINED_FUNCTION_60();
  v164 = v116;
  v177 = OUTLINED_FUNCTION_294();
  v117 = v163;
  OUTLINED_FUNCTION_160();
  v118 = v154;
  v119 = v152;
  v169 = *(void (**)(uint64_t, uint64_t, uint64_t))(v154 + 16);
  v169(v152, v117, v93);
  sub_235F7F748();
  OUTLINED_FUNCTION_270();
  OUTLINED_FUNCTION_170(*(uint64_t (**)(void))(v118 + 8));
  v120 = v153;
  *(_QWORD *)(v119 + *(int *)(v153 + 36)) = v176[0];
  v121 = v162;
  sub_235F7F788(v119, v162);
  v122 = (id *)(v121 + *(int *)(v120 + 36));
  v62 = *v122;
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_286();
  v123 = v159;
  v124 = v158;
  if (v125)
  {
LABEL_45:
    sub_235F729B0(v121, &qword_2563999F0);
    if (qword_2563993D8 != -1)
      goto LABEL_71;
    goto LABEL_46;
  }
  OUTLINED_FUNCTION_27_0();
  v166 = v140;
  *(_QWORD *)&v165 = MEMORY[0x24BEE4AD8] + 8;
  v141 = v160;
  while (2)
  {
    sub_235F9B4F8();
    (*(void (**)(char *))(v124 + 16))(v141);
    OUTLINED_FUNCTION_247((uint64_t)v176);
    v169(v163, v121, v93);
    sub_235F9B4EC();
    OUTLINED_FUNCTION_107((uint64_t)&a20);
    v142 = v161;
    (*(void (**)(uint64_t, char *, uint64_t))(v124 + 32))(v161, v141, v123);
    sub_235F9B24C();
    if (!v176[3])
    {
      sub_235F729B0((uint64_t)v176, &qword_256399530);
LABEL_61:
      v143 = v162;
      v147 = *(uint64_t (**)(uint64_t, uint64_t))(v124 + 8);
      v148 = v142;
LABEL_62:
      OUTLINED_FUNCTION_304(v148, v147);
      goto LABEL_63;
    }
    if ((OUTLINED_FUNCTION_65_0() & 1) == 0)
      goto LABEL_61;
    v143 = v162;
    if (qword_2563993F0 != -1)
      swift_once();
    sub_235F9B24C();
    if (v175)
    {
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_219();
      OUTLINED_FUNCTION_19_2();
      v144 = (double)v171;
      OUTLINED_FUNCTION_187();
      if (v145 < v144)
      {
        OUTLINED_FUNCTION_188();
        OUTLINED_FUNCTION_37_1();
        OUTLINED_FUNCTION_239((uint64_t)&v178);
        OUTLINED_FUNCTION_25();
      }
      OUTLINED_FUNCTION_187();
      if (v146 < v144)
      {
        OUTLINED_FUNCTION_188();
        OUTLINED_FUNCTION_37_1();
        OUTLINED_FUNCTION_239((uint64_t)&v177);
        OUTLINED_FUNCTION_111();
        OUTLINED_FUNCTION_25();
        v124 = v158;
        v147 = *(uint64_t (**)(uint64_t, uint64_t))(v158 + 8);
        v148 = v142;
        v123 = v159;
        goto LABEL_62;
      }
      v149 = v142;
      v150 = v158;
      v123 = v159;
      OUTLINED_FUNCTION_304(v149, *(uint64_t (**)(uint64_t, uint64_t))(v158 + 8));
      v124 = v150;
      swift_bridgeObjectRelease();
LABEL_63:
      v62 = *v122;
      v121 = v143;
      v93 = v168;
      OUTLINED_FUNCTION_271();
      OUTLINED_FUNCTION_286();
      if (v125)
        goto LABEL_45;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_73:
  sub_235F9B6D8();
  __break(1u);
}

void sub_235F7BE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _BOOL8 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  unint64_t v98;
  char v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  BOOL v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  os_log_type_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(uint64_t, uint64_t, uint64_t);
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  os_log_type_t v128;
  _DWORD *v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  os_log_type_t v136;
  _DWORD *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(uint64_t *, _QWORD);
  double v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  _QWORD *v155;
  _QWORD *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void (*v161)(uint64_t, uint64_t);
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void (*v165)(uint64_t, uint64_t, uint64_t);
  int v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD v169[4];
  uint64_t v170[4];
  uint64_t v171;
  uint64_t v172;

  OUTLINED_FUNCTION_36_2();
  a21 = v25;
  a22 = v26;
  v27 = OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_138(v27, (uint64_t)&a18);
  OUTLINED_FUNCTION_5_2(v28);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_64_0();
  v150 = v31;
  v159 = OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v159 - 8));
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_139(v33);
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_64_0();
  v37 = OUTLINED_FUNCTION_112(v36);
  OUTLINED_FUNCTION_223();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_21_2();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_208();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_169();
  v149 = v24;
  OUTLINED_FUNCTION_220();
  v41 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  OUTLINED_FUNCTION_189(v22);
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_220();
  v41(v22, v37);
  v42 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedPhotoLibrary), sel_librarySpecificFetchOptions);
  objc_msgSend(v42, sel_setFetchLimit_, 1000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
  v43 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v43 + 16) = xmmword_235F9D670;
  *(_QWORD *)(v43 + 32) = sub_235F9B3FC();
  *(_QWORD *)(v43 + 40) = v44;
  *(_QWORD *)(v43 + 48) = sub_235F9B3FC();
  *(_QWORD *)(v43 + 56) = v45;
  *(_QWORD *)(v43 + 64) = sub_235F9B3FC();
  *(_QWORD *)(v43 + 72) = v46;
  *(_QWORD *)(v43 + 80) = sub_235F9B3FC();
  *(_QWORD *)(v43 + 88) = v47;
  *(_QWORD *)(v43 + 96) = sub_235F9B3FC();
  *(_QWORD *)(v43 + 104) = v48;
  *(_QWORD *)(v43 + 112) = sub_235F9B3FC();
  *(_QWORD *)(v43 + 120) = v49;
  sub_235F904E4();
  v50 = OUTLINED_FUNCTION_62();
  v51 = sub_235F8F040(v50);
  OUTLINED_FUNCTION_27_1();
  v52 = (void *)objc_opt_self();
  v53 = (void *)sub_235F9B444();
  v54 = (unint64_t)objc_msgSend(v52, sel_fetchAssetsWithLocalIdentifiers_options_, v53, v42);

  v55 = objc_msgSend((id)objc_opt_self(), sel_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_, v54, v54);
  if (v55)
  {
    v54 = (unint64_t)v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B78);
    v56 = sub_235F9B3CC();

    v57 = sub_235F94624(v56);
    OUTLINED_FUNCTION_35();
  }
  else
  {
    v57 = 0;
  }
  v157 = v51[2];
  if (v157)
  {
    v58 = 0;
    v59 = MEMORY[0x24BEE4B08];
    v60 = MEMORY[0x24BEE4B00];
    v156 = v51 + 4;
    v155 = v51;
    v154 = v57;
    while (1)
    {
      if (v58 >= v51[2])
      {
        __break(1u);
LABEL_104:
        __break(1u);
LABEL_105:
        __break(1u);
LABEL_106:
        __break(1u);
        goto LABEL_107;
      }
      v61 = &v156[2 * v58];
      v62 = v61[1];
      v163 = *v61;
      if (v57)
      {
        v54 = *(_QWORD *)(v57 + 16);
        OUTLINED_FUNCTION_18_2();
        if (v54)
        {
          OUTLINED_FUNCTION_18_2();
          OUTLINED_FUNCTION_17_0();
          v63 = sub_235F7F384();
          if ((v64 & 1) != 0)
          {
            v65 = *(_QWORD *)(*(_QWORD *)(v57 + 56) + 8 * v63);
            OUTLINED_FUNCTION_58_0();
            OUTLINED_FUNCTION_17();
            OUTLINED_FUNCTION_39();
            if (v65)
            {
              v148 = v62;
              if (!((unint64_t)v65 >> 62))
              {
                v66 = *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
                if (v66)
                  goto LABEL_13;
                goto LABEL_55;
              }
              if (v65 >= 0)
                v54 = v65 & 0xFFFFFFFFFFFFFF8;
              else
                v54 = v65;
              OUTLINED_FUNCTION_58_0();
              v66 = sub_235F9B654();
              OUTLINED_FUNCTION_35();
              if (!v66)
              {
LABEL_55:
                OUTLINED_FUNCTION_35();
                v68 = MEMORY[0x24BEE4AF8];
LABEL_56:
                v62 = v148;
                goto LABEL_41;
              }
LABEL_13:
              if (v66 < 1)
                goto LABEL_108;
              v162 = v60;
              v67 = 0;
              v68 = MEMORY[0x24BEE4AF8];
              while (2)
              {
                if ((v65 & 0xC000000000000001) != 0)
                  v69 = (id)MEMORY[0x23B7E7818](v67, v65);
                else
                  v69 = *(id *)(v65 + 32 + 8 * v67);
                v70 = v69;
                v54 = (unint64_t)objc_msgSend(v69, sel_sceneIdentifier);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  v84 = OUTLINED_FUNCTION_98();
                  sub_235F7E28C(v84, v85, v86, v68, &qword_256399BE8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
                  v68 = v87;
                }
                v72 = *(_QWORD *)(v68 + 16);
                v71 = *(_QWORD *)(v68 + 24);
                if (v72 >= v71 >> 1)
                {
                  v88 = OUTLINED_FUNCTION_299(v71);
                  sub_235F7E28C(v88, v89, v90, v68, &qword_256399BE8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
                  v68 = v91;
                }
                v73 = v54;
                *(_QWORD *)(v68 + 16) = v72 + 1;
                *(_QWORD *)(v68 + 8 * v72 + 32) = v54;
                if (*(_QWORD *)(v59 + 16)
                  && (v74 = OUTLINED_FUNCTION_272(),
                      v75 = -1 << *(_BYTE *)(v59 + 32),
                      v76 = v74 & ~v75,
                      ((*(_QWORD *)(v59 + 56 + ((v76 >> 3) & 0xFFFFFFFFFFFFF8)) >> v76) & 1) != 0))
                {
                  v77 = *(_QWORD *)(v59 + 48);
                  if (*(_QWORD *)(v77 + 8 * v76) != v54)
                  {
                    v78 = ~v75;
                    do
                    {
                      v76 = (v76 + 1) & v78;
                      if (((*(_QWORD *)(v59 + 56 + ((v76 >> 3) & 0xFFFFFFFFFFFFF8)) >> v76) & 1) == 0)
                        goto LABEL_29;
                    }
                    while (*(_QWORD *)(v77 + 8 * v76) != v54);
                  }
LABEL_34:

                }
                else
                {
LABEL_29:
                  v79 = OUTLINED_FUNCTION_272();
                  v80 = -1 << *(_BYTE *)(v59 + 32);
                  v54 = v79 & ~v80;
                  if (((*(_QWORD *)(v59 + 56 + ((v54 >> 3) & 0xFFFFFFFFFFFFF8)) >> v54) & 1) != 0)
                  {
                    v81 = *(_QWORD *)(v59 + 48);
                    if (*(_QWORD *)(v81 + 8 * v54) == v73)
                      goto LABEL_34;
                    v82 = ~v80;
                    while (1)
                    {
                      v54 = (v54 + 1) & v82;
                      if (((*(_QWORD *)(v59 + 56 + ((v54 >> 3) & 0xFFFFFFFFFFFFF8)) >> v54) & 1) == 0)
                        break;
                      if (*(_QWORD *)(v81 + 8 * v54) == v73)
                        goto LABEL_34;
                    }
                  }
                  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  v170[0] = v59;
                  sub_235F8F984(v73, v54, isUniquelyReferenced_nonNull_native);

                  OUTLINED_FUNCTION_85();
                }
                if (++v67 == v66)
                {
                  OUTLINED_FUNCTION_256();
                  swift_bridgeObjectRelease();
                  v60 = v162;
                  goto LABEL_56;
                }
                continue;
              }
            }
          }
          else
          {
            OUTLINED_FUNCTION_17();
            OUTLINED_FUNCTION_39();
          }
        }
      }
      else
      {
        OUTLINED_FUNCTION_18_2();
      }
      v68 = MEMORY[0x24BEE4AF8];
LABEL_41:
      swift_isUniquelyReferenced_nonNull_native();
      v170[0] = v60;
      v92 = v62;
      sub_235F7F384();
      OUTLINED_FUNCTION_250();
      if (__OFADD__(v95, v96))
        goto LABEL_104;
      v54 = v93;
      v97 = v94;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399B68);
      if ((sub_235F9B630() & 1) != 0)
      {
        v98 = sub_235F7F384();
        if ((v97 & 1) != (v99 & 1))
          goto LABEL_111;
        v54 = v98;
      }
      v60 = v170[0];
      if ((v97 & 1) != 0)
      {
        v100 = *(_QWORD *)(v170[0] + 56);
        swift_bridgeObjectRelease();
        *(_QWORD *)(v100 + 8 * v54) = v68;
      }
      else
      {
        OUTLINED_FUNCTION_100(v170[0] + 8 * (v54 >> 6));
        v101 = (_QWORD *)(*(_QWORD *)(v170[0] + 48) + 16 * v54);
        *v101 = v163;
        v101[1] = v92;
        *(_QWORD *)(*(_QWORD *)(v60 + 56) + 8 * v54) = v68;
        v102 = *(_QWORD *)(v60 + 16);
        v103 = __OFADD__(v102, 1);
        v104 = v102 + 1;
        if (v103)
          goto LABEL_106;
        *(_QWORD *)(v60 + 16) = v104;
        swift_bridgeObjectRetain();
      }
      ++v58;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_85();
      v51 = v155;
      v57 = v154;
      if (v58 == v157)
      {
        OUTLINED_FUNCTION_39();
        OUTLINED_FUNCTION_278();
        goto LABEL_58;
      }
    }
  }
  OUTLINED_FUNCTION_278();
  OUTLINED_FUNCTION_39();
  v60 = MEMORY[0x24BEE4B00];
LABEL_58:
  v160 = v60 + 64;
  OUTLINED_FUNCTION_70_0();
  v107 = v106 & v105;
  OUTLINED_FUNCTION_259();
  v164 = v108;
  OUTLINED_FUNCTION_48();
  v109 = 0;
  while (1)
  {
    if (v107)
    {
      v107 &= v107 - 1;
      goto LABEL_75;
    }
    v110 = v109 + 1;
    if (__OFADD__(v109, 1))
      goto LABEL_105;
    v111 = v159;
    if (v110 >= v164)
      break;
    ++v109;
    if (!*(_QWORD *)(v160 + 8 * v110))
    {
      v109 = v110 + 1;
      if (v110 + 1 >= v164)
        break;
      if (!*(_QWORD *)(v160 + 8 * v109))
      {
        v109 = v110 + 2;
        if (v110 + 2 >= v164)
          break;
        if (!*(_QWORD *)(v160 + 8 * v109))
        {
          v112 = v110 + 3;
          if (v112 >= v164)
            break;
          if (!*(_QWORD *)(v160 + 8 * v112))
          {
            while (1)
            {
              v109 = v112 + 1;
              if (__OFADD__(v112, 1))
                break;
              if (v109 >= v164)
                goto LABEL_80;
              ++v112;
              if (*(_QWORD *)(v160 + 8 * v109))
                goto LABEL_74;
            }
LABEL_107:
            __break(1u);
LABEL_108:
            __break(1u);
LABEL_109:
            swift_once();
LABEL_82:
            v127 = OUTLINED_FUNCTION_19_1();
            OUTLINED_FUNCTION_177(v127, (uint64_t)qword_25639A758);
            v128 = OUTLINED_FUNCTION_150();
            if (OUTLINED_FUNCTION_108(v128))
            {
              v129 = (_DWORD *)OUTLINED_FUNCTION_23_0();
              v170[0] = OUTLINED_FUNCTION_23_0();
              *v129 = 136315138;
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_166();
              v130 = OUTLINED_FUNCTION_234();
              v132 = v131;
              OUTLINED_FUNCTION_111();
              sub_235F7EC30(v130, v132, v170);
              OUTLINED_FUNCTION_297(v133);
              sub_235F9B5AC();
              OUTLINED_FUNCTION_23();
              OUTLINED_FUNCTION_89(&dword_235F59000, v134, v135, "PhotosSearchClient plugin: photoIDCountGivenSceneCategoryDictWeek %s");
              OUTLINED_FUNCTION_6_1();
              OUTLINED_FUNCTION_8_0();
            }

            sub_235F9B36C();
            v136 = OUTLINED_FUNCTION_150();
            if (OUTLINED_FUNCTION_123(v136))
            {
              v137 = (_DWORD *)OUTLINED_FUNCTION_23_0();
              v170[0] = OUTLINED_FUNCTION_23_0();
              *v137 = 136315138;
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_266();
              OUTLINED_FUNCTION_234();
              OUTLINED_FUNCTION_23();
              OUTLINED_FUNCTION_114();
              OUTLINED_FUNCTION_232(v138);
              sub_235F9B5AC();
              OUTLINED_FUNCTION_43_0();
              OUTLINED_FUNCTION_90(&dword_235F59000, v139, v140, "PhotosSearchClient plugin: photoIDCountGivenSceneCategoryDictMonth %s");
              OUTLINED_FUNCTION_6_1();
              OUTLINED_FUNCTION_8_0();
            }
            OUTLINED_FUNCTION_63_0((uint64_t)&v167);
            OUTLINED_FUNCTION_63_0((uint64_t)&v166);

            OUTLINED_FUNCTION_63_0((uint64_t)&v168);
            OUTLINED_FUNCTION_308((uint64_t)v169);
            OUTLINED_FUNCTION_127(v149);
            OUTLINED_FUNCTION_2();
            OUTLINED_FUNCTION_2();
            OUTLINED_FUNCTION_5();
            return;
          }
          v109 = v112;
        }
      }
    }
LABEL_74:
    OUTLINED_FUNCTION_251();
    v107 = v114 & v113;
LABEL_75:
    v54 = qword_2563993D8;
    OUTLINED_FUNCTION_42_1();
    OUTLINED_FUNCTION_48();
    if (v54 != -1)
      swift_once();
    v115 = OUTLINED_FUNCTION_19_1();
    v116 = __swift_project_value_buffer(v115, (uint64_t)qword_25639A758);
    OUTLINED_FUNCTION_42_1();
    OUTLINED_FUNCTION_48();
    sub_235F9B36C();
    v117 = OUTLINED_FUNCTION_183();
    if (os_log_type_enabled(v116, v117))
    {
      v118 = OUTLINED_FUNCTION_23_0();
      v170[0] = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v118 = 136315394;
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_221();
      *(_QWORD *)(v118 + 4) = v119;
      OUTLINED_FUNCTION_241();
      *(_WORD *)(v118 + 12) = 2080;
      v120 = OUTLINED_FUNCTION_48();
      MEMORY[0x23B7E7668](v120, MEMORY[0x24BEE1768]);
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_221();
      *(_QWORD *)(v118 + 14) = v121;
      OUTLINED_FUNCTION_62_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_154(&dword_235F59000, v116, v117, "assetID: %s, sceneCategory: %s", (uint8_t *)v118);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_62_0();
  }
LABEL_80:
  OUTLINED_FUNCTION_268();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B70);
  OUTLINED_FUNCTION_60();
  v172 = OUTLINED_FUNCTION_273();
  OUTLINED_FUNCTION_60();
  v171 = OUTLINED_FUNCTION_273();
  OUTLINED_FUNCTION_160();
  v122 = OUTLINED_FUNCTION_262();
  v165 = v123;
  ((void (*)(uint64_t))v123)(v122);
  v54 = sub_235F7F748();
  sub_235F9B4D4();
  v161 = *(void (**)(uint64_t, uint64_t))(v147 + 8);
  v161(v153, v159);
  *(_QWORD *)(v145 + *(int *)(v146 + 36)) = v170[0];
  v124 = v152;
  sub_235F7F788(v145, v152);
  v125 = (uint64_t *)(v152 + *(int *)(v146 + 36));
  v126 = *v125;
  OUTLINED_FUNCTION_295();
  if (v126 == v170[0])
  {
LABEL_81:
    sub_235F729B0(v124, &qword_2563999F0);
    OUTLINED_FUNCTION_20();
    if (qword_2563993D8 != -1)
      goto LABEL_109;
    goto LABEL_82;
  }
  while (2)
  {
    v141 = (void (*)(uint64_t *, _QWORD))sub_235F9B4F8();
    (*(void (**)(uint64_t))(v158 + 16))(v150);
    v141(v170, 0);
    v165(v153, v124, v111);
    sub_235F9B4EC();
    v161(v153, v111);
    (*(void (**)(uint64_t, uint64_t))(v158 + 32))(v151, v150);
    if (qword_256399408 != -1)
      swift_once();
    OUTLINED_FUNCTION_151();
    if (!v170[3])
    {
      sub_235F729B0((uint64_t)v170, &qword_256399530);
LABEL_99:
      OUTLINED_FUNCTION_52_0(v151, *(uint64_t (**)(uint64_t, _QWORD))(v158 + 8));
      goto LABEL_100;
    }
    if ((OUTLINED_FUNCTION_65_0() & 1) == 0)
      goto LABEL_99;
    if (qword_2563993F0 != -1)
      swift_once();
    OUTLINED_FUNCTION_129();
    if (v169[3])
    {
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_219();
      OUTLINED_FUNCTION_19_2();
      OUTLINED_FUNCTION_187();
      if (v142 < (double)v166)
      {
        OUTLINED_FUNCTION_188();
        OUTLINED_FUNCTION_48();
        OUTLINED_FUNCTION_34_2();
        OUTLINED_FUNCTION_161((uint64_t)&v172);
        OUTLINED_FUNCTION_9_1();
        OUTLINED_FUNCTION_20();
      }
      OUTLINED_FUNCTION_187();
      if (v143 < (double)v166)
      {
        OUTLINED_FUNCTION_188();
        OUTLINED_FUNCTION_48();
        OUTLINED_FUNCTION_34_2();
        OUTLINED_FUNCTION_161((uint64_t)&v171);
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_9_1();
        OUTLINED_FUNCTION_20();
        goto LABEL_99;
      }
      OUTLINED_FUNCTION_52_0(v151, *(uint64_t (**)(uint64_t, _QWORD))(v158 + 8));
      OUTLINED_FUNCTION_17();
LABEL_100:
      v124 = v152;
      v144 = *v125;
      v111 = v159;
      OUTLINED_FUNCTION_295();
      if (v144 == v170[0])
        goto LABEL_81;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_111:
  sub_235F9B6D8();
  __break(1u);
}

uint64_t sub_235F7CEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __n128 v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __n128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  _QWORD *v68;
  unint64_t v70;
  _QWORD *v71;
  BOOL v72;
  unint64_t i;
  uint64_t v74;
  char v75;
  _QWORD *v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  unint64_t v86;
  char v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t result;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD *v165;
  uint64_t v166;
  _QWORD v167[2];

  sub_235F7A178(a2, a2, a3, a4, a5, a6, a7, a8, v123, v126, v129, a2, v134, v137, v140, v143, v146, v149, v152,
    v155,
    v158,
    v161);
  v127 = v8;
  v130 = v9;
  sub_235F7AA60();
  v135 = v10;
  v12 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399BC0);
  v13 = sub_235F9B3E4();
  v167[0] = v13;
  v166 = MEMORY[0x24BEE4B08];
  v141 = v12 + 64;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  if (v14 < 64)
    v15 = ~(-1 << v14);
  else
    v15 = -1;
  v16 = v15 & *(_QWORD *)(v12 + 64);
  OUTLINED_FUNCTION_259();
  v144 = v17;
  OUTLINED_FUNCTION_166();
  v18 = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  v138 = v12;
  while (1)
  {
    v156 = v13;
    if (v16)
    {
      v150 = (v16 - 1) & v16;
      v23 = __clz(__rbit64(v16)) | (v18 << 6);
    }
    else
    {
      v24 = v18 + 1;
      if (__OFADD__(v18, 1))
        goto LABEL_73;
      if (v24 >= v144)
        goto LABEL_67;
      if (!*(_QWORD *)(v141 + 8 * v24))
      {
        if (v18 + 2 >= v144)
          goto LABEL_67;
        if (!*(_QWORD *)(v141 + 8 * (v18 + 2)))
        {
          if (v18 + 3 >= v144)
            goto LABEL_67;
          if (!*(_QWORD *)(v141 + 8 * (v18 + 3)))
          {
            v25 = v18 + 4;
            if (v18 + 4 >= v144)
              goto LABEL_67;
            if (!*(_QWORD *)(v141 + 8 * v25))
            {
              while (1)
              {
                v26 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_74;
                if (v26 >= v144)
                  break;
                ++v25;
                if (*(_QWORD *)(v141 + 8 * v26))
                  goto LABEL_19;
              }
LABEL_67:
              swift_release();
              OUTLINED_FUNCTION_188();
              v93 = v135;
              sub_235F8536C(v167, v127, v135, 1);
              OUTLINED_FUNCTION_27_1();
              sub_235F8536C(v167, v130, v12, 0);
              OUTLINED_FUNCTION_27_1();
              v94 = v166;
              v95 = OUTLINED_FUNCTION_18_2();
              v96 = v132;
              sub_235F7B0B8(v95, v132, v97, v98, v99, v100, v101, v102, v124, v127, v130, v132, v135, v138, v141, v144, v147, v150, v153,
                v156,
                v159,
                v162);
              v104 = v103;
              v106 = v105;
              v108 = v107;
              OUTLINED_FUNCTION_17();
              sub_235F7BE5C(v94, v96, v109, v110, v111, v112, v113, v114, v125, v128, v131, v133, v136, v139, v142, v145, v148, v151, v154,
                v157,
                v160,
                v163);
              v116 = v115;
              v118 = v117;
              OUTLINED_FUNCTION_17();
              sub_235F83598(v167, v104, v106, v93, 1);
              OUTLINED_FUNCTION_39();
              sub_235F83598(v167, v104, v108, v12, 0);
              OUTLINED_FUNCTION_9_1();
              OUTLINED_FUNCTION_25();
              sub_235F847B4((uint64_t)v167, v116, v118, v93, 1);
              OUTLINED_FUNCTION_43_0();
              OUTLINED_FUNCTION_23();
              OUTLINED_FUNCTION_300();
              sub_235F847B4(v119, v120, v121, v12, 0);
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_20();
              OUTLINED_FUNCTION_27_1();
              return v167[0];
            }
          }
        }
      }
LABEL_19:
      OUTLINED_FUNCTION_251();
      v150 = v28 & v27;
      v23 = v29 + (v18 << 6);
    }
    v153 = v18;
    v30 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 16 * v23);
    v159 = *v30;
    v31 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v23);
    v164 = *(_QWORD *)(v31 + 16);
    if (v164)
      break;
    v78 = v30[1];
    swift_bridgeObjectRetain();
    v33 = MEMORY[0x24BEE4B00];
LABEL_58:
    OUTLINED_FUNCTION_84();
    v165 = (_QWORD *)v156;
    v79 = v78;
    sub_235F7F384();
    OUTLINED_FUNCTION_250();
    if (__OFADD__(v82, v83))
      goto LABEL_71;
    v84 = v80;
    v85 = v81;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BD0);
    if ((sub_235F9B630() & 1) != 0)
    {
      v86 = sub_235F7F384();
      if ((v85 & 1) != (v87 & 1))
        goto LABEL_75;
      v84 = v86;
    }
    v88 = v165;
    if ((v85 & 1) != 0)
    {
      v89 = v165[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v89 + 8 * v84) = v33;
      v13 = (uint64_t)v88;
    }
    else
    {
      OUTLINED_FUNCTION_100((uint64_t)&v165[v84 >> 6]);
      v90 = (uint64_t *)(v88[6] + 16 * v84);
      *v90 = v159;
      v90[1] = v79;
      *(_QWORD *)(v88[7] + 8 * v84) = v33;
      v91 = v88[2];
      _VF = __OFADD__(v91, 1);
      v92 = v91 + 1;
      if (_VF)
        goto LABEL_72;
      v13 = (uint64_t)v88;
      v88[2] = v92;
      OUTLINED_FUNCTION_37_1();
    }
    v167[0] = v13;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_85();
    v16 = v150;
    v18 = v153;
  }
  v147 = v30[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_34_2();
  v32 = 0;
  v33 = MEMORY[0x24BEE4B00];
  while (v32 < *(_QWORD *)(v31 + 16))
  {
    v34 = (uint64_t *)(v31 + 32 + 16 * v32);
    v36 = *v34;
    v35 = v34[1];
    swift_bridgeObjectRetain_n();
    swift_isUniquelyReferenced_nonNull_native();
    v165 = (_QWORD *)v33;
    OUTLINED_FUNCTION_262();
    v37 = sub_235F7F384();
    if (__OFADD__(*(_QWORD *)(v33 + 16), (v38 & 1) == 0))
      goto LABEL_69;
    v39 = v37;
    v40 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BC8);
    v41 = sub_235F9B630();
    if ((v41 & 1) != 0)
    {
      v41 = OUTLINED_FUNCTION_17_2();
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_75;
      v39 = v41;
    }
    v33 = (uint64_t)v165;
    if ((v40 & 1) != 0)
    {
      OUTLINED_FUNCTION_214(v41, v42, v43, v44, v45, v46, v47, v48, v124, v127, v130, v132, v135, v138, v141, v144, v147, v150, v153,
        v156,
        v159,
        v162,
        v49);
    }
    else
    {
      OUTLINED_FUNCTION_100((uint64_t)&v165[v39 >> 6]);
      v50 = (uint64_t *)(*(_QWORD *)(v33 + 48) + 16 * v39);
      *v50 = v36;
      v50[1] = v35;
      OUTLINED_FUNCTION_214(v51, v52, v53, v54, v55, v56, v57, v58, v124, v127, v130, v132, v135, v138, v141, v144, v147, v150, v153,
        v156,
        v159,
        v162,
        v59);
      v60 = *(_QWORD *)(v33 + 16);
      _VF = __OFADD__(v60, 1);
      v61 = v60 + 1;
      if (_VF)
        goto LABEL_70;
      *(_QWORD *)(v33 + 16) = v61;
      OUTLINED_FUNCTION_18_2();
    }
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_85();
    v62 = v166;
    if (!*(_QWORD *)(v166 + 16))
      goto LABEL_54;
    sub_235F9B738();
    OUTLINED_FUNCTION_62();
    sub_235F9B414();
    v63 = sub_235F9B750();
    v64 = -1 << *(_BYTE *)(v62 + 32);
    v65 = v63 & ~v64;
    OUTLINED_FUNCTION_282();
    if ((v66 & 1) == 0)
      goto LABEL_53;
    v67 = *(_QWORD *)(v62 + 48);
    v68 = (_QWORD *)(v67 + 16 * v65);
    _ZF = *v68 == v36 && v68[1] == v35;
    if (!_ZF && (OUTLINED_FUNCTION_31_2() & 1) == 0)
    {
      v162 = ~v64;
      v70 = (v65 + 1) & ~v64;
      if (((*(_QWORD *)(v62 + 56 + ((v70 >> 3) & 0xFFFFFFFFFFFFF8)) >> v70) & 1) == 0)
        goto LABEL_53;
      v71 = (_QWORD *)(v67 + 16 * v70);
      v72 = *v71 == v36 && v71[1] == v35;
      if (!v72 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
      {
        for (i = v70 + 1; ; i = v74 + 1)
        {
          v74 = i & v162;
          OUTLINED_FUNCTION_282();
          if ((v75 & 1) == 0)
            break;
          v76 = (_QWORD *)(v67 + 16 * v74);
          v77 = *v76 == v36 && v76[1] == v35;
          if (v77 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
            goto LABEL_44;
        }
LABEL_53:
        OUTLINED_FUNCTION_27_1();
LABEL_54:
        sub_235F8F2B4((uint64_t *)&v165, v36, v35);
        goto LABEL_55;
      }
    }
LABEL_44:
    OUTLINED_FUNCTION_17();
LABEL_55:
    swift_bridgeObjectRelease();
    if (++v32 == v164)
    {
      OUTLINED_FUNCTION_20();
      v12 = v138;
      v78 = v147;
      goto LABEL_58;
    }
  }
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  result = sub_235F9B6D8();
  __break(1u);
  return result;
}

uint64_t sub_235F7D524()
{
  uint64_t result;
  unint64_t v1;
  __int128 v2;
  uint64_t v3;
  __int128 v4;

  if (qword_2563993E8 != -1)
    swift_once();
  sub_235F9B24C();
  if (!v3)
  {
    __break(1u);
LABEL_8:
    OUTLINED_FUNCTION_9_2();
    result = OUTLINED_FUNCTION_284();
    __break(1u);
    return result;
  }
  sub_235F6E7A4(&v2, &v4);
  OUTLINED_FUNCTION_19_2();
  result = v1;
  if ((v1 & 0x8000000000000000) != 0 || HIDWORD(v1))
    goto LABEL_8;
  return result;
}

void sub_235F7D630()
{
  sub_235F7D648();
}

void sub_235F7D63C()
{
  sub_235F7D648();
}

void sub_235F7D648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_208();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_169();
  sub_235F9B138();
  OUTLINED_FUNCTION_267(v0);
  sub_235F9B120();
  OUTLINED_FUNCTION_267(v1);
  sub_235F9B180();
  sub_235F9B120();
  OUTLINED_FUNCTION_267(v1);
  OUTLINED_FUNCTION_300();
  sub_235F7D72C();
}

void sub_235F7D72C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  OUTLINED_FUNCTION_36_2();
  v3 = v2;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_233();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_73_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_137();
  sub_235F9B114();
  sub_235F9B114();
  if (qword_256399408 != -1)
    swift_once();
  sub_235F9B24C();
  if (v9)
  {
    OUTLINED_FUNCTION_186();
    OUTLINED_FUNCTION_19_2();
    v6 = (void *)sub_235F9B3F0();
    OUTLINED_FUNCTION_35();
    v7 = (void *)sub_235F9B144();
    v8 = (void *)sub_235F9B144();
    if (v3)
      v3 = (void *)sub_235F9B3F0();
    objc_msgSend((id)objc_opt_self(), sel_shareInformationForPhotoId_startTime_endTime_interactionStorePath_, v6, v7, v8, v3);

    OUTLINED_FUNCTION_127(v0);
    OUTLINED_FUNCTION_127(v1);
    OUTLINED_FUNCTION_5();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235F7D8C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  unint64_t v38;
  uint64_t result;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  char *v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  OUTLINED_FUNCTION_57_0();
  v57 = v5;
  v58 = v6;
  v51 = v7;
  v8 = OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_147();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_38_1();
  MEMORY[0x24BDAC7A8](v10);
  v50 = (char *)&v40 - v11;
  v12 = OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_233();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_211();
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_21_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_64_0();
  v44 = v16;
  v17 = OUTLINED_FUNCTION_153();
  OUTLINED_FUNCTION_138(v17, (uint64_t)&v56);
  OUTLINED_FUNCTION_5_2(v18);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_25_0();
  v22 = v21 - v20;
  if (qword_256399400 != -1)
    goto LABEL_36;
  while (1)
  {
    v45 = v0;
    OUTLINED_FUNCTION_317();
    if (!v54)
      goto LABEL_40;
    OUTLINED_FUNCTION_53_0();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_19_2();
    if (qword_2563993F8 != -1)
      swift_once();
    OUTLINED_FUNCTION_317();
    if (!v54)
      goto LABEL_41;
    OUTLINED_FUNCTION_53_0();
    OUTLINED_FUNCTION_140();
    v48 = v23;
    OUTLINED_FUNCTION_19_2();
    v41 = v53;
    sub_235F75AB4();
    OUTLINED_FUNCTION_27_1();
    v53 = MEMORY[0x24BEE4AF8];
    v24 = v45;
    v43 = v22;
    sub_235F9B27C();
    v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v51(v1, v24, v12);
    v25 = v4;
    v4 = sub_235F7F748();
    sub_235F9B4D4();
    v49 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v49(v24, v12);
    *(_QWORD *)(v1 + *(int *)(v47 + 36)) = v55;
    v26 = v1;
    v1 = v44;
    sub_235F7F788(v26, v44);
    OUTLINED_FUNCTION_305();
    sub_235F9B4E0();
    if ((char *)v25 != v55)
    {
      OUTLINED_FUNCTION_27_0();
      v46 = v4;
      v47 = v29;
      do
      {
        sub_235F9B4F8();
        v30 = v50;
        (*(void (**)(char *))(v3 + 16))(v50);
        OUTLINED_FUNCTION_105();
        v51(v24, v1, v12);
        OUTLINED_FUNCTION_148();
        sub_235F9B4EC();
        v49(v24, v12);
        (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v2, v30, v8);
        OUTLINED_FUNCTION_197();
        OUTLINED_FUNCTION_151();
        if (!v54)
          goto LABEL_38;
        OUTLINED_FUNCTION_53_0();
        OUTLINED_FUNCTION_19_2();
        if (v52 == 1)
        {
          OUTLINED_FUNCTION_151();
          if (!v54)
            goto LABEL_39;
          OUTLINED_FUNCTION_53_0();
          OUTLINED_FUNCTION_19_2();
          v31 = v52;
          v32 = v53;
          if ((OUTLINED_FUNCTION_84() & 1) == 0)
          {
            OUTLINED_FUNCTION_98();
            sub_235F7E354();
            v32 = v33;
          }
          v30 = *(char **)(v32 + 16);
          if ((unint64_t)v30 >= *(_QWORD *)(v32 + 24) >> 1)
          {
            sub_235F7E354();
            v32 = v34;
          }
          *(_QWORD *)(v32 + 16) = v30 + 1;
          *(_DWORD *)(v32 + 4 * (_QWORD)v30 + 32) = v31;
          v53 = v32;
          (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v8);
          v1 = v44;
          v24 = v45;
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v8);
        }
        OUTLINED_FUNCTION_305();
        v4 = v46;
        sub_235F9B4E0();
      }
      while (v30 != v55);
    }
    sub_235F729B0(v1, &qword_2563999F0);
    v22 = 0;
    sub_235F7FD10(&v53);
    v27 = *(_QWORD *)(v53 + 16);
    if (!v27)
    {
      v0 = 1;
      v28 = v43;
      goto LABEL_31;
    }
    v28 = v43;
    if (*(_DWORD *)(v53 + 32) == v41)
    {
      v0 = 0;
      goto LABEL_31;
    }
    if (v27 == 1)
      break;
    v35 = 9;
    v0 = 1;
    while (1)
    {
      if (*(_DWORD *)(v53 + 4 * v35) == v41)
      {
        v0 = v35 - 8;
        goto LABEL_31;
      }
      v36 = v35 - 7;
      if (__OFADD__(v35 - 8, 1))
        break;
      ++v35;
      if (v36 == v27)
        goto LABEL_31;
    }
    __break(1u);
LABEL_36:
    swift_once();
  }
  v0 = 1;
LABEL_31:
  swift_bridgeObjectRelease();
  v37 = __OFADD__(v0, 1);
  v38 = v0 + 1;
  if (v37)
  {
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((v38 & 0x8000000000000000) == 0 && !HIDWORD(v38))
  {
    OUTLINED_FUNCTION_52_0(v28, *(uint64_t (**)(uint64_t, _QWORD))(v42 + 8));
    return v38;
  }
LABEL_42:
  OUTLINED_FUNCTION_9_2();
  result = OUTLINED_FUNCTION_284();
  __break(1u);
  return result;
}

id AMLPhotosSearchPoirotMetrics.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMLPhotosSearchPoirotMetrics.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchPoirotMetrics();
  return objc_msgSendSuper2(&v2, sel_init);
}

id AMLPhotosSearchPoirotMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchPoirotMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235F7DF0C(uint64_t a1)
{
  return sub_235F7DF18(a1);
}

uint64_t sub_235F7DF18(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    result = sub_235F9B648();
    __break(1u);
  }
  else if (a1)
  {
    result = sub_235F9B480();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_235F7DF9C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  size_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_145();
      if (v5)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  else
  {
    v4 = v2;
  }
  v7 = *(_QWORD *)(v0 + 16);
  if (v4 <= v7)
    v8 = *(_QWORD *)(v0 + 16);
  else
    v8 = v4;
  if (!v8)
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399BF0);
  v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256399490) - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = (_QWORD *)swift_allocObject();
  v13 = _swift_stdlib_malloc_size(v12);
  if (!v10 || (v13 - v11 == 0x8000000000000000 ? (v14 = v10 == -1) : (v14 = 0), v14))
  {
LABEL_23:
    OUTLINED_FUNCTION_9_2();
    result = sub_235F9B648();
    __break(1u);
    return result;
  }
  v12[2] = v7;
  v12[3] = 2 * ((uint64_t)(v13 - v11) / v10);
LABEL_18:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256399490) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  if ((v1 & 1) != 0)
  {
    sub_235F92DBC(v0 + v16, v7, (unint64_t)v12 + v16);
    *(_QWORD *)(v0 + 16) = 0;
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    v17 = OUTLINED_FUNCTION_103();
    sub_235F7E59C(v17, v18, v19, v20);
  }
  return (uint64_t)v12;
}

void sub_235F7E138()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_145();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_144();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
    v6 = (const void *)OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_218(v6);
    OUTLINED_FUNCTION_142(v7);
  }
  if ((v1 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_287();
    sub_235F92E88(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_103();
    sub_235F7E6C0(v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_24();
}

void sub_235F7E1D8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_145();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_144();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
    v6 = (const void *)OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_218(v6);
    OUTLINED_FUNCTION_142(v7);
  }
  if ((v1 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_287();
    sub_235F92F64(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_103();
    sub_235F7E7B8(v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_24();
}

void sub_235F7E278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_235F7E28C(a1, a2, a3, a4, &qword_256399BE8, (void (*)(uint64_t, uint64_t, char *))sub_235F92FBC);
}

void sub_235F7E28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, char *))
{
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  char *v16;

  v8 = a1;
  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_145();
      if (v10)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  else
  {
    v9 = a2;
  }
  v12 = *(_QWORD *)(a4 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(a4 + 16);
  else
    v13 = v9;
  if (v13)
  {
    OUTLINED_FUNCTION_283(a1, a2, a3, a4, a5);
    v14 = (char *)OUTLINED_FUNCTION_1();
    v15 = _swift_stdlib_malloc_size(v14);
    *((_QWORD *)v14 + 2) = v12;
    *((_QWORD *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 8);
  }
  else
  {
    v14 = (char *)MEMORY[0x24BEE4AF8];
  }
  v16 = v14 + 32;
  if ((v8 & 1) != 0)
  {
    a6(a4 + 32, v12, v16);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    sub_235F7E8AC(0, v12, v16, a4);
  }
  OUTLINED_FUNCTION_240();
}

void sub_235F7E354()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_145();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_144();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BB0);
    v6 = (const void *)OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_218(v6);
    OUTLINED_FUNCTION_142(v7);
  }
  if ((v1 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_287();
    sub_235F93018(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_103();
    sub_235F7E978(v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_24();
}

void sub_235F7E3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_235F7E410(a1, a2, a3, a4, &qword_256399BA0, &qword_256399BA8, (void (*)(uint64_t, uint64_t, unint64_t))sub_235F93070);
}

void sub_235F7E410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, void (*a7)(uint64_t, uint64_t, unint64_t))
{
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  unint64_t v18;

  v10 = a1;
  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_145();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    OUTLINED_FUNCTION_283(a1, a2, a3, a4, a5);
    v16 = (_QWORD *)OUTLINED_FUNCTION_1();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 16);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v18 = (unint64_t)(v16 + 4);
  if ((v10 & 1) != 0)
  {
    a7(a4 + 32, v14, v18);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    sub_235F7EA68(0, v14, v18, a4, a6);
  }
  OUTLINED_FUNCTION_240();
}

void sub_235F7E4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_235F7E410(a1, a2, a3, a4, &qword_256399B90, &qword_256399B98, (void (*)(uint64_t, uint64_t, unint64_t))sub_235F93070);
}

void sub_235F7E4FC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_145();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_144();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B40);
    v6 = (const void *)OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_218(v6);
    OUTLINED_FUNCTION_142(v7);
  }
  if ((v1 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_287();
    sub_235F92FC0(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_103();
    sub_235F7EB40(v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_24();
}

uint64_t sub_235F7E59C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256399490) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_235F9B678();
  __break(1u);
  return result;
}

uint64_t sub_235F7E6C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_235F9B678();
  __break(1u);
  return result;
}

uint64_t sub_235F7E7B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_235F9B678();
  __break(1u);
  return result;
}

char *sub_235F7E8AC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      OUTLINED_FUNCTION_27_1();
      return v6;
    }
  }
  OUTLINED_FUNCTION_9_2();
  result = (char *)OUTLINED_FUNCTION_285();
  __break(1u);
  return result;
}

char *sub_235F7E978(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = &__dst[4 * v4];
    if (v5 >= v6 || &v5[4 * v4] <= __dst)
    {
      memcpy(__dst, v5, 4 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = (char *)sub_235F9B678();
  __break(1u);
  return result;
}

void sub_235F7EA68(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 16 * a1 + 32;
    if (v6 >= a3 + 16 * v5 || v6 + 16 * v5 <= a3)
    {
      OUTLINED_FUNCTION_283(a1, a2, a3, a4, a5);
      swift_arrayInitWithCopy();
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_159();
      return;
    }
  }
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_285();
  __break(1u);
}

char *sub_235F7EB40(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = (char *)sub_235F9B678();
  __break(1u);
  return result;
}

void sub_235F7EC30(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t ObjectType;

  v6 = sub_235F7ECEC(v10, 0, 0, 1, a1, a2);
  if (v6)
  {
    v7 = v6;
    ObjectType = swift_getObjectType();
    v10[0] = v7;
    v8 = *a3;
    if (*a3)
    {
      sub_235F6B0A8((uint64_t)v10, *a3);
      *a3 = v8 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v10[0] = a1;
    v10[1] = a2;
    v9 = *a3;
    if (*a3)
    {
      sub_235F6B0A8((uint64_t)v10, *a3);
      *a3 = v9 + 32;
    }
    OUTLINED_FUNCTION_34_2();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  OUTLINED_FUNCTION_159();
}

uint64_t sub_235F7ECEC(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_235F7EE40((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_235F9B5B8();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_235F7EF04(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_235F9B618();
    if (!v8)
    {
      result = sub_235F9B648();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_235F7EE40(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_235F9B678();
  __break(1u);
  return result;
}

uint64_t sub_235F7EF04(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235F7EF98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_235F7F16C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_235F7F16C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235F7EF98(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_235F9B42C();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_235F7F108(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_235F9B600();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_235F9B678();
  __break(1u);
LABEL_14:
  result = sub_235F9B648();
  __break(1u);
  return result;
}

_QWORD *sub_235F7F108(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399BD8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_235F7F16C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BD8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_235F7F304(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_235F7F240(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_235F7F240(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_235F9B678();
  __break(1u);
  return result;
}

char *sub_235F7F304(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_235F9B678();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_235F7F384()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_235F9B738();
  sub_235F9B414();
  sub_235F9B750();
  v0 = OUTLINED_FUNCTION_49();
  return sub_235F7F414(v0, v1, v2);
}

unint64_t sub_235F7F3E4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235F9B72C();
  return sub_235F7F4F4(a1, v2);
}

unint64_t sub_235F7F414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_235F9B6C0() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_235F9B6C0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_235F7F4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

_OWORD *sub_235F7F590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  char v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  _OWORD *v10;
  _OWORD *v11;
  _OWORD *result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_92();
  if (v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = v3;
  v7 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
  if ((OUTLINED_FUNCTION_164() & 1) == 0)
    goto LABEL_5;
  v8 = OUTLINED_FUNCTION_195();
  if ((v7 & 1) != (v9 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_235F9B6D8();
    __break(1u);
    return result;
  }
  v6 = v8;
LABEL_5:
  if ((v7 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0(*(_QWORD *)(*(_QWORD *)v2 + 56) + 32 * v6);
    v10 = (_OWORD *)OUTLINED_FUNCTION_60();
    return sub_235F6E7A4(v10, v11);
  }
  else
  {
    v13 = OUTLINED_FUNCTION_262();
    sub_235F7F968(v13, v14, v1, v0, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

void sub_235F7F65C()
{
  _QWORD **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  uint64_t *v17;

  OUTLINED_FUNCTION_57_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  sub_235F7F384();
  OUTLINED_FUNCTION_92();
  if (v11)
  {
    __break(1u);
    goto LABEL_9;
  }
  v12 = v9;
  v13 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399A00);
  if ((sub_235F9B630() & 1) == 0)
    goto LABEL_5;
  OUTLINED_FUNCTION_206();
  v14 = sub_235F7F384();
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_9:
    sub_235F9B6D8();
    __break(1u);
    return;
  }
  v12 = v14;
LABEL_5:
  v16 = *v0;
  if ((v13 & 1) != 0)
  {
    v17 = (uint64_t *)(v16[7] + 16 * v12);
    swift_bridgeObjectRelease();
    *v17 = v8;
    v17[1] = v6;
    OUTLINED_FUNCTION_11_0();
  }
  else
  {
    sub_235F7F9A4(v12, v4, v2, v8, v6, v16);
    OUTLINED_FUNCTION_79_0();
  }
}

unint64_t sub_235F7F748()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563999F8;
  if (!qword_2563999F8)
  {
    v1 = sub_235F9B264();
    result = MEMORY[0x23B7E7E48](MEMORY[0x24BDF5D20], v1);
    atomic_store(result, (unint64_t *)&qword_2563999F8);
  }
  return result;
}

uint64_t sub_235F7F788(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563999F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_235F7F7D0()
{
  sub_235F7F7DC();
}

void sub_235F7F7DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v6;
  char v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_57_0();
  v5 = v4;
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_92();
  if (v8)
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v6;
  v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(v5);
  if ((OUTLINED_FUNCTION_164() & 1) == 0)
    goto LABEL_5;
  v11 = OUTLINED_FUNCTION_195();
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    sub_235F9B6D8();
    __break(1u);
    return;
  }
  v9 = v11;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) != 0)
  {
    v14 = *(_QWORD *)(v13 + 56);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v14 + 8 * v9) = v0;
    OUTLINED_FUNCTION_11_0();
  }
  else
  {
    sub_235F7FC34(v9, v2, v1, v0, v13);
    OUTLINED_FUNCTION_79_0();
  }
}

void sub_235F7F884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  char v6;
  char v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_235F7F3E4(a2);
  OUTLINED_FUNCTION_92();
  if (v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = v5;
  v9 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B58);
  if ((sub_235F9B630() & 1) == 0)
    goto LABEL_5;
  v10 = sub_235F7F3E4(a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_9:
    sub_235F9B6D8();
    __break(1u);
    return;
  }
  v8 = v10;
LABEL_5:
  if ((v9 & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 56) + 8 * v8) = a1;
  }
  else
  {
    OUTLINED_FUNCTION_300();
    sub_235F7FC5C(v12, v13, v14, v15);
  }
}

void sub_235F7F968(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v6 = OUTLINED_FUNCTION_102(a1, a2, a3, a4, a5);
  sub_235F6E7A4(v8, (_OWORD *)(v7 + 32 * v6));
  v9 = *(_QWORD *)(a5 + 16);
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a5 + 16) = v11;
    OUTLINED_FUNCTION_34();
  }
}

unint64_t sub_235F7F9A4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

uint64_t sub_235F7F9F0()
{
  OUTLINED_FUNCTION_101();
  return sub_235F78164();
}

void sub_235F7FA08()
{
  OUTLINED_FUNCTION_101();
  sub_235F78238();
}

void sub_235F7FA3C()
{
  OUTLINED_FUNCTION_101();
  sub_235F78238();
}

void sub_235F7FA70()
{
  OUTLINED_FUNCTION_101();
  sub_235F782B4();
}

void sub_235F7FAA0()
{
  OUTLINED_FUNCTION_101();
  sub_235F78358();
}

void sub_235F7FAD4()
{
  OUTLINED_FUNCTION_101();
  sub_235F78358();
}

void sub_235F7FB08()
{
  OUTLINED_FUNCTION_101();
  sub_235F783D4();
}

void sub_235F7FB3C()
{
  OUTLINED_FUNCTION_101();
  sub_235F783D4();
}

void sub_235F7FB70()
{
  OUTLINED_FUNCTION_101();
  sub_235F782B4();
}

void sub_235F7FBA0(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x23B7E7E48](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F7FBDC()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235F7FC10(uint64_t a1)
{
  uint64_t v1;

  return sub_235F78A78(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24)) & 1;
}

unint64_t sub_235F7FC34(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  result = OUTLINED_FUNCTION_102(a1, a2, a3, a4, a5);
  *(_QWORD *)(v8 + 8 * result) = v7;
  v9 = *(_QWORD *)(v6 + 16);
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    *(_QWORD *)(v6 + 16) = v11;
  return result;
}

void sub_235F7FC5C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  OUTLINED_FUNCTION_100(a4 + 8 * (a1 >> 6));
  *(_QWORD *)(v4[6] + 8 * v5) = v6;
  *(_QWORD *)(v4[7] + 8 * v5) = v7;
  v8 = v4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    v4[2] = v10;
}

void sub_235F7FCA0(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_235F93314(a1, a2, a3, *v3);
  *v3 = v4;
}

void sub_235F7FCBC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_235F93330();
  *v0 = v1;
}

void sub_235F7FCD8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_235F933CC();
  *v0 = v1;
}

void sub_235F7FCF4()
{
  _QWORD *v0;
  uint64_t v1;

  sub_235F93468();
  *v0 = v1;
}

void sub_235F7FD10(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_235F93F9C();
    v2 = v4;
  }
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  sub_235F7FD7C(v5);
  *a1 = v2;
}

void sub_235F7FD7C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int *v19;
  int v20;
  uint64_t v21;
  int *v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  unint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  char v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  unint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  unint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;

  v3 = a1[1];
  v4 = sub_235F9B69C();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_235F80354(0, v3, 1, a1);
      return;
    }
    goto LABEL_124;
  }
  v5 = v4;
  v85 = a1;
  v86 = sub_235F7DF18(v3 / 2);
  v90 = v6;
  v88 = v3;
  if (v3 <= 0)
  {
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v25 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_90:
    if (v25 < 2)
    {
LABEL_101:
      swift_bridgeObjectRelease();
      if (v88 >= -1)
      {
        *(_QWORD *)(v86 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_129;
    }
    v77 = *v85;
    while (1)
    {
      v78 = v25 - 2;
      if (v25 < 2)
        break;
      if (!v77)
        goto LABEL_133;
      v79 = v9[2 * v78 + 4];
      v80 = v9[2 * v25 + 3];
      sub_235F803AC((char *)(v77 + 4 * v79), (char *)(v77 + 4 * v9[2 * v25 + 2]), v77 + 4 * v80, v90);
      if (v1)
        goto LABEL_86;
      if (v80 < v79)
        goto LABEL_119;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F93EB0();
        v9 = v83;
      }
      if (v78 >= v9[2])
        goto LABEL_120;
      v81 = &v9[2 * v78 + 4];
      *v81 = v79;
      v81[1] = v80;
      v82 = v9[2];
      if (v25 > v82)
        goto LABEL_121;
      memmove(&v9[2 * v25 + 2], &v9[2 * v25 + 4], 16 * (v82 - v25));
      v9[2] = v82 - 1;
      v25 = v82 - 1;
      if (v82 <= 2)
        goto LABEL_101;
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
    return;
  }
  v7 = 0;
  v8 = *a1;
  v84 = *a1 - 4;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v87 = v5;
  v89 = *a1;
  while (1)
  {
    v10 = v7++;
    if (v7 < v3)
    {
      v11 = *(_DWORD *)(v8 + 4 * v7);
      v12 = *(_DWORD *)(v8 + 4 * v10);
      v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        v13 = v11;
        while (1)
        {
          v14 = *(_DWORD *)(v8 + 4 * v7);
          if (v11 < v12 == v14 >= v13)
            break;
          ++v7;
          v13 = v14;
          if (v7 >= v3)
          {
            v7 = v3;
            break;
          }
        }
      }
      if (v11 < v12)
      {
        if (v7 < v10)
          goto LABEL_126;
        if (v10 < v7)
        {
          v15 = v7 - 1;
          v16 = v10;
          do
          {
            if (v16 != v15)
            {
              if (!v8)
                goto LABEL_132;
              v17 = *(_DWORD *)(v8 + 4 * v16);
              *(_DWORD *)(v8 + 4 * v16) = *(_DWORD *)(v8 + 4 * v15);
              *(_DWORD *)(v8 + 4 * v15) = v17;
            }
            v56 = ++v16 < v15--;
          }
          while (v56);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10))
        goto LABEL_123;
      if (v7 - v10 < v5)
      {
        v18 = v10 + v5;
        if (__OFADD__(v10, v5))
          goto LABEL_127;
        if (v18 >= v3)
          v18 = v3;
        if (v18 < v10)
          goto LABEL_128;
        if (v7 != v18)
        {
          v19 = (int *)(v84 + 4 * v7);
          do
          {
            v20 = *(_DWORD *)(v8 + 4 * v7);
            v21 = v10;
            v22 = v19;
            do
            {
              v23 = *v22;
              if (v20 >= *v22)
                break;
              if (!v8)
                goto LABEL_130;
              *v22 = v20;
              v22[1] = v23;
              --v22;
              ++v21;
            }
            while (v7 != v21);
            ++v7;
            ++v19;
          }
          while (v7 != v18);
          v7 = v18;
        }
      }
    }
    if (v7 < v10)
      goto LABEL_122;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_235F93DE8();
      v9 = v75;
    }
    v24 = v9[2];
    v25 = v24 + 1;
    v8 = v89;
    if (v24 >= v9[3] >> 1)
    {
      sub_235F93DE8();
      v8 = v89;
      v9 = v76;
    }
    v9[2] = v25;
    v26 = v9 + 4;
    v27 = &v9[2 * v24 + 4];
    *v27 = v10;
    v27[1] = v7;
    if (v24)
      break;
    v25 = 1;
LABEL_81:
    v5 = v87;
    v3 = v88;
    if (v7 >= v88)
      goto LABEL_90;
  }
  while (1)
  {
    v28 = v25 - 1;
    if (v25 >= 4)
    {
      v33 = &v26[2 * v25];
      v34 = *(v33 - 8);
      v35 = *(v33 - 7);
      v39 = __OFSUB__(v35, v34);
      v36 = v35 - v34;
      if (v39)
        goto LABEL_107;
      v38 = *(v33 - 6);
      v37 = *(v33 - 5);
      v39 = __OFSUB__(v37, v38);
      v31 = v37 - v38;
      v32 = v39;
      if (v39)
        goto LABEL_108;
      v40 = v25 - 2;
      v41 = &v26[2 * v25 - 4];
      v43 = *v41;
      v42 = v41[1];
      v39 = __OFSUB__(v42, v43);
      v44 = v42 - v43;
      if (v39)
        goto LABEL_109;
      v39 = __OFADD__(v31, v44);
      v45 = v31 + v44;
      if (v39)
        goto LABEL_111;
      if (v45 >= v36)
      {
        v63 = &v26[2 * v28];
        v65 = *v63;
        v64 = v63[1];
        v39 = __OFSUB__(v64, v65);
        v66 = v64 - v65;
        if (v39)
          goto LABEL_117;
        v56 = v31 < v66;
        goto LABEL_70;
      }
    }
    else
    {
      if (v25 != 3)
      {
        v57 = v9[4];
        v58 = v9[5];
        v39 = __OFSUB__(v58, v57);
        v50 = v58 - v57;
        v51 = v39;
        goto LABEL_64;
      }
      v30 = v9[4];
      v29 = v9[5];
      v39 = __OFSUB__(v29, v30);
      v31 = v29 - v30;
      v32 = v39;
    }
    if ((v32 & 1) != 0)
      goto LABEL_110;
    v40 = v25 - 2;
    v46 = &v26[2 * v25 - 4];
    v48 = *v46;
    v47 = v46[1];
    v49 = __OFSUB__(v47, v48);
    v50 = v47 - v48;
    v51 = v49;
    if (v49)
      goto LABEL_112;
    v52 = &v26[2 * v28];
    v54 = *v52;
    v53 = v52[1];
    v39 = __OFSUB__(v53, v54);
    v55 = v53 - v54;
    if (v39)
      goto LABEL_114;
    if (__OFADD__(v50, v55))
      goto LABEL_116;
    if (v50 + v55 >= v31)
    {
      v56 = v31 < v55;
LABEL_70:
      if (v56)
        v28 = v40;
      goto LABEL_72;
    }
LABEL_64:
    if ((v51 & 1) != 0)
      goto LABEL_113;
    v59 = &v26[2 * v28];
    v61 = *v59;
    v60 = v59[1];
    v39 = __OFSUB__(v60, v61);
    v62 = v60 - v61;
    if (v39)
      goto LABEL_115;
    if (v62 < v50)
      goto LABEL_81;
LABEL_72:
    v67 = v9;
    v68 = v28 - 1;
    if (v28 - 1 >= v25)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    if (!v8)
      goto LABEL_131;
    v69 = &v26[2 * v68];
    v70 = *v69;
    v71 = v26;
    v72 = &v26[2 * v28];
    v73 = v72[1];
    sub_235F803AC((char *)(v8 + 4 * *v69), (char *)(v8 + 4 * *v72), v8 + 4 * v73, v90);
    if (v1)
      break;
    if (v73 < v70)
      goto LABEL_104;
    if (v28 > v67[2])
      goto LABEL_105;
    *v69 = v70;
    v71[2 * v68 + 1] = v73;
    v74 = v67[2];
    if (v28 >= v74)
      goto LABEL_106;
    v9 = v67;
    v25 = v74 - 1;
    memmove(v72, v72 + 2, 16 * (v74 - 1 - v28));
    v26 = v71;
    v67[2] = v74 - 1;
    v8 = v89;
    if (v74 <= 2)
      goto LABEL_81;
  }
LABEL_86:
  swift_bridgeObjectRelease();
  if (v88 < -1)
    goto LABEL_125;
  *(_QWORD *)(v86 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_235F80354(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int *v8;
  int v9;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 4 * a3 - 4;
    while (2)
    {
      v6 = *(_DWORD *)(v4 + 4 * a3);
      v7 = result;
      v8 = (int *)v5;
      do
      {
        v9 = *v8;
        if (v6 >= *v8)
          break;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        *v8 = v6;
        v8[1] = v9;
        --v8;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 4;
      if (a3 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_235F803AC(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v14;
  BOOL v15;
  char *v18;
  char *v19;
  int v20;
  BOOL v21;
  BOOL v22;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 4;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 4;
  if (v9 >= v11)
  {
    sub_235F93018(a2, (uint64_t)(a3 - (_QWORD)a2) / 4, a4);
    v12 = &v4[4 * v11];
    if (v7 >= v6 || v10 < 4)
      goto LABEL_39;
    v18 = (char *)(a3 - 4);
    while (1)
    {
      v19 = v18 + 4;
      v20 = *((_DWORD *)v6 - 1);
      if (*((_DWORD *)v12 - 1) >= v20)
      {
        v22 = v19 != v12 || v18 >= v12;
        v20 = *((_DWORD *)v12 - 1);
        v12 -= 4;
        if (!v22)
          goto LABEL_35;
      }
      else
      {
        v21 = v19 != v6 || v18 >= v6;
        v6 -= 4;
        if (!v21)
          goto LABEL_35;
      }
      *(_DWORD *)v18 = v20;
LABEL_35:
      v18 -= 4;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_39;
    }
  }
  sub_235F93018(a1, (a2 - a1) / 4, a4);
  v12 = &v4[4 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 4)
  {
    while (1)
    {
      v14 = *(_DWORD *)v6;
      if (*(_DWORD *)v6 < *(_DWORD *)v4)
        break;
      v14 = *(_DWORD *)v4;
      v15 = v7 == v4;
      v4 += 4;
      if (!v15)
        goto LABEL_11;
LABEL_12:
      v7 += 4;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_17;
    }
    v15 = v7 == v6;
    v6 += 4;
    if (v15)
      goto LABEL_12;
LABEL_11:
    *(_DWORD *)v7 = v14;
    goto LABEL_12;
  }
LABEL_17:
  v6 = v7;
LABEL_39:
  sub_235F93018(v4, (v12 - v4) / 4, v6);
  return 1;
}

void sub_235F80524(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setSearchSessionUUID_, v4);

}

uint64_t type metadata accessor for AMLPhotosSearchPoirotMetrics()
{
  return objc_opt_self();
}

uint64_t method lookup function for AMLSODAConfig()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMLSODAConfig.__allocating_init(loggingPath:taskId:taskName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AMLSODAConfig.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AMLSODAConfig.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AMLSODAConfig.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t method lookup function for AMLPhotosSearchPoirotMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.metricsPayloads(_:_:_:doUpload:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.filteredRawSearchData(_:_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.feedbackDataFromSearchData(_:_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.retrieveSpotlightDataFrame(_:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.metricsPayloads(_:_:bundleId:_:interactionStorePath:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.shareCountGivenDayCategory(_:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.shareCountGivenFaceCountCategory(_:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.shareCountGivenLocation(_:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.shareCountGivenSceneCategory(_:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.shareCountGivenTimeOfDay(_:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.clickCountGivenDayCategory(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.clickCountGivenLocation(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.clickCountGivenTimeOfDay(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.clickCountRecencyCategory(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.itemPositionForPhotosId(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.sharedInLastWeek(_:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.sharedInLastMonth(_:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.sharedPhoto(_:startTime:endTime:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AMLPhotosSearchPoirotMetrics.clickOrderForPhotosId(_:rawSearchData:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AMLSODAConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 2) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AMLSODAConfig.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_235F808EC + 4 * byte_235F9D7B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_235F80920 + 4 * byte_235F9D7B0[v4]))();
}

uint64_t sub_235F80920(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F80928(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235F80930);
  return result;
}

uint64_t sub_235F8093C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235F80944);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_235F80948(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F80950(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F8095C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235F80968(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AMLSODAConfig.CodingKeys()
{
  return &type metadata for AMLSODAConfig.CodingKeys;
}

unint64_t sub_235F80984()
{
  unint64_t result;

  result = qword_256399B28;
  if (!qword_256399B28)
  {
    result = MEMORY[0x23B7E7E48](&unk_235F9D96C, &type metadata for AMLSODAConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256399B28);
  }
  return result;
}

unint64_t sub_235F809C4()
{
  unint64_t result;

  result = qword_256399B30;
  if (!qword_256399B30)
  {
    result = MEMORY[0x23B7E7E48](&unk_235F9D8DC, &type metadata for AMLSODAConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256399B30);
  }
  return result;
}

unint64_t sub_235F80A04()
{
  unint64_t result;

  result = qword_256399B38;
  if (!qword_256399B38)
  {
    result = MEMORY[0x23B7E7E48](&unk_235F9D904, &type metadata for AMLSODAConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256399B38);
  }
  return result;
}

unint64_t sub_235F80A44()
{
  unint64_t result;

  result = qword_256399FD0;
  if (!qword_256399FD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256399FD0);
  }
  return result;
}

uint64_t sub_235F80A80()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_99();
  return sub_235F76340(v0, v1, v2);
}

void sub_235F80A98()
{
  OUTLINED_FUNCTION_99();
  sub_235F76EA4();
}

uint64_t sub_235F80ACC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_99();
  return sub_235F76980(v0, v1, v2);
}

void sub_235F80AE4()
{
  OUTLINED_FUNCTION_99();
  sub_235F76D14();
}

void sub_235F80B14()
{
  OUTLINED_FUNCTION_99();
  sub_235F76BA4();
}

void sub_235F80B48()
{
  OUTLINED_FUNCTION_99();
  sub_235F76BA4();
}

void sub_235F80B7C()
{
  OUTLINED_FUNCTION_99();
  sub_235F76D14();
}

void sub_235F80BAC()
{
  OUTLINED_FUNCTION_99();
  sub_235F76EA4();
}

uint64_t sub_235F80BE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_99();
  return sub_235F77014(v0, v1, v2, v3);
}

unint64_t sub_235F80BF8()
{
  unint64_t result;

  result = qword_256399BE0;
  if (!qword_256399BE0)
  {
    result = MEMORY[0x23B7E7E48](&unk_235F9DA3C, &type metadata for AMLPhotosSearchPoirotMetricsError);
    atomic_store(result, (unint64_t *)&qword_256399BE0);
  }
  return result;
}

uint64_t sub_235F80C38()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for AMLPhotosSearchPoirotMetricsError()
{
  return sub_235F80C50();
}

uint64_t sub_235F80C50()
{
  return swift_bridgeObjectRelease();
}

void _s6AeroML33AMLPhotosSearchPoirotMetricsErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_235F80C38();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  OUTLINED_FUNCTION_24();
}

uint64_t assignWithCopy for AMLPhotosSearchPoirotMetricsError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_235F80C38();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_235F80C50();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AMLPhotosSearchPoirotMetricsError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_235F80C50();
  return a1;
}

uint64_t getEnumTagSinglePayload for AMLPhotosSearchPoirotMetricsError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AMLPhotosSearchPoirotMetricsError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_235F80DC8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_235F80DD0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AMLPhotosSearchPoirotMetricsError()
{
  return &type metadata for AMLPhotosSearchPoirotMetricsError;
}

void sub_235F80DEC()
{
  sub_235F7FB3C();
}

void sub_235F80E00()
{
  sub_235F7FAD4();
}

uint64_t sub_235F80E14()
{
  return sub_235F7F9F0();
}

void sub_235F80E28()
{
  sub_235F7FB70();
}

void sub_235F80E3C()
{
  sub_235F7FA08();
}

void sub_235F80E50()
{
  sub_235F7FA3C();
}

void sub_235F80E64()
{
  sub_235F7FA70();
}

void sub_235F80E78()
{
  sub_235F7FAA0();
}

void sub_235F80E8C()
{
  sub_235F7FB08();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_5_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return sub_235F9B720();
}

void OUTLINED_FUNCTION_14_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

unint64_t OUTLINED_FUNCTION_17_2()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_24_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 - 152) = a7;
  *(_QWORD *)(v8 - 72) = v7;
  return sub_235F9B240();
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return sub_235F9B264();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_235F9B2C4();
}

_OWORD *OUTLINED_FUNCTION_28_2()
{
  uint64_t v0;

  return sub_235F6E7A4((_OWORD *)(v0 - 144), (_OWORD *)(v0 - 112));
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return sub_235F9B6C0();
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return sub_235F9B288();
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return sub_235F9B2C4();
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_235F9B270();
}

void OUTLINED_FUNCTION_41_0()
{
  uint64_t *v0;
  uint64_t v1;

  sub_235F729B0(v1 - 192, v0);
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_235F9B4E0();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_235F9B630();
}

void OUTLINED_FUNCTION_48_0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v0 + 8 * (v2 >> 6) + 64) |= 1 << v2;
  v4 = (_QWORD *)(*(_QWORD *)(v0 + 48) + 16 * v2);
  *v4 = v3;
  v4[1] = v1;
  *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v2) = 1;
}

void OUTLINED_FUNCTION_49_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v0 + 8 * (v3 >> 6) + 64) |= 1 << v3;
  v5 = (_QWORD *)(*(_QWORD *)(v0 + 48) + 16 * v3);
  *v5 = v4;
  v5[1] = v2;
  *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v3) = v1;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return sub_235F9B2AC();
}

uint64_t OUTLINED_FUNCTION_52_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

_OWORD *OUTLINED_FUNCTION_53_0()
{
  uint64_t v0;

  return sub_235F6E7A4((_OWORD *)(v0 - 152), (_OWORD *)(v0 - 120));
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_63_0(uint64_t a1@<X8>)
{

}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 136) + 8))(v0, *(_QWORD *)(v1 - 128));
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return sub_235F9B240();
}

uint64_t OUTLINED_FUNCTION_77_0@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 200) = a4;
  *(_QWORD *)(v6 - 192) = a1;
  *(_QWORD *)(v6 - 184) = a2;
  *(_QWORD *)(v6 - 176) = a3;
  *(_QWORD *)(v6 - 72) = v5;
  *(_QWORD *)(v6 - 168) = a5;
  return sub_235F9B240();
}

void OUTLINED_FUNCTION_78_0(_OWORD *a1@<X8>)
{
  uint64_t v1;

  sub_235F73174(v1, a1);
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return sub_235F9B24C();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return sub_235F9B240();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return sub_235F9B24C();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_86()
{
  return sub_235F9B288();
}

unint64_t OUTLINED_FUNCTION_87()
{
  return sub_235F7F384();
}

void OUTLINED_FUNCTION_89(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_90(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_93()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = v0;
  sub_235F7F7DC();
}

uint64_t OUTLINED_FUNCTION_97()
{
  return sub_235F9B270();
}

uint64_t OUTLINED_FUNCTION_98()
{
  return 0;
}

void OUTLINED_FUNCTION_100(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

unint64_t OUTLINED_FUNCTION_102(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  *(_QWORD *)(a5 + 8 * (result >> 6) + 64) |= 1 << result;
  v5 = (_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  return result;
}

uint64_t OUTLINED_FUNCTION_103()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_104@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_105()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 120, 0);
}

uint64_t OUTLINED_FUNCTION_106()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 152) + 8))(v0, *(_QWORD *)(v1 - 144));
}

uint64_t OUTLINED_FUNCTION_107@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

BOOL OUTLINED_FUNCTION_108(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_109()
{
  return sub_235F9B4E0();
}

uint64_t OUTLINED_FUNCTION_110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_111()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_112@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_235F9B18C();
}

_OWORD *OUTLINED_FUNCTION_113()
{
  uint64_t v0;

  return sub_235F6E7A4((_OWORD *)(v0 - 184), (_OWORD *)(v0 - 152));
}

void OUTLINED_FUNCTION_114()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  sub_235F7EC30(v0, v1, (uint64_t *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_115()
{
  return sub_235F9B2C4();
}

uint64_t OUTLINED_FUNCTION_119()
{
  return sub_235F9B270();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return sub_235F9B690();
}

uint64_t OUTLINED_FUNCTION_122(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  return sub_235F9B5AC();
}

BOOL OUTLINED_FUNCTION_123(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_124(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_126()
{
  return sub_235F9B2C4();
}

uint64_t OUTLINED_FUNCTION_127(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_128(void (*a1)(_QWORD *__return_ptr, uint64_t *))
{
  uint64_t v1;
  uint64_t v2;

  return sub_235F758A8(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_235F9B24C();
}

uint64_t OUTLINED_FUNCTION_130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_132()
{
  return sub_235F9B2C4();
}

void OUTLINED_FUNCTION_135(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 480) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_138@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

void OUTLINED_FUNCTION_139(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_140()
{
  uint64_t v0;

  return v0 - 168;
}

uint64_t OUTLINED_FUNCTION_141()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_142(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_143(__n128 *a1, __n128 a2)
{
  uint64_t v2;

  a1[1] = a2;
  *(_QWORD *)(v2 - 120) = 0;
  *(_QWORD *)(v2 - 112) = 0xE000000000000000;
  return sub_235F9B5F4();
}

uint64_t OUTLINED_FUNCTION_149(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_150()
{
  return sub_235F9B504();
}

uint64_t OUTLINED_FUNCTION_151()
{
  return sub_235F9B24C();
}

uint64_t OUTLINED_FUNCTION_152()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 368) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_153()
{
  return sub_235F9B2A0();
}

void OUTLINED_FUNCTION_154(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_156()
{
  uint64_t v0;

  sub_235F6E7A4((_OWORD *)(v0 - 152), (_OWORD *)(v0 - 120));
  return v0 - 168;
}

_OWORD *OUTLINED_FUNCTION_157()
{
  uint64_t v0;

  return sub_235F6E7A4((_OWORD *)(v0 - 224), (_OWORD *)(v0 - 192));
}

uint64_t OUTLINED_FUNCTION_158()
{
  return sub_235F9B5AC();
}

uint64_t OUTLINED_FUNCTION_160()
{
  return sub_235F9B27C();
}

uint64_t OUTLINED_FUNCTION_161(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return sub_235F83FBC(a1, v4, v2, v3, v1);
}

uint64_t OUTLINED_FUNCTION_162()
{
  return sub_235F9B2C4();
}

uint64_t OUTLINED_FUNCTION_164()
{
  return sub_235F9B630();
}

uint64_t OUTLINED_FUNCTION_165()
{
  return swift_once();
}

uint64_t OUTLINED_FUNCTION_166()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_169()
{
  return sub_235F9B180();
}

uint64_t OUTLINED_FUNCTION_170@<X0>(uint64_t (*a1)(void)@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return a1();
}

uint64_t OUTLINED_FUNCTION_171()
{
  return sub_235F9B3E4();
}

uint64_t OUTLINED_FUNCTION_172()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_173()
{
  return sub_235F9B4E0();
}

uint64_t OUTLINED_FUNCTION_174()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_175()
{
  return sub_235F9B6C0();
}

void OUTLINED_FUNCTION_176(unint64_t *a1)
{
  uint64_t *v1;

  sub_235F7FBA0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_177(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_235F9B36C();
}

uint64_t OUTLINED_FUNCTION_179()
{
  return sub_235F9B180();
}

uint64_t OUTLINED_FUNCTION_180()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_182()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_183()
{
  return sub_235F9B504();
}

_OWORD *OUTLINED_FUNCTION_186()
{
  uint64_t v0;

  return sub_235F6E7A4((_OWORD *)(v0 - 160), (_OWORD *)(v0 - 128));
}

uint64_t OUTLINED_FUNCTION_187()
{
  return sub_235F9B120();
}

uint64_t OUTLINED_FUNCTION_188()
{
  return type metadata accessor for AMLPhotosSearchMetricsUtility();
}

uint64_t OUTLINED_FUNCTION_189(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void OUTLINED_FUNCTION_190(unint64_t *a1)
{
  uint64_t *v1;

  sub_235F7FBA0(a1, v1);
}

unint64_t OUTLINED_FUNCTION_191()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_192(void (*a1)(_QWORD *__return_ptr, uint64_t *))
{
  uint64_t v1;
  uint64_t v2;

  return sub_235F758A8(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_193(void (*a1)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v1;
  uint64_t v2;

  return sub_235F757A0(a1, v1, v2);
}

void OUTLINED_FUNCTION_194(unint64_t *a1)
{
  uint64_t *v1;

  sub_235F7FBA0(a1, v1);
}

unint64_t OUTLINED_FUNCTION_195()
{
  return sub_235F7F384();
}

unint64_t OUTLINED_FUNCTION_197()
{
  return 0xD000000000000010;
}

uint64_t OUTLINED_FUNCTION_199()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_201()
{
  return sub_235F9B4E0();
}

uint64_t OUTLINED_FUNCTION_202(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_203()
{
  return sub_235F9B180();
}

uint64_t OUTLINED_FUNCTION_204()
{
  return sub_235F9B684();
}

unint64_t OUTLINED_FUNCTION_205()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_206()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_207()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_209@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_210()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 248) + 8))(v0, *(_QWORD *)(v1 - 240));
}

uint64_t OUTLINED_FUNCTION_212()
{
  return sub_235F9B24C();
}

__n128 OUTLINED_FUNCTION_214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__n128 a23)
{
  uint64_t v23;
  uint64_t v24;
  __n128 *v25;
  __n128 result;

  v25 = (__n128 *)(*(_QWORD *)(v24 + 56) + (v23 << 6));
  result = a23;
  *v25 = a23;
  v25[1] = a23;
  v25[2] = a23;
  v25[3] = a23;
  return result;
}

__n128 OUTLINED_FUNCTION_215(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)(v1 - 400);
  a1[1] = result;
  return result;
}

void OUTLINED_FUNCTION_217(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_235F729B0(v2, a2);
}

size_t OUTLINED_FUNCTION_218(const void *a1)
{
  return _swift_stdlib_malloc_size(a1);
}

uint64_t OUTLINED_FUNCTION_219()
{
  uint64_t v0;

  return v0 - 208;
}

uint64_t OUTLINED_FUNCTION_220()
{
  return sub_235F9B150();
}

void OUTLINED_FUNCTION_221()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  sub_235F7EC30(v0, v1, (uint64_t *)(v2 - 152));
}

void OUTLINED_FUNCTION_227(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 112) = (v1 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_228()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_229()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_230()
{
  return sub_235F9B24C();
}

uint64_t OUTLINED_FUNCTION_231()
{
  return sub_235F9B150();
}

uint64_t OUTLINED_FUNCTION_232(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t OUTLINED_FUNCTION_234()
{
  return sub_235F9B3D8();
}

void OUTLINED_FUNCTION_236(unint64_t *a1)
{
  uint64_t *v1;

  sub_235F7FBA0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_237()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_239(uint64_t a1)
{
  uint64_t v1;

  return sub_235F84444(a1, v1);
}

uint64_t OUTLINED_FUNCTION_241()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_242()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_243()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  sub_235F7EC30(v0, v1, (uint64_t *)(v2 - 104));
}

void OUTLINED_FUNCTION_244()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_235F7EC30(v1, v0, (uint64_t *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_245(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

BOOL OUTLINED_FUNCTION_246(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_247(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(a1, 0);
}

uint64_t OUTLINED_FUNCTION_248()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_253()
{
  return sub_235F9B24C();
}

uint64_t OUTLINED_FUNCTION_254()
{
  return sub_235F9B24C();
}

uint64_t OUTLINED_FUNCTION_256()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 272);
}

uint64_t OUTLINED_FUNCTION_257()
{
  return sub_235F9B4F8();
}

uint64_t OUTLINED_FUNCTION_258()
{
  return sub_235F9B4EC();
}

uint64_t OUTLINED_FUNCTION_260()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_262()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_263()
{
  return sub_235F9B4D4();
}

id OUTLINED_FUNCTION_264(uint64_t a1, const char *a2)
{
  void *v2;
  double v3;

  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_265(uint64_t a1, const char *a2)
{
  void *v2;
  double v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_266()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_267(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_268()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_269()
{
  return sub_235F9B270();
}

uint64_t OUTLINED_FUNCTION_270()
{
  return sub_235F9B4D4();
}

uint64_t OUTLINED_FUNCTION_271()
{
  return sub_235F9B4E0();
}

uint64_t OUTLINED_FUNCTION_272()
{
  return sub_235F9B72C();
}

uint64_t OUTLINED_FUNCTION_273()
{
  return sub_235F9B3E4();
}

uint64_t OUTLINED_FUNCTION_274()
{
  return sub_235F9B4D4();
}

uint64_t OUTLINED_FUNCTION_278()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_280()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_281()
{
  return sub_235F9B2C4();
}

uint64_t OUTLINED_FUNCTION_283(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return __swift_instantiateConcreteTypeFromMangledName(a5);
}

uint64_t OUTLINED_FUNCTION_284()
{
  return sub_235F9B648();
}

uint64_t OUTLINED_FUNCTION_285()
{
  return sub_235F9B678();
}

uint64_t OUTLINED_FUNCTION_287()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_289()
{
  return sub_235F9B420();
}

__n128 *OUTLINED_FUNCTION_290(__n128 *result, __n128 a2)
{
  uint64_t v2;

  result[1] = a2;
  *(_QWORD *)(v2 - 120) = 0;
  *(_QWORD *)(v2 - 112) = 0xE000000000000000;
  return result;
}

uint64_t OUTLINED_FUNCTION_291()
{
  return sub_235F9B4A4();
}

uint64_t OUTLINED_FUNCTION_292(void (*a1)(_QWORD *__return_ptr, _QWORD), uint64_t a2)
{
  uint64_t v2;

  return sub_235F76814(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_293(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2)
{
  uint64_t v2;

  return sub_235F7657C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_294()
{
  return sub_235F9B3E4();
}

uint64_t OUTLINED_FUNCTION_295()
{
  return sub_235F9B4E0();
}

uint64_t OUTLINED_FUNCTION_297(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  return v1 - 184;
}

BOOL OUTLINED_FUNCTION_298@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

BOOL OUTLINED_FUNCTION_299@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_301()
{
  return 0x6B7361740A2CLL;
}

double OUTLINED_FUNCTION_303()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_304@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_305()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_306(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_235F7EC30(a1, a2, (uint64_t *)(v2 - 200));
}

uint64_t OUTLINED_FUNCTION_307()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_308@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

uint64_t OUTLINED_FUNCTION_309()
{
  return sub_235F9B2B8();
}

uint64_t OUTLINED_FUNCTION_311(void (*a1)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v1;
  uint64_t v2;

  return sub_235F759AC(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_312(void (*a1)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v1;
  uint64_t v2;

  return sub_235F757A0(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_313(void (*a1)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v1;
  uint64_t v2;

  return sub_235F759AC(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_314(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * a1);
}

unint64_t OUTLINED_FUNCTION_315()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_316(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 224) = a1;
  return v1 - 224;
}

uint64_t OUTLINED_FUNCTION_317()
{
  return sub_235F9B24C();
}

uint64_t sub_235F81F84()
{
  return OUTLINED_FUNCTION_14();
}

uint64_t sub_235F81FB0()
{
  return OUTLINED_FUNCTION_14();
}

void sub_235F81FDC()
{
  OUTLINED_FUNCTION_26_2(OBJC_IVAR___AMLClientDonations_arrayProvider);
  OUTLINED_FUNCTION_34();
}

void sub_235F82020()
{
  OUTLINED_FUNCTION_26_2(OBJC_IVAR___AMLClientDonations_featuresConfiguration);
  OUTLINED_FUNCTION_34();
}

void sub_235F82064()
{
  OUTLINED_FUNCTION_26_2(OBJC_IVAR___AMLClientDonations_metadata);
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F820CC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AMLClientDonations_donationTime);
  swift_bridgeObjectRetain();
  return v1;
}

void AMLClientDonations.init(featuresConfiguration:featureProvider:batchProvider:arrayProvider:metadata:donationTime:)()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  SEL v7;

  OUTLINED_FUNCTION_23_2();
  if (v3)
  {
    v4 = (void *)OUTLINED_FUNCTION_22_2();
    OUTLINED_FUNCTION_23();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  OUTLINED_FUNCTION_18_3();
  objc_msgSend(v6, v7);

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_8_3();

  OUTLINED_FUNCTION_16_2();
}

id AMLClientDonations.init(featuresConfiguration:featureProvider:batchProvider:arrayProvider:metadata:donationTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  objc_super v10;

  *(_QWORD *)(v7 + OBJC_IVAR___AMLClientDonations_featuresConfiguration) = a1;
  *(_QWORD *)(v7 + OBJC_IVAR___AMLClientDonations_featureProvider) = a2;
  *(_QWORD *)(v7 + OBJC_IVAR___AMLClientDonations_batchProvider) = a3;
  *(_QWORD *)(v7 + OBJC_IVAR___AMLClientDonations_arrayProvider) = a4;
  *(_QWORD *)(v7 + OBJC_IVAR___AMLClientDonations_metadata) = a5;
  v8 = (_QWORD *)(v7 + OBJC_IVAR___AMLClientDonations_donationTime);
  *v8 = a6;
  v8[1] = a7;
  v10.super_class = (Class)AMLClientDonations;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t AMLClientDonations.copy(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v4 = OUTLINED_FUNCTION_31_1(a1, sel_featuresConfiguration);
  v5 = OUTLINED_FUNCTION_31_1((uint64_t)v4, sel_featureProvider);
  v6 = OUTLINED_FUNCTION_31_1((uint64_t)v5, sel_batchProvider);
  v7 = OUTLINED_FUNCTION_31_1((uint64_t)v6, sel_arrayProvider);
  v8 = OUTLINED_FUNCTION_31_1((uint64_t)v7, sel_metadata);
  sub_235F82ED8(v2);
  v9 = objc_allocWithZone((Class)AMLClientDonations);
  sub_235F82E60();
  v11 = v10;
  result = type metadata accessor for AMLClientDonations(v10);
  a2[3] = result;
  *a2 = v11;
  return result;
}

Swift::Void __swiftcall AMLClientDonations.encode(with:)(NSCoder with)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v3 = OUTLINED_FUNCTION_31_1((uint64_t)with.super.isa, sel_featuresConfiguration);
  v4 = (void *)OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_2_3();

  v6 = OUTLINED_FUNCTION_31_1(v5, sel_featureProvider);
  v7 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_8_3();

  v9 = OUTLINED_FUNCTION_31_1(v8, sel_batchProvider);
  v10 = (void *)OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_8_3();

  v12 = OUTLINED_FUNCTION_31_1(v11, sel_arrayProvider);
  v13 = (void *)OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_3();

  v15 = OUTLINED_FUNCTION_31_1(v14, sel_metadata);
  v16 = (void *)OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_2_3();

  sub_235F82ED8(v1);
  if (v17)
  {
    v18 = sub_235F9B3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = 0;
  }
  v19 = (id)OUTLINED_FUNCTION_7_3();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v18, v19);
  swift_unknownObjectRelease();

}

void __swiftcall AMLClientDonations.init(coder:)(AMLClientDonations_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

  OUTLINED_FUNCTION_34();
}

id AMLClientDonations.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v2;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  id v62;
  uint64_t v63;
  char *v64;
  id v65;
  uint64_t v66;
  id v68;
  objc_super v69;
  id v70;
  uint64_t v71;
  char v72[24];
  uint64_t v73;

  v4 = v1;
  v5 = (void *)OUTLINED_FUNCTION_14_0();
  v6 = objc_msgSend(a1, sel_decodeObjectForKey_, v5);

  if (v6)
  {
    OUTLINED_FUNCTION_24_3();
    v7 = OUTLINED_FUNCTION_8_3();
  }
  else
  {
    v13 = OUTLINED_FUNCTION_11_2();
  }
  OUTLINED_FUNCTION_4_3(v7, v8, v9, v10, v11, v12, v13);
  if (!v73)
  {

    v66 = sub_235F6D3D8((uint64_t)v72);
LABEL_37:
    type metadata accessor for AMLClientDonations(v66);
    swift_deallocPartialClassInstance();
    return 0;
  }
  type metadata accessor for AMLFeaturesConfiguration(0);
  if ((OUTLINED_FUNCTION_0_3() & 1) == 0)
  {

    goto LABEL_37;
  }
  v14 = sub_235F9B3F0();
  v15 = OUTLINED_FUNCTION_1_2(v14);

  if (v15)
  {
    OUTLINED_FUNCTION_24_3();
    v16 = OUTLINED_FUNCTION_8_3();
  }
  else
  {
    v22 = OUTLINED_FUNCTION_11_2();
  }
  OUTLINED_FUNCTION_4_3(v16, v17, v18, v19, v20, v21, v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399870);
  if ((OUTLINED_FUNCTION_0_3() & 1) == 0)
  {

LABEL_36:
    goto LABEL_37;
  }
  v23 = v70;
  v24 = OUTLINED_FUNCTION_3_3();
  v25 = OUTLINED_FUNCTION_1_2(v24);

  if (v25)
  {
    sub_235F9B5C4();
    v26 = OUTLINED_FUNCTION_9_3();
  }
  else
  {
    v32 = OUTLINED_FUNCTION_11_2();
  }
  OUTLINED_FUNCTION_4_3(v26, v27, v28, v29, v30, v31, v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399C90);
  if ((OUTLINED_FUNCTION_0_3() & 1) == 0)
  {

LABEL_35:
    OUTLINED_FUNCTION_8_3();
    goto LABEL_36;
  }
  v33 = v70;
  v34 = OUTLINED_FUNCTION_3_3();
  v35 = OUTLINED_FUNCTION_1_2(v34);
  OUTLINED_FUNCTION_27_2();
  if (v2)
  {
    OUTLINED_FUNCTION_12_3();
    v36 = OUTLINED_FUNCTION_15_2();
  }
  else
  {
    v42 = OUTLINED_FUNCTION_11_2();
  }
  OUTLINED_FUNCTION_4_3(v36, v37, v38, v39, v40, v41, v42);
  sub_235F6B254(0, &qword_256399C98);
  if ((OUTLINED_FUNCTION_0_3() & 1) == 0)
  {

LABEL_34:
    OUTLINED_FUNCTION_9_3();
    goto LABEL_35;
  }
  v43 = OUTLINED_FUNCTION_10_1();
  v44 = OUTLINED_FUNCTION_1_2(v43);
  OUTLINED_FUNCTION_27_2();
  if (v2)
  {
    OUTLINED_FUNCTION_12_3();
    v45 = OUTLINED_FUNCTION_15_2();
  }
  else
  {
    v51 = OUTLINED_FUNCTION_11_2();
  }
  OUTLINED_FUNCTION_4_3(v45, v46, v47, v48, v49, v50, v51);
  type metadata accessor for AMLFeaturesDonationMetadata(0);
  if ((OUTLINED_FUNCTION_0_3() & 1) == 0)
  {

    goto LABEL_34;
  }
  v68 = v70;
  v52 = v70;
  v53 = OUTLINED_FUNCTION_7_3();
  v54 = OUTLINED_FUNCTION_1_2(v53);
  OUTLINED_FUNCTION_27_2();
  if (v2)
  {
    OUTLINED_FUNCTION_12_3();
    v55 = OUTLINED_FUNCTION_15_2();
  }
  else
  {
    v61 = OUTLINED_FUNCTION_11_2();
  }
  OUTLINED_FUNCTION_4_3(v55, v56, v57, v58, v59, v60, v61);
  if ((OUTLINED_FUNCTION_0_3() & 1) == 0)
  {

    goto LABEL_34;
  }
  v62 = v70;
  v63 = v71;
  *(_QWORD *)&v4[OBJC_IVAR___AMLClientDonations_featuresConfiguration] = v70;
  *(_QWORD *)&v4[OBJC_IVAR___AMLClientDonations_featureProvider] = v23;
  *(_QWORD *)&v4[OBJC_IVAR___AMLClientDonations_batchProvider] = v33;
  *(_QWORD *)&v4[OBJC_IVAR___AMLClientDonations_arrayProvider] = v68;
  *(_QWORD *)&v4[OBJC_IVAR___AMLClientDonations_metadata] = v52;
  v64 = &v4[OBJC_IVAR___AMLClientDonations_donationTime];
  *(_QWORD *)v64 = v62;
  *((_QWORD *)v64 + 1) = v63;

  v69.receiver = v4;
  v69.super_class = (Class)AMLClientDonations;
  v65 = objc_msgSendSuper2(&v69, sel_init);

  return v65;
}

void __swiftcall AMLClientDonations.init()(AMLClientDonations *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void AMLClientDonations.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t AMLClientDonations.description.getter(uint64_t a1)
{
  void *v1;
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v14;

  v2 = 0xD000000000000014;
  v3 = OUTLINED_FUNCTION_31_1(a1, sel_featuresConfiguration);
  if (v3)
  {
    v4 = v3;
    v5 = OUTLINED_FUNCTION_19_3((uint64_t)v3, sel_featureProvider);
    if (!v5)
    {

      return v2;
    }
    v6 = OUTLINED_FUNCTION_19_3((uint64_t)v5, sel_batchProvider);
    if (v6)
    {
      v7 = OUTLINED_FUNCTION_19_3((uint64_t)v6, sel_metadata);
      if (v7)
      {
        v8 = v7;
        sub_235F82ED8(v1);
        if (v9)
        {
          sub_235F9B5F4();
          OUTLINED_FUNCTION_20_2();
          v10 = objc_msgSend(v4, sel_description);
          sub_235F9B3FC();

          sub_235F9B420();
          swift_bridgeObjectRelease();
          sub_235F9B420();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256399870);
          OUTLINED_FUNCTION_6_2();
          OUTLINED_FUNCTION_14_3();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256399C90);
          OUTLINED_FUNCTION_6_2();
          v11 = OUTLINED_FUNCTION_14_3();
          v14 = OUTLINED_FUNCTION_19_3(v11, sel_arrayProvider);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256399CA0);
          OUTLINED_FUNCTION_6_2();

          sub_235F9B420();
          v12 = objc_msgSend(v8, sel_description);
          sub_235F9B3FC();

          sub_235F9B420();
          OUTLINED_FUNCTION_23();
          OUTLINED_FUNCTION_20_2();
          sub_235F9B420();

          OUTLINED_FUNCTION_9_3();
          OUTLINED_FUNCTION_15_2();

          swift_bridgeObjectRelease();
          return 0;
        }
        else
        {

          OUTLINED_FUNCTION_9_3();
          OUTLINED_FUNCTION_15_2();

        }
        return v2;
      }

      OUTLINED_FUNCTION_9_3();
    }
    else
    {

    }
    swift_unknownObjectRelease();
  }
  return v2;
}

void sub_235F82E60()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  SEL v6;

  OUTLINED_FUNCTION_23_2();
  if (v3)
  {
    v4 = (void *)OUTLINED_FUNCTION_22_2();
    OUTLINED_FUNCTION_23();
  }
  else
  {
    v4 = 0;
  }
  OUTLINED_FUNCTION_18_3();
  objc_msgSend(v5, v6);

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_8_3();

  OUTLINED_FUNCTION_16_2();
}

uint64_t sub_235F82ED8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_donationTime);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_235F9B3FC();

  return v3;
}

uint64_t type metadata accessor for AMLClientDonations(uint64_t a1)
{
  return sub_235F6B254(a1, &qword_256399D30);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_1_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, (SEL)(v2 + 3016), a1);
}

id OUTLINED_FUNCTION_2_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(v0, (SEL)(v3 + 328), v1, v2);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_4_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  return sub_235F6D390((uint64_t)va, (uint64_t)va1);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_235F9B624();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_235F9B3F0();
}

double OUTLINED_FUNCTION_11_2()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return sub_235F9B5C4();
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return swift_unknownObjectRelease();
}

id OUTLINED_FUNCTION_19_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return sub_235F9B5C4();
}

id OUTLINED_FUNCTION_26_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

void OUTLINED_FUNCTION_27_2()
{
  void *v0;

}

void OUTLINED_FUNCTION_28_3(uint64_t a1@<X8>)
{
  uint64_t v1;

}

uint64_t type metadata accessor for AMLSODAUserHostEnvironment()
{
  uint64_t result;

  result = qword_256399D40;
  if (!qword_256399D40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235F83104()
{
  return swift_initClassMetadata2();
}

uint64_t sub_235F83150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return sub_235F831B0(a1, a2, a3);
}

uint64_t sub_235F831B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = sub_235F9B0D8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = qword_256399D38;
  v10 = (void *)objc_opt_self();
  swift_retain();
  *(_QWORD *)(v3 + v9) = objc_msgSend(v10, sel_standardUserDefaults);
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a3, v5);
  v11 = sub_235F9B330();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a3, v5);
  return v11;
}

uint64_t sub_235F832B8()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = *(id *)(v0 + qword_256399D38);
  v2 = (void *)OUTLINED_FUNCTION_0_4();
  v3 = objc_msgSend(v1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_235F9B5C4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_235F6D390((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast())
      return v5;
    else
      return 0;
  }
  else
  {
    sub_235F6D3D8((uint64_t)v7);
    return 0;
  }
}

void sub_235F833B0(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(void **)(v2 + qword_256399D38);
  if ((a2 & 1) != 0)
  {
    v6 = v3;
    v5 = 0;
  }
  else
  {
    v4 = v3;
    v5 = sub_235F9B498();
  }
  v7 = (id)OUTLINED_FUNCTION_0_4();
  objc_msgSend(v3, sel_setObject_forKey_, v5, v7);

  swift_unknownObjectRelease();
}

void (*sub_235F83440(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  char v3;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)a1 = sub_235F832B8();
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return sub_235F8347C;
}

void sub_235F8347C(uint64_t a1)
{
  sub_235F833B0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void sub_235F834A8()
{
  uint64_t v0;

}

uint64_t sub_235F834B8()
{

  return swift_deallocClassInstance();
}

uint64_t sub_235F834F4()
{
  return type metadata accessor for AMLSODAUserHostEnvironment();
}

uint64_t sub_235F834FC()
{
  return MEMORY[0x24BE851C0];
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_235F9B3F0();
}

uint64_t sub_235F83520()
{
  uint64_t v0;

  v0 = sub_235F9B384();
  __swift_allocate_value_buffer(v0, qword_25639A7E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A7E0);
  return sub_235F9B378();
}

#error "235F839C8: call analysis failed (funcsize=627)"

uint64_t sub_235F83FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  BOOL v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  unint64_t v32;
  unint64_t i;
  int64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t result;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  OUTLINED_FUNCTION_67();
  v9 = OUTLINED_FUNCTION_63_1(a2);
  OUTLINED_FUNCTION_27_1();
  v63 = a2;
  if (v9)
  {
    OUTLINED_FUNCTION_62();
    v10 = OUTLINED_FUNCTION_30_1();
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_35();
    if (v10)
    {
      OUTLINED_FUNCTION_62();
      v11 = OUTLINED_FUNCTION_30_1();
      OUTLINED_FUNCTION_27_1();
      if (v11)
      {
        v12 = *(_QWORD *)(v11 + 16);
        if (v12)
        {
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)(v9 + 16))
            {
              v14 = OUTLINED_FUNCTION_28_4();
              if ((v15 & 1) != 0)
              {
                v16 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v14);
                v17 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_74;
                OUTLINED_FUNCTION_79_1();
                OUTLINED_FUNCTION_28_4();
                OUTLINED_FUNCTION_37_2();
                if (v20)
                  goto LABEL_75;
                v21 = v18;
                v22 = v19;
                __swift_instantiateConcreteTypeFromMangledName(&qword_256399B58);
                if ((OUTLINED_FUNCTION_17_3() & 1) != 0)
                {
                  OUTLINED_FUNCTION_74_0();
                  OUTLINED_FUNCTION_23_3();
                  if (!v24)
                    goto LABEL_80;
                  v21 = v23;
                }
                if ((v22 & 1) != 0)
                {
                  *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21) = v17;
                }
                else
                {
                  OUTLINED_FUNCTION_7_4();
                  if (v20)
                    goto LABEL_78;
                  *(_QWORD *)(v9 + 16) = v25;
                }
                OUTLINED_FUNCTION_85();
              }
            }
            if (v12 == ++v13)
              goto LABEL_68;
          }
        }
        goto LABEL_68;
      }
    }
    goto LABEL_69;
  }
  v62 = a3;
  v26 = (_QWORD *)sub_235F9B3E4();
  v64 = a5 + 56;
  v27 = 1 << *(_BYTE *)(a5 + 32);
  v28 = -1;
  if (v27 < 64)
    v28 = ~(-1 << v27);
  v29 = v28 & *(_QWORD *)(a5 + 56);
  v30 = (unint64_t)(v27 + 63) >> 6;
  OUTLINED_FUNCTION_37_1();
  v31 = 0;
  if (!v29)
    goto LABEL_25;
LABEL_24:
  v32 = __clz(__rbit64(v29));
  v29 &= v29 - 1;
  for (i = v32 | (v31 << 6); ; i = v38 + (v31 << 6))
  {
    v39 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 8 * i);
    OUTLINED_FUNCTION_79_1();
    sub_235F7F3E4(v39);
    OUTLINED_FUNCTION_37_2();
    if (v20)
    {
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      result = sub_235F9B6D8();
      __break(1u);
      return result;
    }
    v42 = v40;
    v43 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B58);
    if ((OUTLINED_FUNCTION_17_3() & 1) != 0)
    {
      sub_235F7F3E4(v39);
      OUTLINED_FUNCTION_23_3();
      if (!v24)
        goto LABEL_80;
      v42 = v44;
    }
    if ((v43 & 1) != 0)
    {
      *(_QWORD *)(v26[7] + 8 * v42) = 0;
    }
    else
    {
      v26[(v42 >> 6) + 8] |= 1 << v42;
      *(_QWORD *)(v26[6] + 8 * v42) = v39;
      *(_QWORD *)(v26[7] + 8 * v42) = 0;
      v45 = v26[2];
      v20 = __OFADD__(v45, 1);
      v46 = v45 + 1;
      if (v20)
        goto LABEL_71;
      v26[2] = v46;
    }
    OUTLINED_FUNCTION_85();
    if (v29)
      goto LABEL_24;
LABEL_25:
    v34 = v31 + 1;
    if (__OFADD__(v31, 1))
      goto LABEL_72;
    if (v34 >= v30)
      goto LABEL_50;
    ++v31;
    if (!*(_QWORD *)(v64 + 8 * v34))
    {
      v31 = v34 + 1;
      if (v34 + 1 >= v30)
        goto LABEL_50;
      if (!*(_QWORD *)(v64 + 8 * v31))
      {
        v31 = v34 + 2;
        if (v34 + 2 >= v30)
          goto LABEL_50;
        if (!*(_QWORD *)(v64 + 8 * v31))
          break;
      }
    }
LABEL_38:
    OUTLINED_FUNCTION_251();
    v29 = v37 & v36;
  }
  v35 = v34 + 3;
  if (v35 < v30)
  {
    if (!*(_QWORD *)(v64 + 8 * v35))
    {
      while (1)
      {
        v31 = v35 + 1;
        if (__OFADD__(v35, 1))
          goto LABEL_73;
        if (v31 >= v30)
          goto LABEL_50;
        ++v35;
        if (*(_QWORD *)(v64 + 8 * v31))
          goto LABEL_38;
      }
    }
    v31 = v35;
    goto LABEL_38;
  }
LABEL_50:
  swift_release();
  OUTLINED_FUNCTION_62();
  v47 = sub_235F731F8(v63, v62, a4);
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_35();
  if (v47)
  {
    OUTLINED_FUNCTION_62();
    v48 = OUTLINED_FUNCTION_30_1();
    OUTLINED_FUNCTION_27_1();
    if (v48)
    {
      v49 = *(_QWORD *)(v48 + 16);
      if (v49)
      {
        for (j = 0; v49 != j; ++j)
        {
          if (v26[2])
          {
            v51 = OUTLINED_FUNCTION_28_4();
            if ((v52 & 1) != 0)
            {
              v53 = *(_QWORD *)(v26[7] + 8 * v51);
              v54 = v53 + 1;
              if (__OFADD__(v53, 1))
                goto LABEL_76;
              OUTLINED_FUNCTION_79_1();
              OUTLINED_FUNCTION_28_4();
              OUTLINED_FUNCTION_37_2();
              if (v20)
                goto LABEL_77;
              v57 = v55;
              v58 = v56;
              __swift_instantiateConcreteTypeFromMangledName(&qword_256399B58);
              if ((OUTLINED_FUNCTION_17_3() & 1) != 0)
              {
                OUTLINED_FUNCTION_74_0();
                OUTLINED_FUNCTION_23_3();
                if (!v24)
                  goto LABEL_80;
                v57 = v59;
              }
              if ((v58 & 1) != 0)
              {
                *(_QWORD *)(v26[7] + 8 * v57) = v54;
              }
              else
              {
                OUTLINED_FUNCTION_7_4();
                if (v20)
                  goto LABEL_79;
                v26[2] = v60;
              }
              OUTLINED_FUNCTION_85();
            }
          }
        }
      }
LABEL_68:
      OUTLINED_FUNCTION_39();
    }
  }
LABEL_69:
  OUTLINED_FUNCTION_62();
  swift_bridgeObjectRetain();
  sub_235F9863C();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F84444(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _BOOL8 v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;

  OUTLINED_FUNCTION_67();
  v4 = OUTLINED_FUNCTION_63_1(a2);
  OUTLINED_FUNCTION_27_1();
  if (v4)
  {
    OUTLINED_FUNCTION_62();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_15_3();
    v6 = v5;
    OUTLINED_FUNCTION_27_1();
    if ((v6 & 1) == 0)
    {
      OUTLINED_FUNCTION_62();
      v7 = OUTLINED_FUNCTION_15_3();
      v9 = v8;
      OUTLINED_FUNCTION_27_1();
      if ((v9 & 1) == 0)
      {
        if (v7 > 4)
        {
          v41 = sub_235F731FC(5, v4);
          v43 = v42;
          OUTLINED_FUNCTION_35();
          if ((v43 & 1) != 0)
            goto LABEL_9;
          v13 = __OFADD__(v41, 1);
          v44 = v41 + 1;
          if (v13)
            goto LABEL_41;
          swift_isUniquelyReferenced_nonNull_native();
          v15 = v44;
          v16 = 5;
        }
        else
        {
          v10 = sub_235F731FC(v7, v4);
          v12 = v11;
          OUTLINED_FUNCTION_35();
          if ((v12 & 1) != 0)
          {
LABEL_9:
            OUTLINED_FUNCTION_62();
            OUTLINED_FUNCTION_53_1();
            return swift_bridgeObjectRelease();
          }
          v13 = __OFADD__(v10, 1);
          v14 = v10 + 1;
          if (v13)
            goto LABEL_40;
          swift_isUniquelyReferenced_nonNull_native();
          v15 = v14;
          v16 = v7;
        }
        sub_235F7F884(v15, v16);
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v17 = (_QWORD *)sub_235F9B3E4();
  swift_isUniquelyReferenced_nonNull_native();
  sub_235F7F3E4(0);
  OUTLINED_FUNCTION_32_3();
  if (v13)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_15_3();
    v31 = v30;
    OUTLINED_FUNCTION_27_1();
    if ((v31 & 1) != 0)
      goto LABEL_29;
    OUTLINED_FUNCTION_62();
    v32 = OUTLINED_FUNCTION_15_3();
    v34 = v33;
    OUTLINED_FUNCTION_27_1();
    if ((v34 & 1) != 0)
      goto LABEL_29;
    if (v32 > 4)
    {
      v45 = sub_235F731FC(5, v2);
      if ((v46 & 1) == 0)
      {
        v47 = v45 + 1;
        if (__OFADD__(v45, 1))
          goto LABEL_43;
        OUTLINED_FUNCTION_69_1();
        v38 = v47;
        v39 = 5;
        goto LABEL_38;
      }
    }
    else
    {
      v35 = sub_235F731FC(v32, v2);
      if ((v36 & 1) == 0)
      {
        v37 = v35 + 1;
        if (__OFADD__(v35, 1))
          goto LABEL_42;
        OUTLINED_FUNCTION_69_1();
        v38 = v37;
        v39 = v32;
LABEL_38:
        sub_235F7F884(v38, v39);
        OUTLINED_FUNCTION_85();
      }
    }
LABEL_29:
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_53_1();
    OUTLINED_FUNCTION_39();
    return swift_bridgeObjectRelease();
  }
  v20 = v18;
  v21 = v19;
  v22 = 0;
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B58);
    if ((sub_235F9B630() & 1) != 0)
    {
      v23 = sub_235F7F3E4(v22);
      if ((v21 & 1) != (v24 & 1))
        goto LABEL_44;
      v20 = v23;
    }
    v2 = (uint64_t)v17;
    if ((v21 & 1) == 0)
      break;
    *(_QWORD *)(v17[7] + 8 * v20) = 0;
LABEL_19:
    OUTLINED_FUNCTION_85();
    if (v22 == 5)
      goto LABEL_23;
    ++v22;
    OUTLINED_FUNCTION_69_1();
    v20 = sub_235F7F3E4(v22);
    v21 = v27;
    v28 = v17[2];
    v29 = (v27 & 1) == 0;
    v2 = v28 + v29;
    if (__OFADD__(v28, v29))
      goto LABEL_22;
  }
  v17[(v20 >> 6) + 8] |= 1 << v20;
  *(_QWORD *)(v17[6] + 8 * v20) = v22;
  *(_QWORD *)(v17[7] + 8 * v20) = 0;
  v25 = v17[2];
  v13 = __OFADD__(v25, 1);
  v26 = v25 + 1;
  if (!v13)
  {
    v17[2] = v26;
    goto LABEL_19;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_235F9B6D8();
  __break(1u);
  return result;
}

uint64_t sub_235F847B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  BOOL v44;
  unint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  unint64_t v66;
  unint64_t v67;
  char v68;
  unint64_t v69;
  char v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  unint64_t v79;
  char v80;
  _QWORD *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  unint64_t v95;
  char v96;
  unint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  os_log_type_t v106;
  uint8_t *v107;
  uint64_t v108;
  void *v109;
  NSObject *v110;
  os_log_type_t v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  os_log_type_t v127;
  uint8_t *v128;
  uint64_t v129;
  int64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  int64_t v137;
  int64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t *v142;
  unint64_t v143;
  uint64_t v144;
  NSObject *v145;
  os_log_type_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  os_log_type_t v152;
  void *v153;
  NSObject *v154;
  os_log_type_t v155;
  uint64_t result;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  __int128 v165;
  double v166;
  uint64_t *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  int64_t v181;
  uint64_t v182;
  uint64_t v183[8];
  uint64_t v184;
  uint64_t v185;

  HIDWORD(v164) = a5;
  v172 = *(double *)&a1;
  *(_QWORD *)&v159 = a4 + 64;
  OUTLINED_FUNCTION_1_3();
  v160 = v16;
  v161 = v15;
  v167 = &v185;
  swift_bridgeObjectRetain();
  v17 = 0.0;
  *(_QWORD *)&v18 = 136315138;
  v165 = v18;
  *(_QWORD *)&v158 = MEMORY[0x24BEE4AD8] + 8;
  v170 = *(double *)&a2;
  if (v5 == 0.0)
    goto LABEL_3;
  while (2)
  {
    OUTLINED_FUNCTION_9_4();
    v162 = v5;
LABEL_16:
    v163 = v19;
    OUTLINED_FUNCTION_75_1();
    v27 = *v25;
    v26 = v25[1];
    v30 = *(_QWORD *)(v29 + 8 * v28);
    v182 = *(_QWORD *)(v30 + 16);
    if (!v182)
    {
      OUTLINED_FUNCTION_34_2();
      goto LABEL_91;
    }
    v180 = v30 + 32;
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_34_2();
    v31 = 0;
    v32 = 0;
    v175 = v27;
    v178 = v30;
    do
    {
      if (v32 >= *(_QWORD *)(v30 + 16))
      {
        __break(1u);
LABEL_141:
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
        goto LABEL_145;
      }
      if (*(_QWORD *)(a2 + 16))
      {
        OUTLINED_FUNCTION_62();
        v33 = OUTLINED_FUNCTION_62_1();
        if ((v34 & 1) != 0)
        {
          v35 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v33);
          v36 = *(_QWORD *)(v35 + 16);
          v37 = a3;
          if (v36)
          {
            OUTLINED_FUNCTION_37_1();
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)(v37 + 16))
              {
                v39 = *(_QWORD *)(v35 + 8 * i + 32);
                OUTLINED_FUNCTION_62();
                OUTLINED_FUNCTION_62_1();
                if ((v40 & 1) != 0)
                {
                  OUTLINED_FUNCTION_29_2();
                  OUTLINED_FUNCTION_27_1();
                  if (*(_QWORD *)(v37 + 16) && (v41 = sub_235F7F3E4(v39), (v42 & 1) != 0))
                  {
                    v43 = *(_QWORD *)(*(_QWORD *)(v37 + 56) + 8 * v41);
                    OUTLINED_FUNCTION_35();
                    v44 = __OFADD__(v31, v43);
                    v31 += v43;
                    if (v44)
                      goto LABEL_142;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_35();
                  }
                  v37 = a3;
                }
                else
                {
                  OUTLINED_FUNCTION_27_1();
                }
              }
            }
            OUTLINED_FUNCTION_27_1();
            OUTLINED_FUNCTION_25();
            *(double *)&a2 = v170;
            v27 = v175;
          }
          else
          {
            OUTLINED_FUNCTION_27_1();
            *(double *)&a2 = v170;
          }
          v30 = v178;
        }
        else
        {
          OUTLINED_FUNCTION_27_1();
        }
      }
      ++v32;
    }
    while (v32 != v182);
    OUTLINED_FUNCTION_111();
    v45 = 0;
    v6 = (double)v31;
    v171 = (double)v31;
    do
    {
      if (v45 >= *(_QWORD *)(v30 + 16))
        goto LABEL_141;
      v46 = (uint64_t *)(v180 + 16 * v45);
      v47 = *v46;
      v48 = v46[1];
      v5 = *(double *)(a2 + 16);
      OUTLINED_FUNCTION_37_1();
      v8 = 0.0;
      if (v5 != 0.0)
      {
        OUTLINED_FUNCTION_37_1();
        v49 = OUTLINED_FUNCTION_41_1();
        if ((v50 & 1) != 0)
        {
          v5 = *(double *)(*(_QWORD *)(a2 + 56) + 8 * v49);
          OUTLINED_FUNCTION_62();
          OUTLINED_FUNCTION_25();
          v51 = *(_QWORD *)(*(_QWORD *)&v5 + 16);
          v52 = a3;
          if (v51)
          {
            v53 = (uint64_t *)(*(_QWORD *)&v5 + 32);
            v7 = 0.0;
            do
            {
              v55 = *v53++;
              v54 = v55;
              if (*(_QWORD *)(v52 + 16))
              {
                OUTLINED_FUNCTION_37_1();
                OUTLINED_FUNCTION_41_1();
                if ((v56 & 1) != 0)
                {
                  OUTLINED_FUNCTION_29_2();
                  OUTLINED_FUNCTION_25();
                  if (*(_QWORD *)(v52 + 16) && (v57 = sub_235F7F3E4(v54), (v58 & 1) != 0))
                  {
                    v59 = *(_QWORD *)(*(_QWORD *)(v52 + 56) + 8 * v57);
                    OUTLINED_FUNCTION_35();
                    if (v31)
                      v7 = v7 + (double)v59;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_35();
                  }
                  v52 = a3;
                }
                else
                {
                  OUTLINED_FUNCTION_25();
                }
              }
              --v51;
            }
            while (v51);
          }
          else
          {
            v7 = 0.0;
          }
          OUTLINED_FUNCTION_27_1();
          v8 = v7 / v6;
          v27 = v175;
          v30 = v178;
        }
        else
        {
          OUTLINED_FUNCTION_25();
        }
      }
      v60 = **(_QWORD **)&v172;
      if (*(_QWORD *)(**(_QWORD **)&v172 + 16))
      {
        OUTLINED_FUNCTION_34_2();
        v61 = OUTLINED_FUNCTION_40_1();
        if ((v62 & 1) == 0)
        {
          OUTLINED_FUNCTION_25();
          goto LABEL_88;
        }
        v63 = *(_QWORD *)(*(_QWORD *)(v60 + 56) + 8 * v61);
        OUTLINED_FUNCTION_62();
        OUTLINED_FUNCTION_20();
        if (*(_QWORD *)(v63 + 16))
        {
          OUTLINED_FUNCTION_37_1();
          OUTLINED_FUNCTION_62();
          v64 = OUTLINED_FUNCTION_54_1();
          if ((v65 & 1) != 0)
          {
            v66 = *(_QWORD *)(v63 + 56) + (v64 << 6);
            v13 = *(_QWORD *)v66;
            v12 = *(_QWORD *)(v66 + 8);
            v11 = *(_QWORD *)(v66 + 16);
            v10 = *(_QWORD *)(v66 + 24);
            v9 = *(_QWORD *)(v66 + 32);
            v173 = *(double *)(v66 + 40);
            v7 = *(double *)(v66 + 48);
            OUTLINED_FUNCTION_25();
            OUTLINED_FUNCTION_27_1();
            if ((BYTE4(v164) & 1) != 0)
              v8 = v7;
            swift_isUniquelyReferenced_nonNull_native();
            v183[0] = v63;
            v67 = OUTLINED_FUNCTION_54_1();
            if (__OFADD__(*(_QWORD *)(v63 + 16), (v68 & 1) == 0))
              goto LABEL_147;
            v69 = v67;
            v70 = v68;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256399BC8);
            v27 = v175;
            if ((sub_235F9B630() & 1) != 0)
            {
              v79 = OUTLINED_FUNCTION_41_1();
              if ((v70 & 1) != (v80 & 1))
                goto LABEL_151;
              v69 = v79;
            }
            v63 = v183[0];
            if ((v70 & 1) != 0)
            {
              OUTLINED_FUNCTION_36_3(v71, v72, v73, v74, v75, v76, v77, v78, v157, v158, v159, v160, v161, v162, v163, v164, *(double *)&v165, *((double *)&v165 + 1), v166,
                *(double *)&v167,
                v168,
                v169,
                v170,
                v171,
                v172,
                v173);
            }
            else
            {
              OUTLINED_FUNCTION_21_3(v183[0] + 8 * (v69 >> 6));
              v81 = (_QWORD *)(*(_QWORD *)(v183[0] + 48) + 16 * v69);
              *v81 = v47;
              v81[1] = v48;
              OUTLINED_FUNCTION_36_3(v82, v83, v84, v85, v86, v87, v88, v89, v157, v158, v159, v160, v161, v162, v163, v164, *(double *)&v165, *((double *)&v165 + 1), v166,
                *(double *)&v167,
                v168,
                v169,
                v170,
                v171,
                v172,
                v173);
              v90 = *(_QWORD *)(v63 + 16);
              v44 = __OFADD__(v90, 1);
              v91 = v90 + 1;
              if (v44)
                goto LABEL_148;
              *(_QWORD *)(v63 + 16) = v91;
              OUTLINED_FUNCTION_37_1();
            }
            OUTLINED_FUNCTION_25();
            OUTLINED_FUNCTION_85();
            v6 = v171;
            goto LABEL_79;
          }
          OUTLINED_FUNCTION_62_0();
        }
        swift_bridgeObjectRelease();
LABEL_79:
        OUTLINED_FUNCTION_34_2();
        swift_isUniquelyReferenced_nonNull_native();
        v183[0] = **(_QWORD **)&v172;
        v92 = v183[0];
        **(_QWORD **)&v172 = 0x8000000000000000;
        v93 = OUTLINED_FUNCTION_40_1();
        if (__OFADD__(*(_QWORD *)(v92 + 16), (v94 & 1) == 0))
          goto LABEL_144;
        v95 = v93;
        v96 = v94;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399BD0);
        v30 = v178;
        if ((sub_235F9B630() & 1) != 0)
        {
          v97 = OUTLINED_FUNCTION_40_1();
          if ((v96 & 1) != (v98 & 1))
            goto LABEL_151;
          v95 = v97;
        }
        v99 = v183[0];
        if ((v96 & 1) != 0)
        {
          v100 = *(_QWORD *)(v183[0] + 56);
          swift_bridgeObjectRelease();
          *(_QWORD *)(v100 + 8 * v95) = v63;
        }
        else
        {
          OUTLINED_FUNCTION_21_3(v183[0] + 8 * (v95 >> 6));
          v101 = (uint64_t *)(*(_QWORD *)(v183[0] + 48) + 16 * v95);
          *v101 = v27;
          v101[1] = v26;
          *(_QWORD *)(*(_QWORD *)(v99 + 56) + 8 * v95) = v63;
          v102 = *(_QWORD *)(v99 + 16);
          v44 = __OFADD__(v102, 1);
          v103 = v102 + 1;
          if (v44)
            goto LABEL_146;
          *(_QWORD *)(v99 + 16) = v103;
          OUTLINED_FUNCTION_34_2();
        }
        v5 = **(double **)&v172;
        **(_QWORD **)&v172 = v99;
        OUTLINED_FUNCTION_20();
      }
LABEL_88:
      swift_bridgeObjectRelease();
      ++v45;
      *(double *)&a2 = v170;
    }
    while (v45 != v182);
    OUTLINED_FUNCTION_111();
LABEL_91:
    if (qword_256399410 != -1)
      swift_once();
    v104 = OUTLINED_FUNCTION_19_1();
    v105 = __swift_project_value_buffer(v104, (uint64_t)qword_25639A7E0);
    OUTLINED_FUNCTION_34_2();
    sub_235F9B36C();
    v106 = OUTLINED_FUNCTION_150();
    if (OUTLINED_FUNCTION_14_4(v106))
    {
      v107 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v183[0] = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v107 = v165;
      OUTLINED_FUNCTION_34_2();
      sub_235F7EC30(v27, v26, v183);
      v184 = v108;
      OUTLINED_FUNCTION_68_0();
      OUTLINED_FUNCTION_241();
      OUTLINED_FUNCTION_64_1();
      OUTLINED_FUNCTION_52_1(v109, v110, v111, "signalsDict el for sessionTimestamp %s", v107);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_62_0();
    *(_QWORD *)&v168 = **(_QWORD **)&v172 + 64;
    OUTLINED_FUNCTION_1_3();
    v169 = v112;
    swift_bridgeObjectRetain();
    v113 = 0;
    if (v5 == 0.0)
      goto LABEL_98;
    while (2)
    {
      OUTLINED_FUNCTION_9_4();
      v174 = v5;
      v176 = v114;
LABEL_111:
      OUTLINED_FUNCTION_75_1();
      v122 = *v121;
      v123 = v121[1];
      v126 = *(_QWORD *)(v125 + 8 * v124);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_34_2();
      OUTLINED_FUNCTION_71_1();
      v127 = OUTLINED_FUNCTION_183();
      if (os_log_type_enabled(v105, v127))
      {
        v128 = (uint8_t *)OUTLINED_FUNCTION_23_0();
        v183[0] = OUTLINED_FUNCTION_23_0();
        *(_DWORD *)v128 = v165;
        OUTLINED_FUNCTION_17_0();
        sub_235F7EC30(v122, v123, v183);
        v184 = v129;
        sub_235F9B5AC();
        OUTLINED_FUNCTION_241();
        OUTLINED_FUNCTION_52_1(&dword_235F59000, v105, v127, "Timestamp: %s", v128);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8_0();
      }

      OUTLINED_FUNCTION_62_0();
      v130 = 0;
      v179 = v126 + 64;
      OUTLINED_FUNCTION_5_3();
      v133 = v132 & v131;
      v181 = (unint64_t)(v134 + 63) >> 6;
      while (2)
      {
        if (v133)
        {
          v135 = __clz(__rbit64(v133));
          v133 &= v133 - 1;
          v136 = v135 | (v130 << 6);
LABEL_130:
          v142 = (uint64_t *)(*(_QWORD *)(v126 + 48) + 16 * v136);
          v144 = *v142;
          v143 = v142[1];
          OUTLINED_FUNCTION_19_4();
          OUTLINED_FUNCTION_26_3();
          v145 = OUTLINED_FUNCTION_71_1();
          v146 = sub_235F9B504();
          if (os_log_type_enabled(v145, v146))
          {
            v147 = OUTLINED_FUNCTION_23_0();
            v184 = OUTLINED_FUNCTION_23_0();
            *(_DWORD *)v147 = 136315394;
            OUTLINED_FUNCTION_62();
            sub_235F7EC30(v144, v143, &v184);
            *(_QWORD *)(v147 + 4) = v148;
            OUTLINED_FUNCTION_241();
            *(_WORD *)(v147 + 12) = 2080;
            v183[0] = v13;
            *(double *)&v183[1] = v6;
            *(double *)&v183[2] = v7;
            *(double *)&v183[3] = v8;
            v183[4] = v9;
            v183[5] = v10;
            v183[6] = v11;
            v183[7] = v12;
            v149 = sub_235F88868();
            OUTLINED_FUNCTION_61_0(v149, v150);
            *(_QWORD *)(v147 + 14) = v151;
            OUTLINED_FUNCTION_27_1();
            OUTLINED_FUNCTION_154(&dword_235F59000, v145, v146, " SignalID: %s, interactionSignal: %s", (uint8_t *)v147);
            OUTLINED_FUNCTION_78_1();
            OUTLINED_FUNCTION_8_0();
          }

          OUTLINED_FUNCTION_62_0();
          continue;
        }
        break;
      }
      v137 = v130 + 1;
      if (__OFADD__(v130, 1))
      {
        __break(1u);
LABEL_138:
        __break(1u);
        return swift_release();
      }
      if (v137 >= v181)
        goto LABEL_97;
      ++v130;
      if (*(_QWORD *)(v179 + 8 * v137))
        goto LABEL_129;
      v130 = v137 + 1;
      if (v137 + 1 >= v181)
        goto LABEL_97;
      if (*(_QWORD *)(v179 + 8 * v130))
        goto LABEL_129;
      v130 = v137 + 2;
      if (v137 + 2 >= v181)
        goto LABEL_97;
      if (*(_QWORD *)(v179 + 8 * v130))
      {
LABEL_129:
        OUTLINED_FUNCTION_251();
        v133 = v140 & v139;
        v136 = v141 + (v130 << 6);
        goto LABEL_130;
      }
      v138 = v137 + 3;
      if (v138 < v181)
      {
        if (!*(_QWORD *)(v179 + 8 * v138))
        {
          while (1)
          {
            v130 = v138 + 1;
            if (__OFADD__(v138, 1))
              goto LABEL_138;
            if (v130 >= v181)
              goto LABEL_97;
            ++v138;
            if (*(_QWORD *)(v179 + 8 * v130))
              goto LABEL_129;
          }
        }
        v130 = v138;
        goto LABEL_129;
      }
LABEL_97:
      swift_release();
      v5 = v174;
      v113 = v176;
      if (v174 != 0.0)
        continue;
      break;
    }
LABEL_98:
    if (__OFADD__(v113, 1))
      goto LABEL_143;
    if (v113 + 1 >= *(uint64_t *)&v169)
      goto LABEL_133;
    OUTLINED_FUNCTION_47_1();
    if (v116)
      goto LABEL_110;
    if (v115 + 1 >= *(uint64_t *)&v169)
      goto LABEL_133;
    if (*(_QWORD *)(*(_QWORD *)&v168 + 8 * (v115 + 1)))
      goto LABEL_110;
    if (v115 + 2 >= *(uint64_t *)&v169)
      goto LABEL_133;
    if (*(_QWORD *)(*(_QWORD *)&v168 + 8 * (v115 + 2)))
      goto LABEL_110;
    v117 = v115 + 3;
    if (v117 >= *(uint64_t *)&v169)
    {
LABEL_133:
      swift_release();
      OUTLINED_FUNCTION_71_1();
      v152 = OUTLINED_FUNCTION_150();
      if (OUTLINED_FUNCTION_14_4(v152))
      {
        *(_WORD *)OUTLINED_FUNCTION_23_0() = 0;
        OUTLINED_FUNCTION_64_1();
        OUTLINED_FUNCTION_46_1(v153, v154, v155, "Search session data processed, signalsDict added to the list");
        OUTLINED_FUNCTION_8_0();
      }

      *(double *)&a2 = v170;
      v5 = v162;
      v17 = v163;
      if (v162 != 0.0)
        continue;
LABEL_3:
      if (__OFADD__(*(_QWORD *)&v17, 1))
        goto LABEL_149;
      if (*(_QWORD *)&v17 + 1 >= *(uint64_t *)&v160)
        return swift_release();
      OUTLINED_FUNCTION_47_1();
      if (!v21)
      {
        if (v20 + 1 >= *(uint64_t *)&v160)
          return swift_release();
        if (!*(_QWORD *)(*(_QWORD *)&v159 + 8 * (v20 + 1)))
        {
          if (v20 + 2 >= *(uint64_t *)&v160)
            return swift_release();
          if (!*(_QWORD *)(*(_QWORD *)&v159 + 8 * (v20 + 2)))
          {
            v22 = v20 + 3;
            if (v22 >= *(uint64_t *)&v160)
              return swift_release();
            if (!*(_QWORD *)(*(_QWORD *)&v159 + 8 * v22))
            {
              while (!__OFADD__(v22, 1))
              {
                if (v22 + 1 >= *(uint64_t *)&v160)
                  return swift_release();
                OUTLINED_FUNCTION_44();
                if (v23)
                  goto LABEL_15;
              }
              goto LABEL_150;
            }
          }
        }
      }
LABEL_15:
      OUTLINED_FUNCTION_6_3();
      v162 = v24;
      goto LABEL_16;
    }
    break;
  }
  if (*(_QWORD *)(*(_QWORD *)&v168 + 8 * v117))
  {
LABEL_110:
    OUTLINED_FUNCTION_6_3();
    v174 = *(double *)&v119;
    v176 = v120;
    goto LABEL_111;
  }
  while (!__OFADD__(v117, 1))
  {
    if (v117 + 1 >= *(uint64_t *)&v169)
      goto LABEL_133;
    OUTLINED_FUNCTION_44();
    if (v118)
      goto LABEL_110;
  }
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  result = sub_235F9B6D8();
  __break(1u);
  return result;
}

#error "235F8572C: call analysis failed (funcsize=589)"

id AMLPhotosSearchMetricsUtility.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMLPhotosSearchMetricsUtility.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchMetricsUtility();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for AMLPhotosSearchMetricsUtility()
{
  return objc_opt_self();
}

id AMLPhotosSearchMetricsUtility.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchMetricsUtility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AMLPhotosSearchMetricsUtility()
{
  return swift_lookUpClassMethod();
}

void OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  *(_QWORD *)(v0 + 8 * (v3 >> 6) + 64) |= 1 << v3;
  *(_QWORD *)(*(_QWORD *)(v0 + 48) + 8 * v3) = v2;
  *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v3) = v1;
}

BOOL OUTLINED_FUNCTION_14_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_235F731BC(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return sub_235F9B630();
}

void OUTLINED_FUNCTION_21_3(uint64_t a1@<X8>)
{
  char v1;

  *(_QWORD *)(a1 + 64) |= 1 << v1;
}

double OUTLINED_FUNCTION_25_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,double a38)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  double result;

  v38 = (double *)(*(_QWORD *)(v31 + 56) + (v30 << 6));
  *(_QWORD *)v38 = v36;
  *((_QWORD *)v38 + 1) = v34;
  *((_QWORD *)v38 + 2) = v35;
  *((_QWORD *)v38 + 3) = v33;
  *((_QWORD *)v38 + 4) = v32;
  *((_QWORD *)v38 + 5) = v37;
  result = a38;
  *((_QWORD *)v38 + 6) = a34;
  v38[7] = a38;
  return result;
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return swift_bridgeObjectRetain_n();
}

unint64_t OUTLINED_FUNCTION_28_4()
{
  uint64_t v0;

  return sub_235F7F3E4(v0);
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_235F731F8(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  return sub_235F88868();
}

unint64_t OUTLINED_FUNCTION_34_3()
{
  return sub_235F7F384();
}

double OUTLINED_FUNCTION_36_3(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19, double a20,double a21,double a22,double a23,double a24,double a25,double a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  double result;

  v35 = (double *)(*(_QWORD *)(v26 + 56) + (v27 << 6));
  *(_QWORD *)v35 = v34;
  *((_QWORD *)v35 + 1) = v33;
  *((_QWORD *)v35 + 2) = v32;
  *((_QWORD *)v35 + 3) = v31;
  result = a26;
  *((_QWORD *)v35 + 4) = v30;
  v35[5] = a26;
  *((_QWORD *)v35 + 6) = v29;
  *((_QWORD *)v35 + 7) = v28;
  return result;
}

double OUTLINED_FUNCTION_38_2(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19, double a20,double a21,double a22,double a23,double a24,double a25,double a26,double a27,double a28,double a29,double a30,double a31)
{
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double *v40;
  double result;

  v40 = (double *)(*(_QWORD *)(v31 + 56) + (v32 << 6));
  *(_QWORD *)v40 = v39;
  *((_QWORD *)v40 + 1) = v38;
  *((_QWORD *)v40 + 2) = v37;
  *((_QWORD *)v40 + 3) = v36;
  *((_QWORD *)v40 + 4) = v34;
  *((_QWORD *)v40 + 5) = v33;
  result = a31;
  *((_QWORD *)v40 + 6) = v35;
  v40[7] = a31;
  return result;
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_235F9B630();
}

unint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_235F7F384();
}

unint64_t OUTLINED_FUNCTION_41_1()
{
  return sub_235F7F384();
}

void OUTLINED_FUNCTION_46_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

unint64_t OUTLINED_FUNCTION_49_1()
{
  return sub_235F7F384();
}

unint64_t OUTLINED_FUNCTION_50_0()
{
  return sub_235F7F384();
}

void OUTLINED_FUNCTION_52_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  return sub_235F9863C();
}

unint64_t OUTLINED_FUNCTION_54_1()
{
  return sub_235F7F384();
}

BOOL OUTLINED_FUNCTION_55_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_56_1(uint64_t a1@<X8>)
{
  char v1;

  *(_QWORD *)(a1 + 64) |= 1 << v1;
}

unint64_t OUTLINED_FUNCTION_58_1()
{
  return sub_235F7F384();
}

unint64_t OUTLINED_FUNCTION_60_1()
{
  return sub_235F7F384();
}

void OUTLINED_FUNCTION_61_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_235F7EC30(a1, a2, (uint64_t *)(v2 - 160));
}

unint64_t OUTLINED_FUNCTION_62_1()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_63_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_235F731F8(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return sub_235F9B5AC();
}

uint64_t OUTLINED_FUNCTION_69_1()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_71_1()
{
  return sub_235F9B36C();
}

unint64_t OUTLINED_FUNCTION_74_0()
{
  uint64_t v0;

  return sub_235F7F3E4(v0);
}

uint64_t OUTLINED_FUNCTION_78_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_79_1()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_arrayDestroy();
}

ValueMetadata *type metadata accessor for AMLConstants()
{
  return &type metadata for AMLConstants;
}

uint64_t sub_235F861BC(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_5(a1, qword_25639A7F8);
}

uint64_t sub_235F861DC()
{
  uint64_t result;

  sub_235F86384();
  result = sub_235F9B5A0();
  qword_25639A810 = result;
  return result;
}

uint64_t sub_235F86240()
{
  uint64_t v0;
  id v1;

  v0 = sub_235F9B360();
  __swift_allocate_value_buffer(v0, qword_25639A818);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A818);
  if (qword_256399420 != -1)
    swift_once();
  v1 = (id)qword_25639A810;
  return sub_235F9B354();
}

uint64_t sub_235F862C0(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_5(a1, qword_25639A830);
}

uint64_t sub_235F862E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_235F9B384();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_235F9B378();
}

void sub_235F86354()
{
  qword_25639A848 = 0x72756769666E6F63;
  qword_25639A850 = 0xEF64496E6F697461;
}

unint64_t sub_235F86384()
{
  unint64_t result;

  result = qword_256399DB8;
  if (!qword_256399DB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256399DB8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t a1, uint64_t *a2)
{
  return sub_235F862E0(a1, a2);
}

uint64_t sub_235F863C8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_BYTE *)(a1 + 32);
  v3 = -1;
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  v7 = -1 << v2;
  if (-v7 < 64)
    v3 = ~(-1 << -(char)v7);
  a2[1] = result;
  a2[2] = ~v7;
  a2[3] = 0;
  a2[4] = v3 & v5;
  a2[5] = 0;
  return result;
}

void sub_235F86404(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t *v8;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v10 = *v8;
  v11 = v8[1];
  v13 = v8[2];
  v12 = v8[3];
  v14 = v12;
  v15 = v8[4];
  if (v15)
  {
    v16 = (v15 - 1) & v15;
    v17 = __clz(__rbit64(v15)) | (v12 << 6);
    goto LABEL_3;
  }
  v24 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
LABEL_28:
    __break(1u);
    return;
  }
  v25 = (unint64_t)(v13 + 64) >> 6;
  if (v24 >= v25)
    goto LABEL_24;
  v26 = *(_QWORD *)(v11 + 8 * v24);
  if (!v26)
  {
    v27 = v12 + 2;
    v14 = v12 + 1;
    if (v12 + 2 < v25)
    {
      v26 = *(_QWORD *)(v11 + 8 * v27);
      if (v26)
      {
LABEL_12:
        v24 = v27;
        goto LABEL_9;
      }
      v14 = v12 + 2;
      if (v12 + 3 < v25)
      {
        v26 = *(_QWORD *)(v11 + 8 * (v12 + 3));
        if (v26)
        {
          v24 = v12 + 3;
          goto LABEL_9;
        }
        v27 = v12 + 4;
        v14 = v12 + 3;
        if (v12 + 4 < v25)
        {
          v26 = *(_QWORD *)(v11 + 8 * v27);
          if (v26)
            goto LABEL_12;
          v24 = v12 + 5;
          v14 = v12 + 4;
          if (v12 + 5 < v25)
          {
            v26 = *(_QWORD *)(v11 + 8 * v24);
            if (v26)
              goto LABEL_9;
            v14 = v25 - 1;
            v28 = v12 + 6;
            while (v28 < v25)
            {
              v26 = *(_QWORD *)(v11 + 8 * v28++);
              if (v26)
              {
                v24 = v28 - 1;
                goto LABEL_9;
              }
            }
          }
        }
      }
    }
LABEL_24:
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    *v8 = v10;
    v8[1] = v11;
    v8[2] = v13;
    v8[3] = v14;
    v8[4] = 0;
    goto LABEL_25;
  }
LABEL_9:
  v16 = (v26 - 1) & v26;
  v17 = __clz(__rbit64(v26)) + (v24 << 6);
  v14 = v24;
LABEL_3:
  v18 = (uint64_t *)(*(_QWORD *)(v10 + 48) + 16 * v17);
  v20 = *v18;
  v19 = v18[1];
  sub_235F6B0A8(*(_QWORD *)(v10 + 56) + 32 * v17, (uint64_t)&v30);
  *(_QWORD *)&v34 = v20;
  *((_QWORD *)&v34 + 1) = v19;
  sub_235F6E7A4(&v30, &v35);
  v21 = *((_QWORD *)&v34 + 1);
  a1 = swift_bridgeObjectRetain();
  *v8 = v10;
  v8[1] = v11;
  v8[2] = v13;
  v8[3] = v14;
  v8[4] = v16;
  if (v21)
  {
    v31 = v34;
    v32 = v35;
    v33 = v36;
    v22 = v8[5];
    if (!__OFADD__(v22, 1))
    {
      v8[5] = v22 + 1;
      *(_QWORD *)a8 = v22;
      v23 = v32;
      *(_OWORD *)(a8 + 8) = v31;
      *(_OWORD *)(a8 + 24) = v23;
      *(_OWORD *)(a8 + 40) = v33;
      return;
    }
    __break(1u);
    goto LABEL_28;
  }
LABEL_25:
  OUTLINED_FUNCTION_37_3(a1, &qword_256399EC0, a2, a3, a4, a5, a6, a7, v29, v30);
  *(_QWORD *)(a8 + 48) = 0;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)a8 = 0u;
}

void sub_235F86614()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void sub_235F8667C()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void sub_235F866AC()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F866F0()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR___AMLFeaturesConfiguration_expirationPolicy);
}

id sub_235F86720()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AMLFeaturesConfiguration_featuresDescription);
}

void sub_235F8673C()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void AMLFeaturesConfiguration.init(bundleIdentifier:modelName:versionId:expirationPolicy:featuresDescription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v11 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v14 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_17();
  objc_msgSend(v13, sel_initWithBundleIdentifier_modelName_versionId_expirationPolicy_featuresDescription_, v11, v12, v14, a7, a8);

  OUTLINED_FUNCTION_11_0();
}

void AMLFeaturesConfiguration.init(bundleIdentifier:modelName:versionId:expirationPolicy:featuresDescription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = a8;
  v21 = a7;
  v19 = a5;
  v20 = a6;
  v14 = sub_235F9B1B0();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F9B1A4();
  sub_235F9B198();
  OUTLINED_FUNCTION_44_0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v18 = objc_allocWithZone((Class)AMLFeaturesConfiguration);
  sub_235F869D8(a1, a2, a3, a4, v19, v20, v21, v22, v8, v9);
  swift_getObjectType();
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_11_0();
}

id sub_235F869D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  objc_super v16;

  v11 = (_QWORD *)(v10 + OBJC_IVAR___AMLFeaturesConfiguration_bundleIdentifier);
  *v11 = a1;
  v11[1] = a2;
  v12 = (_QWORD *)(v10 + OBJC_IVAR___AMLFeaturesConfiguration_modelName);
  *v12 = a3;
  v12[1] = a4;
  v13 = (_QWORD *)(v10 + OBJC_IVAR___AMLFeaturesConfiguration_versionId);
  *v13 = a5;
  v13[1] = a6;
  *(_DWORD *)(v10 + OBJC_IVAR___AMLFeaturesConfiguration_expirationPolicy) = a7;
  *(_QWORD *)(v10 + OBJC_IVAR___AMLFeaturesConfiguration_featuresDescription) = a8;
  v14 = (_QWORD *)(v10 + OBJC_IVAR___AMLFeaturesConfiguration_configurationId);
  *v14 = a9;
  v14[1] = a10;
  v16.super_class = (Class)AMLFeaturesConfiguration;
  return objc_msgSendSuper2(&v16, sel_init);
}

void AMLFeaturesConfiguration.copy(with:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = OUTLINED_FUNCTION_31_1(a1, sel_bundleIdentifier);
  v6 = sub_235F9B3FC();
  v22 = v7;
  v23 = v6;

  sub_235F88608(v2);
  OUTLINED_FUNCTION_44_0();
  v9 = OUTLINED_FUNCTION_31_1(v8, sel_versionId);
  v10 = sub_235F9B3FC();
  v12 = v11;

  v13 = objc_msgSend(v2, sel_expirationPolicy);
  LODWORD(v9) = (_DWORD)v13;
  v14 = OUTLINED_FUNCTION_31_1((uint64_t)v13, sel_featuresDescription);
  v15 = OUTLINED_FUNCTION_31_1((uint64_t)v14, sel_configurationId);
  v16 = sub_235F9B3FC();
  v18 = v17;

  v19 = objc_allocWithZone((Class)AMLFeaturesConfiguration);
  v20 = sub_235F869D8(v23, v22, (uint64_t)v5, v3, v10, v12, (int)v9, (uint64_t)v14, v16, v18);
  type metadata accessor for AMLFeaturesConfiguration((uint64_t)v20);
  a2[3] = v21;
  *a2 = v20;
}

Swift::Void __swiftcall AMLFeaturesConfiguration.encode(with:)(NSCoder with)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v3 = OUTLINED_FUNCTION_31_1((uint64_t)with.super.isa, sel_bundleIdentifier);
  if (!v3)
  {
    sub_235F9B3FC();
    v3 = (id)OUTLINED_FUNCTION_32_4();
    OUTLINED_FUNCTION_17();
  }
  v4 = (void *)OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3();

  sub_235F88608(v1);
  if (v5)
  {
    OUTLINED_FUNCTION_32_4();
    OUTLINED_FUNCTION_17();
  }
  v6 = (void *)OUTLINED_FUNCTION_21_4();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_8_3();

  v8 = OUTLINED_FUNCTION_31_1(v7, sel_versionId);
  if (!v8)
  {
    sub_235F9B3FC();
    v8 = (id)OUTLINED_FUNCTION_32_4();
    OUTLINED_FUNCTION_17();
  }
  v9 = (void *)OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_3();

  v10 = objc_msgSend(v1, sel_expirationPolicy);
  v11 = (void *)OUTLINED_FUNCTION_3_4();
  -[objc_class encodeInt32:forKey:](with.super.isa, sel_encodeInt32_forKey_, v10, v11);

  v13 = OUTLINED_FUNCTION_31_1(v12, sel_featuresDescription);
  v14 = (void *)OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_2_3();

  v16 = OUTLINED_FUNCTION_31_1(v15, sel_configurationId);
  if (!v16)
  {
    sub_235F9B3FC();
    v16 = (id)sub_235F9B3F0();
    OUTLINED_FUNCTION_20();
  }
  v17 = OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_16_3(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);

  OUTLINED_FUNCTION_13_2(v27);
}

id AMLFeaturesConfiguration.init(coder:)(void *a1)
{
  void *v1;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  unsigned int v61;
  char *v62;
  uint64_t *v63;
  char *v64;
  uint64_t *v65;
  id v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  objc_super v85;
  uint64_t v86;
  uint64_t v87;
  char v88[24];
  uint64_t v89;

  v3 = v1;
  v4 = (void *)OUTLINED_FUNCTION_3_4();
  v5 = OUTLINED_FUNCTION_4_4();

  if (v5)
  {
    sub_235F9B5C4();
    v6 = OUTLINED_FUNCTION_8_3();
  }
  else
  {
    v13 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_10_2(v6, v7, &qword_256399530, v8, v9, v10, v11, v12, v69, v74, v79, v13);
  if (!v89)
  {

    sub_235F729B0((uint64_t)v88, &qword_256399530);
LABEL_32:
    type metadata accessor for AMLFeaturesConfiguration(v67);
    OUTLINED_FUNCTION_22_3();
    return 0;
  }
  if ((OUTLINED_FUNCTION_0_6() & 1) == 0)
  {

    goto LABEL_32;
  }
  v14 = v87;
  v15 = (void *)OUTLINED_FUNCTION_21_4();
  v16 = OUTLINED_FUNCTION_4_4();

  if (v16)
  {
    sub_235F9B5C4();
    v17 = swift_unknownObjectRelease();
  }
  else
  {
    v24 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_10_2(v17, v18, &qword_256399530, v19, v20, v21, v22, v23, v70, v75, v80, v24);
  if ((OUTLINED_FUNCTION_0_6() & 1) == 0)
  {

LABEL_31:
    v67 = OUTLINED_FUNCTION_20();
    goto LABEL_32;
  }
  v25 = v87;
  v84 = v86;
  v26 = (void *)OUTLINED_FUNCTION_6_4();
  v27 = OUTLINED_FUNCTION_4_4();

  if (v27)
  {
    sub_235F9B5C4();
    v28 = swift_unknownObjectRelease();
  }
  else
  {
    v35 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_10_2(v28, v29, &qword_256399530, v30, v31, v32, v33, v34, v71, v76, v81, v35);
  if ((OUTLINED_FUNCTION_0_6() & 1) == 0)
  {

LABEL_30:
    OUTLINED_FUNCTION_17();
    goto LABEL_31;
  }
  v36 = v87;
  v37 = (void *)OUTLINED_FUNCTION_39_2();
  v38 = OUTLINED_FUNCTION_4_4();

  if (v38)
  {
    OUTLINED_FUNCTION_36_4();
    v39 = swift_unknownObjectRelease();
  }
  else
  {
    v46 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_10_2(v39, v40, &qword_256399530, v41, v42, v43, v44, v45, v72, v77, v86, v46);
  type metadata accessor for AMLFeaturesSpecification(v47);
  if ((OUTLINED_FUNCTION_0_6() & 1) == 0)
  {

LABEL_29:
    OUTLINED_FUNCTION_9_1();
    goto LABEL_30;
  }
  v48 = (void *)OUTLINED_FUNCTION_12_4();
  v49 = OUTLINED_FUNCTION_4_4();

  if (v49)
  {
    OUTLINED_FUNCTION_36_4();
    v50 = swift_unknownObjectRelease();
  }
  else
  {
    v57 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_10_2(v50, v51, &qword_256399530, v52, v53, v54, v55, v56, v73, v86, v82, v57);
  if ((OUTLINED_FUNCTION_0_6() & 1) == 0)
  {

    goto LABEL_29;
  }
  v58 = v86;
  v59 = v87;
  v60 = (void *)OUTLINED_FUNCTION_3_4();
  v61 = objc_msgSend(a1, sel_decodeInt32ForKey_, v60);

  v62 = &v3[OBJC_IVAR___AMLFeaturesConfiguration_bundleIdentifier];
  *(_QWORD *)v62 = v86;
  *((_QWORD *)v62 + 1) = v14;
  v63 = (uint64_t *)&v3[OBJC_IVAR___AMLFeaturesConfiguration_modelName];
  *v63 = v84;
  v63[1] = v25;
  v64 = &v3[OBJC_IVAR___AMLFeaturesConfiguration_versionId];
  *(_QWORD *)v64 = v83;
  *((_QWORD *)v64 + 1) = v36;
  *(_DWORD *)&v3[OBJC_IVAR___AMLFeaturesConfiguration_expirationPolicy] = v61;
  *(_QWORD *)&v3[OBJC_IVAR___AMLFeaturesConfiguration_featuresDescription] = v78;
  v65 = (uint64_t *)&v3[OBJC_IVAR___AMLFeaturesConfiguration_configurationId];
  *v65 = v58;
  v65[1] = v59;

  v85.receiver = v3;
  v85.super_class = (Class)AMLFeaturesConfiguration;
  v66 = objc_msgSendSuper2(&v85, sel_init);

  return v66;
}

void AMLFeaturesConfiguration.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

uint64_t sub_235F872C0()
{
  return OUTLINED_FUNCTION_27_3();
}

uint64_t sub_235F87338(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR___AMLFeaturesSpecification_featuresDescription) = a1;
  return OUTLINED_FUNCTION_11_4();
}

id AMLFeaturesSpecification.init(featuresDescription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  objc_super v10;

  *(_QWORD *)(v8 + OBJC_IVAR___AMLFeaturesSpecification_featuresDescription) = a1;
  v10.super_class = (Class)AMLFeaturesSpecification;
  return OUTLINED_FUNCTION_22(a1, sel_init, a3, a4, a5, a6, a7, a8, v10);
}

void __swiftcall AMLFeaturesSpecification.init(featureDictionary:)(AMLFeaturesSpecification *__return_ptr retstr, Swift::OpaquePointer featureDictionary)
{
  id v2;
  uint64_t v3;

  v2 = objc_allocWithZone((Class)OUTLINED_FUNCTION_24_4());
  sub_235F9B3C0();
  v3 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_49_2(v3, sel_initWithFeatureDictionary_);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_24();
}

id AMLFeaturesSpecification.init(featureDictionary:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;
  _QWORD v43[2];
  __int128 v44;
  _BYTE v45[8];
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;

  v2 = MEMORY[0x24BEE4AF8];
  v50 = MEMORY[0x24BEE4AF8];
  sub_235F863C8(a1, &v49);
  v3 = v1;
  OUTLINED_FUNCTION_47_2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10, v25, v27, v29, v31, v33, v34, v35, v36, v37, v38, v39,
    *((uint64_t *)&v39 + 1),
    v40,
    v41,
    (uint64_t)v42.receiver,
    (uint64_t)v42.super_class);
  sub_235F72954((uint64_t)v43, (uint64_t)v45, &qword_256399938);
  v11 = v47;
  if (v47)
  {
    v26 = (uint64_t)v3;
    do
    {
      v12 = v46;
      v37 = v46;
      v38 = v11;
      sub_235F6E7A4(&v48, &v39);
      v43[0] = v12;
      v43[1] = v11;
      sub_235F6E7A4(&v39, &v44);
      OUTLINED_FUNCTION_34_4();
      swift_bridgeObjectRetain();
      if (OUTLINED_FUNCTION_65_0())
        v13 = v28;
      else
        v13 = 0;
      sub_235F727D4(0, &qword_256399650);
      OUTLINED_FUNCTION_34_4();
      v14 = sub_235F8764C(v12, v11, v13, 0, 0);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v33);
      v15 = v14;
      MEMORY[0x23B7E7644]();
      if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_235F9B474();
      sub_235F9B48C();
      sub_235F9B468();

      sub_235F729B0((uint64_t)v43, &qword_256399950);
      OUTLINED_FUNCTION_47_2(v16, v17, v18, v19, v20, v21, v22, v23, v26, v28, v30, v32, v33, v34, v35, v36, v37, v38, v39,
        *((uint64_t *)&v39 + 1),
        v40,
        v41,
        (uint64_t)v42.receiver,
        (uint64_t)v42.super_class);
      sub_235F72954((uint64_t)v43, (uint64_t)v45, &qword_256399938);
      v11 = v47;
    }
    while (v47);
    v2 = v50;
    v3 = (char *)v26;
  }
  sub_235F72990();
  *(_QWORD *)&v3[OBJC_IVAR___AMLFeaturesSpecification_featuresDescription] = v2;

  v42.receiver = v3;
  v42.super_class = (Class)AMLFeaturesSpecification;
  return objc_msgSendSuper2(&v42, sel_init);
}

id sub_235F8764C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  void *v8;
  void *v9;
  id v10;

  v8 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399EB8);
    v9 = (void *)sub_235F9B444();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_featureDescriptionWithName_type_optional_constraints_, v8, a3, a4 & 1, v9);

  return v10;
}

void sub_235F8774C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  type metadata accessor for AMLFeaturesSpecification(a1);
  v4 = v3;
  v5 = OUTLINED_FUNCTION_31_1(v3, sel_featuresDescription);
  OUTLINED_FUNCTION_46_2((uint64_t)v5, &qword_256399650);
  sub_235F9B450();

  _sSo24AMLFeaturesSpecificationC6AeroMLE19featuresDescriptionABSaySo09MLFeatureF0CG_tcfC_0();
  a2[3] = v4;
  *a2 = v6;
}

void _sSo24AMLFeaturesSpecificationC6AeroMLE19featuresDescriptionABSaySo09MLFeatureF0CG_tcfC_0()
{
  id v0;
  uint64_t v1;

  v0 = objc_allocWithZone((Class)OUTLINED_FUNCTION_24_4());
  OUTLINED_FUNCTION_46_2((uint64_t)v0, &qword_256399650);
  sub_235F9B444();
  v1 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_49_2(v1, sel_initWithFeaturesDescription_);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_24();
}

void sub_235F87840(void *a1)
{
  id v2;
  id v3;

  v2 = OUTLINED_FUNCTION_31_1((uint64_t)a1, sel_featuresDescription);
  if (!v2)
  {
    sub_235F727D4(0, &qword_256399650);
    sub_235F9B450();
    v2 = (id)sub_235F9B444();
    OUTLINED_FUNCTION_20();
  }
  v3 = (id)OUTLINED_FUNCTION_23_4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);

}

id AMLFeaturesSpecification.init(coder:)(void *a1)
{
  void *v1;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v3 = v1;
  v4 = (void *)OUTLINED_FUNCTION_23_4();
  v5 = objc_msgSend(a1, sel_decodeObjectForKey_, v4);

  if (v5)
  {
    sub_235F9B5C4();
    v6 = OUTLINED_FUNCTION_8_3();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  OUTLINED_FUNCTION_26_4(v6, v7, &qword_256399530, v8, v9, v10, v11);
  if (!v27)
  {

    OUTLINED_FUNCTION_37_3(v13, &qword_256399530, v14, v15, v16, v17, v18, v19, v22, (uint64_t)v23.receiver);
LABEL_9:
    type metadata accessor for AMLFeaturesSpecification(v20);
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399E08);
  if ((OUTLINED_FUNCTION_65_0() & 1) == 0)
  {

    goto LABEL_9;
  }
  *(_QWORD *)&v3[OBJC_IVAR___AMLFeaturesSpecification_featuresDescription] = v24;

  v23.receiver = v3;
  v23.super_class = (Class)AMLFeaturesSpecification;
  v12 = objc_msgSendSuper2(&v23, sel_init);

  return v12;
}

void AMLFeaturesSpecification.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

void sub_235F87B00()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F87B80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___AMLFeaturesDonationMetadata_sessionId);
  *v3 = a1;
  v3[1] = a2;
  return OUTLINED_FUNCTION_11_4();
}

uint64_t sub_235F87BF8()
{
  return OUTLINED_FUNCTION_27_3();
}

uint64_t sub_235F87C7C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR___AMLFeaturesDonationMetadata_metadata) = a1;
  return OUTLINED_FUNCTION_11_4();
}

void __swiftcall AMLFeaturesDonationMetadata.init(sessionId:metadata:)(AMLFeaturesDonationMetadata *__return_ptr retstr, Swift::String sessionId, Swift::OpaquePointer_optional metadata)
{
  void *rawValue;
  void *v4;
  void *v5;

  rawValue = metadata.value._rawValue;
  v4 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_20();
  if (rawValue)
  {
    v5 = (void *)sub_235F9B3C0();
    OUTLINED_FUNCTION_17();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSessionId_metadata_, v4, v5);

  OUTLINED_FUNCTION_24();
}

id AMLFeaturesDonationMetadata.init(sessionId:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v4 = OBJC_IVAR___AMLFeaturesDonationMetadata_metadata;
  *(_QWORD *)&v3[OBJC_IVAR___AMLFeaturesDonationMetadata_metadata] = 0;
  v5 = &v3[OBJC_IVAR___AMLFeaturesDonationMetadata_sessionId];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  *(_QWORD *)&v3[v4] = a3;
  v6 = swift_bridgeObjectRelease();
  v14.receiver = v3;
  v14.super_class = (Class)AMLFeaturesDonationMetadata;
  return OUTLINED_FUNCTION_22(v6, sel_init, v7, v8, v9, v10, v11, v12, v14);
}

void sub_235F87DF4(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;

  v6 = OUTLINED_FUNCTION_31_1(a1, sel_sessionId);
  sub_235F9B3FC();
  OUTLINED_FUNCTION_44_0();

  sub_235F72838(v2);
  v8 = v7;
  v9 = objc_allocWithZone((Class)AMLFeaturesDonationMetadata);
  v10 = sub_235F98380(v3, v4, v8);
  type metadata accessor for AMLFeaturesDonationMetadata((uint64_t)v10);
  a2[3] = v11;
  *a2 = v10;
}

void sub_235F87E98(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v2 = OUTLINED_FUNCTION_31_1(a1, sel_sessionId);
  if (!v2)
  {
    sub_235F9B3FC();
    v2 = (id)OUTLINED_FUNCTION_32_4();
    OUTLINED_FUNCTION_17();
  }
  v3 = (void *)OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_3();

  sub_235F72838(v1);
  if (v4)
  {
    sub_235F9B3C0();
    OUTLINED_FUNCTION_20();
  }
  v5 = OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_16_3(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_13_2(v15);
}

void _sSo24AMLFeaturesConfigurationC6AeroMLE5coderABSgSo7NSCoderC_tcfC_0()
{
  void *v0;

  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_24_4()), sel_initWithCoder_, v0);

  OUTLINED_FUNCTION_34();
}

char *AMLFeaturesDonationMetadata.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v3 = OBJC_IVAR___AMLFeaturesDonationMetadata_metadata;
  *(_QWORD *)&v1[OBJC_IVAR___AMLFeaturesDonationMetadata_metadata] = 0;
  v4 = v1;
  v5 = (void *)OUTLINED_FUNCTION_6_4();
  v6 = objc_msgSend(a1, sel_decodeObjectForKey_, v5);

  if (v6)
  {
    sub_235F9B5C4();
    v7 = swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_26_4(v7, v8, &qword_256399530, v9, v10, v11, v12);
  if (!v43)
  {

    OUTLINED_FUNCTION_37_3(v29, &qword_256399530, v30, v31, v32, v33, v34, v35, v38, v40);
LABEL_11:

    v36 = swift_bridgeObjectRelease();
    type metadata accessor for AMLFeaturesDonationMetadata(v36);
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((OUTLINED_FUNCTION_65_0() & 1) == 0)
  {

    goto LABEL_11;
  }
  v13 = (void *)OUTLINED_FUNCTION_10_1();
  v14 = objc_msgSend(a1, sel_decodeObjectForKey_, v13);

  if (v14)
  {
    sub_235F9B5C4();
    v15 = swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_26_4(v15, v16, &qword_256399530, v17, v18, v19, v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563997E0);
  if ((OUTLINED_FUNCTION_65_0() & 1) == 0)
  {

    OUTLINED_FUNCTION_17();
    goto LABEL_11;
  }
  v21 = &v4[OBJC_IVAR___AMLFeaturesDonationMetadata_sessionId];
  *(_QWORD *)v21 = v41;
  *((_QWORD *)v21 + 1) = v42;
  *(_QWORD *)&v1[v3] = v41;

  v22 = OUTLINED_FUNCTION_17();
  v39.receiver = v4;
  v39.super_class = (Class)AMLFeaturesDonationMetadata;
  OUTLINED_FUNCTION_22(v22, sel_init, v23, v24, v25, v26, v27, v28, v39);
  OUTLINED_FUNCTION_40_2();
  return v4;
}

id _sSo24AMLFeaturesConfigurationC6AeroMLEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void AMLFeaturesDonationMetadata.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

uint64_t AMLFeaturesConfiguration.description.getter()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _BYTE v11[12];
  unint64_t v12;

  *(_DWORD *)&v11[8] = 0;
  v12 = 0xE000000000000000;
  sub_235F9B5F4();
  v1 = OUTLINED_FUNCTION_14_5();
  v2 = OUTLINED_FUNCTION_28_1(v1, sel_bundleIdentifier);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_45_0();
  sub_235F88608(v0);
  sub_235F9B420();
  OUTLINED_FUNCTION_20();
  v3 = OUTLINED_FUNCTION_45_0();
  v4 = OUTLINED_FUNCTION_28_1(v3, sel_versionId);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_17();
  sub_235F9B420();
  *(_QWORD *)v11 = objc_msgSend(v0, sel_expirationPolicy);
  sub_235F9B6A8();
  sub_235F9B420();
  OUTLINED_FUNCTION_20();
  v5 = OUTLINED_FUNCTION_14_5();
  v6 = OUTLINED_FUNCTION_28_1(v5, sel_featuresDescription);
  v7 = objc_msgSend(v6, sel_description);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_44_0();

  sub_235F9B420();
  OUTLINED_FUNCTION_9_1();
  v8 = OUTLINED_FUNCTION_14_5();
  v9 = OUTLINED_FUNCTION_28_1(v8, sel_configurationId);
  sub_235F9B3FC();

  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_17();
  return *(_QWORD *)&v11[4];
}

id sub_235F884E8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_20();
  return v5;
}

uint64_t AMLFeaturesSpecification.description.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_235F9B5F4();
  v0 = sub_235F9B420();
  v1 = OUTLINED_FUNCTION_28_1(v0, sel_featuresDescription);
  OUTLINED_FUNCTION_46_2((uint64_t)v1, &qword_256399650);
  v3 = v2;
  OUTLINED_FUNCTION_60();
  v4 = sub_235F9B450();

  MEMORY[0x23B7E7668](v4, v3);
  sub_235F9B420();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_27_1();
  return 0;
}

uint64_t sub_235F88608(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_modelName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_235F9B3FC();

  return v3;
}

void type metadata accessor for AMLFeaturesConfiguration(uint64_t a1)
{
  sub_235F727D4(a1, &qword_256399E50);
}

void type metadata accessor for AMLFeaturesSpecification(uint64_t a1)
{
  sub_235F727D4(a1, &qword_256399E80);
}

void type metadata accessor for AMLFeaturesDonationMetadata(uint64_t a1)
{
  sub_235F727D4(a1, &qword_256399EB0);
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_235F9B3F0();
}

id OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, (SEL)(v2 + 3016), v0);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return sub_235F9B3F0();
}

void OUTLINED_FUNCTION_10_2(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  sub_235F72954((uint64_t)va, (uint64_t)va1, a3);
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_235F9B3F0();
}

void OUTLINED_FUNCTION_13_2(id a1)
{

}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  return sub_235F9B420();
}

id OUTLINED_FUNCTION_16_3(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;

  return objc_msgSend(v10, (SEL)(v12 + 328), v11, a1);
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return swift_deallocPartialClassInstance();
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  return swift_getObjCClassFromMetadata();
}

void OUTLINED_FUNCTION_26_4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  sub_235F72954((uint64_t)va, (uint64_t)va1, a3);
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_31_4()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_32_4()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_33_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_34_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_235F6B0A8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_36_4()
{
  return sub_235F9B5C4();
}

void OUTLINED_FUNCTION_37_3(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  sub_235F729B0((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_39_2()
{
  return sub_235F9B3F0();
}

void OUTLINED_FUNCTION_40_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_235F9B420();
}

void OUTLINED_FUNCTION_46_2(uint64_t a1, unint64_t *a2)
{
  sub_235F727D4(0, a2);
}

void OUTLINED_FUNCTION_47_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,...)
{
  va_list va;

  va_start(va, a24);
  sub_235F86404(a1, a3, a4, a5, a6, a7, a8, (uint64_t)va);
}

id OUTLINED_FUNCTION_49_2(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_235F88868()
{
  sub_235F9B5F4();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_17_4();
  sub_235F9B420();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_17_4();
  return 0;
}

uint64_t sub_235F889EC()
{
  uint64_t v0;

  v0 = sub_235F9B384();
  __swift_allocate_value_buffer(v0, qword_25639A858);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A858);
  return sub_235F9B378();
}

uint64_t sub_235F88A6C()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;

  v1 = (id)BiomeLibrary();
  v2 = objc_msgSend(v1, sel_AeroML);
  v3 = OUTLINED_FUNCTION_43_1();
  v4 = OUTLINED_FUNCTION_31_1(v3, sel_RawEvent);
  OUTLINED_FUNCTION_71_2();
  v5 = objc_msgSend(v1, sel_PhotosSearchSession);
  OUTLINED_FUNCTION_43_1();
  return v0;
}

id sub_235F88AE4()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;

  v0 = (id)BiomeLibrary();
  v1 = objc_msgSend(v0, sel_Photos);
  v2 = OUTLINED_FUNCTION_43_1();
  v3 = OUTLINED_FUNCTION_31_1(v2, sel_Search);
  OUTLINED_FUNCTION_71_2();
  return v0;
}

void sub_235F88B40(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v2)
  {
    oslog = v2;
    -[NSObject logMessage:](v2, sel_logMessage_, a1);
  }
  else
  {
    if (qword_256399440 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_19_1();
    oslog = OUTLINED_FUNCTION_177(v3, (uint64_t)qword_25639A858);
    v4 = sub_235F9B51C();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      *(_WORD *)v5 = 0;
      OUTLINED_FUNCTION_125(&dword_235F59000, oslog, v4, "AMLPhotosSearchBiomeMetrics: Unable to get PETEventTracker2", v5);
      OUTLINED_FUNCTION_8_0();
    }
  }
  OUTLINED_FUNCTION_32_5(oslog);
}

char *sub_235F88C28(int a1, unsigned int a2)
{
  return sub_235F88C38(a1, 0, 0, a2);
}

char *sub_235F88C38(int a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  char *v46;
  void (*v47)(char *, uint64_t, id *);
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  unint64_t v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  char *result;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  void *v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  __int128 v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  double v83;
  id v84;
  id v85;
  id v86;
  id v87;
  double v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  unint64_t v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  id v122;
  id v123;
  uint64_t v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  __n128 v133;
  uint64_t v134;
  id v135;
  __n128 v136;
  uint64_t v137;
  double v138;
  double v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  double v152;
  uint64_t v153;
  id v154;
  unint64_t v155;
  uint64_t v156;
  char *v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  NSObject *v161;
  os_log_type_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  unint64_t v169;
  const char *v170;
  unint64_t v171;
  char *v172;
  double v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  __int128 v177;
  char *v178;
  uint64_t v179;
  id *v180;
  uint64_t v181;
  void (*v182)(char *, id *);
  uint64_t v183;
  id v184;
  uint64_t v185;
  id v186;
  char *v187;
  uint64_t v188;
  int v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unsigned int v193;
  char *v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  __int128 v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;

  v193 = a4;
  v191 = a3;
  v190 = a2;
  v189 = a1;
  v6 = sub_235F9B06C();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v6 - 8));
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v167 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (id *)OUTLINED_FUNCTION_0_0();
  v11 = (uint64_t)*(v10 - 1);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_87_0();
  v14 = v12 - v13;
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_14_2();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v167 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_81_0(v20, v21, v22, v23, v24, v25, v26, v27, v167);
  v201 = MEMORY[0x24BEE4AF8];
  v186 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AMLPhotosSearchHelpers()), sel_init);
  v28 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  sub_235F90484(v28);
  v30 = MEMORY[0x24BEE4AD8];
  if (v31)
  {
    v32 = v29;
    v196 = v11;
    v33 = v14;
    if (qword_256399440 != -1)
LABEL_80:
      swift_once();
    v34 = OUTLINED_FUNCTION_19_1();
    v35 = __swift_project_value_buffer(v34, (uint64_t)qword_25639A858);
    OUTLINED_FUNCTION_18_2();
    sub_235F9B36C();
    v36 = OUTLINED_FUNCTION_132_0();
    if (OUTLINED_FUNCTION_111_0(v35))
    {
      v179 = v6;
      v37 = OUTLINED_FUNCTION_23_0();
      v178 = v9;
      v38 = (uint8_t *)v37;
      v39 = OUTLINED_FUNCTION_23_0();
      v180 = v10;
      *(_QWORD *)&v199 = v39;
      *(_DWORD *)v38 = 136315138;
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_76_1((uint64_t)v32, v40, (uint64_t *)&v199);
      v197 = v41;
      sub_235F9B5AC();
      OUTLINED_FUNCTION_241();
      OUTLINED_FUNCTION_52_1(&dword_235F59000, v35, v36, "AMLPhotosSearchBiomeMetrics: Perform photos client data payload upload to PET. Incoming: %s", v38);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_62_0();
    v14 = v33;
    v11 = v196;
  }
  else
  {
    if (qword_256399440 != -1)
      swift_once();
    v42 = OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_177(v42, (uint64_t)qword_25639A858);
    v43 = OUTLINED_FUNCTION_132_0();
    if (OUTLINED_FUNCTION_103_0(v43))
    {
      v44 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      *(_WORD *)v44 = 0;
      OUTLINED_FUNCTION_125(&dword_235F59000, v4, v5, "AMLPhotosSearchBiomeMetrics: Missing incoming bundleId while performing photos client data upload to PET", v44);
      OUTLINED_FUNCTION_8_0();
    }

  }
  sub_235F9B180();
  v45 = v185;
  sub_235F9B138();
  v182 = *(void (**)(char *, id *))(v11 + 8);
  v182(v19, v10);
  v46 = v187;
  OUTLINED_FUNCTION_179();
  v47 = *(void (**)(char *, uint64_t, id *))(v11 + 16);
  v47(v19, v45, v10);
  v47((char *)v14, (uint64_t)v46, v10);
  sub_235F9B054();
  v48 = (void *)sub_235F88A6C();
  sub_235F99070();
  v50 = v49;

  v51 = sub_235F88AE4();
  sub_235F992A4();
  v53 = v52;

  v54 = *(_QWORD *)(v50 + 16);
  if (!v54 || !*(_QWORD *)(v53 + 16))
  {
    swift_bridgeObjectRelease();
    if (qword_256399440 != -1)
      swift_once();
    v160 = OUTLINED_FUNCTION_19_1();
    v161 = __swift_project_value_buffer(v160, (uint64_t)qword_25639A858);
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_18_2();
    sub_235F9B36C();
    v162 = OUTLINED_FUNCTION_132_0();
    if (OUTLINED_FUNCTION_98_0(v162))
    {
      v163 = v53;
      v164 = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v164 = 134218240;
      OUTLINED_FUNCTION_27_1();
      *(_QWORD *)&v199 = v54;
      sub_235F9B5AC();
      OUTLINED_FUNCTION_27_1();
      *(_WORD *)(v164 + 12) = 2048;
      v165 = *(_QWORD *)(v163 + 16);
      OUTLINED_FUNCTION_111();
      *(_QWORD *)&v199 = v165;
      sub_235F9B5AC();
      OUTLINED_FUNCTION_111();
      OUTLINED_FUNCTION_154(&dword_235F59000, v161, (os_log_type_t)v51, "AMLPhotosSearchBiomeMetrics: Unable to send data to PET; biome streams: raw search %ld or feedback stream %ld are empty",
        (uint8_t *)v164);
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_63_0((uint64_t)&v203);
    OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_62_0();
    (*(void (**)(char *, uint64_t))(v183 + 8))(v9, v6);
    OUTLINED_FUNCTION_108_0((uint64_t)&v204);
    v166 = 0;
LABEL_75:
    OUTLINED_FUNCTION_108_0((uint64_t)&v202);
    return (char *)v166;
  }
  v178 = v9;
  v179 = v6;
  v180 = v10;
  v181 = sub_235F8CC20(v50, v53);
  OUTLINED_FUNCTION_27_1();
  v196 = *(_QWORD *)(v53 + 16);
  v188 = v53;
  if (!v196)
  {
    OUTLINED_FUNCTION_18_2();
LABEL_74:
    OUTLINED_FUNCTION_77_2();
    OUTLINED_FUNCTION_63_0((uint64_t)&v203);
    OUTLINED_FUNCTION_62_0();
    (*(void (**)(char *, uint64_t))(v183 + 8))(v178, v179);
    v182(v187, v180);
    v166 = v201;
    goto LABEL_75;
  }
  OUTLINED_FUNCTION_18_2();
  v6 = 0;
  v10 = (id *)(v53 + 40);
  v177 = xmmword_235F9D690;
  OUTLINED_FUNCTION_27_0();
  v176 = v55;
  OUTLINED_FUNCTION_27_0();
  v175 = v56;
  v174 = v30 + 8;
  v57 = -1.0;
  v172 = "Metrics.poirotRecipe";
  v171 = 0x8000000235F9F860;
  v170 = "com.apple.mobileslideshow";
  v169 = 0x8000000235F9F880;
  v168 = "com.apple.Spotlight";
  v167 = 0x8000000235F9F8A0;
  v30 = v193;
  while (1)
  {
    v58 = (unint64_t)*(v10 - 1);
    v32 = *v10;
    sub_235F8B53C();
    v60 = v59;
    v62 = v61;
    result = (char *)objc_msgSend(objc_allocWithZone((Class)AMLPhotosSearchLabeledData), sel_init);
    if (!result)
      break;
    v9 = result;
    objc_msgSend(result, sel_setUiSurface_, 0);
    if (v62)
    {
      v64 = v62;
      sub_235F90650(v32, (SEL *)&selRef_identifier);
      if (!v66)
        goto LABEL_60;
      v67 = v65;
      v33 = v66;
      v68 = v60;
      v69 = (void *)objc_opt_self();
      v194 = v64;
      v19 = (char *)sub_235F9B3F0();
      v70 = objc_msgSend(v69, sel_clientDonationForPhotoId_aroundTime_, v19, v68);

      v195 = v70;
      if (!v70)
        goto LABEL_55;
      v192 = v67;
      v72 = v70;
      v73 = objc_msgSend(v72, sel_featureProvider);
      if (!v73)
        goto LABEL_50;
      v74 = v73;
      v184 = v73;
      if ((v30 & 1) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
        v19 = (char *)OUTLINED_FUNCTION_1();
        *((_OWORD *)v19 + 1) = v177;
        *(_QWORD *)&v199 = 0;
        *((_QWORD *)&v199 + 1) = 0xE000000000000000;
        sub_235F9B5F4();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v199 = 0x203A7865646E49;
        *((_QWORD *)&v199 + 1) = 0xE700000000000000;
        v197 = v6;
        sub_235F9B6A8();
        sub_235F9B420();
        OUTLINED_FUNCTION_111();
        v75 = sub_235F9B420();
        v76 = OUTLINED_FUNCTION_36_0(v75, sel_description);
        v30 = sub_235F9B3FC();

        sub_235F9B420();
        v74 = v184;
        swift_bridgeObjectRelease();
        v77 = v199;
        *((_QWORD *)v19 + 7) = MEMORY[0x24BEE0D00];
        *((_OWORD *)v19 + 2) = v77;
        OUTLINED_FUNCTION_12_2();
        OUTLINED_FUNCTION_20();
      }
      sub_235F90598(v192, v33, v9);
      v78 = objc_msgSend((id)objc_opt_self(), sel_photosSearchDataMetricsForFeatureProvider_, v74);
      if (v78)
      {
        v79 = v78;
        v80 = OUTLINED_FUNCTION_6((uint64_t)objc_msgSend(v78, sel_L1Score), sel_setL1Score_);
        v81 = OUTLINED_FUNCTION_31_1((uint64_t)v80, sel_freshness);
        v82 = OUTLINED_FUNCTION_6((uint64_t)v81, sel_setFreshness_);
        OUTLINED_FUNCTION_31_1((uint64_t)v82, sel_photosFavorited);
        v84 = OUTLINED_FUNCTION_31_1((uint64_t)objc_msgSend(v9, sel_setFavorited_, v83 > 0.0), sel_aestheticScore);
        v85 = OUTLINED_FUNCTION_6((uint64_t)v84, sel_setAestheticScore_);
        v86 = OUTLINED_FUNCTION_31_1((uint64_t)v85, sel_curationScore);
        v87 = OUTLINED_FUNCTION_6((uint64_t)v86, sel_setCurationScore_);
        OUTLINED_FUNCTION_31_1((uint64_t)v87, sel_matchedFieldsCount);
        if ((~*(_QWORD *)&v88 & 0x7FF0000000000000) == 0)
          goto LABEL_77;
        if (v88 <= v57)
          goto LABEL_78;
        if (v88 >= 4294967300.0)
          goto LABEL_79;
        v89 = OUTLINED_FUNCTION_31_1((uint64_t)objc_msgSend(v9, sel_setMatchedFieldsCount_, v88), sel_matchedPeopleRatio);
        v90 = OUTLINED_FUNCTION_6((uint64_t)v89, sel_setMatchedPeopleRatio_);
        v91 = OUTLINED_FUNCTION_31_1((uint64_t)v90, sel_matchedLocationRatio);
        v92 = OUTLINED_FUNCTION_6((uint64_t)v91, sel_setMatchedLocationRatio_);
        v93 = OUTLINED_FUNCTION_31_1((uint64_t)v92, sel_matchedSceneSynonymRatio);
        v94 = OUTLINED_FUNCTION_6((uint64_t)v93, sel_setMatchedSceneRatio_);
        v95 = OUTLINED_FUNCTION_31_1((uint64_t)v94, sel_matchedOCRCharacterMatchRatio);
        v96 = OUTLINED_FUNCTION_6((uint64_t)v95, sel_setMatchedOCRCharacterRatio_);
        v97 = OUTLINED_FUNCTION_31_1((uint64_t)v96, sel_matchedSceneConfidence);
        v98 = OUTLINED_FUNCTION_6((uint64_t)v97, sel_setMatchedSceneConfidence_);
        v99 = OUTLINED_FUNCTION_31_1((uint64_t)v98, sel_matchedSceneBoundingBox);
        v100 = OUTLINED_FUNCTION_6((uint64_t)v99, sel_setMatchedSceneBoundingBox_);
        v101 = OUTLINED_FUNCTION_31_1((uint64_t)v100, sel_matchedOCRImportance);
        OUTLINED_FUNCTION_6((uint64_t)v101, sel_setMatchedOCRImportance_);

      }
      v102 = OUTLINED_FUNCTION_36_0((uint64_t)v78, sel_metadata);
      if (v102)
      {
        v103 = v102;
        sub_235F72838(v102);
        if (!v104)
          goto LABEL_42;
        v105 = v104;
        OUTLINED_FUNCTION_84_0();
        sub_235F73174(v105, &v199);
        OUTLINED_FUNCTION_20();
        if (!v200)
        {

          v102 = (id)sub_235F6D3D8((uint64_t)&v199);
          goto LABEL_43;
        }
        if ((swift_dynamicCast() & 1) == 0)
          goto LABEL_42;
        v106 = v198;
        OUTLINED_FUNCTION_84_0();
        if (*(_QWORD *)&v107 == v108 + 8 && v106 == v171 || (v173 = v107, (OUTLINED_FUNCTION_31_2() & 1) != 0))
        {
          swift_bridgeObjectRelease();
          objc_msgSend(v9, sel_setUiSurface_, 2, v167, v168);
          goto LABEL_42;
        }
        OUTLINED_FUNCTION_84_0();
        if (*(_QWORD *)&v173 == v109 + 2 && v106 == v169
          || (OUTLINED_FUNCTION_31_2() & 1) != 0
          || (OUTLINED_FUNCTION_84_0(), *(_QWORD *)&v173 == v159) && v106 == v167)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          LODWORD(v173) = OUTLINED_FUNCTION_31_2();
          OUTLINED_FUNCTION_20();
          if ((LOBYTE(v173) & 1) == 0)
          {
LABEL_42:

            goto LABEL_43;
          }
        }
        objc_msgSend(v9, sel_setUiSurface_, 1, v167, v168);
        goto LABEL_42;
      }
LABEL_43:
      result = (char *)OUTLINED_FUNCTION_36_0((uint64_t)v102, sel_metadata);
      if (!result)
        goto LABEL_82;
      result = (char *)sub_235F905DC(result);
      if (!result)
        goto LABEL_83;
      v19 = result;
      v110 = sub_235F8F1D4((uint64_t)result);
      OUTLINED_FUNCTION_20();
      if (!v110[2])
      {
        __break(1u);
LABEL_77:
        __break(1u);
LABEL_78:
        __break(1u);
LABEL_79:
        __break(1u);
        goto LABEL_80;
      }
      OUTLINED_FUNCTION_34_2();
      OUTLINED_FUNCTION_128_0();
      v111 = OUTLINED_FUNCTION_291();
      v113 = sub_235F731F8(v111, v112, v181);
      OUTLINED_FUNCTION_25();
      if (v113)
      {
        if (*(_QWORD *)(v113 + 16))
        {
          v114 = sub_235F7F384();
          if ((v115 & 1) != 0)
          {
            v116 = *(_QWORD *)(v113 + 56) + (v114 << 6);
            v117 = *(double *)(v116 + 8);
            v118 = *(double *)(v116 + 32);
            v119 = *(double *)(v116 + 40);
            v120 = *(double *)(v116 + 48);
            v173 = *(double *)(v116 + 56);
            OUTLINED_FUNCTION_20();
            OUTLINED_FUNCTION_35();
            v121 = v117;
            v57 = -1.0;
            v122 = OUTLINED_FUNCTION_149_0((uint64_t)objc_msgSend(v9, sel_setHasEverClickInLastMonth_, v121), sel_setClickCountInLastMonthNormalizedAcrossItems_);
            v123 = OUTLINED_FUNCTION_148_0((uint64_t)v122, sel_setHasEverClickInLastWeek_);
            OUTLINED_FUNCTION_149_0((uint64_t)v123, sel_setClickCountInLastWeekNormalizedAcrossItems_);
            objc_msgSend(v9, sel_setClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems_, v119);
            objc_msgSend(v9, sel_setClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems_, v118);
            objc_msgSend(v9, sel_setClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems_, v120);
            objc_msgSend(v9, sel_setClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems_, v173);
            OUTLINED_FUNCTION_54_2();
LABEL_50:

          }
          else
          {
            OUTLINED_FUNCTION_54_2();

            OUTLINED_FUNCTION_20();
            v71 = OUTLINED_FUNCTION_35();
          }
          v67 = v192;
LABEL_55:
          v124 = v67;
          v125 = OUTLINED_FUNCTION_5_4(v71, sel_setClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems_);
          v126 = OUTLINED_FUNCTION_5_4((uint64_t)v125, sel_setClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems_);
          v127 = OUTLINED_FUNCTION_5_4((uint64_t)v126, sel_setClickCountGivenLocationInLastMonthNormalizedAcrossItems_);
          v128 = OUTLINED_FUNCTION_5_4((uint64_t)v127, sel_setClickCountGivenLocationInLastWeekNormalizedAcrossItems_);
          v129 = OUTLINED_FUNCTION_5_4((uint64_t)v128, sel_setClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems_);
          v130 = OUTLINED_FUNCTION_5_4((uint64_t)v129, sel_setClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems_);
          v131 = OUTLINED_FUNCTION_5_4((uint64_t)v130, sel_setClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems_);
          v132 = OUTLINED_FUNCTION_5_4((uint64_t)v131, sel_setClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems_);
          OUTLINED_FUNCTION_5_4((uint64_t)v132, sel_setClipScore_);
          v133.n128_u64[0] = v58;
          v134 = sub_235F8B2CC(v133);
          v135 = OUTLINED_FUNCTION_6(v134, sel_setHasEverShareInLastMonth_);
          OUTLINED_FUNCTION_148_0((uint64_t)v135, sel_setShareCountInLastMonthNormalizedAcrossItems_);
          v136.n128_u64[0] = v58;
          v137 = sub_235F8B2D8(v136);
          v139 = v138;
          OUTLINED_FUNCTION_6(v137, sel_setHasEverShareInLastMonth_);
          v140 = OUTLINED_FUNCTION_5_4((uint64_t)objc_msgSend(v9, sel_setShareCountInLastWeekNormalizedAcrossItems_, v139), sel_setIsCompleteMatch_);
          v141 = OUTLINED_FUNCTION_5_4((uint64_t)v140, sel_setIsDuplicate_);
          v142 = OUTLINED_FUNCTION_5_4((uint64_t)v141, sel_setL2ModelScore_);
          v143 = OUTLINED_FUNCTION_5_4((uint64_t)v142, sel_setShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems_);
          v144 = OUTLINED_FUNCTION_5_4((uint64_t)v143, sel_setShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems_);
          v145 = OUTLINED_FUNCTION_5_4((uint64_t)v144, sel_setShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems_);
          v146 = OUTLINED_FUNCTION_5_4((uint64_t)v145, sel_setShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems_);
          v147 = OUTLINED_FUNCTION_5_4((uint64_t)v146, sel_setShareCountGivenLocationInLastMonthNormalizedAcrossItems_);
          v148 = OUTLINED_FUNCTION_5_4((uint64_t)v147, sel_setShareCountGivenLocationInLastWeekNormalizedAcrossItems_);
          v149 = OUTLINED_FUNCTION_5_4((uint64_t)v148, sel_setShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems_);
          v150 = OUTLINED_FUNCTION_5_4((uint64_t)v149, sel_setShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems_);
          v151 = OUTLINED_FUNCTION_5_4((uint64_t)v150, sel_setShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems_);
          OUTLINED_FUNCTION_5_4((uint64_t)v151, sel_setShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems_);
          v64 = v194;
          sub_235F8AD48(v32, v188, v64, v152, v68);

          OUTLINED_FUNCTION_147_0(v153, sel_setClickOrder_);
          v154 = objc_msgSend(v64, sel_presentedAssets);
          sub_235F6B254(0, (unint64_t *)&qword_256399EC8);
          v155 = OUTLINED_FUNCTION_58_2();

          sub_235F8B188(v124, v33, v155);
          OUTLINED_FUNCTION_25();
          v156 = OUTLINED_FUNCTION_27_1();
          OUTLINED_FUNCTION_147_0(v156, sel_setItemPosition_);
          if ((v189 & 1) != 0)
            sub_235F88B40((uint64_t)v9);
          v157 = v9;
          MEMORY[0x23B7E7644]();
          v158 = *(_QWORD *)((v201 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (*(_QWORD *)((v201 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v158 >> 1)
          {
            OUTLINED_FUNCTION_142_0(v158);
            sub_235F9B474();
          }
          sub_235F9B48C();
          sub_235F9B468();

          v9 = v64;
          v32 = v195;
          v30 = v193;
LABEL_60:

          v32 = v64;
          v9 = v64;
          goto LABEL_61;
        }
        OUTLINED_FUNCTION_54_2();

        OUTLINED_FUNCTION_20();
        v71 = OUTLINED_FUNCTION_35();
      }
      else
      {
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_54_2();

      }
      v67 = v192;
      goto LABEL_55;
    }
LABEL_61:
    ++v6;

    v10 += 2;
    if (v196 == v6)
      goto LABEL_74;
  }
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
  return result;
}

void sub_235F89D58()
{
  id *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  int v82;
  char v83;
  void *v84;
  unint64_t v85;
  uint64_t v86;
  id *v87;
  unsigned int v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  id v137;

  OUTLINED_FUNCTION_36_2();
  if (v0)
  {
    v1 = (unint64_t)v0;
    if ((unint64_t)v0 >> 62)
    {
      OUTLINED_FUNCTION_58_0();
      v3 = sub_235F9B654();
      v2 = v3;
      if (v3)
        goto LABEL_4;
    }
    else
    {
      v2 = *(_QWORD *)(((unint64_t)v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v3 = OUTLINED_FUNCTION_58_0();
      if (v2)
      {
LABEL_4:
        OUTLINED_FUNCTION_91_0(v3, (unint64_t *)&qword_256399FD0);
        if (v2 < 1)
        {
          __break(1u);
          JUMPOUT(0x235F8A78CLL);
        }
        v4 = 0;
        v85 = v1 & 0xC000000000000001;
        v86 = v2;
        v87 = (id *)v1;
        do
        {
          if (v85)
            v5 = (id)MEMORY[0x23B7E7818](v4, v1);
          else
            v5 = *(id *)(v1 + 8 * v4 + 32);
          v6 = v5;
          v7 = (id)BiomeLibrary();
          v8 = objc_msgSend(v7, sel_AeroML);
          v9 = OUTLINED_FUNCTION_43_1();
          v10 = OUTLINED_FUNCTION_31_1(v9, sel_LabeledData);
          OUTLINED_FUNCTION_71_2();
          v11 = objc_msgSend(v7, sel_PhotosSearchLabeledData);
          v12 = OUTLINED_FUNCTION_43_1();
          v137 = OUTLINED_FUNCTION_31_1(v12, sel_source);

          v14 = OUTLINED_FUNCTION_40_0(v13, sel_uiSurface);
          switch((int)v14)
          {
            case 0:
              v15 = CFSTR("AMLUISurfaceTypeUnknown");
              goto LABEL_15;
            case 1:
              v15 = CFSTR("AMLUISurfaceTypeSpotlight");
              goto LABEL_15;
            case 2:
              v15 = CFSTR("AMLUISurfaceTypePhotosApp");
              goto LABEL_15;
            case 3:
              v15 = CFSTR("AMLUISurfaceTypeStoryTellingBackground");
LABEL_15:
              v17 = v15;
              v16 = v15;
              break;
            default:
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              break;
          }
          v18 = v16;
          if (v18)
          {
            v19 = v18;
            v20 = sub_235F9B3FC();
            v22 = v21;

            if (v20 == 0xD000000000000017 && v22 == 0x8000000235FA05B0 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              if (v20 == 0xD000000000000019 && v22 == 0x8000000235FA05D0 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v82 = 1;
                goto LABEL_28;
              }
              if (v20 == 0xD000000000000019 && v22 == 0x8000000235FA05F0 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v82 = 2;
                goto LABEL_28;
              }
              if (v20 == 0xD000000000000026 && v22 == 0x8000000235FA0610)
              {
                swift_bridgeObjectRelease();
LABEL_37:
                v82 = 3;
LABEL_28:
                v88 = v82;
                goto LABEL_22;
              }
              v83 = OUTLINED_FUNCTION_31_2();
              OUTLINED_FUNCTION_27_1();
              if ((v83 & 1) != 0)
                goto LABEL_37;
            }
          }
          v88 = 0;
LABEL_22:
          sub_235F90650(v6, (SEL *)&selRef_searchSessionUUID);
          v135 = v24;
          v136 = v23;
          OUTLINED_FUNCTION_40_0(v23, sel_matchedPeopleRatio);
          v25 = OUTLINED_FUNCTION_1_4();
          v134 = OUTLINED_FUNCTION_0_7(v25);
          OUTLINED_FUNCTION_40_0((uint64_t)v134, sel_matchedLocationRatio);
          v26 = OUTLINED_FUNCTION_1_4();
          v133 = OUTLINED_FUNCTION_0_7(v26);
          OUTLINED_FUNCTION_40_0((uint64_t)v133, sel_matchedSceneRatio);
          v27 = OUTLINED_FUNCTION_1_4();
          v132 = OUTLINED_FUNCTION_0_7(v27);
          OUTLINED_FUNCTION_40_0((uint64_t)v132, sel_matchedSceneConfidence);
          v28 = OUTLINED_FUNCTION_1_4();
          v131 = OUTLINED_FUNCTION_0_7(v28);
          OUTLINED_FUNCTION_40_0((uint64_t)v131, sel_matchedSceneBoundingBox);
          v29 = OUTLINED_FUNCTION_1_4();
          v130 = OUTLINED_FUNCTION_0_7(v29);
          OUTLINED_FUNCTION_40_0((uint64_t)v130, sel_matchedOCRCharacterRatio);
          v30 = OUTLINED_FUNCTION_1_4();
          v129 = OUTLINED_FUNCTION_0_7(v30);
          OUTLINED_FUNCTION_40_0((uint64_t)v129, sel_matchedOCRImportance);
          v31 = OUTLINED_FUNCTION_1_4();
          v128 = OUTLINED_FUNCTION_0_7(v31);
          v32 = OUTLINED_FUNCTION_40_0((uint64_t)v128, sel_matchedFieldsCount);
          v127 = objc_msgSend(OUTLINED_FUNCTION_3_5(), sel_initWithUnsignedInt_, v32);
          OUTLINED_FUNCTION_40_0((uint64_t)v127, sel_clipScore);
          v33 = OUTLINED_FUNCTION_1_4();
          v126 = OUTLINED_FUNCTION_0_7(v33);
          OUTLINED_FUNCTION_40_0((uint64_t)v126, sel_freshness);
          v34 = OUTLINED_FUNCTION_1_4();
          v125 = OUTLINED_FUNCTION_0_7(v34);
          OUTLINED_FUNCTION_40_0((uint64_t)v125, sel_favorited);
          v35 = OUTLINED_FUNCTION_3_5();
          v124 = OUTLINED_FUNCTION_117(v35);
          OUTLINED_FUNCTION_40_0((uint64_t)v124, sel_aestheticScore);
          v36 = OUTLINED_FUNCTION_1_4();
          v123 = OUTLINED_FUNCTION_0_7(v36);
          OUTLINED_FUNCTION_40_0((uint64_t)v123, sel_curationScore);
          v37 = OUTLINED_FUNCTION_1_4();
          v122 = OUTLINED_FUNCTION_0_7(v37);
          OUTLINED_FUNCTION_40_0((uint64_t)v122, sel_hasEverClickInLastWeek);
          v38 = OUTLINED_FUNCTION_1_4();
          v121 = OUTLINED_FUNCTION_0_7(v38);
          OUTLINED_FUNCTION_40_0((uint64_t)v121, sel_hasEverClickInLastMonth);
          v39 = OUTLINED_FUNCTION_1_4();
          v120 = OUTLINED_FUNCTION_0_7(v39);
          OUTLINED_FUNCTION_40_0((uint64_t)v120, sel_hasEverShareInLastWeek);
          v40 = OUTLINED_FUNCTION_1_4();
          v119 = OUTLINED_FUNCTION_0_7(v40);
          OUTLINED_FUNCTION_40_0((uint64_t)v119, sel_hasEverShareInLastMonth);
          v41 = OUTLINED_FUNCTION_1_4();
          v118 = OUTLINED_FUNCTION_0_7(v41);
          OUTLINED_FUNCTION_40_0((uint64_t)v118, sel_clickCountInLastWeekNormalizedAcrossItems);
          v42 = OUTLINED_FUNCTION_1_4();
          v117 = OUTLINED_FUNCTION_0_7(v42);
          OUTLINED_FUNCTION_40_0((uint64_t)v117, sel_clickCountInLastMonthNormalizedAcrossItems);
          v43 = OUTLINED_FUNCTION_1_4();
          v116 = OUTLINED_FUNCTION_0_7(v43);
          OUTLINED_FUNCTION_40_0((uint64_t)v116, sel_shareCountInLastWeekNormalizedAcrossItems);
          v44 = OUTLINED_FUNCTION_1_4();
          v115 = OUTLINED_FUNCTION_0_7(v44);
          OUTLINED_FUNCTION_40_0((uint64_t)v115, sel_shareCountInLastMonthNormalizedAcrossItems);
          v45 = OUTLINED_FUNCTION_1_4();
          v114 = OUTLINED_FUNCTION_0_7(v45);
          OUTLINED_FUNCTION_40_0((uint64_t)v114, sel_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems);
          v46 = OUTLINED_FUNCTION_1_4();
          v113 = OUTLINED_FUNCTION_0_7(v46);
          OUTLINED_FUNCTION_40_0((uint64_t)v113, sel_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems);
          v47 = OUTLINED_FUNCTION_1_4();
          v112 = OUTLINED_FUNCTION_0_7(v47);
          OUTLINED_FUNCTION_40_0((uint64_t)v112, sel_clickCountGivenLocationInLastWeekNormalizedAcrossItems);
          v48 = OUTLINED_FUNCTION_1_4();
          v111 = OUTLINED_FUNCTION_0_7(v48);
          OUTLINED_FUNCTION_40_0((uint64_t)v111, sel_clickCountGivenLocationInLastMonthNormalizedAcrossItems);
          v49 = OUTLINED_FUNCTION_1_4();
          v110 = OUTLINED_FUNCTION_0_7(v49);
          OUTLINED_FUNCTION_40_0((uint64_t)v110, sel_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems);
          v50 = OUTLINED_FUNCTION_1_4();
          v109 = OUTLINED_FUNCTION_0_7(v50);
          OUTLINED_FUNCTION_40_0((uint64_t)v109, sel_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems);
          v51 = OUTLINED_FUNCTION_1_4();
          v108 = OUTLINED_FUNCTION_0_7(v51);
          OUTLINED_FUNCTION_40_0((uint64_t)v108, sel_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems);
          v52 = OUTLINED_FUNCTION_1_4();
          v107 = OUTLINED_FUNCTION_0_7(v52);
          OUTLINED_FUNCTION_40_0((uint64_t)v107, sel_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems);
          v53 = OUTLINED_FUNCTION_1_4();
          v106 = OUTLINED_FUNCTION_0_7(v53);
          OUTLINED_FUNCTION_40_0((uint64_t)v106, sel_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems);
          v54 = OUTLINED_FUNCTION_1_4();
          v105 = OUTLINED_FUNCTION_0_7(v54);
          OUTLINED_FUNCTION_40_0((uint64_t)v105, sel_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems);
          v55 = OUTLINED_FUNCTION_1_4();
          v104 = OUTLINED_FUNCTION_0_7(v55);
          OUTLINED_FUNCTION_40_0((uint64_t)v104, sel_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems);
          v56 = OUTLINED_FUNCTION_1_4();
          v103 = OUTLINED_FUNCTION_0_7(v56);
          OUTLINED_FUNCTION_40_0((uint64_t)v103, sel_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems);
          v57 = OUTLINED_FUNCTION_1_4();
          v102 = OUTLINED_FUNCTION_0_7(v57);
          OUTLINED_FUNCTION_40_0((uint64_t)v102, sel_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems);
          v58 = OUTLINED_FUNCTION_1_4();
          v101 = OUTLINED_FUNCTION_0_7(v58);
          OUTLINED_FUNCTION_40_0((uint64_t)v101, sel_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems);
          v59 = OUTLINED_FUNCTION_1_4();
          v100 = OUTLINED_FUNCTION_0_7(v59);
          OUTLINED_FUNCTION_40_0((uint64_t)v100, sel_shareCountGivenLocationInLastWeekNormalizedAcrossItems);
          v60 = OUTLINED_FUNCTION_1_4();
          v99 = OUTLINED_FUNCTION_0_7(v60);
          OUTLINED_FUNCTION_40_0((uint64_t)v99, sel_shareCountGivenLocationInLastMonthNormalizedAcrossItems);
          v61 = OUTLINED_FUNCTION_1_4();
          v98 = OUTLINED_FUNCTION_0_7(v61);
          OUTLINED_FUNCTION_40_0((uint64_t)v98, sel_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems);
          v62 = OUTLINED_FUNCTION_1_4();
          v97 = OUTLINED_FUNCTION_0_7(v62);
          OUTLINED_FUNCTION_40_0((uint64_t)v97, sel_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems);
          v63 = OUTLINED_FUNCTION_1_4();
          v96 = OUTLINED_FUNCTION_0_7(v63);
          v95 = (void *)sub_235F9B588();
          v94 = (void *)sub_235F9B588();
          OUTLINED_FUNCTION_40_0((uint64_t)v94, sel_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems);
          v64 = OUTLINED_FUNCTION_1_4();
          v93 = OUTLINED_FUNCTION_0_7(v64);
          OUTLINED_FUNCTION_40_0((uint64_t)v93, sel_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems);
          v65 = OUTLINED_FUNCTION_1_4();
          v92 = OUTLINED_FUNCTION_0_7(v65);
          OUTLINED_FUNCTION_40_0((uint64_t)v92, sel_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems);
          v66 = OUTLINED_FUNCTION_1_4();
          v91 = OUTLINED_FUNCTION_0_7(v66);
          OUTLINED_FUNCTION_40_0((uint64_t)v91, sel_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems);
          v67 = OUTLINED_FUNCTION_1_4();
          v90 = OUTLINED_FUNCTION_0_7(v67);
          OUTLINED_FUNCTION_40_0((uint64_t)v90, sel_clipScore);
          v68 = OUTLINED_FUNCTION_1_4();
          v89 = OUTLINED_FUNCTION_0_7(v68);
          OUTLINED_FUNCTION_40_0((uint64_t)v89, sel_clicked);
          v69 = OUTLINED_FUNCTION_3_5();
          v70 = OUTLINED_FUNCTION_117(v69);
          v71 = v4 + 1;
          v72 = OUTLINED_FUNCTION_40_0((uint64_t)v70, sel_clickOrder);
          v73 = objc_msgSend(OUTLINED_FUNCTION_3_5(), sel_initWithUnsignedInt_, v72);
          v74 = (void *)sub_235F9B594();
          v75 = (void *)sub_235F9B588();
          OUTLINED_FUNCTION_40_0((uint64_t)v75, sel_isDuplicate);
          v76 = OUTLINED_FUNCTION_1_4();
          v77 = OUTLINED_FUNCTION_0_7(v76);
          OUTLINED_FUNCTION_40_0((uint64_t)v77, sel_isCompleteMatch);
          v78 = OUTLINED_FUNCTION_1_4();
          v79 = OUTLINED_FUNCTION_0_7(v78);
          v80 = objc_allocWithZone(MEMORY[0x24BE0C270]);
          v84 = v79;
          v4 = v71;
          v81 = sub_235F8EB8C(v136, v135, v88, v134, v133, v132, v131, v130, v129, v128, v127, v126, v125, v124, v123, v122, v121, v120, v119,
                  v118,
                  v117,
                  v116,
                  v115,
                  v114,
                  v113,
                  v112,
                  v111,
                  v110,
                  v109,
                  v108,
                  v107,
                  v106,
                  v105,
                  v104,
                  v103,
                  v102,
                  v101,
                  v100,
                  v99,
                  v98,
                  v97,
                  v96,
                  v95,
                  v94,
                  v93,
                  v92,
                  v91,
                  v90,
                  v89,
                  v70,
                  v73,
                  v74,
                  v75,
                  v77,
                  v84);
          objc_msgSend(v137, sel_sendEvent_, v81);

          v1 = (unint64_t)v87;
        }
        while (v86 != v71);
      }
    }
    OUTLINED_FUNCTION_5();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
}

double sub_235F8A79C(void *a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  char aBlock;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  double v16;
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

  v6 = OUTLINED_FUNCTION_1();
  *(_QWORD *)(v6 + 16) = 0;
  v7 = OUTLINED_FUNCTION_1();
  *(_QWORD *)(v7 + 16) = 0;
  v8 = sub_235F88AE4();
  v9 = objc_msgSend(v8, sel_publisher);

  aBlock = MEMORY[0x24BDAC760];
  v11 = OUTLINED_FUNCTION_126_0((uint64_t)sub_235F8A97C, v18, v20, v22, v24, MEMORY[0x24BDAC760], 1107296256, v26, v28);
  v12 = OUTLINED_FUNCTION_1();
  *(double *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = v7;
  *(double *)(v12 + 32) = a2;
  *(_QWORD *)(v12 + 40) = a1;
  *(_QWORD *)(v12 + 48) = v6;
  v13 = OUTLINED_FUNCTION_126_0((uint64_t)sub_235F8A97C, v19, v21, v23, v25, aBlock, 1107296256, v27, v29);
  swift_retain();
  v14 = a1;
  swift_retain();
  swift_release();
  v15 = objc_msgSend(v9, sel_sinkWithCompletion_receiveInput_, v11, v13);
  _Block_release(v13);
  _Block_release(v11);

  OUTLINED_FUNCTION_2();
  if (*(double *)(v6 + 16) <= 0.0)
    v16 = 0.0;
  else
    v16 = 1.0;
  OUTLINED_FUNCTION_2();
  swift_release();
  OUTLINED_FUNCTION_128_0();
  return v16;
}

void sub_235F8A980(void *a1, uint64_t a2, void *a3, uint64_t a4, double a5, double a6)
{
  id v12;
  void *v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  os_log_type_t v28;
  uint8_t *v29;
  double *v30;
  double v31;
  NSObject *oslog;

  v12 = objc_msgSend(a1, sel_eventBody);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(a1, sel_timestamp);
    if (v14 < a5)
    {
      v15 = (double *)(a2 + 16);
      swift_beginAccess();
      v16 = *v15 + 1.0;
      swift_beginAccess();
      *v15 = v16;
    }
    objc_msgSend(a1, sel_timestamp);
    if (v17 > a6 && (objc_msgSend(a1, sel_timestamp), v18 < a5) && (sub_235F90650(a3, (SEL *)&selRef_identifier), v20))
    {
      v21 = v19;
      v22 = v20;
      sub_235F90650(v13, (SEL *)&selRef_identifier);
      if (!v24)
      {

        swift_bridgeObjectRelease();
        return;
      }
      if (v21 == v23 && v22 == v24)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

LABEL_23:
        v30 = (double *)(a4 + 16);
        swift_beginAccess();
        v31 = *v30 + 1.0;
        swift_beginAccess();
        *v30 = v31;
        return;
      }
      v26 = sub_235F9B6C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      if ((v26 & 1) != 0)
        goto LABEL_23;
    }
    else
    {

    }
  }
  else
  {
    if (qword_256399450 != -1)
      swift_once();
    v27 = sub_235F9B384();
    __swift_project_value_buffer(v27, (uint64_t)qword_25639A888);
    oslog = sub_235F9B36C();
    v28 = sub_235F9B51C();
    if (os_log_type_enabled(oslog, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_235F59000, oslog, v28, "Error encountered while reading Photos Search Feedback Stream", v29, 2u);
      MEMORY[0x23B7E7EE4](v29, -1, -1);
    }

  }
}

void sub_235F8AC1C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  OUTLINED_FUNCTION_128_0();

}

void sub_235F8AC68(void *a1)
{
  sub_235F8AC80(a1);
}

void sub_235F8AC74(void *a1)
{
  sub_235F8AC80(a1);
}

void sub_235F8AC80(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = OUTLINED_FUNCTION_0_0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_179();
  sub_235F9B138();
  v5 = *(void (**)(uint64_t))(v3 + 8);
  v6 = OUTLINED_FUNCTION_92_0();
  v5(v6);
  sub_235F9B120();
  v8 = v7;
  OUTLINED_FUNCTION_112_0();
  sub_235F9B180();
  sub_235F9B120();
  v10 = v9;
  OUTLINED_FUNCTION_112_0();
  sub_235F8A79C(a1, v10, v8);
}

void sub_235F8AD48(void *a1, uint64_t a2, void *a3, double a4, double a5)
{
  unint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  BOOL v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *i;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
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
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  id v121;

  v121 = a1;
  v7 = a3;
  v8 = objc_msgSend((id)v7, sel_presentedAssets);
  OUTLINED_FUNCTION_91_0((uint64_t)v8, (unint64_t *)&qword_256399EC8);
  v9 = OUTLINED_FUNCTION_58_2();

  if (v9 >> 62)
  {
LABEL_75:
    OUTLINED_FUNCTION_48();
    v10 = OUTLINED_FUNCTION_69_2();
    OUTLINED_FUNCTION_9_1();
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v116 = (void *)v7;
  if (v10)
  {
    if (v10 < 1)
    {
      __break(1u);
      goto LABEL_77;
    }
    v11 = 0;
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v9 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x23B7E7818](v11, v9);
      else
        v13 = *(id *)(v9 + 8 * v11 + 32);
      v14 = v13;
      sub_235F90650(v13, (SEL *)&selRef_assetUUID);
      if (v16)
      {
        v17 = v15;
        v18 = v16;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_98();
          sub_235F7E1D8();
          v12 = v22;
        }
        v20 = v12[2];
        v19 = v12[3];
        if (v20 >= v19 >> 1)
        {
          OUTLINED_FUNCTION_142_0(v19);
          sub_235F7E1D8();
          v12 = v23;
        }
        v12[2] = v20 + 1;
        v21 = &v12[2 * v20];
        v21[4] = v17;
        v21[5] = v18;
      }
      ++v11;

    }
    while (v10 != v11);
  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  OUTLINED_FUNCTION_9_1();
  v24 = *(_QWORD *)(a2 + 16);
  if (v24)
  {
    swift_bridgeObjectRetain();
    v25 = 0;
    v104 = (uint64_t)(v12 + 9);
    v9 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v26 = a2 + 32 + 16 * v25;
      if (*(double *)v26 > a5)
        break;
LABEL_42:
      if (++v25 == v24)
      {
        OUTLINED_FUNCTION_17();
        goto LABEL_55;
      }
    }
    v27 = *(id *)(v26 + 8);
    sub_235F90650(v27, (SEL *)&selRef_identifier);
    if (!v29)
    {
LABEL_41:

      goto LABEL_42;
    }
    v30 = v29;
    v31 = v12[2];
    if (v31)
    {
      v32 = v28;
      v33 = v12[4] == v28 && v29 == v12[5];
      if (!v33 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
      {
        if (v31 == 1)
          goto LABEL_29;
        v34 = v12[6] == v32 && v30 == v12[7];
        if (!v34 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
        {
          if (v31 != 2)
          {
            v38 = v12 + 9;
            v39 = 2;
            while (!__OFADD__(v39, 1))
            {
              if (*(v38 - 1) == v32 && v30 == *v38)
                goto LABEL_36;
              v108 = v39 + 1;
              v112 = v39;
              if ((sub_235F9B6C0() & 1) != 0)
                goto LABEL_36;
              v38 += 2;
              v39 = v112 + 1;
              if (v108 == v31)
                goto LABEL_29;
            }
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
            return;
          }
          goto LABEL_29;
        }
      }
LABEL_36:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_98();
        sub_235F7E1D8();
        v9 = v41;
      }
      v36 = *(_QWORD *)(v9 + 16);
      v35 = *(_QWORD *)(v9 + 24);
      if (v36 >= v35 >> 1)
      {
        OUTLINED_FUNCTION_142_0(v35);
        sub_235F7E1D8();
        v9 = v42;
      }
      *(_QWORD *)(v9 + 16) = v36 + 1;
      v37 = v9 + 16 * v36;
      *(_QWORD *)(v37 + 32) = v32;
      *(_QWORD *)(v37 + 40) = v30;
      goto LABEL_41;
    }
LABEL_29:
    OUTLINED_FUNCTION_23();
    goto LABEL_41;
  }
  v9 = MEMORY[0x24BEE4AF8];
LABEL_55:
  v43 = OUTLINED_FUNCTION_17();
  v51 = *(_QWORD *)(v9 + 16);
  if (!v51)
  {
    OUTLINED_FUNCTION_146_0(v43, v44, v45, v46, v47, v48, v49, v50, v104, v108, v112, (uint64_t)v116, a2, v121);
    OUTLINED_FUNCTION_102_0(v88, v89, v90, v91, v92, v93, v94, v95, v106, v110, v114, v118);
    OUTLINED_FUNCTION_9_1();
    return;
  }
  v7 = 0;
  for (i = (uint64_t *)(v9 + 16 * v51 + 24); ; i -= 2)
  {
    if (v51 > *(_QWORD *)(v9 + 16))
    {
      __break(1u);
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    v54 = *(i - 1);
    v53 = *i;
    OUTLINED_FUNCTION_58_0();
    sub_235F90650(v121, (SEL *)&selRef_identifier);
    if (!v56)
    {
      OUTLINED_FUNCTION_35();
      goto LABEL_66;
    }
    if (v54 == v55 && v56 == v53)
      break;
    v63 = OUTLINED_FUNCTION_31_2();
    OUTLINED_FUNCTION_35();
    v64 = OUTLINED_FUNCTION_17();
    if ((v63 & 1) != 0)
    {
      OUTLINED_FUNCTION_102_0(v64, v65, v66, v67, v68, v69, v70, v71, v104, v108, v112, v116);
      goto LABEL_71;
    }
LABEL_66:
    if ((_DWORD)v7 == -1)
      goto LABEL_74;
    v7 = (v7 + 1);
    if (!--v51)
    {
      v72 = OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_146_0(v72, v73, v74, v75, v76, v77, v78, v79, v104, v108, v112, (uint64_t)v116, a2, v121);
      OUTLINED_FUNCTION_102_0(v80, v81, v82, v83, v84, v85, v86, v87, v105, v109, v113, v117);
      return;
    }
  }
  OUTLINED_FUNCTION_102_0(v55, v56, v55, v57, v58, v59, v60, v61, v104, v108, v112, v116);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_35();
LABEL_71:
  v96 = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_146_0(v96, v97, v98, v99, v100, v101, v102, v103, v107, v111, v115, v119, a2, v121);
  if ((_DWORD)v7 == -1)
    goto LABEL_78;
}

id sub_235F8B188(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v16;

  if (a3 >> 62)
    goto LABEL_19;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_62();
  for (; v6; v6 = sub_235F9B654())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B7E7818](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      sub_235F90650(v8, (SEL *)&selRef_assetUUID);
      if (v12)
      {
        if (v11 == a1 && v12 == a2)
        {
          OUTLINED_FUNCTION_27_1();
LABEL_17:
          swift_bridgeObjectRelease();
          v16 = objc_msgSend(v9, sel_rankingIndex);

          return v16;
        }
        v14 = OUTLINED_FUNCTION_31_2();
        OUTLINED_FUNCTION_25();
        if ((v14 & 1) != 0)
          goto LABEL_17;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_15;
    }
    __break(1u);
LABEL_19:
    OUTLINED_FUNCTION_62();
  }
LABEL_15:
  OUTLINED_FUNCTION_27_1();
  return 0;
}

uint64_t sub_235F8B2CC(__n128 a1)
{
  return sub_235F8B2E4(a1, -604800.0);
}

uint64_t sub_235F8B2D8(__n128 a1)
{
  return sub_235F8B2E4(a1, -2592000.0);
}

#error "235F8B3A8: call analysis failed (funcsize=58)"

void sub_235F8B3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;

  OUTLINED_FUNCTION_36_2();
  a21 = v22;
  a22 = v23;
  v25 = v24;
  v27 = v26;
  v28 = OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_87_0();
  v31 = v29 - v30;
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&a9 - v33;
  sub_235F9B114();
  sub_235F9B114();
  sub_235F90650(v27, (SEL *)&selRef_identifier);
  if (v35)
  {
    v36 = (void *)sub_235F9B3F0();
    OUTLINED_FUNCTION_35();
    v37 = (void *)sub_235F9B144();
    v38 = (void *)sub_235F9B144();
    if (v25)
      v25 = (void *)sub_235F9B3F0();
    objc_msgSend((id)objc_opt_self(), sel_shareInformationForPhotoId_startTime_endTime_interactionStorePath_, v36, v37, v38, v25);

    OUTLINED_FUNCTION_127(v31);
    OUTLINED_FUNCTION_127((uint64_t)v34);
  }
  else
  {
    OUTLINED_FUNCTION_127(v31);
    OUTLINED_FUNCTION_127((uint64_t)v34);
  }
  OUTLINED_FUNCTION_5();
}

void sub_235F8B53C()
{
  int v0;
  int v1;
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(uint64_t, uint64_t);
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  _QWORD v68[2];
  char *v69;
  void (*v70)(uint64_t, uint64_t);
  char *v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;

  OUTLINED_FUNCTION_36_2();
  v1 = v0;
  v3 = v2;
  v84 = v4;
  v5 = sub_235F9B06C();
  v78 = *(_QWORD *)(v5 - 8);
  v79 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_0_0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_87_0();
  v12 = v10 - v11;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v68 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v68 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v68 - v20;
  sub_235F9B180();
  sub_235F9B138();
  v22 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  OUTLINED_FUNCTION_141_0((uint64_t)v19);
  sub_235F9B114();
  sub_235F9B15C();
  v24 = v23;
  sub_235F9B15C();
  if (v24 >= v25)
  {
    v70 = v22;
    v26 = *(_QWORD *)(v9 + 16);
    v68[1] = v21;
    ((void (*)(char *, char *, uint64_t))v26)(v19, v21, v8);
    v69 = v16;
    ((void (*)(uint64_t, char *, uint64_t))v26)(v12, v16, v8);
    sub_235F9B054();
    v27 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AMLPhotosSearchHelpers()), sel_init);
    v28 = (void *)sub_235F88A6C();
    v71 = v7;
    sub_235F99070();
    v30 = v29;

    v82 = *(_QWORD *)(v30 + 16);
    if (!v82)
    {
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_122_0();
LABEL_39:
      (*(void (**)(char *, uint64_t))(v78 + 8))(v71, v79);
      v70(v26, v8);
      OUTLINED_FUNCTION_129_0();
      goto LABEL_40;
    }
    v31 = 0;
    v83 = v30 + 32;
    v81 = xmmword_235F9D690;
    OUTLINED_FUNCTION_27_0();
    v76 = v32;
    v77 = v33;
    OUTLINED_FUNCTION_27_0();
    v74 = v8;
    v75 = v34;
    v73 = v1;
    v72 = v30;
    while (1)
    {
      if (v31 >= *(_QWORD *)(v30 + 16))
      {
LABEL_42:
        __break(1u);
        return;
      }
      v35 = v83 + 16 * v31;
      v36 = *(double *)v35;
      v37 = *(void **)(v35 + 8);
      if ((v1 & 1) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
        v38 = OUTLINED_FUNCTION_1();
        v85 = v31;
        v86 = 0;
        v39 = (_QWORD *)v38;
        *(_OWORD *)(v38 + 16) = v81;
        v87 = 0xE000000000000000;
        v40 = v37;
        v41 = v37;
        sub_235F9B5F4();
        sub_235F9B420();
        v26 = MEMORY[0x24BEE3960];
        sub_235F9B4B0();
        sub_235F9B420();
        sub_235F9B4B0();
        sub_235F9B420();
        v42 = objc_msgSend(v40, sel_description);
        sub_235F9B3FC();

        OUTLINED_FUNCTION_109_0();
        v37 = v41;
        OUTLINED_FUNCTION_39();
        v43 = v86;
        v44 = v87;
        v39[7] = MEMORY[0x24BEE0D00];
        v39[4] = v43;
        v39[5] = v44;
        OUTLINED_FUNCTION_12_2();
        v31 = v85;
        swift_bridgeObjectRelease();
      }
      else
      {
        v45 = v37;
      }
      sub_235F90650(v84, (SEL *)&selRef_identifier);
      if (!v47)
        goto LABEL_27;
      v48 = v47;
      if (v36 >= v3)
        break;
      v49 = v46;
      v80 = v37;
      v50 = OUTLINED_FUNCTION_31_1(v46, sel_presentedAssets);
      sub_235F6B254(0, (unint64_t *)&qword_256399EC8);
      v51 = OUTLINED_FUNCTION_58_2();

      v85 = v31;
      if (v51 >> 62)
      {
        OUTLINED_FUNCTION_37_1();
        v52 = OUTLINED_FUNCTION_69_2();
        OUTLINED_FUNCTION_25();
        if (v52)
        {
LABEL_13:
          v53 = 4;
          while (1)
          {
            if ((v51 & 0xC000000000000001) != 0)
              v54 = (id)MEMORY[0x23B7E7818](v53 - 4, v51);
            else
              v54 = *(id *)(v51 + 8 * v53);
            v55 = v54;
            v56 = v53 - 3;
            if (__OFADD__(v53 - 4, 1))
            {
              __break(1u);
              goto LABEL_42;
            }
            sub_235F90650(v54, (SEL *)&selRef_assetUUID);
            if (v58)
            {
              v59 = v58;
              if (v57 == v49 && v58 == v48)
              {
                OUTLINED_FUNCTION_25();
                OUTLINED_FUNCTION_39();
                goto LABEL_35;
              }
              v26 = OUTLINED_FUNCTION_31_2();
              OUTLINED_FUNCTION_35();
              if ((v26 & 1) != 0)
                break;
            }

            ++v53;
            if (v56 == v52)
              goto LABEL_25;
          }
          OUTLINED_FUNCTION_25();
          v59 = v48;
LABEL_35:
          OUTLINED_FUNCTION_35();
          swift_bridgeObjectRelease();
          v61 = v74;
          v62 = v79;
          v63 = v71;
          if ((v73 & 1) != 0)
          {
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
            v64 = OUTLINED_FUNCTION_1();
            *(_OWORD *)(v64 + 16) = v81;
            v86 = 0;
            v87 = 0xE000000000000000;
            v59 = &v86;
            sub_235F9B5F4();
            OUTLINED_FUNCTION_84_0();
            sub_235F9B420();
            sub_235F9B4B0();
            sub_235F9B420();
            v26 = (uint64_t)objc_msgSend(v80, sel_description);
            sub_235F9B3FC();

            OUTLINED_FUNCTION_109_0();
            OUTLINED_FUNCTION_39();
            v65 = v86;
            v66 = v87;
            *(_QWORD *)(v64 + 56) = MEMORY[0x24BEE0D00];
            *(_QWORD *)(v64 + 32) = v65;
            *(_QWORD *)(v64 + 40) = v66;
            OUTLINED_FUNCTION_12_2();

            OUTLINED_FUNCTION_20();
          }
          else
          {

          }
          OUTLINED_FUNCTION_122_0();
          v67 = v70;
          (*(void (**)(char *, uint64_t))(v78 + 8))(v63, v62);
          v67(v26, v61);
          v67((uint64_t)v59, v61);
          goto LABEL_40;
        }
      }
      else
      {
        v52 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v52)
          goto LABEL_13;
      }
LABEL_25:

      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_39();
      v8 = v74;
      LOBYTE(v1) = v73;
      v30 = v72;
      v31 = v85;
LABEL_28:
      if (++v31 == v82)
      {
        OUTLINED_FUNCTION_43_0();
        v26 = (uint64_t)v69;
        goto LABEL_39;
      }
    }
    OUTLINED_FUNCTION_39();
LABEL_27:

    goto LABEL_28;
  }
  OUTLINED_FUNCTION_141_0((uint64_t)v16);
  OUTLINED_FUNCTION_141_0((uint64_t)v21);
LABEL_40:
  OUTLINED_FUNCTION_5();
}

void sub_235F8BBE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id *v12;
  char *v13;
  uint64_t v14;
  double v15;
  id v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  double v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_class *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[4];
  uint8_t *v50;
  NSObject *v51;
  char *v52;
  uint64_t v53[3];
  uint64_t v54;
  uint64_t v55;

  OUTLINED_FUNCTION_36_2();
  v2 = v1;
  v3 = OUTLINED_FUNCTION_0_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_64_2();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = ((char *)v49 - v7);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v49 - v9;
  v11 = MEMORY[0x24BEE1768];
  LOBYTE(v12) = MEMORY[0x24BEE0D10];
  v55 = OUTLINED_FUNCTION_70_1();
  v54 = OUTLINED_FUNCTION_70_1();
  OUTLINED_FUNCTION_179();
  v52 = v10;
  sub_235F9B150();
  v13 = *(char **)(v4 + 8);
  OUTLINED_FUNCTION_129_0();
  OUTLINED_FUNCTION_179();
  v51 = v0;
  sub_235F9B150();
  v49[2] = v13;
  v49[3] = v3;
  ((void (*)(NSObject *, uint64_t))v13)(v8, v3);
  v14 = *(_QWORD *)(v2 + 16);
  if (!v14)
  {
LABEL_60:
    if (qword_256399440 != -1)
LABEL_74:
      swift_once();
    v36 = OUTLINED_FUNCTION_19_1();
    v37 = OUTLINED_FUNCTION_177(v36, (uint64_t)qword_25639A858);
    v38 = sub_235F9B504();
    if (OUTLINED_FUNCTION_111_0(v37))
    {
      v39 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v53[0] = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v39 = 136315138;
      v50 = v39 + 4;
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_166();
      v40 = sub_235F9B3D8();
      v42 = v41;
      OUTLINED_FUNCTION_111();
      sub_235F7EC30(v40, v42, v53);
      OUTLINED_FUNCTION_89_0(v43);
      sub_235F9B5AC();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_52_1(&dword_235F59000, v37, v38, "PhotosSearchClient plugin: weekly dict %s", v39);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }

    sub_235F9B36C();
    v44 = OUTLINED_FUNCTION_183();
    if (OUTLINED_FUNCTION_101_0(v44))
    {
      v45 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v53[0] = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v45 = 136315138;
      OUTLINED_FUNCTION_2();
      swift_bridgeObjectRetain();
      v46 = sub_235F9B3D8();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_96_0(v46, v47, v53);
      OUTLINED_FUNCTION_39_3(v48);
      sub_235F9B5AC();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_52_1(&dword_235F59000, v8, (os_log_type_t)v12, "PhotosSearchClient plugin: monthly dict %s", v45);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_127((uint64_t)v51);
    OUTLINED_FUNCTION_127((uint64_t)v52);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_5();
    return;
  }
  OUTLINED_FUNCTION_42_1();
  v49[1] = v2;
  v12 = (id *)(v2 + 40);
  while (1)
  {
    v15 = *((double *)v12 - 1);
    v16 = *v12;
    sub_235F90650(v16, (SEL *)&selRef_identifier);
    if (!v17)
      goto LABEL_42;
    sub_235F9B120();
    if (v18 < v15)
      break;
LABEL_30:
    v8 = v51;
    sub_235F9B120();
    if (v28 < v15)
    {
      v8 = v54;
      if (*(_QWORD *)(v54 + 16))
      {
        OUTLINED_FUNCTION_166();
        v29 = OUTLINED_FUNCTION_10_3();
        if ((v30 & 1) != 0)
        {
          v13 = (char *)*((_QWORD *)v8[7].isa + v29);
          OUTLINED_FUNCTION_111();
          if (__OFADD__(v13, 1))
            goto LABEL_71;
          v50 = (uint8_t *)(v13 + 1);
          OUTLINED_FUNCTION_84();
          v53[0] = (uint64_t)v8;
          OUTLINED_FUNCTION_10_3();
          OUTLINED_FUNCTION_37_4();
          if (v21)
            goto LABEL_73;
          OUTLINED_FUNCTION_115_0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
          if ((OUTLINED_FUNCTION_27_4() & 1) != 0)
          {
            OUTLINED_FUNCTION_10_3();
            OUTLINED_FUNCTION_61_1();
            if (!v23)
              goto LABEL_77;
            v11 = v31;
          }
          v8 = v53[0];
          if ((v13 & 1) != 0)
          {
            v32 = *(_QWORD *)(v53[0] + 56);
            v33 = (uint64_t)v50;
            goto LABEL_51;
          }
          OUTLINED_FUNCTION_18_4();
          if (v21)
            goto LABEL_76;
LABEL_56:
          v8[2].isa = v35;
          OUTLINED_FUNCTION_166();
          goto LABEL_57;
        }
        OUTLINED_FUNCTION_111();
      }
      OUTLINED_FUNCTION_84();
      v53[0] = (uint64_t)v8;
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_37_4();
      if (v21)
        goto LABEL_67;
      OUTLINED_FUNCTION_115_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
      if ((OUTLINED_FUNCTION_27_4() & 1) != 0)
      {
        OUTLINED_FUNCTION_10_3();
        OUTLINED_FUNCTION_61_1();
        if (!v23)
          goto LABEL_77;
        v11 = v34;
      }
      v8 = v53[0];
      if ((v13 & 1) == 0)
      {
        OUTLINED_FUNCTION_22_4();
        if (v21)
          goto LABEL_69;
        goto LABEL_56;
      }
      v32 = *(_QWORD *)(v53[0] + 56);
      v33 = 1;
LABEL_51:
      *(_QWORD *)(v32 + 8 * v11) = v33;
LABEL_57:
      v54 = (uint64_t)v8;

      OUTLINED_FUNCTION_111();
      OUTLINED_FUNCTION_85();
      goto LABEL_58;
    }
    OUTLINED_FUNCTION_111();
LABEL_42:

LABEL_58:
    v12 += 2;
    if (!--v14)
    {
      OUTLINED_FUNCTION_77_2();
      goto LABEL_60;
    }
  }
  v8 = v55;
  if (!*(_QWORD *)(v55 + 16))
    goto LABEL_16;
  OUTLINED_FUNCTION_166();
  v19 = OUTLINED_FUNCTION_10_3();
  if ((v20 & 1) == 0)
  {
    OUTLINED_FUNCTION_111();
LABEL_16:
    OUTLINED_FUNCTION_166();
    OUTLINED_FUNCTION_84();
    v53[0] = (uint64_t)v8;
    OUTLINED_FUNCTION_10_3();
    OUTLINED_FUNCTION_37_4();
    if (v21)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    OUTLINED_FUNCTION_115_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
    if ((OUTLINED_FUNCTION_27_4() & 1) != 0)
    {
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_61_1();
      if (!v23)
        goto LABEL_77;
      v11 = v26;
    }
    v8 = v53[0];
    if ((v13 & 1) != 0)
    {
      v24 = *(_QWORD *)(v53[0] + 56);
      v25 = 1;
      goto LABEL_23;
    }
    OUTLINED_FUNCTION_22_4();
    if (v21)
      goto LABEL_68;
LABEL_28:
    v8[2].isa = v27;
    OUTLINED_FUNCTION_166();
    goto LABEL_29;
  }
  v13 = (char *)*((_QWORD *)v8[7].isa + v19);
  OUTLINED_FUNCTION_111();
  if (__OFADD__(v13, 1))
    goto LABEL_70;
  v50 = (uint8_t *)(v13 + 1);
  OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_84();
  v53[0] = (uint64_t)v8;
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_37_4();
  if (v21)
    goto LABEL_72;
  OUTLINED_FUNCTION_115_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
  if ((OUTLINED_FUNCTION_27_4() & 1) != 0)
  {
    OUTLINED_FUNCTION_10_3();
    OUTLINED_FUNCTION_61_1();
    if (!v23)
      goto LABEL_77;
    v11 = v22;
  }
  v8 = v53[0];
  if ((v13 & 1) != 0)
  {
    v24 = *(_QWORD *)(v53[0] + 56);
    v25 = (uint64_t)v50;
LABEL_23:
    *(_QWORD *)(v24 + 8 * v11) = v25;
LABEL_29:
    v55 = (uint64_t)v8;
    OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_85();
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_18_4();
  if (!v21)
    goto LABEL_28;
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  sub_235F9B6D8();
  __break(1u);
}

void sub_235F8C22C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
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
  NSObject *v96;
  os_log_type_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[2];
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  __int128 v112;
  _QWORD *v113;
  unint64_t v114;
  _QWORD *v115;

  OUTLINED_FUNCTION_36_2();
  v104 = v1;
  v2 = OUTLINED_FUNCTION_0_0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_64_2();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v103 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (uint64_t)v103 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399A08);
  v10 = OUTLINED_FUNCTION_74_1();
  v107 = OUTLINED_FUNCTION_74_1();
  sub_235F9B180();
  v109 = v9;
  sub_235F9B150();
  v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v7, v2);
  sub_235F9B180();
  v108 = v0;
  sub_235F9B150();
  v103[0] = v11;
  v103[1] = v2;
  v11(v7, v2);
  v110 = *(_QWORD *)(v104 + 16);
  v113 = (_QWORD *)v10;
  if (v110)
  {
    v106 = v104 + 32;
    swift_bridgeObjectRetain();
    v12 = 0;
    do
    {
      v13 = v106 + 16 * v12;
      v14 = *(double *)v13;
      v15 = *(id *)(v13 + 8);
      v16 = objc_msgSend(v15, sel_presentedAssets);
      sub_235F6B254(0, (unint64_t *)&qword_256399EC8);
      v17 = OUTLINED_FUNCTION_58_2();

      sub_235F9B120();
      v114 = v17;
      v18 = v17 >> 62;
      v111 = v15;
      *(_QWORD *)&v112 = v12;
      if (v19 < v14)
      {
        if (v18)
        {
          OUTLINED_FUNCTION_113_0();
          v20 = OUTLINED_FUNCTION_69_2();
          OUTLINED_FUNCTION_17();
        }
        else
        {
          v20 = *(_QWORD *)((v114 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        v105 = v17 >> 62;
        if (v20)
        {
          v21 = v114 & 0xC000000000000001;
          v22 = 4;
          v23 = MEMORY[0x24BEE4AF8];
          while (1)
          {
            if (v21)
              OUTLINED_FUNCTION_114_0();
            v24 = OUTLINED_FUNCTION_134();
            v25 = v22 - 3;
            if (__OFADD__(v22 - 4, 1))
              break;
            sub_235F90650(v24, (SEL *)&selRef_assetUUID);
            if (!v26)
              goto LABEL_124;
            if ((OUTLINED_FUNCTION_97_0() & 1) == 0)
            {
              OUTLINED_FUNCTION_51_2();
              v23 = v27;
            }
            if (*(_QWORD *)(v23 + 16) >= *(_QWORD *)(v23 + 24) >> 1)
            {
              OUTLINED_FUNCTION_51_2();
              v23 = v28;
            }
            OUTLINED_FUNCTION_94_0();
            ++v22;
            if (v25 == v20)
              goto LABEL_19;
          }
          __break(1u);
          goto LABEL_115;
        }
        v23 = MEMORY[0x24BEE4AF8];
LABEL_19:
        OUTLINED_FUNCTION_228();
        OUTLINED_FUNCTION_291();
        v29 = (uint64_t)v113;
        OUTLINED_FUNCTION_84();
        v115 = (_QWORD *)v29;
        OUTLINED_FUNCTION_52_2();
        OUTLINED_FUNCTION_2_0();
        if (v32)
          goto LABEL_118;
        v33 = v30;
        LOBYTE(v9) = v31;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399B48);
        if ((sub_235F9B630() & 1) != 0)
        {
          v34 = OUTLINED_FUNCTION_52_2();
          if ((v9 & 1) != (v35 & 1))
            goto LABEL_126;
          v33 = v34;
        }
        v113 = v115;
        if ((v9 & 1) != 0)
        {
          v36 = v113[7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v36 + 8 * v33) = v23;
        }
        else
        {
          OUTLINED_FUNCTION_28_6(v33 >> 6);
          if (v32)
            goto LABEL_122;
          v113[2] = v37;
          OUTLINED_FUNCTION_34_2();
        }
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_85();
        v15 = v111;
        v12 = v112;
        v18 = v105;
      }
      sub_235F9B120();
      if (v38 >= v14)
      {
        OUTLINED_FUNCTION_228();

      }
      else
      {
        if (v18)
        {
          OUTLINED_FUNCTION_18_2();
          v39 = OUTLINED_FUNCTION_69_2();
          OUTLINED_FUNCTION_17();
          if (v39)
          {
LABEL_31:
            v40 = v114 & 0xC000000000000001;
            v41 = 4;
            v42 = MEMORY[0x24BEE4AF8];
            while (1)
            {
              if (v40)
                OUTLINED_FUNCTION_114_0();
              v43 = OUTLINED_FUNCTION_134();
              v44 = v41 - 3;
              if (__OFADD__(v41 - 4, 1))
                break;
              sub_235F90650(v43, (SEL *)&selRef_assetUUID);
              if (!v45)
                goto LABEL_125;
              if ((OUTLINED_FUNCTION_97_0() & 1) == 0)
              {
                OUTLINED_FUNCTION_51_2();
                v42 = v46;
              }
              if (*(_QWORD *)(v42 + 16) >= *(_QWORD *)(v42 + 24) >> 1)
              {
                OUTLINED_FUNCTION_51_2();
                v42 = v47;
              }
              OUTLINED_FUNCTION_94_0();
              ++v41;
              if (v44 == v39)
                goto LABEL_46;
            }
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
            goto LABEL_120;
          }
        }
        else
        {
          v39 = *(_QWORD *)((v114 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v39)
            goto LABEL_31;
        }
        v42 = MEMORY[0x24BEE4AF8];
LABEL_46:
        OUTLINED_FUNCTION_228();
        OUTLINED_FUNCTION_291();
        v48 = v107;
        OUTLINED_FUNCTION_84();
        v115 = (_QWORD *)v48;
        v49 = OUTLINED_FUNCTION_52_2();
        if (__OFADD__(*(_QWORD *)(v48 + 16), (v50 & 1) == 0))
          goto LABEL_119;
        v51 = v49;
        LOBYTE(v9) = v50;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399B48);
        if ((sub_235F9B630() & 1) != 0)
        {
          v52 = OUTLINED_FUNCTION_52_2();
          if ((v9 & 1) != (v53 & 1))
            goto LABEL_126;
          v51 = v52;
        }
        v107 = (uint64_t)v115;
        if ((v9 & 1) != 0)
        {
          v54 = v115[7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v54 + 8 * v51) = v42;
        }
        else
        {
          OUTLINED_FUNCTION_28_6(v51 >> 6);
          if (v32)
            goto LABEL_123;
          *(_QWORD *)(v56 + 16) = v55;
          OUTLINED_FUNCTION_34_2();
        }

        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_85();
        v12 = v112;
      }
      ++v12;
    }
    while (v12 != v110);
    swift_bridgeObjectRelease();
  }
  v114 = (unint64_t)(v113 + 8);
  OUTLINED_FUNCTION_70_0();
  v59 = v58 & v57;
  OUTLINED_FUNCTION_259();
  v111 = v60;
  swift_bridgeObjectRetain();
  v61 = 0;
  *(_QWORD *)&v62 = 136315394;
  v112 = v62;
  v110 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    if (v59)
    {
      OUTLINED_FUNCTION_90_0();
      goto LABEL_79;
    }
    if (__OFADD__(v61, 1))
      goto LABEL_116;
    OUTLINED_FUNCTION_288();
    if (v65 == v32)
      break;
    v61 = v64;
    if (!*(_QWORD *)(v114 + 8 * v64))
    {
      v61 = v64 + 1;
      OUTLINED_FUNCTION_66_0();
      if (v65 == v32)
        break;
      OUTLINED_FUNCTION_119_0();
      if (!v67)
      {
        v61 = v66 + 2;
        OUTLINED_FUNCTION_66_0();
        if (v65 == v32)
          break;
        OUTLINED_FUNCTION_119_0();
        if (!v68)
        {
          OUTLINED_FUNCTION_288();
          if (v65 == v32)
            break;
          if (!*(_QWORD *)(v114 + 8 * v69))
          {
            while (1)
            {
              v61 = v69 + 1;
              if (__OFADD__(v69, 1))
                break;
              OUTLINED_FUNCTION_66_0();
              if (v65 == v32)
                goto LABEL_84;
              v69 = v70 + 1;
              if (*(_QWORD *)(v114 + 8 * v61))
                goto LABEL_78;
            }
LABEL_120:
            __break(1u);
            goto LABEL_121;
          }
          v61 = v69;
        }
      }
    }
LABEL_78:
    OUTLINED_FUNCTION_86_0();
LABEL_79:
    v71 = *(_QWORD *)(v113[6] + 16 * v63);
    v72 = qword_256399440;
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_34_2();
    if (v72 != -1)
      swift_once();
    v73 = OUTLINED_FUNCTION_19_1();
    v74 = __swift_project_value_buffer(v73, (uint64_t)qword_25639A858);
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_34_2();
    sub_235F9B36C();
    v75 = OUTLINED_FUNCTION_183();
    if (OUTLINED_FUNCTION_246(v75))
    {
      v76 = OUTLINED_FUNCTION_23_0();
      v115 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v76 = v112;
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_76_1(v71, v77, (uint64_t *)&v115);
      *(_QWORD *)(v76 + 4) = v78;
      OUTLINED_FUNCTION_241();
      *(_WORD *)(v76 + 12) = 2080;
      v79 = OUTLINED_FUNCTION_34_2();
      MEMORY[0x23B7E7668](v79, MEMORY[0x24BEE0D00]);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_82_0();
      *(_QWORD *)(v76 + 14) = v80;
      OUTLINED_FUNCTION_62_0();
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_154(&dword_235F59000, v74, (os_log_type_t)v9, "PhotosSearchClient plugin: assetsPresentedInEventWeek %s: %s", (uint8_t *)v76);
      OUTLINED_FUNCTION_104_0();
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_62_0();
  }
LABEL_84:
  v81 = v113;
  swift_release();
  v82 = 1 << *((_BYTE *)v81 + 32);
  v83 = -1;
  if (v82 < 64)
    v83 = ~(-1 << v82);
  v84 = v83 & v81[8];
  v111 = (id)((unint64_t)(v82 + 63) >> 6);
  OUTLINED_FUNCTION_62();
  v85 = 0;
  v110 = MEMORY[0x24BEE4AD8] + 8;
  while (2)
  {
    if (v84)
    {
      OUTLINED_FUNCTION_90_0();
LABEL_108:
      v93 = *(_QWORD *)(v113[6] + 16 * v86);
      v94 = qword_256399440;
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_34_2();
      if (v94 != -1)
        swift_once();
      v95 = OUTLINED_FUNCTION_19_1();
      v96 = __swift_project_value_buffer(v95, (uint64_t)qword_25639A858);
      OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_34_2();
      sub_235F9B36C();
      v97 = OUTLINED_FUNCTION_183();
      if (OUTLINED_FUNCTION_246(v97))
      {
        v98 = OUTLINED_FUNCTION_23_0();
        v115 = (_QWORD *)OUTLINED_FUNCTION_23_0();
        *(_DWORD *)v98 = v112;
        OUTLINED_FUNCTION_18_2();
        OUTLINED_FUNCTION_76_1(v93, v99, (uint64_t *)&v115);
        *(_QWORD *)(v98 + 4) = v100;
        OUTLINED_FUNCTION_241();
        *(_WORD *)(v98 + 12) = 2080;
        v101 = OUTLINED_FUNCTION_34_2();
        MEMORY[0x23B7E7668](v101, MEMORY[0x24BEE0D00]);
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_82_0();
        *(_QWORD *)(v98 + 14) = v102;
        OUTLINED_FUNCTION_62_0();
        OUTLINED_FUNCTION_25();
        OUTLINED_FUNCTION_154(&dword_235F59000, v96, (os_log_type_t)v9, "PhotosSearchClient plugin: assetsPresentedInEventMonth %s: %s", (uint8_t *)v98);
        OUTLINED_FUNCTION_104_0();
        OUTLINED_FUNCTION_8_0();
      }

      OUTLINED_FUNCTION_62_0();
      OUTLINED_FUNCTION_62_0();
      continue;
    }
    break;
  }
  if (__OFADD__(v85, 1))
    goto LABEL_117;
  OUTLINED_FUNCTION_288();
  if (v65 == v32)
  {
LABEL_113:
    swift_release();
    OUTLINED_FUNCTION_127(v108);
    OUTLINED_FUNCTION_127(v109);
    OUTLINED_FUNCTION_5();
    return;
  }
  v85 = v87;
  if (*(_QWORD *)(v114 + 8 * v87))
    goto LABEL_107;
  v85 = v87 + 1;
  OUTLINED_FUNCTION_66_0();
  if (v65 == v32)
    goto LABEL_113;
  OUTLINED_FUNCTION_119_0();
  if (v89)
    goto LABEL_107;
  v85 = v88 + 2;
  OUTLINED_FUNCTION_66_0();
  if (v65 == v32)
    goto LABEL_113;
  OUTLINED_FUNCTION_119_0();
  if (v90)
  {
LABEL_107:
    OUTLINED_FUNCTION_86_0();
    goto LABEL_108;
  }
  OUTLINED_FUNCTION_288();
  if (v65 == v32)
    goto LABEL_113;
  if (*(_QWORD *)(v114 + 8 * v91))
  {
    v85 = v91;
    goto LABEL_107;
  }
  while (1)
  {
    v85 = v91 + 1;
    if (__OFADD__(v91, 1))
      break;
    OUTLINED_FUNCTION_66_0();
    if (v65 == v32)
      goto LABEL_113;
    v91 = v92 + 1;
    if (*(_QWORD *)(v114 + 8 * v85))
      goto LABEL_107;
  }
LABEL_121:
  __break(1u);
LABEL_122:
  __break(1u);
LABEL_123:
  __break(1u);
LABEL_124:
  __break(1u);
LABEL_125:
  __break(1u);
LABEL_126:
  sub_235F9B6D8();
  __break(1u);
}

uint64_t sub_235F8CC20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __n128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  _QWORD *v60;
  unint64_t v62;
  _QWORD *v63;
  BOOL v64;
  unint64_t i;
  uint64_t v66;
  char v67;
  _QWORD *v68;
  BOOL v69;
  unint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unint64_t v74;
  char v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
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
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t result;
  uint64_t v112;
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
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD *v141;
  unint64_t v142;
  _QWORD v143[2];

  v118 = a2;
  sub_235F8BBE4();
  v114 = v2;
  v116 = v3;
  sub_235F8C22C();
  v120 = v4;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399BC0);
  v7 = sub_235F9B3E4();
  v143[0] = v7;
  v142 = MEMORY[0x24BEE4B08];
  v124 = v6 + 64;
  v8 = 1 << *(_BYTE *)(v6 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v6 + 64);
  OUTLINED_FUNCTION_259();
  v126 = v11;
  OUTLINED_FUNCTION_166();
  v12 = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  v122 = v6;
  while (1)
  {
    v134 = v7;
    if (v10)
    {
      v130 = (v10 - 1) & v10;
      v17 = __clz(__rbit64(v10)) | (v12 << 6);
    }
    else
    {
      v18 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_76;
      if (v18 >= v126)
        goto LABEL_67;
      if (!*(_QWORD *)(v124 + 8 * v18))
      {
        if (v12 + 2 >= v126)
          goto LABEL_67;
        if (!*(_QWORD *)(v124 + 8 * (v12 + 2)))
        {
          if (v12 + 3 >= v126)
            goto LABEL_67;
          if (!*(_QWORD *)(v124 + 8 * (v12 + 3)))
          {
            v19 = v12 + 4;
            if (v12 + 4 >= v126)
              goto LABEL_67;
            if (!*(_QWORD *)(v124 + 8 * v19))
            {
              while (1)
              {
                v20 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_77;
                if (v20 >= v126)
                  break;
                ++v19;
                if (*(_QWORD *)(v124 + 8 * v20))
                  goto LABEL_19;
              }
LABEL_67:
              swift_release();
              OUTLINED_FUNCTION_188();
              v81 = v120;
              sub_235F8536C(v143, v114, v120, 1);
              OUTLINED_FUNCTION_27_1();
              sub_235F8536C(v143, v116, v6, 0);
              OUTLINED_FUNCTION_27_1();
              v82 = v142;
              v83 = OUTLINED_FUNCTION_18_2();
              v84 = v118;
              sub_235F8D330(v83, v118, v85, v86, v87, v88, v89, v90, v112, v114, v116, v118, v120, v122, v124, v126, v128, v130, v132,
                v134,
                v136,
                v138);
              v92 = v91;
              v94 = v93;
              v96 = v95;
              OUTLINED_FUNCTION_17();
              sub_235F8DDB4(v82, v84, v97, v98, v99, v100, v101, v102, v113, v115, v117, v119, v121, v123, v125, v127, v129, v131, v133,
                v135,
                v137,
                v139);
              v104 = v103;
              v106 = v105;
              v7 = v107;
              OUTLINED_FUNCTION_17();
              sub_235F83598(v143, v92, v94, v81, 1);
              OUTLINED_FUNCTION_39();
              sub_235F83598(v143, v92, v96, v6, 0);
              OUTLINED_FUNCTION_9_1();
              OUTLINED_FUNCTION_25();
              sub_235F847B4((uint64_t)v143, v104, v106, v81, 1);
              OUTLINED_FUNCTION_43_0();
              OUTLINED_FUNCTION_23();
              sub_235F847B4((uint64_t)v143, v104, v7, v6, 0);
              OUTLINED_FUNCTION_111();
              OUTLINED_FUNCTION_20();
              OUTLINED_FUNCTION_27_1();
              if (qword_256399440 != -1)
                goto LABEL_78;
              goto LABEL_68;
            }
          }
        }
      }
LABEL_19:
      OUTLINED_FUNCTION_251();
      v130 = v22 & v21;
      v17 = v23 + (v12 << 6);
    }
    v132 = v12;
    v24 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v17);
    v136 = *v24;
    v25 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v17);
    v140 = *(_QWORD *)(v25 + 16);
    if (v140)
      break;
    v7 = v24[1];
    swift_bridgeObjectRetain();
    v27 = MEMORY[0x24BEE4B00];
LABEL_58:
    OUTLINED_FUNCTION_84();
    v141 = (_QWORD *)v134;
    v70 = v7;
    sub_235F7F384();
    OUTLINED_FUNCTION_2_0();
    if (_VF)
      goto LABEL_74;
    v7 = v71;
    v73 = v72;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BD0);
    if ((sub_235F9B630() & 1) != 0)
    {
      v74 = sub_235F7F384();
      if ((v73 & 1) != (v75 & 1))
      {
LABEL_79:
        result = sub_235F9B6D8();
        __break(1u);
        return result;
      }
      v7 = v74;
    }
    v76 = v141;
    if ((v73 & 1) != 0)
    {
      v77 = v141[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v77 + 8 * v7) = v27;
      v7 = (unint64_t)v76;
    }
    else
    {
      OUTLINED_FUNCTION_100((uint64_t)&v141[v7 >> 6]);
      v78 = (uint64_t *)(v76[6] + 16 * v7);
      *v78 = v136;
      v78[1] = v70;
      *(_QWORD *)(v76[7] + 8 * v7) = v27;
      v79 = v76[2];
      _VF = __OFADD__(v79, 1);
      v80 = v79 + 1;
      if (_VF)
        goto LABEL_75;
      v7 = (unint64_t)v76;
      v76[2] = v80;
      OUTLINED_FUNCTION_37_1();
    }
    v143[0] = v7;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_85();
    v10 = v130;
    v12 = v132;
  }
  v128 = v24[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_34_2();
  v26 = 0;
  v27 = MEMORY[0x24BEE4B00];
  while (v26 < *(_QWORD *)(v25 + 16))
  {
    v28 = (uint64_t *)(v25 + 32 + 16 * v26);
    v30 = *v28;
    v29 = v28[1];
    OUTLINED_FUNCTION_113_0();
    swift_isUniquelyReferenced_nonNull_native();
    v141 = (_QWORD *)v27;
    v31 = sub_235F7F384();
    if (__OFADD__(*(_QWORD *)(v27 + 16), (v32 & 1) == 0))
      goto LABEL_72;
    v7 = v31;
    v33 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BC8);
    v34 = sub_235F9B630();
    if ((v34 & 1) != 0)
    {
      v34 = sub_235F7F384();
      if ((v33 & 1) != (v35 & 1))
        goto LABEL_79;
      v7 = v34;
    }
    v27 = (uint64_t)v141;
    if ((v33 & 1) != 0)
    {
      OUTLINED_FUNCTION_214(v34, v35, v36, v37, v38, v39, v40, v41, v112, v114, v116, v118, v120, v122, v124, v126, v128, v130, v132,
        v134,
        v136,
        v138,
        v42);
    }
    else
    {
      OUTLINED_FUNCTION_100((uint64_t)&v141[v7 >> 6]);
      v43 = (uint64_t *)(*(_QWORD *)(v27 + 48) + 16 * v7);
      *v43 = v30;
      v43[1] = v29;
      OUTLINED_FUNCTION_214(v44, v45, v46, v47, v48, v49, v50, v51, v112, v114, v116, v118, v120, v122, v124, v126, v128, v130, v132,
        v134,
        v136,
        v138,
        v52);
      v53 = *(_QWORD *)(v27 + 16);
      _VF = __OFADD__(v53, 1);
      v54 = v53 + 1;
      if (_VF)
        goto LABEL_73;
      *(_QWORD *)(v27 + 16) = v54;
      OUTLINED_FUNCTION_18_2();
    }
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_85();
    v7 = v142;
    if (!*(_QWORD *)(v142 + 16))
      goto LABEL_54;
    sub_235F9B738();
    OUTLINED_FUNCTION_62();
    sub_235F9B414();
    v55 = sub_235F9B750();
    v56 = -1 << *(_BYTE *)(v7 + 32);
    v57 = v55 & ~v56;
    OUTLINED_FUNCTION_282();
    if ((v58 & 1) == 0)
      goto LABEL_53;
    v59 = *(_QWORD *)(v7 + 48);
    v60 = (_QWORD *)(v59 + 16 * v57);
    _ZF = *v60 == v30 && v60[1] == v29;
    if (!_ZF && (OUTLINED_FUNCTION_31_2() & 1) == 0)
    {
      v138 = ~v56;
      v62 = (v57 + 1) & ~v56;
      if (((*(_QWORD *)(v7 + 56 + ((v62 >> 3) & 0xFFFFFFFFFFFFF8)) >> v62) & 1) == 0)
        goto LABEL_53;
      v63 = (_QWORD *)(v59 + 16 * v62);
      v64 = *v63 == v30 && v63[1] == v29;
      if (!v64 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
      {
        for (i = v62 + 1; ; i = v66 + 1)
        {
          v66 = i & v138;
          OUTLINED_FUNCTION_282();
          if ((v67 & 1) == 0)
            break;
          v68 = (_QWORD *)(v59 + 16 * v66);
          v69 = *v68 == v30 && v68[1] == v29;
          if (v69 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
            goto LABEL_44;
        }
LABEL_53:
        OUTLINED_FUNCTION_27_1();
LABEL_54:
        sub_235F8F2B4((uint64_t *)&v141, v30, v29);
        goto LABEL_55;
      }
    }
LABEL_44:
    OUTLINED_FUNCTION_17();
LABEL_55:
    swift_bridgeObjectRelease();
    if (++v26 == v140)
    {
      OUTLINED_FUNCTION_20();
      v6 = v122;
      v7 = v128;
      goto LABEL_58;
    }
  }
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  swift_once();
LABEL_68:
  v108 = OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_177(v108, (uint64_t)qword_25639A858);
  v109 = OUTLINED_FUNCTION_150();
  if (os_log_type_enabled((os_log_t)v7, v109))
  {
    v110 = (uint8_t *)OUTLINED_FUNCTION_23_0();
    *(_WORD *)v110 = 0;
    OUTLINED_FUNCTION_125(&dword_235F59000, v7, v109, "Generated features", v110);
    OUTLINED_FUNCTION_8_0();
  }

  return v143[0];
}

void sub_235F8D330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  Class isa;
  NSObject *v50;
  _QWORD *v51;
  NSObject v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  id v56;
  unint64_t v57;
  char v58;
  char v59;
  unint64_t v60;
  char v61;
  void (**v62)(void);
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  NSObject *v69;
  NSObject *v70;
  __int128 v71;
  unint64_t v72;
  unint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id *v95;
  double v96;
  id v97;
  uint64_t v98;
  double v99;
  double v100;
  uint64_t v101;
  os_log_type_t v102;
  _BOOL4 v103;
  uint8_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  os_log_type_t v108;
  uint8_t *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  _QWORD v114[7];
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  __int128 v119;
  uint8_t *v120;
  NSObject *v121;
  void (*v122)(void);
  uint64_t v123[3];
  uint64_t v124;
  uint64_t v125;

  OUTLINED_FUNCTION_36_2();
  a21 = v23;
  a22 = v24;
  v115 = v25;
  v116 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v116 - 8));
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v28);
  v117 = (uint64_t)v114 - v29;
  v30 = objc_msgSend((id)objc_opt_self(), sel_sharedPhotoLibrary);
  v31 = objc_msgSend(v30, sel_librarySpecificFetchOptions);
  objc_msgSend(v31, sel_setFetchLimit_, 1000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
  v32 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v32 + 16) = xmmword_235F9D670;
  *(_QWORD *)(v32 + 32) = sub_235F9B3FC();
  *(_QWORD *)(v32 + 40) = v33;
  *(_QWORD *)(v32 + 48) = sub_235F9B3FC();
  *(_QWORD *)(v32 + 56) = v34;
  *(_QWORD *)(v32 + 64) = sub_235F9B3FC();
  *(_QWORD *)(v32 + 72) = v35;
  *(_QWORD *)(v32 + 80) = sub_235F9B3FC();
  *(_QWORD *)(v32 + 88) = v36;
  *(_QWORD *)(v32 + 96) = sub_235F9B3FC();
  *(_QWORD *)(v32 + 104) = v37;
  *(_QWORD *)(v32 + 112) = sub_235F9B3FC();
  *(_QWORD *)(v32 + 120) = v38;
  sub_235F904E4();
  v39 = OUTLINED_FUNCTION_62();
  v40 = sub_235F8F040(v39);
  OUTLINED_FUNCTION_27_1();
  v41 = (void *)objc_opt_self();
  v42 = (void *)sub_235F9B444();
  v114[5] = v31;
  v43 = objc_msgSend(v41, sel_fetchAssetsWithLocalIdentifiers_options_, v42, v31);

  v114[6] = v30;
  v44 = objc_msgSend(v30, sel_librarySpecificFetchOptions);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399768);
  v45 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v45 + 16) = xmmword_235F9D780;
  OUTLINED_FUNCTION_91_0(v45, (unint64_t *)&qword_256399FD0);
  *(_QWORD *)(v45 + 32) = sub_235F9B594();
  *(_QWORD *)(v45 + 40) = sub_235F9B594();
  v123[0] = v45;
  sub_235F9B468();
  sub_235F90528(v123[0]);
  objc_msgSend(v44, sel_setIncludeTorsoAndFaceDetectionData_, 1);
  v46 = (void *)objc_opt_self();
  v114[4] = v43;
  v114[3] = v44;
  v47 = (unint64_t)objc_msgSend(v46, sel_fetchFacesGroupedByAssetLocalIdentifierForAssets_options_, v43, v44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B80);
  v48 = sub_235F9B3CC();

  isa = v40[2].isa;
  if (!isa)
  {
    OUTLINED_FUNCTION_35();
    v51 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_18;
  }
  v121 = v40;
  v50 = v40 + 5;
  v51 = (_QWORD *)MEMORY[0x24BEE4B00];
  v122 = (void (*)(void))v48;
  while (1)
  {
    v22 = (void (*)(void))v50[-1].isa;
    v52.isa = v50->isa;
    v53 = *(_QWORD *)(v48 + 16);
    OUTLINED_FUNCTION_166();
    if (v53 && (v54 = OUTLINED_FUNCTION_150_0(), (v55 & 1) != 0))
      v56 = objc_msgSend(*(id *)(*(_QWORD *)(v48 + 56) + 8 * v54), sel_count);
    else
      v56 = 0;
    swift_isUniquelyReferenced_nonNull_native();
    v123[0] = (uint64_t)v51;
    v57 = sub_235F7F384();
    if (__OFADD__(v51[2], (v58 & 1) == 0))
      break;
    v47 = v57;
    v59 = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B88);
    if ((sub_235F9B630() & 1) != 0)
    {
      v60 = OUTLINED_FUNCTION_150_0();
      if ((v59 & 1) != (v61 & 1))
      {
        sub_235F9B6D8();
        __break(1u);
        return;
      }
      v47 = v60;
    }
    v51 = (_QWORD *)v123[0];
    if ((v59 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v123[0] + 56) + 8 * v47) = v56;
    }
    else
    {
      OUTLINED_FUNCTION_100(v123[0] + 8 * (v47 >> 6));
      v62 = (void (**)(void))(v51[6] + 16 * v47);
      *v62 = v22;
      v62[1] = (void (*)(void))v52.isa;
      *(_QWORD *)(v51[7] + 8 * v47) = v56;
      v63 = v51[2];
      v64 = __OFADD__(v63, 1);
      v65 = v63 + 1;
      if (v64)
        goto LABEL_60;
      v51[2] = v65;
      OUTLINED_FUNCTION_166();
    }
    v50 += 2;
    OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_85();
    isa = (Class)((char *)isa - 1);
    v48 = (uint64_t)v122;
    if (!isa)
    {
      OUTLINED_FUNCTION_35();
LABEL_18:
      swift_release();
      v120 = (uint8_t *)(v51 + 8);
      OUTLINED_FUNCTION_70_0();
      v68 = v67 & v66;
      OUTLINED_FUNCTION_259();
      v121 = v69;
      OUTLINED_FUNCTION_42_1();
      v70 = 0;
      v50 = qword_25639A858;
      *(_QWORD *)&v71 = 136315394;
      v119 = v71;
      v118 = MEMORY[0x24BEE4AD8] + 8;
      while (1)
      {
        if (v68)
        {
          v72 = __clz(__rbit64(v68));
          v68 &= v68 - 1;
          v73 = v72 | ((_QWORD)v70 << 6);
        }
        else
        {
          if (__OFADD__(v70, 1))
            goto LABEL_59;
          OUTLINED_FUNCTION_144_0();
          if (v74 == v64)
          {
LABEL_42:
            swift_release();
            v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399B70);
            v50 = MEMORY[0x24BEE4AF8];
            OUTLINED_FUNCTION_60();
            v125 = OUTLINED_FUNCTION_294();
            OUTLINED_FUNCTION_60();
            v121 = v92;
            v124 = OUTLINED_FUNCTION_294();
            v93 = v114[2];
            OUTLINED_FUNCTION_179();
            OUTLINED_FUNCTION_53_2();
            v22 = *(void (**)(void))(v114[1] + 8);
            OUTLINED_FUNCTION_116();
            v22();
            OUTLINED_FUNCTION_179();
            OUTLINED_FUNCTION_53_2();
            ((void (*)(uint64_t, NSObject *))v22)(v93, v50);
            v94 = *(_QWORD *)(v115 + 16);
            if (v94)
            {
              v95 = (id *)(swift_bridgeObjectRetain() + 40);
              v50 = &selRef_identifier;
              do
              {
                v96 = *((double *)v95 - 1);
                v97 = *v95;
                sub_235F90650(v97, (SEL *)&selRef_identifier);
                if (v98)
                {
                  OUTLINED_FUNCTION_187();
                  if (v99 < v96)
                  {
                    OUTLINED_FUNCTION_188();
                    OUTLINED_FUNCTION_42_1();
                    OUTLINED_FUNCTION_79_2((uint64_t)&v125);
                    OUTLINED_FUNCTION_43_0();
                  }
                  OUTLINED_FUNCTION_187();
                  if (v100 < v96)
                  {
                    OUTLINED_FUNCTION_188();
                    OUTLINED_FUNCTION_42_1();
                    OUTLINED_FUNCTION_79_2((uint64_t)&v124);
                    OUTLINED_FUNCTION_43_0();
                  }
                  OUTLINED_FUNCTION_25();
                }

                v95 += 2;
                --v94;
              }
              while (v94);
              OUTLINED_FUNCTION_77_2();
            }
            if (qword_256399440 != -1)
              goto LABEL_62;
            goto LABEL_53;
          }
          OUTLINED_FUNCTION_145_0();
          v70 = v75;
          if (!v76)
          {
            v70 = (v75 + 1);
            if (v75 + 1 >= (uint64_t)v121)
              goto LABEL_42;
            if (!*(_QWORD *)&v120[8 * (_QWORD)v70])
            {
              v70 = (v75 + 2);
              if (v75 + 2 >= (uint64_t)v121)
                goto LABEL_42;
              if (!*(_QWORD *)&v120[8 * (_QWORD)v70])
              {
                OUTLINED_FUNCTION_144_0();
                if (v74 == v64)
                  goto LABEL_42;
                OUTLINED_FUNCTION_145_0();
                if (!v78)
                {
                  while (1)
                  {
                    v70 = (v77 + 1);
                    if (__OFADD__(v77, 1))
                      goto LABEL_61;
                    if ((uint64_t)v70 >= (uint64_t)v121)
                      goto LABEL_42;
                    ++v77;
                    if (*(_QWORD *)&v120[8 * (_QWORD)v70])
                      goto LABEL_36;
                  }
                }
                v70 = v77;
              }
            }
          }
LABEL_36:
          OUTLINED_FUNCTION_251();
          v68 = v80 & v79;
          v73 = v81 + ((_QWORD)v70 << 6);
        }
        v82 = v51[6] + 16 * v73;
        v22 = *(void (**)(void))v82;
        v83 = *(_QWORD *)(v82 + 8);
        v84 = *(_QWORD *)(v51[7] + 8 * v73);
        v85 = qword_256399440;
        OUTLINED_FUNCTION_37_1();
        if (v85 != -1)
          swift_once();
        v86 = OUTLINED_FUNCTION_19_1();
        v87 = __swift_project_value_buffer(v86, (uint64_t)qword_25639A858);
        OUTLINED_FUNCTION_37_1();
        sub_235F9B36C();
        v88 = OUTLINED_FUNCTION_183();
        if (OUTLINED_FUNCTION_98_0(v88))
        {
          v89 = OUTLINED_FUNCTION_23_0();
          v122 = (void (*)(void))v70;
          v90 = v89;
          v123[0] = OUTLINED_FUNCTION_23_0();
          *(_DWORD *)v90 = v119;
          OUTLINED_FUNCTION_37_1();
          sub_235F7EC30((uint64_t)v22, v83, v123);
          *(_QWORD *)(v90 + 4) = v91;
          OUTLINED_FUNCTION_241();
          *(_WORD *)(v90 + 12) = 2048;
          *(_QWORD *)(v90 + 14) = v84;
          OUTLINED_FUNCTION_154(&dword_235F59000, v87, (os_log_type_t)v47, "assetID: %s, faceCount: %ld", (uint8_t *)v90);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_8_0();
        }

        OUTLINED_FUNCTION_62_0();
      }
    }
  }
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  swift_once();
LABEL_53:
  v101 = OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_177(v101, (uint64_t)qword_25639A858);
  v102 = OUTLINED_FUNCTION_150();
  v103 = OUTLINED_FUNCTION_111_0(v50);
  v122 = v22;
  if (v103)
  {
    v104 = (uint8_t *)OUTLINED_FUNCTION_23_0();
    v123[0] = OUTLINED_FUNCTION_23_0();
    *(_DWORD *)v104 = 136315138;
    v120 = v104 + 4;
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_166();
    v105 = sub_235F9B3D8();
    OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_76_1(v105, v106, v123);
    OUTLINED_FUNCTION_89_0(v107);
    sub_235F9B5AC();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_52_1(&dword_235F59000, v50, v102, "PhotosSearchClient plugin: photoIDCountGivenFaceCountDictWeek %s", v104);
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_8_0();
  }

  sub_235F9B36C();
  v108 = OUTLINED_FUNCTION_150();
  if (os_log_type_enabled(v50, v108))
  {
    v109 = (uint8_t *)OUTLINED_FUNCTION_23_0();
    v123[0] = OUTLINED_FUNCTION_23_0();
    *(_DWORD *)v109 = 136315138;
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_48();
    v110 = sub_235F9B3D8();
    v112 = v111;
    OUTLINED_FUNCTION_9_1();
    sub_235F7EC30(v110, v112, v123);
    OUTLINED_FUNCTION_39_3(v113);
    sub_235F9B5AC();
    OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_52_1(&dword_235F59000, v50, v108, "PhotosSearchClient plugin: photoIDCountGivenFaceCountDictMonth %s", v109);
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_8_0();
  }
  OUTLINED_FUNCTION_63_0((uint64_t)&a14);
  OUTLINED_FUNCTION_63_0((uint64_t)&a13);
  OUTLINED_FUNCTION_63_0((uint64_t)&a12);

  OUTLINED_FUNCTION_63_0((uint64_t)&a15);
  OUTLINED_FUNCTION_116();
  v122();
  OUTLINED_FUNCTION_127(v117);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5();
}

void sub_235F8DDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  os_log_type_t v22;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  unsigned int v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BOOL8 v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  os_log_type_t v90;
  unint64_t v91;
  char v92;
  _QWORD *v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  void (*v100)(void);
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  os_log_type_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(void);
  uint64_t v125;
  id *v126;
  double v127;
  uint64_t v128;
  double v129;
  double v130;
  uint64_t v131;
  NSObject *v132;
  os_log_type_t v133;
  uint8_t *v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  os_log_type_t v139;
  uint8_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t *v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD *v158;
  void (*v159)(void);
  _QWORD *v160;
  _QWORD *v161;
  uint64_t v162[3];
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;

  OUTLINED_FUNCTION_36_2();
  a21 = v23;
  a22 = v24;
  v147 = v25;
  v148 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v148 - 8));
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_2();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_14_2();
  v29 = MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_81_0(v29, v30, v31, v32, v33, v34, v35, v36, v144);
  v37 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedPhotoLibrary), sel_librarySpecificFetchOptions);
  objc_msgSend(v37, sel_setFetchLimit_, 1000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
  v38 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v38 + 16) = xmmword_235F9D670;
  *(_QWORD *)(v38 + 32) = sub_235F9B3FC();
  *(_QWORD *)(v38 + 40) = v39;
  *(_QWORD *)(v38 + 48) = sub_235F9B3FC();
  *(_QWORD *)(v38 + 56) = v40;
  *(_QWORD *)(v38 + 64) = sub_235F9B3FC();
  *(_QWORD *)(v38 + 72) = v41;
  *(_QWORD *)(v38 + 80) = sub_235F9B3FC();
  *(_QWORD *)(v38 + 88) = v42;
  *(_QWORD *)(v38 + 96) = sub_235F9B3FC();
  *(_QWORD *)(v38 + 104) = v43;
  *(_QWORD *)(v38 + 112) = sub_235F9B3FC();
  *(_QWORD *)(v38 + 120) = v44;
  OUTLINED_FUNCTION_92_0();
  sub_235F904E4();
  v45 = OUTLINED_FUNCTION_62();
  v46 = (unint64_t)sub_235F8F040(v45);
  OUTLINED_FUNCTION_27_1();
  v47 = (void *)objc_opt_self();
  v48 = sub_235F9B444();
  v49 = objc_msgSend(v47, sel_fetchAssetsWithLocalIdentifiers_options_, v48, v37);

  v50 = objc_msgSend((id)objc_opt_self(), sel_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_, v49);
  if (v50)
  {
    v51 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B78);
    v48 = sub_235F9B3CC();

    v52 = sub_235F94624(v48);
    OUTLINED_FUNCTION_35();
  }
  else
  {
    v52 = 0;
  }
  v156 = *(_QWORD *)(v46 + 16);
  if (!v156)
  {
    swift_release();
    OUTLINED_FUNCTION_20();
    v55 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_57;
  }
  v53 = 0;
  v54 = MEMORY[0x24BEE4B08];
  v55 = (_QWORD *)MEMORY[0x24BEE4B00];
  v155 = (uint64_t *)(v46 + 32);
  v154 = (uint64_t *)v46;
  v153 = v52;
  while (1)
  {
    if (v53 >= *(_QWORD *)(v46 + 16))
    {
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
      goto LABEL_102;
    }
    v56 = &v155[2 * v53];
    v57 = *v56;
    v46 = v56[1];
    if (!v52)
    {
      OUTLINED_FUNCTION_18_2();
LABEL_40:
      v64 = MEMORY[0x24BEE4AF8];
      goto LABEL_41;
    }
    v58 = *(_QWORD *)(v52 + 16);
    OUTLINED_FUNCTION_18_2();
    if (!v58)
      goto LABEL_40;
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_34_2();
    v59 = sub_235F7F384();
    if ((v60 & 1) == 0)
    {
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_20();
      goto LABEL_40;
    }
    v48 = *(_QWORD *)(*(_QWORD *)(v52 + 56) + 8 * v59);
    OUTLINED_FUNCTION_58_0();
    OUTLINED_FUNCTION_17();
    v61 = v48;
    swift_bridgeObjectRelease();
    if (!v48)
      goto LABEL_40;
    v149 = v57;
    v150 = (uint64_t *)v46;
    if (!((unint64_t)v48 >> 62))
    {
      v62 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v62)
        break;
      goto LABEL_54;
    }
    if (v48 >= 0)
      v48 &= 0xFFFFFFFFFFFFFF8uLL;
    OUTLINED_FUNCTION_34_2();
    v62 = OUTLINED_FUNCTION_69_2();
    OUTLINED_FUNCTION_20();
    if (v62)
      break;
LABEL_54:
    OUTLINED_FUNCTION_20();
    v64 = MEMORY[0x24BEE4AF8];
LABEL_55:
    v46 = (unint64_t)v150;
    v57 = v149;
LABEL_41:
    v48 = (uint64_t)v55;
    swift_isUniquelyReferenced_nonNull_native();
    v162[0] = (uint64_t)v55;
    v87 = v57;
    v88 = v46;
    v89 = sub_235F7F384();
    if (__OFADD__(v55[2], (v90 & 1) == 0))
      goto LABEL_98;
    v46 = v89;
    v22 = v90;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B68);
    v48 = (uint64_t)v162;
    if ((sub_235F9B630() & 1) == 0)
      goto LABEL_45;
    v48 = v162[0];
    v91 = OUTLINED_FUNCTION_10_3();
    if ((v22 & 1) != (v92 & 1))
    {
      sub_235F9B6D8();
      __break(1u);
      return;
    }
    v46 = v91;
LABEL_45:
    v55 = (_QWORD *)v162[0];
    if ((v22 & 1) != 0)
    {
      v48 = *(_QWORD *)(v162[0] + 56);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v48 + 8 * v46) = v64;
    }
    else
    {
      OUTLINED_FUNCTION_100(v162[0] + 8 * (v46 >> 6));
      v93 = (_QWORD *)(v55[6] + 16 * v46);
      *v93 = v87;
      v93[1] = v88;
      *(_QWORD *)(v55[7] + 8 * v46) = v64;
      v94 = v55[2];
      v95 = __OFADD__(v94, 1);
      v96 = v94 + 1;
      if (v95)
        goto LABEL_100;
      v55[2] = v96;
      swift_bridgeObjectRetain();
    }
    ++v53;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_85();
    v46 = (unint64_t)v154;
    v52 = v153;
    if (v53 == v156)
    {
      OUTLINED_FUNCTION_20();
      swift_release();
LABEL_57:
      v158 = v55 + 8;
      OUTLINED_FUNCTION_70_0();
      v99 = v98 & v97;
      OUTLINED_FUNCTION_259();
      v159 = v100;
      v161 = v55;
      OUTLINED_FUNCTION_37_1();
      v101 = 0;
      v46 = (unint64_t)qword_25639A858;
      while (1)
      {
        if (v99)
        {
          v102 = __clz(__rbit64(v99));
          v99 &= v99 - 1;
          v103 = v102 | (v101 << 6);
        }
        else
        {
          if (__OFADD__(v101, 1))
            goto LABEL_99;
          OUTLINED_FUNCTION_144_0();
          if (v104 == v95)
          {
LABEL_81:
            swift_release();
            v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399B70);
            LOBYTE(v46) = MEMORY[0x24BEE0D10];
            OUTLINED_FUNCTION_92_0();
            v164 = OUTLINED_FUNCTION_127_0();
            OUTLINED_FUNCTION_92_0();
            v163 = OUTLINED_FUNCTION_127_0();
            v48 = v146;
            OUTLINED_FUNCTION_179();
            OUTLINED_FUNCTION_53_2();
            v124 = *(void (**)(void))(v145 + 8);
            OUTLINED_FUNCTION_116();
            v124();
            OUTLINED_FUNCTION_179();
            OUTLINED_FUNCTION_53_2();
            v159 = v124;
            ((void (*)(uint64_t, uint64_t))v124)(v146, v123);
            v125 = *(_QWORD *)(v147 + 16);
            if (v125)
            {
              v126 = (id *)(swift_bridgeObjectRetain() + 40);
              do
              {
                v127 = *((double *)v126 - 1);
                v46 = (unint64_t)*v126;
                sub_235F90650((void *)v46, (SEL *)&selRef_identifier);
                if (v128)
                {
                  OUTLINED_FUNCTION_187();
                  if (v129 < v127)
                  {
                    v48 = OUTLINED_FUNCTION_188();
                    OUTLINED_FUNCTION_166();
                    OUTLINED_FUNCTION_48();
                    OUTLINED_FUNCTION_73_2((uint64_t)&v164);
                    OUTLINED_FUNCTION_111();
                    OUTLINED_FUNCTION_9_1();
                  }
                  OUTLINED_FUNCTION_187();
                  if (v130 < v127)
                  {
                    v48 = OUTLINED_FUNCTION_188();
                    OUTLINED_FUNCTION_166();
                    OUTLINED_FUNCTION_48();
                    OUTLINED_FUNCTION_73_2((uint64_t)&v163);
                    OUTLINED_FUNCTION_111();
                    OUTLINED_FUNCTION_9_1();
                  }
                  OUTLINED_FUNCTION_39();
                }

                v126 += 2;
                --v125;
              }
              while (v125);
              OUTLINED_FUNCTION_77_2();
            }
            OUTLINED_FUNCTION_9_1();
            if (qword_256399440 != -1)
              goto LABEL_103;
            goto LABEL_92;
          }
          OUTLINED_FUNCTION_145_0();
          v101 = v105;
          if (!v106)
          {
            v101 = v105 + 1;
            if (v105 + 1 >= (uint64_t)v159)
              goto LABEL_81;
            if (!v158[v101])
            {
              v101 = v105 + 2;
              if (v105 + 2 >= (uint64_t)v159)
                goto LABEL_81;
              if (!v158[v101])
              {
                OUTLINED_FUNCTION_144_0();
                if (v104 == v95)
                  goto LABEL_81;
                OUTLINED_FUNCTION_145_0();
                if (!v108)
                {
                  while (1)
                  {
                    v101 = v107 + 1;
                    if (__OFADD__(v107, 1))
                      goto LABEL_101;
                    if (v101 >= (uint64_t)v159)
                      goto LABEL_81;
                    ++v107;
                    if (v158[v101])
                      goto LABEL_75;
                  }
                }
                v101 = v107;
              }
            }
          }
LABEL_75:
          OUTLINED_FUNCTION_251();
          v99 = v110 & v109;
          v103 = v111 + (v101 << 6);
        }
        v112 = *(_QWORD *)(v161[6] + 16 * v103);
        v113 = qword_256399440;
        OUTLINED_FUNCTION_42_1();
        OUTLINED_FUNCTION_166();
        if (v113 != -1)
          swift_once();
        v114 = OUTLINED_FUNCTION_19_1();
        v48 = __swift_project_value_buffer(v114, (uint64_t)qword_25639A858);
        OUTLINED_FUNCTION_42_1();
        OUTLINED_FUNCTION_166();
        sub_235F9B36C();
        v115 = OUTLINED_FUNCTION_183();
        if (OUTLINED_FUNCTION_101_0(v115))
        {
          v116 = OUTLINED_FUNCTION_23_0();
          v162[0] = OUTLINED_FUNCTION_23_0();
          *(_DWORD *)v116 = 136315394;
          OUTLINED_FUNCTION_42_1();
          OUTLINED_FUNCTION_96_0(v112, v117, v162);
          *(_QWORD *)(v116 + 4) = v118;
          OUTLINED_FUNCTION_241();
          *(_WORD *)(v116 + 12) = 2080;
          v119 = OUTLINED_FUNCTION_166();
          v120 = MEMORY[0x23B7E7668](v119, MEMORY[0x24BEE1768]);
          OUTLINED_FUNCTION_111();
          OUTLINED_FUNCTION_96_0(v120, v121, v162);
          *(_QWORD *)(v116 + 14) = v122;
          OUTLINED_FUNCTION_62_0();
          OUTLINED_FUNCTION_43_0();
          OUTLINED_FUNCTION_154(&dword_235F59000, v48, v22, "assetID: %s, sceneCategory: %s", (uint8_t *)v116);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_8_0();
        }

        OUTLINED_FUNCTION_62_0();
        OUTLINED_FUNCTION_62_0();
      }
    }
  }
  if (v62 >= 1)
  {
    v160 = v55;
    v63 = 0;
    v157 = v61;
    v159 = (void (*)(void))(v61 & 0xC000000000000001);
    v152 = v61 + 32;
    v64 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      if (v159)
        v65 = (id)MEMORY[0x23B7E7818](v63, v157);
      else
        v65 = *(id *)(v152 + 8 * v63);
      v66 = v65;
      v67 = objc_msgSend(v65, sel_sceneIdentifier);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v81 = OUTLINED_FUNCTION_98();
        sub_235F7E278(v81, v82, v83, v64);
        v64 = v84;
      }
      v69 = *(_QWORD *)(v64 + 16);
      v68 = *(_QWORD *)(v64 + 24);
      if (v69 >= v68 >> 1)
      {
        v85 = OUTLINED_FUNCTION_142_0(v68);
        sub_235F7E278(v85, v69 + 1, 1, v64);
        v64 = v86;
      }
      *(_QWORD *)(v64 + 16) = v69 + 1;
      *(_QWORD *)(v64 + 8 * v69 + 32) = v67;
      if (*(_QWORD *)(v54 + 16))
      {
        v70 = OUTLINED_FUNCTION_139_0();
        v71 = -1 << *(_BYTE *)(v54 + 32);
        v72 = v70 & ~v71;
        if (((*(_QWORD *)(v54 + 56 + ((v72 >> 3) & 0xFFFFFFFFFFFFF8)) >> v72) & 1) != 0)
        {
          v73 = *(_QWORD *)(v54 + 48);
          if (*(_QWORD *)(v73 + 8 * v72) == v67)
            goto LABEL_34;
          v74 = ~v71;
          while (1)
          {
            v72 = (v72 + 1) & v74;
            if (((*(_QWORD *)(v54 + 56 + ((v72 >> 3) & 0xFFFFFFFFFFFFF8)) >> v72) & 1) == 0)
              break;
            if (*(_QWORD *)(v73 + 8 * v72) == v67)
              goto LABEL_34;
          }
        }
      }
      v75 = OUTLINED_FUNCTION_139_0();
      v76 = -1 << *(_BYTE *)(v54 + 32);
      v77 = v75 & ~v76;
      if (((*(_QWORD *)(v54 + 56 + ((v77 >> 3) & 0xFFFFFFFFFFFFF8)) >> v77) & 1) == 0)
        goto LABEL_35;
      v78 = *(_QWORD *)(v54 + 48);
      if (*(_QWORD *)(v78 + 8 * v77) != v67)
      {
        v79 = ~v76;
        while (1)
        {
          v77 = (v77 + 1) & v79;
          if (((*(_QWORD *)(v54 + 56 + ((v77 >> 3) & 0xFFFFFFFFFFFFF8)) >> v77) & 1) == 0)
            break;
          if (*(_QWORD *)(v78 + 8 * v77) == v67)
            goto LABEL_34;
        }
LABEL_35:
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v162[0] = v54;
        sub_235F8F984(v67, v77, isUniquelyReferenced_nonNull_native);
        v54 = v162[0];

        OUTLINED_FUNCTION_85();
        goto LABEL_36;
      }
LABEL_34:

LABEL_36:
      if (++v63 == v62)
      {
        swift_bridgeObjectRelease();
        v55 = v160;
        goto LABEL_55;
      }
    }
  }
LABEL_102:
  __break(1u);
LABEL_103:
  swift_once();
LABEL_92:
  v131 = OUTLINED_FUNCTION_19_1();
  v132 = OUTLINED_FUNCTION_177(v131, (uint64_t)qword_25639A858);
  v133 = sub_235F9B504();
  if (os_log_type_enabled(v132, v133))
  {
    v134 = (uint8_t *)OUTLINED_FUNCTION_23_0();
    v162[0] = OUTLINED_FUNCTION_23_0();
    *(_DWORD *)v134 = 136315138;
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_42_1();
    v135 = sub_235F9B3D8();
    v137 = v136;
    OUTLINED_FUNCTION_43_0();
    sub_235F7EC30(v135, v137, v162);
    OUTLINED_FUNCTION_39_3(v138);
    sub_235F9B5AC();
    OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_52_1(&dword_235F59000, v132, v133, "PhotosSearchClient plugin: photoIDCountGivenSceneCategoryDictWeek %s", v134);
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_8_0();
  }

  sub_235F9B36C();
  v139 = OUTLINED_FUNCTION_183();
  if (OUTLINED_FUNCTION_103_0(v139))
  {
    v140 = (uint8_t *)OUTLINED_FUNCTION_23_0();
    v162[0] = OUTLINED_FUNCTION_23_0();
    *(_DWORD *)v140 = 136315138;
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_37_1();
    v141 = sub_235F9B3D8();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_96_0(v141, v142, v162);
    OUTLINED_FUNCTION_39_3(v143);
    sub_235F9B5AC();
    OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_52_1(&dword_235F59000, v48, (os_log_type_t)v46, "PhotosSearchClient plugin: photoIDCountGivenSceneCategoryDictMonth %s", v140);
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_8_0();
  }
  OUTLINED_FUNCTION_63_0((uint64_t)&v165);
  OUTLINED_FUNCTION_63_0((uint64_t)&v164);

  OUTLINED_FUNCTION_63_0((uint64_t)&a9);
  OUTLINED_FUNCTION_116();
  v159();
  OUTLINED_FUNCTION_127(v151);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5();
}

id AMLPhotosSearchBiomeMetrics.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMLPhotosSearchBiomeMetrics.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchBiomeMetrics();
  return objc_msgSendSuper2(&v2, sel_init);
}

id AMLPhotosSearchBiomeMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchBiomeMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_235F8EB8C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55)
{
  void *v55;
  void *v56;
  uint64_t v57;
  void *v60;
  id v66;

  v56 = v55;
  v57 = a3;
  if (a2)
  {
    v60 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
    v57 = a3;
    v56 = v55;
  }
  else
  {
    v60 = 0;
  }
  v66 = objc_msgSend(v56, sel_initWithSearchSessionUUID_uiSurface_matchedPeopleRatio_matchedLocationRatio_matchedSceneRatio_matchedSceneConfidence_matchedSceneBoundingBox_matchedOCRCharacterRatio_matchedOCRImportance_matchedFieldsCount_L1Score_freshness_favorited_aestheticScore_curationScore_hasEverClickInLastWeek_hasEverClickInLastMonth_hasEverShareInLastWeek_hasEverShareInLastMonth_clickCountInLastWeekNormalizedAcrossItems_clickCountInLastMonthNormalizedAcrossItems_shareCountInLastWeekNormalizedAcrossItems_shareCountInLastMonthNormalizedAcrossItems_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems_clickCountGivenLocationInLastWeekNormalizedAcrossItems_clickCountGivenLocationInLastMonthNormalizedAcrossItems_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems_shareCountGivenLocationInLastWeekNormalizedAcrossItems_shareCountGivenLocationInLastMonthNormalizedAcrossItems_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems_shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems_shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems_clipScore_clicked_clickOrder_itemPosition_L2ModelScore_isDuplicate_isCompleteMatch_, v60, v57, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
          a19,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          a28,
          a29,
          a30,
          a31,
          a32,
          a33,
          a34,
          a35,
          a36,
          a37,
          a38,
          a39,
          a40,
          a41,
          a42,
          a43,
          a44,
          a45,
          a46,
          a47,
          a48,
          a49,
          a50,
          a51,
          a52,
          a53,
          a54,
          a55);

  return v66;
}

uint64_t sub_235F8F024(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

_QWORD *sub_235F8F040(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
  v3 = (_QWORD *)OUTLINED_FUNCTION_1();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_235F90A38((uint64_t)&v7, v3 + 4, v1, a1);
  OUTLINED_FUNCTION_34_2();
  sub_235F72990();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_235F8F118(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;
  _QWORD v7[3];

  v2 = a2 - (_QWORD)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
    v4 = (uint64_t)result;
    if (v2 <= 0)
    {
      v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399BE8);
      v5 = (_QWORD *)OUTLINED_FUNCTION_1();
      v6 = _swift_stdlib_malloc_size(v5);
      v5[2] = v2;
      v5[3] = 2 * ((uint64_t)(v6 - 32) / 8);
    }
    result = sub_235F90C34(v7, v5 + 4, v2, v4, a2);
    if (result == (_QWORD *)v2)
      return v5;
  }
  __break(1u);
  return result;
}

_QWORD *sub_235F8F1D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_235F90CB8((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_235F72990();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_235F8F2B4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;

  v7 = *v3;
  sub_235F9B738();
  OUTLINED_FUNCTION_37_1();
  sub_235F9B414();
  v8 = sub_235F9B750();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  OUTLINED_FUNCTION_106_0();
  if ((v11 & 1) != 0)
  {
    v12 = *(_QWORD *)(v7 + 48);
    v13 = (_QWORD *)(v12 + 16 * v10);
    v14 = *v13 == a2 && v13[1] == a3;
    if (v14 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
    {
LABEL_7:
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_25();
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_106_0();
      if ((v19 & 1) == 0)
        break;
      v20 = (_QWORD *)(v12 + 16 * v10);
      v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
        goto LABEL_7;
    }
  }
  OUTLINED_FUNCTION_25();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *v3;
  *v3 = 0x8000000000000000;
  OUTLINED_FUNCTION_18_2();
  sub_235F8FAA4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_235F8F42C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399EF8);
  result = sub_235F9B5E8();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v7 = (uint64_t *)(v2 + 56);
    v6 = *(_QWORD *)(v2 + 56);
    v8 = 1 << *(_BYTE *)(v2 + 32);
    v27 = -1 << v8;
    v28 = v1;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & v6;
    v29 = 1 << *(_BYTE *)(v2 + 32);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = result + 56;
    if ((v9 & v6) == 0)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v13 | (v5 << 6); ; i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_235F9B72C();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v15 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v15 >= v11)
        goto LABEL_32;
      v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        v5 = v15 + 1;
        if (v15 + 1 >= v11)
          goto LABEL_32;
        v16 = v7[v5];
        if (!v16)
        {
          v5 = v15 + 2;
          if (v15 + 2 >= v11)
            goto LABEL_32;
          v16 = v7[v5];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63)
                sub_235F8F024(0, v11, (_QWORD *)(v2 + 56));
              else
                *v7 = v27;
              v1 = v28;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                v5 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v5 >= v11)
                  goto LABEL_32;
                v16 = v7[v5];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v5 = v17;
          }
        }
      }
LABEL_20:
      v10 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_235F8F6AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399F00);
  v3 = sub_235F9B5E8();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_235F9B738();
      sub_235F9B414();
      result = sub_235F9B750();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_235F8F024(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_235F8F984(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_235F8F42C();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_235F8FC3C();
      goto LABEL_14;
    }
    sub_235F8FF80();
  }
  v8 = *v3;
  result = sub_235F9B72C();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_235F9B6CC();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_235F8FAA4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_235F8F6AC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_235F8FDD0();
      goto LABEL_22;
    }
    sub_235F901DC();
  }
  v11 = *v4;
  sub_235F9B738();
  sub_235F9B414();
  result = sub_235F9B750();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_235F9B6C0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_235F9B6CC();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_235F9B6C0();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_235F8FC3C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399EF8);
  v2 = *v0;
  v3 = sub_235F9B5DC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    if (v12)
      goto LABEL_11;
LABEL_12:
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_235F8FDD0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399F00);
  v2 = *v0;
  v3 = sub_235F9B5DC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_235F8FF80()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399EF8);
  result = sub_235F9B5E8();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  if (!v9)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_235F9B72C();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v21) = v17;
    ++*(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_6;
LABEL_7:
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_36;
    if (v14 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    result = swift_release();
    v1 = v26;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_235F901DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399F00);
  v3 = sub_235F9B5E8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_235F9B738();
    swift_bridgeObjectRetain();
    sub_235F9B414();
    result = sub_235F9B750();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_235F90484(void *a1)
{
  id v2;

  v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (v2)
  {
    sub_235F9B3FC();

  }
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_24();
}

void sub_235F904E4()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v8 = sub_235F9B444();
  v0 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_130_0(v0, sel_setFetchPropertySets_, v1, v2, v3, v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_32_5(v9);
}

void sub_235F90528(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  OUTLINED_FUNCTION_91_0(a1, (unint64_t *)&qword_256399FD0);
  v9 = sub_235F9B444();
  v1 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_130_0(v1, sel_setIncludedDetectionTypes_, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_32_5(v10);
}

void sub_235F90580(void *a1)
{
  sub_235F90650(a1, (SEL *)&selRef_assetUUID);
}

void sub_235F9058C(void *a1)
{
  sub_235F90650(a1, (SEL *)&selRef_identifier);
}

void sub_235F90598(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_235F9B3F0();
  objc_msgSend(a3, sel_setSearchSessionUUID_, v4);

}

uint64_t sub_235F905DC(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_metadata);

  if (!v2)
    return 0;
  v3 = sub_235F9B3CC();

  return v3;
}

void sub_235F90650(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_235F9B3FC();

  }
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_24();
}

uint64_t sub_235F906A0()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_235F906C8()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_235F906FC(void *a1)
{
  uint64_t v1;

  sub_235F8A980(a1, *(_QWORD *)(v1 + 24), *(void **)(v1 + 40), *(_QWORD *)(v1 + 48), *(double *)(v1 + 16), *(double *)(v1 + 32));
}

uint64_t type metadata accessor for AMLPhotosSearchBiomeMetrics()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for InteractionSignals(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for InteractionSignals(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InteractionSignals(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 64) = v3;
  return result;
}

ValueMetadata *type metadata accessor for InteractionSignals()
{
  return &type metadata for InteractionSignals;
}

uint64_t method lookup function for AMLPhotosSearchBiomeMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.petPayloads(doUpload:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.petPayloads(doUpload:interactionStorePath:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.populateLabeledDataStream(withPetPayload:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickedInTimeInterval(forFeedbackEvent:startTimeInterval:endTimeInterval:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickedInLastMonth(forFeedbackEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickedInLastWeek(forFeedbackEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickOrderForPhotosId(feedbackSnapshot:fromFeedbackData:andRawSearchEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.itemPositionForPhotosId(feedbackId:rawSearchPresentedAssets:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.sharedInLastWeek(feedbackTimestamp:feedbackEvent:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.sharedInLastMonth(feedbackTimestamp:feedbackEvent:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.sharedPhoto(feedbackTimestamp:feedbackEvent:startTime:endTime:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.shareCountGivenDayCategory(feedbackTimestamp:feedbackEvent:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.shareCountGivenFaceCountCategory(feedbackTimestamp:feedbackEvent:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.shareCountGivenLocation(feedbackTimestamp:feedbackEvent:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.shareCountGivenSceneCategory(feedbackTimestamp:feedbackEvent:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.shareCountGivenTimeOfDay(feedbackTimestamp:feedbackEvent:interactionStorePath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickCountGivenDayCategory(feedbackTimestamp:feedbackEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickCountGivenLocation(feedbackTimestamp:feedbackEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickCountGivenTimeOfDay(feedbackTimestamp:feedbackEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.clickCountRecencyCategory(feedbackTimestamp:feedbackEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AMLPhotosSearchBiomeMetrics.rawSearchStream(forFeedbackEvent:atTime:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t sub_235F90A38(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

_QWORD *sub_235F90C34(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    v5 = a4;
LABEL_7:
    *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (_QWORD *)a3;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    if (a5 == a4)
    {
LABEL_5:
      a3 = 0;
      goto LABEL_6;
    }
    if (a5 >= a4)
    {
      if (a5 <= a4)
      {
LABEL_17:
        __break(1u);
LABEL_18:
        v5 = a5;
        a3 = a5 - a4;
      }
      else
      {
        v6 = a3 - 1;
        v5 = a4 + 1;
        while (1)
        {
          *a2 = v5 - 1;
          if (!v6)
            break;
          if (a5 == v5)
            goto LABEL_18;
          ++a2;
          --v6;
          v7 = v5 >= a4 && v5 < a5;
          ++v5;
          if (!v7)
            goto LABEL_17;
        }
      }
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_235F90CB8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

id OUTLINED_FUNCTION_0_7(void *a1)
{
  uint64_t v1;
  double v2;

  return objc_msgSend(a1, (SEL)(v1 + 2742), v2);
}

id OUTLINED_FUNCTION_1_4()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 1760));
}

id OUTLINED_FUNCTION_3_5()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 1760));
}

id OUTLINED_FUNCTION_5_4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 0.0);
}

unint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return sub_235F9B4B0();
}

void OUTLINED_FUNCTION_18_4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v0 + 8 * (v1 >> 6) + 64) |= 1 << v1;
  v5 = (_QWORD *)(*(_QWORD *)(v0 + 48) + 16 * v1);
  *v5 = v3;
  v5[1] = v2;
  *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v1) = *(_QWORD *)(v4 - 240);
}

void OUTLINED_FUNCTION_22_4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v0 + 8 * (v1 >> 6) + 64) |= 1 << v1;
  v4 = (_QWORD *)(*(_QWORD *)(v0 + 48) + 16 * v1);
  *v4 = v3;
  v4[1] = v2;
  *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v1) = 1;
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  return sub_235F9B630();
}

void OUTLINED_FUNCTION_28_6(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)(v1 + 8 * a1 + 64) |= 1 << v4;
  v6 = (_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * v4);
  *v6 = v3;
  v6[1] = v2;
  *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v4) = v5;
}

void OUTLINED_FUNCTION_32_5(id a1)
{

}

uint64_t OUTLINED_FUNCTION_39_3(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_51_2()
{
  sub_235F7E1D8();
}

unint64_t OUTLINED_FUNCTION_52_2()
{
  return sub_235F7F384();
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  return sub_235F9B150();
}

uint64_t OUTLINED_FUNCTION_54_2()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  return sub_235F9B450();
}

uint64_t OUTLINED_FUNCTION_69_2()
{
  return sub_235F9B654();
}

uint64_t OUTLINED_FUNCTION_70_1()
{
  return sub_235F9B3E4();
}

uint64_t OUTLINED_FUNCTION_71_2()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_73_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return sub_235F83FBC(a1, v3, v2, v4, v1);
}

uint64_t OUTLINED_FUNCTION_74_1()
{
  return sub_235F9B3E4();
}

void OUTLINED_FUNCTION_76_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  sub_235F7EC30(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_77_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_79_2(uint64_t a1)
{
  uint64_t v1;

  return sub_235F84444(a1, v1);
}

void OUTLINED_FUNCTION_81_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 312) = (char *)&a9 - v9;
}

void OUTLINED_FUNCTION_82_0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  sub_235F7EC30(v0, v1, (uint64_t *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_89_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t OUTLINED_FUNCTION_91_0(uint64_t a1, unint64_t *a2)
{
  return sub_235F6B254(0, a2);
}

uint64_t OUTLINED_FUNCTION_92_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_94_0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 16) = v3;
  v6 = v4 + 16 * v5;
  *(_QWORD *)(v6 + 32) = v1;
  *(_QWORD *)(v6 + 40) = v2;

}

void OUTLINED_FUNCTION_96_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  sub_235F7EC30(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_97_0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

BOOL OUTLINED_FUNCTION_98_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_101_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_102_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

}

BOOL OUTLINED_FUNCTION_103_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_108_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(_QWORD, uint64_t);
  uint64_t v2;

  return v1(*(_QWORD *)(a1 - 256), v2);
}

uint64_t OUTLINED_FUNCTION_109_0()
{
  return sub_235F9B420();
}

BOOL OUTLINED_FUNCTION_111_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_112_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_113_0()
{
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_114_0()
{
  JUMPOUT(0x23B7E7818);
}

id OUTLINED_FUNCTION_117(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(a1, (SEL)(v2 + 250), v1);
}

void OUTLINED_FUNCTION_125(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

void *OUTLINED_FUNCTION_126_0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char aBlock, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  a8 = a1;
  a9 = v9;
  return _Block_copy(&aBlock);
}

uint64_t OUTLINED_FUNCTION_127_0()
{
  return sub_235F9B3E4();
}

uint64_t OUTLINED_FUNCTION_128_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_129_0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

id OUTLINED_FUNCTION_130_0(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  return objc_msgSend(v10, a2, a10);
}

uint64_t OUTLINED_FUNCTION_132_0()
{
  return sub_235F9B510();
}

id OUTLINED_FUNCTION_134()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(*(_QWORD *)(v1 - 112) + 8 * v0);
}

uint64_t OUTLINED_FUNCTION_139_0()
{
  return sub_235F9B72C();
}

uint64_t OUTLINED_FUNCTION_141_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

BOOL OUTLINED_FUNCTION_142_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_146_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

}

id OUTLINED_FUNCTION_147_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_148_0(uint64_t a1, const char *a2)
{
  void *v2;
  double v3;

  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_149_0(uint64_t a1, const char *a2)
{
  void *v2;
  double v3;

  return objc_msgSend(v2, a2, v3);
}

unint64_t OUTLINED_FUNCTION_150_0()
{
  return sub_235F7F384();
}

uint64_t sub_235F91388()
{
  uint64_t v0;

  v0 = sub_235F9B384();
  __swift_allocate_value_buffer(v0, qword_25639A870);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A870);
  return sub_235F9B378();
}

void *sub_235F91400()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v1 = (id)BiomeLibrary();
  v2 = objc_msgSend(v1, sel_AeroML);
  OUTLINED_FUNCTION_43_1();
  v3 = objc_msgSend(v0, sel_RawEvent);
  OUTLINED_FUNCTION_71_2();
  v4 = objc_msgSend(v1, sel_PhotosSearchSession);
  OUTLINED_FUNCTION_43_1();
  return v0;
}

id sub_235F9147C()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  v1 = (id)BiomeLibrary();
  v2 = objc_msgSend(v1, sel_Photos);
  OUTLINED_FUNCTION_43_1();
  v3 = objc_msgSend(v0, sel_Search);
  OUTLINED_FUNCTION_71_2();
  return v1;
}

id sub_235F914DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id result;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v1 = OUTLINED_FUNCTION_0_0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v3);
  v48 = *(_QWORD *)(sub_235F9B06C() - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15_5();
  v50 = MEMORY[0x24BEE4AF8];
  v5 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_59_0()), sel_init);
  v6 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  sub_235F90484(v6);
  v47 = v7;
  v9 = v8;
  OUTLINED_FUNCTION_179();
  sub_235F9B138();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  OUTLINED_FUNCTION_179();
  sub_235F9B054();
  v10 = sub_235F91400();
  sub_235F99070();
  v12 = v11;

  v13 = sub_235F9147C();
  sub_235F992A4();
  v15 = v14;

  v16 = *(_QWORD *)(v12 + 16);
  if (!v16 || !*(_QWORD *)(v15 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_256399448 != -1)
      swift_once();
    v31 = OUTLINED_FUNCTION_19_1();
    v32 = __swift_project_value_buffer(v31, (uint64_t)qword_25639A870);
    OUTLINED_FUNCTION_166();
    swift_bridgeObjectRetain();
    sub_235F9B36C();
    v33 = OUTLINED_FUNCTION_132_0();
    if (OUTLINED_FUNCTION_101_0(v33))
    {
      v34 = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v34 = 134218240;
      OUTLINED_FUNCTION_111();
      v49 = v16;
      sub_235F9B5AC();
      OUTLINED_FUNCTION_111();
      *(_WORD *)(v34 + 12) = 2048;
      v35 = *(_QWORD *)(v15 + 16);
      OUTLINED_FUNCTION_9_1();
      v49 = v35;
      sub_235F9B5AC();
      OUTLINED_FUNCTION_9_1();
      _os_log_impl(&dword_235F59000, v32, (os_log_type_t)v9, "AMLPhotosSearchCAData: Unable to send data to PET; biome streams: raw search %ld or feedback stream %ld are empty",
        (uint8_t *)v34,
        0x16u);
      OUTLINED_FUNCTION_8_0();
    }

    OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_62_0();
    v36 = 0;
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_9_1();
  result = objc_msgSend(objc_allocWithZone((Class)AMLUserLevelPhotosSearchMetrics), sel_init);
  if (result)
  {
    v18 = result;
    OUTLINED_FUNCTION_166();
    sub_235F91C78();
    v19 = OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_61_2(v19, sel_setCoverageDaily_);
    sub_235F91CE4();
    v20 = OUTLINED_FUNCTION_111();
    OUTLINED_FUNCTION_61_2(v20, sel_setCoverageWeekly_);
    sub_235F91EFC();
    OUTLINED_FUNCTION_42_2(v21, sel_setNdcgDaily_);
    sub_235F91E90();
    OUTLINED_FUNCTION_42_2(v22, sel_setNdcgWeekly_);
    sub_235F92A70();
    OUTLINED_FUNCTION_42_2(v23, sel_setTtrDaily_);
    sub_235F929F4();
    OUTLINED_FUNCTION_42_2(v24, sel_setTtrWeekly_);
    OUTLINED_FUNCTION_29_3(3157553, 0xE300000000000000, v25, (SEL *)&selRef_setMetricDefinitionVersion_);
    OUTLINED_FUNCTION_29_3(0x616E206C65646F6DLL, 0xEA0000000000656DLL, v26, (SEL *)&selRef_setModelName_);
    objc_msgSend(v18, sel_setIsProductionModel_, 1);
    if (v9)
    {
      if (qword_256399448 != -1)
        swift_once();
      v27 = OUTLINED_FUNCTION_19_1();
      v28 = __swift_project_value_buffer(v27, (uint64_t)qword_25639A870);
      swift_bridgeObjectRetain_n();
      sub_235F9B36C();
      v29 = OUTLINED_FUNCTION_132_0();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)OUTLINED_FUNCTION_23_0();
        v49 = OUTLINED_FUNCTION_23_0();
        *(_DWORD *)v30 = 136315138;
        swift_bridgeObjectRetain();
        sub_235F7EC30(v47, v9, &v49);
        sub_235F9B5AC();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_235F59000, v28, v29, "AMLPhotosSearchCAMetrics: Perform photos search metrics payload upload to CA. Incoming: %s", v30, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8_0();
      }

      OUTLINED_FUNCTION_62_0();
      v41 = sub_235F91B8C(v47, v9);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_256399448 != -1)
        swift_once();
      v37 = OUTLINED_FUNCTION_19_1();
      v38 = __swift_project_value_buffer(v37, (uint64_t)qword_25639A870);
      sub_235F9B36C();
      v39 = OUTLINED_FUNCTION_132_0();
      if (OUTLINED_FUNCTION_101_0(v39))
      {
        v40 = (uint8_t *)OUTLINED_FUNCTION_23_0();
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_235F59000, v38, OS_LOG_TYPE_DEFAULT, "AMLPhotosSearchCAMetrics: Missing incoming bundleId while performing photos search metrics upload to CA", v40, 2u);
        OUTLINED_FUNCTION_8_0();
      }

      v41 = 0;
    }
    objc_msgSend(v18, sel_setUiSurface_, v41);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_29_3(0xD000000000000016, 0x8000000235F9E700, v42, (SEL *)&selRef_setTrialDeploymentId_);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_29_3(0xD000000000000017, 0x8000000235F9E720, v43, (SEL *)&selRef_setTrialExperimentId_);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_29_3(0xD000000000000015, 0x8000000235F9E740, v44, (SEL *)&selRef_setTrialTreatmentId_);
    v45 = v18;
    MEMORY[0x23B7E7644]();
    v46 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v46 >> 1)
    {
      OUTLINED_FUNCTION_142_0(v46);
      sub_235F9B474();
    }
    sub_235F9B48C();
    sub_235F9B468();

    v36 = v50;
LABEL_23:
    OUTLINED_FUNCTION_54_3(v48);
    return (id)v36;
  }
  __break(1u);
  return result;
}

uint64_t sub_235F91B8C(uint64_t a1, uint64_t a2)
{
  char v3;

  if (!a2)
    return 0;
  if (a1 == 0xD000000000000019)
  {
    OUTLINED_FUNCTION_47_3();
    if (v3)
      return 2;
  }
  if ((OUTLINED_FUNCTION_31_2() & 1) != 0)
    return 2;
  if (a1 == 0xD000000000000013)
  {
    OUTLINED_FUNCTION_47_3();
    if (v3)
      return 1;
  }
  if ((OUTLINED_FUNCTION_31_2() & 1) != 0)
    return 1;
  if (a1 == 0xD000000000000011)
  {
    OUTLINED_FUNCTION_47_3();
    if (v3)
      return 1;
  }
  return (OUTLINED_FUNCTION_31_2() & 1) != 0;
}

void sub_235F91C78()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_6_5();
}

void sub_235F91CE4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_6_5();
}

double sub_235F91D50(uint64_t a1, double a2)
{
  uint64_t v3;
  id *v5;
  double v6;
  double v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;

  if (!a1)
    return 0.0;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v5 = (id *)(a1 + 40);
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      if (*((double *)v5 - 1) >= a2)
      {
        v8 = *v5;
        v9 = objc_msgSend(v8, sel_presentedAssets);
        OUTLINED_FUNCTION_41_2();
        v10 = sub_235F9B450();

        if (v10 >> 62)
        {
          swift_bridgeObjectRetain();
          v11 = sub_235F9B654();

          OUTLINED_FUNCTION_62_0();
        }
        else
        {
          v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
          OUTLINED_FUNCTION_20();

        }
        if (v11 < 1)
          v6 = v6 + 1.0;
        else
          v7 = v7 + 1.0;
      }
      v5 += 2;
      --v3;
    }
    while (v3);
    OUTLINED_FUNCTION_27_1();
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
  }
  return v7 / (v6 + v7);
}

void sub_235F91E90()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_56_2();
  OUTLINED_FUNCTION_6_5();
}

void sub_235F91EFC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_56_2();
  OUTLINED_FUNCTION_6_5();
}

void sub_235F91F68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  double v59;
  BOOL v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double *v70;
  double v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  double *v88;
  double v89;
  double v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  unint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;

  OUTLINED_FUNCTION_37_5();
  v104 = v1;
  v105 = v2;
  v4 = v3;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_28();
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  v7 = OUTLINED_FUNCTION_30_2();
  v93 = *(_QWORD *)(v7 - 8);
  v94 = v7;
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_15_5();
  v9 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_59_0()), sel_init);
  OUTLINED_FUNCTION_55_2();
  sub_235F9B180();
  sub_235F9B054();
  v10 = sub_235F91400();
  OUTLINED_FUNCTION_64_3();
  v12 = v11;

  v13 = sub_235F9147C();
  v92 = v0;
  v91 = v9;
  sub_235F992A4();

  v14 = *(_QWORD *)(v12 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_17();
    v17 = MEMORY[0x24BEE4AF8];
    goto LABEL_102;
  }
  v15 = 0;
  v16 = v12 + 32;
  v17 = MEMORY[0x24BEE4AF8];
  v97 = *(_QWORD *)(v12 + 16);
  v98 = v12;
  v96 = v12 + 32;
  while (1)
  {
    if (v15 >= *(_QWORD *)(v12 + 16))
      goto LABEL_110;
    v18 = v16 + 16 * v15;
    if (*(double *)v18 < v4)
      goto LABEL_98;
    v102 = *(id *)(v18 + 8);
    v19 = objc_msgSend(v102, sel_presentedAssets, v91);
    OUTLINED_FUNCTION_41_2();
    v20 = OUTLINED_FUNCTION_58_2();

    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      v21 = sub_235F9B654();
      OUTLINED_FUNCTION_27_1();
    }
    else
    {
      v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v100 = v15;
    v101 = v17;
    if (v21)
    {
      if (v21 < 1)
        goto LABEL_113;
      v22 = 0;
      v23 = MEMORY[0x24BEE4AF8];
      do
      {
        if ((v20 & 0xC000000000000001) != 0)
          v24 = (id)MEMORY[0x23B7E7818](v22, v20);
        else
          v24 = *(id *)(v20 + 8 * v22 + 32);
        v25 = v24;
        sub_235F90580(v24);
        if (v27)
        {
          v28 = v26;
          v29 = v27;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_72_2();
            v23 = v33;
          }
          v31 = *(_QWORD *)(v23 + 16);
          v30 = *(_QWORD *)(v23 + 24);
          if (v31 >= v30 >> 1)
          {
            OUTLINED_FUNCTION_142_0(v30);
            OUTLINED_FUNCTION_72_2();
            v23 = v34;
          }
          *(_QWORD *)(v23 + 16) = v31 + 1;
          v32 = v23 + 16 * v31;
          *(_QWORD *)(v32 + 32) = v28;
          *(_QWORD *)(v32 + 40) = v29;
        }
        ++v22;

      }
      while (v21 != v22);
    }
    else
    {
      v23 = MEMORY[0x24BEE4AF8];
    }
    OUTLINED_FUNCTION_27_1();
    sub_235F926E4();
    if (v35)
      break;

    OUTLINED_FUNCTION_111();
    v14 = v97;
    v12 = v98;
    v17 = v101;
    v16 = v96;
LABEL_98:
    if (++v15 == v14)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17();
LABEL_102:
      v87 = *(_QWORD *)(v17 + 16);
      if (v87)
      {
        v88 = (double *)(v17 + 32);
        v89 = 0.0;
        do
        {
          v90 = *v88++;
          v89 = v89 + v90;
          --v87;
        }
        while (v87);
      }

      OUTLINED_FUNCTION_20();
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v92, v94);
      OUTLINED_FUNCTION_12_6();
      return;
    }
  }
  v36 = v35;
  v37 = v35[2];
  if (v37)
  {
    v38 = v37 - 1;
    if (v37 != 1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F93FB0();
        v36 = v86;
      }
      v39 = &v36[2 * v37 + 3];
      v40 = v36 + 5;
      v41 = 1;
      do
      {
        if (v41 - 1 != v38)
        {
          v42 = v36[2];
          if (v41 - 1 >= v42)
          {
LABEL_107:
            __break(1u);
LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
LABEL_110:
            __break(1u);
LABEL_111:
            __break(1u);
            goto LABEL_112;
          }
          if (v38 >= v42)
            goto LABEL_108;
          v43 = *(v40 - 1);
          v44 = *v40;
          v45 = *v39;
          *(v40 - 1) = *(v39 - 1);
          *v40 = v45;
          v46 = v36[2];
          swift_bridgeObjectRetain();
          if (v38 >= v46)
            goto LABEL_109;
          *(v39 - 1) = v43;
          *v39 = v44;
          swift_bridgeObjectRelease();
        }
        --v38;
        v39 -= 2;
        v40 += 2;
      }
      while (v41++ < (uint64_t)v38);
    }
  }
  v48 = *(_QWORD *)(v23 + 16);
  if (!v48)
  {
    v51 = MEMORY[0x24BEE4AF8];
LABEL_73:
    v69 = *(_QWORD *)(v51 + 16);
    if (v69)
    {
      v70 = (double *)(v51 + 32);
      v71 = 0.0;
      do
      {
        v72 = *v70++;
        v71 = v71 + v72 / OUTLINED_FUNCTION_66_1();
        --v69;
      }
      while (v69);
    }
    else
    {
      v71 = 0.0;
    }
    v103 = v51;
    swift_bridgeObjectRetain_n();
    sub_235F935D0(&v103);
    OUTLINED_FUNCTION_27_1();
    v73 = v103;
    v74 = *(_QWORD *)(v103 + 16);
    if (v74)
    {
      if (*(double *)(v103 + 32) != 0.0)
      {
LABEL_90:
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_27_1();
        OUTLINED_FUNCTION_111();
        v78 = 0;
        v79 = 0.0;
        do
        {
          v80 = *(double *)(v73 + 8 * v78++ + 32);
          v79 = v79 + v80 / OUTLINED_FUNCTION_66_1();
        }
        while (v74 != v78);
        swift_release();
        v17 = v101;
        v14 = v97;
        v12 = v98;
        v15 = v100;
        v16 = v96;
        if ((OUTLINED_FUNCTION_53_3() & 1) == 0)
        {
          OUTLINED_FUNCTION_23_5();
          v17 = v84;
        }
        v81 = *(_QWORD *)(v17 + 16);
        if (v81 >= *(_QWORD *)(v17 + 24) >> 1)
        {
          OUTLINED_FUNCTION_23_5();
          v17 = v85;
        }
        *(_QWORD *)(v17 + 16) = v81 + 1;
        *(double *)(v17 + 8 * v81 + 32) = v71 / v79;
        goto LABEL_97;
      }
      if (v74 != 1)
      {
        v75 = 5;
        do
        {
          v76 = v75 - 3;
          if (__OFADD__(v75 - 4, 1))
            goto LABEL_111;
          if (*(double *)(v103 + 8 * v75) != 0.0)
            goto LABEL_90;
          ++v75;
        }
        while (v76 != v74);
      }
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_27_1();
    swift_release();
    OUTLINED_FUNCTION_111();
    v17 = v101;
    if ((OUTLINED_FUNCTION_53_3() & 1) == 0)
    {
      OUTLINED_FUNCTION_23_5();
      v17 = v82;
    }
    v14 = v97;
    v12 = v98;
    v15 = v100;
    v16 = v96;
    v77 = *(_QWORD *)(v17 + 16);
    if (v77 >= *(_QWORD *)(v17 + 24) >> 1)
    {
      OUTLINED_FUNCTION_23_5();
      v17 = v83;
    }
    *(_QWORD *)(v17 + 16) = v77 + 1;
    *(_QWORD *)(v17 + 8 * v77 + 32) = 0;
LABEL_97:

    goto LABEL_98;
  }
  v49 = v36[2];
  OUTLINED_FUNCTION_166();
  v50 = 0;
  v95 = v36 + 9;
  v51 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v50 >= *(_QWORD *)(v23 + 16))
    {
      __break(1u);
      goto LABEL_107;
    }
    if (!v49)
      goto LABEL_47;
    v52 = (uint64_t *)(v23 + 32 + 16 * v50);
    v53 = *v52;
    v54 = v52[1];
    v55 = v36[4] == *v52 && v36[5] == v54;
    if (!v55 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
    {
      if (v49 == 1)
        goto LABEL_47;
      v60 = v36[6] == v53 && v36[7] == v54;
      if (!v60 && (OUTLINED_FUNCTION_31_2() & 1) == 0)
        break;
    }
LABEL_43:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_27_5();
      v51 = v67;
    }
    v57 = *(_QWORD *)(v51 + 16);
    v56 = *(_QWORD *)(v51 + 24);
    v58 = v57 + 1;
    v59 = 1.0;
LABEL_50:
    if (v57 >= v56 >> 1)
    {
      OUTLINED_FUNCTION_142_0(v56);
      sub_235F7E4FC();
      v51 = v66;
    }
    ++v50;
    *(_QWORD *)(v51 + 16) = v58;
    *(double *)(v51 + 8 * v57 + 32) = v59;
    if (v50 == v48)
    {
      OUTLINED_FUNCTION_111();
      goto LABEL_73;
    }
  }
  if (v49 == 2)
  {
LABEL_47:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_27_5();
      v51 = v68;
    }
    v57 = *(_QWORD *)(v51 + 16);
    v56 = *(_QWORD *)(v51 + 24);
    v58 = v57 + 1;
    v59 = 0.0;
    goto LABEL_50;
  }
  v61 = v95;
  v62 = 2;
  v99 = v36;
  while (1)
  {
    v63 = v48;
    v64 = v62 + 1;
    if (__OFADD__(v62, 1))
      break;
    v65 = *(v61 - 1) == v53 && *v61 == v54;
    if (v65 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
    {
      v48 = v63;
      v36 = v99;
      goto LABEL_43;
    }
    v61 += 2;
    ++v62;
    v55 = v64 == v49;
    v48 = v63;
    v36 = v99;
    if (v55)
      goto LABEL_47;
  }
LABEL_112:
  __break(1u);
LABEL_113:
  __break(1u);
  swift_release();
  __break(1u);
}

void sub_235F926E4()
{
  uint64_t v0;
  double v1;
  double v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BOOL v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  OUTLINED_FUNCTION_37_5();
  v41 = v0;
  v2 = v1;
  v4 = objc_msgSend(v3, sel_presentedAssets);
  OUTLINED_FUNCTION_41_2();
  v5 = OUTLINED_FUNCTION_58_2();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_235F9B654();
    OUTLINED_FUNCTION_20();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
    {
LABEL_3:
      if (v6 < 1)
      {
        __break(1u);
        goto LABEL_56;
      }
      v7 = 0;
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        if ((v5 & 0xC000000000000001) != 0)
          v9 = (id)MEMORY[0x23B7E7818](v7, v5);
        else
          v9 = *(id *)(v5 + 8 * v7 + 32);
        v10 = v9;
        sub_235F90580(v9);
        if (v12)
        {
          v13 = v11;
          v14 = v12;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_73_3();
            v8 = v18;
          }
          v16 = v8[2];
          v15 = v8[3];
          if (v16 >= v15 >> 1)
          {
            OUTLINED_FUNCTION_142_0(v15);
            OUTLINED_FUNCTION_73_3();
            v8 = v19;
          }
          v8[2] = v16 + 1;
          v17 = &v8[2 * v16];
          v17[4] = v13;
          v17[5] = v14;
        }
        ++v7;

      }
      while (v6 != v7);
      goto LABEL_18;
    }
  }
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_18:
  OUTLINED_FUNCTION_20();
  v20 = *(_QWORD *)(v41 + 16);
  if (!v20)
  {
LABEL_54:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v21 = 0;
  v22 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v23 = v41 + 32 + 16 * v21;
    if (*(double *)v23 > v2)
      break;
LABEL_35:
    if (++v21 == v20)
    {
      swift_bridgeObjectRelease();
      goto LABEL_54;
    }
  }
  v24 = *(id *)(v23 + 8);
  sub_235F9058C(v24);
  if (!v26)
  {
LABEL_34:

    goto LABEL_35;
  }
  v27 = v26;
  v28 = v8[2];
  if (!v28)
  {
    OUTLINED_FUNCTION_9_1();
    goto LABEL_34;
  }
  v29 = v25;
  v42 = v22;
  v30 = v8[4] == v25 && v26 == v8[5];
  if (v30 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
    goto LABEL_28;
  if (v28 == 1)
    goto LABEL_38;
  v34 = v8[6] == v29 && v27 == v8[7];
  if (v34 || (OUTLINED_FUNCTION_31_2() & 1) != 0)
  {
LABEL_28:
    v22 = v42;
    if ((OUTLINED_FUNCTION_53_3() & 1) == 0)
    {
      OUTLINED_FUNCTION_71_3();
      v22 = v38;
    }
    v32 = *(_QWORD *)(v22 + 16);
    v31 = *(_QWORD *)(v22 + 24);
    if (v32 >= v31 >> 1)
    {
      OUTLINED_FUNCTION_142_0(v31);
      OUTLINED_FUNCTION_71_3();
      v22 = v39;
    }
    *(_QWORD *)(v22 + 16) = v32 + 1;
    v33 = v22 + 16 * v32;
    *(_QWORD *)(v33 + 32) = v29;
    *(_QWORD *)(v33 + 40) = v27;
    goto LABEL_34;
  }
  if (v28 == 2)
  {
LABEL_38:
    OUTLINED_FUNCTION_9_1();
    v22 = v42;
    goto LABEL_34;
  }
  v35 = v8 + 9;
  v36 = 2;
  while (!__OFADD__(v36, 1))
  {
    if (*(v35 - 1) == v29 && v27 == *v35)
      goto LABEL_28;
    v40 = v36 + 1;
    if ((sub_235F9B6C0() & 1) != 0)
      goto LABEL_28;
    v35 += 2;
    ++v36;
    if (v40 == v28)
      goto LABEL_38;
  }
LABEL_56:
  __break(1u);
}

void sub_235F929F4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_69_3();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_179();
  sub_235F9B138();
  OUTLINED_FUNCTION_43_2();
  sub_235F9B120();
  OUTLINED_FUNCTION_36_5();
  sub_235F92AEC();
  OUTLINED_FUNCTION_39_4();
}

void sub_235F92A70()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_69_3();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_179();
  sub_235F9B138();
  OUTLINED_FUNCTION_43_2();
  sub_235F9B120();
  OUTLINED_FUNCTION_36_5();
  sub_235F92AEC();
  OUTLINED_FUNCTION_39_4();
}

void sub_235F92AEC()
{
  double v0;
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_37_5();
  v1 = v0;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_65_1();
  MEMORY[0x24BDAC7A8](v3);
  v21 = *(_QWORD *)(OUTLINED_FUNCTION_30_2() - 8);
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15_5();
  OUTLINED_FUNCTION_55_2();
  OUTLINED_FUNCTION_179();
  sub_235F9B054();
  v5 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_59_0()), sel_init);
  v6 = sub_235F91400();
  OUTLINED_FUNCTION_64_3();
  v8 = v7;

  v9 = sub_235F9147C();
  sub_235F992A4();

  v10 = *(_QWORD *)(v8 + 16);
  if (v10)
  {
    v11 = (id *)(v8 + 40);
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      if (*((double *)v11 - 1) >= v1)
      {
        v14 = *v11;
        v15 = objc_msgSend(v14, sel_presentedAssets);
        OUTLINED_FUNCTION_41_2();
        v16 = sub_235F9B450();

        if (v16 >> 62)
        {
          swift_bridgeObjectRetain();
          v17 = sub_235F9B654();
          OUTLINED_FUNCTION_25();
        }
        else
        {
          v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        OUTLINED_FUNCTION_25();
        if (v17 < 1)
        {

LABEL_11:
          v12 = v12 + 1.0;
          goto LABEL_12;
        }
        sub_235F926E4();
        v19 = v18;

        if (v19)
        {
          v20 = *(_QWORD *)(v19 + 16);
          OUTLINED_FUNCTION_25();
          if (!v20)
            goto LABEL_11;
          v13 = v13 + 1.0;
        }
      }
LABEL_12:
      v11 += 2;
      --v10;
    }
    while (v10);
  }

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_54_3(v21);
  OUTLINED_FUNCTION_12_6();
}

void *sub_235F92CD4()
{
  return &unk_250753088;
}

id AMLPhotosSearchCAMetrics.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMLPhotosSearchCAMetrics.init()()
{
  char *v0;
  char *v1;
  objc_super v3;

  v1 = &v0[OBJC_IVAR____TtC6AeroML24AMLPhotosSearchCAMetrics_caDomain];
  *(_QWORD *)v1 = 0xD00000000000002DLL;
  *((_QWORD *)v1 + 1) = 0x8000000235FA0930;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AMLPhotosSearchCAMetrics();
  return objc_msgSendSuper2(&v3, sel_init);
}

id AMLPhotosSearchCAMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchCAMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235F92DBC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    result = OUTLINED_FUNCTION_3_6();
    __break(1u);
  }
  else if (a3 < a1
         || (result = __swift_instantiateConcreteTypeFromMangledName(&qword_256399490),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399490);
    OUTLINED_FUNCTION_57_1();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_57_1();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_235F92E88(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    result = (char *)OUTLINED_FUNCTION_3_6();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_5(a3, result);
  }
  return result;
}

char *sub_235F92EE0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_235F9B678();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_235F92F64(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    result = (char *)OUTLINED_FUNCTION_3_6();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_5(a3, result);
  }
  return result;
}

char *sub_235F92FC0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    result = (char *)OUTLINED_FUNCTION_3_6();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_5(a3, result);
  }
  return result;
}

char *sub_235F93018(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    result = (char *)OUTLINED_FUNCTION_3_6();
    __break(1u);
  }
  else if (a3 != result || &result[4 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_5(a3, result);
  }
  return result;
}

uint64_t sub_235F93074(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_235F9B678();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563997E0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_235F93160(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_25_4();
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return swift_arrayInitWithCopy();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_24_5();
  }
  result = OUTLINED_FUNCTION_285();
  __break(1u);
  return result;
}

void *sub_235F931FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  const void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  void *result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_25_4();
  }
  else
  {
    OUTLINED_FUNCTION_46_3();
    if (!v8 && v7)
    {
      v7 = v6 >= v3;
      v8 = v6 == v3;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    if (v8 || !v7)
      return OUTLINED_FUNCTION_13_3(v5, v4, 8 * v2);
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_24_5();
  }
  result = (void *)OUTLINED_FUNCTION_285();
  __break(1u);
  return result;
}

void *sub_235F93280(char *a1, uint64_t a2, char *a3)
{
  void *result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_25_4();
  }
  else
  {
    if (&a3[4 * a2] <= a1 || &a1[4 * a2] <= a3)
      return OUTLINED_FUNCTION_13_3(a3, a1, 4 * a2);
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_24_5();
  }
  result = (void *)OUTLINED_FUNCTION_285();
  __break(1u);
  return result;
}

void sub_235F93314(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_235F93504(a1, a2, a3, a4, (uint64_t *)&unk_256399F40, (void (*)(uint64_t, uint64_t, _QWORD *))sub_235F92EE0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_235F93074);
}

void sub_235F93330()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  char *v10;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_145();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_144();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BB0);
    v6 = (const void *)OUTLINED_FUNCTION_9_5();
    v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_142(v7 - 32);
  }
  v8 = (char *)OUTLINED_FUNCTION_33_4();
  if ((v1 & 1) != 0)
  {
    sub_235F93018(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_235F93280(v8, v9, v10);
  }
  OUTLINED_FUNCTION_49_3();
  OUTLINED_FUNCTION_24();
}

void sub_235F933CC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  char *v10;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_145();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_144();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
    v6 = (const void *)OUTLINED_FUNCTION_9_5();
    v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_142(v7 - 32);
  }
  v8 = (char *)OUTLINED_FUNCTION_33_4();
  if ((v1 & 1) != 0)
  {
    sub_235F92F64(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_235F93160((unint64_t)v8, v9, (unint64_t)v10);
  }
  OUTLINED_FUNCTION_49_3();
  OUTLINED_FUNCTION_24();
}

void sub_235F93468()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  char *v10;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_145();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_144();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399BB8);
    v6 = (const void *)OUTLINED_FUNCTION_9_5();
    v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_142(v7 - 32);
  }
  v8 = (char *)OUTLINED_FUNCTION_33_4();
  if ((v1 & 1) != 0)
  {
    sub_235F92FC0(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_235F931FC((uint64_t)v8, v9);
  }
  OUTLINED_FUNCTION_49_3();
  OUTLINED_FUNCTION_24();
}

void sub_235F93504(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, _QWORD *), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  _QWORD *v18;
  uint64_t v19;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_145();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v16 = (_QWORD *)OUTLINED_FUNCTION_9_5();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 8);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v18 = v16 + 4;
  v19 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    a6(v19, v14, v18);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a7(v19, v14, v18);
  }
  OUTLINED_FUNCTION_49_3();
}

void sub_235F935D0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_235F93FC4(v2);
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_235F93638(v5);
  *a1 = v2;
}

void sub_235F93638(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  double v22;
  uint64_t v23;
  double *v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  char v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  unint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  unint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;

  v3 = a1[1];
  v4 = sub_235F9B69C();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_235F93C18(0, v3, 1, a1);
      return;
    }
    goto LABEL_124;
  }
  v5 = v4;
  v87 = a1;
  v88 = sub_235F7DF0C(v3 / 2);
  v92 = v6;
  v90 = v3;
  if (v3 <= 0)
  {
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v27 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_90:
    if (v27 < 2)
    {
LABEL_101:
      swift_bridgeObjectRelease();
      if (v90 >= -1)
      {
        *(_QWORD *)(v88 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_129;
    }
    v79 = *v87;
    while (1)
    {
      v80 = v27 - 2;
      if (v27 < 2)
        break;
      if (!v79)
        goto LABEL_133;
      v81 = v9[2 * v80 + 4];
      v82 = v9[2 * v27 + 3];
      sub_235F93C70((char *)(v79 + 8 * v81), (char *)(v79 + 8 * v9[2 * v27 + 2]), v79 + 8 * v82, v92);
      if (v1)
        goto LABEL_86;
      if (v82 < v81)
        goto LABEL_119;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F93EB0();
        v9 = v85;
      }
      if (v80 >= v9[2])
        goto LABEL_120;
      v83 = &v9[2 * v80 + 4];
      *v83 = v81;
      v83[1] = v82;
      v84 = v9[2];
      if (v27 > v84)
        goto LABEL_121;
      memmove(&v9[2 * v27 + 2], &v9[2 * v27 + 4], 16 * (v84 - v27));
      v9[2] = v84 - 1;
      v27 = v84 - 1;
      if (v84 <= 2)
        goto LABEL_101;
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
    return;
  }
  v7 = 0;
  v8 = *a1;
  v86 = *a1 - 8;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v89 = v5;
  v91 = *a1;
  while (1)
  {
    v10 = v7++;
    if (v7 < v3)
    {
      v11 = *(double *)(v8 + 8 * v7);
      v12 = *(double *)(v8 + 8 * v10);
      v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        v13 = v11;
        while (1)
        {
          v14 = v13;
          v13 = *(double *)(v8 + 8 * v7);
          if (v12 < v11 == v14 >= v13)
            break;
          if (++v7 >= v3)
          {
            v7 = v3;
            break;
          }
        }
      }
      if (v12 < v11)
      {
        if (v7 < v10)
          goto LABEL_126;
        if (v10 < v7)
        {
          v15 = (uint64_t *)(v86 + 8 * v7);
          v16 = v7;
          v17 = v10;
          v18 = (uint64_t *)(v8 + 8 * v10);
          do
          {
            if (v17 != --v16)
            {
              if (!v8)
                goto LABEL_132;
              v19 = *v18;
              *v18 = *v15;
              *v15 = v19;
            }
            ++v17;
            --v15;
            ++v18;
          }
          while (v17 < v16);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10))
        goto LABEL_123;
      if (v7 - v10 < v5)
      {
        v20 = v10 + v5;
        if (__OFADD__(v10, v5))
          goto LABEL_127;
        if (v20 >= v3)
          v20 = v3;
        if (v20 < v10)
          goto LABEL_128;
        if (v7 != v20)
        {
          v21 = (double *)(v86 + 8 * v7);
          do
          {
            v22 = *(double *)(v8 + 8 * v7);
            v23 = v10;
            v24 = v21;
            do
            {
              v25 = *v24;
              if (*v24 >= v22)
                break;
              if (!v8)
                goto LABEL_130;
              *v24 = v22;
              v24[1] = v25;
              --v24;
              ++v23;
            }
            while (v7 != v23);
            ++v7;
            ++v21;
          }
          while (v7 != v20);
          v7 = v20;
        }
      }
    }
    if (v7 < v10)
      goto LABEL_122;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_235F93DE8();
      v9 = v77;
    }
    v26 = v9[2];
    v27 = v26 + 1;
    v8 = v91;
    if (v26 >= v9[3] >> 1)
    {
      sub_235F93DE8();
      v8 = v91;
      v9 = v78;
    }
    v9[2] = v27;
    v28 = v9 + 4;
    v29 = &v9[2 * v26 + 4];
    *v29 = v10;
    v29[1] = v7;
    if (v26)
      break;
    v27 = 1;
LABEL_81:
    v5 = v89;
    v3 = v90;
    if (v7 >= v90)
      goto LABEL_90;
  }
  while (1)
  {
    v30 = v27 - 1;
    if (v27 >= 4)
    {
      v35 = &v28[2 * v27];
      v36 = *(v35 - 8);
      v37 = *(v35 - 7);
      v41 = __OFSUB__(v37, v36);
      v38 = v37 - v36;
      if (v41)
        goto LABEL_107;
      v40 = *(v35 - 6);
      v39 = *(v35 - 5);
      v41 = __OFSUB__(v39, v40);
      v33 = v39 - v40;
      v34 = v41;
      if (v41)
        goto LABEL_108;
      v42 = v27 - 2;
      v43 = &v28[2 * v27 - 4];
      v45 = *v43;
      v44 = v43[1];
      v41 = __OFSUB__(v44, v45);
      v46 = v44 - v45;
      if (v41)
        goto LABEL_109;
      v41 = __OFADD__(v33, v46);
      v47 = v33 + v46;
      if (v41)
        goto LABEL_111;
      if (v47 >= v38)
      {
        v65 = &v28[2 * v30];
        v67 = *v65;
        v66 = v65[1];
        v41 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v41)
          goto LABEL_117;
        v58 = v33 < v68;
        goto LABEL_70;
      }
    }
    else
    {
      if (v27 != 3)
      {
        v59 = v9[4];
        v60 = v9[5];
        v41 = __OFSUB__(v60, v59);
        v52 = v60 - v59;
        v53 = v41;
        goto LABEL_64;
      }
      v32 = v9[4];
      v31 = v9[5];
      v41 = __OFSUB__(v31, v32);
      v33 = v31 - v32;
      v34 = v41;
    }
    if ((v34 & 1) != 0)
      goto LABEL_110;
    v42 = v27 - 2;
    v48 = &v28[2 * v27 - 4];
    v50 = *v48;
    v49 = v48[1];
    v51 = __OFSUB__(v49, v50);
    v52 = v49 - v50;
    v53 = v51;
    if (v51)
      goto LABEL_112;
    v54 = &v28[2 * v30];
    v56 = *v54;
    v55 = v54[1];
    v41 = __OFSUB__(v55, v56);
    v57 = v55 - v56;
    if (v41)
      goto LABEL_114;
    if (__OFADD__(v52, v57))
      goto LABEL_116;
    if (v52 + v57 >= v33)
    {
      v58 = v33 < v57;
LABEL_70:
      if (v58)
        v30 = v42;
      goto LABEL_72;
    }
LABEL_64:
    if ((v53 & 1) != 0)
      goto LABEL_113;
    v61 = &v28[2 * v30];
    v63 = *v61;
    v62 = v61[1];
    v41 = __OFSUB__(v62, v63);
    v64 = v62 - v63;
    if (v41)
      goto LABEL_115;
    if (v64 < v52)
      goto LABEL_81;
LABEL_72:
    v69 = v9;
    v70 = v30 - 1;
    if (v30 - 1 >= v27)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    if (!v8)
      goto LABEL_131;
    v71 = &v28[2 * v70];
    v72 = *v71;
    v73 = v28;
    v74 = &v28[2 * v30];
    v75 = v74[1];
    sub_235F93C70((char *)(v8 + 8 * *v71), (char *)(v8 + 8 * *v74), v8 + 8 * v75, v92);
    if (v1)
      break;
    if (v75 < v72)
      goto LABEL_104;
    if (v30 > v69[2])
      goto LABEL_105;
    *v71 = v72;
    v73[2 * v70 + 1] = v75;
    v76 = v69[2];
    if (v30 >= v76)
      goto LABEL_106;
    v9 = v69;
    v27 = v76 - 1;
    memmove(v74, v74 + 2, 16 * (v76 - 1 - v30));
    v28 = v73;
    v69[2] = v76 - 1;
    v8 = v91;
    if (v76 <= 2)
      goto LABEL_81;
  }
LABEL_86:
  swift_bridgeObjectRelease();
  if (v90 < -1)
    goto LABEL_125;
  *(_QWORD *)(v88 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_235F93C18(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double *v8;
  double v9;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      v6 = *(double *)(v4 + 8 * a3);
      v7 = result;
      v8 = (double *)v5;
      do
      {
        v9 = *v8;
        if (*v8 >= v6)
          break;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        *v8 = v6;
        v8[1] = v9;
        --v8;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 8;
      if (a3 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_235F93C70(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  double v14;
  BOOL v15;
  double *v18;
  char *v19;
  double v20;
  BOOL v21;
  BOOL v22;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 8;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v9 >= v11)
  {
    sub_235F92FC0(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, a4);
    v12 = &v4[8 * v11];
    if (v7 >= v6 || v10 < 8)
      goto LABEL_39;
    v18 = (double *)(a3 - 8);
    while (1)
    {
      v19 = (char *)(v18 + 1);
      v20 = *((double *)v6 - 1);
      if (v20 >= *((double *)v12 - 1))
      {
        v22 = v19 != v12 || v18 >= (double *)v12;
        v20 = *((double *)v12 - 1);
        v12 -= 8;
        if (!v22)
          goto LABEL_35;
      }
      else
      {
        v21 = v19 != v6 || v18 >= (double *)v6;
        v6 -= 8;
        if (!v21)
          goto LABEL_35;
      }
      *v18 = v20;
LABEL_35:
      --v18;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_39;
    }
  }
  sub_235F92FC0(a1, (a2 - a1) / 8, a4);
  v12 = &v4[8 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v14 = *(double *)v6;
      if (*(double *)v4 < *(double *)v6)
        break;
      v14 = *(double *)v4;
      v15 = v7 == v4;
      v4 += 8;
      if (!v15)
        goto LABEL_11;
LABEL_12:
      v7 += 8;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_17;
    }
    v15 = v7 == v6;
    v6 += 8;
    if (v15)
      goto LABEL_12;
LABEL_11:
    *(double *)v7 = v14;
    goto LABEL_12;
  }
LABEL_17:
  v6 = v7;
LABEL_39:
  sub_235F92FC0(v4, (v12 - v4) / 8, v6);
  return 1;
}

void sub_235F93DE8()
{
  char *v0;
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  size_t v10;
  char *v11;
  char *v12;

  OUTLINED_FUNCTION_235();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_145();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_59();
    }
  }
  else
  {
    v4 = v2;
  }
  v7 = *((_QWORD *)v0 + 2);
  if (v4 <= v7)
    v8 = *((_QWORD *)v0 + 2);
  else
    v8 = v4;
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256399F38);
    v9 = (char *)OUTLINED_FUNCTION_9_5();
    v10 = _swift_stdlib_malloc_size(v9);
    *((_QWORD *)v9 + 2) = v7;
    *((_QWORD *)v9 + 3) = 2 * ((uint64_t)(v10 - 32) / 16);
  }
  else
  {
    v9 = (char *)MEMORY[0x24BEE4AF8];
  }
  v11 = v9 + 32;
  v12 = v0 + 32;
  if ((v1 & 1) != 0)
  {
    if (v9 != v0 || &v12[16 * v7] <= v11)
      memmove(v11, v12, 16 * v7);
    *((_QWORD *)v0 + 2) = 0;
  }
  else
  {
    memcpy(v11, v12, 16 * v7);
  }
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_24();
}

void sub_235F93EB0()
{
  sub_235F93DE8();
}

void sub_235F93EC4(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_235F9B3F0();
  OUTLINED_FUNCTION_20();
  objc_msgSend(a3, *a4, v6);

}

uint64_t type metadata accessor for AMLPhotosSearchCAMetrics()
{
  return objc_opt_self();
}

uint64_t method lookup function for AMLPhotosSearchCAMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMLPhotosSearchCAMetrics.metricsPayloads(doUpload:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

unint64_t sub_235F93F60()
{
  unint64_t result;

  result = qword_256399EC8;
  if (!qword_256399EC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256399EC8);
  }
  return result;
}

void sub_235F93F9C()
{
  sub_235F7E354();
}

void sub_235F93FB0()
{
  sub_235F7E1D8();
}

void sub_235F93FC4(uint64_t a1)
{
  sub_235F93504(0, *(_QWORD *)(a1 + 16), 0, a1, &qword_256399B40, (void (*)(uint64_t, uint64_t, _QWORD *))sub_235F92FC0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_235F931FC);
}

void *OUTLINED_FUNCTION_1_5@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return sub_235F9B678();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_235F9B180();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_allocObject();
}

void *OUTLINED_FUNCTION_13_3(void *__dst, const void *__src, size_t __n)
{
  return memcpy(__dst, __src, __n);
}

void OUTLINED_FUNCTION_23_5()
{
  sub_235F7E4FC();
}

void OUTLINED_FUNCTION_27_5()
{
  sub_235F7E4FC();
}

void OUTLINED_FUNCTION_29_3(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;

  sub_235F93EC4(a1, a2, v4, a4);
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  return sub_235F9B06C();
}

uint64_t OUTLINED_FUNCTION_33_4()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return sub_235F9B138();
}

uint64_t OUTLINED_FUNCTION_36_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

unint64_t OUTLINED_FUNCTION_41_2()
{
  return sub_235F93F60();
}

id OUTLINED_FUNCTION_42_2(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  return sub_235F9B120();
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_53_3()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_54_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_55_2()
{
  return sub_235F9B114();
}

void OUTLINED_FUNCTION_56_2()
{
  sub_235F91F68();
}

uint64_t OUTLINED_FUNCTION_57_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return type metadata accessor for AMLPhotosSearchHelpers();
}

id OUTLINED_FUNCTION_61_2(uint64_t a1, const char *a2)
{
  void *v2;
  double v3;

  return objc_msgSend(v2, a2, v3);
}

void OUTLINED_FUNCTION_64_3()
{
  sub_235F99070();
}

double OUTLINED_FUNCTION_66_1()
{
  double v0;
  double v1;

  return log2(v0 + v1);
}

double OUTLINED_FUNCTION_67_0()
{
  uint64_t v0;
  double v1;

  return sub_235F91D50(v0, v1);
}

void OUTLINED_FUNCTION_71_3()
{
  sub_235F7E1D8();
}

void OUTLINED_FUNCTION_72_2()
{
  sub_235F7E1D8();
}

void OUTLINED_FUNCTION_73_3()
{
  sub_235F7E1D8();
}

uint64_t sub_235F94290(uint64_t a1)
{
  _OWORD v2[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_235F6E7A4((_OWORD *)a1, v2);
    sub_235F98604();
    return OUTLINED_FUNCTION_27_1();
  }
  else
  {
    sub_235F6D3D8(a1);
    sub_235F984E0(v2);
    OUTLINED_FUNCTION_27_1();
    return sub_235F6D3D8((uint64_t)v2);
  }
}

void sub_235F94308(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void (*v4)(uint64_t);
  void *v5;

  if (a2)
    sub_235F9B078();
  v2 = OUTLINED_FUNCTION_60();
  v5 = v3;
  v4(v2);
  OUTLINED_FUNCTION_32_5(v5);
}

void sub_235F94354(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _OWORD *v29;
  uint64_t v30;
  _QWORD *v31;
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
  __int128 v43;
  uint64_t v44;
  _OWORD v45[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25639A078);
    v2 = (_QWORD *)OUTLINED_FUNCTION_62_2();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  OUTLINED_FUNCTION_13_4();
  v5 = v4 & v3;
  OUTLINED_FUNCTION_78_2();
  v6 = &v42;
  v7 = &v44;
  OUTLINED_FUNCTION_58_3();
  v8 = 0;
  v9 = MEMORY[0x24BEE4AD8] + 8;
  v10 = MEMORY[0x24BEE0D00];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v39 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8, 1))
          goto LABEL_37;
        OUTLINED_FUNCTION_74_2();
        if (v13 == v14)
        {
LABEL_34:
          OUTLINED_FUNCTION_79_3();
          sub_235F72990();
          return;
        }
        v15 = *(_QWORD *)(v37 + 8 * v12);
        v16 = v12;
        if (!v15)
        {
          OUTLINED_FUNCTION_29_4();
          if (v13 == v14)
            goto LABEL_34;
          OUTLINED_FUNCTION_45_1();
          if (!v15)
          {
            OUTLINED_FUNCTION_29_4();
            if (v13 == v14)
              goto LABEL_34;
            OUTLINED_FUNCTION_45_1();
            if (!v15)
            {
              OUTLINED_FUNCTION_29_4();
              if (v13 == v14)
                goto LABEL_34;
              OUTLINED_FUNCTION_45_1();
              if (!v15)
              {
                OUTLINED_FUNCTION_74_2();
                if (v13 == v14)
                  goto LABEL_34;
                v15 = *(_QWORD *)(v37 + 8 * v17);
                if (!v15)
                {
                  while (!__OFADD__(v17, 1))
                  {
                    OUTLINED_FUNCTION_29_4();
                    if (v13 == v14)
                      goto LABEL_34;
                    v15 = *(_QWORD *)(v37 + 8 * v16);
                    v17 = v18 + 1;
                    if (v15)
                      goto LABEL_28;
                  }
                  goto LABEL_38;
                }
                v16 = v17;
              }
            }
          }
        }
LABEL_28:
        v39 = (v15 - 1) & v15;
        v11 = __clz(__rbit64(v15)) + (v16 << 6);
        v8 = v16;
      }
      v19 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v40 = *v19;
      v41 = v19[1];
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_37_1();
      swift_dynamicCast();
      sub_235F6E7A4(v6, v7);
      sub_235F6E7A4(v7, v45);
      sub_235F6E7A4(v45, &v43);
      v20 = sub_235F7F384();
      v21 = v20;
      if ((v22 & 1) == 0)
        break;
      v38 = v8;
      v23 = v7;
      v24 = v6;
      v25 = v1;
      v26 = v10;
      v27 = v9;
      v28 = (_QWORD *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *v28 = v40;
      v28[1] = v41;
      v9 = v27;
      v10 = v26;
      v1 = v25;
      v6 = v24;
      v7 = v23;
      v8 = v38;
      v29 = (_OWORD *)(v2[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
      sub_235F6E7A4(&v43, v29);
      v5 = v39;
    }
    if (v2[2] >= v2[3])
      break;
    OUTLINED_FUNCTION_63_2((v20 >> 3) & 0x1FFFFFFFFFFFFFF8, v34, v35, v36);
    v31 = (_QWORD *)(v30 + 16 * v21);
    *v31 = v40;
    v31[1] = v41;
    sub_235F6E7A4(&v43, (_OWORD *)(v2[7] + 32 * v21));
    v32 = v2[2];
    v14 = __OFADD__(v32, 1);
    v33 = v32 + 1;
    if (v14)
      goto LABEL_36;
    v2[2] = v33;
    v5 = v39;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

#error "235F94830: call analysis failed (funcsize=149)"

void sub_235F94890()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void sub_235F948CC()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void sub_235F948FC(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  sub_235F9B3FC();
  v8 = a1;
  v6 = OUTLINED_FUNCTION_15_1();
  sub_235F94ECC(v6, v7, a4);

}

void sub_235F94968()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

id sub_235F949B8()
{
  return OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMLRawSignalsDonationStatus_group);
}

void sub_235F94A0C(uint64_t a1)
{
  OUTLINED_FUNCTION_20_0(a1, OBJC_IVAR___AMLRawSignalsDonationStatus_group);
}

id AMLRawSignalsDonationStatus.init(metadataDonationId:rawSignalsDonationId:configurationDonationId:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = objc_allocWithZone((Class)OUTLINED_FUNCTION_13());
  v9 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_9_1();
  v11 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_20();
  v12 = objc_msgSend(v8, sel_initWithMetadataDonationId_rawSignalsDonationId_configurationDonationId_group_, v9, v10, v11, a7);

  return v12;
}

id AMLRawSignalsDonationStatus.init(metadataDonationId:rawSignalsDonationId:configurationDonationId:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  v8 = (_QWORD *)(v7 + OBJC_IVAR___AMLRawSignalsDonationStatus_metadataDonationId);
  *v8 = a1;
  v8[1] = a2;
  v9 = (_QWORD *)(v7 + OBJC_IVAR___AMLRawSignalsDonationStatus_rawSignalsDonationId);
  *v9 = a3;
  v9[1] = a4;
  v10 = (_QWORD *)(v7 + OBJC_IVAR___AMLRawSignalsDonationStatus_configurationDonationId);
  *v10 = a5;
  v10[1] = a6;
  *(_QWORD *)(v7 + OBJC_IVAR___AMLRawSignalsDonationStatus_group) = a7;
  v12.super_class = (Class)AMLRawSignalsDonationStatus;
  return objc_msgSendSuper2(&v12, sel_init);
}

void AMLRawSignalsDonationStatus.copy(with:)()
{
  void *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  OUTLINED_FUNCTION_57_0();
  v2 = v1;
  v4 = OUTLINED_FUNCTION_31_1(v3, sel_metadataDonationId);
  OUTLINED_FUNCTION_75();

  v6 = OUTLINED_FUNCTION_31_1(v5, sel_rawSignalsDonationId);
  v7 = OUTLINED_FUNCTION_75();
  v9 = v8;

  v11 = OUTLINED_FUNCTION_31_1(v10, sel_configurationDonationId);
  v12 = OUTLINED_FUNCTION_75();
  v14 = v13;

  v16 = OUTLINED_FUNCTION_31_1(v15, sel_group);
  v17 = objc_allocWithZone((Class)AMLRawSignalsDonationStatus);
  v18 = OUTLINED_FUNCTION_15_1();
  v20 = sub_235F9840C(v18, v19, v7, v9, v12, v14, v16);
  type metadata accessor for AMLRawSignalsDonationStatus((uint64_t)v20);
  v2[3] = v21;
  *v2 = v20;
}

void AMLRawSignalsDonationStatus.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

void sub_235F94D80()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void sub_235F94DF4()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F94E84(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_27_6(a1, a2, OBJC_IVAR___AMLRawSignalsConfiguration_modelName);
}

void sub_235F94E9C()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

uint64_t sub_235F94ECC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return OUTLINED_FUNCTION_27_6(a1, a2, *a3);
}

uint64_t sub_235F94EF4()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR___AMLRawSignalsConfiguration_expirationPolicy);
}

uint64_t sub_235F94F28(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + OBJC_IVAR___AMLRawSignalsConfiguration_expirationPolicy) = result;
  return result;
}

id sub_235F94F58()
{
  return OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMLRawSignalsConfiguration_rawSignalsDescription);
}

void sub_235F94FAC(uint64_t a1)
{
  OUTLINED_FUNCTION_20_0(a1, OBJC_IVAR___AMLRawSignalsConfiguration_rawSignalsDescription);
}

void sub_235F94FC4()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_34();
}

void AMLRawSignalsConfiguration.init(bundleIdentifier:modelName:versionId:expirationPolicy:rawSignalsDescription:)()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  OUTLINED_FUNCTION_57_0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v6 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  if (v5)
  {
    v7 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v9 = (void *)sub_235F9B3F0();
  OUTLINED_FUNCTION_17();
  objc_msgSend(v8, sel_initWithBundleIdentifier_modelName_versionId_expirationPolicy_rawSignalsDescription_, v6, v7, v9, v3, v1);

  OUTLINED_FUNCTION_11_0();
}

{
  void *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;

  OUTLINED_FUNCTION_57_0();
  v23 = v0;
  v22 = v1;
  v20 = v2;
  v21 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = sub_235F9B1B0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F9B1A4();
  v16 = sub_235F9B198();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v19 = objc_allocWithZone((Class)AMLRawSignalsConfiguration);
  sub_235F95254(v11, v9, v7, v5, v20, v21, v22, v23, v16, v18);
  swift_getObjectType();
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_11_0();
}

id sub_235F95254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void *a8, uint64_t a9, uint64_t a10)
{
  char *v10;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  id v20;
  id v21;
  objc_super v23;

  v15 = &v10[OBJC_IVAR___AMLRawSignalsConfiguration_modelName];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v10[OBJC_IVAR___AMLRawSignalsConfiguration_bundleIdentifier];
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v17 = v10;
  swift_bridgeObjectRelease();
  v18 = &v17[OBJC_IVAR___AMLRawSignalsConfiguration_versionId];
  *(_QWORD *)v18 = a5;
  *((_QWORD *)v18 + 1) = a6;
  *(_DWORD *)&v17[OBJC_IVAR___AMLRawSignalsConfiguration_expirationPolicy] = a7;
  *(_QWORD *)&v17[OBJC_IVAR___AMLRawSignalsConfiguration_rawSignalsDescription] = a8;
  v19 = &v17[OBJC_IVAR___AMLRawSignalsConfiguration_configurationId];
  *(_QWORD *)v19 = a9;
  *((_QWORD *)v19 + 1) = a10;
  v20 = a8;

  v23.receiver = v17;
  v23.super_class = (Class)AMLRawSignalsConfiguration;
  v21 = objc_msgSendSuper2(&v23, sel_init);

  return v21;
}

void AMLRawSignalsConfiguration.copy(with:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = OUTLINED_FUNCTION_31_1(a1, sel_bundleIdentifier);
  v5 = sub_235F9B3FC();
  v23 = v6;
  v24 = v5;

  v7 = sub_235F88608(v2);
  v9 = v8;
  v10 = OUTLINED_FUNCTION_31_1(v7, sel_versionId);
  v11 = sub_235F9B3FC();
  v13 = v12;

  v14 = objc_msgSend(v2, sel_expirationPolicy);
  LODWORD(v10) = (_DWORD)v14;
  v15 = OUTLINED_FUNCTION_31_1((uint64_t)v14, sel_rawSignalsDescription);
  v16 = OUTLINED_FUNCTION_31_1((uint64_t)v15, sel_configurationId);
  v17 = sub_235F9B3FC();
  v19 = v18;

  v20 = objc_allocWithZone((Class)AMLRawSignalsConfiguration);
  v21 = sub_235F95254(v24, v23, v7, v9, v11, v13, (int)v10, v15, v17, v19);
  type metadata accessor for AMLRawSignalsConfiguration((uint64_t)v21);
  a2[3] = v22;
  *a2 = v21;
}

Swift::Void __swiftcall AMLRawSignalsConfiguration.encode(with:)(NSCoder with)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v3 = OUTLINED_FUNCTION_31_1((uint64_t)with.super.isa, sel_bundleIdentifier);
  if (!v3)
  {
    sub_235F9B3FC();
    v3 = (id)OUTLINED_FUNCTION_32_4();
    OUTLINED_FUNCTION_17();
  }
  v4 = (void *)OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3();

  sub_235F88608(v1);
  if (v5)
  {
    OUTLINED_FUNCTION_32_4();
    OUTLINED_FUNCTION_17();
  }
  v6 = (void *)OUTLINED_FUNCTION_21_4();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_8_3();

  v8 = OUTLINED_FUNCTION_31_1(v7, sel_versionId);
  if (!v8)
  {
    sub_235F9B3FC();
    v8 = (id)OUTLINED_FUNCTION_32_4();
    OUTLINED_FUNCTION_17();
  }
  v9 = (void *)OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_2_3();

  v10 = objc_msgSend(v1, sel_expirationPolicy);
  v11 = (void *)OUTLINED_FUNCTION_3_4();
  -[objc_class encodeInt32:forKey:](with.super.isa, sel_encodeInt32_forKey_, v10, v11);

  v13 = OUTLINED_FUNCTION_31_1(v12, sel_rawSignalsDescription);
  v14 = (void *)OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_2_3();

  v16 = OUTLINED_FUNCTION_31_1(v15, sel_configurationId);
  if (!v16)
  {
    sub_235F9B3FC();
    v16 = (id)sub_235F9B3F0();
    OUTLINED_FUNCTION_20();
  }
  v17 = (id)OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_91_1((uint64_t)v17, sel_encodeObject_forKey_);

}

id AMLRawSignalsConfiguration.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v2;
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  unsigned int v66;
  char *v67;
  char *v68;
  char *v69;
  id v70;
  uint64_t v71;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  objc_super v76;
  uint64_t v77;
  uint64_t v78;
  char v79[24];
  uint64_t v80;

  v4 = &v1[OBJC_IVAR___AMLRawSignalsConfiguration_modelName];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = v1;
  OUTLINED_FUNCTION_3_4();
  v6 = OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_37();
  if (v2)
  {
    sub_235F9B5C4();
    v7 = OUTLINED_FUNCTION_8_3();
  }
  else
  {
    v15 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_16_4(v7, v8, v9, v10, v11, v12, v13, v14, v15);
  if (!v80)
  {

    sub_235F6D3D8((uint64_t)v79);
LABEL_32:

    v71 = swift_bridgeObjectRelease();
    type metadata accessor for AMLRawSignalsConfiguration(v71);
    OUTLINED_FUNCTION_22_3();
    return 0;
  }
  if ((OUTLINED_FUNCTION_3_7() & 1) == 0)
  {

    goto LABEL_32;
  }
  v16 = v78;
  v17 = (void *)OUTLINED_FUNCTION_21_4();
  v18 = OUTLINED_FUNCTION_7_6();

  if (v18)
  {
    sub_235F9B5C4();
    v19 = swift_unknownObjectRelease();
  }
  else
  {
    v27 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_16_4(v19, v20, v21, v22, v23, v24, v25, v26, v27);
  if ((OUTLINED_FUNCTION_3_7() & 1) == 0)
  {

LABEL_31:
    OUTLINED_FUNCTION_20();
    goto LABEL_32;
  }
  v28 = v78;
  v75 = v77;
  v29 = (void *)OUTLINED_FUNCTION_36_6();
  v30 = OUTLINED_FUNCTION_7_6();

  if (v30)
  {
    sub_235F9B5C4();
    v31 = swift_unknownObjectRelease();
  }
  else
  {
    v39 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_16_4(v31, v32, v33, v34, v35, v36, v37, v38, v39);
  if ((OUTLINED_FUNCTION_3_7() & 1) == 0)
  {

LABEL_30:
    OUTLINED_FUNCTION_17();
    goto LABEL_31;
  }
  v40 = v78;
  v74 = v77;
  v41 = (void *)OUTLINED_FUNCTION_39_2();
  v42 = OUTLINED_FUNCTION_7_6();

  if (v42)
  {
    OUTLINED_FUNCTION_36_4();
    v43 = swift_unknownObjectRelease();
  }
  else
  {
    v51 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_16_4(v43, v44, v45, v46, v47, v48, v49, v50, v51);
  type metadata accessor for AMLFeaturesSpecification(0);
  if ((OUTLINED_FUNCTION_3_7() & 1) == 0)
  {

LABEL_29:
    OUTLINED_FUNCTION_9_1();
    goto LABEL_30;
  }
  v52 = (void *)OUTLINED_FUNCTION_12_4();
  v53 = OUTLINED_FUNCTION_7_6();

  if (v53)
  {
    OUTLINED_FUNCTION_36_4();
    v54 = swift_unknownObjectRelease();
  }
  else
  {
    v62 = OUTLINED_FUNCTION_31_4();
  }
  OUTLINED_FUNCTION_16_4(v54, v55, v56, v57, v58, v59, v60, v61, v62, v77);
  if ((OUTLINED_FUNCTION_3_7() & 1) == 0)
  {

    goto LABEL_29;
  }
  v63 = v77;
  v64 = v78;
  v65 = (void *)OUTLINED_FUNCTION_3_4();
  v66 = objc_msgSend(a1, sel_decodeInt32ForKey_, v65);

  v67 = &v5[OBJC_IVAR___AMLRawSignalsConfiguration_bundleIdentifier];
  *(_QWORD *)v67 = v77;
  *((_QWORD *)v67 + 1) = v16;
  *(_QWORD *)v4 = v75;
  *((_QWORD *)v4 + 1) = v28;
  swift_bridgeObjectRelease();
  v68 = &v5[OBJC_IVAR___AMLRawSignalsConfiguration_versionId];
  *(_QWORD *)v68 = v74;
  *((_QWORD *)v68 + 1) = v40;
  *(_DWORD *)&v5[OBJC_IVAR___AMLRawSignalsConfiguration_expirationPolicy] = v66;
  *(_QWORD *)&v5[OBJC_IVAR___AMLRawSignalsConfiguration_rawSignalsDescription] = v73;
  v69 = &v5[OBJC_IVAR___AMLRawSignalsConfiguration_configurationId];
  *(_QWORD *)v69 = v63;
  *((_QWORD *)v69 + 1) = v64;

  v76.receiver = v5;
  v76.super_class = (Class)AMLRawSignalsConfiguration;
  v70 = objc_msgSendSuper2(&v76, sel_init);

  return v70;
}

void AMLRawSignalsConfiguration.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

id sub_235F95B34()
{
  return OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMLRawSignalsDonation_rawSignalsConfiguration);
}

void sub_235F95B88(uint64_t a1)
{
  OUTLINED_FUNCTION_20_0(a1, OBJC_IVAR___AMLRawSignalsDonation_rawSignalsConfiguration);
}

void __swiftcall AMLRawSignalsDonation.init(rawSignalsConfiguration:)(AMLRawSignalsDonation *__return_ptr retstr, AMLRawSignalsConfiguration *rawSignalsConfiguration)
{
  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_13()), sel_initWithRawSignalsConfiguration_, rawSignalsConfiguration);
  OUTLINED_FUNCTION_21_1();
}

id AMLRawSignalsDonation.init(rawSignalsConfiguration:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  objc_super v4;

  v2 = (_QWORD *)(v1 + OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  *(_QWORD *)(v1 + OBJC_IVAR___AMLRawSignalsDonation_rawSignalsConfiguration) = a1;
  v4.super_class = (Class)AMLRawSignalsDonation;
  return objc_msgSendSuper2(&v4, sel_init);
}

void AMLRawSignalsDonation.copy(with:)(_QWORD *a1@<X8>)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(objc_allocWithZone((Class)AMLRawSignalsDonation), sel_initWithRawSignalsConfiguration_, objc_msgSend(v1, sel_rawSignalsConfiguration));
  OUTLINED_FUNCTION_37();
  type metadata accessor for AMLRawSignalsDonation(v4);
  a1[3] = v5;
  *a1 = v2;
}

Swift::Void __swiftcall AMLRawSignalsDonation.encode(with:)(NSCoder with)
{
  id v1;
  void *v2;

  v1 = OUTLINED_FUNCTION_31_1((uint64_t)with.super.isa, sel_rawSignalsConfiguration);
  v2 = (void *)OUTLINED_FUNCTION_44_2();
  OUTLINED_FUNCTION_91_1((uint64_t)v2, sel_encodeObject_forKey_);

  OUTLINED_FUNCTION_32_5(v2);
}

uint64_t _sSo26AMLRawSignalsConfigurationC6AeroMLE5coderABSgSo7NSCoderC_tcfC_0(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_13()), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_21_1();
  return v1;
}

id AMLRawSignalsDonation.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v2;
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  _OWORD v13[2];
  _BYTE v14[24];
  uint64_t v15;

  v4 = &v1[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration];
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = 0;
  v5 = v1;
  v6 = objc_msgSend(a1, sel_decodeObjectForKey_, OUTLINED_FUNCTION_44_2());
  OUTLINED_FUNCTION_37();
  if (v2)
  {
    sub_235F9B5C4();
    OUTLINED_FUNCTION_8_3();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  v7 = sub_235F6D390((uint64_t)v13, (uint64_t)v14);
  if (!v15)
  {

    sub_235F6D3D8((uint64_t)v14);
LABEL_9:
    sub_235F72808(*(_QWORD *)v4, *((_QWORD *)v4 + 1), *((void **)v4 + 2));

    type metadata accessor for AMLRawSignalsDonation(v9);
    swift_deallocPartialClassInstance();
    return 0;
  }
  type metadata accessor for AMLRawSignalsConfiguration(v7);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_9;
  }
  *(_QWORD *)&v5[OBJC_IVAR___AMLRawSignalsDonation_rawSignalsConfiguration] = v12;

  v11.receiver = v5;
  v11.super_class = (Class)AMLRawSignalsDonation;
  v8 = objc_msgSendSuper2(&v11, sel_init);

  return v8;
}

unint64_t sub_235F95F38()
{
  char *v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v1 = v0;
  v2 = (uint64_t *)&v0[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration];
  v3 = *(_QWORD *)&v0[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration];
  v4 = *(_QWORD *)&v0[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration + 8];
  v5 = (void *)v2[2];
  if (v4)
  {
    v6 = v3;
  }
  else
  {
    v6 = sub_235F95FF8(v1);
    v8 = v7;
    v9 = *v2;
    v10 = v2[1];
    v11 = (void *)v2[2];
    *v2 = v6;
    v2[1] = v12;
    v2[2] = (uint64_t)v7;
    swift_bridgeObjectRetain();
    v8;
    sub_235F72808(v9, v10, v11);
  }
  sub_235F72924(v3, v4, v5);
  return v6;
}

unint64_t sub_235F95FF8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  char **v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  void *v24;
  _QWORD *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37[2];

  v37[1] = *(id *)MEMORY[0x24BDAC8D0];
  v36 = sub_235F9B18C();
  v2 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)objc_opt_self();
  v6 = &selRef_setArrayProvider_;
  v7 = objc_msgSend(a1, sel_rawSignalsConfiguration);
  v37[0] = 0;
  v8 = objc_msgSend(v5, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v7, 1, v37);

  v9 = v37[0];
  if (v8)
  {
    v10 = sub_235F9B0F0();
    v12 = v11;

    if (sub_235F9B0FC() > 0)
      goto LABEL_10;
    sub_235F6B140(v10, v12);
  }
  else
  {
    v13 = v9;
    v14 = (void *)sub_235F9B084();

    swift_willThrow();
    if (qword_256399430 != -1)
      swift_once();
    v15 = sub_235F9B384();
    __swift_project_value_buffer(v15, (uint64_t)qword_25639A830);
    v16 = v14;
    v17 = v14;
    v18 = sub_235F9B36C();
    v19 = sub_235F9B51C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v35 = a1;
      v22 = (_QWORD *)v21;
      *(_DWORD *)v20 = 138412290;
      v23 = v14;
      v24 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v37[0] = v24;
      v6 = &selRef_setArrayProvider_;
      sub_235F9B5AC();
      *v22 = v24;

      _os_log_impl(&dword_235F59000, v18, v19, "Encountered error while archiving RawSignalsConfig: %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      swift_arrayDestroy();
      v25 = v22;
      a1 = v35;
      MEMORY[0x23B7E7EE4](v25, -1, -1);
      MEMORY[0x23B7E7EE4](v20, -1, -1);

    }
    else
    {

    }
  }
  v10 = 0;
  v12 = 0xF000000000000000;
LABEL_10:
  v26 = dispatch_group_create();
  type metadata accessor for AMLFeaturesStorage();
  swift_initStackObject();
  if (v12 >> 60 == 15)
  {
    swift_release();
    return 0xD000000000000018;
  }
  else
  {
    sub_235F6B0E4(v10, v12);
    v28 = objc_msgSend(a1, v6[205]);
    v29 = objc_msgSend(v28, sel_bundleIdentifier);

    v30 = sub_235F9B3FC();
    v32 = v31;

    sub_235F9B174();
    v27 = sub_235F6B4AC(v10, v12, 0xD00000000000002BLL, 0x8000000235FA0CD0, (void *)0xD000000000000013, 0x8000000235FA0D00, v30, v32, (uint64_t)v4, 0xD000000000000019, 0x8000000235FA0D20, 16718, 0xE200000000000000, v26);
    swift_bridgeObjectRelease();
    swift_release();
    sub_235F728D4(v10, v12);
    sub_235F728D4(v10, v12);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v36);
  }
  return v27;
}

uint64_t sub_235F96454()
{
  unint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  OUTLINED_FUNCTION_68_1();
  v1 = (void *)objc_opt_self();
  v2 = OUTLINED_FUNCTION_88(v1, sel_archivedDataWithRootObject_requiringSecureCoding_error_);
  v3 = 0;
  if (!v2)
  {
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_76_2();
    OUTLINED_FUNCTION_86_1();
    if (qword_256399430 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_19_1();
    v6 = __swift_project_value_buffer(v5, (uint64_t)qword_25639A830);
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_23_1();
    sub_235F9B36C();
    v7 = OUTLINED_FUNCTION_46();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v9 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v8 = 138412290;
      OUTLINED_FUNCTION_23_1();
      v13 = OUTLINED_FUNCTION_90_1();
      sub_235F9B5AC();
      *v9 = v13;
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_4_1();
      _os_log_impl(&dword_235F59000, v6, v7, "Encountered error while archiving RawSignals Donation: %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_4_1();

    goto LABEL_9;
  }
  v4 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_54();
  if (OUTLINED_FUNCTION_71() <= 0)
  {
    OUTLINED_FUNCTION_70();
LABEL_9:
    v4 = 0;
    v0 = 0xF000000000000000;
  }
  OUTLINED_FUNCTION_17_5();
  v11 = v10;
  sub_235F728D4(v4, v0);
  return v11;
}

void sub_235F96674()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  dispatch_group_t v33;
  uint64_t inited;
  NSObject *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  id v103;
  NSObject *v104;
  os_log_type_t v105;
  _BOOL4 v106;
  uint64_t v107;
  uint8_t *v108;
  id v109;
  id v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  id v117;
  id v118;
  os_log_type_t v119;
  uint64_t v120;
  _QWORD *v121;
  id v122;
  id v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  id v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  id v155;
  NSObject *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  id v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  NSObject *v175;
  unint64_t v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void (*v181)(char *, uint64_t);
  uint64_t v182;
  void (*v183)(_QWORD);
  unint64_t v184;
  char *v185;
  uint64_t v186;
  dispatch_group_t v187;
  unint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  __int128 v192;
  id v193;
  unint64_t v194;
  NSObject *v195;
  uint64_t v196;
  unint64_t v197;
  void *v198;
  id v199;
  char *v200;
  id v201;
  unint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;

  OUTLINED_FUNCTION_57_0();
  v199 = v0;
  v2 = v1;
  v194 = v3;
  v177 = v4;
  v205 = *MEMORY[0x24BDAC8D0];
  v191 = sub_235F9B18C();
  v190 = *(_QWORD *)(v191 - 8);
  MEMORY[0x24BDAC7A8](v191);
  v200 = (char *)&v176 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v196 = sub_235F9B360();
  v6 = *(_QWORD *)(v196 - 8);
  v7 = MEMORY[0x24BDAC7A8](v196);
  v185 = (char *)&v176 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v176 - v9;
  v193 = (id)objc_opt_self();
  sub_235F90484(objc_msgSend(v193, sel_mainBundle));
  v12 = v11;
  v14 = v13;
  LODWORD(v198) = sub_235F9B564();
  if (qword_256399420 != -1)
    swift_once();
  v195 = v2;
  v197 = qword_25639A810;
  if (qword_256399428 != -1)
    swift_once();
  v15 = v196;
  v16 = __swift_project_value_buffer(v196, (uint64_t)qword_25639A818);
  v17 = *(void (**)(_QWORD))(v6 + 16);
  v182 = v16;
  v183 = v17;
  v17(v10);
  v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_256399918);
  v18 = OUTLINED_FUNCTION_53();
  v192 = xmmword_235F9D750;
  *(_OWORD *)(v18 + 16) = xmmword_235F9D750;
  v19 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
  v20 = sub_235F728E8();
  *(_QWORD *)(v18 + 64) = v20;
  if (v14)
    v21 = v12;
  else
    v21 = 0x6E776F6E6B6E55;
  v22 = 0xE700000000000000;
  if (v14)
    v22 = v14;
  v179 = v21;
  *(_QWORD *)(v18 + 32) = v21;
  *(_QWORD *)(v18 + 40) = v22;
  v178 = v22;
  v176 = v14;
  swift_bridgeObjectRetain();
  v23 = v199;
  v24 = objc_msgSend(v199, sel_rawSignalsConfiguration);
  v25 = objc_msgSend(v24, sel_configurationId);

  v26 = sub_235F9B3FC();
  v28 = v27;

  *(_QWORD *)(v18 + 96) = v19;
  *(_QWORD *)(v18 + 104) = v20;
  v184 = v20;
  *(_QWORD *)(v18 + 72) = v26;
  *(_QWORD *)(v18 + 80) = v28;
  v29 = v23;
  sub_235F9B348();
  swift_bridgeObjectRelease();
  v181 = *(void (**)(char *, uint64_t))(v6 + 8);
  v181(v10, v15);
  sub_235F9B174();
  v30 = sub_235F95F38();
  v189 = v31;

  v33 = dispatch_group_create();
  type metadata accessor for AMLFeaturesStorage();
  inited = swift_initStackObject();
  v188 = v30;
  v187 = v33;
  v186 = inited;
  if (v194 >> 60 == 15)
  {
    v198 = (void *)0xD000000000000014;
    v197 = 0x8000000235F9F520;
    v35 = v195;
  }
  else
  {
    v36 = OUTLINED_FUNCTION_58();
    v38 = sub_235F6B0E4(v36, v37);
    v39 = objc_msgSend(OUTLINED_FUNCTION_36_1(v38, sel_rawSignalsConfiguration), sel_bundleIdentifier);
    OUTLINED_FUNCTION_21_1();
    v40 = sub_235F9B3FC();
    OUTLINED_FUNCTION_54();
    v41 = v195;
    v43 = OUTLINED_FUNCTION_36_1(v42, sel_sessionId);
    v44 = OUTLINED_FUNCTION_22_0();
    v46 = v45;

    OUTLINED_FUNCTION_79();
    v47 = OUTLINED_FUNCTION_58();
    v198 = (void *)sub_235F6B4AC(v47, v48, 0xD000000000000012, v49, v50, v51, v40, v26, v173, v174, 0x8000000235FA0CB0, v44, v46, v33);
    v197 = v52;
    v53 = OUTLINED_FUNCTION_58();
    sub_235F728D4(v53, v54);
    OUTLINED_FUNCTION_9_1();
    v35 = v41;
    v29 = v199;
    swift_bridgeObjectRelease();
  }
  sub_235F90484(objc_msgSend(v193, sel_mainBundle));
  v56 = v55;
  v58 = v57;
  sub_235F72838(v35);
  v60 = v59;
  swift_bridgeObjectRelease();
  if (!v60)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399928);
    v82 = swift_initStackObject();
    *(_OWORD *)(v82 + 16) = v192;
    if (qword_256399438 != -1)
      swift_once();
    v83 = qword_25639A850;
    *(_QWORD *)(v82 + 32) = qword_25639A848;
    *(_QWORD *)(v82 + 40) = v83;
    v84 = swift_bridgeObjectRetain();
    v85 = OUTLINED_FUNCTION_36_1(v84, sel_rawSignalsConfiguration);
    v76 = objc_msgSend(v85, sel_configurationId);

    v86 = sub_235F9B3FC();
    v88 = v87;

    *(_QWORD *)(v82 + 48) = v86;
    *(_QWORD *)(v82 + 56) = v88;
    *(_QWORD *)(v82 + 64) = 0xD000000000000012;
    *(_QWORD *)(v82 + 72) = 0x8000000235F9EF60;
    v89 = v197;
    *(_QWORD *)(v82 + 80) = v198;
    *(_QWORD *)(v82 + 88) = v89;
    swift_bridgeObjectRetain();
    v90 = (id)sub_235F9B3E4();
    if (v58)
    {
      swift_isUniquelyReferenced_nonNull_native();
      v201 = v90;
      sub_235F7F65C();
      v90 = v201;
      swift_bridgeObjectRelease();
    }
    v91 = -[NSObject sessionId](v35, sel_sessionId);
    OUTLINED_FUNCTION_65();
    OUTLINED_FUNCTION_84_1();
    sub_235F94354((uint64_t)v90);
    v93 = v92;
    swift_bridgeObjectRelease();
    v94 = objc_allocWithZone((Class)AMLFeaturesDonationMetadata);
    v79 = OUTLINED_FUNCTION_15_1();
    v81 = v93;
    goto LABEL_27;
  }
  sub_235F72838(v35);
  v62 = v61;
  v204 = v61;
  if (qword_256399438 != -1)
    swift_once();
  v63 = OUTLINED_FUNCTION_37_1();
  v64 = OUTLINED_FUNCTION_36_1(v63, sel_rawSignalsConfiguration);
  v65 = objc_msgSend(v64, sel_configurationId);

  v66 = (void *)sub_235F9B3FC();
  v68 = v67;

  v69 = MEMORY[0x24BEE0D00];
  v203 = MEMORY[0x24BEE0D00];
  v201 = v66;
  v202 = v68;
  if (!v62)
  {
    OUTLINED_FUNCTION_17_1();
    __break(1u);
    goto LABEL_47;
  }
  sub_235F94290((uint64_t)&v201);
  v203 = v69;
  v201 = v198;
  v202 = v197;
  v70 = v204;
  swift_bridgeObjectRetain();
  if (!v70)
  {
LABEL_47:
    OUTLINED_FUNCTION_17_1();
    __break(1u);
    goto LABEL_48;
  }
  v71 = sub_235F94290((uint64_t)&v201);
  v29 = v199;
  v72 = v195;
  if (v58)
  {
    v203 = v69;
    v201 = v56;
    v202 = v58;
    if (v204)
    {
      v71 = sub_235F94290((uint64_t)&v201);
      goto LABEL_21;
    }
LABEL_48:
    OUTLINED_FUNCTION_17_1();
    __break(1u);
    return;
  }
LABEL_21:
  v73 = OUTLINED_FUNCTION_28_1(v71, sel_sessionId);
  v74 = OUTLINED_FUNCTION_65();
  v76 = v75;

  v77 = v204;
  v78 = objc_allocWithZone((Class)AMLFeaturesDonationMetadata);
  v79 = v74;
  v80 = (uint64_t)v76;
  v81 = v77;
LABEL_27:
  v95 = sub_235F98380(v79, v80, v81);
  if (v95)
  {
    v96 = (void *)objc_opt_self();
    v201 = 0;
    v97 = v95;
    v98 = objc_msgSend(v96, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v97, 1, &v201);
    v99 = v201;
    v194 = (unint64_t)v97;
    if (v98)
    {
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_15_1();
      if (sub_235F9B0FC() <= 0)
      {
        v100 = OUTLINED_FUNCTION_15_1();
        sub_235F6B140(v100, v101);
        v76 = 0;
        v58 = 0xF000000000000000;
      }
    }
    else
    {
      OUTLINED_FUNCTION_47();

      swift_willThrow();
      if (qword_256399418 != -1)
        swift_once();
      v115 = OUTLINED_FUNCTION_19_1();
      v116 = __swift_project_value_buffer(v115, (uint64_t)qword_25639A7F8);
      v117 = v29;
      OUTLINED_FUNCTION_24_1();
      v118 = v117;
      OUTLINED_FUNCTION_24_1();
      sub_235F9B36C();
      v119 = OUTLINED_FUNCTION_46();
      if (os_log_type_enabled(v116, v119))
      {
        v120 = OUTLINED_FUNCTION_23_0();
        v121 = (_QWORD *)OUTLINED_FUNCTION_23_0();
        v195 = OUTLINED_FUNCTION_23_0();
        v201 = v195;
        *(_DWORD *)v120 = 136315394;
        v193 = (id)(v120 + 4);
        v122 = objc_msgSend(v118, sel_rawSignalsConfiguration);
        v123 = objc_msgSend(v122, sel_bundleIdentifier);

        v124 = sub_235F9B3FC();
        v126 = v125;

        sub_235F7EC30(v124, v126, (uint64_t *)&v201);
        v204 = v127;
        sub_235F9B5AC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v120 + 12) = 2112;
        OUTLINED_FUNCTION_24_1();
        v128 = _swift_stdlib_bridgeErrorToNSError();
        v204 = v128;
        sub_235F9B5AC();
        *v121 = v128;
        OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_14_1(&dword_235F59000, v116, v119, "Encountered error from bundle: %s while archiving AMLFeaturesDonationMetadata: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
        OUTLINED_FUNCTION_2_1();
        OUTLINED_FUNCTION_8_0();
      }
      OUTLINED_FUNCTION_5_1();

      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_5_1();

      v76 = 0;
      v58 = 0xF000000000000000;
      v29 = v199;
    }
    v195 = dispatch_group_create();
    v193 = (id)v58;
    v177 = (uint64_t)v76;
    if (v58 >> 60 == 15)
    {
      OUTLINED_FUNCTION_42_0();
      v134 = v189;
    }
    else
    {
      v135 = OUTLINED_FUNCTION_15_1();
      v137 = sub_235F6B0E4(v135, v136);
      v138 = OUTLINED_FUNCTION_36_1(v137, sel_rawSignalsConfiguration);
      v139 = objc_msgSend(v138, sel_bundleIdentifier);

      v140 = sub_235F9B3FC();
      v142 = v141;

      v144 = OUTLINED_FUNCTION_28_1(v143, sel_sessionId);
      v145 = sub_235F9B3FC();
      v29 = v146;

      v175 = v195;
      OUTLINED_FUNCTION_79();
      v147 = OUTLINED_FUNCTION_15_1();
      sub_235F6B4AC(v147, v148, v149, v150, v151, v152, v140, v142, v173, v174, 0x8000000235F9F5B0, v145, (uint64_t)v29, v175);
      v153 = OUTLINED_FUNCTION_15_1();
      sub_235F728D4(v153, v154);
      OUTLINED_FUNCTION_9_1();
      v134 = v189;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_42_0();
    }
    v155 = objc_allocWithZone((Class)AMLRawSignalsDonationStatus);
    v156 = v187;
    OUTLINED_FUNCTION_56();
    v198 = sub_235F9840C(v157, v158, v159, v160, (uint64_t)v76, v134, v156);
    sub_235F9B558();
    v197 = *(_QWORD *)(v58 + 2064);
    v161 = v185;
    v162 = v196;
    ((void (*)(char *, uint64_t, uint64_t))v29)(v185, v182, v196);
    v163 = OUTLINED_FUNCTION_53();
    *(_OWORD *)(v163 + 16) = v192;
    v164 = MEMORY[0x24BEE0D00];
    v165 = v184;
    *(_QWORD *)(v163 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v163 + 64) = v165;
    v166 = v178;
    *(_QWORD *)(v163 + 32) = v179;
    *(_QWORD *)(v163 + 40) = v166;
    v167 = OUTLINED_FUNCTION_28_1(v163, sel_rawSignalsConfiguration);
    v168 = objc_msgSend(v167, sel_configurationId);

    v169 = sub_235F9B3FC();
    v171 = v170;

    *(_QWORD *)(v163 + 96) = v164;
    *(_QWORD *)(v163 + 104) = v165;
    *(_QWORD *)(v163 + 72) = v169;
    *(_QWORD *)(v163 + 80) = v171;
    sub_235F9B348();
    v172 = (id)v194;

    swift_release();
    OUTLINED_FUNCTION_9_1();
    sub_235F728D4(v177, (unint64_t)v193);

    v181(v161, v162);
    (*(void (**)(char *, uint64_t))(v190 + 8))(v200, v191);
  }
  else
  {
    OUTLINED_FUNCTION_17_1();
    if (qword_256399418 != -1)
      swift_once();
    v102 = OUTLINED_FUNCTION_19_1();
    __swift_project_value_buffer(v102, (uint64_t)qword_25639A7F8);
    v103 = v29;
    v104 = sub_235F9B36C();
    v105 = sub_235F9B51C();
    v106 = os_log_type_enabled(v104, v105);
    v107 = v189;
    if (v106)
    {
      v108 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      v201 = (id)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v108 = 136315138;
      v199 = v108 + 4;
      v109 = objc_msgSend(v103, (SEL)&selRef_isDuplicate + 6);
      v110 = objc_msgSend(v109, sel_bundleIdentifier);

      sub_235F9B3FC();
      v111 = OUTLINED_FUNCTION_58();
      sub_235F7EC30(v111, v112, v113);
      v204 = v114;
      sub_235F9B5AC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235F59000, v104, v105, "Donation Metadata is nil from bundleId: %s", v108, 0xCu);
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_8_0();
    }

    v129 = v200;
    objc_allocWithZone((Class)AMLRawSignalsDonationStatus);
    OUTLINED_FUNCTION_56();
    v198 = sub_235F9840C(v130, v131, v132, v133, v188, v107, v187);
    (*(void (**)(char *, uint64_t))(v190 + 8))(v129, v191);
  }
  OUTLINED_FUNCTION_11_0();
}

void sub_235F977DC()
{
  void *v0;
  unint64_t v1;
  os_log_type_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  os_log_type_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  OUTLINED_FUNCTION_59_1();
  OUTLINED_FUNCTION_68_1();
  v3 = (void *)objc_opt_self();
  v4 = OUTLINED_FUNCTION_88(v3, sel_archivedDataWithRootObject_requiringSecureCoding_error_);
  v5 = 0;
  if (!v4)
  {
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_76_2();
    OUTLINED_FUNCTION_86_1();
    if (qword_256399418 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_19_1();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_25639A7F8);
    v9 = v0;
    OUTLINED_FUNCTION_23_1();
    v10 = v9;
    OUTLINED_FUNCTION_23_1();
    sub_235F9B36C();
    v11 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_37_0(v11))
    {
      v12 = OUTLINED_FUNCTION_23_0();
      v21 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v12 = 136315394;
      v13 = objc_msgSend(v10, sel_rawSignalsConfiguration);
      v14 = objc_msgSend(v13, sel_bundleIdentifier);

      sub_235F9B3FC();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_51(v15, v16, v17, v18, v19, v20);
      OUTLINED_FUNCTION_11_1();

      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2112;
      OUTLINED_FUNCTION_23_1();
      OUTLINED_FUNCTION_90_1();
      OUTLINED_FUNCTION_13_1();
      *v21 = v10;
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_14_1(&dword_235F59000, v8, v2, "Encountered error from bundle: %s while archiving FeaturesDonation: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_4_1();

    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_4_1();

    goto LABEL_9;
  }
  v6 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_54();
  if (OUTLINED_FUNCTION_71() <= 0)
  {
    OUTLINED_FUNCTION_70();
LABEL_9:
    v6 = 0;
    v1 = 0xF000000000000000;
  }
  OUTLINED_FUNCTION_17_5();
  sub_235F728D4(v6, v1);
  OUTLINED_FUNCTION_12_1();
}

void sub_235F97B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  void *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  id v40;
  os_log_type_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;

  OUTLINED_FUNCTION_59_1();
  a27 = v30;
  a28 = v31;
  OUTLINED_FUNCTION_68_1();
  a16 = *MEMORY[0x24BDAC8D0];
  v32 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563997E0);
  v33 = (void *)sub_235F9B444();
  a15 = 0;
  v34 = objc_msgSend(v32, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v33, 0, &a15);

  v35 = a15;
  if (!v34)
  {
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_76_2();
    OUTLINED_FUNCTION_86_1();
    if (qword_256399418 != -1)
      swift_once();
    v37 = OUTLINED_FUNCTION_19_1();
    v38 = __swift_project_value_buffer(v37, (uint64_t)qword_25639A7F8);
    v39 = v28;
    OUTLINED_FUNCTION_23_1();
    v40 = v39;
    OUTLINED_FUNCTION_23_1();
    sub_235F9B36C();
    v41 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_37_0(v41))
    {
      v42 = OUTLINED_FUNCTION_23_0();
      v51 = (_QWORD *)OUTLINED_FUNCTION_23_0();
      a15 = (id)OUTLINED_FUNCTION_23_0();
      *(_DWORD *)v42 = 136315394;
      v43 = objc_msgSend(v40, sel_rawSignalsConfiguration);
      v44 = objc_msgSend(v43, sel_bundleIdentifier);

      sub_235F9B3FC();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_51(v45, v46, v47, v48, v49, v50);
      OUTLINED_FUNCTION_11_1();

      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2112;
      OUTLINED_FUNCTION_23_1();
      OUTLINED_FUNCTION_90_1();
      OUTLINED_FUNCTION_13_1();
      *v51 = v40;
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_14_1(&dword_235F59000, v38, v29, "Encountered error from bundle: %s while archiving features dictionary donation: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_8_0();
    }
    OUTLINED_FUNCTION_4_1();

    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_4_1();

    goto LABEL_9;
  }
  v36 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_54();
  if (OUTLINED_FUNCTION_71() <= 0)
  {
    OUTLINED_FUNCTION_70();
LABEL_9:
    v36 = 0;
    v33 = (void *)0xF000000000000000;
  }
  OUTLINED_FUNCTION_17_5();
  sub_235F728D4(v36, (unint64_t)v33);
  OUTLINED_FUNCTION_12_1();
}

#error "235F97E38: call analysis failed (funcsize=48)"

void AMLRawSignalsDonation.init()()
{
  OUTLINED_FUNCTION_78();
  __break(1u);
}

uint64_t AMLRawSignalsConfiguration.description.getter()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  sub_235F9B5F4();
  v1 = OUTLINED_FUNCTION_14_5();
  v2 = OUTLINED_FUNCTION_28_1(v1, sel_bundleIdentifier);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_45_0();
  sub_235F88608(v0);
  sub_235F9B420();
  OUTLINED_FUNCTION_20();
  v3 = OUTLINED_FUNCTION_45_0();
  v4 = OUTLINED_FUNCTION_28_1(v3, sel_versionId);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14_5();
  v11 = objc_msgSend(v0, sel_expirationPolicy);
  sub_235F9B6A8();
  sub_235F9B420();
  OUTLINED_FUNCTION_20();
  v5 = OUTLINED_FUNCTION_14_5();
  v6 = OUTLINED_FUNCTION_28_1(v5, sel_rawSignalsDescription);
  v7 = objc_msgSend(v6, sel_description);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_54();
  sub_235F9B420();

  OUTLINED_FUNCTION_9_1();
  v8 = sub_235F9B420();
  v9 = OUTLINED_FUNCTION_28_1(v8, sel_configurationId);
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_84_1();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_17();
  return HIDWORD(v11);
}

uint64_t AMLRawSignalsDonation.description.getter()
{
  uint64_t v0;
  id v1;
  id v2;

  sub_235F9B5F4();
  v0 = sub_235F9B420();
  v1 = OUTLINED_FUNCTION_28_1(v0, sel_rawSignalsConfiguration);
  v2 = objc_msgSend(v1, sel_description);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_69();

  OUTLINED_FUNCTION_17();
  return 0;
}

uint64_t static AMLRawSignalsDonation.decodeModelData(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _QWORD v12[6];

  OUTLINED_FUNCTION_46_2(a1, (unint64_t *)&unk_256399620);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399FC0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_235F9DC00;
  OUTLINED_FUNCTION_46_2(v2, (unint64_t *)&unk_256399630);
  *(_QWORD *)(v2 + 32) = v3;
  OUTLINED_FUNCTION_46_2(v3, (unint64_t *)&qword_256399FD0);
  *(_QWORD *)(v2 + 40) = v4;
  OUTLINED_FUNCTION_46_2(v4, &qword_256399640);
  *(_QWORD *)(v2 + 48) = v5;
  type metadata accessor for AMLRawSignalsDonation(v5);
  *(_QWORD *)(v2 + 56) = v6;
  type metadata accessor for AMLFeaturesSpecification(0);
  *(_QWORD *)(v2 + 64) = v7;
  type metadata accessor for AMLRawSignalsConfiguration(v7);
  *(_QWORD *)(v2 + 72) = v8;
  OUTLINED_FUNCTION_46_2(v8, &qword_256399650);
  *(_QWORD *)(v2 + 80) = v9;
  OUTLINED_FUNCTION_46_2(v9, (unint64_t *)&unk_256399FD8);
  *(_QWORD *)(v2 + 88) = v10;
  sub_235F9B528();
  result = swift_bridgeObjectRelease();
  if (!v1)
  {
    if (v12[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256399870);
      if (swift_dynamicCast())
        return v12[5];
      else
        return 0;
    }
    else
    {
      sub_235F6D3D8((uint64_t)v12);
      return 0;
    }
  }
  return result;
}

unint64_t static AMLRawSignalsDonation.modelContent(for:)()
{
  return 0xD000000000000017;
}

void *sub_235F98380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v5;
  void *v6;

  v5 = OUTLINED_FUNCTION_32_4();
  OUTLINED_FUNCTION_17();
  if (a3)
  {
    v6 = (void *)sub_235F9B3C0();
    OUTLINED_FUNCTION_20();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, sel_initWithSessionId_metadata_, v5, v6);
  OUTLINED_FUNCTION_21_1();

  return v3;
}

id sub_235F9840C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v9 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v7, sel_initWithMetadataDonationId_rawSignalsDonationId_configurationDonationId_group_, v9, v10, v11, a7);

  return v12;
}

void type metadata accessor for AMLRawSignalsDonationStatus(uint64_t a1)
{
  sub_235F727D4(a1, &qword_25639A010);
}

double sub_235F984E0@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  char v6;
  double result;
  uint64_t v8;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_235F7F384();
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v8 = *v2;
    *v2 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563997F0);
    sub_235F9B630();
    swift_bridgeObjectRelease();
    sub_235F6E7A4((_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v4), a1);
    sub_235F9B63C();
    *v2 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_235F98604()
{
  _QWORD *v0;
  uint64_t v2;

  OUTLINED_FUNCTION_41_3();
  OUTLINED_FUNCTION_20_3();
  sub_235F7F590();
  *v0 = v2;
  return OUTLINED_FUNCTION_24_6();
}

uint64_t sub_235F9863C()
{
  _QWORD *v0;
  uint64_t v2;

  OUTLINED_FUNCTION_41_3();
  OUTLINED_FUNCTION_20_3();
  sub_235F7F7D0();
  *v0 = v2;
  return OUTLINED_FUNCTION_24_6();
}

void type metadata accessor for AMLRawSignalsConfiguration(uint64_t a1)
{
  sub_235F727D4(a1, &qword_25639A040);
}

void type metadata accessor for AMLRawSignalsDonation(uint64_t a1)
{
  sub_235F727D4(a1, &qword_25639A070);
}

uint64_t sub_235F9869C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_7_6()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, (SEL)(v2 + 3016), v0);
}

uint64_t OUTLINED_FUNCTION_16_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  return sub_235F6D390((uint64_t)va, (uint64_t)va1);
}

void OUTLINED_FUNCTION_17_5()
{
  sub_235F96674();
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = 0x8000000000000000;
  return v1;
}

uint64_t OUTLINED_FUNCTION_24_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_27_6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + a3);
  *v4 = a1;
  v4[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_6()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_41_3()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_44_2()
{
  return sub_235F9B3F0();
}

uint64_t OUTLINED_FUNCTION_58_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_62_2()
{
  return sub_235F9B66C();
}

void OUTLINED_FUNCTION_63_2(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(a4 + a1) |= v4;
}

void OUTLINED_FUNCTION_76_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_79_3()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_84_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_86_1()
{
  return swift_willThrow();
}

id OUTLINED_FUNCTION_88(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2, 0);
}

uint64_t OUTLINED_FUNCTION_90_1()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

id OUTLINED_FUNCTION_91_1(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_95_0()
{
  return swift_bridgeObjectRelease();
}

void sub_235F988C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = sub_235F9B1F8();
  v1 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v2 = OUTLINED_FUNCTION_0_8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = OUTLINED_FUNCTION_1_6();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F9B210();
  sub_235F9B1C8();
  sub_235F9B1EC();
  Date.localizedDescription(date:time:in:locale:using:)(2, 2);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v9);
  OUTLINED_FUNCTION_5_6(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_11_0();
}

uint64_t sub_235F989D4()
{
  uint64_t v0;

  v0 = sub_235F9B384();
  __swift_allocate_value_buffer(v0, qword_25639A888);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A888);
  return sub_235F9B378();
}

id sub_235F98A50()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  qword_25639A8A0 = (uint64_t)result;
  return result;
}

uint64_t Date.localizedDescription(date:time:in:locale:using:)(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  if (qword_256399458 != -1)
    swift_once();
  v4 = (void *)qword_25639A8A0;
  v5 = (void *)sub_235F9B1E0();
  OUTLINED_FUNCTION_7(v4, sel_setCalendar_);

  v6 = (void *)qword_25639A8A0;
  v7 = (void *)sub_235F9B1BC();
  OUTLINED_FUNCTION_7(v6, sel_setLocale_);

  v8 = (void *)qword_25639A8A0;
  v9 = (void *)sub_235F9B204();
  OUTLINED_FUNCTION_7(v8, sel_setTimeZone_);

  v10 = (void *)qword_25639A8A0;
  objc_msgSend((id)qword_25639A8A0, sel_setDateStyle_, a1);
  objc_msgSend(v10, sel_setTimeStyle_, a2);
  v11 = (void *)sub_235F9B144();
  v12 = objc_msgSend(v10, sel_stringFromDate_, v11);

  v13 = sub_235F9B3FC();
  return v13;
}

void sub_235F98BD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v20[1] = a1;
  v2 = sub_235F9B1F8();
  v21 = *(_QWORD *)(v2 - 8);
  v22 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v3 = OUTLINED_FUNCTION_0_8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = OUTLINED_FUNCTION_1_6();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F9B210();
  sub_235F9B1C8();
  sub_235F9B1EC();
  if (qword_256399458 != -1)
    swift_once();
  v9 = (void *)qword_25639A8A0;
  v10 = (void *)sub_235F9B1E0();
  OUTLINED_FUNCTION_7(v9, sel_setCalendar_);

  v11 = (void *)qword_25639A8A0;
  v12 = (void *)sub_235F9B1BC();
  OUTLINED_FUNCTION_7(v11, sel_setLocale_);

  v13 = (void *)qword_25639A8A0;
  v14 = (void *)sub_235F9B204();
  OUTLINED_FUNCTION_7(v13, sel_setTimeZone_);

  v15 = (void *)qword_25639A8A0;
  v17 = OUTLINED_FUNCTION_4_5(v16, sel_setDateStyle_);
  OUTLINED_FUNCTION_4_5((uint64_t)v17, sel_setTimeStyle_);
  v18 = (void *)sub_235F9B144();
  v19 = objc_msgSend(v15, sel_stringFromDate_, v18);

  sub_235F9B3FC();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v1, v22);
  OUTLINED_FUNCTION_5_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  OUTLINED_FUNCTION_11_0();
}

id sub_235F98DBC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_235F98E0C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AMLUtilities()
{
  return objc_opt_self();
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return sub_235F9B1D4();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return sub_235F9B21C();
}

id OUTLINED_FUNCTION_4_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 4);
}

uint64_t OUTLINED_FUNCTION_5_6@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

id AMLPhotosSearchHelpers.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_235F98ECC()
{
  uint64_t v0;

  v0 = sub_235F9B384();
  __swift_allocate_value_buffer(v0, qword_25639A8A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639A8A8);
  return sub_235F9B378();
}

id AMLPhotosSearchHelpers.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  *(_QWORD *)&v0[OBJC_IVAR____TtC6AeroML22AMLPhotosSearchHelpers_clickedPhotoIds] = &unk_2507530D8;
  v1 = OBJC_IVAR____TtC6AeroML22AMLPhotosSearchHelpers_sessionAssetUUIDs;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639A0D0);
  v2 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v2 + 16) = xmmword_235F9DC20;
  *(_QWORD *)(v2 + 32) = &unk_250753148;
  *(_QWORD *)(v2 + 40) = &unk_250753208;
  *(_QWORD *)(v2 + 48) = &unk_2507532C8;
  *(_QWORD *)&v0[v1] = v2;
  v3 = OBJC_IVAR____TtC6AeroML22AMLPhotosSearchHelpers_cosDistancesAsset;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639A0E0);
  v4 = OUTLINED_FUNCTION_1();
  *(_OWORD *)(v4 + 16) = xmmword_235F9DC20;
  *(_QWORD *)(v4 + 32) = &unk_250753388;
  *(_QWORD *)(v4 + 40) = &unk_2507533F8;
  *(_QWORD *)(v4 + 48) = &unk_250753468;
  *(_QWORD *)&v0[v3] = v4;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for AMLPhotosSearchHelpers();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for AMLPhotosSearchHelpers()
{
  return objc_opt_self();
}

void sub_235F99070()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_14_6(v5, v6, v7);
  OUTLINED_FUNCTION_33_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_21_5();
  v9 = OUTLINED_FUNCTION_1();
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v9 + 16) = MEMORY[0x24BEE4AF8];
  v11 = v9 + 16;
  objc_msgSend(v1, sel_publisher);
  OUTLINED_FUNCTION_32((uint64_t)sub_235F8A97C);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_5_7();
  v12 = swift_allocObject();
  OUTLINED_FUNCTION_4_6(v12);
  *(_QWORD *)(v3 + v4) = v9;
  OUTLINED_FUNCTION_32((uint64_t)sub_235F99254);
  OUTLINED_FUNCTION_22_5();
  v13 = swift_release();
  v14 = OUTLINED_FUNCTION_16_5(v13, sel_sinkWithCompletion_receiveInput_);
  OUTLINED_FUNCTION_34_5();
  _Block_release(v1);

  OUTLINED_FUNCTION_13_5();
  v15 = *(_QWORD *)(v9 + 16);
  v16 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  if (v16)
  {
    swift_bridgeObjectRetain();
    v17 = v15 + 16 * v16 + 24;
    while (v16 <= *(_QWORD *)(v15 + 16))
    {
      OUTLINED_FUNCTION_30_3();
      if ((OUTLINED_FUNCTION_53_3() & 1) == 0)
      {
        v19 = OUTLINED_FUNCTION_20_4();
        sub_235F7E3F4(v19, v20, v21, v22);
        v10 = v23;
      }
      v18 = *(_QWORD *)(v10 + 24);
      if (*(_QWORD *)(v10 + 16) >= v18 >> 1)
      {
        v24 = OUTLINED_FUNCTION_18_5(v18);
        sub_235F7E3F4(v24, v25, v26, v27);
        v10 = v28;
      }
      OUTLINED_FUNCTION_9_6();
      v17 -= 16;
    }
    __break(1u);
    OUTLINED_FUNCTION_17();
  }
  if ((v30 & 1) != 0)
  {
    v29 = OUTLINED_FUNCTION_34_2();
    sub_235F99950(v29);
    OUTLINED_FUNCTION_128_0();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_128_0();
  }
  OUTLINED_FUNCTION_5();
}

void sub_235F99254(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_235F992A4()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_14_6(v5, v6, v7);
  OUTLINED_FUNCTION_33_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_21_5();
  v9 = OUTLINED_FUNCTION_1();
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v9 + 16) = MEMORY[0x24BEE4AF8];
  v11 = v9 + 16;
  objc_msgSend(v1, sel_publisher);
  OUTLINED_FUNCTION_32((uint64_t)sub_235F8A97C);
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_5_7();
  v12 = swift_allocObject();
  OUTLINED_FUNCTION_4_6(v12);
  *(_QWORD *)(v3 + v4) = v9;
  OUTLINED_FUNCTION_32((uint64_t)sub_235F8A97C);
  OUTLINED_FUNCTION_22_5();
  v13 = swift_release();
  v14 = OUTLINED_FUNCTION_16_5(v13, sel_sinkWithCompletion_receiveInput_);
  OUTLINED_FUNCTION_34_5();
  _Block_release(v1);

  OUTLINED_FUNCTION_13_5();
  v15 = *(_QWORD *)(v9 + 16);
  v16 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  if (v16)
  {
    swift_bridgeObjectRetain();
    v17 = v15 + 16 * v16 + 24;
    while (v16 <= *(_QWORD *)(v15 + 16))
    {
      OUTLINED_FUNCTION_30_3();
      if ((OUTLINED_FUNCTION_53_3() & 1) == 0)
      {
        v19 = OUTLINED_FUNCTION_20_4();
        sub_235F7E4E0(v19, v20, v21, v22);
        v10 = v23;
      }
      v18 = *(_QWORD *)(v10 + 24);
      if (*(_QWORD *)(v10 + 16) >= v18 >> 1)
      {
        v24 = OUTLINED_FUNCTION_18_5(v18);
        sub_235F7E4E0(v24, v25, v26, v27);
        v10 = v28;
      }
      OUTLINED_FUNCTION_9_6();
      v17 -= 16;
    }
    __break(1u);
    OUTLINED_FUNCTION_17();
  }
  if ((v30 & 1) != 0)
  {
    v29 = OUTLINED_FUNCTION_34_2();
    sub_235F99E88(v29);
    OUTLINED_FUNCTION_128_0();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_128_0();
  }
  OUTLINED_FUNCTION_5();
}

void sub_235F99488()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  const char *v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_36_2();
  v28 = v0;
  v29 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = sub_235F9B18C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(v9, sel_eventBody);
  if (v14)
  {
    v15 = v14;
    OUTLINED_FUNCTION_24_7((uint64_t)v14, sel_timestamp);
    sub_235F9B114();
    v16 = sub_235F9B060();
    v17 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    if ((v16 & 1) != 0)
    {
      OUTLINED_FUNCTION_24_7(v17, sel_timestamp);
      v19 = v18;
      swift_beginAccess();
      v20 = v15;
      sub_235F9AA14(v5);
      v21 = *(_QWORD *)(*(_QWORD *)(v7 + 16) + 16);
      sub_235F9AAB0(v21, (uint64_t (*)(BOOL))v5);
      v22 = *(_QWORD *)(v7 + 16);
      *(_QWORD *)(v22 + 16) = v21 + 1;
      v23 = v22 + 16 * v21;
      *(_QWORD *)(v23 + 32) = v19;
      *(_QWORD *)(v23 + 40) = v20;
      swift_endAccess();

    }
    else
    {

    }
  }
  else
  {
    if (qword_256399450 != -1)
      swift_once();
    v24 = sub_235F9B384();
    __swift_project_value_buffer(v24, (uint64_t)qword_25639A888);
    v27 = sub_235F9B36C();
    v25 = sub_235F9B51C();
    if (os_log_type_enabled(v27, v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_23_0();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_235F59000, v27, v25, v3, v26, 2u);
      OUTLINED_FUNCTION_8_0();
    }

  }
}

void sub_235F99698()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;

  v0 = sub_235F9971C();
  sub_235F997B0(v0);

  v1 = objc_msgSend((id)BiomeLibrary(), sel_Photos);
  v2 = OUTLINED_FUNCTION_43_1();
  v3 = OUTLINED_FUNCTION_31_1(v2, sel_Search);
  swift_unknownObjectRelease();
  sub_235F997D4(v3);

}

id sub_235F9971C()
{
  id v0;
  id v1;
  id v2;

  v0 = objc_msgSend((id)BiomeLibrary(), sel_AeroML);
  swift_unknownObjectRelease();
  v1 = objc_msgSend(v0, sel_RawEvent);
  swift_unknownObjectRelease();
  v2 = objc_msgSend(v1, sel_PhotosSearchSession);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_235F997B0(void *a1)
{
  return sub_235F997F4(a1, (uint64_t)sub_235F997D0, (uint64_t)sub_235F9AD54, (uint64_t)&block_descriptor_21_0);
}

uint64_t sub_235F997D4(void *a1)
{
  return sub_235F997F4(a1, (uint64_t)sub_235F997D0, (uint64_t)sub_235F998FC, (uint64_t)&block_descriptor_24);
}

uint64_t sub_235F997F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t result;
  _QWORD v11[6];

  v7 = objc_msgSend(a1, sel_pruner);
  v8 = (void *)sub_235F9B3F0();
  v11[4] = a2;
  v11[5] = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = a3;
  v11[3] = a4;
  v9 = _Block_copy(v11);
  swift_release();
  objc_msgSend(v7, sel_deleteWithPolicy_eventsPassingTest_, v8, v9);

  _Block_release(v9);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_235F998F4()
{
  return 1;
}

uint64_t sub_235F998FC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v5)(void *, uint64_t);
  id v6;

  v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

void sub_235F99950(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
  v2 = OUTLINED_FUNCTION_1_7();
  *(_OWORD *)(v2 + 16) = xmmword_235F9D690;
  sub_235F9B5F4();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(a1 + 16);
  sub_235F9B6A8();
  OUTLINED_FUNCTION_12_7();
  OUTLINED_FUNCTION_17();
  sub_235F9B420();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0xD000000000000029;
  *(_QWORD *)(v2 + 40) = 0x8000000235FA0D70;
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_27_1();
  v24 = v3;
  if (v3)
  {
    v23 = a1 + 32;
    OUTLINED_FUNCTION_34_2();
    v4 = 0;
    while (1)
    {
      v5 = *(void **)(v23 + 16 * v4 + 8);
      v6 = OUTLINED_FUNCTION_1_7();
      *(_OWORD *)(v6 + 16) = xmmword_235F9D690;
      v7 = v5;
      sub_235F9B5F4();
      sub_235F9B420();
      sub_235F9B4B0();
      sub_235F9B420();
      v8 = v7;
      sub_235F9ABE0(v8, (SEL *)&selRef_queryRaw);
      v25 = v4;
      if (!v9)
      {
LABEL_18:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_12_7();
      OUTLINED_FUNCTION_17();
      sub_235F9B420();
      v10 = objc_msgSend(v8, sel_queryEmbedding);
      v11 = sub_235F6B254(0, (unint64_t *)&qword_256399FD0);
      v12 = sub_235F9B450();

      MEMORY[0x23B7E7668](v12, v11);
      OUTLINED_FUNCTION_12_7();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_17();
      v13 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v6 + 32) = 0;
      *(_QWORD *)(v6 + 40) = 0xE000000000000000;
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_27_1();
      v14 = OUTLINED_FUNCTION_1_7();
      *(_OWORD *)(v14 + 16) = xmmword_235F9D690;
      *(_QWORD *)(v14 + 56) = v13;
      *(_QWORD *)(v14 + 32) = 0xD000000000000011;
      *(_QWORD *)(v14 + 40) = 0x8000000235FA0DE0;
      OUTLINED_FUNCTION_12_2();
      OUTLINED_FUNCTION_27_1();
      v15 = objc_msgSend(v8, sel_presentedAssets);
      sub_235F6B254(0, (unint64_t *)&qword_256399EC8);
      v16 = sub_235F9B450();

      if (v16 >> 62)
      {
        swift_bridgeObjectRetain();
        v17 = sub_235F9B654();
        swift_bridgeObjectRelease();
        if (!v17)
          goto LABEL_12;
      }
      else
      {
        v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v17)
          goto LABEL_12;
      }
      if (v17 < 1)
      {
        __break(1u);
        goto LABEL_18;
      }
      v18 = 0;
      do
      {
        if ((v16 & 0xC000000000000001) != 0)
          v19 = (id)MEMORY[0x23B7E7818](v18, v16);
        else
          v19 = *(id *)(v16 + 8 * v18 + 32);
        v20 = v19;
        ++v18;
        sub_235F90580(v19);
        v21 = OUTLINED_FUNCTION_1_7();
        *(_OWORD *)(v21 + 16) = xmmword_235F9D690;
        sub_235F9B5F4();
        OUTLINED_FUNCTION_17_6(0x909u);
        sub_235F9B420();
        sub_235F9B420();
        OUTLINED_FUNCTION_43_0();
        v22 = sub_235F9B420();
        OUTLINED_FUNCTION_24_7(v22, sel_cosDistance);
        sub_235F9B4B0();
        sub_235F9B420();
        objc_msgSend(v20, sel_rankingIndex);
        sub_235F9B6A8();
        sub_235F9B420();
        swift_bridgeObjectRelease();
        sub_235F9B420();
        *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v21 + 32) = 0;
        *(_QWORD *)(v21 + 40) = 0xE000000000000000;
        OUTLINED_FUNCTION_12_2();
        OUTLINED_FUNCTION_9_1();

      }
      while (v17 != v18);
LABEL_12:
      ++v4;

      swift_bridgeObjectRelease();
      if (v25 + 1 == v24)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

uint64_t sub_235F99E88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void **i;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256399610);
  v2 = OUTLINED_FUNCTION_1_7();
  *(_OWORD *)(v2 + 16) = xmmword_235F9D690;
  sub_235F9B5F4();
  sub_235F9B420();
  v3 = *(_QWORD *)(a1 + 16);
  sub_235F9B6A8();
  OUTLINED_FUNCTION_25_5();
  OUTLINED_FUNCTION_9_1();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = 0xE000000000000000;
  OUTLINED_FUNCTION_12_2();
  result = OUTLINED_FUNCTION_17();
  if (v3)
  {
    swift_bridgeObjectRetain();
    for (i = (void **)(a1 + 40); ; i += 2)
    {
      v6 = *i;
      v7 = OUTLINED_FUNCTION_1_7();
      *(_OWORD *)(v7 + 16) = xmmword_235F9D690;
      v8 = v6;
      sub_235F9B5F4();
      sub_235F9B420();
      sub_235F9B4B0();
      OUTLINED_FUNCTION_17_6(0x90Au);
      sub_235F9B420();
      v9 = v8;
      result = sub_235F9ABE0(v9, (SEL *)&selRef_identifier);
      if (!v10)
        break;
      OUTLINED_FUNCTION_25_5();
      OUTLINED_FUNCTION_43_0();
      sub_235F9B420();
      v11 = v9;
      result = sub_235F9ABE0(v11, (SEL *)&selRef_subset);
      if (!v12)
        goto LABEL_9;
      OUTLINED_FUNCTION_25_5();
      OUTLINED_FUNCTION_43_0();
      sub_235F9B420();
      objc_msgSend(v11, sel_type);
      type metadata accessor for BMPhotosSearchType();
      sub_235F9B624();
      sub_235F9B420();
      *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v7 + 32) = 0;
      *(_QWORD *)(v7 + 40) = 0xE000000000000000;
      OUTLINED_FUNCTION_12_2();

      swift_bridgeObjectRelease();
      if (!--v3)
        return swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_9:
    __break(1u);
  }
  return result;
}

void sub_235F9A148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t);
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  _QWORD *v48;
  void *v49;
  id v50;
  double v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;

  v1 = v0;
  v2 = sub_235F9B18C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v52 - v7;
  sub_235F9B180();
  sub_235F9B138();
  v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v6, v2);
  sub_235F9B120();
  v11 = v10;
  v9(v8, v2);
  v12 = *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC6AeroML22AMLPhotosSearchHelpers_clickedPhotoIds) + 16);
  if (v12)
  {
    v59 = v1;
    v13 = v11 + 2.0;
    v14 = 0;
    v58 = swift_bridgeObjectRetain();
    v15 = (uint64_t *)(v58 + 40);
    do
    {
      v16 = *(v15 - 1);
      v17 = *v15;
      v18 = objc_allocWithZone(MEMORY[0x24BE0C5E0]);
      swift_bridgeObjectRetain();
      v19 = sub_235F9A7DC(v16, v17, 0xD000000000000019, 0x8000000235F9F860, 1);
      v20 = sub_235F88AE4();
      v21 = objc_msgSend(v20, (SEL)&selRef_dealloc);

      objc_msgSend(v21, (SEL)&selRef_clickCountGivenLocationInLastWeekNormalizedAcrossItems, v19, v13);
      if ((v14 & 1) != 0)
        v22 = 30.0;
      else
        v22 = 1.0;
      v13 = v13 + v22;
      ++v14;
      v15 += 2;
    }
    while (v12 != v14);
    swift_bridgeObjectRelease();
    v1 = v59;
  }
  v61 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399B60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235F9DC20;
  *(_QWORD *)(inited + 32) = 0x6863616562;
  v58 = inited + 32;
  v59 = inited;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_QWORD *)(inited + 48) = 0x6E6F697461636176;
  *(_QWORD *)(inited + 56) = 0xE800000000000000;
  *(_QWORD *)(inited + 64) = 0x6E696C627564;
  *(_QWORD *)(inited + 72) = 0xE600000000000000;
  v24 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6AeroML22AMLPhotosSearchHelpers_sessionAssetUUIDs);
  v57 = *(_QWORD *)(v24 + 16);
  if (v57)
  {
    v25 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6AeroML22AMLPhotosSearchHelpers_cosDistancesAsset);
    v55 = v24 + 32;
    v56 = v25;
    v54 = v25 + 32;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v26 = 0;
    v27 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)&v28 = 134218242;
    v52 = v28;
    v53 = v24;
    while (v26 < *(_QWORD *)(v24 + 16))
    {
      v29 = *(_QWORD *)(v55 + 8 * v26);
      v60 = v27;
      if (v26 >= *(_QWORD *)(v56 + 16))
        goto LABEL_28;
      v30 = *(_QWORD *)(v29 + 16);
      if (v30)
      {
        if (v30 > *(_QWORD *)(*(_QWORD *)(v54 + 8 * v26) + 16))
          goto LABEL_30;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v31 = 0;
        v32 = (uint64_t *)(v29 + 40);
        do
        {
          v33 = *(v32 - 1);
          v34 = *v32;
          swift_bridgeObjectRetain();
          v35 = (void *)sub_235F9B4C8();
          v36 = (void *)sub_235F9B498();
          v37 = objc_allocWithZone(MEMORY[0x24BE0C280]);
          v38 = sub_235F9A880(v33, v34, v35, v36);
          MEMORY[0x23B7E7644]();
          if (*(_QWORD *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_235F9B474();
          v32 += 2;
          ++v31;
          sub_235F9B48C();
          sub_235F9B468();

        }
        while (v30 != v31);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_43_0();
        v24 = v53;
      }
      if (v26 >= *(_QWORD *)(v59 + 16))
        goto LABEL_29;
      v39 = (uint64_t *)(v58 + 16 * v26);
      v40 = *v39;
      v41 = v39[1];
      objc_allocWithZone(MEMORY[0x24BE0C278]);
      swift_bridgeObjectRetain();
      v27 = MEMORY[0x24BEE4AF8];
      v42 = sub_235F9A904(v40, v41);
      if (qword_256399460 != -1)
        swift_once();
      v43 = sub_235F9B384();
      __swift_project_value_buffer(v43, (uint64_t)qword_25639A8A8);
      v44 = v42;
      v45 = sub_235F9B36C();
      v46 = sub_235F9B504();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = OUTLINED_FUNCTION_23_0();
        v48 = (_QWORD *)OUTLINED_FUNCTION_23_0();
        *(_DWORD *)v47 = v52;
        *(double *)(v47 + 4) = v61;
        *(_WORD *)(v47 + 12) = 2112;
        *(_QWORD *)(v47 + 14) = v44;
        *v48 = v44;
        _os_log_impl(&dword_235F59000, v45, v46, "timestamp: %f rawSearchEvent: %@", (uint8_t *)v47, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256399800);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8_0();
      }

      ++v26;
      v49 = (void *)sub_235F88A6C();
      v50 = objc_msgSend(v49, sel_source);

      v51 = v61;
      objc_msgSend(v50, sel_sendEvent_timestamp_, v44, v61);

      v61 = v51 + 30.0;
      if (v26 == v57)
      {
        OUTLINED_FUNCTION_43_0();
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
  }
  else
  {
LABEL_26:
    swift_setDeallocating();
    sub_235F9A9E4();
  }
}

void sub_235F9A750()
{
  sub_235F99698();
  sub_235F9A148();
}

id AMLPhotosSearchHelpers.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMLPhotosSearchHelpers();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_235F9A7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v8;
  void *v9;
  id v10;

  if (!a2)
  {
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
LABEL_6:
  v10 = objc_msgSend(v5, sel_initWithIdentifier_subset_type_, v8, v9, a5);

  return v10;
}

id sub_235F9A880(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v4;
  void *v5;
  void *v8;
  id v9;

  v5 = v4;
  if (a2)
  {
    v8 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v5, sel_initWithAssetUUID_rankingIndex_cosDistance_, v8, a3, a4);

  return v9;
}

id sub_235F9A904(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a2)
  {
    v3 = (void *)sub_235F9B3F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  sub_235F6B254(0, (unint64_t *)&qword_256399FD0);
  v4 = (void *)sub_235F9B444();
  swift_bridgeObjectRelease();
  sub_235F6B254(0, (unint64_t *)&qword_256399EC8);
  v5 = (void *)sub_235F9B444();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v2, sel_initWithQueryRaw_queryEmbedding_presentedAssets_, v3, v4, v5);

  return v6;
}

uint64_t sub_235F9A9E4()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

void sub_235F9AA14(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = OUTLINED_FUNCTION_53_3();
  *v1 = v3;
  if (!(_DWORD)v4)
    *v1 = a1(v4, *(_QWORD *)(v3 + 16) + 1, 1, v3);
  OUTLINED_FUNCTION_24();
}

uint64_t sub_235F9AA5C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void sub_235F9AA9C()
{
  sub_235F9AB7C();
}

uint64_t sub_235F9AAB0(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_235F9B06C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_235F9AB68()
{
  sub_235F9AB7C();
}

void sub_235F9AB7C()
{
  sub_235F9B06C();
  sub_235F99488();
  OUTLINED_FUNCTION_24();
}

uint64_t sub_235F9ABE0(void *a1, SEL *a2)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, *a2);

  if (!v3)
    return 0;
  v4 = sub_235F9B3FC();

  return v4;
}

uint64_t method lookup function for AMLPhotosSearchHelpers()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.loadRawSearchStream(_:dateInterval:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.loadFeedbackSearchStream(_:dateInterval:printDebug:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.prunePhotosSearchStreams()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.pruneRawSearchStream(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.pruneFeedbackSearchStream(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.printRawSearchEvents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.printFeedbackSearchEvents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.createPhotosSearchStreams()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AMLPhotosSearchHelpers.pruneAndCreatePhotosSearchStreams()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(a1 + v2, v4, v3);
}

void OUTLINED_FUNCTION_9_6()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 + 16) = v3;
  v5 = v1 + 16 * v0;
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v2;

}

uint64_t OUTLINED_FUNCTION_10_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v2, v3, v1);
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  return sub_235F9B420();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_14_6(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  *(_DWORD *)(v3 - 156) = a3;
  return sub_235F9B06C();
}

id OUTLINED_FUNCTION_16_5(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(*(id *)(v4 - 152), a2, v2, v3);
}

uint64_t OUTLINED_FUNCTION_17_6(unsigned __int16 a1)
{
  return a1 | 0x69746E6564490000;
}

BOOL OUTLINED_FUNCTION_18_5@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_5()
{
  return swift_retain();
}

id OUTLINED_FUNCTION_24_7(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return sub_235F9B420();
}

id OUTLINED_FUNCTION_30_3()
{
  id *v0;

  return *v0;
}

void OUTLINED_FUNCTION_34_5()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t sub_235F9B054()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_235F9B060()
{
  return MEMORY[0x24BDCB858]();
}

uint64_t sub_235F9B06C()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_235F9B078()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_235F9B084()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_235F9B090()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_235F9B09C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_235F9B0A8()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_235F9B0B4()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_235F9B0C0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_235F9B0CC()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_235F9B0D8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_235F9B0E4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_235F9B0F0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_235F9B0FC()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t sub_235F9B108()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_235F9B114()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_235F9B120()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_235F9B12C()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_235F9B138()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_235F9B144()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_235F9B150()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_235F9B15C()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_235F9B168()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_235F9B174()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_235F9B180()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_235F9B18C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_235F9B198()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_235F9B1A4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_235F9B1B0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_235F9B1BC()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_235F9B1C8()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_235F9B1D4()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_235F9B1E0()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_235F9B1EC()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_235F9B1F8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_235F9B204()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_235F9B210()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_235F9B21C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_235F9B228()
{
  return MEMORY[0x24BDF5C40]();
}

uint64_t sub_235F9B234()
{
  return MEMORY[0x24BDF5CD0]();
}

uint64_t sub_235F9B240()
{
  return MEMORY[0x24BDF5CD8]();
}

uint64_t sub_235F9B24C()
{
  return MEMORY[0x24BDF5CF0]();
}

uint64_t sub_235F9B258()
{
  return MEMORY[0x24BDF5D08]();
}

uint64_t sub_235F9B264()
{
  return MEMORY[0x24BDF5D10]();
}

uint64_t sub_235F9B270()
{
  return MEMORY[0x24BDF5D28]();
}

uint64_t sub_235F9B27C()
{
  return MEMORY[0x24BDF5D30]();
}

uint64_t sub_235F9B288()
{
  return MEMORY[0x24BDF5D90]();
}

uint64_t sub_235F9B294()
{
  return MEMORY[0x24BDF5DE8]();
}

uint64_t sub_235F9B2A0()
{
  return MEMORY[0x24BDF5DF0]();
}

uint64_t sub_235F9B2AC()
{
  return MEMORY[0x24BDF5EA8]();
}

uint64_t sub_235F9B2B8()
{
  return MEMORY[0x24BDF5EB0]();
}

uint64_t sub_235F9B2C4()
{
  return MEMORY[0x24BDF5F20]();
}

uint64_t sub_235F9B2D0()
{
  return MEMORY[0x24BE73E30]();
}

uint64_t sub_235F9B2DC()
{
  return MEMORY[0x24BE73E38]();
}

uint64_t sub_235F9B2E8()
{
  return MEMORY[0x24BE73FE8]();
}

uint64_t _s6AeroML15AMLSODAHostTaskC6taskId0E4Name10hostParamsACSS_SS23SearchOnDeviceAnalytics08SODAHostI0CSgtcfc_0()
{
  return MEMORY[0x24BE85188]();
}

uint64_t sub_235F9B300()
{
  return MEMORY[0x24BE85190]();
}

uint64_t _s6AeroML15AMLSODAHostTaskCfd_0()
{
  return MEMORY[0x24BE851A0]();
}

uint64_t sub_235F9B318()
{
  return MEMORY[0x24BE851A8]();
}

uint64_t sub_235F9B324()
{
  return MEMORY[0x24BE851B0]();
}

uint64_t sub_235F9B330()
{
  return MEMORY[0x24BE851B8]();
}

uint64_t sub_235F9B33C()
{
  return MEMORY[0x24BE851D0]();
}

uint64_t sub_235F9B348()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_235F9B354()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_235F9B360()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_235F9B36C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235F9B378()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235F9B384()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235F9B390()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235F9B39C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_235F9B3A8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235F9B3B4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235F9B3C0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235F9B3CC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235F9B3D8()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_235F9B3E4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_235F9B3F0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235F9B3FC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235F9B408()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_235F9B414()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235F9B420()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235F9B42C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235F9B438()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_235F9B444()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235F9B450()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235F9B45C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_235F9B468()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_235F9B474()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_235F9B480()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_235F9B48C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_235F9B498()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_235F9B4A4()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_235F9B4B0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_235F9B4BC()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_235F9B4C8()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_235F9B4D4()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_235F9B4E0()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_235F9B4EC()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_235F9B4F8()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_235F9B504()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_235F9B510()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_235F9B51C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235F9B528()
{
  return MEMORY[0x24BDCFFB8]();
}

uint64_t sub_235F9B534()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_235F9B540()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_235F9B54C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_235F9B558()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_235F9B564()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_235F9B570()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_235F9B57C()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_235F9B588()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_235F9B594()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_235F9B5A0()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_235F9B5AC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235F9B5B8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235F9B5C4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_235F9B5D0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235F9B5DC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_235F9B5E8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_235F9B5F4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235F9B600()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235F9B60C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235F9B618()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235F9B624()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_235F9B630()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_235F9B63C()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_235F9B648()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235F9B654()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235F9B660()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235F9B66C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235F9B678()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235F9B684()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_235F9B690()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_235F9B69C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_235F9B6A8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_235F9B6B4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_235F9B6C0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235F9B6CC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_235F9B6D8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235F9B6E4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_235F9B6F0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_235F9B6FC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_235F9B708()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_235F9B714()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_235F9B720()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_235F9B72C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_235F9B738()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235F9B744()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235F9B750()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_235F9B75C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_235F9B768()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_235F9B774()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_235F9B780()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

