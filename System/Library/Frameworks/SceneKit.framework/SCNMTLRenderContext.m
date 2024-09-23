@implementation SCNMTLRenderContext

+ (uint64_t)registerBindings
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t i;
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
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  char v41;
  char v42;

  objc_opt_self();
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("modelTransform"), &__block_literal_global_40);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("inverseModelTransform"), &__block_literal_global_103);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("modelViewTransform"), &__block_literal_global_106);
  if (C3DStandardShadersUseFunctionConstants())
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("lightIndices"), &__block_literal_global_109);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("inverseModelViewTransform"), &__block_literal_global_114);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("normalTransform"), &__block_literal_global_118);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("modelViewProjectionTransform"), &__block_literal_global_122);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("lastFrameModelTransform"), &__block_literal_global_126);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("motionBlurIntensity"), &__block_literal_global_129);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("inverseModelViewProjectionTransform"), &__block_literal_global_132);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("boundingBox"), &__block_literal_global_135);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("worldBoundingBox"), &__block_literal_global_138);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("nodeOpacity"), &__block_literal_global_141);
  +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", CFSTR("shCoefficients"), &__block_literal_global_144);
  +[SCNMTLShaderBindingsGenerator registerShadableArgumentBindingBlockForBuffers:textures:samplers:](SCNMTLShaderBindingsGenerator, "registerShadableArgumentBindingBlockForBuffers:textures:samplers:", &__block_literal_global_148, &__block_literal_global_150, &__block_literal_global_154);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:needsRenderResource:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:needsRenderResource:block:", CFSTR("scn_lights"), 0, 1, &__block_literal_global_158);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:needsRenderResource:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:needsRenderResource:block:", CFSTR("scn_lights_count"), 0, 1, &__block_literal_global_162);
  if (C3DStandardShadersUseFunctionConstants())
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("scn_shCoefficients"), 1, &__block_literal_global_166);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:needsRenderResource:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:needsRenderResource:block:", CFSTR("scn_commonprofile"), 2, 1, &__block_literal_global_148);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("scn_pointSize"), 2, &__block_literal_global_173);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_clusterTexture"), 0, &__block_literal_global_177);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_lightIndicesTexture"), 0, &__block_literal_global_181);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_areaLightBakedDataTexture"), 0, &__block_literal_global_185);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_shadowKernel"), 0, &__block_literal_global_189);
  v42 = 0;
  v0 = C3DEnumIterator<C3DEffectProperty,(signed char)0,(signed char)15>::end();
  v1 = MEMORY[0x1E0C809B0];
  if (v0)
  {
    v2 = v0;
    v3 = 0;
    do
    {
      if (v3 != 8)
      {
        v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("u_%@Texture"), __stringForProperty(v3));
        v40[0] = v1;
        v40[1] = 3221225472;
        v40[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_197;
        v40[3] = &unk_1EA5A0628;
        v41 = v3;
        v40[4] = &__block_literal_global_192_0;
        +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", v4, 2, v40);
      }
      ++v3;
    }
    while (v3 != v2);
  }
  if ((C3DStandardShadersUseFunctionConstants() & 1) != 0)
  {
    v39[0] = v1;
    v39[1] = 3221225472;
    v39[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_200;
    v39[3] = &unk_1EA5A0650;
    v39[4] = &__block_literal_global_192_0;
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_reflectiveCubeTexture"), 2, v39);
  }
  for (i = 0; i != 8; ++i)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("u_shadowTexture%d"), i);
    v38[0] = v1;
    v38[1] = 3221225472;
    v38[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_3_203;
    v38[3] = &__block_descriptor_40_e55_v24__0__SCNMTLResourceBinding_8__SCNMTLRenderContext_16l;
    v38[4] = i;
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", v6, 1, v38);
    v37[0] = v1;
    v37[1] = 3221225472;
    v37[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_4_205;
    v37[3] = &__block_descriptor_40_e55_v24__0__SCNMTLResourceBinding_8__SCNMTLRenderContext_16l;
    v37[4] = i;
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("u_goboTexture%d"), i), 1, v37);
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("u_iesTexture%d"), i), 1, v37);
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("u_iesCubeTexture%d"), i), 1, v37);
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color%d"), i);
    v36[0] = v1;
    v36[1] = 3221225472;
    v36[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_216;
    v36[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v36[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v7, v36);
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("position%d"), i);
    v35[0] = v1;
    v35[1] = 3221225472;
    v35[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_220;
    v35[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v35[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v8, v35);
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("direction%d"), i);
    v34[0] = v1;
    v34[1] = 3221225472;
    v34[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_3_223;
    v34[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v34[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v9, v34);
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("right%d"), i);
    v33[0] = v1;
    v33[1] = 3221225472;
    v33[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_4_226;
    v33[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v33[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v10, v33);
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("up%d"), i);
    v32[0] = v1;
    v32[1] = 3221225472;
    v32[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_5_229;
    v32[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v32[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v11, v32);
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("iesMatrix%d"), i);
    v31[0] = v1;
    v31[1] = 3221225472;
    v31[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_6_232;
    v31[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v31[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v12, v31);
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attenuation%d"), i);
    v30[0] = v1;
    v30[1] = 3221225472;
    v30[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_7_235;
    v30[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v30[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v13, v30);
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spotAttenuation%d"), i);
    v29[0] = v1;
    v29[1] = 3221225472;
    v29[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_8_238;
    v29[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v29[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v14, v29);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shadowMatrix%d"), i);
    v28[0] = v1;
    v28[1] = 3221225472;
    v28[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_9_241;
    v28[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v28[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v15, v28);
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shadowRadius%d"), i);
    v27[0] = v1;
    v27[1] = 3221225472;
    v27[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_245;
    v27[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v27[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v16, v27);
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shadowColor%d"), i);
    v26[0] = v1;
    v26[1] = 3221225472;
    v26[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_248;
    v26[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v26[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v17, v26);
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("goboMatrix%d"), i);
    v25[0] = v1;
    v25[1] = 3221225472;
    v25[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_3_251;
    v25[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v25[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v18, v25);
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("projectorColor%d"), i);
    v24[0] = v1;
    v24[1] = 3221225472;
    v24[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_4_254;
    v24[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v24[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](SCNMTLShaderBindingsGenerator, "registerSemantic:withBlock:", v19, v24);
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("u_areaPolygonPositions%d"), i);
    v23[0] = v1;
    v23[1] = 3221225472;
    v23[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_5_257;
    v23[3] = &__block_descriptor_40_e55_v24__0__SCNMTLResourceBinding_8__SCNMTLRenderContext_16l;
    v23[4] = i;
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", v20, 1, v23);
  }
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_specularDFGDiffuseHammonTexture"), 0, &__block_literal_global_262);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_radianceTexture"), 0, &__block_literal_global_266);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_irradianceTexture"), 0, &__block_literal_global_270);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_reflectionProbeTexture"), 0, &__block_literal_global_274);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", CFSTR("u_ssaoTexture"), 0, &__block_literal_global_278);
  v21 = _Block_copy(&__block_literal_global_284);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:needsRenderResource:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:needsRenderResource:block:", CFSTR("scn_bezier_curve_data"), 1, 0, v21);
  +[SCNMTLShaderBindingsGenerator registerArgument:frequency:needsRenderResource:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:needsRenderResource:block:", CFSTR("scn_bezier_curve_controlPoints"), 1, 0, v21);
  _Block_release(v21);
  return +[SCNMTLShaderBindingsGenerator registerUserBlockTrampoline:](SCNMTLShaderBindingsGenerator, "registerUserBlockTrampoline:", &__block_literal_global_294);
}

- (void)_executeDrawCommand:(id *)a3
{
  __C3DMaterial *var1;
  __C3DFXMetalProgram *var0;
  __C3DGeometry *var2;
  __C3DMesh *var4;
  __C3DMeshElement *var5;
  NSObject *v9;
  CFTypeID v10;
  __C3DFXMetalProgram *program;
  __C3DMesh *mesh;
  BOOL v14;
  uint64_t EffectiveDataKindForRendering;
  uint64_t Skinner;
  _BOOL4 v17;
  char v18;
  _BOOL4 v19;
  __C3DDeformerStack *DeformerStack;
  char v21;
  __C3DDeformerStack *v22;
  unsigned __int8 v23;
  SCNMTLMesh *v24;
  SCNMTLMesh *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  unsigned __int8 *v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unsigned __int8 *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  unsigned __int8 *v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  unsigned __int8 *v57;
  char v58;
  _BOOL4 v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 *WorldTransformPtr;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t eyeCount;
  uint64_t v75;
  unsigned __int8 *v76;
  uint64_t v77;
  float32x4_t *v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  unsigned __int8 *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  float32x4_t *v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  unsigned __int8 *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  float *v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  char v120;
  int v121;
  float v122;
  float32x4_t *v123;
  float32x4_t v124;
  float v125;
  float v126;
  float32x4_t v127;
  float32x4_t v128;
  float v129;
  double v130;
  __C3DMesh *v131;
  _BOOL4 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  SCNMTLMesh *metalMesh;
  int64_t currentFrameIndex;
  SCNMTLTessellator *v142;
  SCNMTLMeshElement *metalMeshElement;
  uint64_t v144;
  int v145;
  char v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSObject *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  SCNMTLMeshElement *v163;
  char v164;
  SCNMTLMeshElement *v165;
  SCNMTLMeshElement **p_metalMeshElement;
  CFIndex IndexOfElement;
  SCNMTLMeshElement *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  NSObject *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t PrimitiveRange;
  uint64_t v181;
  int Type;
  __C3DNode *v183;
  int v184;
  int v185;
  __C3DEffectCommonProfile *CommonProfile;
  _BOOL4 v188;
  uint64_t Count;
  _BOOL4 v190;
  int v192;
  SCNMTLMesh *v193;
  unint64_t v194;
  unint64_t v195;
  unint64_t vertexDescriptorHash;
  float v197;
  float v198;
  __C3DBlendStates *BlendStates;
  __C3DMaterial *v200;
  double v201;
  double v202;
  SCNMTLRenderCommandEncoder *renderEncoder;
  float32x4_t v204;
  uint32x4_t v205;
  int v206;
  __C3DFXMetalProgram *v207;
  int v208;
  int v209;
  __C3DBlendStates *v210;
  id v211;
  int IsWarmUp;
  int v213;
  char v214;
  char v215;
  SCNMTLMesh *v216;
  unsigned __int8 v217;
  unsigned __int8 renderMode;
  NSMutableDictionary *errors;
  SCNMTLResourceManager *resourceManager;
  SCNMTLRenderPipeline *renderPipeline;
  MTLRenderPipelineState *v222;
  SCNMTLRenderCommandEncoder *v223;
  SCNMTLRenderPipeline *v224;
  NSArray *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t i;
  void *v230;
  uint64_t v231;
  uint64_t Storage;
  uint64_t v233;
  uint64_t v234;
  id Weak;
  void *v236;
  uint64_t v237;
  uint64_t RenderGraph;
  void *TextureSampler;
  id TextureNamed;
  uint64_t v241;
  size_t v242;
  uint64_t v243;
  double v244;
  char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  void *v251;
  SCNMTLRenderCommandEncoder *v252;
  __int16 v253;
  BOOL *v254;
  BOOL *v255;
  __int16 v256;
  SCNMTLRenderCommandEncoder *v257;
  uint64_t v258;
  uint64_t v259;
  NSObject *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t Image;
  void *v264;
  uint64_t Texture;
  SCNMTLRenderCommandEncoder *v266;
  __int16 v267;
  char v268;
  SCNMTLShadable *v269;
  NSObject *v270;
  NSObject *v271;
  NSArray *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t j;
  void *v277;
  uint64_t v278;
  uint64_t v279;
  __C3DFXPassInstance *passInstance;
  uint64_t v281;
  SCNMTLRenderPipeline *v282;
  unint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t k;
  SCNMTLRenderCommandEncoder *v288;
  uint64_t v289;
  uint64_t v290;
  int v291;
  __C3DGeometry *v292;
  uint64_t v293;
  uint64_t v294;
  __C3DMaterial *v295;
  uint64_t v296;
  unint64_t v297;
  uint64_t v298;
  id *v299;
  float32x4_t v300;
  float32x4_t v301;
  float32x4_t v302;
  float32x4_t v303;
  uint64_t v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  SCNMTLRenderCommandEncoder *v314;
  uint64_t v315;
  uint64_t v316;
  __int16 v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t m;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t CurrentBatchNodes;
  size_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  SCNMTLRenderCommandEncoder *v330;
  uint64_t v331;
  uint64_t v332;
  int v333;
  NSObject *v334;
  uint64_t v335;
  NSObject *v336;
  double v337;
  int v338;
  SCNMTLRenderCommandEncoder *v339;
  uint64_t v340;
  uint64_t v341;
  __C3DNode *v342;
  SCNMTLRenderCommandEncoder *v343;
  MTLBuffer *buffer;
  unint64_t offset;
  $E8FEF9D34A3DFDCB69CDC2374B44012F sceneBuffer;
  uint64_t v347;
  int32x4_t v348;
  int32x4_t v349;
  float32x4_t v350;
  unint64_t v351;
  SCNMTLRenderCommandEncoder *v352;
  int v353;
  int v354;
  char v355;
  SCNMTLRenderCommandEncoder *v356;
  simd_float4 v357;
  uint64_t v358;
  uint64_t v359;
  SCNMTLTessellator *v360;
  __C3DMesh **v361;
  int8x8_t *v362;
  __C3DFXMetalProgram *v363;
  __C3DFXMetalProgram *v364;
  unsigned int v365;
  uint64_t *v366;
  __C3DGeometry *geometry;
  SCNMTLMesh *v368;
  __C3DGeometry *v369;
  uint64_t v370;
  __C3DNode *var3;
  __C3DMaterial *v372;
  unsigned int *var8;
  int EffectiveCalculationMode;
  id *p_resourceManagerMonitor;
  unsigned __int8 *v376;
  simd_float4 v377;
  simd_float4 v378;
  simd_float4 v379;
  simd_float4 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  _OWORD v385[2];
  int v386;
  int v387;
  SCNMTLRenderContext *v388;
  char v389;
  _DWORD v390[3];
  _QWORD v391[2];
  uint64_t (*v392)(uint64_t, float32x4_t *);
  void *v393;
  SCNMTLRenderContext *v394;
  uint64_t v395;
  uint64_t v396;
  unsigned int *v397;
  uint64_t v398;
  int v399;
  int v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  _BOOL8 v409;
  uint64_t v410;
  uint64_t v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  unint64_t v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  uint64_t v429;
  _QWORD v430[8];
  char v431;
  char v432;
  unsigned __int8 v433;
  char v434;
  unsigned __int8 v435;
  char v436;
  __int16 v437;
  NSMutableDictionary *v438;
  char v439;
  _BYTE v440[7];
  const void *v441;
  uint64_t v442;
  float32x4_t v443;
  _QWORD v444[3];
  int v445;
  BOOL v446;
  __int16 v447;
  char v448;
  __int128 v449[7];
  __int128 v450[12];
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  _BYTE v463[128];
  _BYTE v464[128];
  _BYTE v465[128];
  _BYTE v466[128];
  uint8_t v467[4];
  int v468;
  _BYTE v469[128];
  _BYTE v470[128];
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  uint64_t v479;
  simd_float4x4 v480;
  simd_float4x4 v481;

  v479 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  var3 = a3->var3;
  v372 = var1;
  var4 = a3->var4;
  var5 = a3->var5;
  v380.i64[0] = (uint64_t)a3->var7;
  var8 = a3->var8;
  v379.i32[0] = a3->var9;
  v362 = (int8x8_t *)a3;
  v377.i32[0] = a3->var10;
  if (var2 && C3DGeometryGetWantsHardwareTessellation(var2) && (self->_features & 0x10) != 0)
  {
    v378.i32[0] = (v362[9].i8[5] & 7) != 0;
    v365 = 1;
    if (var0)
      goto LABEL_10;
  }
  else
  {
    v365 = 0;
    v378.i32[0] = 0;
    if (var0)
      goto LABEL_10;
  }
  if ((-[SCNMTLRenderContext _executeDrawCommand:]::done & 1) == 0)
  {
    -[SCNMTLRenderContext _executeDrawCommand:]::done = 1;
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNMTLRenderContext _executeDrawCommand:].cold.10();
  }
  var0 = -[SCNMTLResourceManager defaultProgramUsingTessellation:](self->_resourceManager, "defaultProgramUsingTessellation:", v365);
LABEL_10:
  if (var2 && (C3DEntityGetShaderModifiers((uint64_t)var2) || C3DGeometryGetOverrideMaterial((uint64_t)var2)))
    v369 = var2;
  else
    v369 = 0;
  v10 = CFGetTypeID(var0);
  if (v10 != C3DFXMetalProgramGetTypeID())
    var0 = -[SCNMTLResourceManager defaultProgramUsingTessellation:](self->_resourceManager, "defaultProgramUsingTessellation:", v365);
  v376 = &self->_anon_3848[120];
  program = self->_cache.program;
  self->_cache.program = var0;
  mesh = self->_cache.mesh;
  v363 = program;
  v364 = var0;
  v14 = mesh != var4 || program != var0;
  if (var2)
    EffectiveDataKindForRendering = C3DGeometryGetEffectiveDataKindForRendering(var2);
  else
    EffectiveDataKindForRendering = 1;
  v361 = (__C3DMesh **)(v376 + 648);
  LODWORD(p_resourceManagerMonitor) = EffectiveDataKindForRendering;
  if (!var3)
  {
    if (self->_cache.deformers)
      v18 = 1;
    else
      v18 = v14;
    self->_cache.deformers = 0;
    if ((v18 & 1) != 0)
    {
      v17 = 0;
      v370 = 0;
      v19 = 0;
      EffectiveCalculationMode = -1;
      goto LABEL_44;
    }
    HIDWORD(v359) = 0;
    v17 = 0;
    v370 = 0;
    v24 = 0;
    LOBYTE(v19) = 0;
    EffectiveCalculationMode = -1;
    goto LABEL_51;
  }
  C3DNodeGetMorpher((uint64_t)var3);
  Skinner = C3DNodeGetSkinner((uint64_t)var3);
  v17 = Skinner != 0;
  v370 = Skinner;
  if (Skinner)
    EffectiveCalculationMode = C3DSkinnerGetEffectiveCalculationMode(Skinner, var2);
  else
    EffectiveCalculationMode = -1;
  DeformerStack = (__C3DDeformerStack *)C3DNodeGetDeformerStack((uint64_t)var3);
  v21 = self->_cache.deformers != DeformerStack || v14;
  self->_cache.deformers = DeformerStack;
  if (!DeformerStack || (v22 = DeformerStack, !C3DDeformerStackWantsGPU((uint64_t)DeformerStack)))
  {
    if ((v21 & 1) != 0)
    {
      v19 = 0;
      goto LABEL_44;
    }
    HIDWORD(v359) = 0;
    v24 = 0;
    LOBYTE(v19) = 0;
LABEL_51:
    if ((v365 & 1) != 0)
      goto LABEL_116;
LABEL_72:
    v58 = 0;
    v360 = 0;
    v59 = v376[760] == 0;
    v376[760] = 0;
    if (!v24)
      goto LABEL_129;
    goto LABEL_120;
  }
  if (v362[9].i8[2])
    v23 = 1;
  else
    v23 = C3DGeometryNeedsTexTangent((uint64_t)var2, 0);
  v60 = -[SCNMTLResourceManager renderResourceForDeformerStack:node:dataKind:](self->_resourceManager, "renderResourceForDeformerStack:node:dataKind:", v22, var3, EffectiveDataKindForRendering);
  if (-[SCNMTLDeformerStack computeDeformedMeshReliesOnTransforms]((_BOOL8)v60))
  {
    v409 = 0;
    C3DDynamicBatchingSystemGetCurrentBatchNodes((uint64_t)self->_processingContext.dynamicBatchingSystem, &v409);
    if (v409 >= 2)
    {
      v61 = scn_default_log();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
        -[SCNMTLRenderContext _executeDrawCommand:].cold.9(v61, v62, v63, v64, v65, v66, v67, v68);
    }
    WorldTransformPtr = (__int128 *)C3DTransformTreeGetWorldTransformPtr(self->_processingContext.transformTree, *((_DWORD *)var3 + 22));
    v70 = *WorldTransformPtr;
    v71 = WorldTransformPtr[1];
    v72 = WorldTransformPtr[2];
    v73 = WorldTransformPtr[3];
    *(_OWORD *)&self->_nodeUniforms.instanceNode = *WorldTransformPtr;
    *(_OWORD *)&self->_nodeUniforms.probeCacheIndex = v71;
    *(_OWORD *)&self->_anon_31b8[8] = v72;
    *(_OWORD *)&self->_anon_31b8[24] = v73;
    eyeCount = self->_renderPassParameters.eyeCount;
    *(_DWORD *)&self->_anon_31b8[1328] = 2;
    if (eyeCount)
    {
      v75 = 0;
      v76 = &self->_anon_8f0[4];
      do
      {
        v77 = 0;
        v78 = (float32x4_t *)&v76[704 * v75];
        v79 = *v78;
        v80 = v78[1];
        v81 = v78[2];
        v82 = v78[3];
        v471 = v70;
        v472 = v71;
        v473 = v72;
        v474 = v73;
        do
        {
          *(__int128 *)((char *)&v451 + v77) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(__int128 *)((char *)&v471 + v77))), v80, *(float32x2_t *)((char *)&v471 + v77), 1), v81, *(float32x4_t *)((char *)&v471 + v77), 2), v82, *(float32x4_t *)((char *)&v471 + v77), 3);
          v77 += 16;
        }
        while (v77 != 64);
        v83 = v452;
        v84 = v453;
        v85 = v454;
        v86 = &self->_anon_31b8[64 * v75 + 488];
        *(_OWORD *)v86 = v451;
        *((_OWORD *)v86 + 1) = v83;
        *((_OWORD *)v86 + 2) = v84;
        *((_OWORD *)v86 + 3) = v85;
        ++v75;
      }
      while (v75 != eyeCount);
      v87 = *(_DWORD *)&self->_anon_31b8[1328];
      if ((v87 & 4) == 0)
      {
        v88 = 0;
        *(_DWORD *)&self->_anon_31b8[1328] = v87 | 4;
        do
        {
          v89 = 0;
          v90 = (float32x4_t *)&v76[704 * v88];
          v91 = v90[12];
          v92 = v90[13];
          v93 = v90[14];
          v94 = v90[15];
          v471 = v70;
          v472 = v71;
          v473 = v72;
          v474 = v73;
          do
          {
            *(__int128 *)((char *)&v451 + v89) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v91, COERCE_FLOAT(*(__int128 *)((char *)&v471 + v89))), v92, *(float32x2_t *)((char *)&v471 + v89), 1), v93, *(float32x4_t *)((char *)&v471 + v89), 2), v94, *(float32x4_t *)((char *)&v471 + v89), 3);
            v89 += 16;
          }
          while (v89 != 64);
          v95 = v452;
          v96 = v453;
          v97 = v454;
          v98 = &self->_anon_31b8[64 * v88 + 872];
          *(_OWORD *)v98 = v451;
          *((_OWORD *)v98 + 1) = v95;
          *((_OWORD *)v98 + 2) = v96;
          *((_OWORD *)v98 + 3) = v97;
          ++v88;
        }
        while (v88 != eyeCount);
      }
    }
    else
    {
      *(_DWORD *)&self->_anon_31b8[1328] = 6;
    }
    v99 = *(_OWORD *)&self->_anon_31b8[504];
    v471 = *(_OWORD *)&self->_anon_31b8[488];
    v472 = v99;
    v100 = *(_OWORD *)&self->_anon_31b8[536];
    v473 = *(_OWORD *)&self->_anon_31b8[520];
    v474 = v100;
    v101 = *(_OWORD *)&self->_anon_31b8[888];
    v475 = *(_OWORD *)&self->_anon_31b8[872];
    v476 = v101;
    v102 = *(_OWORD *)&self->_anon_31b8[920];
    v477 = *(_OWORD *)&self->_anon_31b8[904];
    v478 = v102;
    v103 = *(_OWORD *)&self->_anon_8f0[132];
    v104 = *(_OWORD *)&self->_anon_8f0[148];
    v105 = *(_OWORD *)&self->_anon_8f0[164];
    v462 = *(_OWORD *)&self->_anon_8f0[180];
    v461 = v105;
    v460 = v104;
    v459 = v103;
    v454 = v474;
    v453 = v473;
    v452 = v472;
    v451 = v471;
    v458 = v478;
    v457 = v477;
    v456 = v476;
    v455 = v475;
  }
  if (-[SCNMTLDeformerStack computeDeformedMeshReliesOnFrustum]((_BOOL8)v60))
  {
    v106 = 0;
    *(_QWORD *)&v471 = *(_QWORD *)self->_renderSize;
    v107 = *(_OWORD *)&self->_anon_31b8[872];
    v108 = *(_OWORD *)&self->_anon_31b8[888];
    v109 = *(_OWORD *)&self->_anon_31b8[904];
    v110 = *(_OWORD *)&self->_anon_31b8[920];
    do
    {
      v111 = 0;
      v112 = (float *)((unint64_t)&v382 & 0xFFFFFFFFFFFFFFF3 | (4 * (v106 & 3)));
      v381 = v107;
      v113 = *(float *)((unint64_t)&v381 & 0xFFFFFFFFFFFFFFF3 | (4 * (v106 & 3)));
      v382 = v108;
      v114 = *((float *)&v108 + 3) - *v112;
      v115 = *((float *)&v108 + 3) + *v112;
      v383 = v109;
      v116 = *(float *)((unint64_t)&v383 & 0xFFFFFFFFFFFFFFF3 | (4 * (v106 & 3)));
      v384 = v110;
      v117 = *(float *)((unint64_t)&v384 & 0xFFFFFFFFFFFFFFF3 | (4 * (v106 & 3)));
      v118 = *((float *)&v109 + 3) - v116;
      v119 = *((float *)&v109 + 3) + v116;
      v120 = 1;
      do
      {
        v121 = v120 & 1;
        if ((v120 & 1) != 0)
          v122 = v113;
        else
          v122 = -v113;
        v123 = (float32x4_t *)(&v471 + (v111 | (2 * v106)));
        v124 = v123[1];
        v124.f32[0] = *((float *)&v107 + 3) + v122;
        if ((v120 & 1) != 0)
          v125 = v115;
        else
          v125 = v114;
        v124.f32[1] = v125;
        if ((v120 & 1) != 0)
          v126 = v119;
        else
          v126 = v118;
        v124.f32[2] = v126;
        v127 = vmulq_f32(v124, v124);
        v128 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v127.f32, 1);
        if ((v120 & 1) != 0)
          v129 = v117;
        else
          v129 = -v117;
        v124.f32[3] = *((float *)&v110 + 3) + v129;
        v123[1] = vmulq_n_f32(v124, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v127, 2), vaddq_f32(v127, v128)).f32[0]));
        v111 = 1;
        v120 = 0;
      }
      while (v121);
      ++v106;
    }
    while (v106 != 3);
  }
  v130 = CACurrentMediaTime();
  v409 = 0;
  v450[8] = v459;
  v450[9] = v460;
  v450[10] = v461;
  v450[11] = v462;
  v450[4] = v455;
  v450[5] = v456;
  v450[6] = v457;
  v450[7] = v458;
  v450[0] = v451;
  v450[1] = v452;
  v450[2] = v453;
  v450[3] = v454;
  v449[4] = v475;
  v449[5] = v476;
  v449[6] = v477;
  v449[0] = v471;
  v449[1] = v472;
  v449[3] = v474;
  v449[2] = v473;
  v24 = (SCNMTLMesh *)-[SCNMTLDeformerStack computeDeformedMeshForContext:programHashCodeRequirements:transforms:frustumInfo:status:]((uint64_t)v60, (uint64_t)self, v23, v450, v449, &v409);
  self->__engineStats->mrphTime = CACurrentMediaTime() - v130 + self->__engineStats->mrphTime;
  v19 = v409;
  if ((v21 & 1) != 0)
  {
    LODWORD(EffectiveDataKindForRendering) = (_DWORD)p_resourceManagerMonitor;
    if (v24)
    {
      *v361 = var4;
      v25 = v24;
LABEL_55:
      self->_cache.metalMesh = v24;
      HIDWORD(v359) = 1;
      v24 = v25;
      goto LABEL_56;
    }
LABEL_44:
    if (v362[9].i8[2] && (v365 & v378.i32[0] & 1) == 0)
      C3DMeshCreateTangentsIfNeeded((uint64_t)var4, EffectiveDataKindForRendering);
    *v361 = var4;
    if (var4)
      v24 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:]((uint64_t)self->_resourceManager, (uint64_t)var4, EffectiveDataKindForRendering);
    else
      v24 = 0;
    v25 = 0;
    goto LABEL_55;
  }
  HIDWORD(v359) = 0;
LABEL_56:
  if ((v365 & 1) == 0)
    goto LABEL_72;
  if (!v19)
    goto LABEL_116;
  v26 = self->_renderPassParameters.eyeCount;
  v27 = *(_DWORD *)&self->_anon_31b8[1328];
  if ((v27 & 2) == 0)
  {
    *(_DWORD *)&self->_anon_31b8[1328] = v27 | 2;
    if (!(_DWORD)v26)
    {
      if ((v27 & 4) == 0)
        *(_DWORD *)&self->_anon_31b8[1328] = v27 | 6;
      goto LABEL_115;
    }
    v28 = 0;
    v29 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
    v30 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
    v31 = *(_OWORD *)&self->_anon_31b8[8];
    v32 = *(_OWORD *)&self->_anon_31b8[24];
    do
    {
      v33 = 0;
      v34 = &self->_anon_8f0[704 * v28 + 4];
      v35 = *(float32x4_t *)v34;
      v36 = *((float32x4_t *)v34 + 1);
      v37 = *((float32x4_t *)v34 + 2);
      v38 = *((float32x4_t *)v34 + 3);
      v471 = v29;
      v472 = v30;
      v473 = v31;
      v474 = v32;
      do
      {
        *(__int128 *)((char *)&v451 + v33) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v35, COERCE_FLOAT(*(__int128 *)((char *)&v471 + v33))), v36, *(float32x2_t *)((char *)&v471 + v33), 1), v37, *(float32x4_t *)((char *)&v471 + v33), 2), v38, *(float32x4_t *)((char *)&v471 + v33), 3);
        v33 += 16;
      }
      while (v33 != 64);
      v39 = v452;
      v40 = v453;
      v41 = v454;
      v42 = &self->_anon_31b8[64 * v28 + 488];
      *(_OWORD *)v42 = v451;
      *((_OWORD *)v42 + 1) = v39;
      *((_OWORD *)v42 + 2) = v40;
      *((_OWORD *)v42 + 3) = v41;
      ++v28;
    }
    while (v28 != v26);
    v27 = *(_DWORD *)&self->_anon_31b8[1328];
  }
  if ((v27 & 4) == 0)
  {
    *(_DWORD *)&self->_anon_31b8[1328] = v27 | 4;
    if ((_DWORD)v26)
    {
      v43 = 0;
      v44 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
      v45 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
      v46 = *(_OWORD *)&self->_anon_31b8[8];
      v47 = *(_OWORD *)&self->_anon_31b8[24];
      do
      {
        v48 = 0;
        v49 = &self->_anon_8f0[704 * v43 + 4];
        v50 = *((float32x4_t *)v49 + 12);
        v51 = *((float32x4_t *)v49 + 13);
        v52 = *((float32x4_t *)v49 + 14);
        v53 = *((float32x4_t *)v49 + 15);
        v471 = v44;
        v472 = v45;
        v473 = v46;
        v474 = v47;
        do
        {
          *(__int128 *)((char *)&v451 + v48) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v50, COERCE_FLOAT(*(__int128 *)((char *)&v471 + v48))), v51, *(float32x2_t *)((char *)&v471 + v48), 1), v52, *(float32x4_t *)((char *)&v471 + v48), 2), v53, *(float32x4_t *)((char *)&v471 + v48), 3);
          v48 += 16;
        }
        while (v48 != 64);
        v54 = v452;
        v55 = v453;
        v56 = v454;
        v57 = &self->_anon_31b8[64 * v43 + 872];
        *(_OWORD *)v57 = v451;
        *((_OWORD *)v57 + 1) = v54;
        *((_OWORD *)v57 + 2) = v55;
        *((_OWORD *)v57 + 3) = v56;
        ++v43;
      }
      while (v43 != v26);
    }
  }
LABEL_115:
  LOBYTE(v19) = 1;
LABEL_116:
  v368 = v24;
  v131 = var4;
  v132 = v17;
  v133 = *(_OWORD *)&self->_anon_31b8[504];
  v451 = *(_OWORD *)&self->_anon_31b8[488];
  v452 = v133;
  v134 = *(_OWORD *)&self->_anon_31b8[536];
  v453 = *(_OWORD *)&self->_anon_31b8[520];
  v454 = v134;
  v135 = *(_OWORD *)&self->_anon_31b8[888];
  v455 = *(_OWORD *)&self->_anon_31b8[872];
  v456 = v135;
  v136 = *(_OWORD *)&self->_anon_31b8[920];
  v457 = *(_OWORD *)&self->_anon_31b8[904];
  v458 = v136;
  v137 = *(_OWORD *)&self->_anon_8f0[132];
  v138 = *(_OWORD *)&self->_anon_8f0[148];
  v139 = *(_OWORD *)&self->_anon_8f0[164];
  v462 = *(_OWORD *)&self->_anon_8f0[180];
  v461 = v139;
  v460 = v138;
  v459 = v137;
  metalMesh = self->_cache.metalMesh;
  currentFrameIndex = self->_currentFrameIndex;
  v142 = -[SCNMTLResourceManager renderResourceForTessellatedGeometry:]((uint64_t)self->_resourceManager, (uint64_t)var2);
  v444[0] = metalMesh;
  v444[1] = self;
  v444[2] = &v451;
  v445 = currentFrameIndex;
  v446 = v19;
  v447 = 0;
  v448 = 0;
  -[SCNMTLTessellator update:](v142, "update:", v444);
  metalMeshElement = self->_cache.metalMeshElement;
  v144 = v362[9].i8[5] & 7;
  v360 = v142;
  v145 = -[SCNMTLTessellator pipelineStateHashForMeshElement:patchType:](v142, "pipelineStateHashForMeshElement:patchType:", metalMeshElement, v144);
  v58 = v145;
  v59 = v376[760] == v145;
  v376[760] = v145;
  if (v378.i32[0])
  {
    self->_cache.meshElement = var5;
    self->_cache.metalMeshElement = 0;
    v146 = 1;
    v17 = v132;
    if (!var5)
      goto LABEL_148;
    goto LABEL_146;
  }
  v17 = v132;
  var4 = v131;
  v24 = v368;
  if (v368)
  {
LABEL_120:
    if (C3DGeometryUsesDeformerBasedDynamicMesh((uint64_t)var2))
    {
      if (var5)
      {
        v147 = scn_default_log();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT))
          -[SCNMTLRenderContext _executeDrawCommand:].cold.8(v147, v148, v149, v150, v151, v152, v153, v154);
      }
      if (C3DGeometryGetMeshElementCountForDeformerBasedDynamicMesh((uint64_t)var2) != 1)
      {
        v155 = scn_default_log();
        if (os_log_type_enabled(v155, OS_LOG_TYPE_FAULT))
          -[SCNMTLRenderContext _executeDrawCommand:].cold.7(v155, v156, v157, v158, v159, v160, v161, v162);
      }
      v163 = (SCNMTLMeshElement *)objc_msgSend((id)-[SCNMTLMesh elements]((uint64_t)v24), "objectAtIndexedSubscript:", 0);
      v146 = 0;
      self->_cache.meshElement = 0;
      self->_cache.metalMeshElement = v163;
      if (!var5)
        goto LABEL_148;
      goto LABEL_146;
    }
  }
