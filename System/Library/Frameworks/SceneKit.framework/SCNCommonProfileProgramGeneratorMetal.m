@implementation SCNCommonProfileProgramGeneratorMetal

- (__C3DFXProgram)_newProgramWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  void *v8;
  void *v9;
  int v10;
  int IsOne;
  int HasConstantAlpha;
  int LightingEnabled;
  int RenderMode;
  uint64_t EyeCount;
  uint64_t v16;
  int MultiVertexOutputStreamGenerator;
  const __CFString *v18;
  const __CFString *v19;
  unint64_t v20;
  unsigned int Status;
  unint64_t v22;
  __int16 v23;
  unsigned int v24;
  int VertexAmplificationEnabled;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  int IsEnabled;
  int v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  __int16 v37;
  uint64_t Declaration;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  unsigned int LightsMask;
  unsigned int LightsCount;
  uint64_t v44;
  uint64_t v45;
  unsigned int LightHashCode;
  unsigned int v47;
  _BOOL4 v48;
  uint64_t v49;
  _BOOL4 v50;
  int v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  int v57;
  char v58;
  int v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  BOOL v64;
  const char *v65;
  char v66;
  NSObject *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  void *v71;
  const __CFString *Description;
  uint64_t ProbesLightingOrder;
  uint64_t v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  int v78;
  int v79;
  int v80;
  int v81;
  unsigned int v82;
  int v83;
  unint64_t v84;
  int v85;
  int v86;
  int v87;
  char v88;
  uint64_t CustomSlotCount;
  uint64_t v90;
  uint64_t i;
  const __CFString *CustomSlotSortedName;
  uint64_t CustomSlotUVSet;
  uint64_t v94;
  unint64_t v95;
  uint64_t UVSetsCount;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int16 UVSetInfo;
  int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t j;
  int v106;
  const __CFString *v107;
  int v108;
  const void *v109;
  const void *v110;
  const __CFString *v111;
  const char *v112;
  const __CFString *v113;
  int v114;
  const __CFString *v115;
  const __CFString *v116;
  id v117;
  const __CFString *v118;
  int v119;
  const __CFString *v120;
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  SCNCommonProfileProgramGeneratorMetal *v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  NSUInteger v129;
  uint64_t v130;
  NSUInteger v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  __CFString *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  id v143;
  const __CFDictionary *RenderingOptionForKey;
  uint64_t v145;
  void *v146;
  const void *v147;
  __C3DFXProgram *v148;
  const void *HashCode;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const __CFString *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  char v158;
  int IsOpaque;
  int v160;
  int v161;
  __int16 EffectPropertyHashCode;
  int v163;
  int v164;
  uint64_t v165;
  int AmbientLightingEnabled;
  __int16 Conditioners;
  unsigned int CommonProfileHashCode;
  unsigned int v169;
  __C3DEngineContext *v170;
  unint64_t v171;
  int v172;
  int HasTexture;
  int v174;
  unsigned int NodeHashCode;
  unsigned int v176;
  id v177;
  uint64_t v178;
  int v179;
  __C3DProgramHashCode *v180;
  int valuePtr;
  __C3DProgramHashCode *v183;
  void *v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  uint8_t buf;
  char v200[7];
  _QWORD v201[8];
  __int128 v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const __CFString *v206;
  const __CFString *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const __CFString *v211;
  uint64_t v212;
  const __CFString *v213;
  const __CFString *v214;
  _QWORD v215[3];
  uint8_t v216[4];
  _QWORD v217[5];

  *(_QWORD *)((char *)&v217[2] + 4) = *MEMORY[0x1E0C80C00];
  if (self->_useFunctionConstants)
    return -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCodeWithFunctionConstants:engineContext:introspectionDataPtr:](self, "_newProgramWithHashCodeWithFunctionConstants:engineContext:introspectionDataPtr:", a3, a4, a5);
  v197 = 0u;
  v198 = 0u;
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v192 = 0u;
  v190 = 0u;
  v191 = 0u;
  v188 = 0u;
  v189 = 0u;
  v186 = 0u;
  v187 = 0u;
  v185 = 0u;
  v183 = a3;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0, a4, a5);
  v184 = v8;
  v9 = 0;
  if (C3DShouldCollectGeneratedShaders())
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    *(_QWORD *)&v185 = v9;
  }
  *(_QWORD *)&v189 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *(_QWORD *)&v186 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *((_QWORD *)&v186 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *((_QWORD *)&v189 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *(_QWORD *)&v190 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *((_QWORD *)&v190 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *(_QWORD *)&v191 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *((_QWORD *)&v191 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *((_QWORD *)&v192 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *(_QWORD *)&v193 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *(_QWORD *)&v194 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *((_QWORD *)&v194 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *(_QWORD *)&v195 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *((_QWORD *)&v195 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  *(_QWORD *)&v196 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  Conditioners = C3DProgramHashCodeGetConditioners((uint64_t)a3);
  IsOpaque = C3DProgramHashCodeIsOpaque((uint64_t)a3);
  HasTexture = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 7u);
  v160 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 4u);
  v10 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 5u);
  IsOne = C3DProgramHashCodeGlobalAlphaIsOne((uint64_t)a3);
  HasConstantAlpha = C3DProgramHashCodeHasConstantAlpha((uint64_t)a3);
  LightingEnabled = C3DProgramHashCodeGetLightingEnabled((uint64_t)a3);
  CommonProfileHashCode = C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)a3);
  NodeHashCode = C3DProgramHashCodeGetNodeHashCode((uint64_t)a3);
  v163 = IsOne;
  v161 = v10;
  v172 = (NodeHashCode & 4) != 0 && C3DEngineContextHasFeatures((uint64_t)a4, 16);
  EffectPropertyHashCode = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)a3, 2u);
  BYTE11(v196) = HasTexture | ((CommonProfileHashCode & 0x10) >> 4);
  RenderMode = C3DProgramHashCodeGetRenderMode((uint64_t)a3);
  EyeCount = C3DProgramHashCodeGetEyeCount((uint64_t)a3);
  if (!RenderMode)
    goto LABEL_21;
  v16 = EyeCount;
  if (!objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("USE_POSITION")))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA5FF168, CFSTR("USE_POSITION"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v16), CFSTR("USE_MULTIPLE_RENDERING"));
  MultiVertexOutputStreamGenerator = C3DProgramHashCodeGetMultiVertexOutputStreamGenerator((uint64_t)a3);
  if (MultiVertexOutputStreamGenerator == 2)
  {
    v18 = CFSTR("USE_VERTEX_AMPLIFICATION");
    goto LABEL_15;
  }
  if (MultiVertexOutputStreamGenerator == 1)
  {
    v18 = CFSTR("USE_INSTANCING");
LABEL_15:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &stru_1EA5A6480, v18);
  }
  if (RenderMode == 1)
  {
    v19 = CFSTR("USE_LAYERED_RENDERING");
  }
  else
  {
    if (RenderMode != 2)
      goto LABEL_21;
    v19 = CFSTR("USE_MULTIPLE_VIEWPORTS_RENDERING");
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &stru_1EA5A6480, v19);
LABEL_21:
  if (v9)
  {
    objc_msgSend(v9, "addObject:", CFSTR("USE_MULTIPLE_RENDERING"));
    objc_msgSend(v9, "addObject:", CFSTR("USE_VERTEX_AMPLIFICATION"));
    objc_msgSend(v9, "addObject:", CFSTR("USE_INSTANCING"));
    objc_msgSend(v9, "addObject:", CFSTR("USE_LAYERED_RENDERING"));
    objc_msgSend(v9, "addObject:", CFSTR("USE_MULTIPLE_VIEWPORTS_RENDERING"));
  }
  v20 = SCNMetalLanguageVersion();
  v180 = a3;
  Status = C3DSceneSourceGetStatus((uint64_t)a3);
  if (v20 <= Status)
    v22 = Status;
  else
    v22 = v20;
  v23 = CommonProfileHashCode;
  v24 = CommonProfileHashCode;
  if ((RenderMode == 2 || RenderMode == 1) && v22 <= 0x20001)
    v22 = 131073;
  VertexAmplificationEnabled = C3DEngineContextGetVertexAmplificationEnabled((uint64_t)a4);
  v26 = 131074;
  if (v22 > 0x20002)
    v26 = v22;
  if (!VertexAmplificationEnabled)
    v26 = v22;
  v171 = v26;
  v158 = __InjectAllModifiersIfNeeded((uint64_t)&v183);
  v27 = (uint64_t)v180;
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_MODIFIER_FRAMEBUFFER_COLOR0")))
  {
    if (C3DEngineContextHasFeatures((uint64_t)a4, 2048))
    {
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("C3D_SUPPORTS_PROGRAMMABLE_BLENDING"));
    }
    else
    {
      v28 = scn_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.3();
    }
  }
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_MODIFIER_FRAMEBUFFER_COLOR0"));
    objc_msgSend((id)v185, "addObject:", CFSTR("C3D_SUPPORTS_PROGRAMMABLE_BLENDING"));
  }
  v29 = CommonProfileHashCode & 0xF;
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_CLIP_DISTANCE3")))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", CFSTR("4"), CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v30 = 4;
LABEL_49:
    v165 = v30;
    goto LABEL_50;
  }
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_CLIP_DISTANCE2")))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", CFSTR("3"), CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v30 = 3;
    goto LABEL_49;
  }
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_CLIP_DISTANCE1")))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", CFSTR("2"), CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v30 = 2;
    goto LABEL_49;
  }
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_CLIP_DISTANCE0")))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v30 = 1;
    goto LABEL_49;
  }
  v165 = 0;
