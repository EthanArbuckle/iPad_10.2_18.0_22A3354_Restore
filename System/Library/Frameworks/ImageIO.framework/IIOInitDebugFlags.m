@implementation IIOInitDebugFlags

const char *__IIOInitDebugFlags_block_invoke()
{
  char *v0;
  char v1;
  unint64_t v2;
  char *v3;
  char v4;
  unint64_t v5;
  char *v6;
  char v7;
  unint64_t v8;
  char *v9;
  char v10;
  unint64_t v11;
  char *v12;
  char v13;
  unint64_t v14;
  char *v15;
  char v16;
  unint64_t v17;
  char *v18;
  char v19;
  unint64_t v20;
  char *v21;
  char v22;
  unint64_t v23;
  char *v24;
  char v25;
  unint64_t v26;
  char *v27;
  char v28;
  unint64_t v29;
  char *v30;
  char v31;
  unint64_t v32;
  char *v33;
  char v34;
  unint64_t v35;
  char *v36;
  char v37;
  unint64_t v38;
  char *v39;
  char v40;
  unint64_t v41;
  char *v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  char *v46;
  int v47;
  unint64_t v48;
  char *v49;
  char v50;
  unint64_t v51;
  char *v52;
  char v53;
  unint64_t v54;
  char *v55;
  char v56;
  unint64_t v57;
  char *v58;
  char v59;
  unint64_t v60;
  char *v61;
  char v62;
  unint64_t v63;
  char *v64;
  char v65;
  unint64_t v66;
  char *v67;
  char v68;
  unint64_t v69;
  char *v70;
  char v71;
  unint64_t v72;
  char *v73;
  char v74;
  unint64_t v75;
  char *v76;
  char v77;
  unint64_t v78;
  char *v79;
  char v80;
  unint64_t v81;
  char *v82;
  char v83;
  unint64_t v84;
  char *v85;
  char v86;
  unint64_t v87;
  char *v88;
  char v89;
  unint64_t v90;
  char *v91;
  char v92;
  unint64_t v93;
  char *v94;
  char v95;
  unint64_t v96;
  char *v97;
  char v98;
  unint64_t v99;
  char *v100;
  char v101;
  unint64_t v102;
  char *v103;
  char v104;
  unint64_t v105;
  char *v106;
  char v107;
  unint64_t v108;
  char *v109;
  char v110;
  unint64_t v111;
  char *v112;
  char v113;
  unint64_t v114;
  char *v115;
  char v116;
  char *v117;
  const char *v118;
  char *v119;
  const char *result;
  const char *v121;
  char *v122;

  v0 = getenv("IIO_LogMemoryUsage");
  if (v0)
    v1 = atoi(v0);
  else
    v1 = 0;
  v2 = gIIODebugFlags & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
  gIIODebugFlags = v2;
  v3 = getenv("IIO_LogDecodingTime");
  if (v3)
    v4 = atoi(v3);
  else
    v4 = 0;
  v5 = v2 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3));
  gIIODebugFlags = v5;
  v6 = getenv("IIO_LogMetadataTime");
  if (v6)
    v7 = atoi(v6);
  else
    v7 = 0;
  v8 = v5 & 0xFFFFFFFFFFFFFFCFLL | (16 * (v7 & 3));
  gIIODebugFlags = v8;
  v9 = getenv("IIO_LogPurgeability");
  if (v9)
    v10 = atoi(v9);
  else
    v10 = 0;
  v11 = v8 & 0xFFFFFFFFFFFFFF3FLL | ((unint64_t)(v10 & 3) << 6);
  gIIODebugFlags = v11;
  v12 = getenv("IIO_LogImageBlocks");
  if (v12)
    v13 = atoi(v12);
  else
    v13 = 0;
  v14 = v11 & 0xFFFFFFFFFFFFF3FFLL | ((unint64_t)(v13 & 3) << 10);
  gIIODebugFlags = v14;
  v15 = getenv("IIO_dLogImageIOAPICalls");
  if (v15)
    v16 = atoi(v15);
  else
    v16 = 0;
  v17 = v14 & 0xFFFFFFFFFFFFCFFFLL | ((unint64_t)(v16 & 3) << 12);
  gIIODebugFlags = v17;
  v18 = getenv("IIO_dLogImageIOSPICalls");
  if (v18)
    v19 = atoi(v18);
  else
    v19 = 0;
  v20 = v17 & 0xFFFFFFFFFFFF3FFFLL | ((unint64_t)(v19 & 3) << 14);
  gIIODebugFlags = v20;
  v21 = getenv("IIO_LogPluginInfo");
  if (v21)
    v22 = atoi(v21);
  else
    v22 = 0;
  v23 = v20 & 0xFFFFFFFFFFFCFFFFLL | ((unint64_t)(v22 & 3) << 16);
  gIIODebugFlags = v23;
  v24 = getenv("IIO_LogHDR");
  if (v24)
    v25 = atoi(v24);
  else
    v25 = 0;
  v26 = v23 & 0xFFFFFFFFFFCFFFFFLL | ((unint64_t)(v25 & 3) << 20);
  gIIODebugFlags = v26;
  v27 = getenv("IIO_LogCacheUsage");
  if (v27)
    v28 = atoi(v27);
  else
    v28 = 0;
  v29 = v26 & 0xFFFFFFFFFFFFFCFFLL | ((unint64_t)(v28 & 3) << 8);
  gIIODebugFlags = v29;
  v30 = getenv("IIO_DEBUG_METADATA");
  if (v30)
    v31 = atoi(v30);
  else
    v31 = 0;
  v32 = v29 & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)(v31 & 1) << 24);
  gIIODebugFlags = v32;
  v33 = getenv("IMAGEIO_DEBUG_RAW_LOADING");
  if (v33)
    v34 = atoi(v33);
  else
    v34 = 0;
  v35 = v32 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)(v34 & 1) << 26);
  gIIODebugFlags = v35;
  v36 = getenv("DISABLE_RAW_SUPPORT");
  if (v36)
    v37 = atoi(v36);
  else
    v37 = 0;
  v38 = v35 & 0xFFFFFFFFF7FFFFFFLL | ((unint64_t)(v37 & 1) << 27);
  gIIODebugFlags = v38;
  v39 = getenv("IIO_SAVEINPUTDATA");
  if (v39)
    v40 = atoi(v39);
  else
    v40 = 0;
  v41 = v38 & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)(v40 & 1) << 28);
  gIIODebugFlags = v41;
  v42 = getenv("IMAGEIO_ENABLE_CACHE");
  v43 = v41 & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)(v42 != 0) << 29);
  gIIODebugFlags = v43;
  if (v42)
    v44 = atoi(v42);
  else
    v44 = 0;
  v45 = v43 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(v44 & 1) << 30);
  gIIODebugFlags = v45;
  v46 = getenv("IIO_DISABLE_MULTIPLE_RESOLUTIONS");
  if (v46)
    v47 = atoi(v46);
  else
    v47 = 0;
  v48 = (v47 << 31) | v45 & 0xFFFFFFFF7FFFFFFFLL;
  gIIODebugFlags = v48;
  v49 = getenv("IIO_DisableSubsamplePNG");
  if (v49)
    v50 = atoi(v49);
  else
    v50 = 0;
  v51 = v48 & 0xFFFFFFFEFFFFFFFFLL | ((unint64_t)(v50 & 1) << 32);
  gIIODebugFlags = v51;
  v52 = getenv("IIO_DisableSubsampleTIFF");
  if (v52)
    v53 = atoi(v52);
  else
    v53 = 0;
  v54 = v51 & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(v53 & 1) << 33);
  gIIODebugFlags = v54;
  v55 = getenv("IIO_DebugImageCopy");
  if (v55)
    v56 = atoi(v55);
  else
    v56 = 0;
  v57 = v54 & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)(v56 & 1) << 34);
  gIIODebugFlags = v57;
  v58 = getenv("IIO_PreferUnassociatedAlphaTIFF");
  if (v58)
    v59 = atoi(v58);
  else
    v59 = 0;
  v60 = v57 & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(v59 & 1) << 35);
  gIIODebugFlags = v60;
  v61 = getenv("IIO_LogHWUsage");
  if (v61)
    v62 = atoi(v61);
  else
    v62 = 0;
  v63 = v60 & 0xFFFFFFEFFFFFFFFFLL | ((unint64_t)(v62 & 1) << 36);
  gIIODebugFlags = v63;
  v64 = getenv("IIO_DebugIncrementalLoading");
  if (v64)
    v65 = atoi(v64);
  else
    v65 = 0;
  v66 = v63 & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)(v65 & 1) << 37);
  gIIODebugFlags = v66;
  v67 = getenv("IIO_DebugSurfaceFormat");
  if (v67)
    v68 = atoi(v67);
  else
    v68 = 0;
  v69 = v66 & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)(v68 & 1) << 25);
  gIIODebugFlags = v69;
  v70 = getenv("IIO_DisableLowPowerGPU");
  if (v70)
    v71 = atoi(v70);
  else
    v71 = 1;
  v72 = v69 & 0xFFF7FFFFFFFFFFFFLL | ((unint64_t)(v71 & 1) << 51);
  gIIODebugFlags = v72;
  v73 = getenv("IIO_DebugMemMapping");
  if (v73)
    v74 = atoi(v73);
  else
    v74 = 0;
  v75 = v72 & 0xFFFFEFFFFFFFFFFFLL | ((unint64_t)(v74 & 1) << 44);
  gIIODebugFlags = v75;
  v76 = getenv("IIO_DebugFileAccess");
  if (v76)
    v77 = atoi(v76);
  else
    v77 = 0;
  v78 = v75 & 0xFFFFDFFFFFFFFFFFLL | ((unint64_t)(v77 & 1) << 45);
  gIIODebugFlags = v78;
  v79 = getenv("IIO_DebugReads");
  if (v79)
    v80 = atoi(v79);
  else
    v80 = 0;
  v81 = v78 & 0xFFFFFFFFFF3FFFFFLL | ((unint64_t)(v80 & 3) << 22);
  gIIODebugFlags = v81;
  v82 = getenv("IIO_CreateHash");
  if (v82)
    v83 = atoi(v82);
  else
    v83 = 0;
  v84 = v81 & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(v83 & 1) << 38);
  gIIODebugFlags = v84;
  v85 = getenv("IIO_DebugColorHandling");
  if (v85)
    v86 = atoi(v85);
  else
    v86 = 0;
  v87 = v84 & 0xFFFFFF7FFFFFFFFFLL | ((unint64_t)(v86 & 1) << 39);
  gIIODebugFlags = v87;
  v88 = getenv("IIO_DebugCreateImageConforming");
  if (v88)
    v89 = atoi(v88);
  else
    v89 = 0;
  v90 = v87 & 0xFFFFFEFFFFFFFFFFLL | ((unint64_t)(v89 & 1) << 40);
  gIIODebugFlags = v90;
  v91 = getenv("IIO_LogEncodingTime");
  if (v91)
    v92 = atoi(v91);
  else
    v92 = 0;
  v93 = v90 & 0xFFFFFDFFFFFFFFFFLL | ((unint64_t)(v92 & 1) << 41);
  gIIODebugFlags = v93;
  v94 = getenv("IIO_DebugAlphaHandling");
  if (v94)
    v95 = atoi(v94);
  else
    v95 = 0;
  v96 = v93 & 0xFFFFFBFFFFFFFFFFLL | ((unint64_t)(v95 & 1) << 42);
  gIIODebugFlags = v96;
  v97 = getenv("IIO_DebugDataHandling");
  if (v97)
    v98 = atoi(v97);
  else
    v98 = 0;
  v99 = v96 & 0xFFFFF7FFFFFFFFFFLL | ((unint64_t)(v98 & 1) << 43);
  gIIODebugFlags = v99;
  v100 = getenv("IIO_DebugBlockSet");
  if (v100)
    v101 = atoi(v100);
  else
    v101 = 0;
  v102 = v99 & 0xFFFFBFFFFFFFFFFFLL | ((unint64_t)(v101 & 1) << 46);
  gIIODebugFlags = v102;
  v103 = getenv("IIO_LogIssues");
  if (v103)
    v104 = atoi(v103);
  else
    v104 = 0;
  v105 = v102 & 0xFFFF7FFFFFFFFFFFLL | ((unint64_t)(v104 & 1) << 47);
  gIIODebugFlags = v105;
  v106 = getenv("IIO_Animation");
  if (v106)
    v107 = atoi(v106);
  else
    v107 = 0;
  v108 = v105 & 0xFFFEFFFFFFFFFFFFLL | ((unint64_t)(v107 & 1) << 48);
  gIIODebugFlags = v108;
  v109 = getenv("IIO_LogXPC");
  if (v109)
    v110 = atoi(v109);
  else
    v110 = 0;
  v111 = v108 & 0xFFFFFFFFFFF3FFFFLL | ((unint64_t)(v110 & 3) << 18);
  gIIODebugFlags = v111;
  v112 = getenv("IIO_LogEXIFOrientation");
  if (v112)
    v113 = atoi(v112);
  else
    v113 = 0;
  v114 = v111 & 0xFFFDFFFFFFFFFFFFLL | ((unint64_t)(v113 & 1) << 49);
  gIIODebugFlags = v114;
  v115 = getenv("IIO_LogRestrictions");
  if (v115)
    v116 = atoi(v115);
  else
    v116 = 0;
  gIIODebugFlags = v114 & 0xFFFBFFFFFFFFFFFFLL | ((unint64_t)(v116 & 1) << 50);
  v117 = getenv("IIO_SaveImageBlocks");
  if (v117)
  {
    v118 = v117;
    if (!strcmp(v117, "ALL"))
    {
      v119 = &gDebugBlockType;
    }
    else if (!strcmp(v118, "framework"))
    {
      v119 = &byte_1EDF0A4C9;
    }
    else if (!strcmp(v118, "ASTC"))
    {
      v119 = &byte_1EDF0A4CA;
    }
    else if (!strcmp(v118, "ATX"))
    {
      v119 = &byte_1EDF0A4CB;
    }
    else if (!strcmp(v118, "BMP"))
    {
      v119 = &byte_1EDF0A4CD;
    }
    else if (!strcmp(v118, "DDS"))
    {
      v119 = &byte_1EDF0A4CE;
    }
    else if (!strcmp(v118, "EXR"))
    {
      v119 = &byte_1EDF0A4D0;
    }
    else if (!strcmp(v118, "GIF"))
    {
      v119 = &byte_1EDF0A4D1;
    }
    else if (!strcmp(v118, "HEIF"))
    {
      v119 = &byte_1EDF0A4D2;
    }
    else if (!strcmp(v118, "ICNS"))
    {
      v119 = &byte_1EDF0A4D3;
    }
    else if (!strcmp(v118, "ICO"))
    {
      v119 = &byte_1EDF0A4D4;
    }
    else if (!strcmp(v118, "JPEG"))
    {
      v119 = &byte_1EDF0A4D5;
    }
    else if (!strcmp(v118, "JP2000"))
    {
      v119 = &byte_1EDF0A4D6;
    }
    else if (!strcmp(v118, "KTX"))
    {
      v119 = &byte_1EDF0A4D7;
    }
    else if (!strcmp(v118, "KTX2"))
    {
      v119 = &byte_1EDF0A4D8;
    }
    else if (!strcmp(v118, "MPO"))
    {
      v119 = &byte_1EDF0A4D9;
    }
    else if (!strcmp(v118, "PBM"))
    {
      v119 = &byte_1EDF0A4DA;
    }
    else if (!strcmp(v118, "PDF"))
    {
      v119 = &byte_1EDF0A4DB;
    }
    else if (!strcmp(v118, "PICT"))
    {
      v119 = &byte_1EDF0A4DC;
    }
    else if (!strcmp(v118, "PNG"))
    {
      v119 = &byte_1EDF0A4DD;
    }
    else if (!strcmp(v118, "PNTG"))
    {
      v119 = &byte_1EDF0A4DE;
    }
    else if (!strcmp(v118, "PSD"))
    {
      v119 = &byte_1EDF0A4DF;
    }
    else if (!strcmp(v118, "PVRTC"))
    {
      v119 = &byte_1EDF0A4E0;
    }
    else if (!strcmp(v118, "RAD"))
    {
      v119 = &byte_1EDF0A4E1;
    }
    else if (!strcmp(v118, "SGI"))
    {
      v119 = &byte_1EDF0A4E2;
    }
    else if (!strcmp(v118, "SVG"))
    {
      v119 = &byte_1EDF0A4E3;
    }
    else if (!strcmp(v118, "TGA"))
    {
      v119 = &byte_1EDF0A4E4;
    }
    else if (!strcmp(v118, "TIFF"))
    {
      v119 = &byte_1EDF0A4E5;
    }
    else if (!strcmp(v118, "WEBP"))
    {
      v119 = &byte_1EDF0A4E6;
    }
    else
    {
      if (strcmp(v118, "XBM"))
        goto LABEL_180;
      v119 = &byte_1EDF0A4E7;
    }
    *v119 = 1;
  }
