@implementation HMCharacteristic

uint64_t __62__HMCharacteristic_Additions__hf_characteristicSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t (**v13)(void *, id, id);
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "characteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "hf_sortPriorityForCharacteristicType:", v8);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v6, "characteristicType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "hf_sortPriorityForCharacteristicType:", v11);

    v13 = (uint64_t (**)(void *, id, id))&__block_literal_global_43_2;
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Use of %@ with unknown types %@ and %@"), v18, v5, v6);

      v17 = 0;
      goto LABEL_11;
    }
    v9 = objc_msgSend(*(id *)(a1 + 32), "hf_sortPriorityForCharacteristicType:", v5);
    v12 = objc_msgSend(*(id *)(a1 + 32), "hf_sortPriorityForCharacteristicType:", v6);
    v14 = 0;
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:", v16);

  if (v14 && !v17)
    v17 = v13[2](v13, v5, v6);
LABEL_11:

  return v17;
}

id __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED3799A0 != -1)
    dispatch_once(&qword_1ED3799A0, block);
  return (id)qword_1ED3799A8;
}

void __76__HMCharacteristic_Additions___hf_alarmCharacteristicTypeToAbnormalValueMap__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[8];
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB87D8];
  v7[0] = *MEMORY[0x1E0CB8958];
  v7[1] = v0;
  v8[0] = MEMORY[0x1E0C9AAB0];
  v8[1] = MEMORY[0x1E0C9AAB0];
  v1 = *MEMORY[0x1E0CB8930];
  v7[2] = *MEMORY[0x1E0CB87F0];
  v7[3] = v1;
  v8[2] = MEMORY[0x1E0C9AAB0];
  v8[3] = MEMORY[0x1E0C9AAB0];
  v2 = *MEMORY[0x1E0CB8A38];
  v7[4] = *MEMORY[0x1E0CB8988];
  v7[5] = v2;
  v8[4] = MEMORY[0x1E0C9AAB0];
  v8[5] = MEMORY[0x1E0C9AAB0];
  v8[6] = &unk_1EA7CCCD0;
  v3 = *MEMORY[0x1E0CB87B0];
  v7[6] = *MEMORY[0x1E0CB8820];
  v7[7] = v3;
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMinValue:", &unk_1EA7CCCE8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[7] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED3799B8;
  qword_1ED3799B8 = v5;

}

void __81__HMCharacteristic_Additions___hf_valueRangeCharacteristicTypeToAbnormalValueMap__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0CB87B0];
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMinValue:", &unk_1EA7CCCE8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = *MEMORY[0x1E0CB8890];
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMinValue:", &unk_1EA7CCD00);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = *MEMORY[0x1E0CB8880];
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", &unk_1EA7CCD18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = *MEMORY[0x1E0CB8860];
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", &unk_1EA7CCD30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED3799C8;
  qword_1ED3799C8 = v4;

}

void __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "_hf_valueRangeCharacteristicTypeToAbnormalValueMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379978;
  qword_1ED379978 = v3;

}

void __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "_hf_alarmCharacteristicTypeToAbnormalValueMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379998;
  qword_1ED379998 = v3;

}

void __63__HMCharacteristic_Additions__hf_powerStateCharacteristicTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB89C8], *MEMORY[0x1E0CB8790], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379968;
  qword_1ED379968 = v0;

}

void __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "hf_alarmCharacteristicTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_valueRangeCharacteristicTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3799A8;
  qword_1ED3799A8 = v3;

}

id __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED379970 != -1)
    dispatch_once(&qword_1ED379970, block);
  return (id)qword_1ED379978;
}

id __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED379990 != -1)
    dispatch_once(&qword_1ED379990, block);
  return (id)qword_1ED379998;
}