LABEL_50:
  if (v29 == 5)
    BYTE11(v196) = 1;
  IsEnabled = 0;
  if ((CommonProfileHashCode & 0xB) != 0)
    v32 = LightingEnabled;
  else
    v32 = 0;
  if (v29 == 5)
    v33 = 1;
  else
    v33 = v32;
  if ((CommonProfileHashCode & 0xE) == 2 && v33)
    IsEnabled = C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v180, 3u);
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_SPECULAR")))
    v34 = 1;
  else
    v34 = IsEnabled;
  v164 = v34;
  if (v34 == 1)
  {
    if (BYTE11(v196))
      v35 = &unk_1EA5FF180;
    else
      v35 = &unk_1EA5FF168;
    objc_msgSend(v184, "setObject:forKeyedSubscript:", v35, CFSTR("USE_VIEW"));
    if (BYTE11(v196))
      v36 = &unk_1EA5FF180;
    else
      v36 = &unk_1EA5FF168;
    v27 = (uint64_t)v180;
    objc_msgSend(v184, "setObject:forKeyedSubscript:", v36, CFSTR("USE_SHININESS"));
  }
  BYTE10(v196) = 0;
  WORD4(v196) = 0;
  HIDWORD(v196) = 0;
  BYTE8(v198) = 1;
  AmbientLightingEnabled = C3DProgramHashCodeGetAmbientLightingEnabled(v27);
  v170 = a4;
  v174 = v33;
  v169 = CommonProfileHashCode & 0xF;
  v37 = Conditioners;
  if (!v33)
    goto LABEL_189;
  if (*((_QWORD *)&v193 + 1))
  {
    Declaration = C3DShaderModifierGetDeclaration(*((uint64_t *)&v193 + 1));
    if (Declaration)
      objc_msgSend((id)v193, "appendString:", Declaration);
  }
  v157 = HasConstantAlpha;
  if (v29 == 5)
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_PBR"));
    v39 = v184;
    v40 = (const __CFString *)&unk_1EA5FF180;
    v41 = CFSTR("USE_VIEW");
LABEL_80:
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, v41);
    goto LABEL_81;
  }
  if (v29 == 6)
  {
    v39 = v184;
    v40 = &stru_1EA5A6480;
    v41 = CFSTR("USE_SHADOWONLY");
    goto LABEL_80;
  }
LABEL_81:
  LightsMask = C3DProgramHashCodeGetLightsMask(v27);
  LightsCount = C3DProgramHashCodeGetLightsCount(v27);
  if (LightsCount)
  {
    v44 = 0;
    v45 = LightsCount;
    v176 = LightsMask;
    v178 = LightsCount;
    while (1)
    {
      if (((LightsMask >> v44) & 1) != 0)
      {
        LightHashCode = C3DProgramHashCodeGetLightHashCode((uint64_t)v183, (unsigned __int16)v44);
        v47 = LightHashCode;
        v48 = (LightHashCode & 5) == 1 && (LightHashCode >> 9) & 1;
        v49 = (LightHashCode >> 21) & 7;
        v50 = v49 > 1 && (LightHashCode >> 25) & 1;
        v51 = LightHashCode & 7;
        if ((LightHashCode & 7) != 0)
          break;
      }
LABEL_170:
      if (v45 == ++v44)
        goto LABEL_178;
    }
    v52 = LightHashCode;
    v53 = LightHashCode & 0x400;
    if (v53)
    {
      if (BYTE11(v196))
      {
        if (v51 == 2)
        {
          objc_msgSend(*((id *)&v195 + 1), "appendFormat:", CFSTR(", depthcube<float> u_shadowTexture%d\n"), v44);
        }
        else if (v49 < 2)
        {
          objc_msgSend(*((id *)&v195 + 1), "appendFormat:", CFSTR(", depth2d<float> u_shadowTexture%d\n"), v44);
        }
        else
        {
          objc_msgSend(*((id *)&v195 + 1), "appendFormat:", CFSTR(", depth2d_array<float> u_shadowTexture%d\n"), v44);
        }
      }
      else
      {
        objc_msgSend((id)v195, "appendFormat:", CFSTR(", depth2d<float> u_shadowTexture%d\n"), v44);
        v49 = 1;
      }
    }
    C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)v183);
    if (v48)
    {
      if (BYTE11(v196))
        v54 = 184;
      else
        v54 = 176;
      -[__C3DProgramHashCode appendFormat:](*(__C3DProgramHashCode **)((char *)&v183 + v54), "appendFormat:", CFSTR(", texture2d<half> u_goboTexture%d\n"), v44);
      -[__C3DProgramHashCode appendFormat:](*(__C3DProgramHashCode **)((char *)&v183 + v54), "appendFormat:", CFSTR(", sampler u_goboTexture%dSampler\n"), v44);
    }
    if (v51 == 5)
    {
      v55 = CFSTR(", texture2d<half> u_iesTexture%d\n");
    }
    else if (v51 != 6
           || (v55 = CFSTR(", device packed_float2* u_areaPolygonPositions%d\n"), (unsigned __int16)v47 >> 13 != 4))
    {
LABEL_110:
      v56 = HIWORD(v52) & 0x1F;
      v57 = v51 - 1;
      if (v57)
        v58 = 1;
      else
        v58 = v48;
      if (v53)
        v58 = 1;
      BYTE8(v196) |= v58;
      BYTE9(v196) |= v53 >> 10;
      v59 = HIDWORD(v196);
      if (HIDWORD(v196) <= v56)
        v59 = HIWORD(v52) & 0x1F;
      HIDWORD(v196) = v59;
      if (C3DProgramHashCodeGetRenderMode((uint64_t)v183))
      {
        v60 = C3DProgramHashCodeGetMultiVertexOutputStreamGenerator((uint64_t)v183);
        if (v60 == 1)
        {
          if (BYTE11(v196))
            v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("USE_MULTIPLE_RENDERING * %d + in.sliceIndex"), v44);
          else
            v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("USE_MULTIPLE_RENDERING * %d + out.sliceIndex"), v44);
        }
        else if (v60 == 2)
        {
          v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("USE_MULTIPLE_RENDERING * %d + amplificationID"), v44);
        }
        else
        {
          v62 = scn_default_log();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.2(&buf, v200, v62);
          v61 = 0;
        }
      }
      else
      {
        v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v44);
      }
      v63 = v47 & 0x1000;
      switch(v57)
      {
        case 0:
          if (v48)
          {
            BYTE10(v196) |= v63 >> 12;
            v64 = v63 == 0;
            v65 = "true";
            if (v64)
              v65 = "false";
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_directional(scn_lights[%@], u_goboTexture%d, u_goboTexture%dSampler, %s);\n"),
              v61,
              v44,
              v44,
              v65,
              v155,
              v156);
            goto LABEL_169;
          }
          if (!v53)
          {
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_directional(scn_lights[%@]);\n"),
              v61,
              v150,
              v151,
              v152,
              v155,
              v156);
            goto LABEL_169;
          }
          if (v49 >= 2)
          {
            v69 = "true";
            if ((v47 & 0x1000000) != 0)
              v70 = "true";
            else
              v70 = "false";
            if (!v50)
              v69 = "false";
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d, %d, %s, u_shadowKernel, %d, %s);\n"),
              v61,
              v44,
              v49,
              v70,
              v56,
              v69);
            goto LABEL_169;
          }
          v45 = v178;
          if (v56 < 2)
          {
            v150 = v44;
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d);\n"),
              v61);
          }
          else
          {
            v150 = v44;
            v151 = v56;
            if ((v47 & 0x4000000) != 0)
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d, %d);\n"),
                v61);
            else
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d);\n"),
                v61);
          }
          LightsMask = v176;
          goto LABEL_170;
        case 1:
          if (v53 && BYTE8(v198))
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_omni(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d);\n"),
              v61,
              v44,
              v56,
              v152,
              v155,
              v156);
          else
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_omni(scn_lights[%@]);\n"),
              v61,
              v150,
              v151,
              v152,
              v155,
              v156);
          goto LABEL_169;
        case 2:
          v66 = !v48;
          if ((v47 & 0x1400) != 0x400)
            v66 = 1;
          if ((v66 & 1) != 0)
          {
            if (v48)
            {
              BYTE10(v196) |= v63 >> 12;
              v64 = v63 == 0;
              v68 = "true";
              if (v64)
                v68 = "false";
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_spot(scn_lights[%@], u_goboTexture%d, u_goboTexture%dSampler, %s);\n"),
                v61,
                v44,
                v44,
                v68,
                v155,
                v156);
            }
            else if (v53)
            {
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_spot(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d);\n"),
                v61,
                v44,
                v56,
                v152,
                v155,
                v156);
            }
            else
            {
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_spot(scn_lights[%@]);\n"),
                v61,
                v150,
                v151,
                v152,
                v155,
                v156);
            }
          }
          else
          {
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_spot(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d, u_goboTexture%d, u_goboTexture%dSampler);\n"),
              v61,
              v44,
              v56,
              v44,
              v44,
              v156);
          }
          goto LABEL_169;
        case 4:
          if (v53)
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_ies(scn_lights[%@], u_iesTexture%d, u_shadowTexture%d, u_shadowKernel, %d);\n"),
              v61,
              v44,
              v44,
              v56,
              v155,
              v156);
          else
            objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_ies(scn_lights[%@], u_iesTexture%d);\n"),
              v61,
              v44,
              v151,
              v152,
              v155,
              v156);
