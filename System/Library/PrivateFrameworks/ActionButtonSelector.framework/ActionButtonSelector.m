void sub_235E73E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__n128 __move_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __n128 result;
  __int128 v19;
  __int128 v20;

  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;

  v6 = a2[1];
  a2[1] = 0;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;

  v8 = a2[2];
  a2[2] = 0;
  v9 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v8;

  v10 = a2[3];
  a2[3] = 0;
  v11 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v10;

  v12 = a2[4];
  a2[4] = 0;
  v13 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v12;

  v14 = a2[5];
  a2[5] = 0;
  v15 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v14;

  v16 = a2[6];
  a2[6] = 0;
  v17 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v16;

  result = *(__n128 *)(a2 + 7);
  v19 = *(_OWORD *)(a2 + 9);
  v20 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 13);
  *(_OWORD *)(a1 + 88) = v20;
  *(_OWORD *)(a1 + 72) = v19;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

double __move_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double result;

  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;

  v6 = a2[1];
  a2[1] = 0;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;

  v8 = a2[2];
  a2[2] = 0;
  v9 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v8;

  *(_QWORD *)&result = __move_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(a1 + 24, a2 + 3).n128_u64[0];
  return result;
}

__n128 __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v5;
  __int128 v6;

  *(_QWORD *)a1 = *(id *)a2;
  *(_QWORD *)(a1 + 8) = *(id *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(id *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(id *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(id *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(id *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(id *)(a2 + 48);
  result = *(__n128 *)(a2 + 72);
  v5 = *(_OWORD *)(a2 + 88);
  v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 104) = v6;
  *(_OWORD *)(a1 + 88) = v5;
  *(__n128 *)(a1 + 72) = result;
  return result;
}

id ABLoadResourcesWithCompletion(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[ABDeviceSceneResourceLoader sharedLoader]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABDeviceSceneResourceLoader loadResourcesWithCompletion:]((uint64_t)v2, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_235E744AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ABLogger()
{
  if (ABLogger_onceToken != -1)
    dispatch_once(&ABLogger_onceToken, &__block_literal_global_1);
  return (id)ABLogger_logger;
}

void ABDeviceSceneButtonModelSetColor(id *a1, void *a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v28;
  _BOOL8 v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v5 = a2;
  v33 = 0.0;
  v34 = 0.0;
  v31 = 0.0;
  v32 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v34, &v33, &v32, &v31);
  objc_msgSend(*a1, "geometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstMaterial");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HIDWORD(v9) = HIDWORD(v33);
  HIDWORD(v8) = HIDWORD(v34);
  *(float *)&v8 = v34;
  *(float *)&v9 = v33;
  HIDWORD(v10) = HIDWORD(v32);
  *(float *)&v10 = v32;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v11, CFSTR("glowColor"));

  objc_msgSend(v7, "setValue:forKey:", &unk_2507428A8, CFSTR("glowDistance"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31 * 0.4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v12, CFSTR("glowAmount"));

  objc_msgSend(a1[1], "geometry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstMaterial");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "emission");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContents:", v5);

  objc_msgSend(v14, "emission");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIntensity:", a3 * 0.35);

  objc_msgSend(a1[2], "geometry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstMaterial");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "emission");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContents:", v5);

  objc_msgSend(v18, "emission");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIntensity:", a3 * 0.35);

  if (v5)
  {
    objc_msgSend(a1[4], "geometry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstMaterial");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "emission");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContents:", v5);

    objc_msgSend(a1[6], "geometry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstMaterial");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "emission");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContents:", v5);

  }
  objc_msgSend(a1[4], "setOpacity:", a3);
  objc_msgSend(a1[6], "setOpacity:", a3);
  v28 = a3 == 1.0 && v5 != 0;
  objc_msgSend(a1[3], "setHidden:", v28);
  objc_msgSend(a1[5], "setHidden:", v28);
  v30 = a3 == 0.0 && v5 == 0;
  objc_msgSend(a1[4], "setHidden:", v30);
  objc_msgSend(a1[6], "setHidden:", v30);

  __destructor_8_s0_s8_s16_s24_s32_s40_s48(a1);
}