LABEL_129:
  if (self->_cache.meshElement == var5)
    goto LABEL_145;
  v164 = v378.i8[0];
  if (!v24)
    v164 = 1;
  if ((v164 & 1) != 0)
  {
    self->_cache.meshElement = var5;
    if (var5)
    {
      v165 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)self->_resourceManager, (uint64_t)var5);
      p_metalMeshElement = &self->_cache.metalMeshElement;
      self->_cache.metalMeshElement = v165;
      if (v165)
        goto LABEL_142;
    }
    else
    {
      p_metalMeshElement = &self->_cache.metalMeshElement;
      self->_cache.metalMeshElement = 0;
    }
    v172 = scn_default_log();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_FAULT))
    {
      -[SCNMTLRenderContext _executeDrawCommand:].cold.6(v172, v173, v174, v175, v176, v177, v178, v179);
      if (!var5)
        goto LABEL_143;
    }
    else if (!var5)
    {
LABEL_143:
      v171 = (uint64_t)*p_metalMeshElement;
      goto LABEL_144;
    }
LABEL_142:
    PrimitiveRange = C3DMeshElementGetPrimitiveRange((uint64_t)var5);
    -[SCNMTLMeshElement setPrimitiveRange:](*p_metalMeshElement, PrimitiveRange, v181);
    goto LABEL_143;
  }
  IndexOfElement = C3DMeshGetIndexOfElement((uint64_t)var4, var5, (int)p_resourceManagerMonitor);
  if (IndexOfElement == -1)
    goto LABEL_145;
  v168 = (SCNMTLMeshElement *)objc_msgSend((id)-[SCNMTLMesh elements]((uint64_t)v24), "objectAtIndexedSubscript:", IndexOfElement);
  self->_cache.meshElement = var5;
  self->_cache.metalMeshElement = v168;
  if (-[SCNMTLMesh buffers]((uint64_t)v168))
    goto LABEL_145;
  v169 = C3DMeshElementGetPrimitiveRange((uint64_t)var5);
  -[SCNMTLMeshElement setPrimitiveRange:](v168, v169, v170);
  v171 = (uint64_t)v168;
LABEL_144:
  if (!-[SCNMTLMesh volatileBuffer](v171))
    return;
LABEL_145:
  v146 = 0;
  if (!var5)
  {
LABEL_148:
    v184 = 0;
    v183 = var3;
    goto LABEL_149;
  }
LABEL_146:
  Type = C3DMeshElementGetType((uint64_t)var5);
  v183 = var3;
  switch(Type)
  {
    case 0:
    case 1:
    case 5:
      goto LABEL_147;
    case 2:
      v184 = 2;
      break;
    case 3:
      v184 = 1;
      break;
    case 4:
      if ((v146 & 1) != 0)
      {
LABEL_147:
        v184 = 3;
      }
      else
      {
        v271 = scn_default_log();
        if (os_log_type_enabled(v271, OS_LOG_TYPE_ERROR))
          -[SCNMTLRenderContext _executeDrawCommand:].cold.5();
        v184 = 0;
      }
      break;
    default:
      goto LABEL_148;
  }
LABEL_149:
  v185 = v376[729];
  v376[729] = v184;
  CommonProfile = (__C3DEffectCommonProfile *)v372;
  v188 = self->_cache.material != v372 || v363 != v364;
  LODWORD(v368) = v188;
  self->_cache.material = v372;
  if (CommonProfile)
    CommonProfile = (__C3DEffectCommonProfile *)C3DMaterialGetCommonProfile((uint64_t)CommonProfile);
  self->_cache.commonProfile = CommonProfile;
  geometry = self->_cache.geometry;
  self->_cache.geometry = var2;
  Count = C3DSourceAccessorGetCount((uint64_t)self->_processingContext.dynamicBatchingSystem);
  v190 = EffectiveCalculationMode == 3 && v17;
  v192 = self->_cache.node != v183 || v363 != v364 || v190;
  if (Count > 1)
    v192 = 1;
  LODWORD(v359) = v192;
  self->_cache.node = v183;
  v193 = self->_cache.metalMesh;
  if (v365)
    v194 = (unint64_t)-[SCNMTLMesh tessellationVertexDescriptorHash](v193);
  else
    v194 = -[SCNMTLMesh vertexDescriptorHash]((uint64_t)v193);
  v195 = v194;
  vertexDescriptorHash = self->_cache.vertexDescriptorHash;
  self->_cache.vertexDescriptorHash = v194;
  v197 = 1.0;
  if (v183 && !v379.i32[0])
  {
    C3DNodeGetWorldAlpha((uint64_t)v183);
    v197 = v198;
  }
  v443 = 0uLL;
  if (v380.i64[0])
    BlendStates = (__C3DBlendStates *)C3DFXPassGetBlendStates(v380.i64[0]);
  else
    BlendStates = 0;
  v200 = v372;
  if (v372 && !BlendStates)
    BlendStates = (__C3DBlendStates *)C3DMaterialGetBlendStates((uint64_t)v372, v379.i32[0] != 0, v377.i32[0] != 0, (*((unsigned __int8 *)self + 152) >> 3) & 1, v443.f32, v197);
  if (BlendStates
    && C3DBlendStatesNeedsConstantColor((uint64_t)BlendStates)
    && (renderEncoder = self->_renderEncoder,
        v204 = v443,
        v205 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&renderEncoder->var10, v443)),
        (vmaxvq_u32(v205) & 0x80000000) != 0))
  {
    *(float32x4_t *)&renderEncoder->var10 = v443;
    v205.i32[0] = v204.i32[1];
    LODWORD(v202) = v204.i32[3];
    LODWORD(v201) = v204.i32[2];
    objc_msgSend((id)renderEncoder->var24[1], "setBlendColorRed:green:blue:alpha:", *(double *)v204.i64, *(double *)v205.i64, v201, v202);
    if (v200)
      goto LABEL_184;
  }
  else if (v372)
  {
LABEL_184:
    v206 = C3DMaterialGetColorBufferWriteMask((uint64_t)v200);
    goto LABEL_187;
  }
  v206 = 15;
LABEL_187:
  v207 = v363;
  if (v362[9].i8[4])
    v208 = 0;
  else
    v208 = v206;
  v209 = v376[728];
  v376[728] = v208;
  v210 = self->_cache.blendStates;
  self->_cache.blendStates = BlendStates;
  if (v207 == v364 && vertexDescriptorHash == v195 && v210 == BlendStates && v209 == v208 && v59 && v185 == v184)
    goto LABEL_213;
  if (v365)
    v211 = -[SCNMTLTessellator newPipelineStateConfiguratorForMeshElement:patchType:device:](v360, "newPipelineStateConfiguratorForMeshElement:patchType:device:", self->_cache.metalMeshElement, v362[9].i8[5] & 7, self->_device);
  else
    v211 = 0;
  IsWarmUp = C3DEngineContextIsWarmUp((uint64_t)self->_engineContext);
  v213 = IsWarmUp;
  if (*((char *)self + 152) < 0)
    v214 = 2;
  else
    v214 = IsWarmUp;
  if (self->_renderPassParameters.multiVertexOutputStreamGenerator == 2)
    v215 = 2;
  else
    v215 = 1;
  v216 = self->_cache.metalMesh;
  v217 = self->_renderPassParameters.eyeCount;
  renderMode = self->_renderPassParameters.renderMode;
  if (v376[896])
    errors = self->_compilationIssues.errors;
  else
    errors = 0;
  resourceManager = self->_resourceManager;
  v430[0] = v364;
  v430[1] = v372;
  v430[2] = v369;
  v430[3] = v380.i64[0];
  v430[4] = v380.i64[0];
  v430[5] = v216;
  v430[6] = BlendStates;
  v430[7] = var3;
  v431 = v208;
  v432 = v184;
  v433 = v217;
  v434 = v215;
  v435 = renderMode;
  v436 = v214;
  v437 = 0;
  v438 = errors;
  v439 = v58;
  memset(v440, 0, sizeof(v440));
  v441 = v211;
  v442 = 0;
  renderPipeline = -[SCNMTLResourceManager renderResourceForProgramDesc:renderPassDescriptor:](resourceManager, "renderResourceForProgramDesc:renderPassDescriptor:", v430, self->_currentRenderPassDescriptor, v359);
  self->_cache.renderPipeline = renderPipeline;
  if (v211)
  {
    _Block_release(v211);
    renderPipeline = self->_cache.renderPipeline;
  }
  if (-[SCNMTLRenderPipeline state](renderPipeline, "state"))
  {
    v222 = -[SCNMTLRenderPipeline state](self->_cache.renderPipeline, "state");
    v223 = self->_renderEncoder;
    if ((MTLRenderPipelineState *)v223->var23 != v222)
    {
      v223->var23 = (SCNMTLBufferPool *)v222;
      objc_msgSend((id)v223->var24[1], "setRenderPipelineState:", v222);
    }
LABEL_213:
    v429 = 1;
    v224 = self->_cache.renderPipeline;
    if (!v224 || !-[SCNMTLRenderPipeline state](v224, "state"))
      return;
    v427 = 0u;
    v428 = 0u;
    v425 = 0u;
    v426 = 0u;
    v225 = -[SCNMTLRenderPipeline frameBufferBindings](self->_cache.renderPipeline, "frameBufferBindings");
    v226 = -[NSArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v425, v470, 16);
    if (v226)
    {
      v227 = v226;
      v228 = *(_QWORD *)v426;
      do
      {
        for (i = 0; i != v227; ++i)
        {
          if (*(_QWORD *)v426 != v228)
            objc_enumerationMutation(v225);
          v230 = *(void **)(*((_QWORD *)&v425 + 1) + 8 * i);
          v231 = objc_msgSend(v230, "bindBlock", v359);
          (*(void (**)(uint64_t, void *, SCNMTLRenderContext *))(v231 + 16))(v231, v230, self);
        }
        v227 = -[NSArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v425, v470, 16);
      }
      while (v227);
    }
    if (-[SCNMTLRenderPipeline passBufferBindings](self->_cache.renderPipeline, "passBufferBindings", v359))
    {
      Storage = C3DFXPassGetStorage(v380.i64[0]);
      v421 = 0u;
      v422 = 0u;
      v423 = 0u;
      v424 = 0u;
      v377.i64[0] = (uint64_t)-[SCNMTLRenderPipeline passBufferBindings](self->_cache.renderPipeline, "passBufferBindings");
      v380.i64[0] = objc_msgSend((id)v377.i64[0], "countByEnumeratingWithState:objects:count:", &v421, v469, 16);
      if (v380.i64[0])
      {
        v379.i64[0] = *(_QWORD *)v422;
        p_resourceManagerMonitor = (id *)&self->_resourceManagerMonitor;
        v366 = (uint64_t *)&v468;
        do
        {
          v233 = 0;
          do
          {
            if (*(_QWORD *)v422 != v379.i64[0])
              objc_enumerationMutation((id)v377.i64[0]);
            v234 = *(_QWORD *)(*((_QWORD *)&v421 + 1) + 8 * v233);
            if (objc_msgSend((id)v234, "type"))
            {
              if (objc_msgSend((id)v234, "type") != 2)
                goto LABEL_277;
              Weak = objc_loadWeak(p_resourceManagerMonitor);
              v236 = Weak;
              v237 = *(_QWORD *)(v234 + 56);
              if (*(_DWORD *)(v237 + 16) == 1)
              {
                RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
                TextureSampler = *(void **)(v237 + 64);
                if (!TextureSampler)
                  TextureSampler = *(void **)(v237 + 56);
                TextureNamed = C3D::Pass::inputTextureNamed((C3D::Pass *)self->_processingContext.renderGraphPass, (const char *)objc_msgSend(TextureSampler, "UTF8String"));
                if (!TextureNamed)
                {
                  TextureNamed = (id)C3DRenderGraphGetTextureNamed(RenderGraph, objc_msgSend(TextureSampler, "UTF8String"));
                  if (!TextureNamed)
                  {
                    if (v236)
                    {
                      v241 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No registered texture for binding %@ and symbol \"%@\" in pass or render graph.\nPass: %s (%p)\nRender graph: %p"), v234, TextureSampler, (**(uint64_t (***)(void *))self->_processingContext.renderGraphPass)(self->_processingContext.renderGraphPass), self->_processingContext.renderGraphPass, RenderGraph);
                      goto LABEL_269;
                    }
LABEL_272:
                    TextureNamed = -[SCNMTLResourceManager defaultTexture](self->_resourceManager, "defaultTexture");
                  }
                }
LABEL_273:
                v266 = self->_renderEncoder;
                v267 = *(_WORD *)(v234 + 9);
                if ((_BYTE)v267 != 0xFF)
                  SCNMTLRenderCommandEncoder::setVertexTexture((uint64_t)self->_renderEncoder, TextureNamed, (char)v267);
                if ((~v267 & 0xFF00) != 0)
                  SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v266, TextureNamed, (uint64_t)v267 >> 8);
                goto LABEL_277;
              }
              if (Storage)
              {
                v248 = *(_QWORD *)(v237 + 88);
                v249 = *(_QWORD *)(Storage + v248);
                if (v249)
                {
                  TextureSampler = (void *)C3DFXSamplerGetTextureSampler(*(_QWORD *)(Storage + v248));
                  TextureNamed = (id)C3DFXSamplerGetTexture(v249);
                  if (TextureNamed
                    || (Image = C3DFXSamplerGetImage(v249)) != 0
                    && (TextureNamed = -[SCNMTLResourceManager renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:](self->_resourceManager, "renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:", Image, TextureSampler, 0, self->_engineContext, 0)) != 0)
                  {
                    if (*(unsigned __int8 *)(v234 + 12) != 255 || *(unsigned __int8 *)(v234 + 11) != 255)
                    {
                      v250 = -[SCNMTLResourceManager renderResourceForSampler:]((uint64_t)self->_resourceManager, (uint64_t)TextureSampler);
                      v251 = v250;
                      v252 = self->_renderEncoder;
                      v253 = *(_WORD *)(v234 + 9);
                      if (*(_BYTE *)(v234 + 9) != 0xFF)
                      {
                        v254 = &v252->var0 + 8 * (char)v253;
                        if (*((void **)v254 + 200) != v250)
                        {
                          *((_QWORD *)v254 + 200) = v250;
                          objc_msgSend((id)v252->var24[1], "setVertexSamplerState:atIndex:", v250, (char)v253);
                        }
                      }
                      if ((~v253 & 0xFF00) != 0)
                      {
                        v255 = &v252->var0 + 8 * ((uint64_t)v253 >> 8);
                        if (*((void **)v255 + 406) != v251)
                        {
                          *((_QWORD *)v255 + 406) = v251;
                          objc_msgSend((id)v252->var24[1], "setFragmentSamplerState:atIndex:", v251);
                        }
                      }
                    }
                    goto LABEL_273;
                  }
                  if (!v236)
                    goto LABEL_272;
                  v264 = (void *)MEMORY[0x1E0CB3940];
                  Texture = C3DFXSamplerGetTexture(v249);
                  v241 = objc_msgSend(v264, "stringWithFormat:", CFSTR("No texture or image provided for binding %@ by sampler %@.\nTexture: %@\nImage: %@"), v234, TextureSampler, Texture, C3DFXSamplerGetImage(v249));
LABEL_269:
                  v262 = v241;
                  goto LABEL_270;
                }
                if (!Weak)
                  goto LABEL_272;
                v261 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No sampler found for binding %@ and input %@"), v234, v237);
              }
              else
              {
                v260 = scn_default_log();
                if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
                {
                  -[SCNMTLRenderContext _executeDrawCommand:].cold.4(v467, (void *)v234, v366, v260);
                  if (!v236)
                    goto LABEL_272;
                }
                else if (!v236)
                {
                  goto LABEL_272;
                }
                v261 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No pass storage for binding %@"), v234, v358);
              }
              v262 = v261;
              TextureSampler = (void *)v234;
LABEL_270:
              TextureNamed = -[SCNMTLResourceManager defaultTexture](self->_resourceManager, "defaultTexture");
              objc_msgSend(v236, "renderContext:didFallbackToDefaultTextureForSource:message:", self, TextureSampler, v262);
              goto LABEL_273;
            }
            v242 = objc_msgSend((id)v234, "bufferSize");
            v378.i64[0] = (uint64_t)&v359;
            v244 = MEMORY[0x1E0C80A78](v242);
            v245 = (char *)&v359 - v243;
            if (Storage)
            {
              if (objc_msgSend((id)v234, "inputsCount", v244) >= 1)
              {
                v246 = 0;
                v247 = 0;
                do
                {
                  memcpy(&v245[*(unsigned int *)(*(_QWORD *)(v234 + 48) + v246 + 8)], (const void *)(Storage + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v234 + 48) + v246) + 88)), *(unsigned int *)(*(_QWORD *)(v234 + 48) + v246 + 12));
                  ++v247;
                  v246 += 16;
                }
                while (v247 < objc_msgSend((id)v234, "inputsCount"));
              }
            }
            else
            {
              bzero((char *)&v359 - v243, v242);
            }
            v256 = *(_WORD *)(v234 + 9);
            v257 = self->_renderEncoder;
            v451 = 0uLL;
            *(_QWORD *)&v452 = 0;
            SCNMTLBufferPool::allocateAndCopy((SCNMTLBufferPool *)v257->var25[0], v245, v242, (void **)&v451);
            v258 = *((_QWORD *)&v451 + 1);
            v259 = v452;
            if ((_BYTE)v256 != 0xFF)
              SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)v257, *((uint64_t *)&v451 + 1), v452, (char)v256);
            if ((~v256 & 0xFF00) != 0)
              SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v257, v258, v259, (uint64_t)v256 >> 8);
LABEL_277:
            ++v233;
          }
          while (v233 != v380.i64[0]);
          v380.i64[0] = objc_msgSend((id)v377.i64[0], "countByEnumeratingWithState:objects:count:", &v421, v469, 16);
        }
        while (v380.i64[0]);
      }
    }
    v268 = (char)v368;
    if (geometry != v369)
      v268 = 1;
    if ((v268 & 1) != 0 || v363 != v364)
    {
      v269 = self->_cache.material
           ? -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]((uint64_t)self->_resourceManager, v372, v369, self->_cache.renderPipeline, (uint64_t)self->_engineContext): 0;
      self->_cache.metalShadable = v269;
      v417 = 0u;
      v418 = 0u;
      v419 = 0u;
      v420 = 0u;
      v272 = -[SCNMTLRenderPipeline shadableBufferBindings](self->_cache.renderPipeline, "shadableBufferBindings");
      v273 = -[NSArray countByEnumeratingWithState:objects:count:](v272, "countByEnumeratingWithState:objects:count:", &v417, v466, 16);
      if (v273)
      {
        v274 = v273;
        v275 = *(_QWORD *)v418;
        do
        {
          for (j = 0; j != v274; ++j)
          {
            if (*(_QWORD *)v418 != v275)
              objc_enumerationMutation(v272);
            v277 = *(void **)(*((_QWORD *)&v417 + 1) + 8 * j);
            v278 = objc_msgSend(v277, "bindBlock");
            if (v278)
              (*(void (**)(uint64_t, void *, SCNMTLRenderContext *))(v278 + 16))(v278, v277, self);
          }
          v274 = -[NSArray countByEnumeratingWithState:objects:count:](v272, "countByEnumeratingWithState:objects:count:", &v417, v466, 16);
        }
        while (v274);
      }
    }
    v279 = v370;
    if (v362[9].i8[3])
    {
      if ((*((_BYTE *)self + 152) & 0x20) != 0)
      {
        self->_lighting.currentLightingSet = ($70A9FA8AEE5A0967CD526EFEAE98D222)vadd_s8(v362[6], (int8x8_t)-1);
      }
      else
      {
        passInstance = self->_processingContext.passInstance;
        v480.columns[3] = (simd_float4)*((_OWORD *)passInstance + 201);
        v480.columns[2] = (simd_float4)*((_OWORD *)passInstance + 200);
        v480.columns[1] = (simd_float4)*((_OWORD *)passInstance + 199);
        p_resourceManagerMonitor = (id *)passInstance;
        v480.columns[0] = (simd_float4)*((_OWORD *)passInstance + 198);
        v481 = __invert_f4(v480);
        v379 = v481.columns[1];
        v380 = v481.columns[0];
        v377 = v481.columns[3];
        v378 = v481.columns[2];
        v281 = (uint64_t)&v362[6];
        v282 = self->_cache.renderPipeline;
        v283 = *(_QWORD *)&v362[6] ^ (unint64_t)v282 ^ self->_renderPassParameters.eyeCount ^ (unint64_t)self->_renderPassParameters.renderMode;
        v416 = v283;
        if (self->_lighting.currentLightingHashKey != v283)
        {
          self->_lighting.currentLightingHashKey = v283;
          v368 = -[SCNMTLRenderPipeline lightBufferBindings](v282, "lightBufferBindings");
          if (v368)
          {
            C3DLightingSystemGetLightingSetDesc((uint64_t)self->_processingContext.lightingSystem, v281, (unint64_t *)&self->_lighting.currentLightingDesc);
            *(_QWORD *)&v451 = &v416;
            v372 = (__C3DMaterial *)std::__hash_table<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_lighting.frameLightingSetDatas, &v416, (uint64_t)&std::piecewise_construct, (_QWORD **)&v451);
            if (*((_QWORD *)v372 + 3))
            {
              v407 = 0u;
              v408 = 0u;
              v405 = 0u;
              v406 = 0u;
              v284 = -[SCNMTLMesh countByEnumeratingWithState:objects:count:](v368, "countByEnumeratingWithState:objects:count:", &v405, v464, 16);
              if (v284)
              {
                v285 = v284;
                v286 = *(_QWORD *)v406;
                do
                {
                  for (k = 0; k != v285; ++k)
                  {
                    if (*(_QWORD *)v406 != v286)
                      objc_enumerationMutation(v368);
                    v288 = self->_renderEncoder;
                    v289 = *((_QWORD *)v372 + 3);
                    v290 = *((_QWORD *)v372 + 4);
                    v291 = *(unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)&v405 + 1) + 8 * k) + 9);
                    if (*(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v405 + 1) + 8 * k) + 9) != 0xFF)
                      SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, *((_QWORD *)v372 + 3), *((_QWORD *)v372 + 4), (char)v291);
                    if ((~v291 & 0xFF00) != 0)
                      SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v288, v289, v290, (uint64_t)(__int16)v291 >> 8);
                  }
                  v285 = -[SCNMTLMesh countByEnumeratingWithState:objects:count:](v368, "countByEnumeratingWithState:objects:count:", &v405, v464, 16);
                }
                while (v285);
              }
            }
            else
            {
              v414 = 0u;
              v415 = 0u;
              v412 = 0u;
              v413 = 0u;
              geometry = (__C3DGeometry *)-[SCNMTLMesh countByEnumeratingWithState:objects:count:](v368, "countByEnumeratingWithState:objects:count:", &v412, v465, 16);
              if (geometry)
              {
                v366 = *(uint64_t **)v413;
                do
                {
                  v292 = 0;
                  do
                  {
                    if (*(uint64_t **)v413 != v366)
                      objc_enumerationMutation(v368);
                    v369 = v292;
                    v293 = *(_QWORD *)(*((_QWORD *)&v412 + 1) + 8 * (_QWORD)v292);
                    if (objc_msgSend((id)v293, "semanticsCount") >= 1)
                    {
                      v294 = objc_msgSend((id)v293, "bufferSize") * self->_renderPassParameters.eyeCount;
                      v295 = v372;
                      *((_QWORD *)v372 + 5) = v294;
                      v410 = 0;
                      v409 = 0;
                      v411 = 0;
                      SCNMTLBufferPool::allocate((SCNMTLBufferPool *)self->_frameConstantBufferPool, v294, &v409);
                      v296 = v411;
                      *((_QWORD *)v295 + 3) = v410;
                      *((_QWORD *)v295 + 4) = v296;
                      if (self->_renderPassParameters.eyeCount)
                      {
                        v297 = 0;
                        do
                        {
                          v298 = 0;
                          v299 = &p_resourceManagerMonitor[8 * v297];
                          v300 = *((float32x4_t *)v299 + 198);
                          v301 = *((float32x4_t *)v299 + 199);
                          v302 = *((float32x4_t *)v299 + 200);
                          v303 = *((float32x4_t *)v299 + 201);
                          v471 = (__int128)v380;
                          v472 = (__int128)v379;
                          v473 = (__int128)v378;
                          v474 = (__int128)v377;
                          do
                          {
                            *(__int128 *)((char *)&v451 + v298) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v300, COERCE_FLOAT(*(__int128 *)((char *)&v471 + v298))), v301, *(float32x2_t *)((char *)&v471 + v298), 1), v302, *(float32x4_t *)((char *)&v471 + v298), 2), v303, *(float32x4_t *)((char *)&v471 + v298), 3);
                            v298 += 16;
                          }
                          while (v298 != 64);
                          v304 = 0;
                          v305 = v452;
                          v306 = v453;
                          v307 = v454;
                          *(_OWORD *)&self->_lighting.needLightingSpaceTransformation = v451;
                          *(_OWORD *)&self->_anon_3848[8] = v305;
                          *(_OWORD *)&self->_anon_3848[24] = v306;
                          *(_OWORD *)&self->_anon_3848[40] = v307;
                          v471 = (__int128)v380;
                          v472 = (__int128)v379;
                          v473 = (__int128)v378;
                          v474 = (__int128)v377;
                          do
                          {
                            *(__int128 *)((char *)&v451 + v304) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v300, COERCE_FLOAT(*(__int128 *)((char *)&v471 + v304))), v301, *(float32x2_t *)((char *)&v471 + v304), 1), v302, *(float32x4_t *)((char *)&v471 + v304), 2), v303, *(float32x4_t *)((char *)&v471 + v304), 3);
                            v304 += 16;
                          }
                          while (v304 != 64);
                          v308 = v452;
                          v309 = v453;
                          v310 = v454;
                          *(_OWORD *)&self->_anon_3848[56] = v451;
                          *(_OWORD *)&self->_anon_3848[72] = v308;
                          *(_OWORD *)&self->_anon_3848[88] = v309;
                          *(_OWORD *)&self->_anon_3848[104] = v310;
                          *v376 = 1;
                          if (objc_msgSend((id)v293, "semanticsCount") >= 1)
                          {
                            v311 = 0;
                            v312 = 0;
                            do
                            {
                              (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(v293 + 48) + v311) + 16))();
                              ++v312;
                              v311 += 16;
                            }
                            while (v312 < objc_msgSend((id)v293, "semanticsCount"));
                          }
                          v313 = objc_msgSend((id)v293, "bufferSize");
                          v409 += v313;
                          ++v297;
                        }
                        while (v297 < self->_renderPassParameters.eyeCount);
                      }
                    }
                    v314 = self->_renderEncoder;
                    v315 = *((_QWORD *)v372 + 3);
                    v316 = *((_QWORD *)v372 + 4);
                    v317 = *(_WORD *)(v293 + 9);
                    if ((_BYTE)v317 != 0xFF)
                      SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, *((_QWORD *)v372 + 3), *((_QWORD *)v372 + 4), (char)v317);
                    if ((~v317 & 0xFF00) != 0)
                      SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v314, v315, v316, (uint64_t)v317 >> 8);
                    v292 = (__C3DGeometry *)((char *)&v369->var0.var0.var0 + 1);
                  }
                  while ((__C3DGeometry *)((char *)&v369->var0.var0.var0 + 1) != geometry);
                  geometry = (__C3DGeometry *)-[SCNMTLMesh countByEnumeratingWithState:objects:count:](v368, "countByEnumeratingWithState:objects:count:", &v412, v465, 16);
                }
                while (geometry);
              }
            }
          }
        }
        v279 = v370;
      }
    }
    if ((_DWORD)v359)
    {
      if ((*((_BYTE *)self + 152) & 0x20) != 0)
        *(_QWORD *)&self->_anon_31b8[1336] = var8;
      v403 = 0u;
      v404 = 0u;
      v401 = 0u;
      v402 = 0u;
      v380.i64[0] = (uint64_t)-[SCNMTLRenderPipeline nodeBufferBindings](self->_cache.renderPipeline, "nodeBufferBindings");
      v318 = objc_msgSend((id)v380.i64[0], "countByEnumeratingWithState:objects:count:", &v401, v463, 16);
      if (v318)
      {
        v319 = v318;
        v320 = *(_QWORD *)v402;
        v378.i64[0] = (uint64_t)&v471 + 4;
        v377.i64[0] = (uint64_t)&v409 + 1;
        v379.i64[0] = v320;
        do
        {
          for (m = 0; m != v319; ++m)
          {
            if (*(_QWORD *)v402 != v320)
              objc_enumerationMutation((id)v380.i64[0]);
            v322 = *(_QWORD *)(*((_QWORD *)&v401 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend((id)v322, "semanticsCount") < 1)
              {
                v336 = scn_default_log();
                if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR))
                  -[SCNMTLRenderContext _executeDrawCommand:].cold.2((uint8_t *)&v409, v377.i64[0], v336);
              }
              else
              {
                v323 = objc_msgSend((id)v322, "bufferSize");
                v324 = self->_renderPassParameters.eyeCount;
                v391[0] = MEMORY[0x1E0C809B0];
                v391[1] = 3221225472;
                v392 = __43__SCNMTLRenderContext__executeDrawCommand___block_invoke;
                v393 = &unk_1EA5A03C0;
                v396 = v279;
                v397 = var8;
                v399 = EffectiveCalculationMode;
                v400 = v324;
                v398 = v323;
                v394 = self;
                v395 = v322;
                CurrentBatchNodes = C3DDynamicBatchingSystemGetCurrentBatchNodes((uint64_t)self->_processingContext.dynamicBatchingSystem, &v429);
                v326 = v323 * v324;
                if (v429 < 2)
                {
                  v337 = MEMORY[0x1E0C80A78](CurrentBatchNodes);
                  ((void (*)(_QWORD *, __C3DNode *, char *, double))v392)(v391, var3, (char *)&v359 - ((v326 + 15) & 0xFFFFFFFFFFFFFFF0), v337);
                  v338 = *(unsigned __int16 *)(v322 + 9);
                  v339 = self->_renderEncoder;
                  v451 = 0uLL;
                  *(_QWORD *)&v452 = 0;
                  SCNMTLBufferPool::allocateAndCopy((SCNMTLBufferPool *)v339->var25[0], (char *)&v359 - ((v326 + 15) & 0xFFFFFFFFFFFFFFF0), v326, (void **)&v451);
                  v340 = *((_QWORD *)&v451 + 1);
                  v341 = v452;
                  if ((_BYTE)v338 != 0xFF)
                    SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)v339, *((uint64_t *)&v451 + 1), v452, (char)v338);
                  if ((~v338 & 0xFF00) != 0)
                    SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v339, v340, v341, (uint64_t)(__int16)v338 >> 8);
                  v279 = v370;
                }
                else
                {
                  v327 = CurrentBatchNodes;
                  v451 = 0uLL;
                  *(_QWORD *)&v452 = 0;
                  SCNMTLBufferPool::allocate((SCNMTLBufferPool *)self->_frameConstantBufferPool, v429 * v326, &v451);
                  if (v429 >= 1)
                  {
                    v328 = 0;
                    v329 = v451;
                    do
                    {
                      ((void (*)(_QWORD *, _QWORD, uint64_t))v392)(v391, *(_QWORD *)(v327 + 8 * v328), v329);
                      v329 += v326;
                      ++v328;
                    }
                    while (v328 < v429);
                  }
                  v330 = self->_renderEncoder;
                  v331 = *((_QWORD *)&v451 + 1);
                  v332 = v452;
                  v333 = *(unsigned __int16 *)(v322 + 9);
                  if (*(_BYTE *)(v322 + 9) != 0xFF)
                    SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, *((uint64_t *)&v451 + 1), v452, (char)v333);
                  if ((~v333 & 0xFF00) != 0)
                    SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v330, v331, v332, (uint64_t)(__int16)v333 >> 8);
                }
                v320 = v379.i64[0];
              }
            }
            else
            {
              if (!objc_msgSend((id)v322, "bindBlock"))
              {
                v334 = scn_default_log();
                if (os_log_type_enabled(v334, OS_LOG_TYPE_FAULT))
                  -[SCNMTLRenderContext _executeDrawCommand:].cold.3((uint8_t *)&v471, v378.i64[0], v334);
              }
              v335 = objc_msgSend((id)v322, "bindBlock");
              (*(void (**)(uint64_t, uint64_t, SCNMTLRenderContext *))(v335 + 16))(v335, v322, self);
            }
          }
          v319 = objc_msgSend((id)v380.i64[0], "countByEnumeratingWithState:objects:count:", &v401, v463, 16);
        }
        while (v319);
      }
    }
    v342 = var3;
    if (v363 != v364)
    {
      v343 = self->_renderEncoder;
      buffer = self->_sceneUniforms.buffer;
      offset = self->_sceneUniforms.offset;
      sceneBuffer = self->_cache.renderPipeline->_sceneBuffer;
      if (sceneBuffer.vertexIndex != -1)
        SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, (uint64_t)self->_sceneUniforms.buffer, self->_sceneUniforms.offset, sceneBuffer.vertexIndex);
      if ((~*(_WORD *)&sceneBuffer & 0xFF00) != 0)
        SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v343, (uint64_t)buffer, offset, (uint64_t)*(__int16 *)&sceneBuffer >> 8);
    }
    v347 = v429;
    if (v342 && v429 <= 1)
    {
      v348 = *(int32x4_t *)&self->_nodeUniforms.probeCacheIndex;
      v349 = *(int32x4_t *)&self->_anon_31b8[8];
      v350 = vmulq_f32(*(float32x4_t *)&self->_nodeUniforms.instanceNode, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v349, (int8x16_t)v349, 0xCuLL), (int8x16_t)v349, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v348, v348), (int8x16_t)v348, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v349, v349), (int8x16_t)v349, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v348, (int8x16_t)v348, 0xCuLL), (int8x16_t)v348, 8uLL)));
      v351 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v350, 2), vaddq_f32(v350, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v350.f32, 1))).f32[0] > 0.0;
      v352 = self->_renderEncoder;
      v353 = HIDWORD(v359);
      if (v352->var0)
        v351 = *((_QWORD *)&xmmword_1DD009B50 + v351);
      if (v352->var1 == v351)
        goto LABEL_393;
    }
    else
    {
      v352 = self->_renderEncoder;
      v351 = !v352->var0;
      v353 = HIDWORD(v359);
      if (v352->var1 == v351)
      {
LABEL_393:
        if (v353)
        {
          -[SCNMTLRenderContext _setMeshBuffers:]((uint64_t)self, (uint64_t)self->_cache.metalMesh);
          v347 = v429;
        }
        if (v347 <= 1)
          v347 = -[SCNMTLResourceManager stats]((uint64_t)self->_cache.metalMeshElement);
        if (v365)
        {
          if (v347 <= 1)
            v354 = 1;
          else
            v354 = v347;
          v355 = v362[9].i8[5] & 7;
          v356 = self->_renderEncoder;
          v357 = *(simd_float4 *)v361;
          v379 = *(simd_float4 *)(v376 + 664);
          v380 = v357;
          SCNMTLRenderCommandEncoder::_bindPendingTextures(v356);
          SCNMTLRenderCommandEncoder::applyChangedStates(v356);
          v385[0] = v380;
          v385[1] = v379;
          v386 = v354;
          v387 = 0;
          v388 = self;
          v389 = v355;
          v390[0] = 0;
          *(_DWORD *)((char *)v390 + 3) = 0;
          -[SCNMTLTessellator draw:](v360, "draw:", v385);
        }
        else
        {
          -[SCNMTLRenderContext _drawMeshElement:instanceCount:]((uint64_t)self, (uint64_t)self->_cache.metalMeshElement, v347);
        }
        return;
      }
    }
    v352->var1 = v351;
    v352->var5 = 1;
    goto LABEL_393;
  }
  self->_cache.renderPipeline = 0;
  self->_cache.program = 0;
  if (v213)
  {
    if (v372)
      -[SCNMTLRenderContext _prepareMaterialTextures:](self, "_prepareMaterialTextures:");
  }
  else if ((-[SCNMTLRenderContext _executeDrawCommand:]::done & 1) == 0)
  {
    -[SCNMTLRenderContext _executeDrawCommand:]::done = 1;
    v270 = scn_default_log();
    if (os_log_type_enabled(v270, OS_LOG_TYPE_ERROR))
      -[SCNMTLRenderContext _executeDrawCommand:].cold.1();
  }
}

