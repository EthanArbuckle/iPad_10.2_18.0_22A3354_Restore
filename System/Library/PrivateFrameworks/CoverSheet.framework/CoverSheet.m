void sub_1D033C538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void __49__CSDeviceUnblockPolicyEnvironment_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIsUserRequestedEraseEnabled:", objc_msgSend(v3, "isUserRequestedEraseEnabled"));
  objc_msgSend(v4, "setIsUserFindMyAccountPresent:", objc_msgSend(*(id *)(a1 + 32), "isUserFindMyAccountPresent"));
  objc_msgSend(v4, "setIsDeviceInternetConnectionActive:", objc_msgSend(*(id *)(a1 + 32), "isDeviceInternetConnectionActive"));
  objc_msgSend(v4, "setIsPasscodeGracePeriodUsable:", objc_msgSend(*(id *)(a1 + 32), "isPasscodeGracePeriodUsable"));

}

void sub_1D034C378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromCoverSheetTransitionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("none");
  else
    return off_1E8E2DC48[a1 - 1];
}

__n128 CSCoverSheetTransitionContextMake@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  __n128 result;
  __int128 v8;

  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  BSIntervalClip();
  *(_QWORD *)a3 = v6;
  result = *(__n128 *)a1;
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 24) = v8;
  *(_QWORD *)(a3 + 40) = a2;
  return result;
}

id NSStringFromCoverSheetTransitionContext(__int128 *a1)
{
  void *v2;
  __int128 v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = 3221225472;
  v3 = a1[1];
  v9 = *a1;
  v10 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __NSStringFromCoverSheetTransitionContext_block_invoke;
  v7[3] = &unk_1E8E2DC28;
  v8 = v2;
  v11 = a1[2];
  v4 = v2;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("CSCoverSheetTransitionContext"), &stru_1E8E30B28, v7);
  objc_msgSend(v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1D0351240(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D0352140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1D0357848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0358050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SBStaticInitializer()
{
  __SecTask *v0;
  __SecTask *v1;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    if ((SecTaskGetCodeSignStatus(v0) & 0xC000001) != 0x4000001 && (os_variant_has_internal_content() & 1) == 0)
      SBStaticInitializer_cold_1();
    CFRelease(v1);
  }
}

double CSMainPageListInsetXLandscapePhoneDeviceSpecific()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  double v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v32;
  int v33;
  double v34;
  int v35;
  double v36;
  double v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  int v43;
  int v44;
  double v45;
  double v46;
  int v47;
  int v48;
  int v49;
  int v50;
  double v51;
  int v52;
  double v53;
  double v54;
  int v55;
  int v56;
  double v57;
  uint64_t v58;
  double v59;
  double v60;
  int v61;
  double v62;
  double v63;
  int v64;
  double v65;
  uint64_t v66;
  double v67;
  double v68;
  int v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  _BYTE v130[12];
  _BYTE v131[40];
  _BYTE v132[12];
  __int128 v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;

  v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v3 = 0;
      v4 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
    {
      v3 = 0;
      v4 = 1;
      goto LABEL_10;
    }
  }
  v4 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "_referenceBounds");
    }
    v3 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v27 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v26 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v141 = v5 ^ 1;
      v142 = v4;
      memset(v131, 0, sizeof(v131));
      memset(v130, 0, sizeof(v130));
      memset(v132, 0, sizeof(v132));
      v133 = 0uLL;
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v140 = 0;
      v127 = 0;
      v134 = 0;
      v123 = 0;
      v124 = 0;
      v135 = 0;
      v136 = 0;
      v122 = 0;
      v16 = 0;
      v137 = 0;
      v138 = 0;
      v121 = 0;
      v17 = 0;
      v18 = 0;
      v139 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    v3 = 0;
  }
LABEL_10:
  v6 = __sb__runningInSpringBoard();
  v141 = v3;
  v142 = v4;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v7 = 0;
      v8 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
    {
      v7 = 0;
      v8 = 1;
      goto LABEL_19;
    }
  }
  v8 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_referenceBounds");
    }
    v7 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v29 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v138 = v5 ^ 1;
      v139 = v8;
      memset(v131, 0, sizeof(v131));
      memset(v130, 0, sizeof(v130));
      memset(v132, 0, sizeof(v132));
      v133 = 0uLL;
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v140 = 0;
      v127 = 0;
      v134 = 0;
      v123 = 0;
      v124 = 0;
      v135 = 0;
      v136 = 0;
      v122 = 0;
      v16 = 0;
      v137 = 0;
      v121 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_19:
  v9 = __sb__runningInSpringBoard();
  v138 = v7;
  v139 = v8;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v117, "userInterfaceIdiom") != 1)
    {
      v10 = 0;
      v11 = 1;
      goto LABEL_28;
    }
  }
  v11 = v9 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "_referenceBounds");
    }
    v10 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v136 = v5 ^ 1;
      v137 = v11;
      memset(v131, 0, sizeof(v131));
      memset(v130, 0, sizeof(v130));
      memset(v132, 0, sizeof(v132));
      v133 = 0uLL;
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v140 = 0;
      v127 = 0;
      v134 = 0;
      v123 = 0;
      v124 = 0;
      v135 = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_28:
  v12 = __sb__runningInSpringBoard();
  v136 = v10;
  v137 = v11;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v1 = 0;
      v13 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "userInterfaceIdiom") != 1)
    {
      v1 = 0;
      v13 = 1;
      goto LABEL_37;
    }
  }
  v13 = v12 ^ 1u;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "_referenceBounds");
  }
  v1 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v14 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v134 = v5 ^ 1;
    v135 = v13;
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    v133 = 0uLL;
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v140 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0.0;
    goto LABEL_67;
  }