void sub_235E74914(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s0_s8_s16_s24_s32_s40_s48(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16_s24_s32_s40_s48(id *a1)
{

}

void ABLoadDeviceSceneModel(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD v111[4];
  id v112;
  id v113;
  SCNMatrix4 v114;
  SCNMatrix4 v115;
  SCNMatrix4 b;
  SCNMatrix4 a;
  SCNMatrix4 v118;
  id v119;
  SCNMatrix4 v120;
  SCNMatrix4 v121;
  void *v122;
  void *v123;
  uint64_t v124;
  _QWORD v125[4];

  v125[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  ABDeviceModelResourceName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", v4, CFSTR("usdz"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "path"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isReadableFileAtPath:", v7),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE6D8]), "initWithURL:", v5);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "loadTextures");
      v11 = (void *)MEMORY[0x24BDE8250];
      v109 = v10;
      objc_msgSend(v10, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nodeWithMDLObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = ABDegreesToRadians(180.0);
      SCNMatrix4MakeRotation(&v121, v14, 0.0, 1.0, 0.0);
      v120 = v121;
      objc_msgSend(v13, "setTransform:", &v120);
      objc_msgSend(MEMORY[0x24BDE8250], "node");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addChildNode:", v13);
      objc_msgSend(MEMORY[0x24BDE8280], "scene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFogColor:", v17);

      objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("Precomputed IBL"), 0);
      v119 = 0;
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE8240], "precomputedLightingEnvironmentContentsWithURL:error:");
      v18 = objc_claimAutoreleasedReturnValue();
      v105 = v119;
      objc_msgSend(v16, "lightingEnvironment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = (void *)v18;
      objc_msgSend(v19, "setContents:", v18);

      objc_msgSend(MEMORY[0x24BDE8250], "node");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setName:", CFSTR("camera"));
      objc_msgSend(MEMORY[0x24BDE8208], "camera");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCamera:");
      LODWORD(v21) = 0;
      LODWORD(v22) = 0;
      LODWORD(v23) = 0;
      objc_msgSend(v20, "setPosition:", v21, v22, v23);
      objc_msgSend(v16, "rootNode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v20;
      objc_msgSend(v24, "addChildNode:", v20);

      v101 = v16;
      objc_msgSend(v16, "rootNode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addChildNode:", v15);

      objc_msgSend(v13, "childNodeWithName:recursively:", CFSTR("pSGcebnmcFtsOOG"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v13;
      objc_msgSend(v13, "childNodeWithName:recursively:", CFSTR("KxLxpHjhdScjmXV"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "clone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByAppendingString:", CFSTR("_highlight"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setName:", v30);

      objc_msgSend(v26, "geometry");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "copy");
      objc_msgSend(v28, "setGeometry:", v32);

      memset(&v118, 0, sizeof(v118));
      *(_QWORD *)&a.m14 = 0;
      *(_QWORD *)&a.m12 = 0;
      a.m11 = 1.0;
      a.m22 = 1.0;
      *(_QWORD *)&a.m23 = 0;
      *(_QWORD *)&a.m31 = 0;
      *(_OWORD *)&a.m33 = xmmword_235E80A90;
      *(_QWORD *)&a.m43 = 0x3F80000000000000;
      memset(&b.m22, 0, 40);
      *(_OWORD *)&b.m12 = 0u;
      b.m11 = 1.0;
      b.m22 = 1.0;
      b.m33 = 1.01;
      b.m44 = 1.0;
      SCNMatrix4Mult(&v118, &a, &b);
      v115 = v118;
      objc_msgSend(v28, "setTransform:", &v115);
      v100 = v26;
      objc_msgSend(v26, "parentNode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v28;
      objc_msgSend(v33, "addChildNode:", v28);

      objc_msgSend(v27, "clone");
      v110 = v3;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByAppendingString:", CFSTR("_highlight"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setName:", v36);

      objc_msgSend(v27, "geometry");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "copy");
      objc_msgSend(v34, "setGeometry:", v38);

      v114 = v118;
      objc_msgSend(v34, "setTransform:", &v114);
      v99 = v27;
      objc_msgSend(v27, "parentNode");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v34;
      objc_msgSend(v39, "addChildNode:", v34);

      objc_msgSend(v15, "childNodeWithName:recursively:", CFSTR("GQhWfyGbSVpNdnc"), 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "geometry");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstMaterial");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "ambientOcclusion");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setTextureComponents:", 15);

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.7);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "childNodeWithName:recursively:", CFSTR("GQhWfyGbSVpNdnc"), 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "geometry");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstMaterial");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "transparent");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setContents:", v44);

      objc_msgSend(v15, "childNodeWithName:recursively:", CFSTR("GQhWfyGbSVpNdnc"), 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "geometry");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "firstMaterial");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "metalness");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setContents:", &unk_250742888);

      objc_msgSend(v15, "childNodeWithName:recursively:", CFSTR("GQhWfyGbSVpNdnc"), 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "geometry");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "firstMaterial");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "roughness");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setContents:", &unk_250742898);

      objc_msgSend(v15, "childNodeWithName:recursively:", CFSTR("ughIzqxkPkTEudm"), 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "geometry");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "firstMaterial");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "ambientOcclusion");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setTextureComponents:", 15);

      objc_msgSend(v15, "childNodeWithName:recursively:", CFSTR("YgbJVdiVqnfLxkd"), 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "geometry");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "firstMaterial");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "ambientOcclusion");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setIntensity:", 1.8);

      objc_msgSend(v15, "childNodeWithName:recursively:", CFSTR("crmKpCAtfjxkywa"), 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "geometry");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "firstMaterial");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "ambientOcclusion");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setIntensity:", 1.8);

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.5, 1.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = MEMORY[0x24BDAC760];
      v111[1] = 3221225472;
      v111[2] = __ABLoadDeviceSceneModel_block_invoke;
      v111[3] = &unk_25073EFD8;
      v70 = v15;
      v112 = v70;
      v96 = v69;
      v113 = v96;
      objc_msgSend(&unk_250742A30, "enumerateObjectsUsingBlock:", v111);
      objc_msgSend(v70, "childNodeWithName:recursively:", CFSTR("GxnDRwXYWLmLHLg"), 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "geometry");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "firstMaterial");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v110, "URLForResource:withExtension:", CFSTR("Action_Button_glow_modifier"), CFSTR("txt"));
      v74 = objc_claimAutoreleasedReturnValue();
      if (v74)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v74, 4, 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v75, "length"))
        {
          v124 = *MEMORY[0x24BDE8318];
          v125[0] = v75;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v125, &v124, 1);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setShaderModifiers:", v76);

        }
      }
      v95 = (void *)v74;
      objc_msgSend(v70, "childNodeWithName:recursively:", CFSTR("gdXDpPaIpuceqyb"), 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "geometry");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "firstMaterial");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v78, "copy");

      objc_msgSend(v79, "emission");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setContents:", 0);

      objc_msgSend(v79, "emission");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setIntensity:", 1.2);

      objc_msgSend(v79, "transparent");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setContents:", &unk_2507426B8);

      if (v79)
      {
        v123 = v79;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "geometry");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setMaterials:", v83);

        v122 = v79;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v122, 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "geometry");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setMaterials:", v85);

      }
      *(_QWORD *)a2 = v101;
      *(_QWORD *)(a2 + 8) = v70;
      v87 = v70;
      v102 = v101;
      objc_msgSend(v108, "childNodeWithName:recursively:", CFSTR("qoBNQvAugFFloeW"), 1);
      *(_QWORD *)(a2 + 16) = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "childNodeWithName:recursively:", CFSTR("GxnDRwXYWLmLHLg"), 1);
      *(_QWORD *)(a2 + 24) = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "childNodeWithName:recursively:", CFSTR("crmKpCAtfjxkywa"), 1);
      *(_QWORD *)(a2 + 32) = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "childNodeWithName:recursively:", CFSTR("WsgnBpfqdWTTcEN"), 1);
      *(_QWORD *)(a2 + 40) = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a2 + 48) = v100;
      *(_QWORD *)(a2 + 56) = v98;
      *(_QWORD *)(a2 + 64) = v99;
      *(_QWORD *)(a2 + 72) = v97;
      v88 = *(_OWORD *)&v118.m21;
      *(_OWORD *)(a2 + 80) = *(_OWORD *)&v118.m11;
      *(_OWORD *)(a2 + 96) = v88;
      v89 = *(_OWORD *)&v118.m41;
      *(_OWORD *)(a2 + 112) = *(_OWORD *)&v118.m31;
      *(_OWORD *)(a2 + 128) = v89;
      v90 = v97;
      v91 = v99;
      v92 = v98;
      v93 = v100;

      v10 = v109;
      v3 = v110;
    }
    else
    {
      *(_OWORD *)(a2 + 112) = 0u;
      *(_OWORD *)(a2 + 128) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      *(_OWORD *)(a2 + 96) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
    }

  }
  else
  {
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 128) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }

}

double ABDegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_235E75864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id carouselItems(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  ABCarouselItem *v9;
  void *v10;
  char v11;
  void *v12;
  id *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = [ABCarouselItem alloc];
        objc_msgSend(v8, "image", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "canBeHighlighted");
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[ABCarouselItem initWithImage:canBeHighlighted:identifier:]((id *)&v9->super.isa, v10, v11, v12);
        objc_msgSend(v2, "addObject:", v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v14 = (void *)objc_msgSend(v2, "copy");
  return v14;
}

void sub_235E76AC8(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_235E76CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_235E773A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double __copy_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64(id *a1, id *a2)
{
  double result;

  objc_storeStrong(a1, *a2);
  objc_storeStrong(a1 + 1, a2[1]);
  objc_storeStrong(a1 + 2, a2[2]);
  *(_QWORD *)&result = __copy_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)(a1 + 3), (uint64_t)(a2 + 3)).n128_u64[0];
  return result;
}

__n128 __copy_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v5;
  __int128 v6;

  objc_storeStrong((id *)a1, *(id *)a2);
  objc_storeStrong((id *)(a1 + 8), *(id *)(a2 + 8));
  objc_storeStrong((id *)(a1 + 16), *(id *)(a2 + 16));
  objc_storeStrong((id *)(a1 + 24), *(id *)(a2 + 24));
  objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 32));
  objc_storeStrong((id *)(a1 + 40), *(id *)(a2 + 40));
  objc_storeStrong((id *)(a1 + 48), *(id *)(a2 + 48));
  result = *(__n128 *)(a2 + 56);
  v5 = *(_OWORD *)(a2 + 72);
  v6 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v6;
  *(_OWORD *)(a1 + 72) = v5;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