uint64_t __43__SCNMTLRenderContext__executeDrawCommand___block_invoke(uint64_t result, float32x4_t *a2)
{
  uint64_t v2;
  _OWORD *WorldTransformPtr;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t JointMatrices;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int32x4_t v20;
  int32x4_t v21;
  float32x2x2_t v22;
  float32x2x2_t v23;
  int32x4_t v24;
  int32x4_t v25;
  float32x4_t *v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float *v31;
  float *v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _OWORD *v43;
  _OWORD *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  _BYTE v49[32];
  _OWORD v50[2];
  _OWORD v51[4];

  v2 = result;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 14048) = a2;
  if (a2)
  {
    WorldTransformPtr = (_OWORD *)C3DTransformTreeGetWorldTransformPtr(*(__C3DTransformTree **)(*(_QWORD *)(result + 32) + 2272), a2[5].i32[2]);
    v5 = WorldTransformPtr[1];
    v6 = WorldTransformPtr[2];
    v7 = WorldTransformPtr[3];
    v8 = *(_OWORD **)(v2 + 32);
    v8[794] = *WorldTransformPtr;
    v8[795] = v5;
    v8[796] = v6;
    v8[797] = v7;
    v9 = *(_QWORD *)(v2 + 48);
    if (v9 && *(_DWORD *)(v2 + 72) == 3)
    {
      v48 = 0;
      JointMatrices = C3DSkinnerGetJointMatrices(v9, &v48);
      if (v48 != 3)
      {
        v11 = scn_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          __43__SCNMTLRenderContext__executeDrawCommand___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      v19 = 0;
      v20 = *(int32x4_t *)(JointMatrices + 16);
      v21 = *(int32x4_t *)(JointMatrices + 32);
      v22 = (float32x2x2_t)vzip1q_s32(*(int32x4_t *)JointMatrices, v21);
      v23 = (float32x2x2_t)vzip2q_s32(*(int32x4_t *)JointMatrices, v21);
      v24 = vzip1q_s32(v20, (int32x4_t)0);
      v25 = vzip2q_s32(v20, (int32x4_t)xmmword_1DD007610);
      v26 = *(float32x4_t **)(v2 + 32);
      v27 = v26[794];
      v28 = v26[795];
      v29 = v26[796];
      v30 = v26[797];
      v31 = (float *)v49;
      vst2_f32(v31, v22);
      v31 += 4;
      *(int32x4_t *)v31 = vzip2q_s32((int32x4_t)v22, v24);
      v32 = (float *)v50;
      vst2_f32(v32, v23);
      v50[1] = vzip2q_s32((int32x4_t)v23, v25);
      do
      {
        v51[v19 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)&v49[v19])), v28, *(float32x2_t *)&v49[v19], 1), v29, *(float32x4_t *)&v49[v19], 2), v30, *(float32x4_t *)&v49[v19], 3);
        v19 += 16;
      }
      while (v19 != 64);
      v33 = (float32x4_t)v51[1];
      v34 = (float32x4_t)v51[2];
      v35 = (float32x4_t)v51[3];
      v26[794] = (float32x4_t)v51[0];
      v26[795] = v33;
      v26[796] = v34;
      v26[797] = v35;
    }
    result = (uint64_t)C3DNodeGetLastFrameWorldMatrix(a2);
    v36 = *(_OWORD *)(result + 16);
    v37 = *(_OWORD *)(result + 32);
    v38 = *(_OWORD *)(result + 48);
    v39 = *(_OWORD **)(v2 + 32);
    v39[798] = *(_OWORD *)result;
    v39[799] = v36;
    v39[800] = v37;
    v39[801] = v38;
  }
  else
  {
    v40 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v41 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    v42 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
    v43 = *(_OWORD **)(result + 32);
    v43[794] = *MEMORY[0x1E0C83FF0];
    v43[795] = v40;
    v43[796] = v41;
    v43[797] = v42;
    v44 = *(_OWORD **)(result + 32);
    v44[801] = v44[797];
    v44[800] = v44[796];
    v44[799] = v44[795];
    v44[798] = v44[794];
  }
  *(_DWORD *)(*(_QWORD *)(v2 + 32) + 14056) = 0;
  *(_QWORD *)(*(_QWORD *)(v2 + 32) + 14064) = *(_QWORD *)(v2 + 56);
  if (*(_DWORD *)(v2 + 76))
  {
    v45 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v2 + 40), "semanticsCount");
      if (result >= 1)
      {
        v46 = 0;
        for (i = 0; i < result; ++i)
        {
          (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 48) + v46) + 16))();
          result = objc_msgSend(*(id *)(v2 + 40), "semanticsCount");
          v46 += 16;
        }
      }
      ++v45;
    }
    while (v45 < *(unsigned int *)(v2 + 76));
  }
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  float32x4_t *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  uint64_t v22;
  __n128 result;
  __int128 v24;
  __int128 v25;
  _OWORD v26[4];
  _OWORD v27[4];

  v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 2) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 2;
    if (a6)
    {
      v7 = 0;
      v8 = *(_OWORD *)(a4 + 12704);
      v9 = *(_OWORD *)(a4 + 12720);
      v10 = *(_OWORD *)(a4 + 12736);
      v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        v12 = 0;
        v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        v14 = *v13;
        v15 = v13[1];
        v16 = v13[2];
        v17 = v13[3];
        v26[0] = v8;
        v26[1] = v9;
        v26[2] = v10;
        v26[3] = v11;
        do
        {
          v27[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v26[v12])), v15, *(float32x2_t *)&v26[v12], 1), v16, (float32x4_t)v26[v12], 2), v17, (float32x4_t)v26[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        v18 = v27[1];
        v19 = v27[2];
        v20 = v27[3];
        v21 = (_OWORD *)(a4 + 13216 + (v7 << 6));
        *v21 = v27[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  v22 = a4 + ((unint64_t)a5 << 6);
  result = *(__n128 *)(v22 + 13216);
  v24 = *(_OWORD *)(v22 + 13232);
  v25 = *(_OWORD *)(v22 + 13264);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v22 + 13248);
  *(_OWORD *)(a2 + 48) = v25;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v24;
  return result;
}

- (double)processRendererElements:(unsigned int)a3 count:(uint64_t)a4 engineIterationContext:
{
  unsigned __int8 **v4;
  unint64_t v8;
  uint64_t v9;
  uint64_t WarmUpAbortHandler;
  uint64_t v11;
  uint64_t v12;
  int MaxDrawingCommand;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t Element;
  uint64_t v19;
  uint64_t v20;
  _QWORD *Pass;
  uint64_t ProgramHashCodeForRenderElement;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  C3D::RenderGraph *RenderGraph;
  uint64_t v28;
  uint64_t v29;
  int isMainPass;
  int v31;
  uint64_t v32;
  double result;
  char v34;
  unsigned int v35;
  unsigned __int8 **v36;
  unint64_t v37;
  _QWORD *DynamicBatchingSystem;
  uint64_t v39;
  uint64_t ProgramHashCodeStore;
  uint64_t v41;
  uint8_t v42[4];
  _DWORD v43[7];

  *(_QWORD *)&v43[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (unsigned __int8 **)a4;
    v8 = *(_QWORD *)(a4 + 8);
    C3DEngineContextGetFXContext(v8);
    v9 = (uint64_t)v4[2];
    v41 = *((_QWORD *)*v4 + 6);
    WarmUpAbortHandler = C3DEngineContextGetWarmUpAbortHandler(v8);
    ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(v8);
    v11 = *(_QWORD *)(a1 + 15544);
    if ((v11 & 2) != 0)
    {
      v12 = *(_QWORD *)(a1 + 248);
      if (!*(_BYTE *)(v12 + 74) && *(_QWORD *)(v12 + 24) != 1)
      {
        *(_QWORD *)(v12 + 24) = 1;
        *(_BYTE *)(v12 + 42) = 1;
      }
      *(_BYTE *)(v12 + 74) = 1;
    }
    -[SCNMTLRenderContext startProcessingRendererElementsWithEngineIterationContext:](a1, (uint64_t)v4);
    MaxDrawingCommand = C3DEngineContextGetMaxDrawingCommand(v8);
    DynamicBatchingSystem = (_QWORD *)C3DSceneGetDynamicBatchingSystem(*(_QWORD *)(v9 + 4808));
    if (a3)
    {
      v36 = v4;
      v37 = a2;
      v39 = 0;
      v14 = 0;
      v34 = v11;
      v35 = a3;
      v15 = a3;
      v16 = (unsigned int *)a2;
      while (1)
      {
        v17 = *v16++;
        v8 = v8 & 0xFFFFFFFF00000000 | v17;
        Element = C3DRendererElementStoreGetElement(v41, v8);
        v19 = *(_QWORD *)(a1 + 2256);
        if (v19)
          v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v19 + 80))(v19);
        else
          v20 = 0;
        Pass = (_QWORD *)C3DFXPassInstanceGetPass(v9);
        ProgramHashCodeForRenderElement = C3DProgramHashCodeStoreGetProgramHashCodeForRenderElement(ProgramHashCodeStore, (unsigned __int16 *)Element, Pass, v20);
        v23 = ProgramHashCodeForRenderElement;
        if (!v14)
          goto LABEL_24;
        if (*(_QWORD *)(v14 + 16) != *(_QWORD *)(Element + 16) || *(_QWORD *)(v14 + 24) != *(_QWORD *)(Element + 24))
          break;
        v24 = v39 == ProgramHashCodeForRenderElement && *(_QWORD *)(v14 + 48) == *(_QWORD *)(Element + 48);
        if (!v24
          || *(_QWORD *)(v14 + 56) != *(_QWORD *)(Element + 56)
          || !C3DDynamicBatchingSystemCurrentBatchAppend(DynamicBatchingSystem, *(_QWORD *)(Element + 8)))
        {
          break;
        }
        Element = v14;
LABEL_37:
        if (!--v15)
        {
LABEL_38:
          v4 = v36;
          a2 = v37;
          a3 = v35;
          LOBYTE(v11) = v34;
          if (Element)
          {
            _processRendererElement((SCNMTLRenderContext *)a1, (__C3DRendererElement *)Element, (__C3DFXPassInstance *)v9);
            C3DDynamicBatchingSystemCurrentBatchReset((uint64_t)DynamicBatchingSystem);
          }
          goto LABEL_40;
        }
      }
      _processRendererElement((SCNMTLRenderContext *)a1, (__C3DRendererElement *)v14, (__C3DFXPassInstance *)v9);
      C3DDynamicBatchingSystemCurrentBatchReset((uint64_t)DynamicBatchingSystem);
      v39 = 0;
LABEL_24:
      if (!MaxDrawingCommand
        && v23
        && C3DProgramHashCodeUseDynamicBatching(v23)
        && (v25 = *(_QWORD *)(Element + 16)) != 0
        && C3DGeometryIsDynamicBatchingEnabled(v25))
      {
        if ((C3DProgramHashCodeUseDynamicBatching(v23) & 1) == 0)
        {
          v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[SCNMTLRenderContext processRendererElements:count:engineIterationContext:].cold.1(v42, v43, v26);
        }
        C3DDynamicBatchingSystemCurrentBatchAppend(DynamicBatchingSystem, *(_QWORD *)(Element + 8));
        v39 = v23;
        if (!WarmUpAbortHandler)
          goto LABEL_36;
      }
      else
      {
        _processRendererElement((SCNMTLRenderContext *)a1, (__C3DRendererElement *)Element, (__C3DFXPassInstance *)v9);
        Element = 0;
        if (!WarmUpAbortHandler)
        {
LABEL_36:
          ++*(_DWORD *)(*(_QWORD *)(a1 + 16) + 12);
          v14 = Element;
          goto LABEL_37;
        }
      }
      if (((*(uint64_t (**)(uint64_t))(WarmUpAbortHandler + 16))(WarmUpAbortHandler) & 1) != 0)
        goto LABEL_38;
      goto LABEL_36;
    }
LABEL_40:
    RenderGraph = (C3D::RenderGraph *)C3DEngineContextGetRenderGraph(*(_QWORD *)(a1 + 144));
    v28 = *(_QWORD *)(a1 + 2256);
    if (v28)
      v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v28 + 64))(v28);
    else
      v29 = 0;
    isMainPass = C3D::RenderGraph::isMainPass(RenderGraph, v29);
    v31 = isMainPass;
    if ((*(_BYTE *)(a1 + 15544) & 4) != 0 && isMainPass)
      -[SCNMTLRenderContext drawWireframeOverlayForElements:range:store:passInstance:](a1, a2, 0, a3, v41, v4[2]);
    if ((v11 & 2) != 0)
    {
      v32 = *(_QWORD *)(a1 + 248);
      *(_BYTE *)(v32 + 74) = 0;
      if (*(_QWORD *)(v32 + 24))
      {
        *(_QWORD *)(v32 + 24) = 0;
        *(_BYTE *)(v32 + 42) = 1;
      }
    }
    return -[SCNMTLRenderContext stopProcessingRendererElements:](a1, v31);
  }
  return result;
}

- (void)drawRenderElement:(uint64_t)a3 withPass:
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t Node;
  uint64_t Geometry;
  uint64_t Mesh;
  const void *MeshElement;
  int DrawInstruction;
  _QWORD *v19;
  int IsOpaque;
  uint64_t v21;
  char v22;
  float v23;
  uint64_t CommonProfile;
  float *v25;
  int TransparencyMode;
  uint64_t RasterizerStates;
  int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float ConstantAlpha;
  uint64_t v44;
  char v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const void *v51;
  char v52;
  char v53;
  _QWORD v54[3];
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[9];
  char v60;
  char v61;
  char v62;
  BOOL v63;
  BOOL v64;
  char v65;
  __int16 v66;
  _QWORD v67[9];
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  __int16 v74;
  _QWORD v75[9];
  char v76;
  char v77;
  char v78;
  BOOL v79;
  char v80;
  char v81;
  __int16 v82;
  _QWORD v83[9];
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  char v89;
  __int16 v90;
  _QWORD v91[9];
  char v92;
  char v93;
  char v94;
  BOOL v95;
  char v96;
  char v97;
  __int16 v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!*(_QWORD *)(a1 + 144))
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCNMTLRenderContext drawRenderElement:withPass:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  Node = C3DRendererElementGetNode(a2);
  Geometry = C3DRendererElementGetGeometry(a2);
  Mesh = C3DRendererElementGetMesh(a2);
  MeshElement = C3DRendererElementGetMeshElement(a2);
  v57 = 0;
  v58 = 0;
  v56 = 0;
  if (a3)
  {
    DrawInstruction = C3DFXPassGetDrawInstruction(a3);
    v19 = (_QWORD *)a3;
    if (DrawInstruction == 2)
    {
      v19 = (_QWORD *)a3;
      if ((*(_BYTE *)(Node + 221) & 0x10) != 0)
        v19 = *(_QWORD **)(a1 + 2248);
    }
  }
  else
  {
    v19 = 0;
  }
  C3DEnginePipelineGetRenderComponentsForRenderPass(a2, v19, *(_QWORD *)(a1 + 144), &v58, &v56, &v57, 0);
  IsOpaque = C3DRendererElementIsOpaque(a2);
  v21 = v56;
  if (!IsOpaque || !v56)
  {
    if ((IsOpaque & 1) != 0)
    {
      LODWORD(v50) = 0;
      v22 = 1;
      goto LABEL_25;
    }
    goto LABEL_16;
  }
  if ((C3DProgramHashCodeIsOpaque(v56) & 1) == 0)
  {
LABEL_16:
    if (Node)
    {
      C3DNodeGetWorldAlpha(Node);
      if (v23 <= 0.0)
        return;
    }
    if (!v56)
    {
      v50 = 0;
      v53 = 0;
      goto LABEL_30;
    }
    CommonProfile = C3DMaterialGetCommonProfile(v58);
    if (CommonProfile)
    {
      v25 = (float *)CommonProfile;
      TransparencyMode = C3DEffectCommonProfileGetTransparencyMode(CommonProfile);
      LODWORD(v50) = TransparencyMode;
      if (C3DProgramHashCodeHasShaderModifiers(v56))
      {
        v22 = 0;
      }
      else
      {
        ConstantAlpha = C3DEffectCommonProfileGetConstantAlpha(v25);
        v22 = 0;
        if (TransparencyMode != 1 && ConstantAlpha <= 0.0)
          return;
      }
    }
    else
    {
      v22 = 0;
      LODWORD(v50) = 0;
    }
    goto LABEL_24;
  }
  LODWORD(v50) = 0;
  v22 = 1;
LABEL_24:
  v21 = v56;
LABEL_25:
  v53 = v22;
  if (v21)
  {
    BYTE4(v50) = C3DProgramHashCodeHasConstantAlpha(v21);
    if (v56)
    {
      v52 = C3DProgramHashCodeNeedTangents(v56);
      if (!a3)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else
  {
    BYTE4(v50) = 0;
  }
LABEL_30:
  v52 = 0;
  if (!a3)
    goto LABEL_32;
LABEL_31:
  RasterizerStates = C3DFXPassGetRasterizerStates(a3);
  if (RasterizerStates)
  {
LABEL_33:
    -[SCNMTLRenderContext setRasterizerStates:](a1, RasterizerStates);
    v28 = 0;
    goto LABEL_35;
  }
LABEL_32:
  RasterizerStates = C3DRendererElementGetRaterizerStates(a2);
  if (RasterizerStates)
    goto LABEL_33;
  v28 = 1;
LABEL_35:
  v29 = a2 + 68;
  v30 = *(unsigned __int16 *)(a2 + 72);
  v51 = MeshElement;
  v31 = Node;
  v32 = (v30 & 0x40) != 0 && *(_BYTE *)(a1 + 2264) != 0;
  v34 = v57;
  v33 = v58;
  v35 = (v30 >> 14) & 1;
  v36 = (v30 >> 11) & 7;
  v37 = *(_QWORD *)(a2 + 56);
  if ((v53 & 1) != 0 || *(_BYTE *)(*(_QWORD *)(a1 + 2224) + 4769))
    goto LABEL_40;
  if ((_DWORD)v50 == 2)
  {
    v75[0] = v57;
    v75[1] = v58;
    v75[2] = Geometry;
    v75[3] = v31;
    v75[4] = Mesh;
    v75[5] = v51;
    v75[6] = v37;
    v75[7] = a3;
    v75[8] = v29;
    v76 = v53;
    v77 = BYTE4(v50);
    v78 = v52;
    v79 = v32;
    v80 = 1;
    v81 = (v30 >> 11) & 7;
    v82 = 0;
    LOBYTE(v50) = v32;
    v49 = v29;
    v47 = v81;
    objc_msgSend((id)a1, "_executeDrawCommand:", v75);
    v67[0] = v34;
    v67[1] = v33;
    v67[2] = Geometry;
    v67[3] = v31;
    v67[4] = Mesh;
    v67[5] = v51;
    v67[6] = v37;
    v67[7] = a3;
    v67[8] = v49;
    v68 = v53;
    v69 = BYTE4(v50);
    v70 = v52;
    v71 = v50;
    v72 = 0;
    v73 = v47;
    v74 = 0;
    v38 = v67;
    goto LABEL_41;
  }
  if ((_DWORD)v50 != 3)
  {
LABEL_40:
    v59[0] = v57;
    v59[1] = v58;
    v59[2] = Geometry;
    v59[3] = v31;
    v59[4] = Mesh;
    v59[5] = v51;
    v59[6] = v37;
    v59[7] = a3;
    v59[8] = v29;
    v60 = v53;
    v61 = BYTE4(v50);
    v62 = v52;
    v63 = v32;
    v64 = (v30 & 0x4000) != 0;
    v65 = (v30 >> 11) & 7;
    v66 = 0;
    v38 = v59;
LABEL_41:
    objc_msgSend((id)a1, "_executeDrawCommand:", v38);
    return;
  }
  LODWORD(v44) = v28;
  v39 = *(_QWORD *)(a1 + 248);
  if (!*(_BYTE *)(v39 + 73) && *(_QWORD *)(v39 + 16) != 1)
  {
    *(_QWORD *)(v39 + 16) = 1;
    *(_BYTE *)(v39 + 41) = 1;
  }
  v91[0] = v34;
  v91[1] = v33;
  v91[2] = Geometry;
  v91[3] = v31;
  v91[4] = Mesh;
  v91[5] = v51;
  v91[6] = v37;
  v91[7] = a3;
  v48 = v29;
  v91[8] = v29;
  v92 = v53;
  v93 = BYTE4(v50);
  v94 = v52;
  LOBYTE(v50) = v32;
  v95 = v32;
  v96 = v35;
  HIDWORD(v44) = v36;
  v97 = v36;
  v98 = 0;
  objc_msgSend((id)a1, "_executeDrawCommand:", v91, v44);
  v40 = *(_QWORD *)(a1 + 248);
  if (!*(_BYTE *)(v40 + 73) && *(_QWORD *)(v40 + 16) != 2)
  {
    *(_QWORD *)(v40 + 16) = 2;
    *(_BYTE *)(v40 + 41) = 1;
  }
  v83[0] = v34;
  v83[1] = v33;
  v83[2] = Geometry;
  v83[3] = v31;
  v83[4] = Mesh;
  v83[5] = v51;
  v83[6] = v37;
  v83[7] = a3;
  v83[8] = v48;
  v84 = v53;
  v85 = BYTE4(v50);
  v86 = v52;
  v87 = v50;
  v88 = v35;
  v89 = v46;
  v90 = 0;
  objc_msgSend((id)a1, "_executeDrawCommand:", v83);
  if ((v45 & 1) == 0)
  {
    memset(v54, 0, sizeof(v54));
    v55 = 0;
    C3DRasterizerStatesGetDesc(RasterizerStates, (uint64_t)v54);
    v41 = *(_QWORD *)(a1 + 248);
    v42 = C3DCullModeToMTLCullMode(v54[0]);
    if (!*(_BYTE *)(v41 + 73) && *(_QWORD *)(v41 + 16) != v42)
    {
      *(_QWORD *)(v41 + 16) = v42;
      *(_BYTE *)(v41 + 41) = 1;
    }
  }
}

- (uint64_t)reverseZ
{
  if (result)
    return (*(unsigned __int8 *)(result + 152) >> 6) & 1;
  return result;
}

- (void)setRasterizerStates:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  NSObject *v9;
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
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;

  if (a1)
  {
    v2 = a2;
    if (!a2)
      v2 = C3DRasterizerStatesDefault();
    if (*(_QWORD *)(a1 + 15168) != v2)
    {
      v25 = 0;
      v26 = 0;
      v28 = 0;
      v27 = 0;
      C3DRasterizerStatesGetDesc(v2, (uint64_t)&v25);
      v4 = *(_QWORD *)(a1 + 15168);
      if (!v4)
      {
        LOBYTE(v7) = -1;
        v5 = v25;
        goto LABEL_31;
      }
      v21 = 0;
      v22 = 0;
      v24 = 0;
      v23 = 0;
      C3DRasterizerStatesGetDesc(v4, (uint64_t)&v21);
      v5 = v25;
      if (HIDWORD(v21) == HIDWORD(v25))
        v6 = v21 != v25;
      else
        v6 = ((_DWORD)v21 != (_DWORD)v25) | 2;
      if (v22 == v26)
        v7 = v6;
      else
        v7 = v6 | 4;
      if ((_BYTE)v26)
      {
        if (BYTE2(v22) != BYTE2(v26) || v22 == 0)
          v7 |= 8u;
        if ((_BYTE)v22 && BYTE1(v22) == BYTE1(v26))
        {
LABEL_25:
          if (BYTE3(v26) | BYTE3(v22))
          {
            LOBYTE(v7) = v7 | 0x20;
          }
          else if (!v7)
          {
            v9 = scn_default_log();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
              -[SCNMTLRenderContext setRasterizerStates:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_40:
            *(_QWORD *)(a1 + 15168) = v2;
            return;
          }
          if ((v7 & 1) == 0)
          {
LABEL_34:
            if ((v7 & 2) != 0)
            {
              v19 = *(_QWORD *)(a1 + 248);
              v20 = C3DFillModeToMTLFillMode(HIDWORD(v25));
              if (!*(_BYTE *)(v19 + 74) && *(_QWORD *)(v19 + 24) != v20)
              {
                *(_QWORD *)(v19 + 24) = v20;
                *(_BYTE *)(v19 + 42) = 1;
              }
            }
            if ((v7 & 0x3C) != 0)
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 248) + 3392), "setDepthStencilState:", -[SCNMTLResourceManager renderResourceForRasterizerState:reverseZ:](*(_QWORD *)(a1 + 112), v2, (*(unsigned __int8 *)(a1 + 152) >> 6) & 1));
            goto LABEL_40;
          }
LABEL_31:
          v17 = *(_QWORD *)(a1 + 248);
          v18 = C3DCullModeToMTLCullMode(v5);
          if (!*(_BYTE *)(v17 + 73) && *(_QWORD *)(v17 + 16) != v18)
          {
            *(_QWORD *)(v17 + 16) = v18;
            *(_BYTE *)(v17 + 41) = 1;
          }
          goto LABEL_34;
        }
      }
      else
      {
        if ((_BYTE)v22)
          goto LABEL_25;
        v7 |= 8u;
      }
      v7 |= 0x10u;
      goto LABEL_25;
    }
  }
}

- (uint64_t)getCurrentPassMaterial
{
  if (result)
    return *(_QWORD *)(result + 15464);
  return result;
}

- (uint64_t)getCurrentPassHash
{
  if (result)
    return *(_QWORD *)(result + 15456);
  return result;
}

- (uint64_t)profile
{
  if (result)
    return *(unsigned int *)(result + 132);
  return result;
}

- (uint64_t)_setMeshBuffers:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _OWORD v7[7];
  uint64_t v8[15];

  v8[14] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    memset(v7, 0, sizeof(v7));
    v4 = objc_msgSend((id)-[SCNMTLMesh buffers](a2), "count");
    if (v4 >= 0xE)
      v5 = 14;
    else
      v5 = v4;
    objc_msgSend((id)-[SCNMTLMesh buffers](a2), "getObjects:range:", v8, 0, v5);
    if (-[SCNMTLMesh volatileBuffer](a2))
    {
      *((_QWORD *)v7 + v5) = -[SCNMTLMesh volatileOffset](a2);
      v8[v5++] = -[SCNMTLMesh volatileBuffer](a2);
    }
    v6 = *(_QWORD *)(v3 + 248);
    if (v5 == 1)
      return SCNMTLRenderCommandEncoder::setVertexBuffer(v6, v8[0], *(uint64_t *)&v7[0], 18);
    else
      return SCNMTLRenderCommandEncoder::setVertexBuffers(v6, (uint64_t)v8, (uint64_t)v7, 18, v5);
  }
  return result;
}

- (uint64_t)_drawMeshElement:(uint64_t)a3 instanceCount:
{
  _QWORD *v5;
  NSObject *v6;
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
  SCNMTLRenderCommandEncoder *v24;
  MTLPrimitiveType v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _DWORD *v35;
  int v36;

  if (result)
  {
    v5 = (_QWORD *)result;
    ++*(_DWORD *)(*(_QWORD *)(result + 16) + 8);
    if (!a2)
    {
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[SCNMTLRenderContext _drawMeshElement:instanceCount:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    if (-[SCNMTLMesh buffers](a2))
    {
      v14 = v5[31];
      v15 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](a2);
      v16 = -[SCNMTLMesh elements](a2);
      v17 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](a2), "buffer");
      v18 = -[SCNMTLMeshElement effectiveIndexOffset](a2);
      v19 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](a2), "offset");
      v20 = v19 + v18 + -[SCNMTLResourceManager libraryManager](a2);
      v21 = -[SCNMTLMesh buffers](a2);
      v22 = -[SCNMTLMesh volatileOffset](a2);
      SCNMTLRenderCommandEncoder::_bindPendingTextures((SCNMTLRenderCommandEncoder *)v14);
      SCNMTLRenderCommandEncoder::applyChangedStates((SCNMTLRenderCommandEncoder *)v14);
      objc_msgSend(*(id *)(v14 + 3392), "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", v15, v16, v17, v20, v21, v22);
    }
    else
    {
      v23 = -[SCNMTLMeshElement indexBuffer](a2);
      v24 = (SCNMTLRenderCommandEncoder *)v5[31];
      v25 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](a2);
      if (v23)
      {
        v26 = -[SCNMTLMesh volatileBuffer](a2);
        v27 = -[SCNMTLMesh elements](a2);
        v28 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](a2), "buffer");
        v29 = -[SCNMTLMeshElement effectiveIndexOffset](a2);
        v30 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](a2), "offset");
        v31 = -[SCNMTLResourceManager libraryManager](a2);
        SCNMTLRenderCommandEncoder::drawIndexedPrimitives((uint64_t)v24, v25, v26, v27, v28, v30 + v29 + v31, a3, 0);
      }
      else
      {
        v32 = -[SCNMTLMeshElement effectiveIndexOffset](a2);
        v33 = -[SCNMTLMesh volatileBuffer](a2);
        SCNMTLRenderCommandEncoder::drawPrimitives(v24, v25, v32, v33, a3, 0);
      }
    }
    v34 = -[SCNMTLMeshElement effectivePrimitiveCount](a2);
    v35 = (_DWORD *)v5[2];
    v35[1] += v34 * a3;
    result = v5[1898];
    if (result)
    {
      result = -[SCNMTLMesh verticesCount](result);
      v36 = result * a3;
      v35 = (_DWORD *)v5[2];
    }
    else
    {
      v36 = 0;
    }
    *v35 += v36;
  }
  return result;
}

- (uint64_t)_setReflectionProbeArrayTexture:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 15152) = a2;
  return result;
}

- (void)_prepareMaterialTextures:(__C3DMaterial *)a3
{
  uint64_t CommonProfile;
  uint64_t v5;
  int LightingModel;
  char v7;
  char v8;
  char v9;
  uint64_t EffectSlot;

  CommonProfile = C3DMaterialGetCommonProfile((uint64_t)a3);
  if (CommonProfile)
  {
    v5 = CommonProfile;
    LightingModel = C3DEffectCommonProfileGetLightingModel(CommonProfile);
    if (LightingModel == 5)
      -[SCNMTLResourceManager specularDFGDiffuseHammonTextureWithRenderContext:](self->_resourceManager, "specularDFGDiffuseHammonTextureWithRenderContext:", self);
    v7 = C3DEnumIterator<C3DEffectProperty,(signed char)0,(signed char)15>::end();
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      do
      {
        if (C3DEffectCommonProfileIsEffectPropertyEnabledForLightingModel(LightingModel, v9))
        {
          EffectSlot = C3DEffectCommonProfileGetEffectSlot(v5, v9, 0);
          if (self)
          {
            if (EffectSlot)
              -[SCNMTLResourceManager renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:](self->_resourceManager, "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", EffectSlot, self->_engineContext, 0);
          }
        }
        ++v9;
      }
      while (v9 != v8);
    }
  }
}

- (uint64_t)resourceBlitEncoder
{
  uint64_t v2;

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 256))
    objc_msgSend((id)a1, "_createResourceCommandBufferIfNeeded");
  if (*(_QWORD *)(a1 + 1936))
    SCNMTLComputeCommandEncoder::endEncoding((SCNMTLComputeCommandEncoder *)(a1 + 280));
  v2 = a1 + 264;
  if (!*(_QWORD *)(a1 + 264))
    SCNMTLBlitCommandEncoder::beginEncoding((_QWORD *)(a1 + 264), *(void **)(a1 + 256), 0);
  return v2;
}

- (double)stopProcessingRendererElements:(uint64_t)a1
{
  id AuthoringEnvironment;
  uint64_t v4;
  double result;

  if (a1)
  {
    if (a2)
    {
      if (*(_BYTE *)(a1 + 2264))
      {
        AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment(*(_QWORD *)(a1 + 144), 0);
        if (AuthoringEnvironment)
        {
          if (C3DAuthoringEnvironmentShouldDisplayLightInfluences((uint64_t)AuthoringEnvironment)
            && !*(_QWORD *)(*(_QWORD *)(a1 + 2224) + 4760))
          {
            SCNMTLClusterSystem::displayInfoDebug(a1 + 14544);
          }
        }
      }
      v4 = *(_QWORD *)(a1 + 15544);
      if ((v4 & 0x10) != 0)
      {
        objc_msgSend((id)a1, "_drawPBRTextures");
        v4 = *(_QWORD *)(a1 + 15544);
      }
      if ((v4 & 8) != 0)
        objc_msgSend((id)a1, "_drawShadowMaps");
    }
    *(_QWORD *)(a1 + 2272) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 2256) = 0u;
    *(_OWORD *)(a1 + 2240) = 0u;
    *(_OWORD *)(a1 + 2224) = 0u;
  }
  return result;
}

- (uint64_t)disableLinearRendering
{
  if (result)
    return (*(unsigned __int8 *)(result + 152) >> 2) & 1;
  return result;
}

- (uint64_t)radianceTextureForEffectSlot:(uint64_t)a1
{
  uint64_t PrecomputedLightingEnvironment;
  void *v5;
  void *v7;
  void *v8;

  if (!a1)
    return 0;
  PrecomputedLightingEnvironment = C3DEffectSlotGetPrecomputedLightingEnvironment(a2);
  v5 = *(void **)(a1 + 112);
  if (PrecomputedLightingEnvironment)
    return objc_msgSend(v5, "radianceTextureForPrecomputedLightingEnvironment:");
  v7 = (void *)objc_msgSend(v5, "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", a2, *(_QWORD *)(a1 + 144), 0);
  if (v7 && (v8 = v7, objc_msgSend(v7, "textureType") == 5))
    return objc_msgSend(*(id *)(a1 + 112), "radianceTextureForEnvironmentTexture:engineContext:commandBuffer:", v8, *(_QWORD *)(a1 + 144), -[SCNMTLRenderContext resourceCommandBuffer]((_QWORD *)a1));
  else
    return 0;
}