LABEL_37:
  v15 = __sb__runningInSpringBoard();
  v134 = v1;
  v135 = v13;
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v140 = 0;
      v0 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v115, "userInterfaceIdiom") != 1)
    {
      v140 = 0;
      v0 = 1;
      goto LABEL_47;
    }
  }
  v0 = v15 ^ 1u;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "_referenceBounds");
  }
  v140 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v24 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    DWORD2(v133) = 0;
    HIDWORD(v133) = v0;
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    *(_QWORD *)&v133 = 0;
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0.0;
    goto LABEL_67;
  }
LABEL_47:
  v25 = __sb__runningInSpringBoard();
  HIDWORD(v133) = v0;
  if (v25)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v133 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v114, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v133 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v133) = v25 ^ 1;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "_referenceBounds");
  }
  DWORD1(v133) = v5 ^ 1;
  BSSizeRoundForScale();
  if (v32 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    LODWORD(v133) = 0;
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0.0;
    goto LABEL_67;
  }
LABEL_178:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_180;
LABEL_186:
    memset(v131, 0, sizeof(v131));
    memset(v130, 0, sizeof(v130));
    memset(v132, 0, sizeof(v132));
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0.0;
    LODWORD(v133) = v5 ^ 1;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v112, "userInterfaceIdiom") == 1)
    goto LABEL_186;
LABEL_180:
  LODWORD(v133) = v5 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(_QWORD *)v132 = 0;
    goto LABEL_194;
  }
  v33 = __sb__runningInSpringBoard();
  if (v33)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_184;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      *(_QWORD *)v132 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v132 = v33 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "_referenceBounds");
    }
    *(_DWORD *)&v132[4] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v131, 0, sizeof(v131));
      *(_DWORD *)&v132[8] = 0;
      memset(v130, 0, sizeof(v130));
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v127 = 0;
      v123 = 0;
      v124 = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 136.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_194:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v131[36] = 0;
      *(_DWORD *)&v132[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v131[36] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v132[8] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "_referenceBounds");
    }
    *(_DWORD *)&v131[36] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_208;
  }
  else
  {
    *(_DWORD *)&v131[36] = 0;
  }
LABEL_204:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v131, 0, 36);
    memset(v130, 0, sizeof(v130));
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 129.0;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(_QWORD *)&v131[28] = 0;
    goto LABEL_222;
  }
  v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_212;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v103, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v131[28] = 0;
      *(_DWORD *)&v131[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v131[32] = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_referenceBounds");
    }
    *(_DWORD *)&v131[28] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v41 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v131, 0, 28);
      memset(v130, 0, sizeof(v130));
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v127 = 0;
      v123 = 0;
      v124 = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 124.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v131[28] = 0;
  }
LABEL_222:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v131[24] = 0;
      *(_DWORD *)&v131[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v105, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v131[16] = 0;
      *(_DWORD *)&v131[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v131[24] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "_referenceBounds");
    }
    *(_DWORD *)&v131[16] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_236;
  }
  else
  {
    *(_DWORD *)&v131[16] = 0;
  }
LABEL_232:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v131[20] = 0;
    *(_OWORD *)v131 = 0uLL;
    memset(v130, 0, sizeof(v130));
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 118.0;
    goto LABEL_67;
  }
LABEL_236:
  v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v131[20] = 0;
      *(_DWORD *)&v131[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v131[12] = 0;
      *(_DWORD *)&v131[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v131[20] = v38 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v39 = __sb__runningInSpringBoard();
    if (v39)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "_referenceBounds");
    }
    v5 = v39 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v131[12] = v5;
    if (v40 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v131 = 0;
      memset(v130, 0, sizeof(v130));
      *(_DWORD *)&v131[8] = 0;
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v127 = 0;
      v123 = 0;
      v124 = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 124.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v131[12] = 0;
  }
LABEL_246:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v131 = 0;
      *(_DWORD *)v130 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "userInterfaceIdiom"))
    {
      *(_DWORD *)v130 = 0;
      *(_DWORD *)v131 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v131 = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "_referenceBounds");
    }
    *(_DWORD *)v130 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_266;
  }
  else
  {
    *(_DWORD *)v130 = 0;
  }
LABEL_256:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v131[4] = 0;
    *(_QWORD *)&v130[4] = 0;
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 118.0;
    goto LABEL_67;
  }
LABEL_266:
  v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v131[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v131[4] = 0;
      *(_DWORD *)&v131[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v131[8] = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v44 = __sb__runningInSpringBoard();
    if (v44)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "_referenceBounds");
    }
    v5 = v44 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v131[4] = v5;
    if (v45 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v130[4] = 0;
      v128 = 0;
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v127 = 0;
      v123 = 0;
      v124 = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 118.0;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v131[4] = 0;
  }
LABEL_276:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v130[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v130[4] = 0;
      *(_DWORD *)&v130[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v130[8] = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "_referenceBounds");
    }
    *(_DWORD *)&v130[4] = v5 ^ 1;
    BSSizeRoundForScale();
    if (v46 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_295;
  }
  else
  {
    *(_DWORD *)&v130[4] = 0;
  }
LABEL_286:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v128 = 0;
    v129 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 118.0;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    v128 = 0;
    goto LABEL_306;
  }
  v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_299;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v92, "userInterfaceIdiom"))
    {
      v128 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v128) = v47 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v48 = __sb__runningInSpringBoard();
    if (v48)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_referenceBounds");
    }
    v5 = v48 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v128) = v5;
    if (v53 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v129 = 0;
      v125 = 0;
      v126 = 0;
      v127 = 0;
      v123 = 0;
      v124 = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 144.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_306:
  v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v129) = 0;
      v5 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v96, "userInterfaceIdiom"))
    {
      v5 = 0;
      HIDWORD(v129) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v129) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "_referenceBounds");
    }
    v5 = v50 ^ 1u;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_320;
  }
  else
  {
    v5 = 0;
  }