void __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72(id *a1)
{

  __destructor_8_s0_s8_s16_s24_s32_s40_s48(a1 + 3);
}

double __copy_constructor_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64(_QWORD *a1, id *a2)
{
  double result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  *(_QWORD *)&result = __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)(a1 + 3), (uint64_t)(a2 + 3)).n128_u64[0];
  return result;
}

void ABReleaseResources()
{
  _QWORD *v0;

  +[ABDeviceSceneResourceLoader sharedLoader]();
  v0 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[ABDeviceSceneResourceLoader releaseResources](v0);

}

void sub_235E780C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235E78C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_235E798B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_235E7A230(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_235E7A2F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_235E7B24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_235E7B43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235E7B524(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double ABButtonOffsetFromDeviceCenter()
{
  return -3.58;
}

double ABButtonPressDepth()
{
  return 0.031;
}

double ABButtonScreenScale()
{
  return 0.004;
}

void sub_235E7C540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ABDefaultZoomedOutSceneParams()
{
  if (ABDefaultZoomedOutSceneParams_onceToken != -1)
    dispatch_once(&ABDefaultZoomedOutSceneParams_onceToken, &__block_literal_global_2);
  return (id)ABDefaultZoomedOutSceneParams_params;
}

id ABDefaultZoomedInSceneParams()
{
  if (ABDefaultZoomedInSceneParams_onceToken != -1)
    dispatch_once(&ABDefaultZoomedInSceneParams_onceToken, &__block_literal_global_41);
  return (id)ABDefaultZoomedInSceneParams_params;
}

id ABWelcomeModeZoomedOutSceneParams()
{
  if (ABWelcomeModeZoomedOutSceneParams_onceToken != -1)
    dispatch_once(&ABWelcomeModeZoomedOutSceneParams_onceToken, &__block_literal_global_46);
  return (id)ABWelcomeModeZoomedOutSceneParams_params;
}

id ABWelcomeModeZoomedInSceneParams()
{
  if (ABWelcomeModeZoomedInSceneParams_onceToken != -1)
    dispatch_once(&ABWelcomeModeZoomedInSceneParams_onceToken, &__block_literal_global_51);
  return (id)ABWelcomeModeZoomedInSceneParams_params;
}

id ABScrollDraggingStateParams(void *a1, void *a2, double a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v28[0] = CFSTR("TimeFactor");
  v28[1] = CFSTR("Damping");
  v29[0] = &unk_2507426D0;
  v29[1] = &unk_2507426D0;
  v28[2] = CFSTR("DampingSmooth");
  v29[2] = &unk_250742730;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  v12 = v7;
  v13 = (void *)objc_opt_new();
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __transitionStateParams_block_invoke;
  v22 = &unk_25073F140;
  v23 = v11;
  v24 = v10;
  v25 = v13;
  v26 = a4;
  v27 = a3;
  v14 = v11;
  v15 = v10;
  v16 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v19);

  v17 = (void *)objc_msgSend(v16, "copy", v19, v20, v21, v22);
  return v17;
}

id ABStateParamLimits()
{
  if (ABStateParamLimits_onceToken != -1)
    dispatch_once(&ABStateParamLimits_onceToken, &__block_literal_global_53);
  return (id)ABStateParamLimits_limits;
}

void __transitionStateParams_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  double *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v23 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, v23);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    objc_msgSend(v5, "doubleValue");
    v11 = (v9 - v10) * *(double *)(a1 + 56);

    ABStateParamLimits();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      +[ABParameterLimits unlimited]();
      v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    v16 = (double *)v15;

    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "doubleValue");
    v19 = v18 + v11 * *(double *)(a1 + 64);
    if (v16)
    {
      v20 = v16[1];
      v21 = v16[2];
    }
    else
    {
      v20 = 0.0;
      v21 = 0.0;
    }
    objc_msgSend(v17, "numberWithDouble:", ABClamp(v19, v20, v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v22, v23);

  }
}

