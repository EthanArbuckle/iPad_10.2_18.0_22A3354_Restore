@implementation SendSyncDBVNotification

void __SendSyncDBVNotification_block_invoke(uint64_t a1)
{
  float v1;
  char v2;
  const char *v3;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *context;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t *v36;
  const char *v37;
  const char *v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t *v46;
  os_log_t log;
  os_log_type_t v48[4];
  uint8_t *buf;
  NSObject *inited;
  os_log_t v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t block;
  int v56;
  int v57;
  uint64_t (*v58)(uint64_t);
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  os_log_type_t type;
  os_log_t oslog;
  int v65;
  int v66;
  float v67;
  float v68;
  float v69;
  BOOL v70;
  float v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[184];
  uint64_t v75;

  v54 = a1;
  v75 = *MEMORY[0x1E0C80C00];
  v73 = a1;
  v72 = a1;
  v53 = 0;
  v71 = 0.0;
  v71 = *(float *)(*(_QWORD *)(a1 + 32) + 12944);
  v70 = !float_equal(v71, 1.0);
  v69 = 0.0;
  v69 = (float)*(int *)(*(_QWORD *)(v54 + 32) + 1128) / 65536.0;
  v68 = 0.0;
  v68 = *(float *)(v54 + 40);
  if (((*(_BYTE *)(*(_QWORD *)(v54 + 32) + 322) & 1) != 0 || *(double *)(*(_QWORD *)(v54 + 32) + 12608) > 0.0)
    && (*(_BYTE *)(*(_QWORD *)(v54 + 32) + 1517) & 1) != 0)
  {
    v69 = (float)*(int *)(*(_QWORD *)(v54 + 32) + 1132) / 65536.0;
    if ((_DisplayBDMAvailable(*(_QWORD *)(v54 + 32)) & 1) != 0)
      v69 = fminf(v69, *(float *)(*(_QWORD *)(v54 + 32) + 1168));
  }
  v67 = 0.0;
  v67 = *(float *)(*(_QWORD *)(v54 + 32) + 1312) * *(float *)(*(_QWORD *)(v54 + 32) + 1056);
  if ((*(_BYTE *)(*(_QWORD *)(v54 + 32) + 1120) & 1) != 0)
    v67 = *(float *)(*(_QWORD *)(v54 + 32) + 1312);
  v66 = 0;
  v66 = *(_DWORD *)(*(_QWORD *)(v54 + 32) + 12676);
  if ((*(_BYTE *)(v54 + 44) & 1) != 0)
  {
    if (v70)
    {
      v69 = fmaxf(v69, *(float *)(*(_QWORD *)(v54 + 32) + 240));
      v68 = fmaxf(*(float *)(v54 + 40), (float)*(int *)(*(_QWORD *)(v54 + 32) + 236) / 65536.0);
    }
    else
    {
      v69 = *(float *)(*(_QWORD *)(v54 + 32) + 240);
    }
  }
  v65 = 0;
  if (*(float *)(*(_QWORD *)(v54 + 32) + 12468) >= 0.0)
    v52 = *(_DWORD *)(*(_QWORD *)(v54 + 32) + 12468);
  else
    v52 = *(_DWORD *)(*(_QWORD *)(v54 + 32) + 12392);
  v65 = v52;
  oslog = 0;
  if (_logHandle)
  {
    v51 = (os_log_t)_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v51 = inited;
  }
  oslog = v51;
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    log = oslog;
    *(_DWORD *)v48 = type;
    v1 = (float)*(int *)(*(_QWORD *)(v54 + 32) + 1128);
    v39 = 65536.0;
    *(double *)&v40 = (float)(v1 / 65536.0);
    *(double *)&v41 = *(float *)(*(_QWORD *)(v54 + 32) + 464);
    *(double *)&v42 = *(float *)(*(_QWORD *)(v54 + 32) + 528);
    *(double *)&v43 = *(float *)(*(_QWORD *)(v54 + 32) + 1140);
    *(double *)&v44 = *(float *)(*(_QWORD *)(v54 + 32) + 1056);
    v2 = *(_BYTE *)(*(_QWORD *)(v54 + 32) + 1120);
    v37 = "NO";
    v3 = "YES";
    v38 = "YES";
    if ((v2 & 1) == 0)
      v3 = "NO";
    v45 = v3;
    v4 = _DisplayBDMAvailable(*(_QWORD *)(v54 + 32));
    v5 = (uint64_t)v38;
    if ((v4 & 1) != 0)
      v6 = (uint64_t)v38;
    else
      v6 = (uint64_t)v37;
    *(double *)&v7 = *(float *)(*(_QWORD *)(v54 + 32) + 1168);
    if ((*(_BYTE *)(*(_QWORD *)(v54 + 32) + 1517) & 1) != 0)
      v8 = (uint64_t)v38;
    else
      v8 = (uint64_t)v37;
    if ((*(_BYTE *)(*(_QWORD *)(v54 + 32) + 322) & 1) != 0)
      v9 = (uint64_t)v38;
    else
      v9 = (uint64_t)v37;
    *(double *)&v10 = (float)((float)*(int *)(*(_QWORD *)(v54 + 32) + 1132) / v39);
    v11 = *(_QWORD *)(*(_QWORD *)(v54 + 32) + 12608);
    *(double *)&v12 = *(float *)(*(_QWORD *)(v54 + 32) + 1312);
    if (v70)
      v13 = (uint64_t)v38;
    else
      v13 = (uint64_t)v37;
    if ((*(_BYTE *)(v54 + 44) & 1) != 0)
      v14 = (uint64_t)v38;
    else
      v14 = (uint64_t)v37;
    if ((*(_BYTE *)(*(_QWORD *)(v54 + 32) + 232) & 1) == 0)
      v5 = (uint64_t)v37;
    *(double *)&v15 = *(float *)(*(_QWORD *)(v54 + 32) + 240);
    *(double *)&v16 = (float)((float)*(int *)(*(_QWORD *)(v54 + 32) + 236) / v39);
    v46 = &v27;
    buf = v74;
    __os_log_helper_16_2_18_8_0_8_0_8_0_8_0_8_0_8_32_8_32_8_0_8_32_8_32_8_0_8_0_8_0_8_32_8_32_8_32_8_0_8_0((uint64_t)v74, v40, v41, v42, v43, v44, (uint64_t)v45, v6, v7, v8, v9, v10, v11, v12, v13, v14, v5, v15, v16);
    _os_log_impl(&dword_1B5291000, log, v48[0], "SyncDBV Composition | Nits.Cap=%f MaxRestriction.Cap=%f WeakRestriction.Cap=%f PAAB.Scalar=%f RightFactor.Current=%f RightFactor.Overriden=%s BrightDotMitigation.Enabled=%s BrightDotMitigation.Cap=%f EDR.Enabled=%s EDR.IsEngaged=%s EDR.Cap=%f EDR.FadePeriod=%f Panel.Max=%f Aurora.IsBoostingBrightness=%s PreStrobe.Changed=%s PreStrobe.IsActive=%s PreStrobe.Cap=%f PreStrobe.CachedNits=%f", buf, 0xB6u);
  }
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v62 = 0;
  v35 = (id)MEMORY[0x1E0C99E08];
  v29 = 0x1E0CB3000uLL;
  *(float *)&v17 = v68;
  v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  LODWORD(v18) = *(_DWORD *)(*(_QWORD *)(v54 + 32) + 12628);
  v30 = objc_msgSend(*(id *)(v29 + 2024), "numberWithFloat:", v18);
  *(float *)&v19 = v69;
  v31 = objc_msgSend(*(id *)(v29 + 2024), "numberWithFloat:", v19);
  *(float *)&v20 = v67;
  v32 = objc_msgSend(*(id *)(v29 + 2024), "numberWithFloat:", v20);
  LODWORD(v21) = v66;
  v33 = objc_msgSend(*(id *)(v29 + 2024), "numberWithFloat:", v21);
  *(float *)&v22 = v71;
  v23 = objc_msgSend(*(id *)(v29 + 2024), "numberWithFloat:", v22);
  v36 = &v27;
  v62 = (id)objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v34, CFSTR("NitsPhysical"), v30, CFSTR("EDRHeadroom"), v31, CFSTR("NitsCap"), v32, CFSTR("DynSliderCap"), v33, CFSTR("HDRRTPLCHeadroomCap"), v23, CFSTR("AuroraFactor"), 0);
  if ((*(_BYTE *)(*(_QWORD *)(v54 + 32) + 321) & 1) != 0
    && (CBU_PassContrastEnhancerStrengthThroughSyncDBV() & 1) != 0)
  {
    LODWORD(v24) = v65;
    v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v25, CFSTR("ContrastEnhancerStrength"));
  }
  v26 = *(NSObject **)(*(_QWORD *)(v54 + 32) + 144);
  block = MEMORY[0x1E0C809B0];
  v56 = -1073741824;
  v57 = 0;
  v58 = __SendSyncDBVNotification_block_invoke_20;
  v59 = &unk_1E68EA3D8;
  v61 = *(_QWORD *)(v54 + 32);
  v60 = v62;
  dispatch_async(v26, &block);
  objc_autoreleasePoolPop(context);
}

uint64_t __SendSyncDBVNotification_block_invoke_20(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 40) + 16))
    return (*(uint64_t (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(*(_QWORD *)(result + 40) + 24), CFSTR("FrameSynchronizedBrightnessTransaction"), *(_QWORD *)(result + 32));
  return result;
}

@end