LABEL_169:
          LightsMask = v176;
          v45 = v178;
          break;
        case 5:
          LightsMask = v176;
          v45 = v178;
          switch((unsigned __int16)v47 >> 13)
          {
            case 0:
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_area_line(scn_lights[%@], u_areaLightBakedDataTexture);\n"),
                v61);
              break;
            case 1:
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_area_rectangle(scn_lights[%@], u_areaLightBakedDataTexture);\n"),
                v61);
              break;
            case 2:
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_area_ellipse(scn_lights[%@], u_areaLightBakedDataTexture);\n"),
                v61);
              break;
            case 3:
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_area_ellipsoid(scn_lights[%@], u_areaLightBakedDataTexture);\n"),
                v61);
              break;
            case 4:
              v150 = v44;
              objc_msgSend(*((id *)&v192 + 1), "appendFormat:", CFSTR("\t_lightingContribution.add_area_polygon(scn_lights[%@], u_areaLightBakedDataTexture, u_areaPolygonPositions%d);\n"),
                v61);
              break;
            default:
              goto LABEL_170;
          }
          break;
        default:
          v67 = scn_default_log();
          LightsMask = v176;
          v45 = v178;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
            -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.1(v216, v217, v67);
          break;
      }
      goto LABEL_170;
    }
    objc_msgSend(*((id *)&v195 + 1), "appendFormat:", v55, v44);
    goto LABEL_110;
  }
LABEL_178:
  objc_msgSend(v184, "setObject:forKeyedSubscript:", CFSTR("uchar"), CFSTR("C3DLightIndexType"));
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("C3D_USE_TEXTURE_FOR_LIGHT_INDICES"));
  v27 = (uint64_t)v180;
  v33 = v174;
  v29 = CommonProfileHashCode & 0xF;
  HasConstantAlpha = v157;
  v23 = CommonProfileHashCode;
  v37 = Conditioners;
  v24 = CommonProfileHashCode;
  if ((C3DProgramHashCodeGetReflectionProbesEnabled((uint64_t)v180) & 1) != 0)
  {
    if (C3DEngineContextHasFeatures((uint64_t)v170, 256))
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("C3D_SUPPORT_CUBE_ARRAY"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("C3D_USE_REFLECTION_PROBES"));
  }
  if (*((_QWORD *)&v193 + 1))
  {
    v71 = v184;
    Description = CFSTR("SCNLightingModelCustom");
  }
  else
  {
    Description = C3DLightingModelGetDescription(v169);
    v71 = v184;
  }
  objc_msgSend(v71, "setObject:forKeyedSubscript:", Description, CFSTR("LIGHTING_MODEL"));
  if (((C3DProgramHashCodeGetLocalLightingEnabled((uint64_t)v180) & 1) != 0
     || C3DProgramHashCodeGetReflectionProbesEnabled((uint64_t)v180))
    && C3DEngineContextIsClusteredShadingEnabled((uint64_t)v170))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_CLUSTERED_LIGHTING"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
  }
LABEL_189:
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_PBR"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_SHADOWONLY"));
    objc_msgSend((id)v185, "addObject:", CFSTR("C3D_USE_TEXTURE_FOR_LIGHT_INDICES"));
    objc_msgSend((id)v185, "addObject:", CFSTR("C3D_SUPPORT_CUBE_ARRAY"));
    objc_msgSend((id)v185, "addObject:", CFSTR("C3D_USE_REFLECTION_PROBES"));
    objc_msgSend((id)v185, "addObject:", CFSTR("LIGHTING_MODEL"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_CLUSTERED_LIGHTING"));
  }
  if (v29 == 4 && (v23 & 0x280) != 0)
    BYTE11(v196) = 1;
  if (C3DProgramHashCodeHasFog(v27))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_FOG"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
  }
  if ((v33 & ((v37 & 0x10) >> 4)) == 1)
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_SSAO"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
  }
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled(v27, 0x13u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled(v27, 0x14u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled(v27, 4u))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_FRESNEL"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_VIEW"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_NORMAL"));
  }
  if ((v33 & ((v23 & 0x40) != 0)) == 1)
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("AVOID_OVERLIGHTING"));
  if (AmbientLightingEnabled)
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_AMBIENT_LIGHTING"));
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_FOG"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_SSAO"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_FRESNEL"));
    objc_msgSend((id)v185, "addObject:", CFSTR("AVOID_OVERLIGHTING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_AMBIENT_LIGHTING"));
  }
  if (v33)
  {
    ProbesLightingOrder = C3DProgramHashCodeGetProbesLightingOrder(v27);
    if ((_DWORD)ProbesLightingOrder)
    {
      v74 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", ProbesLightingOrder);
      objc_msgSend(v184, "setObject:forKeyedSubscript:", v74, CFSTR("USE_PROBES_LIGHTING"));
    }
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_LIGHTING"));
    if (BYTE11(v196))
    {
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_PER_PIXEL_LIGHTING"));
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_NORMAL"));
      if (((BYTE8(v196) == 0) & ~v164) == 0)
        objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
      if (BYTE10(v196))
      {
        v75 = v184;
        v76 = &unk_1EA5FF180;
        v77 = CFSTR("USE_MODULATE");
LABEL_222:
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v76, v77);
      }
    }
    else
    {
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_PER_VERTEX_LIGHTING"));
      if (!objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_NORMAL")))
        objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF168, CFSTR("USE_NORMAL"));
      if (!objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_VIEW")))
        objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF168, CFSTR("USE_VIEW"));
      if (!objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_POSITION")))
      {
        v75 = v184;
        v76 = &unk_1EA5FF168;
        v77 = CFSTR("USE_POSITION");
        goto LABEL_222;
      }
    }
  }
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_PROBES_LIGHTING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_LIGHTING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_PER_PIXEL_LIGHTING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_PER_VERTEX_LIGHTING"));
  }
  if (C3DProgramHashCodeHasNormals(v27))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("HAS_NORMAL"));
  if ((NodeHashCode & 2) != 0)
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("HAS_VERTEX_COLOR"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_VERTEX_COLOR"));
  }
  if (C3DProgramHashCodeUseDynamicBatching(v27))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_INSTANCING"));
  if (C3DProgramHashCodeUsePointRendering(v27))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_POINT_RENDERING"));
    if ((v37 & 1) != 0)
      goto LABEL_233;
  }
  else if ((v37 & 1) != 0)
  {
LABEL_233:
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("DISABLE_LINEAR_RENDERING"));
    if ((v37 & 0x40) != 0)
      goto LABEL_234;