float64x2_t SCNMatrix4FromCATransform3D@<Q0>(float64x2_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t v2;
  float64x2_t result;
  float32x4_t v4;

  v2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[2]), a1[3]);
  *a2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*a1), a1[1]);
  a2[1] = v2;
  result = a1[7];
  v4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[6]), result);
  a2[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1[4]), a1[5]);
  a2[3] = v4;
  return result;
}

float64x2_t CATransform3DFromSCNMatrix4@<Q0>(float32x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t result;
  float64x2_t v6;

  v2 = vcvtq_f64_f32(a1[1]);
  *a2 = vcvtq_f64_f32(*a1);
  a2[1] = v2;
  v3 = vcvtq_f64_f32(a1[3]);
  a2[2] = vcvtq_f64_f32(a1[2]);
  a2[3] = v3;
  v4 = vcvtq_f64_f32(a1[5]);
  a2[4] = vcvtq_f64_f32(a1[4]);
  a2[5] = v4;
  result = vcvtq_f64_f32(a1[6]);
  v6 = vcvtq_f64_f32(a1[7]);
  a2[6] = result;
  a2[7] = v6;
  return result;
}

double ABClamp(double result, double a2, double a3)
{
  if (result >= a3)
    result = a3;
  if (result < a2)
    return a2;
  return result;
}