- (_QWORD)irradianceTextureForEffectSlot:(_QWORD *)result
{
  _QWORD *v3;
  uint64_t PrecomputedLightingEnvironment;
  void *v5;
  _QWORD *v6;
  uint64_t LightProbesSystem;
  void *v8;
  _QWORD v9[5];

  if (result)
  {
    v3 = result;
    PrecomputedLightingEnvironment = C3DEffectSlotGetPrecomputedLightingEnvironment(a2);
    v5 = (void *)v3[14];
    if (PrecomputedLightingEnvironment)
    {
      return (_QWORD *)objc_msgSend(v5, "irradianceTextureForPrecomputedLightingEnvironment:");
    }
    else
    {
      result = (_QWORD *)objc_msgSend(v5, "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", a2, v3[18], 0);
      if (result)
      {
        v6 = result;
        if (objc_msgSend(result, "textureType") == 5)
        {
          LightProbesSystem = v3[279];
          if (LightProbesSystem)
            LightProbesSystem = C3DLightingSystemGetLightProbesSystem(LightProbesSystem);
          v8 = (void *)v3[14];
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __54__SCNMTLRenderContext_irradianceTextureForEffectSlot___block_invoke;
          v9[3] = &__block_descriptor_40_e21_v16__0___MTLBuffer__8l;
          v9[4] = LightProbesSystem;
          return (_QWORD *)objc_msgSend(v8, "irradianceTextureForEnvironmentTexture:renderContext:applySH:", v6, v3, v9);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)resourceComputeEncoder
{
  uint64_t v2;

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 256))
    objc_msgSend((id)a1, "_createResourceCommandBufferIfNeeded");
  if (*(_QWORD *)(a1 + 264))
    SCNMTLBlitCommandEncoder::endEncoding((SCNMTLBlitCommandEncoder *)(a1 + 264));
  v2 = a1 + 280;
  if (!*(_QWORD *)(a1 + 1936))
    SCNMTLComputeCommandEncoder::beginEncoding((_QWORD *)(a1 + 280), *(void **)(a1 + 256), *(_DWORD *)(a1 + 136), (uint64_t)CFSTR("ResourceComputeEncoder"), *(_QWORD *)(a1 + 2088));
  return v2;
}

- (uint64_t)endFrameWaitingUntilCompleted:(_QWORD *)a3 status:(_QWORD *)a4 error:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  SEL v18;
  SEL v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  if (result)
  {
    v7 = result;
    if (*(_QWORD *)(result + 256))
    {
      if (*(_QWORD *)(result + 264))
        SCNMTLBlitCommandEncoder::endEncoding((SCNMTLBlitCommandEncoder *)(result + 264));
      if (*(_QWORD *)(v7 + 1936))
        SCNMTLComputeCommandEncoder::endEncoding((SCNMTLComputeCommandEncoder *)(v7 + 280));
      objc_msgSend(*(id *)(v7 + 256), "commit");
      *(_QWORD *)(v7 + 256) = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 15488));
    v8 = *(_QWORD *)(v7 + 15496);
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v10 = *(void **)(v7 + 240);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke;
      v22[3] = &unk_1EA5A0328;
      v22[4] = v8;
      objc_msgSend(v10, "addScheduledHandler:", v22);

      *(_QWORD *)(v7 + 15496) = 0;
    }
    v11 = *(_QWORD *)(v7 + 15504);
    if (v11)
    {
      v12 = *(void **)(v7 + 240);
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_2;
      v21[3] = &unk_1EA5A0328;
      v21[4] = v11;
      objc_msgSend(v12, "addCompletedHandler:", v21);

      *(_QWORD *)(v7 + 15504) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 15488));
    if (*(_QWORD *)(v7 + 200))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v7 + 15488));
      v14 = *(_QWORD *)(v7 + 15512);
      if (v14)
      {
        v15 = *(void **)(v7 + 200);
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_3;
        v20[3] = &unk_1EA5A0350;
        v20[4] = v14;
        objc_msgSend(v15, "addPresentedHandler:", v20);

        *(_QWORD *)(v7 + 15512) = 0;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 15488));
      if (*(_BYTE *)(v7 + 213))
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        if (!pthread_main_np())
          objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
      }
      if (*(_BYTE *)(v7 + 212) && objc_msgSend(*(id *)(v7 + 192), "maximumDrawableCount") == 3)
        objc_msgSend(*(id *)(v7 + 240), "presentDrawable:afterMinimumDuration:", *(_QWORD *)(v7 + 200), *(float *)(v7 + 208));
      else
        objc_msgSend(*(id *)(v7 + 240), "presentDrawable:", *(_QWORD *)(v7 + 200));
      if (*(_BYTE *)(v7 + 213))
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      *(_QWORD *)(v7 + 200) = 0;
    }
    v16 = *(void **)(v7 + 15536);
    if (v16)
    {
      if (a2)
      {
        objc_msgSend(v16, "waitUntilCompleted");
        if (a3)
          *a3 = objc_msgSend(*(id *)(v7 + 15536), "status");
        if (a4)
          *a4 = 0;
      }
      objc_setProperty_nonatomic((id)v7, v13, 0, 15536);
    }
    else
    {
      dispatch_group_wait(*(dispatch_group_t *)(v7 + 2208), 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(*(id *)(v7 + 240), "commit");
      if (a2)
      {
        objc_msgSend(*(id *)(v7 + 240), "waitUntilCompleted");
        if (a3)
          *a3 = objc_msgSend(*(id *)(v7 + 240), "status");
        if (a4)
          *a4 = objc_msgSend(*(id *)(v7 + 240), "error");
      }
    }
    objc_setProperty_nonatomic((id)v7, v17, 0, 15528);
    objc_setProperty_nonatomic((id)v7, v18, 0, 15520);
    objc_setProperty_nonatomic((id)v7, v19, 0, 15560);
    *(_QWORD *)(v7 + 240) = 0;
    *(_QWORD *)(v7 + 15152) = 0;

    *(_QWORD *)(v7 + 184) = 0;
    *(_QWORD *)(v7 + 192) = 0;

    *(_QWORD *)(v7 + 200) = 0;
    return objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "endFrameForEngineContext:", *(_QWORD *)(v7 + 144));
  }
  return result;
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 *Scene;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t AmbientLighting;
  uint64_t v23;
  uint64_t v24;
  unint64_t EyeMatrix4x4;
  float PointOfViewScale;
  __int128 v27;
  uint64_t LightingEnvironmentEffectSlot;
  uint64_t v34;
  float Intensity;
  float v36;
  unsigned int v37;
  double v38;
  double v39;
  float32x2_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  char *v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  __int128 v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t *PointOfView;
  const __CFDictionary *Camera;
  int IsTemporalAntialiasingEnabled;
  _BOOL4 v83;
  _OWORD *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  float v88;
  simd_float4x4 *v89;
  __n128 ViewportAtIndex;
  uint64_t v91;
  unsigned int ActiveNonAmbientLightCount;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  float32x4_t v97;
  float32x4_t v98;
  _QWORD v100[7];
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _OWORD __src[26];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 2224) = v4;
  if (!v4)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      -[SCNMTLRenderContext startProcessingRendererElementsWithEngineIterationContext:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
      v2 = a2;
    }
  }
  Scene = (__n128 *)C3DEngineContextGetScene(*(_QWORD *)(v2 + 8));
  if (*(_QWORD *)(v2 + 8) != *(_QWORD *)(a1 + 144))
  {
    v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[SCNMTLRenderContext startProcessingRendererElementsWithEngineIterationContext:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  *(_QWORD *)(a1 + 2232) = C3DSceneGetLightingSystem((uint64_t)Scene);
  *(_QWORD *)(a1 + 2272) = C3DSceneGetTransformTree((uint64_t)Scene);
  *(_QWORD *)(a1 + 2240) = C3DSceneGetDynamicBatchingSystem((uint64_t)Scene);
  *(_QWORD *)(a1 + 2248) = C3DFXPassInstanceGetPass(*(_QWORD *)(a1 + 2224));
  *(_QWORD *)(a1 + 2256) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 2264) = *(_BYTE *)(a2 + 40);
  AmbientLighting = C3DLightingSystemGetAmbientLighting(*(_QWORD *)(a1 + 2232));
  v23 = *(_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 2680) = v24;
  *(_QWORD *)(a1 + 2672) = AmbientLighting;
  EyeMatrix4x4 = C3DEngineContextGetEyeMatrix4x4(v23, 0, 0);
  v96 = *(_OWORD *)(EyeMatrix4x4 + 48);
  v97 = *(float32x4_t *)(EyeMatrix4x4 + 32);
  PointOfViewScale = C3DEngineContextGetPointOfViewScale(*(_QWORD *)(a1 + 144));
  *(_OWORD *)(a1 + 2688) = *(_OWORD *)C3DSceneGetFogColor((uint64_t)Scene);
  if (v97.f32[3] == 0.0 && (C3DIsRunningInXcode() & 1) != 0)
    v27 = xmmword_1DD007600;
  else
    *(__n64 *)&v27 = C3DSceneComputeFogParameters((uint64_t)Scene, PointOfViewScale);
  *(_OWORD *)(a1 + 2704) = v27;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)(a1 + 2720) = vdiv_f32(_D1, *(float32x2_t *)(a1 + 232));
  LightingEnvironmentEffectSlot = C3DSceneGetLightingEnvironmentEffectSlot((uint64_t)Scene, 0);
  v34 = LightingEnvironmentEffectSlot;
  Intensity = 1.0;
  if (LightingEnvironmentEffectSlot
    && (C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot)
     || C3DEffectSlotHasPrecomputedLightingEnvironment(v34)))
  {
    Intensity = C3DEffectSlotGetIntensity(v34);
  }
  *(float *)(a1 + 2748) = Intensity;
  if (*(double *)(a1 + 2192) == 0.0)
    *(double *)(a1 + 2192) = C3DEngineContextGetSystemTime(*(_QWORD *)(a1 + 144));
  v36 = C3DEngineContextGetSystemTime(*(_QWORD *)(a1 + 144)) - *(double *)(a1 + 2192);
  *(float *)(a1 + 2728) = v36;
  *(__float2 *)(a1 + 2732) = __sincosf_stret(v36);
  v37 = 214013 * *(_DWORD *)(a1 + 2280) + 2531011;
  *(_DWORD *)(a1 + 2280) = v37;
  *(float *)(a1 + 2740) = (float)HIWORD(v37) * 0.000015259;
  v40.i32[1] = v97.i32[1];
  v38 = v97.f32[2];
  v39 = *((float *)&v96 + 2);
  v40.f32[0] = *((float *)&v96 + 2) / v97.f32[2];
  if (v97.f32[3] == 0.0)
  {
    v41 = (v39 + -1.0) / v38;
    v42 = (v39 + 1.0) / v38;
    *(float *)&v42 = v42;
    v43 = -(1.0 - v39) / v38;
    if (*((float *)&v96 + 2) < -1.0)
      *(double *)&v40 = v42;
    else
      v43 = v41;
  }
  else
  {
    v44 = v39 / (v38 + 1.0);
    *(float *)&v39 = v39 / (v38 + -1.0);
    v43 = v44;
    if (*((float *)&v96 + 2) < -2.0)
      *(double *)&v40 = v39;
  }
  *(float *)&v43 = v43;
  *(int8x8_t *)(a1 + 2880) = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v40, *(float32x2_t *)&v43), 0), (int8x8_t)vrev64_s32((int32x2_t)__PAIR64__(LODWORD(v43), v40.u32[0])), (int8x8_t)__PAIR64__(LODWORD(v43), v40.u32[0]));
  if (*(_BYTE *)(a1 + 2264))
  {
    SCNMTLClusterSystem::compute(a1 + 14544);
    memcpy((void *)(a1 + 14736), __src, 0x1A0uLL);
    *(_OWORD *)(a1 + 2976) = *(_OWORD *)(a1 + 14800);
  }
  v45 = (char *)(a1 + 2288);
  if (!*(_BYTE *)(a1 + 1994))
  {
    v46 = 1;
    goto LABEL_30;
  }
  v46 = *(unsigned __int8 *)(a1 + 1993);
  if (*(_BYTE *)(a1 + 1993))
  {
LABEL_30:
    v48 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v98 = _Q0;
    v50 = a1;
    v47 = v46;
    while (1)
    {
      v51 = *(unsigned __int8 *)(a1 + 1992);
      if (v48)
        memcpy((void *)(v50 + 2288), v45, 0x2C0uLL);
      v52 = v48 + v51;
      v53 = (_OWORD *)(v4 + ((v48 + v51) << 6));
      __src[0] = v53[198];
      __src[1] = v53[199];
      __src[2] = v53[200];
      __src[3] = v53[201];
      v54 = v53[199];
      v55 = v53[200];
      v56 = v53[201];
      *(_OWORD *)(v50 + 2288) = v53[198];
      *(_OWORD *)(v50 + 2304) = v54;
      *(_OWORD *)(v50 + 2320) = v55;
      *(_OWORD *)(v50 + 2336) = v56;
      v57 = v53[175];
      v58 = v53[176];
      v59 = v53[177];
      *(_OWORD *)(v50 + 2352) = v53[174];
      *(_OWORD *)(v50 + 2368) = v57;
      *(_OWORD *)(v50 + 2384) = v58;
      *(_OWORD *)(v50 + 2400) = v59;
      v104 = __src[0];
      v105 = __src[1];
      v106 = __src[2];
      v107 = __src[3];
      C3DSceneComputeViewToCubemapMatrix(Scene, (uint64_t)&v104);
      v60 = v105;
      v61 = v106;
      v62 = v107;
      *(_OWORD *)(v50 + 2544) = v104;
      *(_OWORD *)(v50 + 2560) = v60;
      *(_OWORD *)(v50 + 2576) = v61;
      *(_OWORD *)(v50 + 2592) = v62;
      v63 = v53[223];
      v64 = v53[224];
      v65 = v53[225];
      *(_OWORD *)(v50 + 2416) = v53[222];
      *(_OWORD *)(v50 + 2432) = v63;
      *(_OWORD *)(v50 + 2448) = v64;
      *(_OWORD *)(v50 + 2464) = v65;
      v66 = v53[247];
      v67 = v53[248];
      v68 = v53[249];
      *(_OWORD *)(v50 + 2480) = v53[246];
      *(_OWORD *)(v50 + 2496) = v66;
      *(_OWORD *)(v50 + 2512) = v67;
      *(_OWORD *)(v50 + 2528) = v68;
      v69 = *(float32x4_t *)(v50 + 2288);
      v70 = *(float32x4_t *)(v50 + 2304);
      v71 = *(float32x4_t *)(v50 + 2320);
      v72 = *(_OWORD *)(v50 + 2336);
      v73 = (int32x4_t)vmulq_f32(v69, v69);
      v74 = (int32x4_t)vmulq_f32(v70, v70);
      v75 = (int32x4_t)vmulq_f32(v71, v71);
      v76 = vzip2q_s32(v73, v75);
      v77 = (float32x4_t)vzip1q_s32(vzip1q_s32(v73, v75), v74);
      v78 = (float32x4_t)vtrn2q_s32(v73, v74);
      v78.i32[2] = v75.i32[1];
      v79 = vdivq_f32(v98, vaddq_f32((float32x4_t)vzip1q_s32(v76, vdupq_laneq_s32(v74, 2)), vaddq_f32(v77, v78)));
      *(float32x4_t *)(v50 + 2912) = vmulq_n_f32(v69, v79.f32[0]);
      *(float32x4_t *)(v50 + 2928) = vmulq_lane_f32(v70, *(float32x2_t *)v79.f32, 1);
      *(float32x4_t *)(v50 + 2944) = vmulq_laneq_f32(v71, v79, 2);
      *(_OWORD *)(v50 + 2960) = v72;
      PointOfView = C3DEngineContextGetPointOfView(*(_QWORD *)(a2 + 8));
      if (!PointOfView)
        break;
      Camera = C3DNodeGetCamera((uint64_t)PointOfView);
      IsTemporalAntialiasingEnabled = C3DEngineContextIsTemporalAntialiasingEnabled(*(_QWORD *)(a1 + 144));
      if (!Camera)
        goto LABEL_38;
      v83 = C3DCameraGetMotionBlurIntensity((uint64_t)Camera) > 0.0;
      if (v83)
        goto LABEL_40;
LABEL_39:
      if (IsTemporalAntialiasingEnabled)
      {
LABEL_40:
        v84 = (_OWORD *)(v4 + (v52 << 6));
        v85 = v84[271];
        v86 = v84[272];
        v87 = v84[273];
        *(_OWORD *)(v50 + 2608) = v84[270];
        *(_OWORD *)(v50 + 2624) = v85;
        *(_OWORD *)(v50 + 2640) = v86;
        *(_OWORD *)(v50 + 2656) = v87;
        v88 = 0.5;
        if (v83)
          v88 = C3DCameraGetMotionBlurIntensity((uint64_t)Camera) * 0.5;
        *(float *)(v50 + 2744) = v88;
      }
      v89 = (simd_float4x4 *)&v45[704 * v52];
      *(simd_float4x4 *)(v50 + 2752) = __invert_f4(v89[2]);
      *(simd_float4x4 *)(v50 + 2816) = __invert_f4(v89[3]);
      ViewportAtIndex = C3DEngineContextGetViewportAtIndex(*(_QWORD *)(a1 + 144), v48);
      *(int8x16_t *)(v50 + 2896) = vextq_s8((int8x16_t)ViewportAtIndex, (int8x16_t)ViewportAtIndex, 8uLL);
      ++v48;
      v50 += 704;
      if (v47 == v48)
        goto LABEL_44;
    }
    IsTemporalAntialiasingEnabled = C3DEngineContextIsTemporalAntialiasingEnabled(*(_QWORD *)(a1 + 144));
    Camera = 0;
LABEL_38:
    v83 = 0;
    goto LABEL_39;
  }
  LODWORD(v47) = 0;
LABEL_44:
  v104 = 0uLL;
  *(_QWORD *)&v105 = 0;
  SCNMTLBufferPool::allocateAndCopy(*(SCNMTLBufferPool **)(a1 + 2088), v45, (704 * v47), (void **)&v104);
  v91 = v105;
  *(_QWORD *)(a1 + 6512) = *((_QWORD *)&v104 + 1);
  *(_QWORD *)(a1 + 6520) = v91;
  if ((*(_BYTE *)(a1 + 152) & 0x20) != 0)
  {
    ActiveNonAmbientLightCount = C3DLightingSystemGetActiveNonAmbientLightCount(*(_QWORD *)(a1 + 2232));
    if (ActiveNonAmbientLightCount)
    {
      v93 = 208 * ActiveNonAmbientLightCount;
      *(_QWORD *)(a1 + 6544) = v93;
      v101 = 0;
      v102 = 0;
      v103 = 0;
      SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(a1 + 2088), v93, &v101);
      v94 = v101;
      *(_QWORD *)(a1 + 6528) = v102;
      *(_QWORD *)(a1 + 6536) = v103;
      *(_QWORD *)&__src[0] = 0;
      *((_QWORD *)&__src[0] + 1) = __src;
      *(_QWORD *)&__src[1] = 0x2020000000;
      DWORD2(__src[1]) = 0;
      v95 = *(_QWORD *)(a1 + 2232);
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __81__SCNMTLRenderContext_startProcessingRendererElementsWithEngineIterationContext___block_invoke;
      v100[3] = &unk_1EA5A0398;
      v100[4] = a1;
      v100[5] = __src;
      v100[6] = v94;
      C3DLightingSystemApplyActiveNonAmbientLights(v95, (uint64_t)v100);
      _Block_object_dispose(__src, 8);
    }
    else
    {
      *(_QWORD *)(a1 + 6544) = 0;
      *(_OWORD *)(a1 + 6528) = 0u;
    }
  }
}

- (void)setWantsWideGamut:(uint64_t)a1
{
  char v2;
  const void *Scene;
  uint64_t SharedInstance;

  if (a1)
  {
    v2 = *(_BYTE *)(a1 + 152);
    if (((((v2 & 1) == 0) ^ a2) & 1) == 0)
    {
      *(_BYTE *)(a1 + 152) = v2 & 0xFE | a2;
      Scene = (const void *)C3DEngineContextGetScene(*(_QWORD *)(a1 + 144));
      SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), Scene, 0, 1u);
    }
  }
}

- (void)setIsOpaque:(uint64_t)a1
{
  char v2;
  char v3;
  const void *Scene;
  uint64_t SharedInstance;

  if (a1)
  {
    v2 = *(_BYTE *)(a1 + 152);
    if (((((v2 & 2) == 0) ^ a2) & 1) == 0)
    {
      if (a2)
        v3 = 2;
      else
        v3 = 0;
      *(_BYTE *)(a1 + 152) = v2 & 0xFD | v3;
      Scene = (const void *)C3DEngineContextGetScene(*(_QWORD *)(a1 + 144));
      SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), Scene, 0, 1u);
    }
  }
}

- (void)setDisableLinearRendering:(uint64_t)a1
{
  char v2;
  char v3;
  const void *Scene;
  uint64_t SharedInstance;

  if (a1)
  {
    v2 = *(_BYTE *)(a1 + 152);
    if (((((v2 & 4) == 0) ^ a2) & 1) == 0)
    {
      if (a2)
        v3 = 4;
      else
        v3 = 0;
      *(_BYTE *)(a1 + 152) = v2 & 0xFB | v3;
      Scene = (const void *)C3DEngineContextGetScene(*(_QWORD *)(a1 + 144));
      SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), Scene, 0, 1u);
    }
  }
}

- (uint64_t)setSampleCount:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = SCNMTLDeviceSupportedSampleCountForSampleCount(*(void **)(result + 120), a2);
    *(_QWORD *)(v2 + 96) = result;
  }
  return result;
}

- (uint64_t)features
{
  if (result)
    return *(unsigned int *)(result + 136);
  return result;
}

- (SCNMTLRenderContext)initWithDevice:(__C3DEngineContext *)a3 engineContext:
{
  SCNMTLRenderContext *v5;
  SCNMTLRenderContext *v6;
  MTLCommandQueue *v7;
  char v8;
  char v9;
  uint64_t v10;
  SCNMTLBufferPool *v11;
  SCNMTLBufferPool *v12;
  SCNMTLTexturePool *v13;
  id v14;
  id v15;
  unsigned int features;
  NSObject *v17;
  NSObject *v19;
  _BYTE v20[28];
  _OWORD v21[2];
  objc_super v22;

  if (!a1)
    return 0;
  if (!a2)
  {
    v17 = scn_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SCNMTLRenderContext initWithDevice:engineContext:].cold.1();
    return 0;
  }
  v22.receiver = a1;
  v22.super_class = (Class)SCNMTLRenderContext;
  v5 = (SCNMTLRenderContext *)objc_msgSendSuper2(&v22, sel_init);
  v6 = v5;
  if (!v5)
    return v6;
  v5->_device = a2;
  if ((C3DUseOneCommandQueuePerDevice() & 1) == 0)
  {
    v7 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](a2, "newCommandQueue");
    v6->_ownedCommandQueue = v7;
    if (v7)
    {
      -[MTLCommandQueue setLabel:](v7, "setLabel:", CFSTR("com.apple.SceneKit"));
      goto LABEL_7;
    }
    v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SCNMTLRenderContext initWithDevice:engineContext:].cold.2();
    return 0;
  }
LABEL_7:
  v6->_isValidationEnabled = MTLValidationEnabled();
  v6->_contentScaleFactor = 1.0;
  v6->_superSamplingFactor = 1.0;
  v6->_screenTransform = SCNMatrix4Identity;
  v6->_needSuperSampling = 0;
  v6->_profile = 0;
  v6->_engineContext = a3;
  if (C3DStandardShadersUseFunctionConstants())
    v8 = 32;
  else
    v8 = 0;
  *((_BYTE *)v6 + 152) = *((_BYTE *)v6 + 152) & 0xDF | v8;
  if (C3DReverseZIsSupported())
    v9 = 64;
  else
    v9 = 0;
  *((_BYTE *)v6 + 152) = *((_BYTE *)v6 + 152) & 0xBF | v9;
  v6->_features |= 3u;
  if (SCNMTLDeviceSupportsDepthResolve(v6->_device))
    v6->_features |= 4u;
  if (SCNMTLDeviceSupportsStencilResolve(v6->_device))
    v6->_features |= 0x4000u;
  if (SCNMTLDeviceSupportsNonUniformThreadgroupSize(v6->_device))
    v6->_features |= 0x40u;
  if (SCNMTLDeviceSupportsDepth24UnormStencil8())
    v6->_features |= 8u;
  if (SCNMTLDeviceSupportsLayeredRendering(v6->_device))
    v6->_features |= 0x20u;
  if (SCNMTLDeviceSupportsMultipleViewports(v6->_device))
    v6->_features |= 0x80u;
  if (SCNMTLDeviceSupportsVertexAmplification(v6->_device))
    v6->_features |= 0x2000u;
  if (SCNMTLDeviceSupportsTessellation(v6->_device))
    v6->_features |= 0x10u;
  if (SCNMTLDeviceSupportsCubeMapTextureArrays(v6->_device))
    v6->_features |= 0x100u;
  if (SCNMTLDeviceSupportsCubeMapWrite(v6->_device))
    v6->_features |= 0x200u;
  if (SCNMTLDeviceSupportsBaseInstance(v6->_device))
    v6->_features |= 0x400u;
  if (SCNMTLDeviceSupportsProgrammableBlending(v6->_device))
    v6->_features |= 0x800u;
  if (SCNMTLDeviceSupportsDepthClipMode(v6->_device))
    v6->_features |= 0x1000u;
  if (SCNMTLDeviceSupportsTextureSwizzle(v6->_device))
    v6->_features |= 0x8000u;
  v6->_resourceManager = +[SCNMTLResourceManager resourceManagerForDevice:]((uint64_t)SCNMTLResourceManager, (uint64_t)a2);
  v6->_resourceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.scenekit.resourceCPUQueue", 0);
  v6->_resourceGroup = (OS_dispatch_group *)dispatch_group_create();
  v6->__engineStats = (__C3DEngineStats *)malloc_type_calloc(0x358uLL, 1uLL, 0xF2ECCD5EuLL);
  v10 = 0;
  v6->_inFlightSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(3);
  v6->_currentStreamBufferIndices = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  do
  {
    v11 = (SCNMTLBufferPool *)operator new();
    SCNMTLBufferPool::SCNMTLBufferPool(v11, v6->_resourceManager, CFSTR("FrameConstant"), 0x40000uLL, MTLStorageModeShared);
    v6->_constantBufferPools[v10] = v11;
    v12 = (SCNMTLBufferPool *)operator new();
    SCNMTLBufferPool::SCNMTLBufferPool(v12, v6->_resourceManager, CFSTR("Volatile"), 0x40000uLL, MTLStorageModeShared);
    v6->_volatileBufferPools[v10++] = v12;
  }
  while (v10 != 3);
  v13 = (SCNMTLTexturePool *)operator new();
  SCNMTLTexturePool::SCNMTLTexturePool(v13, v6);
  v6->_frameTexturePool = v13;
  v6->_frameConstantBufferPool = v6->_constantBufferPools[0];
  v6->_frameVolatileBufferPool = v6->_volatileBufferPools[0];
  v6->_volatileMeshes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6->_bufferPool = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6->_usedVolatileMeshElements = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 16);
  v6->_freeVolatileMeshElements = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 16);
  v14 = objc_alloc_init(MEMORY[0x1E0CC6B80]);
  v6->_defaultSamplerState = (MTLSamplerState *)-[MTLDevice newSamplerStateWithDescriptor:](v6->_device, "newSamplerStateWithDescriptor:", v14);

  v15 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
  objc_msgSend(v15, "setDepthWriteEnabled:", 0);
  objc_msgSend(v15, "setDepthCompareFunction:", 7);
  v6->_defaultDepthStencilState = (MTLDepthStencilState *)-[MTLDevice newDepthStencilStateWithDescriptor:](v6->_device, "newDepthStencilStateWithDescriptor:", v15);

  v6->_background2DProgram[0] = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_2D_vertid"), CFSTR("background_2D_frag"));
  v6->_backgroundCubeProgram[0] = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_cube_vertid"), CFSTR("background_cube_frag"));
  v6->_backgroundVideoProgram = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_video_vertid"), CFSTR("background_video_frag"));
  v6->_backgroundVideoAlpha0Program = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_video_vertid"), CFSTR("background_video_alpha_0_frag"));
  features = v6->_features;
  if ((features & 0x80) != 0)
  {
    v6->_background2DProgram[2] = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_2D_multiple_viewports_vertid"), CFSTR("background_2D_multiple_viewports_frag"));
    v6->_backgroundCubeProgram[2] = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_cube_multiple_viewports_vertid"), CFSTR("background_cube_multiple_viewports_frag"));
    features = v6->_features;
  }
  if ((features & 0x20) != 0)
  {
    v6->_background2DProgram[1] = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_2D_layered_vertid"), CFSTR("background_2D_layered_frag"));
    v6->_backgroundCubeProgram[1] = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("background_cube_layered_vertid"), CFSTR("background_cube_layered_frag"));
  }
  memset(v21, 0, 28);
  C3DRasterizerStatesDescGetDefault(v21);
  WORD4(v21[0]) = 0;
  *(_OWORD *)&v20[12] = *(_OWORD *)((char *)v21 + 12);
  *(_OWORD *)v20 = v21[0];
  v6->_backgroundRasterizerStates = (__C3DRasterizerStates *)C3DRasterizerStatesCreate((uint64_t)v20);
  v6->_showsAuthoringEnvironment = 0;
  v6->_gpuHandlersLock._os_unfair_lock_opaque = 0;
  return v6;
}

- (uint64_t)resourceManager
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

- (uint64_t)setShouldPresentAfterMinimumDuration:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 212) = a2;
  return result;
}

- (void)beginFrame:(uint64_t)a1
{
  unsigned int *v4;
  unsigned int v5;
  char isKindOfClass;
  id v7;
  SCNMTLBufferPool *v8;
  SCNMTLBufferPool *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[6];

  if (a1)
  {
    ++*(_QWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 15440) = 0u;
    objc_msgSend(*(id *)(a1 + 112), "reloadPipelinesIfNeeded");
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 168), 0xFFFFFFFFFFFFFFFFLL);
    v4 = (unsigned int *)(a1 + 176);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));

    *(_QWORD *)(a1 + 184) = 0;
    *(_QWORD *)(a1 + 192) = 0;
    *(_BYTE *)(a1 + 213) = 0;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = a2;
    if ((isKindOfClass & 1) != 0)
    {
      *(_QWORD *)(a1 + 192) = v7;
      *(_BYTE *)(a1 + 213) = objc_msgSend(v7, "presentsWithTransaction");
    }
    else
    {
      *(_QWORD *)(a1 + 184) = v7;
    }
    v8 = *(SCNMTLBufferPool **)(a1 + 8 * (*(_QWORD *)(a1 + 8) % 3) + 2064);
    *(_QWORD *)(a1 + 2088) = v8;
    SCNMTLBufferPool::reset(v8);
    v9 = *(SCNMTLBufferPool **)(a1 + 8 * (*(_QWORD *)(a1 + 8) % 3) + 2000);
    *(_QWORD *)(a1 + 2024) = v9;
    SCNMTLBufferPool::reset(v9);
    SCNMTLTexturePool::reset(*(SCNMTLTexturePool **)(a1 + 2096));
    v10 = *(void **)(a1 + 15536);
    if (!v10)
    {
      os_variant_has_internal_diagnostics();
      v10 = (void *)objc_msgSend((id)-[SCNMTLRenderContext commandQueue](a1), "commandBuffer");
    }
    *(_QWORD *)(a1 + 240) = v10;
    if (*(_BYTE *)(a1 + 15424))
    {
      objc_msgSend(*(id *)(a1 + 15432), "removeAllObjects");
      v10 = *(void **)(a1 + 240);
    }
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3052000000;
    v12[3] = __Block_byref_object_copy__3;
    v12[4] = __Block_byref_object_dispose__3;
    v12[5] = *(_QWORD *)(a1 + 168);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34__SCNMTLRenderContext_beginFrame___block_invoke;
    v11[3] = &unk_1EA5A0300;
    v11[4] = a1;
    v11[5] = v12;
    objc_msgSend(v10, "addCompletedHandler:", v11);
    _Block_object_dispose(v12, 8);
  }
}

- (void)_createResourceCommandBufferIfNeeded
{
  MTLCommandBuffer *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (!self->_resourceCommandBuffer)
  {
    os_variant_has_internal_diagnostics();
    v3 = (MTLCommandBuffer *)objc_msgSend((id)-[SCNMTLRenderContext commandQueue]((uint64_t)self), "commandBuffer");
    v4 = MEMORY[0x1E0C809B0];
    self->_resourceCommandBuffer = v3;
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke;
    v5[3] = &unk_1EA5A0328;
    v5[4] = self;
    -[MTLCommandBuffer addCompletedHandler:](v3, "addCompletedHandler:", v5);
    -[MTLCommandBuffer enqueue](self->_resourceCommandBuffer, "enqueue");
  }
}

- (uint64_t)commandQueue
{
  uint64_t v2;

  if (!a1)
    return 0;
  if (*(_QWORD *)(a1 + 15536))
    return objc_msgSend(*(id *)(a1 + 15536), "commandQueue");
  v2 = *(_QWORD *)(a1 + 15560);
  if (v2)
    return v2;
  v2 = *(_QWORD *)(a1 + 160);
  if (v2)
    return v2;
  return -[SCNMTLResourceManager commandQueue](*(_QWORD *)(a1 + 112));
}

- (uint64_t)currentCommandBuffer
{
  if (result)
    return *(_QWORD *)(result + 240);
  return result;
}

- (uint64_t)setCurrentPassMaterial:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 15464) = a2;
  return result;
}

- (uint64_t)setCurrentPassHash:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 15456) = a2;
  return result;
}

- (uint64_t)clientCommandBuffer
{
  if (result)
    return *(_QWORD *)(result + 15536);
  return result;
}

- (uint64_t)clientRenderPassDescriptor
{
  if (result)
    return *(_QWORD *)(result + 15520);
  return result;
}

- (uint64_t)clientRenderCommandEncoder
{
  if (result)
    return *(_QWORD *)(result + 15528);
  return result;
}

- (void)endRenderPass
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 248);
    v3 = *(_QWORD *)(v2 + 3392);
    if (v3 == *(_QWORD *)(a1 + 15528))
    {
      bzero(*(void **)(a1 + 248), 0xD70uLL);
    }
    else
    {
      v4 = *(_QWORD *)(v2 + 3384);
      v5 = *(_QWORD *)(v2 + 3400);
      bzero(*(void **)(a1 + 248), 0xD70uLL);
      *(_QWORD *)(v2 + 3384) = v4;
      *(_QWORD *)(v2 + 3392) = v3;
      *(_QWORD *)(v2 + 3400) = v5;
      *(_WORD *)(v2 + 40) = 257;
      *(_BYTE *)(v2 + 42) = 1;
      *(_OWORD *)(v2 + 8) = 0u;
      *(_OWORD *)(v2 + 24) = 0u;
    }
    *(_DWORD *)(v2 + 64) = 1;
    *(_BYTE *)(v2 + 72) = 1;
    *(_QWORD *)(a1 + 248) = 0;
    *(_QWORD *)(a1 + 216) = *(_QWORD *)(a1 + 224);
  }
}