LABEL_238:
    if ((v37 & 8) == 0)
      goto LABEL_240;
    goto LABEL_239;
  }
  if ((v37 & 0x40) == 0)
    goto LABEL_238;
LABEL_234:
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("DISABLE_SPECULAR"));
  if ((v37 & 8) != 0)
LABEL_239:
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_MOTIONBLUR"));
LABEL_240:
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("HAS_NORMAL"));
    objc_msgSend((id)v185, "addObject:", CFSTR("HAS_VERTEX_COLOR"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_VERTEX_COLOR"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_INSTANCING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_POINT_RENDERING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("DISABLE_LINEAR_RENDERING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("DISABLE_SPECULAR"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_SKINNING"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_MOTIONBLUR"));
  }
  if ((v37 & 0x80) != 0)
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_COLOR1_OUTPUT"));
    if ((v37 & 2) == 0)
    {
LABEL_244:
      if ((v37 & 4) == 0)
        goto LABEL_245;
      goto LABEL_254;
    }
  }
  else if ((v37 & 2) == 0)
  {
    goto LABEL_244;
  }
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_NORMAL"));
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_NORMALS_OUTPUT"));
  if ((v37 & 4) == 0)
  {
LABEL_245:
    if ((v37 & 0x100) == 0)
      goto LABEL_246;
    goto LABEL_255;
  }
LABEL_254:
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_REFLECTANCE_ROUGHNESS_OUTPUT"));
  if ((v37 & 0x100) == 0)
  {
LABEL_246:
    if ((v37 & 0x20) == 0)
      goto LABEL_248;
    goto LABEL_247;
  }
LABEL_255:
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_RADIANCE_OUTPUT"));
  if ((v37 & 0x20) != 0)
  {
LABEL_247:
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_OUTLINE"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_MODELTRANSFORM"));
  }
LABEL_248:
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_COLOR1_OUTPUT"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_NORMALS_OUTPUT"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_REFLECTANCE_ROUGHNESS_OUTPUT"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_RADIANCE_OUTPUT"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_OUTLINE"));
  }
  if (C3DProgramHashCodeGetEffectPropertyHasTexture(v27, 8u))
  {
    __AddProperty((uint64_t)&v183, 8u, 1, 1);
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_AMBIENT_AS_AMBIENTOCCLUSION"));
  }
  else
  {
    if (v23 >= 0)
      v78 = AmbientLightingEnabled;
    else
      v78 = 0;
    __AddProperty((uint64_t)&v183, 1u, 1, v78);
  }
  __AddProperty((uint64_t)&v183, 2u, 2, 1);
  __AddProperty((uint64_t)&v183, 3u, 3, v164 | v160);
  __AddProperty((uint64_t)&v183, 9u, 9, 1);
  __AddProperty((uint64_t)&v183, 0, 0, 1);
  __AddProperty((uint64_t)&v183, 6u, 6, 1);
  __AddProperty((uint64_t)&v183, 7u, 7, HasTexture);
  if (BYTE8(v185))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_TANGENT"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_BITANGENT"));
  }
  __AddProperty((uint64_t)&v183, 0xAu, 10, v29 == 5);
  __AddProperty((uint64_t)&v183, 0xBu, 11, v29 == 5);
  if (v29 == 5)
    v79 = C3DProgramHashCodeGetEffectPropertyIsEnabled(v27, 0xCu);
  else
    v79 = 0;
  __AddProperty((uint64_t)&v183, 0xCu, 12, v79);
  __AddProperty((uint64_t)&v183, 0xDu, 13, v79);
  __AddProperty((uint64_t)&v183, 0xEu, 14, v79);
  if (BYTE8(v185))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_TANGENT"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_BITANGENT"));
  }
  __AddProperty((uint64_t)&v183, 4u, 4, 1);
  if (BYTE8(v185))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_VIEW"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_NORMAL"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
  }
  v80 = v161 & (IsOpaque ^ 1);
  v81 = (v24 >> 11) & 0xF;
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v180, 2u))
  {
    v82 = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)v180, 2u);
    if ((v82 & 1) != 0)
    {
      v84 = ((unint64_t)v82 >> 5) & 1;
      v83 = v84;
    }
    else
    {
      v83 = 0;
      LOBYTE(v84) = (v82 & 8) == 0;
    }
  }
  else
  {
    LOBYTE(v84) = 0;
    v83 = 0;
  }
  if (v81 == 1)
    v85 = v163;
  else
    v85 = 0;
  if (((v85 | v80) & 1) != 0)
    v86 = v85 ^ 1;
  else
    v86 = v83 | HasConstantAlpha ^ 1;
  __AddProperty((uint64_t)&v183, 5u, 5, v86);
  if (v81 == 1 && objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_TRANSPARENT")))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_TRANSPARENCY_RGBZERO"));
  if (v29 == 5)
  {
    v87 = C3DPBROpacityIsEnabled();
    if (v81 != 1 && v87)
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_PBR_TRANSPARENCY"));
    if (C3DWasLinkedBeforeMajorOSYear2023())
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_PBR_LAMBERTIAN_REFLECTION"));
  }
  if ((v23 & 0x8000) == 0)
  {
    if ((v23 & 0x20) != 0)
      goto LABEL_295;
LABEL_294:
    if (v81 != 3)
      goto LABEL_296;
    goto LABEL_295;
  }
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("LOCK_AMBIENT_WITH_DIFFUSE"));
  if ((v23 & 0x20) == 0)
    goto LABEL_294;