void __68__HMCharacteristic_Additions__hf_sortPriorityForCharacteristicType___block_invoke()
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
  void *v10;
  uint64_t v11;
  void *v12;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _QWORD v73[7];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[2];
  _QWORD v77[26];
  _QWORD v78[10];
  uint64_t v79;
  _QWORD v80[2];
  uint64_t v81;
  _QWORD v82[3];
  _QWORD v83[5];
  _QWORD v84[6];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[14];
  _QWORD v88[16];

  v88[14] = *MEMORY[0x1E0C80C00];
  v87[0] = &unk_1EA7CCD60;
  v0 = *MEMORY[0x1E0CB8790];
  v86[0] = *MEMORY[0x1E0CB89C8];
  v86[1] = v0;
  v1 = *MEMORY[0x1E0CB8AE0];
  v86[2] = *MEMORY[0x1E0CB8AA8];
  v86[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v62;
  v87[1] = &unk_1EA7CCD78;
  v2 = *MEMORY[0x1E0CB89F0];
  v85[0] = *MEMORY[0x1E0CB87C0];
  v85[1] = v2;
  v3 = *MEMORY[0x1E0CB8B00];
  v85[2] = *MEMORY[0x1E0CB8AC0];
  v85[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v61;
  v87[2] = &unk_1EA7CCD90;
  v4 = *MEMORY[0x1E0CB8A00];
  v84[0] = *MEMORY[0x1E0CB88E8];
  v84[1] = v4;
  v5 = *MEMORY[0x1E0CB8B08];
  v84[2] = *MEMORY[0x1E0CB8AF0];
  v84[3] = v5;
  v6 = *MEMORY[0x1E0CB8918];
  v84[4] = *MEMORY[0x1E0CB8AA0];
  v84[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 6);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v60;
  v87[3] = &unk_1EA7CCDA8;
  v7 = *MEMORY[0x1E0CB8AC8];
  v83[0] = *MEMORY[0x1E0CB8AF8];
  v83[1] = v7;
  v8 = *MEMORY[0x1E0CB8AB0];
  v83[2] = *MEMORY[0x1E0CB8B10];
  v83[3] = v8;
  v83[4] = *MEMORY[0x1E0CB8A28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 5);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v59;
  v87[4] = &unk_1EA7CCDC0;
  v9 = *MEMORY[0x1E0CB88D8];
  v82[0] = *MEMORY[0x1E0CB8828];
  v82[1] = v9;
  v82[2] = *MEMORY[0x1E0CB8A98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v58;
  v87[5] = &unk_1EA7CCDD8;
  v81 = *MEMORY[0x1E0CB89E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v10;
  v87[6] = &unk_1EA7CCDF0;
  v11 = *MEMORY[0x1E0CB8B20];
  v80[0] = *MEMORY[0x1E0CB88E0];
  v80[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v12;
  v87[7] = &unk_1EA7CCE08;
  v79 = *MEMORY[0x1E0CB8940];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v13;
  v87[8] = &unk_1EA7CCE20;
  v14 = *MEMORY[0x1E0CB8848];
  v78[0] = *MEMORY[0x1E0CB8838];
  v78[1] = v14;
  v15 = *MEMORY[0x1E0CB8868];
  v78[2] = *MEMORY[0x1E0CB8850];
  v78[3] = v15;
  v16 = *MEMORY[0x1E0CB8880];
  v78[4] = *MEMORY[0x1E0CB8878];
  v78[5] = v16;
  v17 = *MEMORY[0x1E0CB8890];
  v78[6] = *MEMORY[0x1E0CB8888];
  v78[7] = v17;
  v18 = *MEMORY[0x1E0CB89E0];
  v78[8] = *MEMORY[0x1E0CB8898];
  v78[9] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v19;
  v87[9] = &unk_1EA7CCD48;
  v20 = *MEMORY[0x1E0CB87A8];
  v77[0] = *MEMORY[0x1E0CB87A0];
  v77[1] = v20;
  v21 = *MEMORY[0x1E0CB87D8];
  v77[2] = *MEMORY[0x1E0CB87B0];
  v77[3] = v21;
  v22 = *MEMORY[0x1E0CB87E8];
  v77[4] = *MEMORY[0x1E0CB87E0];
  v77[5] = v22;
  v23 = *MEMORY[0x1E0CB87F8];
  v77[6] = *MEMORY[0x1E0CB87F0];
  v77[7] = v23;
  v24 = *MEMORY[0x1E0CB89A0];
  v77[8] = *MEMORY[0x1E0CB8800];
  v77[9] = v24;
  v25 = *MEMORY[0x1E0CB8A70];
  v77[10] = *MEMORY[0x1E0CB8978];
  v77[11] = v25;
  v26 = *MEMORY[0x1E0CB89A8];
  v77[12] = *MEMORY[0x1E0CB89B0];
  v77[13] = v26;
  v27 = *MEMORY[0x1E0CB8820];
  v77[14] = *MEMORY[0x1E0CB8B30];
  v77[15] = v27;
  v28 = *MEMORY[0x1E0CB8930];
  v77[16] = *MEMORY[0x1E0CB8860];
  v77[17] = v28;
  v29 = *MEMORY[0x1E0CB8980];
  v77[18] = *MEMORY[0x1E0CB8958];
  v77[19] = v29;
  v30 = *MEMORY[0x1E0CB8990];
  v77[20] = *MEMORY[0x1E0CB8988];
  v77[21] = v30;
  v31 = *MEMORY[0x1E0CB8A08];
  v77[22] = *MEMORY[0x1E0CB89B8];
  v77[23] = v31;
  v32 = *MEMORY[0x1E0CB8B48];
  v77[24] = *MEMORY[0x1E0CB8A38];
  v77[25] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v88[9] = v33;
  v87[10] = &unk_1EA7CCE38;
  v34 = *MEMORY[0x1E0CB88B8];
  v76[0] = *MEMORY[0x1E0CB8A60];
  v76[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v35;
  v87[11] = &unk_1EA7CCE50;
  v36 = *MEMORY[0x1E0CB8808];
  v75[0] = *MEMORY[0x1E0CB87B8];
  v75[1] = v36;
  v75[2] = *MEMORY[0x1E0CB88C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v88[11] = v37;
  v87[12] = &unk_1EA7CCE68;
  v38 = *MEMORY[0x1E0CB8A50];
  v74[0] = *MEMORY[0x1E0CB8A48];
  v74[1] = v38;
  v74[2] = *MEMORY[0x1E0CB8A68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v88[12] = v39;
  v87[13] = &unk_1EA7CCE80;
  v40 = *MEMORY[0x1E0CB8950];
  v73[0] = *MEMORY[0x1E0CB8948];
  v73[1] = v40;
  v41 = *MEMORY[0x1E0CB88C8];
  v73[2] = *MEMORY[0x1E0CB8968];
  v73[3] = v41;
  v42 = *MEMORY[0x1E0CB8A20];
  v73[4] = *MEMORY[0x1E0CB88D0];
  v73[5] = v42;
  v73[6] = *MEMORY[0x1E0CB8A40];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88[13] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 14);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_opt_new();
  v46 = (void *)qword_1ED379A10;
  qword_1ED379A10 = v45;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v47 = v44;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v68 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v47, "objectForKeyedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v55; ++j)
            {
              if (*(_QWORD *)v64 != v56)
                objc_enumerationMutation(v53);
              objc_msgSend((id)qword_1ED379A10, "setObject:forKeyedSubscript:", v52, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
          }
          while (v55);
        }

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v49);
  }

}

void __61__HMCharacteristic_HFDebugging__hf_descriptionForProperties___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8788];
  v4[0] = *MEMORY[0x1E0CB8770];
  v4[1] = v0;
  v5[0] = CFSTR("R");
  v5[1] = CFSTR("W");
  v1 = *MEMORY[0x1E0CB8780];
  v4[2] = *MEMORY[0x1E0CB8768];
  v4[3] = v1;
  v5[2] = CFSTR("H");
  v5[3] = CFSTR("N");
  v4[4] = *MEMORY[0x1E0CB8778];
  v5[4] = CFSTR("A");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378EB0;
  qword_1ED378EB0 = v2;

}

id __61__HMCharacteristic_HFDebugging__hf_descriptionForProperties___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

id __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED379980 != -1)
    dispatch_once(&qword_1ED379980, block);
  return (id)qword_1ED379988;
}