LABEL_316:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v129) = v5;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 93.0;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v129) = v5;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    v126 = 0;
    goto LABEL_334;
  }
  v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_324;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "userInterfaceIdiom"))
    {
      v126 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v126) = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v0 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v0, "_referenceBounds");
    }
    v83 = (void *)v0;
    LODWORD(v126) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v127 = 0;
      v125 = 0;
      v123 = 0;
      v124 = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 135.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_334:
  v5 = __sb__runningInSpringBoard();
  v0 = (uint64_t)&off_1D048E000;
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v127 = 0;
      HIDWORD(v125) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v91, "userInterfaceIdiom"))
    {
      HIDWORD(v125) = 0;
      v127 = 1;
      goto LABEL_344;
    }
  }
  v127 = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "_referenceBounds");
    }
    HIDWORD(v125) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v54 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_348;
  }
  else
  {
    HIDWORD(v125) = 0;
  }
LABEL_344:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v125) = 0;
    v123 = 0;
    v124 = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 87.0;
    goto LABEL_67;
  }
LABEL_348:
  v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v125) = 0;
      LODWORD(v123) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "userInterfaceIdiom"))
    {
      LODWORD(v123) = 0;
      LODWORD(v125) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v125) = v55 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v56 = __sb__runningInSpringBoard();
    if (v56)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v13, "_referenceBounds");
    }
    v84 = (void *)v13;
    v5 = v56 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v123) = v5;
    if (v57 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v124 = 0;
      HIDWORD(v123) = 0;
      v121 = 0;
      v122 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v58 = 0x405F000000000000;
LABEL_373:
      v23 = *(double *)&v58;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v123) = 0;
  }
LABEL_358:
  v5 = __sb__runningInSpringBoard();
  v1 = (uint64_t)&off_1D048E000;
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v124 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "userInterfaceIdiom"))
    {
      v124 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v124) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "_referenceBounds");
    }
    LODWORD(v124) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_379;
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_368:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    HIDWORD(v123) = 0;
    v121 = 0;
    v122 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 118.0;
    goto LABEL_67;
  }
LABEL_379:
  v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      HIDWORD(v122) = 0;
      goto LABEL_389;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "userInterfaceIdiom"))
    {
      HIDWORD(v122) = 0;
      HIDWORD(v123) = 1;
      goto LABEL_389;
    }
  }
  HIDWORD(v123) = v61 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "_referenceBounds");
    }
    HIDWORD(v122) = v5 ^ 1;
    BSSizeRoundForScale();
    if (v62 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v122) = 0;
      v16 = 0;
      v121 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 135.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v122) = 0;
  }
LABEL_389:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v122) = 0;
      v16 = 0;
      goto LABEL_399;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "userInterfaceIdiom"))
    {
      v16 = 0;
      LODWORD(v122) = 1;
      goto LABEL_399;
    }
  }
  LODWORD(v122) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "_referenceBounds");
    }
    v16 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v63 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_406;
  }
  else
  {
    v16 = 0;
  }
LABEL_399:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
LABEL_400:
    v121 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 87.0;
    goto LABEL_67;
  }
LABEL_406:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v121 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 118.0;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
    goto LABEL_400;
  v23 = 118.0;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v121 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v121 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
LABEL_415:
    v23 = 87.0;
    goto LABEL_67;
  }
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v121 = 0;
      goto LABEL_426;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "userInterfaceIdiom"))
    {
      v121 = 0x100000000;
      goto LABEL_426;
    }
  }
  HIDWORD(v121) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v0 = __sb__runningInSpringBoard();
    if ((_DWORD)v0)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "_referenceBounds");
    }
    LODWORD(v121) = v0 ^ 1;
    BSSizeRoundForScale();
    if (v67 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v121) = 0;
  }
LABEL_426:
  v64 = __sb__runningInSpringBoard();
  if (v64)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v17 = 0;
      v18 = 0;
      goto LABEL_436;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v74, "userInterfaceIdiom"))
    {
      v18 = 0;
      v17 = 1;
      goto LABEL_436;
    }
  }
  v17 = v64 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v0 = __sb__runningInSpringBoard();
    if ((_DWORD)v0)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "_referenceBounds");
    }
    v18 = v0 ^ 1;
    BSSizeRoundForScale();
    if (v68 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      goto LABEL_415;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_436:
  v0 = __sb__runningInSpringBoard();
  if ((_DWORD)v0)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v19 = 0;
      v20 = 0;
      goto LABEL_446;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "userInterfaceIdiom"))
    {
      v20 = 0;
      v19 = 1;
      goto LABEL_446;
    }
  }
  v19 = v0 ^ 1;
  v0 = __sb__runningInSpringBoard();
  if ((_DWORD)v0)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "_referenceBounds");
  }
  v20 = v0 ^ 1;
  BSSizeRoundForScale();
  if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v21 = 0;
    v22 = 0;
    v66 = 0x4046000000000000;
    goto LABEL_453;
  }
LABEL_446:
  v1 = __sb__runningInSpringBoard();
  if ((_DWORD)v1)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v21 = 0;
      v22 = 0;
      v66 = 0x4044000000000000;
LABEL_453:
      v23 = *(double *)&v66;
      goto LABEL_67;
    }
    goto LABEL_460;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v0, "userInterfaceIdiom"))
  {
    v22 = 0;
    v21 = 1;
    v58 = 0x4044000000000000;
    goto LABEL_373;
  }
