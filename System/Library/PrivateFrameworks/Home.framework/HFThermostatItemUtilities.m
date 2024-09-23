@implementation HFThermostatItemUtilities

+ (void)getDescription:(id *)a3 controlDescription:(id *)a4 optionalDescriptions:(id *)a5 forResponse:(id)a6 primaryService:(id)a7 temperatureFormatter:(id)a8
{
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t *v75;
  id v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  _QWORD aBlock[10];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  _QWORD v115[2];
  _QWORD v116[4];

  v116[2] = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v95 = a7;
  v15 = a8;
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__15;
  v113 = __Block_byref_object_dispose__15;
  v114 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__15;
  v107 = __Block_byref_object_dispose__15;
  v108 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__15;
  v101 = __Block_byref_object_dispose__15;
  v102 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__HFThermostatItemUtilities_getDescription_controlDescription_optionalDescriptions_forResponse_primaryService_temperatureFormatter___block_invoke;
  aBlock[3] = &unk_1EA7352A8;
  aBlock[4] = &v109;
  aBlock[5] = &v103;
  aBlock[8] = a4;
  aBlock[9] = a5;
  aBlock[6] = &v97;
  aBlock[7] = a3;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "currentHeatingCoolingModeValueInResponse:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "targetHeatingCoolingModeValueInResponse:", v14);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v17 && v18)
  {
    objc_msgSend(v14, "responseForCharacteristicType:", *MEMORY[0x1E0CB8828]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "valueWithExpectedClass:", objc_opt_class());
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "responseForCharacteristicType:", *MEMORY[0x1E0CB88D8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueWithExpectedClass:", objc_opt_class());
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v95, "hf_childServices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "na_firstObjectPassingTest:", &__block_literal_global_113);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v14, "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB8790], v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "valueWithExpectedClass:", objc_opt_class());
      v91 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v91 = 0;
    }
    v25 = (void *)objc_msgSend(CFSTR("HFServiceDescriptionThermostat"), "mutableCopy");
    if (objc_msgSend(v19, "integerValue") == 3)
    {
      objc_msgSend(v25, "appendString:", CFSTR("Auto"));
      v26 = 2;
    }
    else
    {
      v27 = objc_msgSend(v17, "integerValue");
      switch(v27)
      {
        case 0:
          v29 = objc_msgSend(v19, "integerValue");
          v28 = CFSTR("TargetCooling");
          v26 = 1;
          switch(v29)
          {
            case 0:
              if (objc_msgSend(v91, "BOOLValue", CFSTR("TargetCooling")))
                v30 = CFSTR("FanOnly");
              else
                v30 = CFSTR("Off");
              objc_msgSend(v25, "appendString:", v30);
              v26 = 0;
              goto LABEL_19;
            case 1:
              v28 = CFSTR("TargetHeating");
              goto LABEL_18;
            case 2:
              goto LABEL_18;
            case 3:
              goto LABEL_19;
            default:
              NSLog(CFSTR("Unexpected target heating / cooling mode %@"), v19);
              break;
          }
          goto LABEL_28;
        case 1:
          v28 = CFSTR("Heating");
          break;
        case 2:
          v28 = CFSTR("Cooling");
          break;
        default:
          NSLog(CFSTR("Unexpected current heating / cooling mode %@"), v17);
          goto LABEL_28;
      }
LABEL_18:
      objc_msgSend(v25, "appendString:", v28);
      v26 = 1;
    }
LABEL_19:
    objc_msgSend(a1, "targetTemperatureValueInResponse:", v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringForObjectValue:", v31);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      if (v26 != 1 && v94 && v93)
      {
        objc_msgSend(v25, "appendString:", CFSTR("WithTemperatureRange"));
        objc_msgSend(v15, "stringForObjectValue:", v94);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringForObjectValue:", v93);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(v25, CFSTR("%@%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v32);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v110[5];
        v110[5] = v40;

        objc_msgSend(v15, "stringForObjectValue:", v94);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringForObjectValue:", v93);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionThermostatAutoWithTemperatureRange"), CFSTR("%@%@"), v43, v44, v45, v46, v47, v48, (uint64_t)v42);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v104[5];
        v104[5] = v49;

        v115[0] = CFSTR("heatingThresholdDescription");
        objc_msgSend(v15, "stringForObjectValue:", v94);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionThermostatAutoHeatingWithTemperature"), CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v51);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v116[0] = v90;
        v115[1] = CFSTR("coolingThresholdDescription");
        objc_msgSend(v15, "stringForObjectValue:", v93);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionThermostatAutoCoolingWithTemperature"), CFSTR("%@"), v58, v59, v60, v61, v62, v63, (uint64_t)v89);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v116[1] = v64;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = (void *)v98[5];
        v98[5] = v65;

      }
      else
      {
        objc_msgSend(v25, "appendString:", CFSTR("WithTemperature"));
        HFLocalizedStringWithFormat(v25, CFSTR("%@"), v67, v68, v69, v70, v71, v72, (uint64_t)v92);
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v110[5];
        v110[5] = v73;

        v75 = v104;
        v76 = (id)v110[5];
        v51 = (void *)v75[5];
        v75[5] = (uint64_t)v76;
      }
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(v25, v25, 1);
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = (void *)v110[5];
      v110[5] = v77;

      _HFLocalizedStringWithDefaultValue(v25, v25, 1);
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = (void *)v104[5];
      v104[5] = v79;

      if (v104[5])
        goto LABEL_27;
      if (v31 && v92)
      {
        HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionThermostatOff"), CFSTR("%@"), v81, v82, v83, v84, v85, v86, (uint64_t)v92);
        v87 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceControlDescriptionThermostatOffNoTargetTemperature"), CFSTR("HFServiceControlDescriptionThermostatOffNoTargetTemperature"), 1);
        v87 = objc_claimAutoreleasedReturnValue();
      }
      v51 = (void *)v104[5];
      v104[5] = v87;
    }

LABEL_27:
LABEL_28:

  }
  if (v16)
    v16[2](v16);

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);

  _Block_object_dispose(&v109, 8);
}

void __132__HFThermostatItemUtilities_getDescription_controlDescription_optionalDescriptions_forResponse_primaryService_temperatureFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (*(_QWORD *)(a1 + 64))
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v2)
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    **(_QWORD **)(a1 + 64) = objc_retainAutorelease(v2);
  }
  if (*(_QWORD *)(a1 + 72))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v3)
    {
      **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      **(_QWORD **)(a1 + 72) = v4;

    }
  }
}

uint64_t __132__HFThermostatItemUtilities_getDescription_controlDescription_optionalDescriptions_forResponse_primaryService_temperatureFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B10]);

  return v3;
}

@end