LABEL_295:
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_DOUBLE_SIDED"));
LABEL_296:
  if ((v163 & 1) == 0)
  {
    if (((v80 | v83) & 1) != 0 || (v158 & 2) != 0)
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_TRANSPARENCY"));
    if ((HasConstantAlpha & 1) == 0)
      objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_NODE_OPACITY"));
  }
  if ((EffectPropertyHashCode & 0x400) != 0)
    v88 = 0;
  else
    v88 = v84;
  if ((v88 & 1) == 0)
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("DIFFUSE_PREMULTIPLIED"));
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_TRANSPARENCY_RGBZERO"));
    objc_msgSend((id)v185, "addObject:", CFSTR("LOCK_AMBIENT_WITH_DIFFUSE"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_DOUBLE_SIDED"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_TRANSPARENCY"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_PBR_TRANSPARENCY"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_PBR_LAMBERTIAN_REFLECTION"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_NODE_OPACITY"));
    objc_msgSend((id)v185, "addObject:", CFSTR("DIFFUSE_PREMULTIPLIED"));
  }
  CustomSlotCount = C3DProgramHashCodeGetCustomSlotCount((uint64_t)v180);
  if (CustomSlotCount >= 1)
  {
    v90 = CustomSlotCount;
    for (i = 0; i != v90; ++i)
    {
      CustomSlotSortedName = C3DProgramHashCodeGetCustomSlotSortedName((uint64_t)v180, i);
      CustomSlotUVSet = C3DProgramHashCodeGetCustomSlotUVSet((uint64_t)v180, i);
      if (CustomSlotUVSet != -1)
      {
        v94 = CustomSlotUVSet;
        objc_msgSend((id)v189, "appendFormat:", CFSTR("    float2 %@Texcoord;\n"), CustomSlotSortedName);
        objc_msgSend(*((id *)&v191 + 1), "appendFormat:", CFSTR("    _surface.%@Texcoord = in.texcoord%d;\n"),
          CustomSlotSortedName,
          v94);
      }
    }
  }
  if ((v80 | v83) == 1)
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_DISCARD"));
  v95 = 0x1E0CB3000;
  if ((_QWORD)v185)
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_DISCARD"));
  UVSetsCount = C3DProgramHashCodeGetUVSetsCount((uint64_t)v183);
  if (UVSetsCount)
  {
    if (UVSetsCount < 1)
    {
      v98 = 0;
    }
    else
    {
      v97 = 0;
      v98 = 0;
      if (UVSetsCount >= 8)
        v99 = 8;
      else
        v99 = UVSetsCount;
      do
      {
        UVSetInfo = C3DProgramHashCodeGetUVSetInfo((uint64_t)v183, v97);
        objc_msgSend(*((id *)&v189 + 1), "appendString:", g_varyingTexCoordDecl[v97]);
        if (HIBYTE(UVSetInfo) == 255)
        {
          v101 = UVSetInfo;
          objc_msgSend(*((id *)&v190 + 1), "appendFormat:", CFSTR("out.texcoord%d = _geometry.texcoords[%d].xy;\n"),
            v97,
            UVSetInfo,
            v151);
        }
        else
        {
          v102 = v192;
          LODWORD(v192) = v192 + 1;
          v101 = UVSetInfo;
          objc_msgSend(*((id *)&v190 + 1), "appendFormat:", CFSTR("out.texcoord%d = (scn_commonprofile.textureTransforms[%d] * float4(_geometry.texcoords[%d], 0., 1.)).xy;\n"),
            v97,
            v102,
            UVSetInfo);
        }
        objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, g_NeedTexCoordDefines[v101]);
        if (v98 <= (v101 + 1))
          v98 = (v101 + 1);
        ++v97;
      }
      while (v99 != v97);
    }
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_TEXCOORD"));
    v95 = 0x1E0CB3000uLL;
  }
  else
  {
    v98 = 0;
  }
  if ((_DWORD)v192)
  {
    v103 = objc_msgSend(*(id *)(v95 + 2024), "numberWithUnsignedInt:");
    objc_msgSend(v184, "setObject:forKeyedSubscript:", v103, CFSTR("TEXTURE_TRANSFORM_COUNT"));
  }
  v104 = objc_msgSend(*(id *)(v95 + 2024), "numberWithLong:", v98);
  objc_msgSend(v184, "setObject:forKeyedSubscript:", v104, CFSTR("kSCNTexcoordCount"));
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_TEXCOORD"));
    objc_msgSend((id)v185, "addObject:", CFSTR("TEXTURE_TRANSFORM_COUNT"));
    for (j = 0; j != 8; ++j)
      objc_msgSend((id)v185, "addObject:", g_NeedTexCoordDefines[j]);
  }
  v106 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)v180, 0xFu);
  __AddProperty((uint64_t)&v183, 0xFu, 15, v106);
  if (v106)
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_NORMAL"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_TANGENT"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_BITANGENT"));
  }
  if (objc_msgSend((id)objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_VIEW")), "intValue") == 2)
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_NORMAL"))
    && !objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("HAS_NORMAL")))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF180, CFSTR("USE_POSITION"));
  }
  v107 = CFSTR("USE_MODELVIEWTRANSFORM");
  if (!objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_POSITION"))
    && !objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_INSTANCING")))
  {
    v107 = CFSTR("USE_MODELVIEWPROJECTIONTRANSFORM");
  }
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, v107);
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_NORMAL"))
    || objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_TANGENT"))
    || objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_BITANGENT")))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_MODELVIEWTRANSFORM"));
  }
  if ((NodeHashCode & 0x8000000) != 0)
  {
    objc_msgSend((id)v196, "appendString:", CFSTR("float2 bezierCurveUV [[ sample_perspective ]];\n"));
    objc_msgSend(*((id *)&v195 + 1), "appendString:", CFSTR(", device void const *scn_bezier_curve_data\n"));
    objc_msgSend(*((id *)&v195 + 1), "appendString:", CFSTR(", device packed_float3 const *scn_bezier_curve_controlPoints\n"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("NEED_IN_TEXCOORD0"));
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("IS_BEZIER_CURVE"));
    v108 = v171;
    if (v171 <= 0x20003)
      v108 = 131075;
    LODWORD(v171) = v108;
    v179 = 1;
  }
  else
  {
    v179 = 0;
  }
  if ((_QWORD)v185)
    objc_msgSend((id)v185, "addObject:", CFSTR("IS_BEZIER_CURVE"));
  if (objc_msgSend((id)v186, "length"))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_SHADER_MODIFIERS"));
  if (objc_msgSend((id)v189, "length"))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_SURFACE_EXTRA_DECL"));
  if (objc_msgSend((id)v196, "length"))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_EXTRA_VARYINGS"));
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_SHADER_MODIFIERS"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_SURFACE_EXTRA_DECL"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_EXTRA_VARYINGS"));
  }
  v109 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("scn_metal"));
  v110 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("scn_util.h"));
  if (v169 == 5 || self->_useFunctionConstants)
    v111 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(CFSTR("C3D-PBR.metal"));
  else
    v111 = &stru_1EA5A6480;
  __configureOpenSubdivSupport((uint64_t)&v183, v172, (uint64_t)v180);
  if (objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("HAS_NORMAL"))
    || objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("USE_OPENSUBDIV")))
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("HAS_OR_GENERATES_NORMAL"));
  }
  v113 = &stru_1EA5A6480;
  if (v172)
  {
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_TESSELLATION"));
    v113 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(CFSTR("scn_tessellation.h"));
    v114 = (NodeHashCode >> 3) & 3;
    if (v114 == 1)
    {
      v115 = CFSTR("TESSELLATION_SMOOTHING_MODE_PN_TRIANGLE");
    }
    else
    {
      if (v114 != 2)
        goto LABEL_380;
      v115 = CFSTR("TESSELLATION_SMOOTHING_MODE_PHONG");
    }
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, v115);
  }