- (id)commandBufferStatusMonitor
{
  if (result)
    return (id *)objc_loadWeak(result + 1935);
  return result;
}

- (double)beginRenderPass:(uint64_t)a3 renderEncoder:(uint64_t)a4 parameters:
{
  void *v7;
  double result;
  uint64_t v9;

  if (a1)
  {
    *(_QWORD *)(a1 + 248) = a3;
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
    if (!v7)
      v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "depthAttachment"), "texture");
    *(float *)(a1 + 232) = (float)(unint64_t)objc_msgSend(v7, "width");
    *(float *)(a1 + 236) = (float)(unint64_t)objc_msgSend(v7, "height");
    result = 0.0;
    *(_OWORD *)(a1 + 15168) = 0u;
    *(_OWORD *)(a1 + 15184) = 0u;
    *(_OWORD *)(a1 + 15200) = 0u;
    *(_OWORD *)(a1 + 15216) = 0u;
    *(_OWORD *)(a1 + 15232) = 0u;
    *(_OWORD *)(a1 + 15248) = 0u;
    *(_OWORD *)(a1 + 15264) = 0u;
    *(_OWORD *)(a1 + 15280) = 0u;
    *(_QWORD *)(a1 + 15296) = 0;
    v9 = *(_QWORD *)(a1 + 216);
    *(_QWORD *)(a1 + 216) = a2;
    *(_QWORD *)(a1 + 224) = v9;
    *(_WORD *)(a1 + 1996) = WORD2(a4);
    *(_DWORD *)(a1 + 1992) = a4;
  }
  return result;
}

- (_QWORD)_finalRenderTexture
{
  _QWORD *v1;
  void *v2;
  double v3;
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v10[16];

  if (result)
  {
    v1 = result;
    if (result[24])
    {
      v2 = (void *)result[25];
      if (!v2)
      {
        v3 = CACurrentMediaTime();
        v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        C3DEngineContextGetFrameIndex(v1[18]);
        v5 = -3;
        do
        {
          kdebug_trace();
          v6 = CACurrentMediaTime();
          v7 = (void *)objc_msgSend((id)v1[24], "nextDrawable");
          *(CFTimeInterval *)(v1[2] + 176) = CACurrentMediaTime() - v6 + *(double *)(v1[2] + 176);
          kdebug_trace();
          if (v7)
            v8 = 1;
          else
            v8 = v5 == 0;
          ++v5;
        }
        while (!v8);
        if (!v7)
        {
          v9 = scn_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_1DCCB8000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Failed getting a valid drawable. Skipping this frame.", v10, 2u);
          }
        }
        *(CFTimeInterval *)(v1[2] + 192) = CACurrentMediaTime() - v3 + *(double *)(v1[2] + 192);
        v1[25] = v7;

        v2 = (void *)v1[25];
      }
      return (_QWORD *)objc_msgSend(v2, "texture");
    }
    else
    {
      return (_QWORD *)result[23];
    }
  }
  return result;
}

- (id).cxx_construct
{
  uint64_t v3;
  _OWORD *v4;

  self->_resourceBlitEncoder._encoder = 0;
  self->_resourceBlitEncoder._commandBuffer = 0;
  self->_resourceComputeEncoder._encoder = 0;
  self->_resourceComputeEncoder._bufferPool = 0;
  v3 = -4224;
  do
  {
    v4 = (_OWORD *)((char *)self + v3);
    v4[449] = 0uLL;
    v4[448] = 0uLL;
    v4[447] = 0uLL;
    v4[446] = 0uLL;
    v4[407] = 0uLL;
    v4[408] = 0uLL;
    v4[409] = 0uLL;
    v4[410] = 0uLL;
    v4[411] = 0uLL;
    v4[412] = 0uLL;
    v4[413] = 0uLL;
    v4[414] = 0uLL;
    v4[415] = 0uLL;
    v4[416] = 0uLL;
    v4[417] = 0uLL;
    v4[418] = 0uLL;
    v4[419] = 0uLL;
    v4[420] = 0uLL;
    v4[421] = 0uLL;
    v4[422] = 0uLL;
    v4[423] = 0uLL;
    v4[424] = 0uLL;
    v4[425] = 0uLL;
    v4[426] = 0uLL;
    v4[427] = 0uLL;
    v4[428] = 0uLL;
    v4[429] = 0uLL;
    v4[430] = 0uLL;
    v4[443] = 0uLL;
    v4[442] = 0uLL;
    v4[441] = 0uLL;
    v4[440] = 0uLL;
    v4[439] = 0uLL;
    v4[438] = 0uLL;
    v4[437] = 0uLL;
    v4[436] = 0uLL;
    v3 += 704;
  }
  while (v3);
  bzero(&self->_nodeUniforms, 0x540uLL);
  self->_lighting.frameLightingSetDatas.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_ = 0u;
  self->_lighting.frameLightingSetDatas.__table_.__p3_.__value_ = 1.0;
  SCNMTLClusterSystem::SCNMTLClusterSystem((SCNMTLClusterSystem *)&self->_anon_3848[136]);
  return self;
}

- (float)setPreferredFramesPerSecond:(uint64_t)a1
{
  NSObject *v3;
  float result;

  if (a1)
  {
    if (!a2)
    {
      a2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "maximumFramesPerSecond");
      if (!a2)
      {
        v3 = scn_default_log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          -[SCNMTLRenderContext setPreferredFramesPerSecond:].cold.1();
        a2 = 120;
      }
    }
    result = 1.0 / (float)a2;
    *(float *)(a1 + 208) = result;
  }
  return result;
}

- (uint64_t)device
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

- (uint64_t)frameTexturePool
{
  if (result)
    return *(_QWORD *)(result + 2096);
  return result;
}

- (uint64_t)frameConstantBufferPool
{
  if (result)
    return *(_QWORD *)(result + 2088);
  return result;
}

- (uint64_t)compilationErrors
{
  if (result)
    return *(_QWORD *)(result + 15432);
  return result;
}

- (BOOL)collectsCompilationErrors
{
  if (result)
    return *(_BYTE *)(result + 15424) != 0;
  return result;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Deallocating render context with 1 outstanding command buffer scheduling handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

intptr_t __34__SCNMTLRenderContext_beginFrame___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  intptr_t result;
  unsigned int *v9;
  unsigned int v10;

  objc_msgSend(a2, "GPUEndTime");
  v5 = v4;
  objc_msgSend(a2, "GPUStartTime");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 200) = v5 - v6;
  if (objc_msgSend(a2, "status") != 4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "commandBufferDidCompleteWithError:", a2);
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __34__SCNMTLRenderContext_beginFrame___block_invoke_cold_1(a2);
    objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 15480)), "renderContext:commandBufferDidCompleteWithError:", *(_QWORD *)(a1 + 32), a2);
  }
  result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v9 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 176);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  return result;
}

uint64_t __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *v5;

  result = objc_msgSend(a2, "status");
  if (result != 4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "commandBufferDidCompleteWithError:", a2);
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke_cold_1(a2);
    return objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 15480)), "renderContext:commandBufferDidCompleteWithError:", *(_QWORD *)(a1 + 32), a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);
  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
  SCNMTLClusterSystem::~SCNMTLClusterSystem((SCNMTLClusterSystem *)&self->_anon_3848[136]);
  std::__hash_table<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>>>::~__hash_table((uint64_t)&self->_lighting.frameLightingSetDatas);
}

- (uint64_t)sampleCount
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (uint64_t)textureTarget
{
  if (result)
    return *(_QWORD *)(result + 184);
  return result;
}

- (uint64_t)shouldDelegateARCompositing
{
  if (result)
    return (*(unsigned __int8 *)(result + 152) >> 4) & 1;
  return result;
}

- (uint64_t)enableARMode
{
  if (result)
    return (*(unsigned __int8 *)(result + 152) >> 3) & 1;
  return result;
}

- (BOOL)showsAuthoringEnvironment
{
  if (result)
    return *(_BYTE *)(result + 15416) != 0;
  return result;
}

- (double)contentScaleFactor
{
  if (a1)
    return *(double *)(a1 + 15552);
  else
    return 0.0;
}

- (void)_reduceStatsOfConstantBuffer:(id)a3
{
  --self->__engineStats->cboCount;
  self->__engineStats->cboMemory -= objc_msgSend(a3, "length");
}

- (void)setGeneratedTexturePath:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 15568);
}

- (void)setClientCommandBuffer:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 15536);
}

- (void)setClientRenderPassDescriptor:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 15520);
}

- (void)setClientRenderCommandEncoder:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 15528);
}

- (void)setClientCommandQueue:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 15560);
}

- (uint64_t)engineContext
{
  if (result)
    return *(_QWORD *)(result + 144);
  return result;
}

- (__n128)setScreenTransform:(uint64_t)a1
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  if (a1)
  {
    result = *(__n128 *)a2;
    v3 = *(_OWORD *)(a2 + 16);
    v4 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 80) = v4;
    *(__n128 *)(a1 + 32) = result;
    *(_OWORD *)(a1 + 48) = v3;
  }
  return result;
}

- (double)screenTransform
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  if (a1)
  {
    v2 = a1[3];
    *a2 = a1[2];
    a2[1] = v2;
    v3 = a1[4];
    v4 = a1[5];
    a2[2] = v3;
    a2[3] = v4;
  }
  else
  {
    *(_QWORD *)&v3 = 0;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v3;
}

- (uint64_t)wantsWideGamut
{
  if (result)
    return *(_BYTE *)(result + 152) & 1;
  return result;
}

- (uint64_t)setEnableARMode:(uint64_t)result
{
  char v2;
  char v3;

  if (result)
  {
    v2 = *(_BYTE *)(result + 152);
    if (((((v2 & 8) == 0) ^ a2) & 1) == 0)
    {
      if (a2)
        v3 = 8;
      else
        v3 = 0;
      *(_BYTE *)(result + 152) = v2 & 0xF7 | v3;
    }
  }
  return result;
}

- (uint64_t)setShouldDelegateARCompositing:(uint64_t)result
{
  char v2;
  char v3;

  if (result)
  {
    v2 = *(_BYTE *)(result + 152);
    if (((((v2 & 0x10) == 0) ^ a2) & 1) == 0)
    {
      if (a2)
        v3 = 16;
      else
        v3 = 0;
      *(_BYTE *)(result + 152) = v2 & 0xEF | v3;
    }
  }
  return result;
}

- (void)setReverseZ:(uint64_t)a1
{
  int v3;

  if (a1)
  {
    if (a2)
    {
      if (C3DReverseZIsSupported())
        v3 = 64;
      else
        v3 = 0;
    }
    else
    {
      v3 = 0;
    }
    *(_BYTE *)(a1 + 152) = *(_BYTE *)(a1 + 152) & 0xBF | v3;
    C3DEngineContextSetCoordinatesSystemOptions(*(_QWORD *)(a1 + 144), 8, v3 != 0);
    -[SCNMTLResourceManager resetRasterizerStates](*(_QWORD *)(a1 + 112));
  }
}

- (void)_clearUnusedBindingPoints
{
  SCNMTLRenderPipeline *renderPipeline;
  __int16 v4;
  uint64_t i;
  SCNMTLRenderCommandEncoder *renderEncoder;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  uint64_t j;
  SCNMTLRenderCommandEncoder *v11;
  __int16 v12;
  __int16 v13;
  BOOL *v14;
  __int16 v15;
  unint64_t v16;
  BOOL *v17;

  renderPipeline = self->_cache.renderPipeline;
  if (renderPipeline)
  {
    objc_msgSend((id)self->_renderEncoder->var24[1], "pushDebugGroup:", CFSTR("Clear binding points"));
    v4 = 0;
    for (i = 0; i != 31; ++i)
    {
      renderEncoder = self->_renderEncoder;
      if ((renderPipeline->_buffersUsageMask[0] & (1 << i)) != 0)
        v7 = 255;
      else
        v7 = i;
      if ((renderPipeline->_buffersUsageMask[1] & (1 << i)) != 0)
        v8 = -256;
      else
        v8 = v4;
      if ((_BYTE)v7 != 0xFF)
        SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, 0, 0, (char)v7);
      if ((~((unsigned __int16)v8 | (unsigned __int16)v7) & 0xFF00) != 0)
        SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)renderEncoder, 0, 0, (uint64_t)(__int16)(v8 | v7) >> 8);
      v4 += 256;
    }
    v9 = 0;
    for (j = 0; j != 31; ++j)
    {
      v11 = self->_renderEncoder;
      if ((renderPipeline->_texturesUsageMask[0] & (1 << j)) != 0)
        v12 = 255;
      else
        v12 = j;
      if ((renderPipeline->_texturesUsageMask[1] & (1 << j)) != 0)
        v13 = -256;
      else
        v13 = v9;
      if ((_BYTE)v12 != 0xFF)
      {
        v14 = &v11->var0 + 8 * (char)v12;
        if (*((_QWORD *)v14 + 72))
        {
          *((_QWORD *)v14 + 72) = 0;
          v11->var25[((unint64_t)(char)v12 >> 6) + 1] |= 1 << v12;
        }
      }
      v15 = v13 | v12;
      if ((~v15 & 0xFF00) != 0)
      {
        v16 = (uint64_t)v15 >> 8;
        v17 = &v11->var0 + 8 * v16;
        if (*((_QWORD *)v17 + 278))
        {
          *((_QWORD *)v17 + 278) = 0;
          *(&v11[1].var1 + (v16 >> 6)) |= 1 << SHIBYTE(v15);
        }
      }
      v9 += 256;
    }
    objc_msgSend((id)self->_renderEncoder->var24[1], "popDebugGroup");
  }
}

- (uint64_t)resourceQueue
{
  if (result)
    return *(_QWORD *)(result + 2200);
  return result;
}

- (void)endFrameSceneSpecifics
{
  void *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "resetVolatileMeshes");
    return (void *)objc_msgSend(v1, "resetVolatileMeshElements");
  }
  return result;
}

uint64_t __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  uint64_t (**v3)(_QWORD);
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(uint64_t (***)(_QWORD))(a1 + 32);
  if ((isKindOfClass & 1) == 0)
    return v3[2](v3);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_2(uint64_t a1)
{
  char isKindOfClass;
  uint64_t (**v3)(_QWORD);
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(uint64_t (***)(_QWORD))(a1 + 32);
  if ((isKindOfClass & 1) == 0)
    return v3[2](v3);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_3(uint64_t a1)
{
  char isKindOfClass;
  uint64_t (**v3)(_QWORD);
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(uint64_t (***)(_QWORD))(a1 + 32);
  if ((isKindOfClass & 1) == 0)
    return v3[2](v3);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)layerTarget
{
  if (result)
    return *(_QWORD *)(result + 192);
  return result;
}

- (uint64_t)_reflectionProbeArrayTexture
{
  if (result)
    return *(_QWORD *)(result + 15152);
  return result;
}

- (uint64_t)_clusterInfo
{
  if (a1)
    return a1 + 14736;
  else
    return 0;
}

- (_QWORD)resourceCommandBuffer
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    if (!result[32])
      objc_msgSend(result, "_createResourceCommandBufferIfNeeded");
    if (v1[242])
      SCNMTLComputeCommandEncoder::endEncoding((SCNMTLComputeCommandEncoder *)(v1 + 35));
    if (v1[33])
      SCNMTLBlitCommandEncoder::endEncoding((SCNMTLBlitCommandEncoder *)(v1 + 33));
    return (_QWORD *)v1[32];
  }
  return result;
}

- (uint64_t)textureForEffectSlot:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 112), "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", a2, *(_QWORD *)(result + 144), 0);
  return result;
}

double __54__SCNMTLRenderContext_irradianceTextureForEffectSlot___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  double result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = objc_msgSend(a2, "contents");
    v5 = objc_msgSend(a2, "length");
    *(_QWORD *)&result = C3DLightProbesSetGlobalSH3(v2, v4, v5, v6).n128_u64[0];
  }
  return result;
}

- (void)_logLightingInformation
{
  _DWORD *next;
  uint64_t v4;

  if ((*((_BYTE *)self + 152) & 0x20) == 0)
  {
    NSLog(CFSTR("LightingSet: uploaded count: %d"), a2, self->_lighting.frameLightingSetDatas.__table_.__p2_.__value_);
    next = self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_;
    if (next)
    {
      LODWORD(v4) = 0;
      do
      {
        v4 = (v4 + next[10]);
        next = *(_DWORD **)next;
      }
      while (next);
    }
    else
    {
      v4 = 0;
    }
    NSLog(CFSTR("  LightingSet: uploaded size %d bytes"), v4);
  }
}

- (uint64_t)pushDebugGroup:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 248) + 3392), "pushDebugGroup:", a2);
  return result;
}

- (uint64_t)popDebugGroup
{
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 248) + 3392), "popDebugGroup");
  return result;
}

- (uint64_t)_setSceneBufferAtVertexIndex:(uint64_t)a3 fragmentIndex:
{
  uint64_t *v4;

  if (result)
  {
    v4 = result;
    if (a2 != -1)
      result = (uint64_t *)SCNMTLRenderCommandEncoder::setVertexBuffer(result[31], result[814], result[815], a2);
    if (a3 != -1)
      return (uint64_t *)SCNMTLRenderCommandEncoder::setFragmentBuffer(v4[31], v4[814], v4[815], a3);
  }
  return result;
}

- (uint64_t)_drawPatchForMeshElement:(uint64_t)a3 instanceCount:
{
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
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
  int v27;
  _DWORD *v28;
  int v29;

  if (result)
  {
    v5 = (_QWORD *)result;
    if (-[SCNMTLMesh elements](a2) != 1)
    {
      if (-[SCNMTLMesh elements](a2))
      {
        v6 = scn_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    if (-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](a2) != 3)
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    ++*(_DWORD *)(v5[2] + 8);
    v22 = v5[31];
    v23 = -[SCNMTLMeshElement primitiveCount](a2);
    v24 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](a2), "buffer");
    v25 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer](a2), "offset");
    v26 = -[SCNMTLResourceManager libraryManager](a2) + v25;
    SCNMTLRenderCommandEncoder::_bindPendingTextures((SCNMTLRenderCommandEncoder *)v22);
    SCNMTLRenderCommandEncoder::applyChangedStates((SCNMTLRenderCommandEncoder *)v22);
    objc_msgSend(*(id *)(v22 + 3392), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", 3, 0, v23, 0, 0, v24, v26, *(unsigned int *)(v22 + 64) * a3, 0);
    v27 = -[SCNMTLMeshElement primitiveCount](a2);
    v28 = (_DWORD *)v5[2];
    v28[1] += v27 * a3;
    result = v5[1898];
    if (result)
    {
      result = -[SCNMTLMesh verticesCount](result);
      v29 = result * a3;
      v28 = (_DWORD *)v5[2];
    }
    else
    {
      v29 = 0;
    }
    *v28 += v29;
  }
  return result;
}

- (void)_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:(C3DMatrix4x4 *)a3
{
  char CoordinatesSystemOptions;
  float v6;
  double v7;
  float v8;
  double v9;
  float32x2_t v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  __n128 Viewport;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  __int128 v26;
  unsigned int v27;
  __int128 v28;
  unsigned int v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  int8x8_t v33;
  _OWORD v34[4];
  _OWORD v35[4];

  if (a3->components[11] == 0.0)
  {
    CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions((uint64_t)self->_engineContext);
    v10.i32[0] = LODWORD(a3->components[10]);
    v6 = a3->components[11];
    v7 = v10.f32[0];
    v8 = a3->components[14];
    v9 = v8;
    v10.f32[0] = v8 / v10.f32[0];
    v11 = v8 / (v7 + 1.0);
    v12 = v8 / (v7 + -1.0);
    *(float *)&v12 = v12;
    if (v8 >= -2.0)
      v12 = *(double *)&v10;
    v13 = v8 < -1.0;
    v14 = (v9 + -1.0) / v7;
    v15 = (v9 + 1.0) / v7;
    *(float *)&v15 = v15;
    v16 = -(1.0 - v9) / v7;
    if (v13)
      *(double *)&v10 = v15;
    else
      v16 = v14;
    v17 = v6 == 0.0;
    if (v6 == 0.0)
      v18 = v16;
    else
      v18 = v11;
    if (!v17)
      *(double *)&v10 = v12;
    *(float *)&v18 = v18;
    v33 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v10, *(float32x2_t *)&v18), 0), (int8x8_t)vrev64_s32((int32x2_t)__PAIR64__(LODWORD(v18), v10.u32[0])), (int8x8_t)__PAIR64__(LODWORD(v18), v10.u32[0]));
    Viewport = C3DEngineContextGetViewport((__n128 *)self->_engineContext);
    if (Viewport.n128_f32[3] == 0.0)
      v20 = 1.0;
    else
      v20 = Viewport.n128_f32[2] / Viewport.n128_f32[3];
    v21 = *(float *)v33.i32;
    if (*(float *)&v33.i32[1] > *(float *)v33.i32)
      v22 = *(float *)&v33.i32[1];
    else
      v22 = *(float *)v33.i32 + 1.0;
    v23 = __tanpi(0.166666667);
    if (v23 == 0.0)
      v24 = 1.0;
    else
      v24 = 1.0 / v23;
    v25 = v24;
    v26 = LODWORD(v25);
    *(float *)&v27 = v22 / (v21 - v22);
    *(_QWORD *)&v28 = 0;
    *((_QWORD *)&v28 + 1) = __PAIR64__(-1.0, v27);
    LODWORD(v31) = 0;
    *((_QWORD *)&v31 + 1) = 0;
    *(float *)&v29 = v22 * v21 / (v21 - v22);
    *(_QWORD *)&v30 = 0;
    *((_QWORD *)&v30 + 1) = v29;
    *((float *)&v31 + 1) = v20 * v25;
    if ((CoordinatesSystemOptions & 8) != 0)
    {
      v32 = 0;
      v34[0] = LODWORD(v25);
      v34[1] = v31;
      v34[2] = v28;
      v34[3] = v30;
      do
      {
        v35[v32] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1DD007970, COERCE_FLOAT(v34[v32])), (float32x4_t)xmmword_1DD007920, *(float32x2_t *)&v34[v32], 1), (float32x4_t)xmmword_1DD007960, (float32x4_t)v34[v32], 2), (float32x4_t)xmmword_1DD007E00, (float32x4_t)v34[v32], 3);
        ++v32;
      }
      while (v32 != 4);
      v26 = v35[0];
      v31 = v35[1];
      v28 = v35[2];
      v30 = v35[3];
    }
    *(_OWORD *)a3->components = v26;
    *(_OWORD *)&a3->components[4] = v31;
    *(_OWORD *)&a3->components[8] = v28;
    *(_OWORD *)&a3->components[12] = v30;
  }
}

- (float)_zFarForSkyboxRenderingProjectionMatrix:(const C3DMatrix4x4 *)a3 defaultZFar:
{
  float result;

  if (result <= 0.0)
    return 1.0;
  return result;
}

- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:
{
  uint64_t ImageProxy;
  uint64_t Player;
  const void *TextureProxy;
  uint64_t TextureSampler;
  void *MetalTexture;
  void *v13;
  __n128 *Scene;
  uint64_t EnvironmentCubeMesh;
  uint64_t v16;
  uint64_t Matrix4x4;
  uint64_t ImageTransform;
  __n128 *v19;
  __int128 v20;
  __n128 v21;
  __n128 v22;
  float32x4_t v23;
  __n128 v24;
  float32x4_t *v25;
  __int128 v26;
  float32x4_t v27;
  float32x4_t v28;
  SCNMTLMesh *v29;
  double v30;
  double v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  float Intensity;
  uint64_t Default;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  float32x4_t *v53;
  __n128 *v54;
  uint64_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  __n128 v59;
  __n128 v60;
  __int128 v61;
  __n128 v62;
  __n128 v63;
  __n128 v64;
  uint64_t v65;
  double v66;
  int v67;
  SCNMTLRenderCommandEncoder *v68;
  size_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  double v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  float32x4_t v79[4];
  float32x4_t v80;
  __n128 v81;
  __n128 v82;
  __int128 v83;
  __n128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  int v88;
  int v89;
  float v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  SCNMTLMesh *v94;
  uint64_t v95;
  uint64_t v96;
  __int16 v97;
  char v98;
  char v99;
  char v100;
  __int128 v101;
  _BYTE v102[19];
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  __int128 v106;
  __n128 v107;
  __n128 v108;
  __n128 v109;
  __int128 v110;
  id v111;

  if (!a1)
    return;
  v111 = 0;
  ImageProxy = C3DEffectSlotGetImageProxy(a2);
  Player = C3DAnimationNodeGetPlayer(a3);
  TextureProxy = (const void *)Player;
  if (Player && C3DTextureGetIOSurface(Player) != ImageProxy)
  {
    C3DEngineContextSetBackgroundTextureProxy(a3, 0);
    TextureProxy = 0;
  }
  if (!ImageProxy)
  {
    MetalTexture = (void *)objc_msgSend(*(id *)(a1 + 112), "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", a2, *(_QWORD *)(a1 + 144), 0);
    goto LABEL_13;
  }
  TextureSampler = C3DEffectSlotGetTextureSampler(a2);
  if (TextureSampler)
  {
    if (!TextureProxy)
    {
LABEL_11:
      TextureProxy = (const void *)C3DImageProxyCreateTextureProxy(ImageProxy, TextureSampler, a3);
      C3DEngineContextSetBackgroundTextureProxy(a3, TextureProxy);
      CFRelease(TextureProxy);
      if (!TextureProxy)
        return;
    }
  }
  else
  {
    TextureSampler = C3DTextureSamplerGetDefault();
    if (!TextureProxy)
      goto LABEL_11;
  }
  MetalTexture = (void *)C3DTextureProxyGetMetalTexture((uint64_t)TextureProxy, a3, TextureSampler, (uint64_t)&v80);
LABEL_13:
  v13 = MetalTexture;
  v111 = MetalTexture;
  if (MetalTexture)
  {
    Scene = (__n128 *)C3DEngineContextGetScene(a3);
    if (objc_msgSend(v13, "textureType") == 5)
    {
      EnvironmentCubeMesh = C3DEngineContextGetEnvironmentCubeMesh(a3);
      v16 = *(_QWORD *)(a1 + 8 * *(unsigned __int8 *)(a1 + 1994) + 2144);
      Matrix4x4 = C3DEngineContextGetMatrix4x4(a3, 1);
      if (C3DKeyframeControllerHasInterpolationModesPerKey(a2))
      {
        ImageTransform = C3DEffectSlotGetImageTransform(a2);
        C3DMatrix4x4Mult(ImageTransform, (float32x4_t *)Matrix4x4, &v80);
      }
      else
      {
        v23 = *(float32x4_t *)Matrix4x4;
        v24 = *(__n128 *)(Matrix4x4 + 32);
        v81 = *(__n128 *)(Matrix4x4 + 16);
        v82 = v24;
        v80 = v23;
      }
      v83 = xmmword_1DD007610;
      v25 = (float32x4_t *)C3DEngineContextGetMatrix4x4(*(_QWORD *)(a1 + 144), 0);
      v26 = (__int128)v25[3];
      v28 = *v25;
      v27 = v25[1];
      v105 = v25[2];
      v106 = v26;
      v103 = v28;
      v104 = v27;
      objc_msgSend((id)a1, "_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:", &v103);
      C3DMatrix4x4Mult((uint64_t)&v80, &v103, &v107);
    }
    else
    {
      EnvironmentCubeMesh = C3DEngineContextGetQuadMesh(a3);
      v16 = *(_QWORD *)(a1 + 8 * *(unsigned __int8 *)(a1 + 1994) + 2120);
      if (C3DKeyframeControllerHasInterpolationModesPerKey(a2))
      {
        v19 = (__n128 *)C3DEffectSlotGetImageTransform(a2);
        v20 = (__int128)v19[3];
        v22 = *v19;
        v21 = v19[1];
        v109 = v19[2];
        v110 = v20;
        v107 = v22;
        v108 = v21;
      }
      else
      {
        C3DMatrix4x4MakeIdentity((uint64_t)&v107);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 248) + 3392), "pushDebugGroup:", CFSTR("SceneKit - Draw scene background"));
    v29 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(_QWORD *)(a1 + 112), EnvironmentCubeMesh, 1);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "colorAttachments"), "objectAtIndexedSubscript:", 0), "clearColor");
    v31 = v30;
    if ((C3DEffectSlotIsOpaque(a2) & 1) != 0 || v31 == 0.0)
      v32 = C3DBlendStatesDefaultReplace();
    else
      v32 = C3DBlendStatesDefaultOver();
    v33 = *(_BYTE *)(a1 + 1993);
    v34 = *(_BYTE *)(a1 + 1994);
    if (*(_BYTE *)(a1 + 1995) == 2)
      v35 = 2;
    else
      v35 = 1;
    v36 = *(void **)(a1 + 112);
    v92 = 0u;
    v93 = 0u;
    v91 = v16;
    v94 = v29;
    v95 = v32;
    v96 = 0;
    v97 = 783;
    v98 = v33;
    v99 = v35;
    v100 = v34;
    v101 = 0u;
    memset(v102, 0, sizeof(v102));
    v37 = (void *)objc_msgSend(v36, "renderResourceForProgramDesc:renderPassDescriptor:", &v91, *(_QWORD *)(a1 + 216));
    v38 = *(_QWORD *)(a1 + 248);
    v39 = objc_msgSend(v37, "state");
    if (*(_QWORD *)(v38 + 3376) != v39)
    {
      *(_QWORD *)(v38 + 3376) = v39;
      objc_msgSend(*(id *)(v38 + 3392), "setRenderPipelineState:", v39);
    }
    -[SCNMTLRenderContext setRasterizerStates:](a1, *(_QWORD *)(a1 + 2184));
    Intensity = 1.0;
    if ((C3DWasLinkedBeforeMajorOSYear2020() & 1) == 0)
      Intensity = C3DEffectSlotGetIntensity(a2);
    v90 = Intensity;
    SCNMTLRenderCommandEncoder::setFragmentBytes(*(SCNMTLRenderCommandEncoder **)(a1 + 248), &v90, 4uLL, 0);
    Default = C3DEffectSlotGetTextureSampler(a2);
    if (!Default)
      Default = C3DTextureSamplerGetDefault();
    v42 = -[SCNMTLResourceManager renderResourceForSampler:](*(_QWORD *)(a1 + 112), Default);
    if (objc_msgSend(v13, "pixelFormat") == 520 || objc_msgSend(v13, "pixelFormat") == 500)
    {
      v43 = *(void **)(*(_QWORD *)(a1 + 248) + 3392);
      SCNMTLEnsureIOSurfaceBackingBufferValidity(*(__IOSurface **)(a1 + 240), &v111, 1u);
      objc_msgSend(v43, "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", v111, 0, v42, 0);
    }
    else
    {
      SCNMTLRenderCommandEncoder::setFragmentTexture(*(_QWORD *)(a1 + 248), v13, 0);
      v77 = *(_QWORD *)(a1 + 248);
      if (*(void **)(v77 + 3248) != v42)
      {
        *(_QWORD *)(v77 + 3248) = v42;
        objc_msgSend(*(id *)(v77 + 3392), "setFragmentSamplerState:atIndex:", v42, 0);
      }
    }
    if (*(_BYTE *)(a1 + 1994))
    {
      if (!a4)
      {
        v44 = scn_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          -[SCNMTLRenderContext renderBackground:engineContext:passInstance:].cold.1(v44, v45, v46, v47, v48, v49, v50, v51);
      }
      if (*(_BYTE *)(a1 + 1993))
      {
        v52 = 0;
        v53 = (float32x4_t *)(a4 + 3168);
        v54 = (__n128 *)&v80;
        v78 = xmmword_1DD007610;
        do
        {
          if (C3DKeyframeControllerHasInterpolationModesPerKey(a2))
          {
            v55 = C3DEffectSlotGetImageTransform(a2);
            C3DMatrix4x4Mult(v55, v53, &v103);
          }
          else
          {
            v56 = v53[1];
            v103 = *v53;
            v104 = v56;
            v105 = v53[2];
          }
          v106 = v78;
          v57 = v53[25];
          v79[0] = v53[24];
          v79[1] = v57;
          v58 = v53[27];
          v79[2] = v53[26];
          v79[3] = v58;
          objc_msgSend((id)a1, "_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:", v79, v78);
          C3DMatrix4x4Mult((uint64_t)&v103, v79, &v107);
          v59 = v108;
          v60 = v109;
          v61 = v110;
          *v54 = v107;
          v54[1] = v59;
          v54[2] = v60;
          v54[3] = (__n128)v61;
          v54[24] = C3DSceneComputeWorldToCubemapMatrix(Scene);
          v54[25] = v62;
          v54[26] = v63;
          v54[27] = v64;
          ++v52;
          v53 += 4;
          v54 += 4;
        }
        while (v52 < *(unsigned __int8 *)(a1 + 1993));
      }
      v65 = C3DEngineContextGetMatrix4x4(*(_QWORD *)(a1 + 144), 0);
      v66 = *(double *)(a4 + 4832);
      *(float *)&v66 = v66;
      objc_msgSend((id)a1, "_zFarForSkyboxRenderingProjectionMatrix:defaultZFar:", v65, v66);
      v89 = v67;
      v68 = *(SCNMTLRenderCommandEncoder **)(a1 + 248);
      v69 = 784;
    }
    else
    {
      v80 = (float32x4_t)v107;
      v81 = v108;
      v82 = v109;
      v83 = v110;
      v84 = C3DSceneComputeWorldToCubemapMatrix(Scene);
      v85 = v70;
      v86 = v71;
      v87 = v72;
      v73 = C3DEngineContextGetMatrix4x4(*(_QWORD *)(a1 + 144), 0);
      v74 = *(double *)(a4 + 4832);
      *(float *)&v74 = v74;
      objc_msgSend((id)a1, "_zFarForSkyboxRenderingProjectionMatrix:defaultZFar:", v73, v74);
      v88 = v75;
      v68 = *(SCNMTLRenderCommandEncoder **)(a1 + 248);
      v69 = 144;
    }
    SCNMTLRenderCommandEncoder::setVertexBytes(v68, &v80, v69, 0);
    if (*(_QWORD *)(a1 + 15176) != EnvironmentCubeMesh)
    {
      *(_QWORD *)(a1 + 15176) = EnvironmentCubeMesh;
      -[SCNMTLRenderContext _setMeshBuffers:](a1, (uint64_t)v29);
    }
    if (objc_msgSend(v111, "textureType") == 5)
    {
      v76 = objc_msgSend((id)-[SCNMTLMesh elements]((uint64_t)v29), "objectAtIndexedSubscript:", 0);
      -[SCNMTLRenderContext _drawMeshElement:instanceCount:](a1, v76, 1);
    }
    else
    {
      SCNMTLRenderCommandEncoder::drawFullScreenTriangle(*(SCNMTLRenderCommandEncoder **)(a1 + 248));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 248) + 3392), "popDebugGroup");
  }
}