LABEL_460:
  v21 = v1 ^ 1;
  v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v1 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "_referenceBounds");
  }
  v22 = v69 ^ 1;
  BSSizeRoundForScale();
  if (v70 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    v23 = 40.0;
  else
    v23 = 69.0;
LABEL_67:
  if (v22)

  if (v21)
  if (v20)

  if (v19)
  if (v18)

  if (v17)
  if ((_DWORD)v121)

  if (HIDWORD(v121))
  if (v16)

  if ((_DWORD)v122)
  if (HIDWORD(v122))

  if (HIDWORD(v123))
  if ((_DWORD)v124)

  if (HIDWORD(v124))
  if ((_DWORD)v123)

  if ((_DWORD)v125)
  if (HIDWORD(v125))

  if (v127)
  if ((_DWORD)v126)

  if (HIDWORD(v126))
  if ((_DWORD)v129)

  if (HIDWORD(v129))
  if ((_DWORD)v128)

  if (HIDWORD(v128))
  if (*(_DWORD *)&v130[4])

  if (*(_DWORD *)&v130[8])
  if (*(_DWORD *)&v131[4])

  if (*(_DWORD *)&v131[8])
  if (*(_DWORD *)v130)

  if (*(_DWORD *)v131)
  if (*(_DWORD *)&v131[12])

  if (*(_DWORD *)&v131[20])
  if (*(_DWORD *)&v131[16])

  if (*(_DWORD *)&v131[24])
  if (*(_DWORD *)&v131[28])

  if (*(_DWORD *)&v131[32])
  if (*(_DWORD *)&v131[36])

  if (*(_DWORD *)&v132[8])
  if (*(_DWORD *)&v132[4])

  if (*(_DWORD *)v132)
  if ((_DWORD)v133)

  if (DWORD1(v133))
  if (DWORD2(v133))

  if (v140)
  if (HIDWORD(v133))
  {

    if (!v134)
      goto LABEL_157;
  }
  else if (!v134)
  {
LABEL_157:
    if (v135)
      goto LABEL_158;
    goto LABEL_168;
  }

  if (v135)
  {
LABEL_158:

    if (!v136)
      goto LABEL_159;
    goto LABEL_169;
  }
LABEL_168:
  if (!v136)
  {
LABEL_159:
    if (v137)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:

  if (v137)
  {
LABEL_160:

    if (!v138)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:
  if (!v138)
  {
LABEL_161:
    if (v139)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:

  if (v139)
  {
LABEL_162:

    if (!v141)
      goto LABEL_163;
LABEL_173:

    if (!v142)
      return v23;
    goto LABEL_164;
  }
LABEL_172:
  if (v141)
    goto LABEL_173;
LABEL_163:
  if (v142)
LABEL_164:

  return v23;
}

void sub_1D035FB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0364F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0367390(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;
  id *v5;

  v5 = v3;
  objc_destroyWeak(v5);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1D036A37C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 144));
  _Unwind_Resume(a1);
}

id getCSProminentLayoutControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCSProminentLayoutControllerClass_softClass;
  v7 = getCSProminentLayoutControllerClass_softClass;
  if (!getCSProminentLayoutControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCSProminentLayoutControllerClass_block_invoke;
    v3[3] = &unk_1E8E2EB18;
    v3[4] = &v4;
    __getCSProminentLayoutControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D036A66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0370150(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id __BSSafeCast(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a1;
  if (a2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

void sub_1D037447C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D037BC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D037E4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0380510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0384D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a31);
  _Unwind_Resume(a1);
}

void sub_1D0387BD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D0387CB0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D0388698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0388C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0389694(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1D0389D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D038A5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
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

Class __getCSProminentLayoutControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoverSheetKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E8E2EB38;
    v5 = 0;
    CoverSheetKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoverSheetKitLibraryCore_frameworkLibrary)
    __getCSProminentLayoutControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CSProminentLayoutController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSProminentLayoutControllerClass_block_invoke_cold_2();
  getCSProminentLayoutControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1D039D034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D039D840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1D039E44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D03BD088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CSFeatureEnabled(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
      goto LABEL_5;
    case 7:
      if ((_os_feature_enabled_impl() & 1) != 0)
        result = 1;
      else
LABEL_5:
        result = _os_feature_enabled_impl();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t CSAutobahnEnabledForPlatform()
{
  if (CSAutobahnEnabledForPlatform_onceToken != -1)
    dispatch_once(&CSAutobahnEnabledForPlatform_onceToken, &__block_literal_global_5);
  return CSAutobahnEnabledForPlatform_enabled;
}

void sub_1D03C5AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id tribeca_supported_text()
{
  if (tribeca_supported_text_token != -1)
    dispatch_once(&tribeca_supported_text_token, &__block_literal_global_90);
  return (id)tribeca_supported_text_text;
}

void __tribeca_supported_text_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  if (!aks_bak_get_beacon())
  {
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "_initUniqueWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyBeaconingSupport.framework"), 0);
    v1 = v0;
    if (v0)
    {
      objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("E786CC8A-FAD0-49DB-9460-F27F248521CD"), &stru_1E8E30B28, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2)
      {
        if (objc_msgSend(v2, "length"))
          objc_storeStrong((id *)&tribeca_supported_text_text, v3);
      }

    }
  }
}

uint64_t CSMagSafeAccessoryTypeForSBSAccessoryType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 0;
  else
    return qword_1D048F6D0[a1 - 1];
}

const __CFString *NSStringFromCSCameraPrewarmingBackgroundLaunchTarget(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("None");
  if (a1 == 1)
    v1 = CFSTR("Application");
  if (a1 == 2)
    return CFSTR("Extension");
  else
    return v1;
}