void __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "hf_valueRangeCharacteristicTypes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB87B0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_removedObjectsFromSet:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379988;
  qword_1ED379988 = v2;

}

void __91__HMCharacteristic_Additions___hf_valueRangeCharacteristicTypeToVisibleTriggerValueStepMap__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB8880];
  v3[0] = &unk_1EA7CCD48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3799D8;
  qword_1ED3799D8 = v0;

}

uint64_t __59__HMCharacteristic_Additions__hf_formattedValueUpdatedTime__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED3799E0;
  qword_1ED3799E0 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED3799E0, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
}

void __97__HMCharacteristic_Additions__hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType___block_invoke()
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[9];
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8B08];
  v1 = *MEMORY[0x1E0CB8848];
  v14[0] = *MEMORY[0x1E0CB8890];
  v14[1] = v1;
  v2 = *MEMORY[0x1E0CB8AC0];
  v15[0] = v0;
  v15[1] = v2;
  v3 = *MEMORY[0x1E0CB8AF8];
  v4 = *MEMORY[0x1E0CB8838];
  v14[2] = *MEMORY[0x1E0CB8880];
  v14[3] = v4;
  v5 = *MEMORY[0x1E0CB8AA8];
  v15[2] = v3;
  v15[3] = v5;
  v6 = *MEMORY[0x1E0CB8AE0];
  v7 = *MEMORY[0x1E0CB8850];
  v14[4] = *MEMORY[0x1E0CB8868];
  v14[5] = v7;
  v8 = *MEMORY[0x1E0CB8AC8];
  v15[4] = v6;
  v15[5] = v8;
  v9 = *MEMORY[0x1E0CB8AF0];
  v10 = *MEMORY[0x1E0CB8888];
  v14[6] = *MEMORY[0x1E0CB8878];
  v14[7] = v10;
  v11 = *MEMORY[0x1E0CB8B00];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x1E0CB8898];
  v15[8] = *MEMORY[0x1E0CB8B10];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ED3799F0;
  qword_1ED3799F0 = v12;

}