LABEL_380:
  if ((_QWORD)v185)
  {
    C3DSubdivisionOsdGPUGetAllPossibleMacros((void *)v185, v112);
    objc_msgSend((id)v185, "addObject:", CFSTR("HAS_OR_GENERATES_NORMAL"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_TESSELLATION"));
  }
  v215[0] = v189;
  v215[1] = v194;
  if (*((_QWORD *)&v188 + 1))
    v116 = (const __CFString *)*((_QWORD *)&v188 + 1);
  else
    v116 = &stru_1EA5A6480;
  v215[2] = v116;
  v117 = -[NSString scn_stringByReplacingCharactersInRanges:withStrings:](self->_originalLightingSourceCode, "scn_stringByReplacingCharactersInRanges:withStrings:", self->_lightingInjectionPointRanges, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v215, 3));
  v201[0] = v109;
  v201[1] = v110;
  v201[2] = v111;
  v201[3] = v113;
  v201[4] = *((_QWORD *)&v189 + 1);
  v201[5] = v196;
  v201[6] = v186;
  v201[7] = v117;
  v202 = v197;
  v203 = v198;
  v204 = v195;
  if ((_QWORD)v187)
    v118 = (const __CFString *)v187;
  else
    v118 = &stru_1EA5A6480;
  v205 = v191;
  v206 = v118;
  if (BYTE11(v196))
    v119 = v174 ^ 1;
  else
    v119 = 1;
  v120 = (const __CFString *)*((_QWORD *)&v192 + 1);
  if ((v174 & (BYTE11(v196) == 0)) != 0)
    v121 = (const __CFString *)*((_QWORD *)&v192 + 1);
  else
    v121 = &stru_1EA5A6480;
  v207 = v121;
  v208 = *((_QWORD *)&v190 + 1);
  v209 = *((_QWORD *)&v195 + 1);
  v210 = *((_QWORD *)&v191 + 1);
  v122 = (const __CFString *)*((_QWORD *)&v187 + 1);
  if (!*((_QWORD *)&v187 + 1))
    v122 = &stru_1EA5A6480;
  v211 = v122;
  v212 = *((_QWORD *)&v194 + 1);
  if (v119)
    v120 = &stru_1EA5A6480;
  if ((_QWORD)v188)
    v123 = (const __CFString *)v188;
  else
    v123 = &stru_1EA5A6480;
  v124 = self;
  v213 = v120;
  v214 = v123;
  v125 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 22);
  v126 = -[NSString scn_stringByReplacingCharactersInRanges:withStrings:](self->_originalSourceCode, "scn_stringByReplacingCharactersInRanges:withStrings:", self->_injectionPointRanges, v125);
  v127 = -[SCNCommonProfileProgramGeneratorMetal splitInputOutputStructsIfNeededForSourceCode:generatedFromReplacementStrings:perPixelLighting:clipDistanceCount:](self, "splitInputOutputStructsIfNeededForSourceCode:generatedFromReplacementStrings:perPixelLighting:clipDistanceCount:", v126, v125, BYTE11(v196), v165);
  if (C3DShouldCollectGeneratedShaders())
  {
    v177 = v127;
    v128 = (void *)objc_msgSend(v125, "mutableCopy");
    v129 = -[NSArray count](self->_injectionPointRanges, "count");
    v130 = (uint64_t)v180;
    if (v129)
    {
      v131 = v129;
      v132 = 0;
      while (1)
      {
        v133 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v124->_injectionPointRanges, "objectAtIndexedSubscript:", v132), "rangeValue");
        v135 = -[NSString substringWithRange:](v124->_originalSourceCode, "substringWithRange:", v133, v134);
        if (!-[__CFString hasPrefix:](v135, "hasPrefix:", CFSTR("#import")))
          break;
        if ((-[__CFString containsString:](v135, "containsString:", CFSTR("C3D-Lighting.metal")) & 1) == 0)
        {
          v136 = objc_msgSend(v125, "objectAtIndexedSubscript:", v132);
          v137 = (void *)MEMORY[0x1E0CB3940];
          v153 = v135;
          goto LABEL_410;
        }
LABEL_415:
        if (v131 == ++v132)
          goto LABEL_416;
      }
      if (objc_msgSend((id)v198, "length")
        && -[__CFString containsString:](v135, "containsString:", CFSTR("__OpenSubdivDeclShared__")))
      {
        v136 = objc_msgSend(v125, "objectAtIndexedSubscript:", v132);
        v137 = (void *)MEMORY[0x1E0CB3940];
        v153 = CFSTR("#generate \"__OpenSubdivDeclShared__.metal\");
LABEL_410:
        v138 = objc_msgSend(v137, "stringWithFormat:", CFSTR("%@%@\n%@%@\n%@"), CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v136, CFSTR("#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v153, CFSTR("#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"));
      }
      else
      {
        if (!objc_msgSend(*((id *)&v197 + 1), "length")
          || !-[__CFString containsString:](v135, "containsString:", CFSTR("__OpenSubdivDeclPerPatchType__")))
        {
          goto LABEL_415;
        }
        v139 = objc_msgSend(v125, "objectAtIndexedSubscript:", v132);
        v140 = (void *)MEMORY[0x1E0CB3940];
        v154 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#generate \"__OpenSubdivDeclShared__patchType%d.metal\"), C3DProgramHashCodeOpenSubdivPatchType((uint64_t)v180));
        v141 = v140;
        v124 = self;
        v138 = objc_msgSend(v141, "stringWithFormat:", CFSTR("%@%@\n%@%@\n%@"), CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v139, CFSTR("#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v154, CFSTR("#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"));
      }
      objc_msgSend(v128, "setObject:atIndexedSubscript:", v138, v132);
      goto LABEL_415;
    }
LABEL_416:
    v142 = -[NSString scn_stringByReplacingCharactersInRanges:withStrings:](v124->_originalSourceCode, "scn_stringByReplacingCharactersInRanges:withStrings:", v124->_injectionPointRanges, v128);
    v143 = -[SCNCommonProfileProgramGeneratorMetal splitInputOutputStructsIfNeededForSourceCode:generatedFromReplacementStrings:perPixelLighting:clipDistanceCount:](v124, "splitInputOutputStructsIfNeededForSourceCode:generatedFromReplacementStrings:perPixelLighting:clipDistanceCount:", v142, v128, BYTE11(v196), v165);

    v127 = v177;
  }
  else
  {
    v143 = 0;
    v130 = (uint64_t)v180;
  }
  if (objc_msgSend((id)v195, "length"))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_VERTEX_EXTRA_ARGUMENTS"));
  if (objc_msgSend(*((id *)&v195 + 1), "length"))
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_FRAGMENT_EXTRA_ARGUMENTS"));
  objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF168, CFSTR("METAL"));
  if ((C3DEngineContextGetCoordinatesSystemOptions((uint64_t)v170) & 8) != 0)
    objc_msgSend(v184, "setObject:forKeyedSubscript:", &unk_1EA5FF168, CFSTR("USE_REVERSE_Z"));
  RenderingOptionForKey = C3DEngineContextGetRenderingOptionForKey((uint64_t)v170, CFSTR("debugRendering"));
  if (RenderingOptionForKey)
  {
    valuePtr = 0;
    CFNumberGetValue(RenderingOptionForKey, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr)
    {
      v145 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      objc_msgSend(v184, "setObject:forKeyedSubscript:", v145, CFSTR("DEBUG_PIXEL"));
    }
  }
  if ((_QWORD)v185)
  {
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_VERTEX_EXTRA_ARGUMENTS"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_FRAGMENT_EXTRA_ARGUMENTS"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_ARGUMENT_BUFFERS"));
    objc_msgSend((id)v185, "addObject:", CFSTR("USE_REVERSE_Z"));
    objc_msgSend((id)v185, "addObject:", CFSTR("DEBUG_PIXEL"));
  }
  v146 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  objc_msgSend(v146, "appendString:", CFSTR("////////////////////////////////////////////////\n"));
  objc_msgSend(v146, "appendFormat:", CFSTR("// CommonProfile Shader v%d\n"), 2);
  v147 = (const void *)objc_msgSend(v146, "stringByAppendingString:", v127);
  if (C3DShouldCollectGeneratedShaders())
    v143 = (id)objc_msgSend(v146, "stringByAppendingString:", v143);
  v148 = (__C3DFXProgram *)C3DFXMetalProgramCreateFromSource(CFSTR("commonprofile_vert"), CFSTR("commonprofile_frag"), v179, v147, v143, v184, (const void *)v185, v171, 0);
  HashCode = (const void *)C3DProgramHashCodeGetHashCode(v130);
  C3DFXMetalProgramUpdateHashWithCommonProfileHashCode((uint64_t)v148, HashCode);
  return v148;
}

- (id)splitInputOutputStructsIfNeededForSourceCode:(id)a3 generatedFromReplacementStrings:(id)a4 perPixelLighting:(BOOL)a5 clipDistanceCount:(unint64_t)a6
{
  _BOOL4 v8;
  NSUInteger v9;
  NSArray *injectionPointRanges;
  uint64_t v11;
  void *v12;
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
  void *v26;
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
  uint64_t v39;
  _QWORD v40[8];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  _NSRange commonProfileIORange;
  _QWORD v46[6];
  _QWORD v47[6];
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v8 = a5;
    v9 = self->_commonProfileIORange.length + self->_commonProfileIORange.location;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3010000000;
    v44 = &unk_1DD0EA3D6;
    commonProfileIORange = self->_commonProfileIORange;
    injectionPointRanges = self->_injectionPointRanges;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __153__SCNCommonProfileProgramGeneratorMetal_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount___block_invoke;
    v40[3] = &unk_1EA5A3CC0;
    v40[4] = self;
    v40[5] = a4;
    v40[6] = &v41;
    v40[7] = v9;
    -[NSArray enumerateObjectsUsingBlock:](injectionPointRanges, "enumerateObjectsUsingBlock:", v40);
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("    float clipDistance [[clip_distance]] [%d];\n} commonprofile_io_vert;\n\n"),
            a6);
    v12 = (void *)objc_msgSend(a3, "substringWithRange:", v42[4], v42[5]);
    v13 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v12, "length") - 19, 19, v11);
    v14 = v42[5] + v42[4];
    v15 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("vertex commonprofile_io"), 0, v14, objc_msgSend(a3, "length") - v14);
    v17 = v16;
    v19 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("commonprofile_io out;"),
            0,
            v15 + v17,
            objc_msgSend(a3, "length") - (v15 + v17));
    v20 = v18;
    if (v8)
    {
      v21 = v18;
      v22 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("commonprofile_io out;"),
              0,
              v14,
              objc_msgSend(a3, "length") - v14);
      v24 = v23;
      v49[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v42[4], 0);
      v49[1] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v22, v24);
      v49[2] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v15, v17);
      v49[3] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v19, v21);
      v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
      v48[0] = v13;
      v48[1] = CFSTR("commonprofile_io_vert out;");
      v48[2] = CFSTR("vertex commonprofile_io_vert");
      v48[3] = CFSTR("commonprofile_io_vert out;");
      v26 = (void *)objc_msgSend(a3, "scn_stringByReplacingCharactersInRanges:withStrings:", v25, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4));
    }
    else
    {
      v27 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("commonprofile_io out;"),
              0,
              v14,
              objc_msgSend(a3, "length") - v14);
      v29 = v28;
      v38 = v19;
      v39 = v20;
      v30 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("commonprofile_io in;"),
              0,
              v14,
              objc_msgSend(a3, "length") - v14);
      v32 = v31;
      v33 = objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("commonprofile_io io"), 0, v14, objc_msgSend(a3, "length") - v14);
      v35 = v34;
      v47[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v42[4], 0);
      v47[1] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v27, v29);
      v47[2] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v30, v32);
      v47[3] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v33, v35);
      v47[4] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v15, v17);
      v47[5] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v38, v39);
      v36 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 6);
      v46[0] = v13;
      v46[1] = CFSTR("commonprofile_io_vert out;");
      v46[2] = CFSTR("commonprofile_io_vert in;");
      v46[3] = CFSTR("commonprofile_io_vert io");
      v46[4] = CFSTR("vertex commonprofile_io_vert");
      v46[5] = CFSTR("commonprofile_io_vert out;");
      v26 = (void *)objc_msgSend(a3, "scn_stringByReplacingCharactersInRanges:withStrings:", v36, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 6));
    }
    a3 = v26;
    _Block_object_dispose(&v41, 8);
  }
  return a3;
}

