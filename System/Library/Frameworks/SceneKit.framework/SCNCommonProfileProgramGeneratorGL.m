@implementation SCNCommonProfileProgramGeneratorGL

- (SCNCommonProfileProgramGeneratorGL)initWithProfile:(int)a3
{
  SCNCommonProfileProgramGeneratorGL *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNCommonProfileProgramGeneratorGL;
  result = -[SCNCommonProfileProgramGenerator init](&v5, sel_init);
  if (result)
    result->_profile = a3;
  return result;
}

- (SCNCommonProfileProgramGeneratorGL)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNCommonProfileProgramGeneratorGL;
  return -[SCNCommonProfileProgramGenerator init](&v3, sel_init);
}

- (__C3DFXProgram)_newProgramWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  CFMutableDictionaryRef Mutable;
  unsigned int CommonProfileHashCode;
  int HasTexture;
  NSObject *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int LightsCount;
  int IsEnabled;
  int v18;
  int v19;
  __CFDictionary *v20;
  __CFString *v21;
  const __CFString *Declaration;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  __CFString *v27;
  uint64_t v28;
  unsigned int LightHashCode;
  int v30;
  unint64_t v31;
  CFStringRef v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t Code;
  NSObject *v40;
  __CFString *v41;
  const __CFString *v42;
  int v43;
  NSObject *v44;
  int v45;
  BOOL v46;
  int v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  int v51;
  int v52;
  unsigned int v53;
  int v54;
  int v55;
  int v56;
  uint64_t CustomSlotCount;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  __CFString *v61;
  const __CFString *CustomSlotSortedName;
  uint64_t CustomSlotUVSet;
  uint64_t v64;
  __CFDictionary *v65;
  uint64_t UVSetsCount;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  uint64_t v70;
  __CFString *v71;
  __CFString *v72;
  __CFString *v73;
  unsigned int UVSetInfo;
  __int16 v75;
  int v76;
  int v77;
  const __CFString *v78;
  uint64_t v79;
  const __CFString *v80;
  CFStringRef v81;
  const __CFString *Value;
  __CFString *v83;
  __CFString *v84;
  const __CFString *v85;
  CFMutableStringRef v86;
  CFMutableStringRef v87;
  const __CFString *v88;
  const __CFDictionary *v89;
  __CFDictionary *v90;
  __CFDictionary *v91;
  const __CFString *v92;
  const __CFString *v93;
  __CFDictionary *v94;
  NSObject *v95;
  uint64_t v96;
  const __CFString *v97;
  CFStringRef v98;
  CFIndex Count;
  const void **v100;
  const void **v101;
  const void **v102;
  const void **v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __CFString *v107;
  __CFString *v108;
  const __CFString *v109;
  CFMutableStringRef v110;
  CFMutableStringRef v111;
  CFMutableStringRef v112;
  __CFDictionary *v113;
  CFMutableDictionaryRef v114;
  char v115;
  const __CFString *v116;
  CFIndex v117;
  const void **v118;
  const void **v119;
  const void **v120;
  const void **v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *v125;
  __C3DFXProgram *v126;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  char ModifierFlag;
  int HasConstantAlpha;
  uint64_t v136;
  uint64_t v137;
  __int16 EffectPropertyHashCode;
  int v139;
  int v140;
  __int16 v141;
  int AmbientLightingEnabled;
  int v143;
  int v144;
  int IsOpaque;
  int v146;
  int v147;
  unint64_t v148;
  __int16 v149;
  unsigned int cf;
  CFMutableStringRef cfa;
  uint64_t v152;
  const __CFDictionary *v153;
  int IsOne;
  int v155;
  int appendedString;
  const __CFString *appendedStringa;
  int v158;
  int v159;
  int LightingEnabled;
  int v161;
  int v162;
  CFTypeRef v163;
  CFMutableDictionaryRef v164;
  __CFDictionary *theDict;
  CFMutableStringRef theString;
  const __CFAllocator *alloc;
  CFAllocatorRef alloca;
  __CFString *v169;
  __CFDictionary *v170;
  CFMutableStringRef MutableCopy;
  CFStringRef v172;
  CFStringRef v173;
  CFTypeRef v174;
  CFTypeRef v175;
  __C3DProgramHashCode *v176;
  uint64_t v177;
  uint64_t v178;
  uint8_t v179;
  char v180[15];
  _OWORD v181[16];
  uint64_t v182[32];
  uint64_t v183[32];
  uint8_t buf[4];
  _QWORD v185[5];
  CFRange v186;
  CFRange v187;
  CFRange v188;
  CFRange v189;

  *(_QWORD *)((char *)&v185[2] + 4) = *MEMORY[0x1E0C80C00];
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 100, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CommonProfileHashCode = C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)a3);
  cf = C3DProgramHashCodeGetNodeHashCode((uint64_t)a3);
  HasTexture = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 7u);
  v143 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 4u);
  IsOpaque = C3DProgramHashCodeIsOpaque((uint64_t)a3);
  v147 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 5u);
  v161 = CommonProfileHashCode & 0xF;
  if (v161 == 5)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.6();
    v161 = 2;
  }
  v10 = CommonProfileHashCode;
  EffectPropertyHashCode = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)a3, 2u);
  IsOne = C3DProgramHashCodeGlobalAlphaIsOne((uint64_t)a3);
  HasConstantAlpha = C3DProgramHashCodeHasConstantAlpha((uint64_t)a3);
  memset(v183, 0, sizeof(v183));
  v11 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 0, 1, (uint64_t)v183, 32);
  memset(v182, 0, sizeof(v182));
  v12 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 1, 1, (uint64_t)v182, 32);
  memset(v181, 0, sizeof(v181));
  v13 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 2, 1, (uint64_t)v181, 32);
  v178 = 0;
  v14 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 3, 1, (uint64_t)&v178, 1);
  if (v14 >= 2)
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.5();
    v14 = 1;
  }
  __AppendModifierDefines(Mutable, v183, v11);
  __AppendModifierDefines(Mutable, v182, v12);
  __AppendModifierDefines(Mutable, (uint64_t *)v181, v13);
  __AppendModifierDefines(Mutable, &v178, v14);
  v137 = v13;
  ModifierFlag = __GetModifierFlag((uint64_t *)v181, v13);
  v133 = __GetModifierFlag(v182, v12);
  LightsCount = C3DProgramHashCodeGetLightsCount((uint64_t)a3);
  theDict = Mutable;
  v152 = v12;
  if ((v161 & 0xFFFFFFFB) != 0)
    LightingEnabled = C3DProgramHashCodeGetLightingEnabled((uint64_t)a3);
  else
    LightingEnabled = 0;
  IsEnabled = 0;
  if ((v161 & 0xE) == 2 && LightingEnabled)
    IsEnabled = C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 3u);
  appendedString = (CommonProfileHashCode >> 4) & 1 | HasTexture;
  v18 = IsEnabled | CheckDefineUsageInModifiers((uint64_t)v182, v12, CFSTR("USE_SPECULAR"));
  v19 = v18 | CheckDefineUsageInModifiers((uint64_t)&v178, v14, CFSTR("USE_SPECULAR"));
  v20 = theDict;
  if (v19 == 1)
  {
    if (appendedString)
    {
      CFDictionarySetValue(theDict, CFSTR("USE_VIEW"), CFSTR("2"));
      CFDictionarySetValue(theDict, CFSTR("USE_SHININESS"), CFSTR("2"));
    }
    else
    {
      CFDictionaryAddValue(theDict, CFSTR("USE_VIEW"), CFSTR("1"));
      CFDictionaryAddValue(theDict, CFSTR("USE_SHININESS"), CFSTR("1"));
    }
  }
  AmbientLightingEnabled = C3DProgramHashCodeGetAmbientLightingEnabled((uint64_t)a3);
  v169 = CFStringCreateMutable(alloc, 0);
  v21 = CFStringCreateMutable(alloc, 0);
  v153 = CFDictionaryCreateMutable(alloc, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  theString = v21;
  v149 = CommonProfileHashCode;
  v141 = CommonProfileHashCode;
  v136 = v11;
  if (!LightingEnabled)
  {
    v26 = 0;
    LightsCount = 0;
    v155 = 0;
LABEL_91:
    v45 = AmbientLightingEnabled;
    goto LABEL_92;
  }
  if (v178)
  {
    Declaration = (const __CFString *)C3DShaderModifierGetDeclaration(v178);
    if (Declaration)
      CFStringAppend(v21, Declaration);
  }
  v23 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(CFSTR("SCNShaderLightDecl.glsl"));
  CFStringAppend(v21, v23);
  if (!LightsCount)
  {
    v26 = 0;
    v155 = 0;
    v10 = CommonProfileHashCode;
    goto LABEL_91;
  }
  v139 = 0;
  v140 = v19;
  v24 = 0;
  v25 = 0;
  v158 = 0;
  v26 = 0;
  v27 = v169;
  do
  {
    v28 = v178;
    LightHashCode = C3DProgramHashCodeGetLightHashCode((uint64_t)a3, (unsigned __int16)v24);
    v30 = LightHashCode & 7;
    if ((LightHashCode & 7) != 0)
    {
      v31 = LightHashCode;
      v32 = CFStringCreateWithFormat(alloc, 0, CFSTR("u_light%hu"), v24);
      CFStringAppend(v27, CFSTR("{\n"));
      CFStringAppend(v27, CFSTR("    SCNShaderLight _light;\n"));
      if ((v31 & 0x1000) != 0)
      {
        CFStringAppend(v27, CFSTR("    _light.intensity = vec4(1.);\n"));
      }
      else
      {
        CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_color;\n"), v32);
        CFStringAppendFormat(v27, 0, CFSTR("    _light.intensity = %@_color;\n"), v32);
      }
      v33 = (v31 >> 3) & 7;
      switch(v30)
      {
        case 1:
          CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_direction;\n"), v32);
          v34 = v169;
          CFStringAppendFormat(v169, 0, CFSTR("    _light.direction = %@_direction.xyz;\n"), v32);
          goto LABEL_38;
        case 2:
          CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_position;\n"), v32);
          if (v33)
          {
            CFStringAppendFormat(v169, 0, CFSTR("    vec3 _D = %@_position.xyz - _surface.position;\n"), v32);
            CFStringAppendFormat(v169, 0, CFSTR("    _light.dist = length(_D);\n"));
            CFStringAppendFormat(v169, 0, CFSTR("    _light.direction = _D / _light.dist;\n"));
            CFStringAppendFormat(v169, 0, CFSTR("    _light._att = 1.;\n"));
            v26 = 1;
LABEL_39:
            CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_attenuation;\n"), v32);
            CFStringAppendFormat(v169, 0, CFSTR("    vec3 _att = %@_attenuation.xyz;\n"), v32);
            switch((int)v33)
            {
              case 1:
                v35 = v169;
                v36 = CFSTR("    _light._att *= step(_light.dist, _att.x);\n");
                goto LABEL_44;
              case 2:
                v35 = v169;
                v36 = CFSTR("    _light._att *= clamp(_light.dist * _att.x + _att.y, 0.0, 1.0);\n");
                goto LABEL_44;
              case 3:
                v35 = v169;
                v36 = CFSTR("    float _dstatt = clamp(_light.dist * _att.x + _att.y, 0.0, 1.0);\n    _light._att *= (_dstatt  * _dstatt);\n");
                goto LABEL_44;
              case 4:
                v35 = v169;
                v36 = CFSTR("    _light._att *= pow(clamp(_light.dist * _att.x + _att.y, 0.0, 1.0), _att.z);\n");
LABEL_44:
                CFStringAppend(v35, v36);
                break;
              default:
                break;
            }
          }
          else
          {
            CFStringAppendFormat(v169, 0, CFSTR("    _light.direction = normalize(%@_position.xyz - _surface.position);\n"),
              v32);
            CFStringAppendFormat(v169, 0, CFSTR("    _light._att = 1.;\n"));
            v26 = 1;
          }
LABEL_45:
          v37 = (v31 >> 6) & 7;
          v27 = v169;
          if (v37)
          {
            CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_spotAttenuation;\n"), v32);
            CFStringAppendFormat(v169, 0, CFSTR("    vec3 _spot = %@_spotAttenuation.xyz;\n"), v32);
            if ((v37 - 1) <= 3)
              CFStringAppend(v169, off_1EA5A3730[v37 - 1]);
          }
          if ((v31 & 0x400) != 0)
          {
            CFStringAppendFormat(theString, 0, CFSTR("uniform sampler2DShadow %@_shadow;\n"), v32);
            CFStringAppendFormat(theString, 0, CFSTR("uniform mat4 %@_shadowMatrix;\n"), v32);
            v38 = WORD1(v31) & 0x1F;
            if (v38 < 2)
            {
              CFStringAppendFormat(v169, 0, CFSTR("    float _shadowingTerm = __shadow2DProj(%@_shadow, (%@_shadowMatrix * vec4(_surface.position, 1.)));\n"),
                v32,
                v32,
                v130,
                v131,
                v132);
            }
            else
            {
              if (v25 <= v38)
                v25 = WORD1(v31) & 0x1F;
              CFStringAppendFormat(theString, 0, CFSTR("uniform float %@_shadowRadius;\n"), v32);
              CFStringAppendFormat(v169, 0, CFSTR("    float _shadowingTerm = 0.0;\n    vec4 _lightScreen = (%@_shadowMatrix * vec4(_surface.position, 1.));\n    float _filteringSizeFactor = %@_shadowRadius * _lightScreen.w;\n    for (int i=0; i < %d; i++){\n        _shadowingTerm += __shadow2DProj(%@_shadow, _lightScreen + (u_shadowKernel[i] * _filteringSizeFactor));\n    }\n    _shadowingTerm /= float(%d);\n"),
                v32,
                v32,
                WORD1(v31) & 0x1F,
                v32,
                WORD1(v31) & 0x1F);
            }
            if ((v31 & 0x800) != 0)
            {
              CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_shadowColor;\n"), v32);
              CFStringAppendFormat(v169, 0, CFSTR("    _light._att *= (1. - _shadowingTerm * %@_shadowColor.a);\n"),
                v32);
            }
            else
            {
              CFStringAppendFormat(v169, 0, CFSTR("    _light._att *= (1. - _shadowingTerm);\n"), v129);
            }
            v26 = 1;
            v158 = 1;
LABEL_63:
            if (v28)
              goto LABEL_64;
            if ((v31 & 0x1000) != 0)
              goto LABEL_79;
            goto LABEL_70;
          }
          if ((v31 & 5) != 1 || (v31 & 0x200) == 0)
            goto LABEL_63;
          CFStringAppendFormat(theString, 0, CFSTR("uniform sampler2D %@_gobo;\n"), v32);
          CFStringAppendFormat(theString, 0, CFSTR("uniform mat4 %@_goboMatrix;\n"), v32);
          CFStringAppendFormat(theString, 0, CFSTR("uniform float %@_goboIntensity;\n"), v32);
          if ((v31 & 0x1000) != 0)
          {
            CFStringAppendFormat(v169, 0, CFSTR("    _light.intensity *= mix(vec4(1.), texture2DProj(%@_gobo, (%@_goboMatrix * vec4(_surface.position, 1.))), %@_goboIntensity);\n"),
              v32,
              v32,
              v32);
            v26 = 1;
            if (v28)
            {
LABEL_64:
              Code = C3DShaderModifierGetCode(v28);
              if (!Code)
              {
                v40 = scn_default_log();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                  -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.4(buf, v185, v40);
              }
              v27 = v169;
              v41 = v169;
              v42 = (const __CFString *)Code;
              goto LABEL_68;
            }
LABEL_79:
            CFStringAppend(v169, CFSTR("    _lightingContribution.modulate *= _light._att * _light.intensity.rgb;\n"));
            v139 = 1;
            goto LABEL_80;
          }
          CFStringAppendFormat(v169, 0, CFSTR("    _light.intensity *= %@_goboIntensity * texture2DProj(%@_gobo, (%@_goboMatrix * vec4(_surface.position, 1.)));\n"),
            v32,
            v32,
            v32);
          v26 = 1;
          if (v28)
            goto LABEL_64;
LABEL_70:
          v43 = C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)a3) & 0xF;
          if (v43 == 5)
          {
            v44 = scn_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.3(&v179, v180, v44);
            v43 = 2;
          }
          CFStringAppend(v169, CFSTR("    _light.intensity.rgb *= _light._att * max(0.0, dot(_surface.normal, _light.direction));\n    _lightingContribution.diffuse += _light.intensity.rgb;\n"));
          if (v140)
          {
            if (v43 == 3)
            {
              v41 = v169;
              v42 = CFSTR("    vec3 _halfVector = normalize(_light.direction + _surface.view);\n    _lightingContribution.specular += pow(max(0.0, dot(_surface.normal, _halfVector)), _surface.shininess) * _light.intensity.rgb;\n");
              goto LABEL_68;
            }
            if (v43 == 2)
            {
              v41 = v169;
              v42 = CFSTR("    vec3 _R = reflect(-_light.direction, _surface.normal);\n    _lightingContribution.specular += pow(max(0.0, dot(_R, _surface.view)), _surface.shininess) * _light.intensity.rgb;\n");
LABEL_68:
              CFStringAppend(v41, v42);
            }
          }
LABEL_80:
          CFStringAppend(v27, CFSTR("}\n"));
          CFRelease(v32);
          break;
        case 3:
        case 5:
          CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_position;\n"), v32);
          CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 %@_direction;\n"), v32);
          v34 = v169;
          if (v33)
          {
            CFStringAppendFormat(v169, 0, CFSTR("    vec3 _D = %@_position.xyz - _surface.position;\n"), v32);
            CFStringAppendFormat(v169, 0, CFSTR("    _light.dist = length(_D);\n"));
            CFStringAppendFormat(v169, 0, CFSTR("    _light.direction = _D / _light.dist;\n"), v128);
          }
          else
          {
            CFStringAppendFormat(v169, 0, CFSTR("    _light.direction = normalize(%@_position.xyz - _surface.position);\n"),
              v32);
          }
          CFStringAppendFormat(v169, 0, CFSTR("    _light.dir = %@_direction.xyz;\n"), v32);
          v26 = 1;
          goto LABEL_38;
        default:
          v34 = v169;
          CFStringAppend(v169, CFSTR("//Unsupported\n"));
LABEL_38:
          CFStringAppendFormat(v34, 0, CFSTR("    _light._att = 1.;\n"));
          if (v33)
            goto LABEL_39;
          goto LABEL_45;
      }
    }
    v24 = (v24 + 1);
  }
  while (LightsCount != (_DWORD)v24);
  LOWORD(CommonProfileHashCode) = v141;
  v45 = AmbientLightingEnabled;
  if (v158)
  {
    CFStringAppend(theString, CFSTR("float __shadow2DProj(sampler2DShadow tex, vec4 coord) {return shadow2DProjEXT( tex, coord);}\n"));
    v10 = v149;
    LightsCount = v139;
    if (v25 >= 2)
      CFStringAppendFormat(theString, 0, CFSTR("uniform vec4 u_shadowKernel[%d];\n"), v25);
    v155 = 1;
    v20 = theDict;
    v19 = v140;
  }
  else
  {
    v155 = 0;
    v20 = theDict;
    v10 = v149;
    LightsCount = v139;
    v19 = v140;
  }