void __97__HMCharacteristic_Additions__hf_currentStateCharacteristicTypeForTargetStateCharacteristicType___block_invoke()
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[9];
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8890];
  v1 = *MEMORY[0x1E0CB8AC0];
  v14[0] = *MEMORY[0x1E0CB8B08];
  v14[1] = v1;
  v2 = *MEMORY[0x1E0CB8848];
  v15[0] = v0;
  v15[1] = v2;
  v3 = *MEMORY[0x1E0CB8880];
  v4 = *MEMORY[0x1E0CB8AA8];
  v14[2] = *MEMORY[0x1E0CB8AF8];
  v14[3] = v4;
  v5 = *MEMORY[0x1E0CB8838];
  v15[2] = v3;
  v15[3] = v5;
  v6 = *MEMORY[0x1E0CB8868];
  v7 = *MEMORY[0x1E0CB8AC8];
  v14[4] = *MEMORY[0x1E0CB8AE0];
  v14[5] = v7;
  v8 = *MEMORY[0x1E0CB8850];
  v15[4] = v6;
  v15[5] = v8;
  v9 = *MEMORY[0x1E0CB8878];
  v10 = *MEMORY[0x1E0CB8B00];
  v14[6] = *MEMORY[0x1E0CB8AF0];
  v14[7] = v10;
  v11 = *MEMORY[0x1E0CB8888];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x1E0CB8B10];
  v15[8] = *MEMORY[0x1E0CB8898];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ED379A00;
  qword_1ED379A00 = v12;

}