__CFString *NSStringFromCoverSheetCapability(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  uint64_t *v5;
  uint8x8_t v6;
  int v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  char v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __NSStringFromCoverSheetCapability_block_invoke;
  v14 = &unk_1E8E2F1A8;
  v3 = v2;
  v15 = v3;
  v4 = &v11;
  v5 = v4;
  if (a1)
  {
    v16 = 0;
    v6 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v6.i16[0] = vaddlv_u8(v6);
    v7 = v6.i32[0];
    if (v6.i32[0])
    {
      v8 = 0;
      do
      {
        if (((1 << v8) & a1) != 0)
        {
          ((void (*)(uint64_t *))v13)(v5);
          if (v16)
            break;
          --v7;
        }
        if (v8 > 0x3E)
          break;
        ++v8;
      }
      while (v7 > 0);
    }

    if ((~(_DWORD)a1 & 0x38) == 0)
      objc_msgSend(v3, "addObject:", CFSTR("Unlock"), v11, v12);
  }
  else
  {

  }
  if (objc_msgSend(v3, "count", v11, v12))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("(none)");
  }

  return v9;
}

const __CFString *NSStringFromCoverSheetNotificationBehavior(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("(none)");
  else
    return off_1E8E2F1E8[a1];
}

const __CFString *NSStringFromCoverSheetScrollingStrategy(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(none)");
  else
    return off_1E8E2F1C8[a1];
}

const __CFString *NSStringFromCoverSheetProximityDetectionMode(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(none)");
  else
    return off_1E8E2F210[a1];
}

void sub_1D03CF06C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1D03CF828(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id NSStringFromCSTeachableMomentCallToActionLabelState(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  if (a1 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("SWIPE_UP_TO_OPEN");
    v5 = CFSTR("CoverSheetCommon");
    goto LABEL_5;
  }
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("SWIPE_UP_TO_UNLOCK");
    v5 = CFSTR("CoverSheet");
LABEL_5:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E8E30B28, v5);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

float64_t CubicAnimationControlPoints5ByScalingWithFactor@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, double a3@<D0>)
{
  float64x2_t v3;
  float64_t result;

  v3 = vmulq_n_f64(a1[1], a3);
  *a2 = vmulq_n_f64(*a1, a3);
  a2[1] = v3;
  result = a1[2].f64[0] * a3;
  a2[2].f64[0] = result;
  return result;
}

id CSRingColorForPowerStatus(void *a1)
{
  id v1;
  char v2;
  _BOOL4 v3;
  int v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v1 = a1;
  v2 = objc_msgSend(v1, "powerStatus");
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  if ((v2 & 4) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CEA478];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v7 = 0.0431372549;
    v8 = 1.0;
    v9 = 1.0;
LABEL_13:
    objc_msgSend(v5, "colorWithRed:green:blue:alpha:", v8, v9, v7, 1.0);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((v2 & 2) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CEA478];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v8 = 0.984313725;
    v7 = 0.0274509804;
    v9 = 0.0;
    goto LABEL_13;
  }
  v4 = objc_msgSend(v1, "chargeState");
  v5 = (void *)MEMORY[0x1E0CEA478];
  if ((v2 & 1) != 0 || v4 == 2)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v9 = 0.862745098;
    v7 = 0.392156863;
    v8 = 0.0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v10 = (void *)v6;

  return v10;
}

CSMagSafePowerStatus *CSMagSafePowerStatusForBatteryState(char a1, unsigned int a2, double a3)
{
  CSMagSafePowerStatus *v6;
  uint64_t v7;

  v6 = objc_alloc_init(CSMagSafePowerStatus);
  if ((a1 & 1) != 0)
  {
    v7 = 4;
  }
  else if ((double)objc_msgSend(MEMORY[0x1E0CEA9E8], "lowBatteryLevel") >= a3)
  {
    v7 = 2;
  }
  else
  {
    v7 = a2;
  }
  -[CSMagSafePowerStatus setPowerStatus:](v6, "setPowerStatus:", v7);
  -[CSMagSafePowerStatus setPowerPercent:](v6, "setPowerPercent:", a3);
  return v6;
}

uint64_t CSMagSafeRingPowerStatusForBatteryState(char a1, unsigned int a2, double a3)
{
  if ((a1 & 1) != 0)
    return 4;
  if ((double)objc_msgSend(MEMORY[0x1E0CEA9E8], "lowBatteryLevel") >= a3)
    return 2;
  return a2;
}

const __CFString *NSStringFromCoverSheetEventType(unint64_t a1)
{
  if (a1 > 0x28)
    return CFSTR("(unknown)");
  else
    return off_1E8E2F368[a1];
}

BOOL CSEventIsButtonType(uint64_t a1)
{
  return (unint64_t)(a1 - 27) < 7;
}

BOOL CSEventIsStateless(unint64_t a1)
{
  return a1 > 0x28 || (a1 & 0x1FFFFFFFFFFLL) == 38;
}

BOOL CSCoverSheetEventIsVolumeOrHeadsetButtonType(uint64_t a1)
{
  return (unint64_t)(a1 - 30) < 4;
}

uint64_t CSEventShouldBeLogged(unint64_t a1)
{
  return (a1 > 0x15) | (0x1EFFF8u >> a1) & 1;
}

void sub_1D03E7364(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromCoverSheetComponentType(unint64_t a1)
{
  if (a1 > 0x1B)
    return CFSTR("(none)");
  else
    return off_1E8E2F648[a1];
}

__CFString *NSStringFromTransitionModifiers(char a1)
{
  id v2;
  void *v3;
  __CFString *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 2) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("update"));
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("stretch"));
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "addObject:", CFSTR("targetOffset"));
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "addObject:", CFSTR("targetScale"));
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  objc_msgSend(v3, "addObject:", CFSTR("blur"));
  if ((a1 & 0x40) != 0)
LABEL_7:
    objc_msgSend(v3, "addObject:", CFSTR("level"));
LABEL_8:
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("none");
  }

  return v4;
}

uint64_t CSComponentTransitionInputsMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>)
{
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = a7;
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

uint64_t ComponentTransitionInputsEqualToComponentTransitionInputs(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = BSFloatEqualToFloat();
  if ((_DWORD)result)
  {
    result = BSFloatEqualToFloat();
    if ((_DWORD)result)
    {
      result = BSPointEqualToPoint();
      if ((_DWORD)result)
        return *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40);
    }
  }
  return result;
}

id NSStringFromComponentTransitionInputs(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("duration: '%f'"), *(_QWORD *)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromCGPoint(*(CGPoint *)(a1 + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("targetOffset: '%@'"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetScale: '%f'"), *(_QWORD *)(a1 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("blurRadius: '%f'"), *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("level: '%lu'"), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v9);

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("; "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_1D03E95AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D03F7F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4_0(id a1)
{
  return a1;
}

void sub_1D04044EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1D0415B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t CSAdjustTargetContentOffset(void *a1)
{
  return objc_msgSend(a1, "contentInset");
}

id CSListItemProvidingGetAllProviders()
{
  CSListItemDiscoveryProvider *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(CSListItemDiscoveryProvider);
  +[CSActivityManager sharedInstance](CSActivityManager, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", v1, v0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1D0424850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromCoverSheetRegionRole(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E8E2FE20[a1];
}

void sub_1D042621C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D04265D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D04271D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D04276B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0427810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getAAUIDeviceLocatorServiceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAAUIDeviceLocatorServiceClass_softClass;
  v7 = getAAUIDeviceLocatorServiceClass_softClass;
  if (!getAAUIDeviceLocatorServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAAUIDeviceLocatorServiceClass_block_invoke;
    v3[3] = &unk_1E8E2EB18;
    v3[4] = &v4;
    __getAAUIDeviceLocatorServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D04279B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0427AD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D0427BB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D0428188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D04283D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AppleAccountUILibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E8E2FFC8;
    v3 = 0;
    AppleAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleAccountUILibraryCore_frameworkLibrary)
    AppleAccountUILibrary_cold_1(&v1);
  return AppleAccountUILibraryCore_frameworkLibrary;
}

Class __getAAUIDeviceLocatorServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleAccountUILibrary();
  result = objc_getClass("AAUIDeviceLocatorService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1();
  getAAUIDeviceLocatorServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleAccountUILibrary();
  result = objc_getClass("AAUIDeviceLocatorConfirmationUtilitiesContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke_cold_1();
  getAAUIDeviceLocatorConfirmationUtilitiesContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

Class __getAAFMIPAuthenticateRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E8E2FFE0;
    v5 = 0;
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleAccountLibraryCore_frameworkLibrary)
    __getAAFMIPAuthenticateRequestClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AAFMIPAuthenticateRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAAFMIPAuthenticateRequestClass_block_invoke_cold_2();
  getAAFMIPAuthenticateRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL CSBackgroundStyleIsDarkAffectingLegibility(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

id CSGetLegibilitySettingsForBackgroundStyle(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;

  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v1 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v1, "initWithStyle:contentColor:", 1, v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_1D0437CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0438314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromWidgetPresentationMode(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Invalid Mode Defined");
  else
    return off_1E8E302C0[a1];
}

void sub_1D0439ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1D043B678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CSChargePercentageLabelForBattery(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v1 = a1;
  v2 = objc_msgSend(v1, "percentCharge");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isInternal"))
  {
    if (v2 != 100 && !objc_msgSend(v1, "sb_supportsDetailedBatteryMetrics"))
    {
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BATTERY_CHARGING"), &stru_1E8E30B28, CFSTR("CoverSheet"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BATTERY_CHARGE_PERCENTAGE"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D01B18];
    v7 = (double)v2;
  }
  else
  {
    v8 = objc_msgSend(v1, "isCharging");
    v4 = (void *)MEMORY[0x1E0CB3940];
    if (v8)
      v9 = CFSTR("BATTERY_CHARGE_PERCENTAGE");
    else
      v9 = CFSTR("BATTERY_CHARGE_REMAINING");
    objc_msgSend(v3, "localizedStringForKey:value:table:", v9, &stru_1E8E30B28, CFSTR("CoverSheet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D01B18];
    v7 = (double)v2;
  }
  objc_msgSend(v6, "localizedBatteryDetailTextForBatteryLevel:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v11;
}

id CSSimpleChargePercentageLabelForBattery(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = (objc_class *)MEMORY[0x1E0CB37F0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setNumberStyle:", 3);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v2, "percentCharge");

  objc_msgSend(v5, "numberWithDouble:", (double)v6 / 100.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1D0441FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0442BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void CSUpdateStatusBarBackgroundComponent(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "distanceFromBarToContent");
  objc_msgSend(v1, "topContentInset");
  objc_msgSend(v1, "updateAppearanceForStatusBarBackgroundHidden:", BSFloatLessThanOrEqualToFloat() ^ 1);

}

id __stringsFromTouches(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint v31;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v12 = v4;
        v13 = objc_msgSend(v11, "phase");
        if (v13 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled (%ld)"), v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = off_1E8E30440[v13];
        }
        objc_msgSend(v11, "force");
        v16 = v15;
        objc_msgSend(v11, "locationInView:", v12);
        v18 = v17;
        v20 = v19;

        v31.x = v18;
        v31.y = v20;
        NSStringFromCGPoint(v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<UITouch:%p phase:%@ force: %f, loc: %@>"), v11, v14, v16, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v22);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  return v5;
}

void sub_1D0448764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D044AC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1D044B8DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *location)
{
  id *v11;
  id *v12;
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v14 - 152));
  objc_destroyWeak((id *)(v14 - 144));
  objc_destroyWeak((id *)(v14 - 136));
  _Unwind_Resume(a1);
}

void sub_1D044C56C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

__CFString *NSStringForCSPosterSwitcherPresentationNotReadyReason(unint64_t a1)
{
  if (a1 < 6)
    return off_1E8E306D8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown - %lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1D0461604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D04616B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D0462E60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D0463118(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromCSHostableEntityContentMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("None");
  else
    return off_1E8E30800[a1 - 1];
}

const __CFString *NSStringFromCoverSheetActionType(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("(unknown)");
  else
    return off_1E8E30870[a1];
}

void sub_1D0471C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SBStaticInitializer_cold_1()
{
  __assert_rtn("SBStaticInitializer", "StaticInitializer.m", 39, "platformBinary");
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoverSheetKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSCoverSheetViewController.m"), 252, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSProminentLayoutControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSProminentLayoutControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSCoverSheetViewController.m"), 253, CFSTR("Unable to find class %s"), "CSProminentLayoutController");

  __break(1u);
}

void AppleAccountUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleAccountUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSDeviceBlockViewController.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAAUIDeviceLocatorServiceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAAUIDeviceLocatorServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSDeviceBlockViewController.m"), 37, CFSTR("Unable to find class %s"), "AAUIDeviceLocatorService");

  __break(1u);
}

void __getAAUIDeviceLocatorConfirmationUtilitiesContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAAUIDeviceLocatorConfirmationUtilitiesContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSDeviceBlockViewController.m"), 39, CFSTR("Unable to find class %s"), "AAUIDeviceLocatorConfirmationUtilitiesContext");

  __break(1u);
}

void __getAAFMIPAuthenticateRequestClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleAccountLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSDeviceBlockViewController.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAAFMIPAuthenticateRequestClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAAFMIPAuthenticateRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSDeviceBlockViewController.m"), 40, CFSTR("Unable to find class %s"), "AAFMIPAuthenticateRequest");

  __break(1u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BKSHIDEventTransferTouchesToDifferentCAContext()
{
  return MEMORY[0x1E0D00AB0]();
}

uint64_t BKSHIDServicesCancelTouchesOnMainDisplay()
{
  return MEMORY[0x1E0D00AF8]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011C0]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1E0D01260]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D01268]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1E0D01288]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatByLinearlyInterpolatingFloats()
{
  return MEMORY[0x1E0D012C0]();
}

uint64_t BSFloatCeilForScale()
{
  return MEMORY[0x1E0D012C8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatFloorForScale()
{
  return MEMORY[0x1E0D012D8]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D012E8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1E0D01300]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1E0D01310]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1E0D01348]();
}

uint64_t BSIntervalClip()
{
  return MEMORY[0x1E0D01370]();
}

uint64_t BSIntervalFractionForValue()
{
  return MEMORY[0x1E0D01378]();
}

uint64_t BSIntervalOrder()
{
  return MEMORY[0x1E0D013A0]();
}

uint64_t BSIntervalSubIntervalValueForValue()
{
  return MEMORY[0x1E0D013A8]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1E0D013B8]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1E0D01480]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x1E0D01490]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1E0D014E0]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1E0D014E8]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x1E0D014F0]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01548]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x1E0D01588]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x1E0D01598]();
}