- (id)initAllowingHotReload:(BOOL)a3
{
  SCNCommonProfileProgramGeneratorMetal *v4;
  SCNCommonProfileProgramGeneratorMetal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNCommonProfileProgramGeneratorMetal;
  v4 = -[SCNCommonProfileProgramGenerator init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_allowHotReload = a3;
    v4->_useFunctionConstants = C3DStandardShadersUseFunctionConstants();
    -[SCNCommonProfileProgramGeneratorMetal _loadSourceCode](v5, "_loadSourceCode");
  }
  return v5;
}

- (void)_loadSourceCode
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "_originalLightingSourceCode";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (int)profile
{
  return 0;
}

- (void)emptyShaderCache
{
  objc_super v3;

  -[SCNCommonProfileProgramGeneratorMetal _loadSourceCode](self, "_loadSourceCode");
  v3.receiver = self;
  v3.super_class = (Class)SCNCommonProfileProgramGeneratorMetal;
  -[SCNCommonProfileProgramGenerator emptyShaderCache](&v3, sel_emptyShaderCache);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNCommonProfileProgramGeneratorMetal;
  -[SCNCommonProfileProgramGenerator dealloc](&v3, sel_dealloc);
}

- (__C3DFXProgram)_newProgramWithHashCodeWithFunctionConstants:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  uint64_t ShaderModifiers;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  char NodeHashCode;
  NSObject *v23;
  const void *ConstantsValues;
  __CFString **v25;
  __C3DFXProgram *v26;
  const void *HashCode;
  __C3DProgramHashCode *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int64x2_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _QWORD v45[11];
  int8x16_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = a3;
  ShaderModifiers = C3DProgramHashCodeGetShaderModifiers((uint64_t)a3, 0);
  v8 = 0;
  if (ShaderModifiers | C3DProgramHashCodeGetShaderModifiers((uint64_t)a3, 1))
  {
    *(_QWORD *)&v30 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    *((_QWORD *)&v31 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    *(_QWORD *)&v32 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    *((_QWORD *)&v40 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    *(_QWORD *)&v41 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    *((_QWORD *)&v41 + 1) = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    __InjectAllModifiersIfNeeded((uint64_t)&v29);
    v9 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("scn_metal"));
    v10 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("scn_util.h"));
    v11 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("scn_standard_lighting.h"));
    v12 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("scn_standard_constants.h"));
    v13 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("C3D-PBR.metal"));
    v14 = C3DGetTextResourceWithNameAllowingHotReload(CFSTR("C3D-Lighting.metal"));
    v45[0] = v9;
    v45[1] = v10;
    v45[2] = v11;
    v45[3] = v12;
    v45[4] = v13;
    v45[5] = v14;
    v15 = (const __CFString *)*((_QWORD *)&v41 + 1);
    if (!*((_QWORD *)&v41 + 1))
      v15 = &stru_1EA5A6480;
    v16 = (const __CFString *)*((_QWORD *)&v31 + 1);
    v17 = (const __CFString *)*((_QWORD *)&v32 + 1);
    if (!*((_QWORD *)&v31 + 1))
      v16 = &stru_1EA5A6480;
    v45[6] = v15;
    v45[7] = v16;
    v18 = (const __CFString *)*((_QWORD *)&v40 + 1);
    if (!*((_QWORD *)&v40 + 1))
      v18 = &stru_1EA5A6480;
    if (!*((_QWORD *)&v32 + 1))
      v17 = &stru_1EA5A6480;
    v45[8] = v18;
    v45[9] = v17;
    if ((_QWORD)v41)
      v19 = (const __CFString *)v41;
    else
      v19 = &stru_1EA5A6480;
    v45[10] = v19;
    v46 = vbslq_s8((int8x16_t)vceqzq_s64(v33), (int8x16_t)vdupq_n_s64((unint64_t)&stru_1EA5A6480), (int8x16_t)v33);
    v20 = -[NSString scn_stringByReplacingCharactersInRanges:withStrings:](self->_originalSourceCode, "scn_stringByReplacingCharactersInRanges:withStrings:", self->_injectionPointRanges, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 13));
    if (objc_msgSend(*((id *)&v40 + 1), "length"))
      objc_msgSend((id)v30, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_VERTEX_EXTRA_ARGUMENTS"));
    if (objc_msgSend((id)v41, "length"))
      objc_msgSend((id)v30, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_FRAGMENT_EXTRA_ARGUMENTS"));
    if (objc_msgSend(*((id *)&v31 + 1), "length"))
      objc_msgSend((id)v30, "setObject:forKeyedSubscript:", &stru_1EA5A6480, CFSTR("USE_SHADER_MODIFIERS"));
    if (*((_QWORD *)&v30 + 1))
    {
      objc_msgSend(*((id *)&v30 + 1), "addObject:", CFSTR("USE_VERTEX_EXTRA_ARGUMENTS"));
      objc_msgSend(*((id *)&v30 + 1), "addObject:", CFSTR("USE_FRAGMENT_EXTRA_ARGUMENTS"));
      objc_msgSend(*((id *)&v30 + 1), "addObject:", CFSTR("USE_SHADER_MODIFIERS"));
    }
    objc_msgSend((id)v30, "setObject:forKeyedSubscript:", &unk_1EA5FF168, CFSTR("METAL"));
    v21 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    objc_msgSend(v21, "appendString:", CFSTR("////////////////////////////////////////////////\n"));
    objc_msgSend(v21, "appendFormat:", CFSTR("// CommonProfile Shader v%d\n"), 2);
    v8 = (const void *)objc_msgSend(v21, "stringByAppendingString:", v20);
  }
  NodeHashCode = C3DProgramHashCodeGetNodeHashCode((uint64_t)a3);
  if ((NodeHashCode & 0x20) != 0)
  {
    v23 = scn_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCodeWithFunctionConstants:engineContext:introspectionDataPtr:].cold.1();
  }
  ConstantsValues = (const void *)C3DProgramHashCodeGetConstantsValues((uint64_t)a3);
  v25 = &kStandardPostTessellationVertexEntryPoint;
  if ((NodeHashCode & 4) == 0)
    v25 = kStandardVertexEntryPoint;
  v26 = (__C3DFXProgram *)C3DFXMetalProgramCreateFromSourceWithConstants(*v25, CFSTR("standard_frag"), 0, v8, (const void *)v30, *((const void **)&v30 + 1), ConstantsValues, 0);
  HashCode = (const void *)C3DProgramHashCodeGetHashCode((uint64_t)a3);
  C3DFXMetalProgramUpdateHashWithCommonProfileHashCode((uint64_t)v26, HashCode);
  return v26;
}