uint64_t __62__HMCharacteristic_Additions__hf_characteristicSortComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

void __78__HMCharacteristic_Additions__hf_shouldCaptureCharacteristicTypeInActionSets___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8918];
  v5[0] = *MEMORY[0x1E0CB8B20];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E0CB8A28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379A28;
  qword_1ED379A28 = v3;

}

void __66__HMCharacteristic_Additions__hf_shouldValidateActionTargetValues__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0CB8810];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379A38;
  qword_1ED379A38 = v2;

}

id __65__HMCharacteristic_Additions__hf_programmableSwitchValidValueSet__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CBA4D0];
  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v2, "hf_localizedStringForProgrammableSwitchCharacteristic:value:", WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = CFSTR("title");
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

uint64_t __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke_2;
    v13[3] = &unk_1EA73AFA0;
    v9 = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v15 = v9;
    v10 = v7;
    v11 = objc_msgSend(v8, "na_any:", v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);

  if (v8 == v9)
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isEqual:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke_2;
    v14[3] = &unk_1EA73AFF0;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v15 = v7;
    v16 = v9;
    v17 = v10;
    v11 = v7;
    v12 = objc_msgSend(v8, "na_any:", v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);

  if (v8 == v9
    && (objc_msgSend(v7, "uniqueIdentifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "isEqual:", v11),
        v11,
        v10,
        v12))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v6, "triggerValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 48));

    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __94__HMCharacteristic_Additions__hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomeAppCreatedTrigger");
}

void __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  v5 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_2;
  v8[3] = &unk_1EA73B0A8;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "na_each:", v8);

}

void __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  objc_msgSend(v5, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_3;
  v6[3] = &unk_1EA73B080;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "triggerValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  return v8;
}

id __65__HMCharacteristic_Additions___hf_lightLevelVisibleTriggerValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hf_minimumTriggerValue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(*(id *)(a1 + 32), "hf_minimumTriggerValue"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v3, "compare:", v6),
        v6,
        v5,
        v7 != -1))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_maximumTriggerValue");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(*(id *)(a1 + 32), "hf_maximumTriggerValue"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v3, "compare:", v10),
          v10,
          v9,
          v11 != 1))
    {
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stepValue");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v3, "floatValue");
        v17 = v16;
        objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v20 = fmodf(v17, v19);

        if (v20 != 0.0)
        {
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v3, "floatValue");
          v23 = v22;
          objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "floatValue");
          v26 = roundf(v23 / v25);
          objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "floatValue");
          objc_msgSend(v21, "numberWithInteger:", (uint64_t)(float)(v26 * v28));
          v12 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      else
      {

      }
      v12 = v3;
      goto LABEL_11;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

uint64_t __65__HMCharacteristic_Additions___hf_triggerValuesWithMinStepValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stepValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {

LABEL_7:
    v12 = *(void **)(a1 + 40);
    if (v12)
      return objc_msgSend(v12, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stepValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      return 1;
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stepValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    return v17;
  }
  v4 = *(_QWORD *)(a1 + 40);

  if (!v4)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  v9 = roundf(v7 / v8);

  if (v9 < 1.0)
    v9 = 1.0;
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  return (int)(float)(v10 * v9);
}

void __65__HMCharacteristic_Additions___hf_visibleLightLevelTriggerValues__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED379A48;
  qword_1ED379A48 = (uint64_t)&unk_1EA7CDE88;

}

id __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD block[4];
  id v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_2;
  block[3] = &unk_1EA727DD8;
  v1 = *(id *)(a1 + 32);
  v6 = v1;
  if (_MergedGlobals_294 == -1)
  {
    v2 = v1;
  }
  else
  {
    dispatch_once(&_MergedGlobals_294, block);
    v2 = v6;
  }
  v3 = (id)qword_1ED379A58;

  return v3;
}