uint64_t BSSettingFlagIsExplicitNo()
{
  return MEMORY[0x1E0D015A0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1E0D015D8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D015F8]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1E0D018E0]();
}

uint64_t BSUIInvertRubberBandValueForInterval()
{
  return MEMORY[0x1E0D018F0]();
}

uint64_t BSUIVibrancyMapBias()
{
  return MEMORY[0x1E0D01900]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1E0CD24F8]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x1E0D14628]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1E0D0FF58]();
}

uint64_t DNDResolvedDimsLockScreenSetting()
{
  return MEMORY[0x1E0D1D490]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x1E0DE0218]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

uint64_t LCSFeatureEnabled()
{
  return MEMORY[0x1E0D44640]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MKBForgottenPasscodeEvent()
{
  return MEMORY[0x1E0D4E4B8]();
}

uint64_t MTStringFromMaterialRecipe()
{
  return MEMORY[0x1E0D47470]();
}

uint64_t NCStringFromLongLookPresentationTrigger()
{
  return MEMORY[0x1E0DC6118]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromIdleTimerDuration()
{
  return MEMORY[0x1E0DA9D28]();
}

uint64_t NSStringFromIdleWarnMode()
{
  return MEMORY[0x1E0DA9D30]();
}

uint64_t NSStringFromInterval()
{
  return MEMORY[0x1E0D01688]();
}

uint64_t NSStringFromPRUISwitcherLayoutMode()
{
  return MEMORY[0x1E0D7F7B0]();
}

uint64_t NSStringFromPreferredNotificationListMode()
{
  return MEMORY[0x1E0DAACF0]();
}

uint64_t NSStringFromSBFIdleTimerMode()
{
  return MEMORY[0x1E0DA9D38]();
}

uint64_t NSStringFromSBSRemoteContentDismissType()
{
  return MEMORY[0x1E0DAAD30]();
}

uint64_t NSStringFromSBUIBiometricEvent()
{
  return MEMORY[0x1E0DAC440]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSStringFromUnlockSource()
{
  return MEMORY[0x1E0DAC200]();
}

uint64_t PBUIIrisWallpaperPlaybackStateDescription()
{
  return MEMORY[0x1E0D65310]();
}

uint64_t PRUISwitcherLayoutTransitionAnimationSettings()
{
  return MEMORY[0x1E0D7F7B8]();
}

uint64_t SBFAudioCategoriesDisablingVolumeHUDUnion()
{
  return MEMORY[0x1E0DAA018]();
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x1E0DAA068]();
}

uint64_t SBFEffectiveDeviceClass()
{
  return MEMORY[0x1E0DAA070]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1E0DAA080]();
}

uint64_t SBFInterfaceOrientationDescription()
{
  return MEMORY[0x1E0DAA0D0]();
}

uint64_t SBFMainScreenScale()
{
  return MEMORY[0x1E0DAA178]();
}

uint64_t SBFStringForAppearState()
{
  return MEMORY[0x1E0DAA1C8]();
}

uint64_t SBFStringForBSInterfaceOrientation()
{
  return MEMORY[0x1E0DAA1D8]();
}

uint64_t SBFTransformForScalingAboutPointInSuperview()
{
  return MEMORY[0x1E0DAA210]();
}

uint64_t SBFTransformFromOrientationToOrientation()
{
  return MEMORY[0x1E0DAA218]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x1E0DAA258]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x1E0DAB330]();
}