- (_QWORD)renderVideoBackground:(__n128 *)a3 engineContext:(uint64_t)a4 slot:
{
  uint64_t v7;
  int SourceType;
  uint64_t Player;
  const void *TextureProxy;
  uint64_t Default;
  void *v12;
  uint64_t QuadMesh;
  SCNMTLMesh *v14;
  void *PointOfView;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float Intensity;
  uint64_t v38;
  float v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  SCNMTLMesh *v47;
  uint64_t v48;
  uint64_t v49;
  __int16 v50;
  char v51;
  char v52;
  char v53;
  __int128 v54;
  _BYTE v55[19];
  _BYTE v56[64];
  id v57;
  _BYTE v58[18];

  if (!result)
    return result;
  v7 = (uint64_t)result;
  objc_msgSend(*(id *)(result[31] + 3392), "pushDebugGroup:", CFSTR("SceneKit - Draw video background"));
  SourceType = C3DImageProxyGetSourceType((uint64_t)a2);
  Player = C3DAnimationNodeGetPlayer((uint64_t)a3);
  if (!Player)
    goto LABEL_5;
  TextureProxy = (const void *)Player;
  if ((__C3DImageProxy *)C3DTextureGetIOSurface(Player) != a2)
  {
    C3DEngineContextSetBackgroundTextureProxy((uint64_t)a3, 0);
LABEL_5:
    Default = C3DTextureSamplerGetDefault();
    TextureProxy = (const void *)C3DImageProxyCreateTextureProxy((uint64_t)a2, Default, (uint64_t)a3);
    C3DEngineContextSetBackgroundTextureProxy((uint64_t)a3, TextureProxy);
    CFRelease(TextureProxy);
    goto LABEL_7;
  }
  Default = C3DTextureSamplerGetDefault();
LABEL_7:
  result = (_QWORD *)C3DTextureProxyGetMetalTexture((uint64_t)TextureProxy, (uint64_t)a3, Default, (uint64_t)v58);
  v57 = result;
  if (result)
  {
    v12 = result;
    v38 = a4;
    QuadMesh = C3DEngineContextGetQuadMesh((uint64_t)a3);
    C3DMatrix4x4MakeIdentity((uint64_t)v56);
    v14 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(_QWORD *)(v7 + 112), QuadMesh, 1);
    PointOfView = C3DEngineContextGetPointOfView(*(_QWORD *)(v7 + 144));
    if (PointOfView)
      PointOfView = C3DNodeGetCamera((uint64_t)PointOfView);
    if ((*(_BYTE *)(v7 + 152) & 8) != 0
      && *(_BYTE *)(v7 + 1996)
      && PointOfView
      && C3DCameraGetARGrainTexture((uint64_t)PointOfView))
    {
      v16 = 2176;
    }
    else
    {
      v16 = 2168;
    }
    v17 = *(_QWORD *)(v7 + v16);
    v18 = *(_BYTE *)(v7 + 1993);
    v19 = *(_BYTE *)(v7 + 1994);
    if (*(_BYTE *)(v7 + 1995) == 2)
      v20 = 2;
    else
      v20 = 1;
    v21 = *(void **)(v7 + 112);
    v44 = v17;
    v45 = 0u;
    v46 = 0u;
    v48 = 0;
    v49 = 0;
    v47 = v14;
    v50 = 783;
    v51 = v18;
    v52 = v20;
    v53 = v19;
    v54 = 0u;
    memset(v55, 0, sizeof(v55));
    v22 = (void *)objc_msgSend(v21, "renderResourceForProgramDesc:renderPassDescriptor:", &v44, *(_QWORD *)(v7 + 216));
    v23 = *(_QWORD *)(v7 + 248);
    v24 = objc_msgSend(v22, "state");
    if (*(_QWORD *)(v23 + 3376) != v24)
    {
      *(_QWORD *)(v23 + 3376) = v24;
      objc_msgSend(*(id *)(v23 + 3392), "setRenderPipelineState:", v24);
    }
    -[SCNMTLRenderContext setRasterizerStates:](v7, *(_QWORD *)(v7 + 2184));
    v25 = -[SCNMTLResourceManager renderResourceForSampler:](*(_QWORD *)(v7 + 112), Default);
    if (objc_msgSend(v12, "pixelFormat") == 520 || objc_msgSend(v12, "pixelFormat") == 500)
    {
      v26 = *(void **)(*(_QWORD *)(v7 + 248) + 3392);
      SCNMTLEnsureIOSurfaceBackingBufferValidity(*(__IOSurface **)(v7 + 240), &v57, 1u);
      objc_msgSend(v26, "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", v57, 0, v25, 0);
    }
    else
    {
      SCNMTLRenderCommandEncoder::setFragmentTexture(*(_QWORD *)(v7 + 248), v12, 0);
      v28 = *(_QWORD *)(v7 + 248);
      if (*(void **)(v28 + 3248) != v25)
      {
        *(_QWORD *)(v28 + 3248) = v25;
        objc_msgSend(*(id *)(v28 + 3392), "setFragmentSamplerState:atIndex:", v25, 0);
      }
    }
    switch(SourceType)
    {
      case 0:
        v27 = scn_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[SCNMTLRenderContext renderVideoBackground:engineContext:slot:].cold.1();
        break;
      case 1:
        __asm { FMOV            V1.2S, #1.0 }
        v40 = 0x3F80000000000000;
        v41 = _D1;
        v42 = 0;
        v43 = 1065353216;
        break;
      case 2:
        __textureCoordinatesForCaptureDeviceImageProxy(a2, a3);
        goto LABEL_31;
      case 3:
LABEL_31:
        v40 = __textureCoordinatesForCaptureDeviceImageProxy(a2, a3).n128_u64[0];
        v41 = v34;
        v42 = v35;
        v43 = v36;
        break;
      default:
        break;
    }
    SCNMTLRenderCommandEncoder::setVertexBytes(*(SCNMTLRenderCommandEncoder **)(v7 + 248), &v40, 0x20uLL, 0);
    Intensity = 1.0;
    if ((C3DWasLinkedBeforeMajorOSYear2020() & 1) == 0)
      Intensity = C3DEffectSlotGetIntensity(v38);
    v39 = Intensity;
    SCNMTLRenderCommandEncoder::setFragmentBytes(*(SCNMTLRenderCommandEncoder **)(v7 + 248), &v39, 4uLL, 0);
    if (*(_QWORD *)(v7 + 15176) != QuadMesh)
    {
      *(_QWORD *)(v7 + 15176) = QuadMesh;
      -[SCNMTLRenderContext _setMeshBuffers:](v7, (uint64_t)v14);
    }
    SCNMTLRenderCommandEncoder::drawFullScreenQuad(*(SCNMTLRenderCommandEncoder **)(v7 + 248));
    return (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(v7 + 248) + 3392), "popDebugGroup");
  }
  return result;
}

- (void)renderMesh:(uint64_t)a3 meshElement:(uint64_t)a4 withProgram:(uint64_t)a5 engineContext:(_OWORD *)a6 transform:(__int128 *)a7 color:(uint64_t)a8 rasterizerStates:(uint64_t)a9 blendState:(uint64_t)a10 texture:(char)a11 depthBias:
{
  SCNMTLMesh *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  SCNMTLMeshElement *v26;
  uint64_t PrimitiveRange;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  NSObject *v43;
  double v44;
  double v45;
  double v46;
  uint64_t v48;
  _OWORD v50[5];
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  SCNMTLMesh *v54;
  uint64_t v55;
  uint64_t v56;
  __int16 v57;
  char v58;
  char v59;
  char v60;
  __int128 v61;
  _BYTE v62[19];

  if (a1)
  {
    if (*(_QWORD *)(a1 + 216))
    {
      v17 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(_QWORD *)(a1 + 112), a2, 1);
      if (C3DMeshIsVolatile(a2))
      {
        if (!-[SCNMTLMesh volatileBuffer]((uint64_t)v17))
        {
          v18 = scn_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            -[SCNMTLRenderContext renderMesh:meshElement:withProgram:engineContext:transform:color:rasterizerStates:blendState:texture:depthBias:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
      v26 = -[SCNMTLResourceManager renderResourceForMeshElement:](*(_QWORD *)(a1 + 112), a3);
      PrimitiveRange = C3DMeshElementGetPrimitiveRange(a3);
      -[SCNMTLMeshElement setPrimitiveRange:](v26, PrimitiveRange, v28);
      if (*(_BYTE *)(a1 + 1995) == 2)
        v29 = 2;
      else
        v29 = 1;
      v30 = *(_BYTE *)(a1 + 1993);
      v31 = *(_BYTE *)(a1 + 1994);
      v32 = *(void **)(a1 + 112);
      v51 = a4;
      v52 = 0u;
      v53 = 0u;
      v54 = v17;
      v55 = a9;
      v56 = 0;
      v57 = 15;
      v58 = v30;
      v59 = v29;
      v60 = v31;
      v61 = 0u;
      memset(v62, 0, sizeof(v62));
      v33 = (void *)objc_msgSend(v32, "renderResourceForProgramDesc:renderPassDescriptor:", &v51, *(_QWORD *)(a1 + 216), a5);
      v34 = *(_QWORD *)(a1 + 248);
      v35 = objc_msgSend(v33, "state");
      if (*(_QWORD *)(v34 + 3376) != v35)
      {
        *(_QWORD *)(v34 + 3376) = v35;
        objc_msgSend(*(id *)(v34 + 3392), "setRenderPipelineState:", v35);
      }
      *(_QWORD *)(a1 + 15296) = 0;
      -[SCNMTLRenderContext setRasterizerStates:](a1, a8);
      if (a11)
      {
        LODWORD(v36) = -2.0;
        LODWORD(v37) = -2.0;
        LODWORD(v38) = 0;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 248) + 3392), "setDepthBias:slopeScale:clamp:", v36, v37, v38);
      }
      if (a10)
        SCNMTLRenderCommandEncoder::setFragmentTexture(*(_QWORD *)(a1 + 248), (void *)objc_msgSend(*(id *)(a1 + 112), "renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:", a10, 0, 0, v48, 0), 0);
      v39 = a6[1];
      v40 = a6[2];
      v41 = a6[3];
      v50[0] = *a6;
      v50[1] = v39;
      v50[2] = v40;
      v50[3] = v41;
      if (a7)
        v42 = *a7;
      else
        v42 = 0uLL;
      v50[4] = v42;
      SCNMTLRenderCommandEncoder::setVertexBytes(*(SCNMTLRenderCommandEncoder **)(a1 + 248), v50, 0x50uLL, 1);
      if (*(_QWORD *)(a1 + 15176) != a2)
      {
        *(_QWORD *)(a1 + 15176) = a2;
        -[SCNMTLRenderContext _setMeshBuffers:](a1, (uint64_t)v17);
      }
      -[SCNMTLRenderContext _drawMeshElement:instanceCount:](a1, (uint64_t)v26, 1);
      if (a11)
      {
        LODWORD(v44) = 0;
        LODWORD(v45) = 0;
        LODWORD(v46) = 0;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 248) + 3392), "setDepthBias:slopeScale:clamp:", v44, v45, v46);
      }
    }
    else if ((-[SCNMTLRenderContext renderMesh:meshElement:withProgram:engineContext:transform:color:rasterizerStates:blendState:texture:depthBias:]::done & 1) == 0)
    {
      -[SCNMTLRenderContext renderMesh:meshElement:withProgram:engineContext:transform:color:rasterizerStates:blendState:texture:depthBias:]::done = 1;
      v43 = scn_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[SCNMTLRenderContext renderMesh:meshElement:withProgram:engineContext:transform:color:rasterizerStates:blendState:texture:depthBias:].cold.1();
    }
  }
}

- (uint64_t)drawWireframeOverlayForElements:(unsigned int)a3 range:(int)a4 store:(uint64_t)a5 passInstance:(unsigned __int8 *)a6
{
  uint64_t *v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  unsigned int v17;
  unsigned int *v18;
  unint64_t v19;
  unsigned int v20;
  unsigned __int16 *Element;
  uint64_t Node;
  uint64_t Geometry;
  uint64_t Mesh;
  const void *MeshElement;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  SCNMetalWireframeResource *v29;
  uint64_t material;
  unsigned int *v31;
  uint64_t v32;
  void *program;
  uint64_t MTLVertexFormat;
  int v35;
  __int128 v36;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[9];
  int v41;
  char v42;
  char v43;
  __int16 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = (uint64_t *)result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 248) + 3392), "pushDebugGroup:", CFSTR("SceneKit - Draw wireframe"));
    LODWORD(v11) = -1138501878;
    LODWORD(v12) = -1194215657;
    LODWORD(v13) = -10.0;
    objc_msgSend(*(id *)(v10[31] + 3392), "setDepthBias:slopeScale:clamp:", v13, v11, v12);
    v17 = a3 + a4;
    if (a3 < a3 + a4)
    {
      v18 = (unsigned int *)(a2 + 4 * a3);
      *(_QWORD *)&v14 = 257;
      v36 = v14;
      v19 = v17 - (unint64_t)a3;
      do
      {
        v20 = *v18++;
        a2 = a2 & 0xFFFFFFFF00000000 | v20;
        Element = (unsigned __int16 *)C3DRendererElementStoreGetElement(a5, a2);
        Node = C3DRendererElementGetNode((uint64_t)Element);
        Geometry = C3DRendererElementGetGeometry((uint64_t)Element);
        Mesh = C3DRendererElementGetMesh((uint64_t)Element);
        MeshElement = C3DRendererElementGetMeshElement((uint64_t)Element);
        if (MeshElement)
        {
          v26 = MeshElement;
          v27 = v10[282];
          if (v27)
            v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 80))(v27);
          else
            v28 = 0;
          v29 = -[SCNMTLResourceManager wireframeResourceForRendererElement:engineContext:passInstance:hashPass:](v10[14], Element, v10[18], a6, v28);
          if (v29)
          {
            v39 = Mesh;
            material = (uint64_t)v29->material;
            v38 = Node;
            v31 = v18;
            v32 = a5;
            program = v29->program;
            MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat(material);
            -[SCNMTLRenderContext setRasterizerStates:]((uint64_t)v10, MTLVertexFormat);
            v35 = (Element[36] >> 11) & 7;
            v40[0] = program;
            v40[1] = material;
            a5 = v32;
            v18 = v31;
            v40[2] = Geometry;
            v40[3] = v38;
            v40[4] = v39;
            v40[5] = v26;
            memset(&v40[6], 0, 24);
            v41 = v36;
            v42 = 0;
            v43 = v35;
            v44 = 0;
            objc_msgSend(v10, "_executeDrawCommand:", v40);
          }
        }
        --v19;
      }
      while (v19);
    }
    LODWORD(v14) = 0;
    LODWORD(v15) = 0;
    LODWORD(v16) = 0;
    objc_msgSend(*(id *)(v10[31] + 3392), "setDepthBias:slopeScale:clamp:", *(double *)&v14, v15, v16, v36);
    return objc_msgSend(*(id *)(v10[31] + 3392), "popDebugGroup");
  }
  return result;
}

float __81__SCNMTLRenderContext_startProcessingRendererElementsWithEngineIterationContext___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *Light;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  float32x4_t v13;
  __int32 Type;
  int32x4_t v15;
  int32x4_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  float result;

  *(_QWORD *)(a1[4] + 8 * *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24) + 6552) = *(_QWORD *)(a3 + 400);
  v6 = *(_QWORD *)(a3 + 416);
  if (!v6)
    v6 = *(_QWORD *)(a3 + 400);
  *(_QWORD *)(a1[4] + 8 * *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24) + 8600) = v6;
  v7 = *(_QWORD *)(a3 + 424);
  if (v7 || (v7 = *(_QWORD *)(a3 + 408)) != 0)
    *(_QWORD *)(a1[4] + 8 * *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24) + 10648) = -[SCNMTLResourceManager renderResourceForSampler:](*(_QWORD *)(a1[4] + 112), v7);
  Light = C3DNodeGetLight(a2);
  v9 = a1[6];
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(_DWORD *)(v10 + 24);
  *(_DWORD *)(v10 + 24) = v11 + 1;
  v12 = v9 + 208 * v11;
  v13 = *(float32x4_t *)a3;
  *(_OWORD *)v12 = *(_OWORD *)a3;
  v13.i32[3] = *(_DWORD *)(a3 + 396);
  *(float32x4_t *)v12 = v13;
  Type = C3DLightGetType((uint64_t)Light);
  v15.i32[0] = 1;
  v16.i32[0] = Type;
  *(float32x4_t *)(v12 + 16) = vmulq_f32(*(float32x4_t *)a3, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v16, v15), 0), (int8x16_t)vdupq_n_s32(0x40490FDBu), (int8x16_t)vdupq_n_s32(0x447A0000u)));
  *(_OWORD *)(v12 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v12 + 64) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v12 + 96) = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(a3 + 96);
  v17 = *(_OWORD *)(a3 + 144);
  v18 = *(_OWORD *)(a3 + 160);
  v19 = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(v12 + 144) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v12 + 160) = v17;
  *(_OWORD *)(v12 + 176) = v18;
  *(_OWORD *)(v12 + 192) = v19;
  result = *(float *)(a3 + 116);
  *(float *)(v12 + 128) = result;
  return result;
}

- (uint64_t)setShowsAuthoringEnvironment:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 15416) = a2;
  return result;
}

- (BOOL)forceAsyncShaderCompilation
{
  if (result)
    return *(char *)(result + 152) < 0;
  return result;
}

- (uint64_t)setForceAsyncShaderCompilation:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 0x80;
    else
      v2 = 0;
    *(_BYTE *)(result + 152) = v2 & 0x80 | *(_BYTE *)(result + 152) & 0x7F;
  }
  return result;
}