void __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_3;
  v3[3] = &unk_1EA7384E0;
  v4 = *(id *)(a1 + 32);
  __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED379A58;
  qword_1ED379A58 = v1;

}

id __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_3(uint64_t a1)
{
  HFPrimaryStateCharacteristicActionSuggestionVendor *v2;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v3;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v4;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v5;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v6;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v7;
  HFPrimaryStateCharacteristicActionSuggestionVendor *v8;
  HFIncrementalStateCharacteristicActionSuggestionVendor *v9;
  HFIncrementalStateCharacteristicActionSuggestionVendor *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0CB89C8];
  v2 = [HFPrimaryStateCharacteristicActionSuggestionVendor alloc];
  v3 = -[HFPrimaryStateCharacteristicActionSuggestionVendor initWithCharacteristicType:normalStateValue:](v2, "initWithCharacteristicType:normalStateValue:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AAA0]);
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0CB8790];
  v4 = -[HFPrimaryStateCharacteristicActionSuggestionVendor initWithCharacteristicType:normalStateValue:]([HFPrimaryStateCharacteristicActionSuggestionVendor alloc], "initWithCharacteristicType:normalStateValue:", *(_QWORD *)(a1 + 32), &unk_1EA7CCF88);
  v14[1] = v4;
  v13[2] = *MEMORY[0x1E0CB8AE0];
  v5 = -[HFPrimaryStateCharacteristicActionSuggestionVendor initWithCharacteristicType:normalStateValue:]([HFPrimaryStateCharacteristicActionSuggestionVendor alloc], "initWithCharacteristicType:normalStateValue:", *(_QWORD *)(a1 + 32), &unk_1EA7CCFA0);
  v14[2] = v5;
  v13[3] = *MEMORY[0x1E0CB8B00];
  v6 = -[HFPrimaryStateCharacteristicActionSuggestionVendor initWithCharacteristicType:normalStateValue:]([HFPrimaryStateCharacteristicActionSuggestionVendor alloc], "initWithCharacteristicType:normalStateValue:", *(_QWORD *)(a1 + 32), &unk_1EA7CCFB8);
  v14[3] = v6;
  v13[4] = *MEMORY[0x1E0CB8AA8];
  v7 = -[HFPrimaryStateCharacteristicActionSuggestionVendor initWithCharacteristicType:normalStateValue:]([HFPrimaryStateCharacteristicActionSuggestionVendor alloc], "initWithCharacteristicType:normalStateValue:", *(_QWORD *)(a1 + 32), &unk_1EA7CCFA0);
  v14[4] = v7;
  v13[5] = *MEMORY[0x1E0CB8AF0];
  v8 = -[HFPrimaryStateCharacteristicActionSuggestionVendor initWithCharacteristicType:normalStateValue:bucketingPolicy:]([HFPrimaryStateCharacteristicActionSuggestionVendor alloc], "initWithCharacteristicType:normalStateValue:bucketingPolicy:", *(_QWORD *)(a1 + 32), &unk_1EA7CCFD0, 1);
  v14[5] = v8;
  v13[6] = *MEMORY[0x1E0CB87C0];
  v9 = -[HFIncrementalStateCharacteristicActionSuggestionVendor initWithCharacteristicType:]([HFIncrementalStateCharacteristicActionSuggestionVendor alloc], "initWithCharacteristicType:", *(_QWORD *)(a1 + 32));
  v14[6] = v9;
  v13[7] = *MEMORY[0x1E0CB89F0];
  v10 = -[HFIncrementalStateCharacteristicActionSuggestionVendor initWithCharacteristicType:]([HFIncrementalStateCharacteristicActionSuggestionVendor alloc], "initWithCharacteristicType:", *(_QWORD *)(a1 + 32));
  v14[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