uint64_t SBLogCoverSheet()
{
  return MEMORY[0x1E0DAB338]();
}

uint64_t SBLogCoverSheetActivities()
{
  return MEMORY[0x1E0DAB340]();
}

uint64_t SBLogCoverSheetWidgets()
{
  return MEMORY[0x1E0DAB348]();
}

uint64_t SBLogDashBoard()
{
  return MEMORY[0x1E0DAB350]();
}

uint64_t SBLogDashBoardScrollGestures()
{
  return MEMORY[0x1E0DAB368]();
}

uint64_t SBLogDashBoardTelemetrySignposts()
{
  return MEMORY[0x1E0DAB370]();
}

uint64_t SBLogDoNotDisturbBedtime()
{
  return MEMORY[0x1E0DAB3A0]();
}

uint64_t SBLogIdleTimer()
{
  return MEMORY[0x1E0DAB3F0]();
}

uint64_t SBLogLiveRendering()
{
  return MEMORY[0x1E0DAA288]();
}

uint64_t SBLogLockScreenMesaHomeButtonPasscodeRecognizer()
{
  return MEMORY[0x1E0DAB430]();
}

uint64_t SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer()
{
  return MEMORY[0x1E0DAB438]();
}

uint64_t SBSCreateOpenApplicationServiceEndpoint()
{
  return MEMORY[0x1E0DAB628]();
}

uint64_t SBUIConvertUnlockSourceToBacklightChangeSource()
{
  return MEMORY[0x1E0DAC3B0]();
}

uint64_t SBUICurrentPasscodeStyleForUser()
{
  return MEMORY[0x1E0DAC8A8]();
}

uint64_t SBUIGraphicsQuality()
{
  return MEMORY[0x1E0DAC8B8]();
}

uint64_t SBUIProudLockContainerViewControllerConfigurationDefault()
{
  return MEMORY[0x1E0DAC910]();
}

uint64_t SBUIUnlockSourceIsUserAction()
{
  return MEMORY[0x1E0DAC3F0]();
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1E0CD6638](task);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0CEAFE8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0CEB028]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1E0CEB038]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0CEB048]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

uint64_t UIDistanceBetweenRects()
{
  return MEMORY[0x1E0CEB470]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0CEB718]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0CEBA70]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0CEBA80]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0CEBA88]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0CEBA98]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0CEBAA0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0CEBAE0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1E0CEBBC0]();
}

uint64_t XBInterfaceOrientationMaskForInterfaceOrientation()
{
  return MEMORY[0x1E0DA8F90]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1E0DDD560]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x1E0DDD5C0]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _SBFLoggingMethodProem()
{
  return MEMORY[0x1E0DAA2B8]();
}

uint64_t _SBF_Private_IsD16()
{
  return MEMORY[0x1E0DAA2C8]();
}

uint64_t _SBF_Private_IsD17()
{
  return MEMORY[0x1E0DAA2D0]();
}

uint64_t _SBF_Private_IsD33OrSimilarDevice()
{
  return MEMORY[0x1E0DAA2D8]();
}

uint64_t _SBF_Private_IsD52OrSimilarDevice()
{
  return MEMORY[0x1E0DAA2E0]();
}

uint64_t _SBF_Private_IsD52ZoomedOrSimilarDevice()
{
  return MEMORY[0x1E0DAA2E8]();
}

uint64_t _SBF_Private_IsD53()
{
  return MEMORY[0x1E0DAA2F0]();
}

uint64_t _SBF_Private_IsD54()
{
  return MEMORY[0x1E0DAA2F8]();
}

uint64_t _SBF_Private_IsD63()
{
  return MEMORY[0x1E0DAA300]();
}

uint64_t _SBF_Private_IsD63Like()
{
  return MEMORY[0x1E0DAA308]();
}

uint64_t _SBF_Private_IsD64()
{
  return MEMORY[0x1E0DAA310]();
}

uint64_t _SBF_Private_IsD64Like()
{
  return MEMORY[0x1E0DAA318]();
}

uint64_t _SBF_Private_IsD93Like()
{
  return MEMORY[0x1E0DAA320]();
}

uint64_t _SBF_Private_IsD94Like()
{
  return MEMORY[0x1E0DAA328]();
}

uint64_t _SBF_Private_IsN84OrSimilarDevice()
{
  return MEMORY[0x1E0DAA330]();
}

uint64_t _SBF_Private_IsN84ZoomedOrSimilarDevice()
{
  return MEMORY[0x1E0DAA338]();
}

uint64_t _SBUIInterpolatedLegibilitySettings()
{
  return MEMORY[0x1E0DACA08]();
}

uint64_t _UIAccessibilityReduceWhitePoint()
{
  return MEMORY[0x1E0CEBE80]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x1E0CEC160]();
}

uint64_t _UISystemGestureLocationInView()
{
  return MEMORY[0x1E0CEC2A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1E0DABCE0]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1E0DABCF0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t aks_bak_get_beacon()
{
  return MEMORY[0x1E0CFD350]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

uint64_t convertTensionAndFrictionToDampingRatioAndResponse()
{
  return MEMORY[0x1E0DAA350]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1E0DDFEA0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