uint64_t ABEqualObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend(v3, "isEqual:", v4);
  }

  return v6;
}

uint64_t ABHighFrameRateUpdateReasonMake(uint64_t result)
{
  return result;
}

float ABFrameRateRange()
{
  float result;

  LODWORD(result) = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return result;
}

id ABSnapshotImageName(int a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  deviceSuffix();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    if (a1)
      v4 = CFSTR("assistant");
    else
      v4 = CFSTR("settings");
    deviceSuffix();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("scene_snapshot_%@-%@.png"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

__CFString *deviceSuffix()
{
  __CFString *v0;
  NSObject *v2;
  void *v3;
  double v4;
  __CFString *v5;
  uint8_t v6[16];
  __int128 v7;
  int v8;
  __int128 v9;
  int v10;
  __int128 v11;
  int v12;
  __int128 v13;
  int v14;
  __int128 v15;
  int v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v18 = -781324731;
  v17 = xmmword_235E80B20;
  v0 = CFSTR("D84");
  if ((MGIsDeviceOfType() & 1) == 0)
  {
    v16 = 1874287171;
    v15 = xmmword_235E80B34;
    v0 = CFSTR("D83");
    if ((MGIsDeviceOfType() & 1) == 0)
    {
      v14 = 1214880059;
      v13 = xmmword_235E80B48;
      if ((MGIsDeviceOfType() & 1) != 0)
        return CFSTR("D93");
      v12 = 426359977;
      v11 = xmmword_235E80B5C;
      if ((MGIsDeviceOfType() & 1) != 0)
        return CFSTR("D94");
      v10 = 1223847566;
      v9 = xmmword_235E80B70;
      if ((MGIsDeviceOfType() & 1) != 0)
        return CFSTR("D47");
      v8 = 185580364;
      v7 = xmmword_235E80B84;
      if ((MGIsDeviceOfType() & 1) != 0)
        return CFSTR("D48");
      ABLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_235E72000, v2, OS_LOG_TYPE_DEFAULT, "Unsupported device. Fallback to using screen size.", v6, 2u);
      }

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      if (v4 == 932.0)
        v5 = CFSTR("D84");
      else
        v5 = CFSTR("D83");
      v0 = v5;

    }
  }
  return v0;
}

const __CFString *ABDeviceModelResourceName()
{
  if ((MGIsDeviceOfType() & 1) != 0 || MGIsDeviceOfType())
    return CFSTR("iPhone15_Pro_NaturalTitanium_v0005-D83-D84");
  else
    return CFSTR("iPhone15_Pro_NaturalTitanium_v0006-D47-D48-D93-D94");
}

void sub_235E7F3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x24BDE5440](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5578](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x24BED84B8]();
}

SCNMatrix4 *__cdecl SCNMatrix4Invert(SCNMatrix4 *__return_ptr retstr, SCNMatrix4 *m)
{
  return (SCNMatrix4 *)MEMORY[0x24BDE82D0](retstr, m);
}

SCNMatrix4 *__cdecl SCNMatrix4MakeRotation(SCNMatrix4 *__return_ptr retstr, float angle, float x, float y, float z)
{
  return (SCNMatrix4 *)MEMORY[0x24BDE82D8](retstr, angle, x, y, z);
}

SCNMatrix4 *__cdecl SCNMatrix4Mult(SCNMatrix4 *__return_ptr retstr, SCNMatrix4 *a, SCNMatrix4 *b)
{
  return (SCNMatrix4 *)MEMORY[0x24BDE82E0](retstr, a, b);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