- (void)setCollectsCompilationErrors:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 15424) = a2;
    v3 = *(id *)(a1 + 15432);
    if (a2)
    {
      if (!v3)
      {
        v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *(_QWORD *)(a1 + 15432) = v3;
      }
      objc_msgSend(v3, "removeAllObjects");
    }
    else
    {

      *(_QWORD *)(a1 + 15432) = 0;
    }
  }
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  __int128 v5;
  __int128 v6;

  result = *(__n128 *)(a4 + 12704);
  v5 = *(_OWORD *)(a4 + 12720);
  v6 = *(_OWORD *)(a4 + 12752);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a4 + 12736);
  *(_OWORD *)(a2 + 48) = v6;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2(uint64_t a1, simd_float4x4 *a2, uint64_t a3, uint64_t a4)
{
  *a2 = __invert_f4(*(simd_float4x4 *)(a4 + 12704));
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4(uint64_t a1, _QWORD *a2, int a3, uint64_t a4)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 != 8)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __39__SCNMTLRenderContext_registerBindings__block_invoke_4_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  *a2 = *(_QWORD *)(a4 + 14080);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_113(uint64_t a1, simd_float4x4 *a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  float32x4_t *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  _OWORD v22[4];
  _OWORD v23[4];

  v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 2) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 2;
    if (a6)
    {
      v7 = 0;
      v8 = *(_OWORD *)(a4 + 12704);
      v9 = *(_OWORD *)(a4 + 12720);
      v10 = *(_OWORD *)(a4 + 12736);
      v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        v12 = 0;
        v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        v14 = *v13;
        v15 = v13[1];
        v16 = v13[2];
        v17 = v13[3];
        v22[0] = v8;
        v22[1] = v9;
        v22[2] = v10;
        v22[3] = v11;
        do
        {
          v23[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v22[v12])), v15, *(float32x2_t *)&v22[v12], 1), v16, (float32x4_t)v22[v12], 2), v17, (float32x4_t)v22[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        v18 = v23[1];
        v19 = v23[2];
        v20 = v23[3];
        v21 = (_OWORD *)(a4 + 13216 + (v7 << 6));
        *v21 = v23[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  *a2 = __invert_f4(*(simd_float4x4 *)(a4 + ((unint64_t)a5 << 6) + 13216));
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_2_117(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  float32x4_t *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  uint64_t v22;
  uint64_t v23;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  __int128 v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  uint64_t v40;
  __n128 result;
  __int128 v42;
  __int128 v43;
  _OWORD v44[4];
  _OWORD v45[4];

  v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 1) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 1;
    if ((v6 & 2) == 0)
    {
      *(_DWORD *)(a4 + 14056) = v6 | 3;
      if (!a6)
        goto LABEL_11;
      v7 = 0;
      v8 = *(_OWORD *)(a4 + 12704);
      v9 = *(_OWORD *)(a4 + 12720);
      v10 = *(_OWORD *)(a4 + 12736);
      v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        v12 = 0;
        v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        v14 = *v13;
        v15 = v13[1];
        v16 = v13[2];
        v17 = v13[3];
        v44[0] = v8;
        v44[1] = v9;
        v44[2] = v10;
        v44[3] = v11;
        do
        {
          v45[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v44[v12])), v15, *(float32x2_t *)&v44[v12], 1), v16, (float32x4_t)v44[v12], 2), v17, (float32x4_t)v44[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        v18 = v45[1];
        v19 = v45[2];
        v20 = v45[3];
        v21 = (_OWORD *)(a4 + 13216 + (v7 << 6));
        *v21 = v45[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
    if (a6)
    {
      v22 = a4 + 12832;
      v23 = a6;
      __asm { FMOV            V0.4S, #1.0 }
      do
      {
        v29 = *(float32x4_t *)(v22 + 384);
        v30 = *(float32x4_t *)(v22 + 400);
        v31 = *(float32x4_t *)(v22 + 416);
        v32 = *(_OWORD *)(v22 + 432);
        v33 = (int32x4_t)vmulq_f32(v29, v29);
        v34 = (int32x4_t)vmulq_f32(v30, v30);
        v35 = (int32x4_t)vmulq_f32(v31, v31);
        v36 = vzip2q_s32(v33, v35);
        v37 = (float32x4_t)vzip1q_s32(vzip1q_s32(v33, v35), v34);
        v38 = (float32x4_t)vtrn2q_s32(v33, v34);
        v38.i32[2] = v35.i32[1];
        v39 = vdivq_f32(_Q0, vaddq_f32((float32x4_t)vzip1q_s32(v36, vdupq_laneq_s32(v34, 2)), vaddq_f32(v37, v38)));
        *(float32x4_t *)v22 = vmulq_n_f32(v29, v39.f32[0]);
        *(float32x4_t *)(v22 + 16) = vmulq_lane_f32(v30, *(float32x2_t *)v39.f32, 1);
        *(float32x4_t *)(v22 + 32) = vmulq_laneq_f32(v31, v39, 2);
        *(_OWORD *)(v22 + 48) = v32;
        v22 += 64;
        --v23;
      }
      while (v23);
    }
  }
LABEL_11:
  v40 = a4 + ((unint64_t)a5 << 6);
  result = *(__n128 *)(v40 + 12832);
  v42 = *(_OWORD *)(v40 + 12848);
  v43 = *(_OWORD *)(v40 + 12880);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v40 + 12864);
  *(_OWORD *)(a2 + 48) = v43;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v42;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_3_121(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  float32x4_t *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  uint64_t v22;
  __n128 result;
  __int128 v24;
  __int128 v25;
  _OWORD v26[4];
  _OWORD v27[4];

  v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 4) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 4;
    if (a6)
    {
      v7 = 0;
      v8 = *(_OWORD *)(a4 + 12704);
      v9 = *(_OWORD *)(a4 + 12720);
      v10 = *(_OWORD *)(a4 + 12736);
      v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        v12 = 0;
        v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        v14 = v13[12];
        v15 = v13[13];
        v16 = v13[14];
        v17 = v13[15];
        v26[0] = v8;
        v26[1] = v9;
        v26[2] = v10;
        v26[3] = v11;
        do
        {
          v27[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v26[v12])), v15, *(float32x2_t *)&v26[v12], 1), v16, (float32x4_t)v26[v12], 2), v17, (float32x4_t)v26[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        v18 = v27[1];
        v19 = v27[2];
        v20 = v27[3];
        v21 = (_OWORD *)(a4 + 13600 + (v7 << 6));
        *v21 = v27[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  v22 = a4 + ((unint64_t)a5 << 6);
  result = *(__n128 *)(v22 + 13600);
  v24 = *(_OWORD *)(v22 + 13616);
  v25 = *(_OWORD *)(v22 + 13648);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v22 + 13632);
  *(_OWORD *)(a2 + 48) = v25;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v24;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_4_125(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  __int128 v5;
  __int128 v6;

  result = *(__n128 *)(a4 + 12768);
  v5 = *(_OWORD *)(a4 + 12784);
  v6 = *(_OWORD *)(a4 + 12816);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a4 + 12800);
  *(_OWORD *)(a2 + 48) = v6;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

float __39__SCNMTLRenderContext_registerBindings__block_invoke_5(uint64_t a1, float *a2, uint64_t a3, uint64_t a4)
{
  float result;

  result = *(float *)(a4 + 2744);
  *a2 = result;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6(uint64_t a1, simd_float4x4 *a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  float32x4_t *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  _OWORD v22[4];
  _OWORD v23[4];

  v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 4) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 4;
    if (a6)
    {
      v7 = 0;
      v8 = *(_OWORD *)(a4 + 12704);
      v9 = *(_OWORD *)(a4 + 12720);
      v10 = *(_OWORD *)(a4 + 12736);
      v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        v12 = 0;
        v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        v14 = v13[12];
        v15 = v13[13];
        v16 = v13[14];
        v17 = v13[15];
        v22[0] = v8;
        v22[1] = v9;
        v22[2] = v10;
        v22[3] = v11;
        do
        {
          v23[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v22[v12])), v15, *(float32x2_t *)&v22[v12], 1), v16, (float32x4_t)v22[v12], 2), v17, (float32x4_t)v22[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        v18 = v23[1];
        v19 = v23[2];
        v20 = v23[3];
        v21 = (_OWORD *)(a4 + 13600 + (v7 << 6));
        *v21 = v23[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  *a2 = __invert_f4(*(simd_float4x4 *)(a4 + ((unint64_t)a5 << 6) + 13600));
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t v6;
  __n128 result;
  float32x4_t v8;
  float32x4_t v9;

  C3DNodeGetLocalBoundingBox(a4[878].i64[0], &v8);
  v6 = vaddq_f32(v8, v9);
  a4[874] = vsubq_f32(v8, v9);
  a4[875] = v6;
  result = (__n128)a4[875];
  *(float32x4_t *)a2 = a4[874];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  __n128 result;
  float32x4_t v12;
  float32x4_t v13;

  C3DNodeGetLocalBoundingBox(a4[878].i64[0], &v12);
  v6 = a4[794];
  v7 = a4[795];
  v8 = a4[796];
  v9 = vaddq_f32(a4[797], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v7, *(float32x2_t *)v12.f32, 1), v6, v12.f32[0]), v8, v12, 2));
  v10 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_n_f32(v6, v13.f32[0])), vabsq_f32(vmulq_lane_f32(v7, *(float32x2_t *)v13.f32, 1))), vabsq_f32(vmulq_laneq_f32(v8, v13, 2)));
  a4[876] = vsubq_f32(v9, v10);
  a4[877] = vaddq_f32(v9, v10);
  result = (__n128)a4[877];
  *(float32x4_t *)a2 = a4[876];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_9(uint64_t a1, float *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  float v6;

  v5 = *(_QWORD *)(a4 + 14048);
  if (v5)
    C3DNodeGetWorldAlpha(v5);
  else
    v6 = 1.0;
  *a2 = v6;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *LightProbesSystem;
  uint64_t SphericalHarmonicsOrder;
  __n128 result;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  float32x4_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  float32x4_t v34;
  int32x4_t v35;
  float32x4_t v36;
  __int128 v37;
  __int128 v38;
  __n128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  LightProbesSystem = (_QWORD *)C3DLightingSystemGetLightProbesSystem(*(_QWORD *)(a4 + 2232));
  SphericalHarmonicsOrder = C3DLightProbesSystemGetSphericalHarmonicsOrder((uint64_t)LightProbesSystem);
  if (SphericalHarmonicsOrder == 3)
  {
    if (C3DNodeGetMovability(*(_QWORD *)(a4 + 14048))
      || !C3DNodeGetLocalBoundingBox(*(_QWORD *)(a4 + 14048), &v34))
    {
      C3DLightProbesQuerySH3(LightProbesSystem, *(unsigned int **)(a4 + 14064), &v36, *(int32x4_t *)(a4 + 12752));
    }
    else
    {
      v19 = *(float32x4_t *)(a4 + 12704);
      v20 = *(float32x4_t *)(a4 + 12720);
      v21 = *(float32x4_t *)(a4 + 12736);
      v22 = (int32x4_t)vaddq_f32(*(float32x4_t *)(a4 + 12752), vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v20, *(float32x2_t *)v34.f32, 1), v19, v34.f32[0]), v21, v34, 2));
      v22.i32[3] = 1.0;
      v23 = (float32x4_t)v35;
      v23.i32[1] = v35.i32[0];
      v23.i32[2] = v35.i32[0];
      C3DLightProbesQueryBoxSH3(LightProbesSystem, *(unsigned int **)(a4 + 14064), &v36, v22, vaddq_f32(vaddq_f32(vabsq_f32(vmulq_f32(v19, v23)), vabsq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v35.i8, 1), v35), v20))), vabsq_f32(vmulq_f32((float32x4_t)vzip2q_s32(vtrn1q_s32(v35, v35), v35), v21))));
    }
    if (a3 != 112)
    {
      v24 = scn_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __39__SCNMTLRenderContext_registerBindings__block_invoke_10_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    v32 = v41;
    *(_OWORD *)(a2 + 64) = v40;
    *(_OWORD *)(a2 + 80) = v32;
    *(_OWORD *)(a2 + 96) = v42;
    v33 = v37;
    *(float32x4_t *)a2 = v36;
    *(_OWORD *)(a2 + 16) = v33;
    result = v39;
    *(_OWORD *)(a2 + 32) = v38;
    *(__n128 *)(a2 + 48) = result;
  }
  else if (SphericalHarmonicsOrder == 2)
  {
    C3DLightProbesQuerySH2((uint64_t)LightProbesSystem, *(unsigned int **)(a4 + 14064), &v36, *(int32x4_t *)(a4 + 12752));
    if (a3 != 48)
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __39__SCNMTLRenderContext_registerBindings__block_invoke_10_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v18 = v37;
    *(float32x4_t *)a2 = v36;
    *(_OWORD *)(a2 + 16) = v18;
    result.n128_u64[0] = v38;
    *(_OWORD *)(a2 + 32) = v38;
  }
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_146(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = *(char *)(a2 + 9);
  v6 = *(char *)(a2 + 10);
  v7 = (void *)objc_msgSend(*(id *)(a3 + 15232), "bufferAtIndices:", *(unsigned __int16 *)(a2 + 9));
  if (objc_msgSend(v7, "buffer"))
  {
    v8 = *(void **)(a2 + 16);
    if (v8)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*(_QWORD *)(a3 + 248) + 3392), "useResource:usage:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), 4);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
        }
        while (v10);
      }
    }
    v13 = *(_QWORD *)(a3 + 248);
    v14 = objc_msgSend(v7, "buffer");
    v15 = objc_msgSend(v7, "offset");
    v16 = *(_WORD *)(a2 + 9);
    if ((_BYTE)v16 != 0xFF)
      SCNMTLRenderCommandEncoder::setVertexBuffer(v13, v14, v15, (char)v16);
    if ((~v16 & 0xFF00) != 0)
    {
      v17 = (uint64_t)v16 >> 8;
      v18 = v13;
      v19 = v14;
      v20 = v15;
LABEL_14:
      SCNMTLRenderCommandEncoder::setFragmentBuffer(v18, v19, v20, v17);
    }
  }
  else if ((_DWORD)v5 != -1 && (v21 = *(_QWORD *)(a3 + 248), !*(_QWORD *)(v21 + 16 * v5 + 80))
         || (_DWORD)v6 != -1 && (v21 = *(_QWORD *)(a3 + 248), !*(_QWORD *)(v21 + 16 * v6 + 1728)))
  {
    v22 = objc_msgSend((id)objc_msgSend((id)a2, "argument"), "bufferDataSize");
    v23 = *(_WORD *)(a2 + 9);
    v30 = 0;
    v31 = 0;
    v32 = 0;
    SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(v21 + 3400), v22, &v30);
    bzero(v30, v22);
    v24 = v31;
    v25 = v32;
    if ((_BYTE)v23 != 0xFF)
      SCNMTLRenderCommandEncoder::setVertexBuffer(v21, v31, v32, (char)v23);
    if ((~v23 & 0xFF00) != 0)
    {
      v17 = (uint64_t)v23 >> 8;
      v18 = v21;
      v19 = v24;
      v20 = v25;
      goto LABEL_14;
    }
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2_149(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id Weak;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = (void *)objc_msgSend(*(id *)(a3 + 15232), "textureAtIndices:", *(unsigned __int16 *)(a2 + 9));
  if (!v5)
  {
    v5 = (void *)objc_msgSend(*(id *)(a3 + 112), "defaultTexture");
    Weak = objc_loadWeak((id *)(a3 + 15472));
    if (Weak)
      objc_msgSend(Weak, "renderContext:didFallbackToDefaultTextureForSource:message:", a3, a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find texture for binding %@ and shadable %@"), a2, *(_QWORD *)(a3 + 15232)));
  }
  v7 = *(_QWORD *)(a3 + 248);
  v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(*(_QWORD *)(a3 + 248), v5, (char)v8);
  if ((~v8 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v7, v5, (uint64_t)v8 >> 8);
  v9 = *(unsigned __int8 *)(a2 + 11);
  v10 = *(unsigned __int8 *)(a2 + 12);
  if (v10 != 255 || (_DWORD)v9 != 255)
  {
    v11 = objc_msgSend(*(id *)(a3 + 15232), "samplerAtIndices:", v9 | (v10 << 8));
    v12 = v11;
    v13 = *(_QWORD *)(a3 + 248);
    if ((_DWORD)v9 != 255)
    {
      v14 = v13 + 8 * (char)v9;
      if (*(_QWORD *)(v14 + 1600) != v11)
      {
        *(_QWORD *)(v14 + 1600) = v11;
        objc_msgSend(*(id *)(v13 + 3392), "setVertexSamplerState:atIndex:", v11, (char)v9);
      }
    }
    if ((_DWORD)v10 != 255)
    {
      v15 = v13 + 8 * (char)v10;
      if (*(_QWORD *)(v15 + 3248) != v12)
      {
        *(_QWORD *)(v15 + 3248) = v12;
        objc_msgSend(*(id *)(v13 + 3392), "setFragmentSamplerState:atIndex:", v12, (char)v10);
      }
    }
  }
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_3_153(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  result = objc_msgSend(*(id *)(a3 + 15232), "samplerAtIndices:", *(unsigned __int16 *)(a2 + 9));
  v6 = result;
  v7 = *(_QWORD *)(a3 + 248);
  v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF)
  {
    v9 = v7 + 8 * (char)v8;
    if (*(_QWORD *)(v9 + 1600) != result)
    {
      *(_QWORD *)(v9 + 1600) = result;
      result = objc_msgSend(*(id *)(v7 + 3392), "setVertexSamplerState:atIndex:", result, (char)v8);
    }
  }
  if ((~v8 & 0xFF00) != 0)
  {
    v10 = v7 + 8 * ((uint64_t)v8 >> 8);
    if (*(_QWORD *)(v10 + 3248) != v6)
    {
      *(_QWORD *)(v10 + 3248) = v6;
      return objc_msgSend(*(id *)(v7 + 3392), "setFragmentSamplerState:atIndex:", v6);
    }
  }
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_4_157(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;
  uint64_t result;

  v3 = a3[31];
  v4 = a3[1857];
  v5 = a3[1858];
  v6 = *(_WORD *)(a2 + 9);
  if (*(_BYTE *)(a2 + 9) != 0xFF)
    result = SCNMTLRenderCommandEncoder::setVertexBuffer(a3[31], a3[1857], a3[1858], (char)v6);
  if ((~v6 & 0xFF00) != 0)
    return SCNMTLRenderCommandEncoder::setFragmentBuffer(v3, v4, v5, (uint64_t)v6 >> 8);
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_5_161(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *(_DWORD *)(a3 + 14872);
  v3 = *(_WORD *)(a2 + 9);
  v4 = *(_QWORD *)(a3 + 248);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  result = (uint64_t)SCNMTLBufferPool::allocateAndCopy(*(SCNMTLBufferPool **)(v4 + 3400), &v8, 4uLL, &v9);
  v6 = v10;
  v7 = v11;
  if ((_BYTE)v3 != 0xFF)
    result = SCNMTLRenderCommandEncoder::setVertexBuffer(v4, v10, v11, (char)v3);
  if ((~v3 & 0xFF00) != 0)
    return SCNMTLRenderCommandEncoder::setFragmentBuffer(v4, v6, v7, (uint64_t)v3 >> 8);
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_165(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *LightProbesSystem;
  NSObject *v6;
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
  __int16 v17;
  float32x4_t *v18;
  uint64_t v19;
  uint64_t v20;

  LightProbesSystem = (_QWORD *)C3DLightingSystemGetLightProbesSystem(*(_QWORD *)(a3 + 2232));
  if (C3DLightProbesSystemGetSphericalHarmonicsOrder((uint64_t)LightProbesSystem) != 3)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __39__SCNMTLRenderContext_registerBindings__block_invoke_6_165_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v18 = 0;
  v19 = 0;
  v20 = 0;
  SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(a3 + 2088), 112, &v18);
  C3DLightProbesQuerySH3(LightProbesSystem, *(unsigned int **)(a3 + 14064), v18, *(int32x4_t *)(a3 + 12752));
  v14 = *(_QWORD *)(a3 + 248);
  v16 = v19;
  v15 = v20;
  v17 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v17 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexBuffer(v14, v19, v20, (char)v17);
  if ((~v17 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentBuffer(v14, v16, v15, (uint64_t)v17 >> 8);
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10;
  float v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  float MinimumPointScreenRadius;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  __asm { FMOV            V0.4S, #1.0 }
  v22 = _Q0;
  v10 = *(_QWORD *)(a3 + 15192);
  if (v10)
  {
    v11 = *(float *)(a3 + 2900) * *(float *)(a3 + 2436);
    *(float *)&v18 = C3DMeshElementGetPointSize(v10) * v11;
    MinimumPointScreenRadius = C3DMeshElementGetMinimumPointScreenRadius(*(_QWORD *)(a3 + 15192));
    DWORD2(v22) = C3DMeshElementGetMaximumPointScreenRadius(*(_QWORD *)(a3 + 15192));
    *(_QWORD *)&v22 = __PAIR64__(LODWORD(MinimumPointScreenRadius), v18);
  }
  v19 = 0;
  v20 = 0;
  v21 = 0;
  result = (uint64_t)SCNMTLBufferPool::allocateAndCopy(*(SCNMTLBufferPool **)(a3 + 2088), &v22, 0x10uLL, &v19);
  v13 = *(_QWORD *)(a3 + 248);
  v15 = v20;
  v14 = v21;
  v16 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v16 != 0xFF)
    result = SCNMTLRenderCommandEncoder::setVertexBuffer(v13, v20, v21, (char)v16);
  if ((~v16 & 0xFF00) != 0)
    return SCNMTLRenderCommandEncoder::setFragmentBuffer(v13, v15, v14, (uint64_t)v16 >> 8);
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2_176(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  __int16 v5;

  v3 = *(_QWORD *)(a3 + 248);
  v4 = *(void **)(a3 + 14760);
  v5 = *(_WORD *)(a2 + 9);
  if (*(_BYTE *)(a2 + 9) != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v3, v4, (char)v5);
  if ((~v5 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v3, v4, (uint64_t)v5 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_3_180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  __int16 v5;

  v3 = *(_QWORD *)(a3 + 248);
  v4 = *(void **)(a3 + 14768);
  v5 = *(_WORD *)(a2 + 9);
  if (*(_BYTE *)(a2 + 9) != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v3, v4, (char)v5);
  if ((~v5 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v3, v4, (uint64_t)v5 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  __int16 v7;

  v5 = (void *)objc_msgSend(*(id *)(a3 + 112), "areaLightPrecomputedDataTexture");
  v6 = *(_QWORD *)(a3 + 248);
  v7 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v7 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v6, v5, (char)v7);
  if ((~v7 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v6, v5, (uint64_t)v7 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  float v6;
  uint64_t v7;
  __int16 v8;
  float32x4_t v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a3 + 2216);
  if (!v5)
  {
    if ((*(_BYTE *)(a3 + 152) & 0x40) != 0)
      v6 = 1.0;
    else
      v6 = -1.0;
    C3DSetupHaltonFilterKernelConic(v9, 32, 1.0, 1.0, v6);
    v5 = objc_msgSend(*(id *)(a3 + 120), "newBufferWithBytes:length:options:", v9, 512, 0);
    *(_QWORD *)(a3 + 2216) = v5;
  }
  v7 = *(_QWORD *)(a3 + 248);
  v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexBuffer(v7, v5, 0, (char)v8);
  if ((~v8 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentBuffer(v7, v5, 0, (uint64_t)v8 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_190(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t EffectSlot;
  void *v7;
  uint64_t TextureSampler;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id Weak;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  __int16 v24;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  EffectSlot = C3DEffectCommonProfileGetEffectSlot(*(_QWORD *)(a4 + 15240), a2, 0);
  if (EffectSlot)
  {
    v7 = (void *)objc_msgSend(*(id *)(a4 + 112), "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", EffectSlot, *(_QWORD *)(a4 + 144), 0);
    v31 = v7;
    TextureSampler = C3DEffectSlotGetTextureSampler(EffectSlot);
    if (v7)
      goto LABEL_10;
  }
  else
  {
    TextureSampler = 0;
  }
  v7 = (void *)objc_msgSend(*(id *)(a4 + 112), "defaultTexture");
  v31 = v7;
  if (!v7)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      C3DRendererContextApplyTextureSampler_cold_2(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  Weak = objc_loadWeak((id *)(a4 + 15472));
  if (Weak)
    objc_msgSend(Weak, "renderContext:didFallbackToDefaultTextureForSource:message:", a4, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find texture for binding %@ and effect slot %@"), a3, EffectSlot));
LABEL_10:
  if (!TextureSampler)
    TextureSampler = C3DTextureSamplerGetDefault();
  v18 = *(char *)(a3 + 11);
  v19 = *(char *)(a3 + 12);
  if (objc_msgSend(v7, "pixelFormat") == 520 || objc_msgSend(v7, "pixelFormat") == 500)
  {
    v20 = -[SCNMTLResourceManager renderResourceForSampler:](*(_QWORD *)(a4 + 112), TextureSampler);
    v21 = *(void **)(*(_QWORD *)(a4 + 248) + 3392);
    if (*(unsigned __int8 *)(a3 + 9) != 255)
    {
      v22 = scn_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __39__SCNMTLRenderContext_registerBindings__block_invoke_6_190_cold_1();
    }
    if (*(unsigned __int8 *)(a3 + 10) != 255)
    {
      SCNMTLEnsureIOSurfaceBackingBufferValidity(*(__IOSurface **)(a4 + 240), &v31, 1u);
      objc_msgSend(v21, "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", v31, *(char *)(a3 + 10), v20, v19);
    }
  }
  else
  {
    v23 = *(_QWORD *)(a4 + 248);
    v24 = *(_WORD *)(a3 + 9);
    if ((_BYTE)v24 != 0xFF)
      SCNMTLRenderCommandEncoder::setVertexTexture(*(_QWORD *)(a4 + 248), v7, (char)v24);
    if ((~v24 & 0xFF00) != 0)
      SCNMTLRenderCommandEncoder::setFragmentTexture(v23, v7, (uint64_t)v24 >> 8);
    if ((_DWORD)v19 != -1 || (_DWORD)v18 != -1)
    {
      v26 = -[SCNMTLResourceManager renderResourceForSampler:](*(_QWORD *)(a4 + 112), TextureSampler);
      v27 = v26;
      v28 = *(_QWORD *)(a4 + 248);
      if ((_DWORD)v18 != -1)
      {
        v29 = v28 + 8 * v18;
        if (*(void **)(v29 + 1600) != v26)
        {
          *(_QWORD *)(v29 + 1600) = v26;
          objc_msgSend(*(id *)(v28 + 3392), "setVertexSamplerState:atIndex:", v26, v18);
        }
      }
      if ((_DWORD)v19 != -1)
      {
        v30 = v28 + 8 * v19;
        if (*(void **)(v30 + 3248) != v27)
        {
          *(_QWORD *)(v30 + 3248) = v27;
          objc_msgSend(*(id *)(v28 + 3392), "setFragmentSamplerState:atIndex:", v27, v19);
        }
      }
    }
  }
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_197(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 40) == 1)
    C3DEffectCommonProfileIsUsingAmbientOcclusion(*(_QWORD *)(a3 + 15240));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_2_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_3_203(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int16 v8;

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(a3 + 152) & 0x20) != 0)
  {
    v4 = a3 + 8 * *(unsigned __int8 *)(a3 + v3 + 14080);
    v5 = 6552;
  }
  else
  {
    v4 = a3 + 8 * v3;
    v5 = 14880;
  }
  v6 = *(void **)(v4 + v5);
  if (v6)
  {
    v7 = *(_QWORD *)(a3 + 248);
    v8 = *(_WORD *)(a2 + 9);
    if (*(_BYTE *)(a2 + 9) != 0xFF)
      SCNMTLRenderCommandEncoder::setVertexTexture(v7, v6, (char)v8);
    if ((~v8 & 0xFF00) != 0)
      SCNMTLRenderCommandEncoder::setFragmentTexture(v7, v6, (uint64_t)v8 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_205(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t Default;
  id Weak;

  v5 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(a3 + 152) & 0x20) != 0)
  {
    v9 = a3 + 8 * *(unsigned __int8 *)(a3 + v5 + 14080);
    v7 = *(void **)(v9 + 8600);
    v8 = *(void **)(v9 + 10648);
  }
  else
  {
    v6 = a3 + 8 * v5;
    v7 = *(void **)(v6 + 14944);
    if (v7)
    {
      v8 = *(void **)(v6 + 15008);
      goto LABEL_9;
    }
    v7 = (void *)objc_msgSend(*(id *)(a3 + 112), "defaultTexture");
    v25 = *(_QWORD *)(a3 + 112);
    Default = C3DTextureSamplerGetDefault();
    v8 = -[SCNMTLResourceManager renderResourceForSampler:](v25, Default);
    Weak = objc_loadWeak((id *)(a3 + 15472));
    if (Weak)
      objc_msgSend(Weak, "renderContext:didFallbackToDefaultTextureForSource:message:", a3, a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find IES or gobo texture for binding %@"), a2));
  }
  if (!v7)
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      C3DRendererContextApplyTextureSampler_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
    v7 = 0;
  }
LABEL_9:
  v18 = *(_QWORD *)(a3 + 248);
  v19 = *(_WORD *)(a2 + 9);
  if (*(_BYTE *)(a2 + 9) != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(*(_QWORD *)(a3 + 248), v7, (char)v19);
  if ((~v19 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v18, v7, (uint64_t)v19 >> 8);
  v20 = *(unsigned __int8 *)(a2 + 11);
  v21 = *(char *)(a2 + 12);
  if (v21 != -1 || v20 != 255)
  {
    v22 = *(_QWORD *)(a3 + 248);
    if ((char)v20 != -1)
    {
      v23 = v22 + 8 * (char)v20;
      if (*(void **)(v23 + 1600) != v8)
      {
        *(_QWORD *)(v23 + 1600) = v8;
        objc_msgSend(*(id *)(v22 + 3392), "setVertexSamplerState:atIndex:", v8);
      }
    }
    if ((_DWORD)v21 != -1)
    {
      v24 = v22 + 8 * v21;
      if (*(void **)(v24 + 3248) != v8)
      {
        *(_QWORD *)(v24 + 3248) = v8;
        objc_msgSend(*(id *)(v22 + 3392), "setFragmentSamplerState:atIndex:", v8, v21);
      }
    }
  }
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_216(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 *v4;
  __n128 result;

  v4 = *(__n128 **)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336);
  result = *v4;
  *a2 = *v4;
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_2_220(uint64_t result, float32x4_t *a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t v4;
  float32x4_t v5;

  if (a4[908].i8[0])
  {
    v4 = *(float32x4_t *)(a4[896].i64[*(_QWORD *)(result + 32)] + 16);
    v5 = vaddq_f32(a4[903], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a4[900], v4.f32[0]), a4[901], *(float32x2_t *)v4.f32, 1), a4[902], v4, 2));
  }
  else
  {
    v5 = *(float32x4_t *)(a4[896].i64[*(_QWORD *)(result + 32)] + 16);
  }
  *a2 = v5;
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_3_223(uint64_t result, float32x4_t *a2, uint64_t a3, float32x4_t *a4)
{
  float32x4_t v4;
  float32x4_t v5;

  if (a4[908].i8[0])
  {
    v4 = *(float32x4_t *)(a4[896].i64[*(_QWORD *)(result + 32)] + 32);
    v5 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a4[900], v4.f32[0]), a4[901], *(float32x2_t *)v4.f32, 1), a4[902], v4, 2), (float32x4_t)0, a4[903]);
  }
  else
  {
    v5 = *(float32x4_t *)(a4[896].i64[*(_QWORD *)(result + 32)] + 32);
  }
  *a2 = v5;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_4_226(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336) + 64);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_5_229(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336) + 48);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_6_232(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = *(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336);
  result = *(__n128 *)(v4 + 128);
  v6 = *(_OWORD *)(v4 + 144);
  v7 = *(_OWORD *)(v4 + 160);
  v8 = *(_OWORD *)(v4 + 176);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_7_235(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336) + 80);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_8_238(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336) + 96);
  *a2 = result;
  return result;
}

void *__39__SCNMTLRenderContext_registerBindings__block_invoke_9_241(uint64_t a1, void *a2, unsigned int a3, simd_float4x4 *a4)
{
  size_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  float32x4_t *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD *v22;
  _BYTE *v23;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  simd_float4x4 v29;
  _OWORD v30[4];
  _BYTE v31[264];
  uint64_t v32;
  simd_float4x4 v33;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a3 >= 0x101)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __39__SCNMTLRenderContext_registerBindings__block_invoke_9_241_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  if (a4[227].columns[0].i8[0])
  {
    for (i = 0; i != 4; ++i)
    {
      v17 = (float32x4_t *)(a4[224].columns[0].i64[*(_QWORD *)(a1 + 32)] + (i << 6));
      v27 = v17[8];
      v28 = v17[9];
      v25 = v17[11];
      v26 = v17[10];
      v33 = __invert_f4(a4[225]);
      v18 = 0;
      v29 = v33;
      do
      {
        v30[v18] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)&v29.columns[v18])), v28, *(float32x2_t *)v29.columns[v18].f32, 1), v26, (float32x4_t)v29.columns[v18], 2), v25, (float32x4_t)v29.columns[v18], 3);
        ++v18;
      }
      while (v18 != 4);
      v19 = v30[1];
      v20 = v30[2];
      v21 = v30[3];
      v22 = &v31[64 * i];
      *v22 = v30[0];
      v22[1] = v19;
      v22[2] = v20;
      v22[3] = v21;
    }
    v23 = v31;
  }
  else
  {
    v23 = (_BYTE *)(a4[224].columns[0].i64[*(_QWORD *)(a1 + 32)] + 128);
  }
  return memcpy(a2, v23, v7);
}

float __39__SCNMTLRenderContext_registerBindings__block_invoke_245(uint64_t a1, float *a2, uint64_t a3, uint64_t a4)
{
  float result;

  result = *(float *)(*(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336) + 116);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_2_248(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336) + 384);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_3_251(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = *(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336);
  result = *(__n128 *)(v4 + 128);
  v6 = *(_OWORD *)(v4 + 144);
  v7 = *(_OWORD *)(v4 + 160);
  v8 = *(_OWORD *)(v4 + 176);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_4_254(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a4 + 8 * *(_QWORD *)(a1 + 32) + 14336) + 384);
  *a2 = result;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_257(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;

  v5 = a3[1884];
  v6 = a3[1885];
  v7 = a3[*(_QWORD *)(a1 + 32) + 1886];
  if (!v5)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __39__SCNMTLRenderContext_registerBindings__block_invoke_5_257_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = a3[31];
  v17 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v17 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexBuffer(v16, v5, v7 + v6, (char)v17);
  if ((~v17 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentBuffer(v16, v5, v7 + v6, (uint64_t)v17 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_261(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  __int16 v7;

  v5 = (void *)objc_msgSend(*(id *)(a3 + 112), "specularDFGDiffuseHammonTextureWithRenderContext:");
  v6 = *(_QWORD *)(a3 + 248);
  v7 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v7 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v6, v5, (char)v7);
  if ((~v7 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v6, v5, (uint64_t)v7 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2_265(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Scene;
  uint64_t LightingEnvironmentEffectSlot;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int16 v10;

  Scene = C3DEngineContextGetScene(*(_QWORD *)(a3 + 144));
  LightingEnvironmentEffectSlot = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
  if (!LightingEnvironmentEffectSlot
    || (v7 = LightingEnvironmentEffectSlot, !C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot))
    && !C3DEffectSlotHasPrecomputedLightingEnvironment(v7)
    || (v8 = (void *)-[SCNMTLRenderContext radianceTextureForEffectSlot:](a3, v7)) == 0)
  {
    if (!C3DEngineContextGetAllowsDefaultLightingEnvironmentFallback(*(_QWORD *)(a3 + 144))
      || (v8 = (void *)objc_msgSend(*(id *)(a3 + 112), "defaultLightingEnvironmentRadianceTexture")) == 0)
    {
      v8 = (void *)objc_msgSend(*(id *)(a3 + 112), "defaultCubeTexture");
    }
  }
  v9 = *(_QWORD *)(a3 + 248);
  v10 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v10 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v9, v8, (char)v10);
  if ((~v10 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v9, v8, (uint64_t)v10 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_3_269(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Scene;
  uint64_t LightingEnvironmentEffectSlot;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  __int16 v10;

  Scene = C3DEngineContextGetScene(*(_QWORD *)(a3 + 144));
  LightingEnvironmentEffectSlot = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
  if (!LightingEnvironmentEffectSlot
    || (v7 = LightingEnvironmentEffectSlot, !C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot))
    && !C3DEffectSlotHasPrecomputedLightingEnvironment(v7)
    || (v8 = -[SCNMTLRenderContext irradianceTextureForEffectSlot:]((_QWORD *)a3, v7)) == 0)
  {
    if (!C3DEngineContextGetAllowsDefaultLightingEnvironmentFallback(*(_QWORD *)(a3 + 144))
      || (v8 = (_QWORD *)objc_msgSend(*(id *)(a3 + 112), "defaultLightingEnvironmentIrradianceTexture")) == 0)
    {
      v8 = (_QWORD *)objc_msgSend(*(id *)(a3 + 112), "defaultCubeTexture");
    }
  }
  v9 = *(_QWORD *)(a3 + 248);
  v10 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v10 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v9, v8, (char)v10);
  if ((~v10 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v9, v8, (uint64_t)v10 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_273(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  __int16 v5;

  v3 = *(void **)(a3 + 15152);
  v4 = *(_QWORD *)(a3 + 248);
  v5 = *(_WORD *)(a2 + 9);
  if (*(_BYTE *)(a2 + 9) != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v4, v3, (char)v5);
  if ((~v5 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v4, v3, (uint64_t)v5 >> 8);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_277(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *TextureWithName;
  id Weak;
  uint64_t v7;
  __int16 v8;

  TextureWithName = (void *)C3DEngineContextGetTextureWithName(*(_QWORD *)(a3 + 144), CFSTR("SSAO-Final"));
  if (!TextureWithName)
  {
    TextureWithName = (void *)objc_msgSend(*(id *)(a3 + 112), "defaultTexture");
    Weak = objc_loadWeak((id *)(a3 + 15472));
    if (Weak)
      objc_msgSend(Weak, "renderContext:didFallbackToDefaultTextureForSource:message:", a3, a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find \"SSAO-Final\" texture in render graph for binding %@"), a2));
  }
  v7 = *(_QWORD *)(a3 + 248);
  v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF)
    SCNMTLRenderCommandEncoder::setVertexTexture(v7, TextureWithName, (char)v8);
  if ((~v8 & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentTexture(v7, TextureWithName, (uint64_t)v8 >> 8);
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_6_283(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  __C3DGeometry *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  __int16 v36;

  v5 = *(_QWORD *)(a3 + 15264);
  v6 = *(__C3DGeometry **)(a3 + 15224);
  v7 = *(_QWORD *)(a3 + 15272);
  if (!v5 && (v8 = scn_default_log(), os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)))
  {
    C3DGeometryTrackNode_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  v16 = scn_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    C3DGeometryGetName_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_6:
  if (!v7)
  {
    v24 = scn_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      __39__SCNMTLRenderContext_registerBindings__block_invoke_6_283_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
  }
  v32 = objc_msgSend(*(id *)(a3 + 112), "renderResourceForDeformerStack:node:dataKind:", v7, v5, C3DGeometryGetEffectiveDataKindForRendering(v6));
  result = -[SCNMTLDeformerStack bufferForCommonProfileArgumentNamed:](v32, objc_msgSend((id)a2, "name"));
  v34 = result;
  v35 = *(_QWORD *)(a3 + 248);
  v36 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v36 != 0xFF)
    result = SCNMTLRenderCommandEncoder::setVertexBuffer(v35, result, 0, (char)v36);
  if ((~v36 & 0xFF00) != 0)
    return SCNMTLRenderCommandEncoder::setFragmentBuffer(v35, v34, 0, (uint64_t)v36 >> 8);
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_292(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  _QWORD v9[5];

  v7 = objc_msgSend(a2, "frequency");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_295;
  v9[3] = &unk_1EA5A0778;
  v9[4] = a2;
  return objc_msgSend(a4, "addResourceBindingsForArgument:frequency:needsRenderResource:block:", a3, v7, 0, v9);
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_2_295(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v5;
  id *ObjCWrapper;
  id *v7;
  id *v8;
  uint64_t UserInfo;
  uint64_t v10;

  *(_WORD *)(a3 + 1998) = *(_WORD *)(a2 + 9);
  v5 = *(id **)(a3 + 15264);
  if (v5)
    ObjCWrapper = C3DEntityGetObjCWrapper(v5);
  else
    ObjCWrapper = 0;
  v7 = *(id **)(a3 + 15216);
  if (v7)
    v8 = C3DEntityGetObjCWrapper(v7);
  else
    v8 = 0;
  UserInfo = C3DEngineContextGetUserInfo(*(_QWORD *)(a3 + 144));
  v10 = objc_msgSend(*(id *)(a1 + 32), "block");
  return (*(uint64_t (**)(uint64_t, uint64_t, id *, id *, uint64_t))(v10 + 16))(v10, a3, ObjCWrapper, v8, UserInfo);
}

- (uint64_t)mapVolatileMesh:(uint64_t)a3 verticesCount:
{
  SCNMTLMesh *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[6];
  uint64_t v27;
  id newValue;
  uint64_t v29;

  if (!a1)
    return 0;
  if ((C3DMeshIsVolatile(a2) & 1) == 0)
  {
    v17 = scn_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      C3DRendererContextMapVolatileMesh_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
  v6 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(_QWORD *)(a1 + 112), a2, 1);
  if (!-[SCNMTLMesh volatileStride]((uint64_t)v6))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNMTLRenderContext mapVolatileMesh:verticesCount:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  -[SCNMTLMesh volatileBuffer]((uint64_t)v6);
  v15 = -[SCNMTLMesh volatileStride]((uint64_t)v6) * a3;
  v27 = 0;
  newValue = 0;
  v29 = 0;
  SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(a1 + 2024), v15, &v27);
  -[SCNMTLMesh setVolatileSize:]((uint64_t)v6, v15);
  -[SCNMTLMesh setVolatileBuffer:](v6, (char *)newValue);
  -[SCNMTLMesh setVolatileOffset:]((uint64_t)v6, v29);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__SCNMTLRenderContext_mapVolatileMesh_verticesCount___block_invoke;
  v26[3] = &__block_descriptor_48_e201_v32__0____C3DMeshSource____C3DGenericSource____C3DEntity____CFRuntimeBase_QAQ__v____CFString_____CFString_____CFDictionary_____C3DScene_q_____C3DSourceAccessor________CFData__v_v_qb1b1b1_SCC_8c16q20C28l;
  v26[4] = a3;
  v26[5] = v27;
  v16 = 1;
  C3DMeshApplySources(a2, 1, (uint64_t)v26);
  objc_msgSend(*(id *)(a1 + 2032), "addObject:", v6);
  return v16;
}

void __53__SCNMTLRenderContext_mapVolatileMesh_verticesCount___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t Accessor;
  uint64_t v5;

  if (C3DMeshSourceIsVolatile(a2))
  {
    Accessor = C3DMeshSourceGetAccessor(a2);
    C3DSourceAccessorSetCount(Accessor, *(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40) + C3DSourceAccessorGetOffset(Accessor);
    C3DMeshSourceSetVolatileData(a2, v5);
  }
}

- (void)unmapVolatileMesh:(uint64_t)a3 modifiedVerticesCount:
{
  SCNMTLMesh *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1)
  {
    if ((C3DMeshIsVolatile(a2) & 1) != 0)
    {
      v6 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(_QWORD *)(a1 + 112), a2, 1);
      -[SCNMTLRenderContext sampleCount]((uint64_t)v6);
      if ((a3 & 0x8000000000000000) == 0)
        -[SCNMTLMesh volatileStride]((uint64_t)v6);
      v7 = -[SCNMTLMesh volatileBuffer]((uint64_t)v6);
      -[SCNMTLMesh volatileOffset]((uint64_t)v6);
      if (!v7)
      {
        v8 = scn_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          -[SCNMTLRenderContext unmapVolatileMesh:modifiedVerticesCount:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      C3DMeshApplySources(a2, 1, (uint64_t)&__block_literal_global_301);
    }
    else
    {
      v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        C3DRendererContextMapVolatileMesh_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

void __63__SCNMTLRenderContext_unmapVolatileMesh_modifiedVerticesCount___block_invoke(uint64_t a1, uint64_t a2)
{
  if (C3DMeshSourceIsVolatile(a2))
    C3DMeshSourceSetVolatileData(a2, 0);
}

- (void)resetVolatileMeshes
{
  NSMutableArray *volatileMeshes;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  volatileMeshes = self->_volatileMeshes;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](volatileMeshes, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(volatileMeshes);
        -[SCNMTLMesh setVolatileBuffer:](*(void **)(*((_QWORD *)&v8 + 1) + 8 * i), 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](volatileMeshes, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_volatileMeshes, "removeAllObjects");
}

- (id)_newMTLBufferFromPoolWithLength:(unint64_t)a3
{
  SCNMTLBuffer *v5;
  SCNMTLBuffer *v6;
  SCNMTLBuffer *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (SCNMTLBuffer *)-[NSMutableArray lastObject](self->_bufferPool, "lastObject");
  if (v5)
  {
    v6 = v5;
    v7 = v5;
    -[NSMutableArray removeLastObject](self->_bufferPool, "removeLastObject");
  }
  else
  {
    v6 = objc_alloc_init(SCNMTLBuffer);
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  SCNMTLBufferPool::allocate((SCNMTLBufferPool *)self->_frameVolatileBufferPool, a3, &v9);
  -[SCNMTLBuffer setBuffer:](v6, "setBuffer:", v10);
  -[SCNMTLBuffer setOffset:](v6, "setOffset:", v11);
  if (!-[SCNMTLBuffer buffer](v6, "buffer"))
  {

    return 0;
  }
  return v6;
}

- (void)_recycleMTLBufferToPool:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SCNMTLRenderContext _recycleMTLBufferToPool:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  -[NSMutableArray addObject:](self->_bufferPool, "addObject:", a3);
  objc_msgSend(a3, "setUsedCount:", 0);
  objc_msgSend(a3, "setBuffer:", 0);
  objc_msgSend(a3, "setOffset:", 0);
  objc_msgSend(a3, "setDataSource:", 0);
}

- (const)createVolatileMeshElementOfType:(int)a3 primitiveCount:(uint64_t)a4 bytesPerIndex:
{
  const void *Volatile;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SCNMTLMeshElement *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (!a1)
    return 0;
  if (objc_msgSend(*(id *)(a1 + 2056), "count"))
  {
    Volatile = (const void *)objc_msgSend(*(id *)(a1 + 2056), "lastObject");
    objc_msgSend(*(id *)(a1 + 2048), "addObject:", Volatile);
    objc_msgSend(*(id *)(a1 + 2056), "removeLastObject");
    if (!Volatile)
    {
LABEL_6:
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        C3DMeshElementCreate_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    Volatile = (const void *)C3DMeshElementCreateVolatile();
    objc_msgSend(*(id *)(a1 + 2048), "addObject:", Volatile);
    CFRelease(Volatile);
    if (!Volatile)
      goto LABEL_6;
  }
  C3DMeshElementSetType((uint64_t)Volatile, a2);
  C3DMeshElementSetPrimitives((uint64_t)Volatile, a3, 0, a4);
  v17 = -[SCNMTLResourceManager renderResourceForMeshElement:](*(_QWORD *)(a1 + 112), (uint64_t)Volatile);
  if (-[SCNMTLMeshElement indexBuffer]((uint64_t)v17))
  {
    v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[SCNMTLRenderContext createVolatileMeshElementOfType:primitiveCount:bytesPerIndex:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  -[SCNMTLMeshElement setupWithElement:](v17, (uint64_t)Volatile);
  v26 = (char *)objc_msgSend((id)a1, "_newMTLBufferFromPoolWithLength:", -[SCNMTLResourceManager commandQueue]((uint64_t)v17) * a4);
  -[SCNMTLMeshElement setIndexBuffer:](v17, v26);

  v27 = objc_msgSend((id)objc_msgSend(v26, "buffer"), "contents");
  v28 = objc_msgSend(v26, "offset");
  v29 = -[SCNMTLResourceManager libraryManager]((uint64_t)v17);
  C3DMeshElementSetVolatileDataPtr((uint64_t)Volatile, v27 + v28 + v29);
  return Volatile;
}

- (uint64_t)unmapVolatileMeshElement:(uint64_t)result
{
  SCNMTLMeshElement *v3;

  if (result)
  {
    v3 = -[SCNMTLResourceManager renderResourceForMeshElement:](*(_QWORD *)(result + 112), a2);
    objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v3), "buffer");
    objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v3), "offset");
    C3DMeshElementGetBytesPerIndex(a2);
    return -[SCNMTLResourceManager commandQueue]((uint64_t)v3);
  }
  return result;
}

- (void)resetVolatileMeshElements
{
  NSMutableArray *usedVolatileMeshElements;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  SCNMTLMeshElement *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  usedVolatileMeshElements = self->_usedVolatileMeshElements;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usedVolatileMeshElements, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(usedVolatileMeshElements);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        v9 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)self->_resourceManager, v8);
        -[SCNMTLRenderContext _recycleMTLBufferToPool:](self, "_recycleMTLBufferToPool:", -[SCNMTLMeshElement indexBuffer]((uint64_t)v9));
        -[SCNMTLMeshElement setIndexBuffer:](v9, 0);
        -[SCNMTLMeshElement setSharedIndexBufferOffset:]((uint64_t)v9, 0);
        C3DMeshElementSetVolatileDataPtr(v8, 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](usedVolatileMeshElements, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  -[NSMutableArray addObjectsFromArray:](self->_freeVolatileMeshElements, "addObjectsFromArray:", self->_usedVolatileMeshElements);
  -[NSMutableArray removeAllObjects](self->_usedVolatileMeshElements, "removeAllObjects");
}

- (uint64_t)drawFullScreenQuadForPass:(uint64_t)result
{
  uint64_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t QuadMesh;
  _QWORD v13[9];
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (uint64_t *)result;
    if (!*(_QWORD *)(result + 144))
    {
      v4 = scn_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[SCNMTLRenderContext drawRenderElement:withPass:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    QuadMesh = C3DEngineContextGetQuadMesh(v3[18]);
    v13[0] = C3DFXPassGetProgram(a2);
    v13[1] = C3DFXPassGetMaterial(a2);
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = QuadMesh;
    v13[5] = C3DMeshGetElementAtIndex(QuadMesh, 0, 1);
    v13[6] = 0;
    v13[7] = a2;
    v13[8] = 0;
    v14 = 257;
    v15 = 0;
    v16 = 0;
    return objc_msgSend(v3, "_executeDrawCommand:", v13);
  }
  return result;
}

- (uint64_t)currentRenderCommandEncoder
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 248);
    if (v1)
      return *(_QWORD *)(v1 + 3392);
    else
      return 0;
  }
  return result;
}

- (uint64_t)currentRenderPassDescriptor
{
  if (result)
    return *(_QWORD *)(C3DEngineContextGetRenderGraph(*(_QWORD *)(result + 144)) + 152);
  return result;
}

- (void)_drawPBRTextures
{
  SCNMTLRenderContext *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t RenderGraph;
  SCNMTLResourceManager *resourceManager;
  SCNMTLResourceManager *v9;
  SCNMTLRenderCommandEncoder *renderEncoder;
  uint64_t Scene;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 Viewport;
  unint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t LightingEnvironmentEffectSlot;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  SCNMTLRenderCommandEncoder *v27;
  uint64_t v28;
  SCNMTLRenderCommandEncoder *v29;
  _BOOL4 IsCube;
  SCNMTLRenderCommandEncoder *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  float v35;
  __int128 v36;
  SCNMTLRenderCommandEncoder *v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  __int128 v41;
  SCNMTLRenderCommandEncoder *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  SCNMTLRenderCommandEncoder *v47;
  uint64_t v48;
  SCNMTLRenderCommandEncoder *v49;
  uint64_t v50;
  void *v51;
  SCNMTLRenderCommandEncoder *v52;
  uint64_t v53;
  SCNMTLRenderCommandEncoder *v54;
  unint64_t v55;
  uint64_t v56;
  __int128 v57;
  float v58;
  float v59;
  _BYTE v60[344];
  _BYTE __dst[344];
  _OWORD __src[22];

  v2 = self;
  if (self)
    self = *(SCNMTLRenderContext **)(C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext) + 152);
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SCNMTLRenderContext colorAttachments](self, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "pixelFormat");
  if (v2)
    v4 = *(void **)(C3DEngineContextGetRenderGraph((uint64_t)v2->_engineContext) + 152);
  else
    v4 = 0;
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "sampleCount");
  if (v3)
  {
    if (v2->_debug.pixelFormat != v3 || v2->_debug.sampleCount != v5)
    {
      v2->_debug.pixelFormat = v3;
      v2->_debug.sampleCount = v5;
      v6 = objc_msgSend((id)-[SCNMTLResourceManager libraryManager]((uint64_t)v2->_resourceManager), "frameworkLibrary");
      memset(&__src[19], 0, 40);
      memset(&__src[13], 0, 88);
      memset(&__src[7], 0, 88);
      memset(__src, 0, 104);
      *((_QWORD *)&__src[6] + 1) = v6;
      *((_QWORD *)&__src[12] + 1) = C3DBlendStatesDefaultOver();
      *((_QWORD *)&__src[18] + 1) = CFSTR("quad_vertex");
      *(_QWORD *)&__src[19] = CFSTR("quad_display_cube_equirectangular");
      RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)v2->_engineContext);
      SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[7], *(void **)(RenderGraph + 152));

      resourceManager = v2->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      v2->_debug.displayCubemapPipeline = (SCNMTLRenderPipeline *)-[SCNMTLResourceManager newRenderPipelineStateWithDesc:](resourceManager, "newRenderPipelineStateWithDesc:", __dst);
      *((_QWORD *)&__src[12] + 1) = C3DBlendStatesDefaultReplace();
      *(_QWORD *)&__src[19] = CFSTR("quad_display_texture2D");

      v9 = v2->_resourceManager;
      memcpy(v60, __src, sizeof(v60));
      v2->_debug.displayTexture2DPipeline = (SCNMTLRenderPipeline *)-[SCNMTLResourceManager newRenderPipelineStateWithDesc:](v9, "newRenderPipelineStateWithDesc:", v60);
    }
    renderEncoder = v2->_renderEncoder;
    if (!BYTE1(renderEncoder->var14[1].var0) && renderEncoder->var2)
    {
      renderEncoder->var2 = 0;
      renderEncoder->var6 = 1;
    }
    objc_msgSend((id)renderEncoder->var24[1], "setDepthStencilState:", -[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]((uint64_t)v2->_resourceManager));
    Scene = C3DEngineContextGetScene((uint64_t)v2->_engineContext);
    v12 = *(void **)&v2->_anon_3848[744];
    if (v12)
    {
      v13 = objc_msgSend(v12, "arrayLength");
      v14 = objc_msgSend(*(id *)&v2->_anon_3848[744], "mipmapLevelCount");
      v15 = objc_msgSend(*(id *)&v2->_anon_3848[744], "pixelFormat");
      Viewport = C3DEngineContextGetViewport((__n128 *)v2->_engineContext);
      v17 = Viewport.n128_u64[1];
      v18 = Viewport.n128_f32[2] / Viewport.n128_f32[3];
      v19 = 1.0 / (float)v13;
      v20 = 4.0 / Viewport.n128_f32[3];
      v21 = (float)(v19 + (float)((float)(4.0 / Viewport.n128_f32[3]) * -2.0)) * 2.5;
      v59 = v19 + (float)((float)(4.0 / Viewport.n128_f32[3]) * -2.0);
      v55 = Viewport.n128_u64[0];
      if ((float)(Viewport.n128_f32[2] / Viewport.n128_f32[3]) <= 1.0)
        v22 = v18 * v21;
      else
        v22 = v21 / v18;
      v58 = v22;
      IsCube = SCNMTLTextureTypeIsCube(objc_msgSend(*(id *)&v2->_anon_3848[744], "textureType", v55));
      v31 = v2->_renderEncoder;
      if (IsCube)
      {
        v32 = -[SCNMTLRenderPipeline state](v2->_debug.displayCubemapPipeline, "state");
        if (v31->var23 != (SCNMTLBufferPool *)v32)
        {
          v31->var23 = (SCNMTLBufferPool *)v32;
          objc_msgSend((id)v31->var24[1], "setRenderPipelineState:", v32);
        }
        if (v13)
        {
          v34 = 0;
          v35 = (float)-*((float *)&v56 + 1) / *((float *)&v17 + 1);
          *(float *)&v33 = *(float *)&v56 / *(float *)&v17;
          v57 = v33;
          do
          {
            SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, (id)objc_msgSend(*(id *)&v2->_anon_3848[744], "newTextureViewWithPixelFormat:textureType:levels:slices:", v15, 5, 0, v14, v34, 6, v57), 0);
            LODWORD(v36) = v57;
            *((float *)&v36 + 1) = v20 + v35;
            *((_QWORD *)&v36 + 1) = __PAIR64__(LODWORD(v59), LODWORD(v58));
            __src[0] = v36;
            SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
            v37 = v2->_renderEncoder;
            SCNMTLRenderCommandEncoder::_bindPendingTextures(v37);
            SCNMTLRenderCommandEncoder::applyChangedStates(v37);
            objc_msgSend((id)v37->var24[1], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
            v35 = v19 + v35;
            v34 += 6;
            --v13;
          }
          while (v13);
        }
      }
      else
      {
        v38 = -[SCNMTLRenderPipeline state](v2->_debug.displayTexture2DPipeline, "state");
        if (v31->var23 != (SCNMTLBufferPool *)v38)
        {
          v31->var23 = (SCNMTLBufferPool *)v38;
          objc_msgSend((id)v31->var24[1], "setRenderPipelineState:", v38);
        }
        if (v13)
        {
          v39 = 0;
          v40 = 0.0;
          do
          {
            SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, (id)objc_msgSend(*(id *)&v2->_anon_3848[744], "newTextureViewWithPixelFormat:textureType:levels:slices:", v15, 2, 0, v14, v39, 1), 0);
            LODWORD(v41) = 0;
            *((float *)&v41 + 1) = v20 + v40;
            *((_QWORD *)&v41 + 1) = __PAIR64__(LODWORD(v59), LODWORD(v58));
            __src[0] = v41;
            SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
            v42 = v2->_renderEncoder;
            SCNMTLRenderCommandEncoder::_bindPendingTextures(v42);
            SCNMTLRenderCommandEncoder::applyChangedStates(v42);
            objc_msgSend((id)v42->var24[1], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
            ++v39;
            v40 = v19 + v40;
          }
          while (v13 != v39);
        }
      }
    }
    else
    {
      LightingEnvironmentEffectSlot = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
      if (LightingEnvironmentEffectSlot)
      {
        v24 = LightingEnvironmentEffectSlot;
        if (C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot)
          || C3DEffectSlotHasPrecomputedLightingEnvironment(v24))
        {
          v25 = -[SCNMTLRenderContext radianceTextureForEffectSlot:]((uint64_t)v2, v24);
          if (v25)
          {
            v26 = (void *)v25;
            v27 = v2->_renderEncoder;
            v28 = -[SCNMTLRenderPipeline state](v2->_debug.displayCubemapPipeline, "state");
            if (v27->var23 != (SCNMTLBufferPool *)v28)
            {
              v27->var23 = (SCNMTLBufferPool *)v28;
              objc_msgSend((id)v27->var24[1], "setRenderPipelineState:", v28);
            }
            SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v26, 0);
            __src[0] = xmmword_1DD009B20;
            SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
            v29 = v2->_renderEncoder;
            SCNMTLRenderCommandEncoder::_bindPendingTextures(v29);
            SCNMTLRenderCommandEncoder::applyChangedStates(v29);
            objc_msgSend((id)v29->var24[1], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
          }
        }
      }
    }
    v43 = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
    if (v43)
    {
      v44 = v43;
      if (C3DEffectSlotHasImageOrTexture(v43) || C3DEffectSlotHasPrecomputedLightingEnvironment(v44))
      {
        v45 = -[SCNMTLRenderContext irradianceTextureForEffectSlot:](v2, v44);
        if (v45)
        {
          v46 = v45;
          v47 = v2->_renderEncoder;
          v48 = -[SCNMTLRenderPipeline state](v2->_debug.displayCubemapPipeline, "state");
          if (v47->var23 != (SCNMTLBufferPool *)v48)
          {
            v47->var23 = (SCNMTLBufferPool *)v48;
            objc_msgSend((id)v47->var24[1], "setRenderPipelineState:", v48);
          }
          SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v46, 0);
          __src[0] = xmmword_1DD009B30;
          SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
          v49 = v2->_renderEncoder;
          SCNMTLRenderCommandEncoder::_bindPendingTextures(v49);
          SCNMTLRenderCommandEncoder::applyChangedStates(v49);
          objc_msgSend((id)v49->var24[1], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
        }
      }
    }
    v50 = -[SCNMTLResourceManager specularDFGDiffuseHammonTextureWithRenderContext:](v2->_resourceManager, "specularDFGDiffuseHammonTextureWithRenderContext:", v2);
    if (v50)
    {
      v51 = (void *)v50;
      v52 = v2->_renderEncoder;
      v53 = -[SCNMTLRenderPipeline state](v2->_debug.displayTexture2DPipeline, "state");
      if (v52->var23 != (SCNMTLBufferPool *)v53)
      {
        v52->var23 = (SCNMTLBufferPool *)v53;
        objc_msgSend((id)v52->var24[1], "setRenderPipelineState:", v53);
      }
      SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v51, 0);
      __src[0] = xmmword_1DD009B40;
      SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
      v54 = v2->_renderEncoder;
      SCNMTLRenderCommandEncoder::_bindPendingTextures(v54);
      SCNMTLRenderCommandEncoder::applyChangedStates(v54);
      objc_msgSend((id)v54->var24[1], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    }
  }
}

- (void)_drawShadowMaps
{
  SCNMTLRenderContext *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t RenderGraph;
  SCNMTLResourceManager *resourceManager;
  SCNMTLResourceManager *v10;
  SCNMTLRenderCommandEncoder *renderEncoder;
  float v12;
  uint64_t v13;
  unint64_t v14;
  float v15;
  float v16;
  void *v17;
  SCNMTLRenderCommandEncoder *v18;
  SCNMTLRenderPipeline *displayDepthCubePipeline;
  uint64_t v20;
  __int128 v21;
  SCNMTLRenderCommandEncoder *v22;
  SCNMTLRenderCommandEncoder *v23;
  uint64_t v24;
  __int128 v25;
  unint64_t v26;
  void *v27;
  __int128 v28;
  SCNMTLRenderCommandEncoder *v29;
  __int128 v30;
  float v31;
  _BYTE v32[344];
  _BYTE __dst[344];
  _OWORD __src[22];

  v2 = self;
  if (self)
    self = *(SCNMTLRenderContext **)(C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext) + 152);
  v3 = (void *)objc_msgSend((id)objc_msgSend((id)-[SCNMTLRenderContext colorAttachments](self, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "pixelFormat");
    v6 = objc_msgSend(v4, "sampleCount");
    if (v2->_debug.pixelFormat != v5 || v2->_debug.sampleCount != v6)
    {
      v2->_debug.pixelFormat = v5;
      v2->_debug.sampleCount = v6;
      v7 = objc_msgSend((id)-[SCNMTLResourceManager libraryManager]((uint64_t)v2->_resourceManager), "frameworkLibrary");
      memset(&__src[20], 0, 24);
      *((_QWORD *)&__src[19] + 1) = 0;
      memset(&__src[7], 0, 184);
      memset(__src, 0, 104);
      *((_QWORD *)&__src[6] + 1) = v7;
      *((_QWORD *)&__src[18] + 1) = CFSTR("quad_vertex");
      *(_QWORD *)&__src[19] = CFSTR("quad_display_depth2D");
      RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)v2->_engineContext);
      SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[7], *(void **)(RenderGraph + 152));

      resourceManager = v2->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      v2->_debug.displayDepth2DPipeline = (SCNMTLRenderPipeline *)-[SCNMTLResourceManager newRenderPipelineStateWithDesc:](resourceManager, "newRenderPipelineStateWithDesc:", __dst);
      *(_QWORD *)&__src[19] = CFSTR("quad_display_depth_cube");

      v10 = v2->_resourceManager;
      memcpy(v32, __src, sizeof(v32));
      v2->_debug.displayDepthCubePipeline = (SCNMTLRenderPipeline *)-[SCNMTLResourceManager newRenderPipelineStateWithDesc:](v10, "newRenderPipelineStateWithDesc:", v32);
    }
    renderEncoder = v2->_renderEncoder;
    if (!BYTE1(renderEncoder->var14[1].var0) && renderEncoder->var2)
    {
      renderEncoder->var2 = 0;
      renderEncoder->var6 = 1;
    }
    objc_msgSend((id)renderEncoder->var24[1], "setDepthStencilState:", -[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]((uint64_t)v2->_resourceManager));
    v12 = (float)(unint64_t)objc_msgSend(v4, "height");
    v13 = 0;
    v14 = 0;
    v15 = (float)(v12 / (float)(unint64_t)objc_msgSend(v4, "width")) * 0.125;
    v16 = v15 + 0.01;
    v31 = v15;
    while (1)
    {
      v17 = *(void **)&v2->_anon_3848[8 * v13 + 472];
      if (v17)
        break;
LABEL_20:
      if (++v13 == 8)
        return;
    }
    if (objc_msgSend(*(id *)&v2->_anon_3848[8 * v13 + 472], "textureType") == 5)
    {
      v18 = v2->_renderEncoder;
      displayDepthCubePipeline = v2->_debug.displayDepthCubePipeline;
    }
    else
    {
      if (objc_msgSend(v17, "textureType") != 2)
      {
        if (objc_msgSend(v17, "textureType") == 3)
        {
          v23 = v2->_renderEncoder;
          v24 = -[SCNMTLRenderPipeline state](v2->_debug.displayDepth2DPipeline, "state");
          if (v23->var23 != (SCNMTLBufferPool *)v24)
          {
            v23->var23 = (SCNMTLBufferPool *)v24;
            objc_msgSend((id)v23->var24[1], "setRenderPipelineState:", v24);
          }
          if (objc_msgSend(v17, "arrayLength"))
          {
            v26 = 0;
            *(float *)&v25 = (float)((float)v14 * -0.135) + 0.865;
            v30 = v25;
            do
            {
              v27 = (void *)objc_msgSend(v17, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v17, "pixelFormat", v30), 2, 0, objc_msgSend(v17, "mipmapLevelCount"), v26, 1);
              SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v27, 0);
              *(float *)&v28 = (float)((float)v26 * v16) + 0.01;
              DWORD1(v28) = v30;
              *((_QWORD *)&v28 + 1) = LODWORD(v31) | 0x3E00000000000000;
              __src[0] = v28;
              SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
              v29 = v2->_renderEncoder;
              SCNMTLRenderCommandEncoder::_bindPendingTextures(v29);
              SCNMTLRenderCommandEncoder::applyChangedStates(v29);
              objc_msgSend((id)v29->var24[1], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);

              ++v26;
            }
            while (v26 < objc_msgSend(v17, "arrayLength"));
          }
        }
        goto LABEL_19;
      }
      v18 = v2->_renderEncoder;
      displayDepthCubePipeline = v2->_debug.displayDepth2DPipeline;
    }
    v20 = -[SCNMTLRenderPipeline state](displayDepthCubePipeline, "state");
    if (v18->var23 != (SCNMTLBufferPool *)v20)
    {
      v18->var23 = (SCNMTLBufferPool *)v20;
      objc_msgSend((id)v18->var24[1], "setRenderPipelineState:", v20);
    }
    SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v17, 0);
    LODWORD(v21) = 1008981770;
    *((float *)&v21 + 1) = (float)((float)v14 * -0.135) + 0.865;
    *((_QWORD *)&v21 + 1) = __PAIR64__(0.125, LODWORD(v31));
    __src[0] = v21;
    SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
    v22 = v2->_renderEncoder;
    SCNMTLRenderCommandEncoder::_bindPendingTextures(v22);
    SCNMTLRenderCommandEncoder::applyChangedStates(v22);
    objc_msgSend((id)v22->var24[1], "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
LABEL_19:
    ++v14;
    goto LABEL_20;
  }
}