unint64_t __153__SCNCommonProfileProgramGeneratorMetal_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  result = objc_msgSend(a2, "rangeValue");
  v7 = v6;
  if (result >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    if (result >= *(_QWORD *)(a1 + 56))
      return result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3), "length");
    v8 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  else
  {
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3), "length");
    v8 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  }
  *v8 += result - v7;
  return result;
}

- (void)collectShaderForProgram:(__C3DFXMetalProgram *)a3 hashCode:(id)a4 newVertexFunctionName:(id)a5 newFragmentFunctionName:(id)a6 sourceCodeBlock:(id)a7 additionalFileBlock:(id)a8
{
  void *SourceCodeForShaderCollection;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *PreprocessorAllPossibleMacros;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  uint64_t v52;
  __C3DFXMetalProgram *cf;
  void *v56;
  uint64_t v58;
  uint64_t v59;
  void *PreprocessorsMacros;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  PreprocessorsMacros = (void *)C3DFXMetalProgramGetPreprocessorsMacros(a3);
  cf = a3;
  SourceCodeForShaderCollection = (void *)C3DFXMetalProgramGetSourceCodeForShaderCollection(a3);
  v12 = objc_msgSend(SourceCodeForShaderCollection, "length");
  v13 = (void *)objc_msgSend(SourceCodeForShaderCollection, "mutableCopy");
  objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", CFSTR("commonprofile_vert"), a5, 0, 0, v12);
  objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", CFSTR("commonprofile_frag"), a6, 0, 0, v12);
  v14 = objc_msgSend(v13, "length");
  v15 = objc_msgSend(v13, "rangeOfString:options:range:", CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, 0, v14);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v15;
    v56 = v13;
    do
    {
      v18 = v17 + v16;
      v19 = v13;
      v20 = objc_msgSend(v13, "rangeOfString:options:range:", CFSTR("#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, v17 + v16, v14 - (v17 + v16));
      v22 = v20 + v21;
      v23 = objc_msgSend(v19, "rangeOfString:options:range:", CFSTR("#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, v20 + v21, v14 - (v20 + v21));
      v58 = v24;
      v59 = v23;
      v25 = v23 - v22;
      v26 = (void *)objc_msgSend(v19, "substringWithRange:", v22, v23 - v22);
      if (objc_msgSend(v26, "hasPrefix:", CFSTR("#import")))
      {
        v27 = (void *)objc_msgSend(v26, "substringFromIndex:", objc_msgSend(v26, "rangeOfString:", CFSTR("\")) + 1);
        v28 = (void *)objc_msgSend(v27, "substringToIndex:", objc_msgSend(v27, "rangeOfString:", CFSTR("\")));
        v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_import/%@"), v28);
        v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#import \"%@\"), v29);
        v31 = C3DGetTextResourceWithNameAllowingHotReload(v28);
        (*((void (**)(id, const void *, uint64_t))a8 + 2))(a8, v31, v29);
        v13 = v56;
      }
      else
      {
        if (!objc_msgSend(v26, "hasPrefix:", CFSTR("#generate")))
          -[SCNCommonProfileProgramGeneratorMetal collectShaderForProgram:hashCode:newVertexFunctionName:newFragmentFunctionName:sourceCodeBlock:additionalFileBlock:].cold.1();
        v32 = (void *)objc_msgSend(v26, "substringFromIndex:", objc_msgSend(v26, "rangeOfString:", CFSTR("\")) + 1);
        v33 = objc_msgSend(v32, "substringToIndex:", objc_msgSend(v32, "rangeOfString:", CFSTR("\")));
        v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_import/%@"), v33);
        v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#import \"%@\"), v34);
        v35 = v20 - v18;
        v13 = v56;
        (*((void (**)(id, uint64_t, uint64_t))a8 + 2))(a8, objc_msgSend(v56, "substringWithRange:", v18, v35), v34);
      }
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v59, v58, &stru_1EA5A6480);
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v22, v25, v30);
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v17, v22 - v17, &stru_1EA5A6480);
      v14 = objc_msgSend(v13, "length");
      v17 = objc_msgSend(v13, "rangeOfString:options:range:", CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, 0, v14);
    }
    while (v17 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v36 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v37 = v13;
  objc_msgSend(v13, "insertString:atIndex:", CFSTR("\n"), 0);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v38 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(PreprocessorsMacros, "allKeys"), "sortedArrayUsingSelector:"), "reverseObjectEnumerator");
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v66 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        v44 = (void *)objc_msgSend(PreprocessorsMacros, "objectForKeyedSubscript:", v43);
        objc_msgSend(v37, "insertString:atIndex:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#define %@ %@\n"), v43, v44), 0);
        if (objc_msgSend(v44, "isEqual:", &stru_1EA5A6480))
          objc_msgSend(v36, "appendFormat:", CFSTR(" -D%@"), v43, v52);
        else
          objc_msgSend(v36, "appendFormat:", CFSTR(" -D%@=%@"), v43, v44);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v40);
  }
  PreprocessorAllPossibleMacros = (void *)C3DFXMetalProgramGetPreprocessorAllPossibleMacros(cf);
  if (objc_msgSend(PreprocessorAllPossibleMacros, "count"))
  {
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v46 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(PreprocessorAllPossibleMacros, "allObjects"), "sortedArrayUsingSelector:", sel_compare_), "reverseObjectEnumerator");
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v62 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
          if (!objc_msgSend(PreprocessorsMacros, "objectForKeyedSubscript:", v51))
            objc_msgSend(v36, "appendFormat:", CFSTR(" -U%@"), v51);
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v48);
    }
  }
  (*((void (**)(id, id, uint64_t))a8 + 2))(a8, v36, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_unifdef/%@.h"), a4));

  (*((void (**)(id, void *))a7 + 2))(a7, v37);
}

- (void)_newProgramWithHashCodeWithFunctionConstants:engineContext:introspectionDataPtr:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: OpenSubdiv support not implemented yet for constant shaders", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_newProgramWithHashCode:(uint8_t *)a1 engineContext:(_QWORD *)a2 introspectionDataPtr:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Infinite lights can only be dir or unranged omni", a1);
}

- (void)_newProgramWithHashCode:(uint8_t *)buf engineContext:(_BYTE *)a2 introspectionDataPtr:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Multiple rendering is lacking a multiple output vertex streams generator", buf, 2u);
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Invalid shader modifier: programmable blending is not supported by this device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)collectShaderForProgram:hashCode:newVertexFunctionName:newFragmentFunctionName:sourceCodeBlock:additionalFileBlock:.cold.1()
{
  __assert_rtn("-[SCNCommonProfileProgramGeneratorMetal collectShaderForProgram:hashCode:newVertexFunctionName:newFragmentFunctionName:sourceCodeBlock:additionalFileBlock:]", "SCNCommonProfileProgramGeneratorMetal.m", 2218, "0");
}

@end