LABEL_180:
  result = getenv("IIO_PluginVerbose");
  if (!result)
    return result;
  v121 = result;
  result = (const char *)strcmp(result, "ALL");
  if ((_DWORD)result)
  {
    result = (const char *)strcmp(v121, "framework");
    if ((_DWORD)result)
    {
      result = (const char *)strcmp(v121, "ASTC");
      if ((_DWORD)result)
      {
        result = (const char *)strcmp(v121, "ATX");
        if ((_DWORD)result)
        {
          result = (const char *)strcmp(v121, "BMP");
          if ((_DWORD)result)
          {
            result = (const char *)strcmp(v121, "DDS");
            if ((_DWORD)result)
            {
              result = (const char *)strcmp(v121, "EXR");
              if ((_DWORD)result)
              {
                result = (const char *)strcmp(v121, "GIF");
                if ((_DWORD)result)
                {
                  result = (const char *)strcmp(v121, "HEIF");
                  if ((_DWORD)result)
                  {
                    result = (const char *)strcmp(v121, "ICNS");
                    if ((_DWORD)result)
                    {
                      result = (const char *)strcmp(v121, "ICO");
                      if ((_DWORD)result)
                      {
                        result = (const char *)strcmp(v121, "JPEG");
                        if ((_DWORD)result)
                        {
                          result = (const char *)strcmp(v121, "JP2000");
                          if ((_DWORD)result)
                          {
                            result = (const char *)strcmp(v121, "KTX");
                            if ((_DWORD)result)
                            {
                              result = (const char *)strcmp(v121, "KTX2");
                              if ((_DWORD)result)
                              {
                                result = (const char *)strcmp(v121, "MPO");
                                if ((_DWORD)result)
                                {
                                  result = (const char *)strcmp(v121, "PBM");
                                  if ((_DWORD)result)
                                  {
                                    result = (const char *)strcmp(v121, "PDF");
                                    if ((_DWORD)result)
                                    {
                                      result = (const char *)strcmp(v121, "PICT");
                                      if ((_DWORD)result)
                                      {
                                        result = (const char *)strcmp(v121, "PNG");
                                        if ((_DWORD)result)
                                        {
                                          result = (const char *)strcmp(v121, "PNTG");
                                          if ((_DWORD)result)
                                          {
                                            result = (const char *)strcmp(v121, "PSD");
                                            if ((_DWORD)result)
                                            {
                                              result = (const char *)strcmp(v121, "PVRTC");
                                              if ((_DWORD)result)
                                              {
                                                result = (const char *)strcmp(v121, "RAD");
                                                if ((_DWORD)result)
                                                {
                                                  result = (const char *)strcmp(v121, "SGI");
                                                  if ((_DWORD)result)
                                                  {
                                                    result = (const char *)strcmp(v121, "SVG");
                                                    if ((_DWORD)result)
                                                    {
                                                      result = (const char *)strcmp(v121, "TGA");
                                                      if ((_DWORD)result)
                                                      {
                                                        result = (const char *)strcmp(v121, "TIFF");
                                                        if ((_DWORD)result)
                                                        {
                                                          result = (const char *)strcmp(v121, "WEBP");
                                                          if ((_DWORD)result)
                                                          {
                                                            result = (const char *)strcmp(v121, "XBM");
                                                            if ((_DWORD)result)
                                                              return result;
                                                            v122 = &byte_1EDF0A507;
                                                          }
                                                          else
                                                          {
                                                            v122 = &byte_1EDF0A506;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v122 = &byte_1EDF0A505;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v122 = &byte_1EDF0A504;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v122 = &byte_1EDF0A503;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v122 = &byte_1EDF0A502;
                                                  }
                                                }
                                                else
                                                {
                                                  v122 = &byte_1EDF0A501;
                                                }
                                              }
                                              else
                                              {
                                                v122 = &byte_1EDF0A500;
                                              }
                                            }
                                            else
                                            {
                                              v122 = &byte_1EDF0A4FF;
                                            }
                                          }
                                          else
                                          {
                                            v122 = &byte_1EDF0A4FE;
                                          }
                                        }
                                        else
                                        {
                                          v122 = &byte_1EDF0A4FD;
                                        }
                                      }
                                      else
                                      {
                                        v122 = &byte_1EDF0A4FC;
                                      }
                                    }
                                    else
                                    {
                                      v122 = &byte_1EDF0A4FB;
                                    }
                                  }
                                  else
                                  {
                                    v122 = &byte_1EDF0A4FA;
                                  }
                                }
                                else
                                {
                                  v122 = &byte_1EDF0A4F9;
                                }
                              }
                              else
                              {
                                v122 = &byte_1EDF0A4F8;
                              }
                            }
                            else
                            {
                              v122 = &byte_1EDF0A4F7;
                            }
                          }
                          else
                          {
                            v122 = &byte_1EDF0A4F6;
                          }
                        }
                        else
                        {
                          v122 = &byte_1EDF0A4F5;
                        }
                      }
                      else
                      {
                        v122 = &byte_1EDF0A4F4;
                      }
                    }
                    else
                    {
                      v122 = &byte_1EDF0A4F3;
                    }
                  }
                  else
                  {
                    v122 = &byte_1EDF0A4F2;
                  }
                }
                else
                {
                  v122 = &byte_1EDF0A4F1;
                }
              }
              else
              {
                v122 = &byte_1EDF0A4F0;
              }
            }
            else
            {
              v122 = &byte_1EDF0A4EE;
            }
          }
          else
          {
            v122 = &byte_1EDF0A4ED;
          }
        }
        else
        {
          v122 = &byte_1EDF0A4EB;
        }
      }
      else
      {
        v122 = &byte_1EDF0A4EA;
      }
    }
    else
    {
      v122 = &byte_1EDF0A4E9;
    }
  }
  else
  {
    v122 = &gDebugVerboseType;
  }
  *v122 = 1;
  return result;
}

@end