LABEL_92:
  v46 = (v10 & 0x280) != 0 && v161 == 4;
  v47 = appendedString;
  if (v46)
    v47 = 1;
  v159 = v47;
  if (C3DProgramHashCodeHasFog((uint64_t)a3))
  {
    CFDictionaryAddValue(v20, CFSTR("USE_FOG"), &stru_1EA5A6480);
    CFDictionaryAddValue(v20, CFSTR("USE_POSITION"), CFSTR("2"));
  }
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 0x13u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 0x14u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 4u))
  {
    CFDictionaryAddValue(v20, CFSTR("USE_FRESNEL"), &stru_1EA5A6480);
    CFDictionaryAddValue(v20, CFSTR("USE_VIEW"), CFSTR("2"));
    CFDictionaryAddValue(v20, CFSTR("USE_NORMAL"), CFSTR("2"));
    CFDictionaryAddValue(v20, CFSTR("USE_POSITION"), CFSTR("2"));
  }
  if ((LightingEnabled & ((v10 & 0x40) != 0)) == 1)
    CFDictionaryAddValue(v20, CFSTR("AVOID_OVERLIGHTING"), &stru_1EA5A6480);
  if (v45)
    CFDictionaryAddValue(v20, CFSTR("USE_AMBIENT_LIGHTING"), &stru_1EA5A6480);
  if (LightingEnabled)
  {
    CFDictionaryAddValue(v20, CFSTR("USE_LIGHTING"), &stru_1EA5A6480);
    if (v159)
    {
      CFDictionaryAddValue(v20, CFSTR("USE_PER_PIXEL_LIGHTING"), &stru_1EA5A6480);
      CFDictionarySetValue(v20, CFSTR("USE_NORMAL"), CFSTR("2"));
      if (((v26 == 0) & ~v19) == 0)
        CFDictionarySetValue(v20, CFSTR("USE_POSITION"), CFSTR("2"));
      if (LightsCount)
      {
        v48 = CFSTR("USE_MODULATE");
        v49 = CFSTR("2");
        goto LABEL_118;
      }
    }
    else
    {
      CFDictionaryAddValue(v20, CFSTR("USE_NORMAL"), CFSTR("1"));
      CFDictionaryAddValue(v20, CFSTR("USE_PER_VERTEX_LIGHTING"), &stru_1EA5A6480);
      if (!CFDictionaryGetValue(v20, CFSTR("USE_VIEW")))
        CFDictionarySetValue(v20, CFSTR("USE_VIEW"), CFSTR("1"));
      if (!CFDictionaryGetValue(v20, CFSTR("USE_POSITION")))
      {
        v48 = CFSTR("USE_POSITION");
        v49 = CFSTR("1");
LABEL_118:
        CFDictionarySetValue(v20, v48, v49);
      }
    }
  }
  if ((cf & 2) != 0)
    CFDictionaryAddValue(v20, CFSTR("USE_VERTEX_COLOR"), &stru_1EA5A6480);
  v176 = a3;
  v177 = 0;
  v170 = v20;
  v172 = CFStringCreateMutable(alloc, 0);
  v173 = CFStringCreateMutable(alloc, 0);
  v174 = CFStringCreateMutable(alloc, 0);
  v175 = CFStringCreateMutable(alloc, 0);
  v50 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(CFSTR("SCNShaderSurfaceDecl.glsl"));
  MutableCopy = CFStringCreateMutableCopy(alloc, 0, v50);
  if (C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 8u))
  {
    __AddTextureProperty((uint64_t)&v170, 8u, 1, v45);
    CFDictionaryAddValue(v20, CFSTR("USE_AMBIENT_AS_AMBIENTOCCLUSION"), &stru_1EA5A6480);
  }
  else
  {
    if ((CommonProfileHashCode & 0x8000u) == 0)
      v51 = v45;
    else
      v51 = 0;
    __AddTextureProperty((uint64_t)&v170, 1u, 1, v51);
  }
  __AddTextureProperty((uint64_t)&v170, 2u, 2, 1);
  __AddTextureProperty((uint64_t)&v170, 3u, 3, v19 | v143);
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 9u))
  {
    __AddTextureProperty((uint64_t)&v170, 9u, 0, 1);
    CFDictionaryAddValue(v20, CFSTR("USE_EMISSION_AS_SELFILLUMINATION"), &stru_1EA5A6480);
  }
  else
  {
    __AddTextureProperty((uint64_t)&v170, 0, 0, 1);
  }
  __AddTextureProperty((uint64_t)&v170, 6u, 6, 1);
  __AddTextureProperty((uint64_t)&v170, 7u, 7, 1);
  if ((_BYTE)v177)
  {
    CFDictionarySetValue(v20, CFSTR("USE_TANGENT"), CFSTR("2"));
    CFDictionarySetValue(v20, CFSTR("USE_BITANGENT"), CFSTR("2"));
  }
  __AddTextureProperty((uint64_t)&v170, 4u, 4, 1);
  if ((_BYTE)v177)
  {
    CFDictionarySetValue(v20, CFSTR("USE_VIEW"), CFSTR("2"));
    CFDictionarySetValue(v20, CFSTR("USE_NORMAL"), CFSTR("2"));
    CFDictionarySetValue(v20, CFSTR("USE_POSITION"), CFSTR("2"));
  }
  v52 = v147 & (IsOpaque ^ 1);
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 2u))
  {
    v53 = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)a3, 2u);
    if ((v53 & 1) != 0)
    {
      v148 = ((unint64_t)v53 >> 5) & 1;
      v54 = v148;
    }
    else
    {
      v54 = 0;
      LOBYTE(v148) = (v53 & 8) == 0;
    }
  }
  else
  {
    LOBYTE(v148) = 0;
    v54 = 0;
  }
  v55 = IsOne;
  if ((CommonProfileHashCode & 0x7800) != 0x800)
    v55 = 0;
  v146 = CommonProfileHashCode & 0x7800;
  v162 = v52;
  if (((v55 | v52) & 1) != 0)
    v56 = v55 ^ 1;
  else
    v56 = v54 | HasConstantAlpha ^ 1;
  __AddTextureProperty((uint64_t)&v170, 5u, 5, v56);
  CustomSlotCount = C3DProgramHashCodeGetCustomSlotCount((uint64_t)a3);
  if (CustomSlotCount >= 1)
  {
    v58 = CustomSlotCount;
    v59 = 0;
    v60 = MutableCopy;
    v61 = (__CFString *)v175;
    do
    {
      CustomSlotSortedName = C3DProgramHashCodeGetCustomSlotSortedName((uint64_t)a3, v59);
      CustomSlotUVSet = C3DProgramHashCodeGetCustomSlotUVSet((uint64_t)a3, v59);
      if (CustomSlotUVSet != -1)
      {
        v64 = CustomSlotUVSet;
        CFStringAppendFormat(v60, 0, CFSTR("    vec2 %@Texcoord;\n"), CustomSlotSortedName);
        CFStringAppendFormat(v61, 0, CFSTR("    _surface.%@Texcoord = v_texcoord%d;\n"), CustomSlotSortedName, v64);
      }
      ++v59;
    }
    while (v58 != v59);
  }
  v65 = theDict;
  v144 = v162 | v54;
  if (((v162 | v54) & 1) != 0)
    CFDictionarySetValue(theDict, CFSTR("USE_DISCARD"), CFSTR("2"));
  appendedStringa = MutableCopy;
  CFStringAppend(MutableCopy, CFSTR("\n} _surface;\n"));
  UVSetsCount = C3DProgramHashCodeGetUVSetsCount((uint64_t)a3);
  v67 = UVSetsCount;
  v68 = v169;
  v163 = (CFTypeRef)UVSetsCount;
  if (UVSetsCount)
  {
    if (UVSetsCount < 1)
    {
      v70 = 0;
    }
    else
    {
      v69 = 0;
      v70 = 0;
      v71 = (__CFString *)v172;
      v72 = (__CFString *)v173;
      v73 = (__CFString *)v174;
      do
      {
        UVSetInfo = C3DProgramHashCodeGetUVSetInfo((uint64_t)a3, v69);
        v75 = UVSetInfo;
        v76 = ~(UVSetInfo >> 8);
        CFStringAppendFormat(v71, 0, CFSTR("varying vec2 v_texcoord%d;\n"), v69);
        if (v76)
        {
          v77 = v75 >> 8;
          if (v77 > 20)
            v78 = C3DProgramHashCodeGetCustomSlotSortedName((uint64_t)a3, SHIBYTE(v75) - 27);
          else
            v78 = __stringForProperty(v77);
          v80 = v78;
          CFStringAppendFormat(v72, 0, CFSTR("uniform mat4 u_%@TextureMatrix;\n"), v78);
          v79 = v75;
          CFStringAppendFormat(v73, 0, CFSTR("v_texcoord%d = (u_%@TextureMatrix * vec4(_geometry.texcoords[%d], 0., 1.)).xy;\n"),
            v69,
            v80,
            v75);
        }
        else
        {
          v79 = v75;
          CFStringAppendFormat(v73, 0, CFSTR("v_texcoord%d = _geometry.texcoords[%d];\n"),
            v69,
            v75,
            v130);
        }
        v81 = CFStringCreateWithFormat(alloc, 0, CFSTR("NEED_IN_TEXCOORD%d"), v79);
        v65 = theDict;
        CFDictionaryAddValue(theDict, v81, &stru_1EA5A6480);
        CFRelease(v81);
        if (v70 <= (v79 + 1))
          v70 = (v79 + 1);
        ++v69;
        v67 = (uint64_t)v163;
      }
      while (v163 != (CFTypeRef)v69);
    }
    CFDictionaryAddValue(v65, CFSTR("USE_TEXCOORD"), &stru_1EA5A6480);
    v68 = v169;
  }
  else
  {
    v70 = 0;
  }
  Value = (const __CFString *)CFDictionaryGetValue(v65, CFSTR("USE_VIEW"));
  if (Value && CFStringCompare(Value, CFSTR("2"), 0) == kCFCompareEqualTo)
    CFDictionarySetValue(v65, CFSTR("USE_POSITION"), CFSTR("2"));
  v83 = CFStringCreateMutable(alloc, 0);
  v84 = v83;
  if (v155)
    CFStringAppend(v83, CFSTR("#extension GL_EXT_shadow_samplers : require\n\n"));
  v85 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(CFSTR("C3D-UberShader.vsh"));
  if (v85)
  {
    v86 = CFStringCreateMutableCopy(alloc, 0, v85);
    v87 = CFStringCreateMutable(alloc, 0);
    v88 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(CFSTR("SCNShaderGeometryDecl.glsl"));
    CFStringAppend(v87, v88);
    CFStringAppend(v87, appendedStringa);
    if ((v159 & 1) == 0)
      CFStringAppend(v87, CFSTR("struct SCNShaderLightingContribution {vec3 ambient; vec3 diffuse; vec3 specular; vec3 modulate;} _lightingContribution;\n"));
    v89 = v65;
    v90 = CFDictionaryCreateMutableCopy(alloc, 0, v65);
    v91 = CFDictionaryCreateMutable(alloc, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (CFDictionaryContainsKey(v89, CFSTR("USE_POSITION"))
      || CFDictionaryContainsKey(v89, CFSTR("USE_VIEW"))
      || ((LightingEnabled ^ 1 | v159) & 1) == 0)
    {
      CFDictionarySetValue(v91, CFSTR("u_modelViewTransform"), CFSTR("mat4"));
      CFDictionarySetValue(v91, CFSTR("u_projectionTransform"), CFSTR("mat4"));
      CFDictionarySetValue(v90, CFSTR("SEPARATE_PROJECTION"), CFSTR("1"));
      if (!CFDictionaryGetValue(v89, CFSTR("USE_POSITION")))
      {
        v92 = CFSTR("USE_POSITION");
        v93 = CFSTR("1");
        v94 = v89;
        goto LABEL_183;
      }
    }
    else
    {
      v92 = CFSTR("u_modelViewProjectionTransform");
      v93 = CFSTR("mat4");
      v94 = v91;
LABEL_183:
      CFDictionarySetValue(v94, v92, v93);
    }
    if (CFDictionaryContainsKey(v89, CFSTR("USE_NORMAL"))
      || CFDictionaryContainsKey(theDict, CFSTR("USE_TANGENT"))
      || CFDictionaryContainsKey(theDict, CFSTR("USE_PER_VERTEX_LIGHTING")))
    {
      CFDictionarySetValue(v91, CFSTR("u_normalTransform"), CFSTR("mat4"));
    }
    v96 = cf >> 28;
    if (v163)
    {
      CFStringAppend(v87, v173);
      CFStringAppend(v87, v172);
      v97 = (const __CFString *)v174;
      v188.length = CFStringGetLength(v86);
      v188.location = 0;
      CFStringFindAndReplace(v86, CFSTR("__DoTexcoord__"), v97, v188, 0);
    }
    CFStringAppendFormat(v87, 0, CFSTR("#define kSCNTexcoordCount %ld\n"), v70);
    if ((_DWORD)v96)
    {
      CFDictionaryAddValue(v90, CFSTR("USE_SKINNING"), &stru_1EA5A6480);
      v98 = CFStringCreateWithFormat(alloc, 0, CFSTR("%ld"), v96);
      CFDictionaryAddValue(v90, CFSTR("MAX_BONE_INFLUENCES"), v98);
      CFRelease(v98);
    }
    if (v136)
    {
      CFDictionaryAddValue(v90, CFSTR("USE_GEOMETRY_MODIFIER"), &stru_1EA5A6480);
      __ReplaceCodeWithModifiers(v183, v136, v86, v87, v90, v91, CFSTR("__DoGeometryModifier__"));
    }
    if (((LightingEnabled ^ 1 | v159) & 1) == 0)
    {
      CFStringAppend(v87, theString);
      CFDictionaryApplyFunction(v153, (CFDictionaryApplierFunction)__appendDictionary_0, v91);
      v189.length = CFStringGetLength(v86);
      v189.location = 0;
      CFStringFindAndReplace(v86, CFSTR("__DoLighting__"), v68, v189, 0);
    }
    CFDictionaryApplyFunction(v91, (CFDictionaryApplierFunction)__AppendUniformsDeclaration, v84);
    cfa = v86;
    CFStringAppend(v87, v86);
    Count = CFDictionaryGetCount(v90);
    v100 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v101 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(v90, v100, v101);
    if (Count >= 1)
    {
      v102 = v100;
      v103 = v101;
      do
      {
        v105 = (uint64_t)*v102++;
        v104 = v105;
        v106 = (uint64_t)*v103++;
        CFStringAppendFormat(v84, 0, CFSTR("#define %@ %@\n"), v104, v106);
        --Count;
      }
      while (Count);
    }
    free(v100);
    free(v101);
    CFStringAppend(v84, v87);
    CFRelease(v90);
    CFRelease(v91);
    CFRelease(v87);
    CFRelease(cfa);
    v67 = (uint64_t)v163;
    v65 = theDict;
    v68 = v169;
  }
  else
  {
    v95 = scn_default_log();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.2();
  }
  v107 = CFStringCreateMutable(alloc, 0);
  v108 = v107;
  if (v155)
    CFStringAppend(v107, CFSTR("#extension GL_EXT_shadow_samplers : require\n\n"));
  CFStringAppend(v108, CFSTR("#extension GL_OES_standard_derivatives : enable\n\n"));
  v109 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(CFSTR("C3D-UberShader.fsh"));
  v110 = theString;
  if (v109)
  {
    v111 = CFStringCreateMutableCopy(alloc, 0, v109);
    v112 = CFStringCreateMutable(alloc, 0);
    CFStringAppend(v112, appendedStringa);
    CFStringAppend(v112, CFSTR("struct SCNShaderLightingContribution {vec3 ambient; vec3 diffuse; vec3 specular; vec3 modulate;} _lightingContribution;\n"));
    v113 = CFDictionaryCreateMutableCopy(alloc, 0, v65);
    v114 = CFDictionaryCreateMutable(alloc, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v152)
    {
      CFDictionaryAddValue(v113, CFSTR("USE_SURFACE_MODIFIER"), &stru_1EA5A6480);
      __ReplaceCodeWithModifiers(v182, v152, v111, v112, v113, v114, CFSTR("__DoSurfaceModifier__"));
    }
    if (v137)
    {
      CFDictionaryAddValue(v113, CFSTR("USE_FRAGMENT_MODIFIER"), &stru_1EA5A6480);
      __ReplaceCodeWithModifiers((uint64_t *)v181, v137, v111, v112, v113, v114, CFSTR("__DoFragmentModifier__"));
    }
    if (v141 < 0)
      CFDictionaryAddValue(v113, CFSTR("LOCK_AMBIENT_WITH_DIFFUSE"), &stru_1EA5A6480);
    if ((v149 & 0x20) != 0)
      CFDictionaryAddValue(v113, CFSTR("USE_DOUBLE_SIDED"), &stru_1EA5A6480);
    if ((IsOne & 1) == 0)
    {
      if ((v144 | (((v133 | ModifierFlag) & 2) >> 1)) == 1)
        CFDictionaryAddValue(v113, CFSTR("USE_TRANSPARENCY"), &stru_1EA5A6480);
      if (v146 == 2048)
        CFDictionaryAddValue(v113, CFSTR("USE_NODE_OPACITY"), &stru_1EA5A6480);
    }
    if ((EffectPropertyHashCode & 0x400) != 0)
      v115 = 0;
    else
      v115 = v148;
    if ((v115 & 1) == 0)
      CFDictionaryAddValue(v113, CFSTR("DIFFUSE_PREMULTIPLIED"), &stru_1EA5A6480);
    if (v146 == 2048)
      CFDictionaryAddValue(v113, CFSTR("USE_TRANSPARENCY_RGBZERO"), &stru_1EA5A6480);
    if (v67)
    {
      CFStringAppend(v112, v172);
      v116 = (const __CFString *)v175;
      v186 = CFStringFind(v111, CFSTR("__DoTexcoord__"), 0);
      CFStringReplace(v111, v186, v116);
    }
    if ((LightingEnabled & v159) == 1)
    {
      CFStringAppend(v112, theString);
      CFDictionaryApplyFunction(v153, (CFDictionaryApplierFunction)__appendDictionary_0, v114);
      v187 = CFStringFind(v111, CFSTR("__DoLighting__"), 0);
      CFStringReplace(v111, v187, v68);
    }
    CFStringAppend(v108, CFSTR("precision highp float;\n"));
    v164 = v114;
    CFDictionaryApplyFunction(v114, (CFDictionaryApplierFunction)__AppendUniformsDeclaration, v108);
    alloca = (CFAllocatorRef)v111;
    CFStringAppend(v112, v111);
    v117 = CFDictionaryGetCount(v113);
    v118 = (const void **)malloc_type_malloc(8 * v117, 0x80040B8603338uLL);
    v119 = (const void **)malloc_type_malloc(8 * v117, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(v113, v118, v119);
    if (v117 >= 1)
    {
      v120 = v118;
      v121 = v119;
      do
      {
        v123 = (uint64_t)*v120++;
        v122 = v123;
        v124 = (uint64_t)*v121++;
        CFStringAppendFormat(v108, 0, CFSTR("#define %@ %@\n"), v122, v124);
        --v117;
      }
      while (v117);
    }
    free(v118);
    free(v119);
    CFStringAppend(v108, v112);
    CFRelease(v113);
    CFRelease(v164);
    CFRelease(v112);
    CFRelease(alloca);
    v65 = theDict;
    v110 = theString;
    v68 = v169;
  }
  else
  {
    v125 = scn_default_log();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.1();
  }
  CFRelease(v172);
  CFRelease(v173);
  CFRelease(v174);
  CFRelease(v175);
  CFRelease(appendedStringa);
  v126 = (__C3DFXProgram *)C3DFXGLSLProgramCreateWithSources(v84, v108);
  C3DFXProgramSetProfile((uint64_t)v126, 0);
  C3DCommonProfileShaderAssignAttributesAndUniformsIndexes(v126);
  CFRelease(v84);
  CFRelease(v108);
  CFRelease(v153);
  CFRelease(v68);
  CFRelease(v110);
  CFRelease(v65);
  return v126;
}

- (int)profile
{
  return self->_profile;
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: failed to load fragment uber shader.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: failed to load vertex uber shader.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_newProgramWithHashCode:(uint8_t *)a1 engineContext:(_BYTE *)a2 introspectionDataPtr:(NSObject *)a3 .cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: Physically based lighting model is not supported by the OpenGL renderer, using Phong instead (2)", a1);
}

- (void)_newProgramWithHashCode:(uint8_t *)buf engineContext:(_QWORD *)a2 introspectionDataPtr:(os_log_t)log .cold.4(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "modCode";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: cannot handle more than one lighting modifier", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, v0, v1, "Error: Physically based lighting model is not supported by the OpenGL renderer, using Phong instead (3)", v2);
  OUTLINED_FUNCTION_5();
}

@end