- (uint64_t)_drawFullScreenTexture:(unsigned int)a3 over:
{
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t RenderGraph;
  uint64_t *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE __dst[344];
  _QWORD __src[46];

  if (result)
  {
    v5 = (uint64_t *)result;
    v6 = *(void **)(C3DEngineContextGetRenderGraph(*(_QWORD *)(result + 144)) + 152);
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "depthAttachment"), "texture"), "pixelFormat");
    v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "stencilAttachment"), "texture"), "pixelFormat");
    v9 = 0;
    v10 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v8 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v8 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v8 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v8 ^ v7)))) >> 47));
    do
    {
      v11 = (void *)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", v9);
      v12 = objc_msgSend((id)objc_msgSend(v11, "texture"), "pixelFormat");
      v13 = objc_msgSend((id)objc_msgSend(v11, "texture"), "sampleCount");
      v14 = 0x9DDFEA08EB382D69
          * (v10 ^ ((0x9DDFEA08EB382D69 * (v12 ^ v10)) >> 47) ^ (0x9DDFEA08EB382D69 * (v12 ^ v10)));
      v15 = 0x9DDFEA08EB382D69 * (v14 ^ (v14 >> 47));
      ++v9;
      v10 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v15 ^ ((0x9DDFEA08EB382D69 * (v15 ^ v13)) >> 47) ^ (0x9DDFEA08EB382D69 * (v15 ^ v13)))) ^ ((0x9DDFEA08EB382D69 * (v15 ^ ((0x9DDFEA08EB382D69 * (v15 ^ v13)) >> 47) ^ (0x9DDFEA08EB382D69 * (v15 ^ v13)))) >> 47));
    }
    while (v9 != 8);
    v16 = v5 + 1913;
    v17 = a3;
    v18 = (unint64_t *)&v5[2 * a3 + 1913];
    if (*v18 != v10)
    {
      *v18 = v10;
      v19 = objc_msgSend((id)-[SCNMTLResourceManager libraryManager](v5[14]), "frameworkLibrary");
      memset(&__src[14], 0, 232);
      memset(__src, 0, 104);
      __src[13] = v19;
      if (a3)
      {
        v20 = CFSTR("scn_draw_fullscreen_fragment_sk");
        v21 = C3DBlendStatesDefaultOver();
      }
      else
      {
        v21 = 0;
        v20 = CFSTR("scn_draw_fullscreen_gamma_fragment");
      }
      __src[25] = v21;
      __src[37] = CFSTR("scn_draw_fullscreen_triangle_vertex");
      __src[38] = v20;
      RenderGraph = C3DEngineContextGetRenderGraph(v5[18]);
      SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[14], *(void **)(RenderGraph + 152));
      v23 = &v16[2 * v17];

      v24 = (void *)v5[14];
      memcpy(__dst, __src, sizeof(__dst));
      v23[1] = objc_msgSend(v24, "newRenderPipelineStateWithDesc:", __dst);
    }
    v25 = v5[31];
    if (!*(_BYTE *)(v25 + 73) && *(_QWORD *)(v25 + 16))
    {
      *(_QWORD *)(v25 + 16) = 0;
      *(_BYTE *)(v25 + 41) = 1;
    }
    objc_msgSend(*(id *)(v25 + 3392), "setDepthStencilState:", -[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled](v5[14]));
    v26 = v5[31];
    v27 = objc_msgSend((id)v16[2 * v17 + 1], "state");
    if (*(_QWORD *)(v26 + 3376) != v27)
    {
      *(_QWORD *)(v26 + 3376) = v27;
      objc_msgSend(*(id *)(v26 + 3392), "setRenderPipelineState:", v27);
    }
    SCNMTLRenderCommandEncoder::setFragmentTexture(v5[31], a2, 0);
    return SCNMTLRenderCommandEncoder::drawFullScreenTriangle((SCNMTLRenderCommandEncoder *)v5[31]);
  }
  return result;
}

- (float)renderTime
{
  if (a1)
    return *(float *)(a1 + 2728);
  else
    return 0.0;
}

- (uint64_t)renderSKSceneWithRenderer:(uint64_t)result overlay:(void *)a2 atTime:(unsigned int)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char CoordinatesSystemOptions;
  void *v34;
  double v35;
  void *v36;
  __int128 v37;

  if (result)
  {
    v5 = result;
    objc_msgSend(a2, "updateAtTime:");
    v6 = *(void **)(v5 + 216);
    if (!C3DLinearRenderingIsEnabled())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v5 + 248) + 3392), "pushDebugGroup:", CFSTR("SpriteKit - NonLinear Encoding"));
      objc_msgSend(a2, "renderWithEncoder:pass:commandQueue:", *(_QWORD *)(*(_QWORD *)(v5 + 248) + 3392), v6, -[SCNMTLRenderContext commandQueue](v5));
      v19 = *(_QWORD *)(v5 + 248);
      v20 = *(_QWORD *)(v19 + 3400);
      v37 = *(_OWORD *)(v19 + 3384);
      bzero((void *)v19, 0xD70uLL);
      *(_DWORD *)(v19 + 64) = 1;
      *(_BYTE *)(v19 + 72) = 1;
      *(_OWORD *)(v19 + 3384) = v37;
      *(_QWORD *)(v19 + 3400) = v20;
      *(_WORD *)(v19 + 40) = 257;
      *(_BYTE *)(v19 + 42) = 1;
      *(_OWORD *)(v19 + 8) = 0u;
      *(_OWORD *)(v19 + 24) = 0u;
      return objc_msgSend(*(id *)(*(_QWORD *)(v5 + 248) + 3392), "popDebugGroup");
    }
    v7 = (void *)objc_msgSend((id)-[SCNMTLRenderContext commandQueue](v5), "commandBuffer");
    v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "resolveTexture");
    if (v8
      || (result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), (v8 = (void *)result) != 0))
    {
      v9 = objc_msgSend(v8, "width");
      v10 = objc_msgSend(v8, "height");
      v11 = objc_msgSend(v8, "pixelFormat");
      v12 = SCNMTLPixelFormatNonSRGBVariant(v11);
      if (v11 == 555)
        v13 = 552;
      else
        v13 = v12;
      v14 = 0x1E0CC6000;
      if (a3)
      {
        v15 = (id *)(v5 + 15352);
        v16 = *(id *)(v5 + 15352);
        if (!v16)
          goto LABEL_22;
        v17 = objc_msgSend(v16, "width");
        v16 = *v15;
        if (v17 != v9)
          goto LABEL_22;
        v18 = objc_msgSend(v16, "height");
        v16 = *v15;
        if (v18 != v10)
          goto LABEL_22;
      }
      else
      {
        v15 = (id *)(v5 + 15344);
        v16 = *(id *)(v5 + 15344);
        if (!v16)
          goto LABEL_22;
        v21 = objc_msgSend(v16, "width");
        v22 = objc_msgSend(v8, "width");
        v16 = *v15;
        if (v21 != v22)
        {
          v14 = 0x1E0CC6000uLL;
          goto LABEL_22;
        }
        v23 = objc_msgSend(v16, "height");
        v24 = objc_msgSend(v8, "height");
        v16 = *v15;
        v25 = v23 == v24;
        v14 = 0x1E0CC6000;
        if (!v25)
          goto LABEL_22;
      }
      if (objc_msgSend(v16, "pixelFormat") == v13)
        goto LABEL_23;
      v16 = *v15;
LABEL_22:

      v26 = (void *)objc_msgSend(*(id *)(v14 + 2992), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v13, v9, v10, 0);
      objc_msgSend(v26, "setStorageMode:", 2);
      objc_msgSend(v26, "setUsage:", 21);
      *v15 = (id)objc_msgSend(*(id *)(v5 + 120), "newTextureWithDescriptor:", v26);
LABEL_23:
      v27 = *v15;
      v28 = objc_msgSend(*v15, "width");
      if (v28 == objc_msgSend(*(id *)(v5 + 15360), "width")
        && (v29 = objc_msgSend(v27, "height"), v29 == objc_msgSend(*(id *)(v5 + 15360), "height")))
      {
        v30 = *(_QWORD *)(v5 + 15360);
      }
      else
      {
        v31 = (void *)objc_msgSend(*(id *)(v14 + 2992), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 260, v9, v10, 0);
        objc_msgSend(v31, "setStorageMode:", 2);
        objc_msgSend(v31, "setUsage:", 4);

        v30 = objc_msgSend(*(id *)(v5 + 120), "newTextureWithDescriptor:", v31);
        *(_QWORD *)(v5 + 15360) = v30;
      }
      v32 = (void *)objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v32, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", v27);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v32, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v32, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v32, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setStoreAction:", 1);
      objc_msgSend((id)objc_msgSend(v32, "depthAttachment"), "setTexture:", v30);
      CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(*(_QWORD *)(v5 + 144));
      v34 = (void *)objc_msgSend(v32, "depthAttachment");
      v35 = 1.0;
      if ((CoordinatesSystemOptions & 8) != 0)
        v35 = 0.0;
      objc_msgSend(v34, "setClearDepth:", v35);
      objc_msgSend((id)objc_msgSend(v32, "depthAttachment"), "setLoadAction:", 2);
      objc_msgSend((id)objc_msgSend(v32, "depthAttachment"), "setStoreAction:", 0);
      objc_msgSend((id)objc_msgSend(v32, "stencilAttachment"), "setTexture:", v30);
      objc_msgSend((id)objc_msgSend(v32, "stencilAttachment"), "setLoadAction:", 2);
      objc_msgSend((id)objc_msgSend(v32, "stencilAttachment"), "setStoreAction:", 0);
      v36 = (void *)objc_msgSend(v7, "renderCommandEncoderWithDescriptor:", v32);
      objc_msgSend(a2, "renderWithEncoder:pass:commandQueue:", v36, v32, -[SCNMTLRenderContext commandQueue](v5));
      objc_msgSend(v36, "endEncoding");
      objc_msgSend(v7, "commit");
      return -[SCNMTLRenderContext _drawFullScreenTexture:over:](v5, v27, a3);
    }
  }
  return result;
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  SCNMTLRenderCommandEncoder *renderEncoder;
  $E8FEF9D34A3DFDCB69CDC2374B44012F currentStreamBufferIndices;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  renderEncoder = self->_renderEncoder;
  currentStreamBufferIndices = self->_currentStreamBufferIndices;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  SCNMTLBufferPool::allocateAndCopy((SCNMTLBufferPool *)renderEncoder->var25[0], a3, a4, &v8);
  v6 = v9;
  v7 = v10;
  if (currentStreamBufferIndices.vertexIndex != -1)
    SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)renderEncoder, v9, v10, currentStreamBufferIndices.vertexIndex);
  if ((~*(_WORD *)&currentStreamBufferIndices & 0xFF00) != 0)
    SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)renderEncoder, v6, v7, (uint64_t)*(__int16 *)&currentStreamBufferIndices >> 8);
}

- (uint64_t)cubeArrayTypeIfSupported
{
  if (result)
  {
    if ((*(_BYTE *)(result + 137) & 1) != 0)
      return 6;
    else
      return 3;
  }
  return result;
}

- (void)addCommandBufferScheduledHandler:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));
    v5 = objc_msgSend(a2, "copy");
    v6 = (void *)v5;
    if (*(_QWORD *)(a1 + 15496))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v8 = *(void **)(a1 + 15496);
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 15496), "addObject:", v6);
      }
      else
      {
        v9[0] = *(_QWORD *)(a1 + 15496);
        v9[1] = v6;
        *(_QWORD *)(a1 + 15496) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v9, 2);

      }
    }
    else
    {
      *(_QWORD *)(a1 + 15496) = v5;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)addCommandBufferCompletedHandler:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));
    v5 = objc_msgSend(a2, "copy");
    v6 = (void *)v5;
    if (*(_QWORD *)(a1 + 15504))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v8 = *(void **)(a1 + 15504);
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 15504), "addObject:", v6);
      }
      else
      {
        v9[0] = *(_QWORD *)(a1 + 15504);
        v9[1] = v6;
        *(_QWORD *)(a1 + 15504) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v9, 2);

      }
    }
    else
    {
      *(_QWORD *)(a1 + 15504) = v5;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)addDrawablePresentedHandler:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));
    v5 = objc_msgSend(a2, "copy");
    v6 = (void *)v5;
    if (*(_QWORD *)(a1 + 15512))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v8 = *(void **)(a1 + 15512);
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 15512), "addObject:", v6);
      }
      else
      {
        v9[0] = *(_QWORD *)(a1 + 15512);
        v9[1] = v6;
        *(_QWORD *)(a1 + 15512) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v9, 2);

      }
    }
    else
    {
      *(_QWORD *)(a1 + 15512) = v5;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)discardPendingCommandBufferScheduledHandlers
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));

    *(_QWORD *)(a1 + 15496) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (void)discardPendingCommandBufferCompletedHandlers
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));

    *(_QWORD *)(a1 + 15504) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (void)discardPendingDrawablePresentedHandlers
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));

    *(_QWORD *)(a1 + 15512) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (uint64_t)_allowGPUBackgroundExecution
{
  void *v1;
  void *v2;

  if (result && !result[1942] && !result[1945])
  {
    v1 = (void *)result[20];
    if (v1)
    {
      v2 = (void *)result[20];
    }
    else
    {
      v2 = (void *)-[SCNMTLResourceManager commandQueue](result[14]);
      v1 = v2;
    }
    result = (uint64_t *)objc_msgSend(v2, "getBackgroundGPUPriority");
    if (result == (uint64_t *)3)
      return (uint64_t *)objc_msgSend(v1, "setBackgroundGPUPriority:", 2);
  }
  return result;
}

- (void)_SCNSceneRendererMainPassCustomPostProcessSupportDrawSceneBackgroundUsingEncoder:(uint64_t)a3 commandBuffer:(uint64_t)a4 renderPassDescriptor:
{
  uint64_t Scene;
  uint64_t BackgroundEffectSlot;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  char v18[3440];

  if (a1)
  {
    Scene = C3DEngineContextGetScene(a1[18]);
    BackgroundEffectSlot = C3DSceneGetBackgroundEffectSlot(Scene, 0);
    if (BackgroundEffectSlot)
    {
      v10 = BackgroundEffectSlot;
      v11 = a1[31];
      if (*(_QWORD *)(v11 + 3392) == a2)
      {
        C3DEngineContextRenderBackgroundMap(a1[18], BackgroundEffectSlot, 0);
      }
      else
      {
        v12 = a1[27];
        a1[31] = (uint64_t)v18;
        a1[27] = a4;
        SCNMTLRenderCommandEncoder::useCommandEncoder(v18, a3, a2, a1[261]);
        v13 = a1[31];
        v14 = *(_QWORD *)(v13 + 3400);
        v17 = *(_OWORD *)(v13 + 3384);
        bzero((void *)v13, 0xD70uLL);
        *(_DWORD *)(v13 + 64) = 1;
        *(_BYTE *)(v13 + 72) = 1;
        *(_OWORD *)(v13 + 3384) = v17;
        *(_QWORD *)(v13 + 3400) = v14;
        *(_WORD *)(v13 + 40) = 257;
        *(_BYTE *)(v13 + 42) = 1;
        *(_OWORD *)(v13 + 8) = 0u;
        *(_OWORD *)(v13 + 24) = 0u;
        v15 = a1[31];
        v16 = *(_BYTE *)v15 == 0;
        if (*(_QWORD *)(v15 + 8) != v16)
        {
          *(_QWORD *)(v15 + 8) = v16;
          *(_BYTE *)(v15 + 40) = 1;
        }
        C3DEngineContextRenderBackgroundMap(a1[18], v10, 0);
        a1[31] = v11;
        a1[27] = v12;
      }
    }
  }
}

- (uint64_t)setDebugOptions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 15544) = a2;
  return result;
}

- (uint64_t)setContentScaleFactor:(uint64_t)result
{
  if (result)
    *(double *)(result + 15552) = a2;
  return result;
}

- (uint64_t)renderEncoder
{
  if (result)
    return *(_QWORD *)(result + 248);
  return result;
}

- (id)resourceManagerMonitor
{
  if (result)
    return (id *)objc_loadWeak(result + 1934);
  return result;
}

- (id)setResourceManagerMonitor:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 1934, a2);
  return result;
}

- (id)setCommandBufferStatusMonitor:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 1935, a2);
  return result;
}

- (uint64_t)generatedTexturePath
{
  if (result)
    return *(_QWORD *)(result + 15568);
  return result;
}

- (void)initWithDevice:engineContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNMTLRenderContext initWithDevice : device should not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDevice:engineContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNMTLRenderContext initWithDevice : cannot create a command queue. Bailing out.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setPreferredFramesPerSecond:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: setPreferredFramesPerSecond - no screen", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __34__SCNMTLRenderContext_beginFrame___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "status");
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10_0(&dword_1DCCB8000, v1, v2, "Error: Main command buffer execution failed with status %d, error: %@\n%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11();
}

void __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "status");
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10_0(&dword_1DCCB8000, v1, v2, "Error: Resource command buffer execution failed with status %d, error: %@\n%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11();
}

- (void)setRasterizerStates:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_drawMeshElement:(uint64_t)a3 instanceCount:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_drawPatchForMeshElement:(uint64_t)a3 instanceCount:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Only triangle arrays are supported for tessellation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_drawPatchForMeshElement:(uint64_t)a3 instanceCount:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Control point indices must be 16-bit or 32-bit", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)renderVideoBackground:engineContext:slot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Cannot render video background with an unspecified source type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)renderMesh:meshElement:withProgram:engineContext:transform:color:rasterizerStates:blendState:texture:depthBias:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: cannot renderMesh without a vaid passDescriptor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)renderMesh:(uint64_t)a3 meshElement:(uint64_t)a4 withProgram:(uint64_t)a5 engineContext:(uint64_t)a6 transform:(uint64_t)a7 color:(uint64_t)a8 rasterizerStates:blendState:texture:depthBias:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Volatile mesh must have been mapped already", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)processRendererElements:(uint8_t *)a1 count:(_QWORD *)a2 engineIterationContext:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "!programHashCode || C3DProgramHashCodeUseDynamicBatching(programHashCode)";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. shader does not support batching!", a1);
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. unexpected engine context", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_executeDrawCommand:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: _executeProgram - no pipeline state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_executeDrawCommand:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: binding is broken : neither block or semantic", a1);
}

- (void)_executeDrawCommand:(NSObject *)a3 .cold.3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "resourceBinding.bindBlock";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

- (void)_executeDrawCommand:(uint64_t *)a3 .cold.4(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "name");
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DCCB8000, a4, OS_LOG_TYPE_ERROR, "Error: pass has no storage for input %@", a1, 0xCu);
}

- (void)_executeDrawCommand:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Internal consistency error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DDeformerTransforms is not supported when instancing is active", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_executeDrawCommand:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: can not render without programs, using default", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __43__SCNMTLRenderContext__executeDrawCommand___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. there should be exactly one transposed matrix in here", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)drawRenderElement:(uint64_t)a3 withPass:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Light indices buffer has wrong size", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_10_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. size mismatch for sh coefficients", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_165_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. only shOrder 3 supported with function constants", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_190_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_9_241_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Cannot set more than 4 matrices for cascade shadows", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_257_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_283_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)mapVolatileMesh:(uint64_t)a3 verticesCount:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Mesh should have volatile data to allocate", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)unmapVolatileMesh:(uint64_t)a3 modifiedVerticesCount:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Mesh should be mapped", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_recycleMTLBufferToPool:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. MeshElement should be mapped", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createVolatileMeshElementOfType:(uint64_t)a3 primitiveCount:(uint64_t)a4 bytesPerIndex:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Mesh should not be already mapped", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
