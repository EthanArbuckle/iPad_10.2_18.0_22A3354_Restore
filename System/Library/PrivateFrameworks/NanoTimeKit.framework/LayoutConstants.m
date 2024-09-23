@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledValue:withOverride:forSizeClass:", 3, 18.0, 19.5);
  _LayoutConstants___constants_0 = v2;
  objc_msgSend(v6, "scaledValue:", 17.0);
  _LayoutConstants___constants_1 = v3;
  objc_msgSend(v6, "scaledValue:", 15.5);
  _LayoutConstants___constants_2 = v4;
  objc_msgSend(v6, "scaledValue:", 62.0);
  _LayoutConstants___constants_3 = v5;

}

void ___LayoutConstants_block_invoke_0(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int64x2_t v50;
  __int128 v51;
  unint64_t v52;
  __int128 v53;
  __int128 v60;
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[8];
  _QWORD v66[8];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[7];
  _QWORD v74[7];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[3];
  _QWORD v98[5];

  v98[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoundingBehavior:", 1);
  v97[0] = &unk_1E6C9D5E8;
  v97[1] = &unk_1E6C9D600;
  v98[0] = &unk_1E6CA2998;
  v98[1] = &unk_1E6CA29A8;
  v97[2] = &unk_1E6C9D618;
  v98[2] = &unk_1E6CA29B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v4, 10.0);
  _LayoutConstants_constants = v5;

  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 3, 2.0, 2.5);
  qword_1EF1722B0 = v6;
  v95[0] = &unk_1E6C9D5E8;
  v95[1] = &unk_1E6C9D618;
  v96[0] = &unk_1E6CA29C8;
  v96[1] = &unk_1E6CA29D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v7, 50.0);
  qword_1EF1722C0 = v8;

  v93[0] = &unk_1E6C9D5E8;
  v93[1] = &unk_1E6C9D618;
  v94[0] = &unk_1E6CA29C8;
  v94[1] = &unk_1E6CA29D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v9, 50.0);
  qword_1EF1722B8 = v10;

  v91[0] = &unk_1E6C9D5E8;
  v91[1] = &unk_1E6C9D600;
  v92[0] = &unk_1E6CA29E8;
  v92[1] = &unk_1E6CA29F8;
  v91[2] = &unk_1E6C9D618;
  v92[2] = &unk_1E6CA2A08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v11, 20.5);
  qword_1EF1722C8 = v12;

  v89[0] = &unk_1E6C9D630;
  v89[1] = &unk_1E6C9D618;
  v90[0] = &unk_1E6CA2A18;
  v90[1] = &unk_1E6CA2A18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constantValue:withOverrides:", v13, 0.0);
  qword_1EF172370 = v14;

  v87[0] = &unk_1E6C9D5E8;
  v87[1] = &unk_1E6C9D600;
  v88[0] = &unk_1E6CA2A28;
  v88[1] = &unk_1E6CA2A38;
  v87[2] = &unk_1E6C9D618;
  v88[2] = &unk_1E6CA2A48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v15, 64.5);
  qword_1EF1722D0 = v16;

  v85[0] = &unk_1E6C9D5E8;
  v85[1] = &unk_1E6C9D618;
  v86[0] = &unk_1E6CA2A58;
  v86[1] = &unk_1E6CA2A68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v17, 22.0);
  qword_1EF1722D8 = v18;

  v83[0] = &unk_1E6C9D5E8;
  v83[1] = &unk_1E6C9D618;
  v84[0] = &unk_1E6CA2A78;
  v84[1] = &unk_1E6CA2A88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v19, 40.0);
  qword_1EF1722E0 = v20;

  objc_msgSend(v3, "scaledValue:", 16.0);
  qword_1EF1722E8 = v21;
  v81[0] = &unk_1E6C9D5E8;
  v81[1] = &unk_1E6C9D618;
  v82[0] = &unk_1E6CA2A58;
  v82[1] = &unk_1E6CA2A68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v22, 22.0);
  qword_1EF1722F0 = v23;

  v79[0] = &unk_1E6C9D5E8;
  v79[1] = &unk_1E6C9D600;
  v80[0] = &unk_1E6CA2A98;
  v80[1] = &unk_1E6CA2AA8;
  v79[2] = &unk_1E6C9D618;
  v80[2] = &unk_1E6CA2AB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v24, 60.0);
  qword_1EF172300 = v25;

  v77[0] = &unk_1E6C9D5E8;
  v77[1] = &unk_1E6C9D600;
  v78[0] = &unk_1E6CA2AC8;
  v78[1] = &unk_1E6CA2AD8;
  v77[2] = &unk_1E6C9D618;
  v78[2] = &unk_1E6CA2AE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v26, 5.5);
  qword_1EF172308 = v27;

  v75[0] = &unk_1E6C9D5E8;
  v75[1] = &unk_1E6C9D600;
  v76[0] = &unk_1E6CA2AA8;
  v76[1] = &unk_1E6CA2AF8;
  v75[2] = &unk_1E6C9D618;
  v76[2] = &unk_1E6CA2B08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v28, 66.0);
  qword_1EF172310 = v29;

  if (objc_msgSend(v2, "deviceCategory") == 1 || objc_msgSend(v2, "deviceCategory") == 2)
  {
    objc_msgSend(v2, "screenBounds");
  }
  else
  {
    objc_msgSend(v3, "scaledValue:", 162.0);
    v30 = v31;
  }
  qword_1EF172318 = v30;
  v73[0] = &unk_1E6C9D5E8;
  v73[1] = &unk_1E6C9D618;
  v74[0] = &unk_1E6CA2A58;
  v74[1] = &unk_1E6CA2B18;
  v73[2] = &unk_1E6C9D648;
  v73[3] = &unk_1E6C9D660;
  v74[2] = &unk_1E6CA2B18;
  v74[3] = &unk_1E6CA2A68;
  v73[4] = &unk_1E6C9D678;
  v73[5] = &unk_1E6C9D690;
  v74[4] = &unk_1E6CA2A68;
  v74[5] = &unk_1E6CA2B18;
  v73[6] = &unk_1E6C9D6A8;
  v74[6] = &unk_1E6CA2A68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v32, 22.0);
  qword_1EF172320 = v33;

  v71[0] = &unk_1E6C9D5E8;
  v71[1] = &unk_1E6C9D618;
  v72[0] = &unk_1E6CA2A58;
  v72[1] = &unk_1E6CA2A68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v34, 22.0);
  qword_1EF1722F8 = v35;

  v69[0] = &unk_1E6C9D5E8;
  v69[1] = &unk_1E6C9D600;
  v70[0] = &unk_1E6C9D6C0;
  v70[1] = &unk_1E6C9D6C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constantValue:withOverrides:", v36, 6.0);
  qword_1EF172378 = v37;

  v67[0] = &unk_1E6C9D5E8;
  v67[1] = &unk_1E6C9D618;
  v68[0] = &unk_1E6CA2B28;
  v68[1] = &unk_1E6CA2B38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v38, 10.0);
  qword_1EF172328 = v39;

  v65[0] = &unk_1E6C9D5E8;
  v65[1] = &unk_1E6C9D600;
  v66[0] = &unk_1E6CA2B48;
  v66[1] = &unk_1E6CA2B48;
  v65[2] = &unk_1E6C9D618;
  v65[3] = &unk_1E6C9D648;
  v66[2] = &unk_1E6CA2B58;
  v66[3] = &unk_1E6C9D6D8;
  v65[4] = &unk_1E6C9D660;
  v65[5] = &unk_1E6C9D678;
  v66[4] = &unk_1E6CA2B68;
  v66[5] = &unk_1E6CA2B78;
  v65[6] = &unk_1E6C9D690;
  v65[7] = &unk_1E6C9D6A8;
  v66[6] = &unk_1E6CA2AC8;
  v66[7] = &unk_1E6CA2B78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v40, 12.0);
  qword_1EF172380 = v41;

  v63[0] = &unk_1E6C9D630;
  v63[1] = &unk_1E6C9D618;
  v64[0] = &unk_1E6CA2B88;
  v64[1] = &unk_1E6CA2B98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constantValue:withOverrides:", v42, 0.0);
  qword_1EF172388 = v43;

  v61[0] = &unk_1E6C9D5E8;
  v61[1] = &unk_1E6C9D600;
  v62[0] = &unk_1E6CA2BA8;
  v62[1] = &unk_1E6CA2BA8;
  v61[2] = &unk_1E6C9D618;
  v62[2] = &unk_1E6CA2BB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v44, -5.5);
  v46 = v45;

  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 0, 1.0, 2.0);
  v48 = v47;
  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 0, 1.0, 0.5);
  qword_1EF172290 = v48;
  *(_QWORD *)algn_1EF172298 = v46;
  qword_1EF1722A0 = v49;
  unk_1EF1722A8 = v46;
  switch(objc_msgSend(v2, "sizeClass"))
  {
    case 0:
      xmmword_1EF172330 = xmmword_1B755D430;
      unk_1EF172340 = xmmword_1B755D440;
      _Q0 = xmmword_1B755D460;
      goto LABEL_14;
    case 1:
      xmmword_1EF172330 = xmmword_1B755D430;
      unk_1EF172340 = xmmword_1B755D440;
      __asm { FMOV            V0.2D, #7.0 }
LABEL_14:
      v60 = xmmword_1B755D450;
      goto LABEL_16;
    case 2:
      xmmword_1EF172330 = (__int128)vdupq_n_s64(0x3FE8C7E28240B780uLL);
      unk_1EF172340 = vdupq_n_s64(0x3FEC28F5C28F5C29uLL);
      _Q0 = xmmword_1B755D410;
      v60 = xmmword_1B755D420;
LABEL_16:
      xmmword_1EF172350 = _Q0;
      xmmword_1EF172360 = v60;
      goto LABEL_17;
    case 3:
      v51 = xmmword_1B755D3F0;
      xmmword_1EF172330 = (__int128)vdupq_n_s64(0x3FE8C7E28240B780uLL);
      unk_1EF172340 = vdupq_n_s64(0x3FEC28F5C28F5C29uLL);
      v53 = xmmword_1B755D400;
      goto LABEL_9;
    case 4:
    case 7:
      v50 = vdupq_n_s64(0x3FE7AACD9E83E425uLL);
      v51 = xmmword_1B755D3D0;
      v52 = 0x3FEB851EB851EB85;
      goto LABEL_8;
    case 5:
    case 6:
    case 8:
      v50 = vdupq_n_s64(0x3FE8C7E28240B780uLL);
      v51 = xmmword_1B755D3D0;
      v52 = 0x3FEC28F5C28F5C29;
LABEL_8:
      xmmword_1EF172330 = (__int128)v50;
      unk_1EF172340 = vdupq_n_s64(v52);
      v53 = xmmword_1B755D3E0;
LABEL_9:
      xmmword_1EF172360 = v51;
      break;
    default:
      __asm { FMOV            V0.2D, #1.0 }
      xmmword_1EF172330 = _Q0;
      unk_1EF172340 = _Q0;
      v53 = 0uLL;
      xmmword_1EF172360 = 0u;
      break;
  }
  xmmword_1EF172350 = v53;
LABEL_17:

}

void ___LayoutConstants_block_invoke_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = &unk_1E6C9D7E0;
  v23[1] = &unk_1E6C9D7F8;
  v24[0] = &unk_1E6CA2C58;
  v24[1] = &unk_1E6CA2C68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 16.5);
  _LayoutConstants_constants_0 = v4;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 13.5, 12.0);
  _LayoutConstants_constants_1 = v5;
  v21[0] = &unk_1E6C9D7E0;
  v21[1] = &unk_1E6C9D7F8;
  v22[0] = &unk_1E6CA2C78;
  v22[1] = &unk_1E6CA2C88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 19.5);
  _LayoutConstants_constants_2 = v7;

  v19[0] = &unk_1E6C9D7E0;
  v19[1] = &unk_1E6C9D810;
  v20[0] = &unk_1E6CA2C98;
  v20[1] = &unk_1E6CA2C98;
  v19[2] = &unk_1E6C9D828;
  v20[2] = &unk_1E6CA2C98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v8, 2.0);
  _LayoutConstants_constants_3 = v9;

  v17[0] = &unk_1E6C9D7E0;
  v17[1] = &unk_1E6C9D7F8;
  v18[0] = &unk_1E6CA2CA8;
  v18[1] = &unk_1E6CA2CB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v10, 4.5);
  _LayoutConstants_constants_4 = v11;

  _LayoutConstants_constants_5 = 0x4020000000000000;
  v15[0] = &unk_1E6C9D7E0;
  v15[1] = &unk_1E6C9D7F8;
  v16[0] = &unk_1E6CA2CC8;
  v16[1] = &unk_1E6CA2CD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v12, 17.0);
  v14 = v13;

  _LayoutConstants_constants_6 = v14;
  _LayoutConstants_constants_7 = v14;

}

void ___LayoutConstants_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:", 11.0);
  _LayoutConstants_constants_4_0 = v3;
  objc_msgSend(v2, "scaledValue:", 9.0);
  _LayoutConstants_constants_6_0 = v4;
  v31[0] = &unk_1E6C9D8E8;
  v31[1] = &unk_1E6C9D900;
  v32[0] = &unk_1E6CA2CE8;
  v32[1] = &unk_1E6CA2CE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 4.0);
  _LayoutConstants_constants_7_0 = v6;

  v29[0] = &unk_1E6C9D8E8;
  v29[1] = &unk_1E6C9D900;
  v30[0] = &unk_1E6CA2CF8;
  v30[1] = &unk_1E6CA2D08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 19.5);
  _LayoutConstants_constants_0_0 = v8;

  v27[0] = &unk_1E6C9D8E8;
  v27[1] = &unk_1E6C9D900;
  v28[0] = &unk_1E6CA2D18;
  v28[1] = &unk_1E6CA2D28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 19.5);
  _LayoutConstants_constants_1_0 = v10;

  v25[0] = &unk_1E6C9D8E8;
  v25[1] = &unk_1E6C9D900;
  v26[0] = &unk_1E6CA2D18;
  v26[1] = &unk_1E6CA2D28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v11, 19.5);

  v23[0] = &unk_1E6C9D8E8;
  v23[1] = &unk_1E6C9D900;
  v24[0] = &unk_1E6CA2D38;
  v24[1] = &unk_1E6CA2D48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v12, 16.5);
  _LayoutConstants_constants_2_0 = v13;

  v21[0] = &unk_1E6C9D8E8;
  v21[1] = &unk_1E6C9D900;
  v22[0] = &unk_1E6CA2D58;
  v22[1] = &unk_1E6CA2D68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 7.5);
  _LayoutConstants_constants_3_0 = v15;

  v19[0] = &unk_1E6C9D8E8;
  v19[1] = &unk_1E6C9D918;
  v20[0] = &unk_1E6CA2D78;
  v20[1] = &unk_1E6CA2D78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v16, 8.5);
  v18 = v17;

  _LayoutConstants_constants_9 = v18;
  _LayoutConstants_constants_11 = v18;

}

void ___LayoutConstants_block_invoke_3(uint64_t a1, uint64_t a2)
{
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
  id v13;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (CLKLanguageIsTallScript())
    objc_msgSend(v13, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 13.5);
  else
    objc_msgSend(v13, "scaledValue:", 15.0);
  *(_QWORD *)&_LayoutConstants_constants_0 = v2;
  objc_msgSend(v13, "scaledValue:", 10.5);
  *((_QWORD *)&_LayoutConstants_constants_0 + 1) = v3;
  objc_msgSend(v13, "scaledValue:", 9.5);
  qword_1EF172590 = v4;
  objc_msgSend(v13, "scaledValue:withOverride:forSizeClass:", 3, 22.5, 25.5);
  qword_1EF172598 = v5;
  objc_msgSend(v13, "scaledValue:", 9.5);
  *(_QWORD *)&xmmword_1EF1725A0 = v6;
  objc_msgSend(v13, "scaledValue:withOverride:forSizeClass:", 3, 33.5, 38.0);
  *((_QWORD *)&xmmword_1EF1725A0 + 1) = v7;
  objc_msgSend(v13, "scaledValue:", 9.5);
  qword_1EF1725B0 = v8;
  objc_msgSend(v13, "scaledValue:withOverride:forSizeClass:", 3, 3.5, 4.0);
  qword_1EF1725B8 = v9;
  objc_msgSend(v13, "scaledValue:withOverride:forSizeClass:", 3, 2.0, 2.5);
  *(_QWORD *)&xmmword_1EF1725C0 = v10;
  objc_msgSend(v13, "scaledValue:withOverride:forSizeClass:", 3, 133.5, 151.0);
  *((_QWORD *)&xmmword_1EF1725C0 + 1) = v11;
  objc_msgSend(v13, "scaledValue:withOverride:forSizeClass:", 3, 50.0, 57.0);
  qword_1EF1725D0 = v12;

}

void ___LayoutConstants_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:", 3.0);
  _LayoutConstants___constants_0_0 = v2;

}

void ___LayoutConstants_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
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
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v74;
  void *v75;
  void *v77;
  void *v79;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[7];
  _QWORD v99[7];
  _QWORD v100[6];
  _QWORD v101[6];
  _QWORD v102[7];
  _QWORD v103[7];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[6];
  _QWORD v107[6];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[5];
  _QWORD v113[5];
  _QWORD v114[8];
  _QWORD v115[8];
  _QWORD v116[8];
  _QWORD v117[8];
  _QWORD v118[7];
  _QWORD v119[7];
  _QWORD v120[8];
  _QWORD v121[8];
  _QWORD v122[6];
  _QWORD v123[6];
  _QWORD v124[5];
  _QWORD v125[5];
  _QWORD v126[3];
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[4];
  _QWORD v135[4];
  _QWORD v136[3];
  _QWORD v137[3];
  _QWORD v138[3];
  _QWORD v139[5];

  v139[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants___constants = xmmword_1B755D620;
  qword_1EF172630 = 0;
  qword_1EF172688 = 0x4008000000000000;
  v138[0] = &unk_1E6C9DA68;
  v138[1] = &unk_1E6C9D9C0;
  v139[0] = &unk_1E6CA2D88;
  v139[1] = &unk_1E6CA2D98;
  v138[2] = &unk_1E6C9DA80;
  v139[2] = &unk_1E6CA2DA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v138, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 73.0);
  qword_1EF172638 = v6;

  v136[0] = &unk_1E6C9DA68;
  v136[1] = &unk_1E6C9D9C0;
  v137[0] = &unk_1E6CA2DB8;
  v137[1] = &unk_1E6CA2DC8;
  v136[2] = &unk_1E6C9DA80;
  v137[2] = &unk_1E6CA2DD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 151.0);
  qword_1EF172640 = v8;

  v134[0] = &unk_1E6C9DA68;
  v134[1] = &unk_1E6C9D9C0;
  v135[0] = &unk_1E6CA2DE8;
  v135[1] = &unk_1E6CA2DE8;
  v134[2] = &unk_1E6C9D9F0;
  v134[3] = &unk_1E6C9DA80;
  v135[2] = &unk_1E6CA2DF8;
  v135[3] = &unk_1E6CA2DF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, v134, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v9, 2.0);
  qword_1EF172648 = v10;

  v132[0] = &unk_1E6C9DA80;
  v132[1] = &unk_1E6C9DA98;
  v133[0] = &unk_1E6CA2DF8;
  v133[1] = &unk_1E6CA2DE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v11, 2.0);
  qword_1EF172650 = v12;

  v130[0] = &unk_1E6C9D9F0;
  v130[1] = &unk_1E6C9DA80;
  v131[0] = &unk_1E6CA2E08;
  v131[1] = &unk_1E6CA2E18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, v130, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v13, 0.0);
  qword_1EF172658 = v14;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 2.0, 2.0);
  qword_1EF172660 = v15;
  objc_msgSend(v3, "screenBounds");
  v17 = v16 * 0.5;
  objc_msgSend(v4, "scaledValue:", 83.0);
  *(double *)&qword_1EF172658 = v17 - v18;
  objc_msgSend(v3, "screenBounds");
  v20 = v19;

  objc_msgSend(v4, "scaledValue:", 96.5);
  *(double *)&qword_1EF172660 = v20 * 0.5 - v21;
  objc_msgSend(v4, "scaledValue:", 12.5);
  qword_1EF172670 = v22;
  objc_msgSend(v4, "scaledValue:", 5.0);
  qword_1EF172678 = v23;
  v128[0] = &unk_1E6C9DA68;
  v128[1] = &unk_1E6C9D9C0;
  v129[0] = &unk_1E6CA2DE8;
  v129[1] = &unk_1E6CA2DE8;
  v128[2] = &unk_1E6C9DA80;
  v129[2] = &unk_1E6CA2E28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v24, 157.0);
  qword_1EF172668 = v25;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 10.0, 14.0);
  qword_1EF172680 = v26;
  v126[0] = &unk_1E6C9DA68;
  v126[1] = &unk_1E6C9D9C0;
  v127[0] = &unk_1E6CA2E38;
  v127[1] = &unk_1E6CA2E48;
  v126[2] = &unk_1E6C9DA80;
  v127[2] = &unk_1E6CA2E58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v27, 150.0);
  qword_1EF1726B0 = v28;

  v124[0] = &unk_1E6C9DA20;
  v124[1] = &unk_1E6C9DAB0;
  v125[0] = &unk_1E6CA2E68;
  v125[1] = &unk_1E6CA2E78;
  v124[2] = &unk_1E6C9DA98;
  v124[3] = &unk_1E6C9DAC8;
  v125[2] = &unk_1E6CA2E88;
  v125[3] = &unk_1E6CA2E98;
  v124[4] = &unk_1E6C9DA50;
  v125[4] = &unk_1E6CA2EA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v29, 1.5);
  qword_1EF1726C8 = v30;

  qword_1EF1726D0 = 0x400C000000000000;
  v123[0] = &unk_1E6CA2EB8;
  v123[1] = &unk_1E6CA2EC8;
  v122[0] = &unk_1E6C9DA68;
  v122[1] = &unk_1E6C9D9C0;
  v123[2] = &unk_1E6CA2ED8;
  v123[3] = &unk_1E6CA2EE8;
  v122[2] = &unk_1E6C9DA80;
  v122[3] = &unk_1E6C9DA20;
  v122[4] = &unk_1E6C9DAB0;
  v122[5] = &unk_1E6C9DA98;
  v123[4] = &unk_1E6CA2EF8;
  v123[5] = &unk_1E6CA2EF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v31, 16.5);
  qword_1EF172690 = v32;

  v121[0] = &unk_1E6CA2F08;
  v121[1] = &unk_1E6CA2F18;
  v120[0] = &unk_1E6C9DA68;
  v120[1] = &unk_1E6C9D9C0;
  v121[2] = &unk_1E6CA2F28;
  v121[3] = &unk_1E6CA2F38;
  v120[2] = &unk_1E6C9DA80;
  v120[3] = &unk_1E6C9DA20;
  v121[4] = &unk_1E6CA2F48;
  v121[5] = &unk_1E6CA2F48;
  v120[4] = &unk_1E6C9DAB0;
  v120[5] = &unk_1E6C9DA98;
  v120[6] = &unk_1E6C9DAC8;
  v120[7] = &unk_1E6C9DA50;
  v121[6] = &unk_1E6CA2F58;
  v121[7] = &unk_1E6CA2DA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v33, 65.5);
  qword_1EF172698 = v34;

  v118[0] = &unk_1E6C9DA68;
  v118[1] = &unk_1E6C9D9C0;
  v119[0] = &unk_1E6CA2F68;
  v119[1] = &unk_1E6CA2F78;
  v119[2] = &unk_1E6CA2F88;
  v118[2] = &unk_1E6C9DA80;
  v118[3] = &unk_1E6C9DA20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -73.5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v119[3] = v35;
  v118[4] = &unk_1E6C9DAB0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -85.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v119[4] = v36;
  v118[5] = &unk_1E6C9DA98;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -85.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v119[5] = v37;
  v118[6] = &unk_1E6C9DAC8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -86.5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v119[6] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v39, -64.5);
  qword_1EF1726A0 = v40;

  v116[0] = &unk_1E6C9DA68;
  v116[1] = &unk_1E6C9D9C0;
  v117[0] = &unk_1E6CA2F98;
  v117[1] = &unk_1E6CA2F98;
  v117[2] = &unk_1E6CA2FA8;
  v116[2] = &unk_1E6C9DA80;
  v116[3] = &unk_1E6C9DA20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -17.5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v117[3] = v41;
  v116[4] = &unk_1E6C9DAB0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -23.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v117[4] = v42;
  v116[5] = &unk_1E6C9DA98;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -23.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v117[5] = v43;
  v116[6] = &unk_1E6C9DAC8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -25.5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v117[6] = v44;
  v116[7] = &unk_1E6C9DA50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -18.5);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v117[7] = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v46, -15.5);
  qword_1EF1726A8 = v47;

  v114[0] = &unk_1E6C9DA68;
  v114[1] = &unk_1E6C9D9C0;
  v115[0] = &unk_1E6CA2DE8;
  v115[1] = &unk_1E6CA2DE8;
  v115[2] = &unk_1E6CA2FA8;
  v114[2] = &unk_1E6C9DA80;
  v114[3] = &unk_1E6C9DA20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -17.5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v48;
  v114[4] = &unk_1E6C9DAB0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -23.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v115[4] = v49;
  v114[5] = &unk_1E6C9DA98;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -23.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v50;
  v114[6] = &unk_1E6C9DAC8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -22.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v51;
  v114[7] = &unk_1E6C9DA50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&qword_1EF1726D0 + -19.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v115[7] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 8);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v53, -15.5);
  qword_1EF1726C0 = v54;

  v112[0] = &unk_1E6C9DA68;
  v112[1] = &unk_1E6C9DA80;
  v113[0] = &unk_1E6CA2E78;
  v113[1] = &unk_1E6CA2FB8;
  v112[2] = &unk_1E6C9DA20;
  v112[3] = &unk_1E6C9DAB0;
  v113[2] = &unk_1E6CA2FC8;
  v113[3] = &unk_1E6CA2FD8;
  v112[4] = &unk_1E6C9DA98;
  v113[4] = &unk_1E6CA2FD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 5);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v55, 11.0);
  qword_1EF1726B8 = v56;

  v110[0] = &unk_1E6C9DA68;
  v110[1] = &unk_1E6C9D9C0;
  v111[0] = &unk_1E6CA2DE8;
  v111[1] = &unk_1E6CA2DE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v57, 12.5);
  qword_1EF1726E8 = v58;

  v108[0] = &unk_1E6C9DA68;
  v108[1] = &unk_1E6C9D9C0;
  v109[0] = &unk_1E6CA2DE8;
  v109[1] = &unk_1E6CA2DE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v59, 2.0);
  qword_1EF1726D8 = v60;

  v106[0] = &unk_1E6C9DA68;
  v106[1] = &unk_1E6C9D9C0;
  v107[0] = &unk_1E6CA2DE8;
  v107[1] = &unk_1E6CA2DE8;
  v107[2] = &unk_1E6CA2FE8;
  v107[3] = &unk_1E6CA2FF8;
  v106[2] = &unk_1E6C9DA80;
  v106[3] = &unk_1E6C9DA20;
  v106[4] = &unk_1E6C9DAB0;
  v106[5] = &unk_1E6C9DA98;
  v107[4] = &unk_1E6CA3008;
  v107[5] = &unk_1E6CA3008;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v61, 3.0);
  qword_1EF1726E0 = v62;

  v104[0] = &unk_1E6C9DA68;
  v104[1] = &unk_1E6C9D9C0;
  v105[0] = &unk_1E6CA2DE8;
  v105[1] = &unk_1E6CA2DE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v63, 37.5);
  qword_1EF1726F0 = v64;

  v102[0] = &unk_1E6C9DA68;
  v102[1] = &unk_1E6C9D9C0;
  v103[0] = &unk_1E6CA2DE8;
  v103[1] = &unk_1E6CA2DE8;
  v102[2] = &unk_1E6C9DA20;
  v102[3] = &unk_1E6C9DAB0;
  v103[2] = &unk_1E6CA3018;
  v103[3] = &unk_1E6CA3028;
  v102[4] = &unk_1E6C9DA98;
  v102[5] = &unk_1E6C9DAC8;
  v103[4] = &unk_1E6CA3028;
  v103[5] = &unk_1E6CA2E98;
  v102[6] = &unk_1E6C9DA50;
  v103[6] = &unk_1E6CA3038;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 7);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v65, 1.0);
  qword_1EF1726F8 = v66;

  v100[0] = &unk_1E6C9DA68;
  v100[1] = &unk_1E6C9D9C0;
  v101[0] = &unk_1E6CA2FE8;
  v101[1] = &unk_1E6CA2FE8;
  v100[2] = &unk_1E6C9DA80;
  v100[3] = &unk_1E6C9DA20;
  v101[2] = &unk_1E6CA3048;
  v101[3] = &unk_1E6CA3048;
  v100[4] = &unk_1E6C9DAB0;
  v100[5] = &unk_1E6C9DA98;
  v101[4] = &unk_1E6CA3048;
  v101[5] = &unk_1E6CA3048;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 6);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v67, 10.0);
  qword_1EF172700 = v68;

  v98[0] = &unk_1E6C9DA68;
  __asm { FMOV            V0.2D, #1.5 }
  v89 = _Q0;
  v97 = _Q0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v97, "{CGSize=dd}");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v74;
  v98[1] = &unk_1E6C9D9C0;
  v96 = v89;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v96, "{CGSize=dd}");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v75;
  v98[2] = &unk_1E6C9D9F0;
  __asm { FMOV            V0.2D, #11.5 }
  v95 = _Q0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v95, "{CGSize=dd}");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v77;
  v98[3] = &unk_1E6C9DA80;
  __asm { FMOV            V0.2D, #16.0 }
  v94 = _Q0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v94, "{CGSize=dd}");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v79;
  v98[4] = &unk_1E6C9DA20;
  __asm { FMOV            V0.2D, #15.0 }
  v93 = _Q0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v93, "{CGSize=dd}");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v81;
  v98[5] = &unk_1E6C9DAB0;
  __asm { FMOV            V0.2D, #17.0 }
  v90 = _Q0;
  v92 = _Q0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v92, "{CGSize=dd}");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v99[5] = v83;
  v98[6] = &unk_1E6C9DA98;
  v91 = v90;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v91, "{CGSize=dd}");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v99[6] = v84;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 7);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantSize:withOverrides:", v85, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  qword_1EF172708 = v86;
  unk_1EF172710 = v87;

  __asm { FMOV            V0.2D, #-2.0 }
  unk_1EF172718 = _Q0;

}

void ___LayoutConstants_block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[7];
  _QWORD v39[7];
  _QWORD v40[8];
  _QWORD v41[8];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 120.0, 103.0);
  *(_QWORD *)&_LayoutConstants___constants_0 = v3;
  v42[0] = &unk_1E6C9DC48;
  v42[1] = &unk_1E6C9DC60;
  v43[0] = &unk_1E6CA3118;
  v43[1] = &unk_1E6CA3128;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v4, 116.0);
  *((_QWORD *)&_LayoutConstants___constants_0 + 1) = v5;

  v40[0] = &unk_1E6C9DC48;
  v40[1] = &unk_1E6C9DC78;
  v41[0] = &unk_1E6CA3138;
  v41[1] = &unk_1E6CA3148;
  v40[2] = &unk_1E6C9DC60;
  v40[3] = &unk_1E6C9DC90;
  v41[2] = &unk_1E6CA3158;
  v41[3] = &unk_1E6CA3158;
  v40[4] = &unk_1E6C9DCA8;
  v40[5] = &unk_1E6C9DCC0;
  v41[4] = &unk_1E6CA3168;
  v41[5] = &unk_1E6CA3178;
  v40[6] = &unk_1E6C9DCD8;
  v40[7] = &unk_1E6C9DCF0;
  v41[6] = &unk_1E6CA3158;
  v41[7] = &unk_1E6CA3188;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 4.0);
  qword_1EF172800 = v7;

  v38[0] = &unk_1E6C9DC48;
  v38[1] = &unk_1E6C9DC60;
  v39[0] = &unk_1E6CA3198;
  v39[1] = &unk_1E6CA3058;
  v38[2] = &unk_1E6C9DC90;
  v38[3] = &unk_1E6C9DCA8;
  v39[2] = &unk_1E6CA31A8;
  v39[3] = &unk_1E6CA3058;
  v38[4] = &unk_1E6C9DCC0;
  v38[5] = &unk_1E6C9DCD8;
  v39[4] = &unk_1E6CA31B8;
  v39[5] = &unk_1E6CA31C8;
  v38[6] = &unk_1E6C9DCF0;
  v39[6] = &unk_1E6CA31C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v8, -1.5);
  qword_1EF172808 = v9;

  v36[0] = &unk_1E6C9DC48;
  v36[1] = &unk_1E6C9DC60;
  v37[0] = &unk_1E6CA31D8;
  v37[1] = &unk_1E6CA31E8;
  v36[2] = &unk_1E6C9DCA8;
  v36[3] = &unk_1E6C9DCC0;
  v37[2] = &unk_1E6CA31E8;
  v37[3] = &unk_1E6CA31F8;
  v36[4] = &unk_1E6C9DCD8;
  v36[5] = &unk_1E6C9DCF0;
  v37[4] = &unk_1E6CA3198;
  v37[5] = &unk_1E6CA31E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v10, -4.0);
  *(_QWORD *)&xmmword_1EF172810 = v11;

  v34[0] = &unk_1E6C9DC48;
  v34[1] = &unk_1E6C9DC78;
  v35[0] = &unk_1E6CA3158;
  v35[1] = &unk_1E6CA3208;
  v34[2] = &unk_1E6C9DC60;
  v35[2] = &unk_1E6CA3148;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v12, 5.5);
  *((_QWORD *)&xmmword_1EF172810 + 1) = v13;

  v32[0] = &unk_1E6C9DC48;
  v32[1] = &unk_1E6C9DC78;
  v33[0] = &unk_1E6CA3158;
  v33[1] = &unk_1E6CA3208;
  v32[2] = &unk_1E6C9DC60;
  v33[2] = &unk_1E6CA3148;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 0.5);
  qword_1EF172820 = v15;

  v30[0] = &unk_1E6C9DC48;
  v30[1] = &unk_1E6C9DC78;
  v31[0] = &unk_1E6CA3218;
  v31[1] = &unk_1E6CA3228;
  v30[2] = &unk_1E6C9DC60;
  v31[2] = &unk_1E6CA3238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v16, 0.0);
  qword_1EF172828 = v17;

  v28[0] = &unk_1E6C9DC48;
  v28[1] = &unk_1E6C9DC78;
  v29[0] = &unk_1E6CA3248;
  v29[1] = &unk_1E6CA31D8;
  v28[2] = &unk_1E6C9DC60;
  v29[2] = &unk_1E6CA31F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v18, -5.5);
  *(_QWORD *)&xmmword_1EF172830 = v19;

  v26[0] = &unk_1E6C9DC48;
  v26[1] = &unk_1E6C9DC60;
  v27[0] = &unk_1E6CA3158;
  v27[1] = &unk_1E6CA31C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v20, 5.0);
  *((_QWORD *)&xmmword_1EF172830 + 1) = v21;

  v24[0] = &unk_1E6C9DC48;
  v24[1] = &unk_1E6C9DC78;
  v25[0] = &unk_1E6CA3158;
  v25[1] = &unk_1E6CA31C8;
  v24[2] = &unk_1E6C9DC60;
  v25[2] = &unk_1E6CA3258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v22, 1.0);
  qword_1EF172840 = v23;

}

void ___LayoutConstants_block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_1E6C9DE58;
  v5[1] = &unk_1E6C9DEA0;
  v6[0] = &unk_1E6CA3278;
  v6[1] = &unk_1E6CA3288;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 21.0);
  _LayoutConstants___constants_0_1 = v4;

}

void ___LayoutConstants_block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_0_2 = v3;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_1_0 = v4;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_2_0 = v5;
  CLKValueForLuxoDeviceMetrics();
  v7 = v6;

  _LayoutConstants___constants_3_0 = v7;
}

void ___LayoutConstants_block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = &unk_1E6C9DEB8;
  v30[1] = &unk_1E6C9DED0;
  v31[0] = &unk_1E6CA3298;
  v31[1] = &unk_1E6CA32A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 56.0);
  *(_QWORD *)&_LayoutConstants___constants_1 = v4;

  v28[0] = &unk_1E6C9DEB8;
  v28[1] = &unk_1E6C9DED0;
  v29[0] = &unk_1E6CA32B8;
  v29[1] = &unk_1E6CA32C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 15.0);
  *((_QWORD *)&_LayoutConstants___constants_1 + 1) = v6;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 3.0, 4.0);
  qword_1EF172968 = v7;
  v8 = *(double *)&_LayoutConstants___constants_1;
  v26[0] = &unk_1E6C9DEB8;
  v26[1] = &unk_1E6C9DED0;
  v27[0] = &unk_1E6CA32D8;
  v27[1] = &unk_1E6CA32E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 48.5);
  *(double *)&qword_1EF172970 = v8 + v10;

  v24[0] = &unk_1E6C9DEB8;
  v24[1] = &unk_1E6C9DED0;
  v25[0] = &unk_1E6CA32F8;
  v25[1] = &unk_1E6CA3308;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v11, 16.0);
  *(_QWORD *)&xmmword_1EF172978 = v12;

  *((double *)&xmmword_1EF172978 + 1) = *(double *)&xmmword_1EF172978 + -3.0;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 4.0, 3.0);
  qword_1EF172988 = v13;
  v22[0] = &unk_1E6C9DEB8;
  v22[1] = &unk_1E6C9DED0;
  v23[0] = &unk_1E6CA3318;
  v23[1] = &unk_1E6CA3328;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 53.0);
  qword_1EF1729B8 = v15;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 2.5, 2.0);
  qword_1EF172990 = v16;
  v20[0] = &unk_1E6C9DEB8;
  v20[1] = &unk_1E6C9DED0;
  v21[0] = &unk_1E6CA3338;
  v21[1] = &unk_1E6CA32C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v17, 16.0);
  *(_QWORD *)&xmmword_1EF172998 = v18;

  *((_QWORD *)&xmmword_1EF172998 + 1) = 0x4008000000000000;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 188.0, 213.0);
  qword_1EF1729A8 = v19;
  qword_1EF1729B0 = 0x4049000000000000;

}

void ___LayoutConstants_block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaledValue:", 4.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular = v4;
  objc_msgSend(v9, "scaledValue:", 29.0);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular + 1) = v5;
  objc_msgSend(v9, "scaledValue:", 18.0);
  qword_1EF1729F0 = v6;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v8 = v7;

  _LayoutConstants___constantsGraphicExtraLarge = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular, v8);
  *(double *)&qword_1EF172A10 = v8 * *(double *)&qword_1EF1729F0;

}

void ___LayoutConstants_block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 19.5);
  _LayoutConstants___constants_0_3 = v2;
  objc_msgSend(v5, "scaledValue:", 16.0);
  _LayoutConstants___constants_1_1 = v3;
  objc_msgSend(v5, "scaledValue:", 16.0);
  _LayoutConstants___constants_2_1 = v4;

}

void ___LayoutConstants_block_invoke_12(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = &unk_1E6C9E0E0;
  v13[1] = &unk_1E6C9E110;
  v14[0] = &unk_1E6C9E0F8;
  v14[1] = &unk_1E6C9E0F8;
  v13[2] = &unk_1E6C9E128;
  v13[3] = &unk_1E6C9E140;
  v14[2] = &unk_1E6C9E0F8;
  v14[3] = &unk_1E6C9E0F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constantValue:withOverrides:", v3, 0.0);
  _LayoutConstants_constants_0_1 = v4;

  v11[0] = &unk_1E6C9E0E0;
  v11[1] = &unk_1E6C9E110;
  v12[0] = &unk_1E6C9E158;
  v12[1] = &unk_1E6C9E158;
  v11[2] = &unk_1E6C9E128;
  v11[3] = &unk_1E6C9E140;
  v12[2] = &unk_1E6C9E158;
  v12[3] = &unk_1E6C9E158;
  v11[4] = &unk_1E6C9E170;
  v12[4] = &unk_1E6CA4378;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 17.0);
  _LayoutConstants_constants_1_1 = v6;

  v9[0] = &unk_1E6C9E0E0;
  v9[1] = &unk_1E6C9E110;
  v10[0] = &unk_1E6CA4388;
  v10[1] = &unk_1E6CA4398;
  v9[2] = &unk_1E6C9E128;
  v9[3] = &unk_1E6C9E140;
  v10[2] = &unk_1E6CA4398;
  v10[3] = &unk_1E6CA4398;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 45.5);
  _LayoutConstants_constants_2_1 = v8;

}

void ___LayoutConstants_block_invoke_13(uint64_t a1, uint64_t a2)
{
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
  id v30;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setScale:forSizeClass:", 3, 1.13580247);
  *(_QWORD *)&_LayoutConstants__constants = 0x401C000000000000;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 105.0, 120.0);
  *((_QWORD *)&_LayoutConstants__constants + 1) = v2;
  objc_msgSend(v30, "scaledValue:", 14.5);
  qword_1EF172C10 = v3;
  objc_msgSend(v30, "scaledValue:", 57.0);
  qword_1EF172C18 = v4;
  objc_msgSend(v30, "scaledValue:", 12.5);
  *(_QWORD *)&xmmword_1EF172C20 = v5;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 50.5, 57.0);
  *((_QWORD *)&xmmword_1EF172C20 + 1) = v6;
  objc_msgSend(v30, "scaledValue:", 21.0);
  qword_1EF172C30 = v7;
  objc_msgSend(v30, "scaledValue:", 20.5);
  qword_1EF172C38 = v8;
  objc_msgSend(v30, "scaledValue:", 11.0);
  *(_QWORD *)&xmmword_1EF172C40 = v9;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 37.0, 42.5);
  *((_QWORD *)&xmmword_1EF172C40 + 1) = v10;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 66.0, 75.5);
  qword_1EF172C50 = v11;
  objc_msgSend(v30, "scaledValue:", 76.0);
  qword_1EF172C58 = v12;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 42.0, 46.0);
  *(_QWORD *)&xmmword_1EF172C60 = v13;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 90.0, 99.0);
  *((_QWORD *)&xmmword_1EF172C60 + 1) = v14;
  objc_msgSend(v30, "scaledValue:", 99.0);
  qword_1EF172C70 = v15;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 21.5, 26.5);
  qword_1EF172C78 = v16;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 17.0, 21.0);
  *(_QWORD *)&xmmword_1EF172C80 = v17;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, -15.0, -17.5);
  *((_QWORD *)&xmmword_1EF172C80 + 1) = v18;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 12.5);
  qword_1EF172C90 = v19;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 5.5, 6.5);
  qword_1EF172C98 = v20;
  objc_msgSend(v30, "scaledValue:", -17.0);
  *(_QWORD *)&xmmword_1EF172CA0 = v21;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 32.5, 36.0);
  *((_QWORD *)&xmmword_1EF172CA0 + 1) = v22;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 45.0, 50.0);
  qword_1EF172CB0 = v23;
  objc_msgSend(v30, "scaledValue:", 96.5);
  qword_1EF172CB8 = v24;
  objc_msgSend(v30, "scaledValue:withOverride:forSizeClass:", 3, 45.0, 51.5);
  *(_QWORD *)&xmmword_1EF172CC0 = v25;
  objc_msgSend(v30, "scaledPoint:", 49.5, 51.0);
  *((_QWORD *)&xmmword_1EF172CC0 + 1) = v26;
  unk_1EF172CD0 = v27;
  objc_msgSend(v30, "scaledPoint:", 60.0, 86.5);
  qword_1EF172CD8 = v28;
  *(_QWORD *)&xmmword_1EF172CE0 = v29;
  *((_QWORD *)&xmmword_1EF172CE0 + 1) = 0xC01C000000000000;

}

void ___LayoutConstants_block_invoke_14(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
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
  uint64_t v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[8];
  _QWORD v25[8];
  _QWORD v26[6];
  _QWORD v27[8];

  v27[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = &unk_1E6C9E3E0;
  v26[1] = &unk_1E6C9E3F8;
  v27[0] = &unk_1E6CA43A8;
  v27[1] = &unk_1E6CA43B8;
  v26[2] = &unk_1E6C9E410;
  v26[3] = &unk_1E6C9E428;
  v27[2] = &unk_1E6CA43C8;
  v27[3] = &unk_1E6CA43C8;
  v26[4] = &unk_1E6C9E440;
  v26[5] = &unk_1E6C9E458;
  v27[4] = &unk_1E6CA43D8;
  v27[5] = &unk_1E6CA43C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 41.5);
  qword_1EF172DD8 = v4;

  v24[0] = &unk_1E6C9E3E0;
  v24[1] = &unk_1E6C9E470;
  v25[0] = &unk_1E6CA43E8;
  v25[1] = &unk_1E6CA43F8;
  v24[2] = &unk_1E6C9E488;
  v24[3] = &unk_1E6C9E3F8;
  v25[2] = &unk_1E6CA4408;
  v25[3] = &unk_1E6CA4418;
  v24[4] = &unk_1E6C9E410;
  v24[5] = &unk_1E6C9E428;
  v25[4] = &unk_1E6CA4428;
  v25[5] = &unk_1E6CA4428;
  v24[6] = &unk_1E6C9E440;
  v24[7] = &unk_1E6C9E458;
  v25[6] = &unk_1E6CA4438;
  v25[7] = &unk_1E6CA4448;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 63.0);
  *(_QWORD *)&_LayoutConstants___constants_2 = v6;

  v22[0] = &unk_1E6C9E3E0;
  v22[1] = &unk_1E6C9E3F8;
  v23[0] = &unk_1E6CA4458;
  v23[1] = &unk_1E6CA4468;
  v22[2] = &unk_1E6C9E410;
  v22[3] = &unk_1E6C9E428;
  v23[2] = &unk_1E6CA4468;
  v23[3] = &unk_1E6CA4468;
  v22[4] = &unk_1E6C9E440;
  v22[5] = &unk_1E6C9E458;
  v23[4] = &unk_1E6CA4468;
  v23[5] = &unk_1E6CA4468;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 2.0);
  *((_QWORD *)&_LayoutConstants___constants_2 + 1) = v8;

  v21[0] = &unk_1E6CA4478;
  v21[1] = &unk_1E6CA4478;
  v20[0] = &unk_1E6C9E3E0;
  v20[1] = &unk_1E6C9E488;
  v20[2] = &unk_1E6C9E3F8;
  v20[3] = &unk_1E6C9E410;
  v21[2] = &unk_1E6CA4488;
  v21[3] = &unk_1E6CA4498;
  v20[4] = &unk_1E6C9E428;
  v20[5] = &unk_1E6C9E440;
  v21[4] = &unk_1E6CA4498;
  v21[5] = &unk_1E6CA44A8;
  v20[6] = &unk_1E6C9E458;
  v21[6] = &unk_1E6CA44B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 6.0);
  qword_1EF172DF0 = v10;

  v18[0] = &unk_1E6C9E3E0;
  v18[1] = &unk_1E6C9E488;
  v19[0] = &unk_1E6CA44C8;
  v19[1] = &unk_1E6CA44B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v11, 16.0);
  *(_QWORD *)&xmmword_1EF172DE0 = v12;

  v16[0] = &unk_1E6C9E3E0;
  v16[1] = &unk_1E6C9E470;
  v17[0] = &unk_1E6CA4468;
  v17[1] = &unk_1E6CA4468;
  v16[2] = &unk_1E6C9E488;
  v17[2] = &unk_1E6CA44D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v13, 16.0);
  *((_QWORD *)&xmmword_1EF172DE0 + 1) = v14;

  objc_msgSend(v2, "constantValue:withOverride:forSizeClass:", 0, -0.5, -1.0);
  qword_1EF172DD0 = v15;

}

void ___LayoutConstants_block_invoke_15(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = &unk_1E6C9E518;
  v19[1] = &unk_1E6C9E530;
  v20[0] = &unk_1E6CA4558;
  v20[1] = &unk_1E6CA4558;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 2.0);
  *(_QWORD *)&_LayoutConstants___constants_4 = v4;

  *((_QWORD *)&_LayoutConstants___constants_4 + 1) = 120;
  unk_1EF173108 = 0x3FF0000000000000;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 6.0, 7.0);
  qword_1EF173110 = v5;
  *(_QWORD *)&xmmword_1EF173118 = 0x4000000000000000;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 7.0, 8.0);
  *((_QWORD *)&xmmword_1EF173118 + 1) = v6;
  objc_msgSend(v2, "scaledValue:", 1.0);
  qword_1EF173128 = v7;
  qword_1EF173130 = 0x3FE0000000000000;
  v17[0] = &unk_1E6C9E518;
  v17[1] = &unk_1E6C9E530;
  v18[0] = &unk_1E6CA4568;
  v18[1] = &unk_1E6CA4568;
  v17[2] = &unk_1E6C9E548;
  v18[2] = &unk_1E6CA4578;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v8, 1.0);
  *(_QWORD *)&xmmword_1EF173138 = v9;

  *((_QWORD *)&xmmword_1EF173138 + 1) = 12;
  unk_1EF173148 = 0x4010000000000000;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 11.5, 13.0);
  qword_1EF173150 = v10;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 17.0, 19.0);
  *(_QWORD *)&xmmword_1EF173158 = v11;
  objc_msgSend(v2, "scaledValue:", 10.5);
  *((_QWORD *)&xmmword_1EF173158 + 1) = v12;
  xmmword_1EF173168 = xmmword_1B755E170;
  v15[0] = &unk_1E6C9E518;
  v15[1] = &unk_1E6C9E530;
  v16[0] = &unk_1E6CA4568;
  v16[1] = &unk_1E6CA4568;
  v15[2] = &unk_1E6C9E548;
  v16[2] = &unk_1E6CA4588;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v13, 1.0);
  qword_1EF173178 = v14;

}

void ___LayoutConstants_block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 3, -62.0, -69.0);
  _LayoutConstants__constants_0_0 = v2;

}

void ___LayoutConstants_block_invoke_17(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = &unk_1E6C9E5F0;
  v11[1] = &unk_1E6C9E608;
  v12[0] = &unk_1E6CA45F8;
  v12[1] = &unk_1E6CA4608;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 16.5);
  _LayoutConstants_constants_0_2 = v4;

  objc_msgSend(v2, "scaledValue:", 12.0);
  _LayoutConstants_constants_1_2 = v5;
  v9[0] = &unk_1E6C9E5F0;
  v9[1] = &unk_1E6C9E608;
  v10[0] = &unk_1E6CA4618;
  v10[1] = &unk_1E6CA4628;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 29.0);
  _LayoutConstants_constants_2_2 = v7;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 39.0, 34.0);
  _LayoutConstants_constants_3_1 = v8;
  _LayoutConstants_constants_4_1 = v8;

}

void ___LayoutConstants_block_invoke_18(uint64_t a1, uint64_t a2)
{
  void *v2;
  int IsTallScript;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[8];
  _QWORD v40[8];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsTallScript = CLKLanguageIsTallScript();
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 4.5, 4.5);
  *(_QWORD *)&_LayoutConstants_constants_1 = v4;
  v53[0] = &unk_1E6C9E620;
  v53[1] = &unk_1E6C9E638;
  v54[0] = &unk_1E6CA4638;
  v54[1] = &unk_1E6CA4648;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 19.5);
  *((_QWORD *)&_LayoutConstants_constants_1 + 1) = v6;

  v51[0] = &unk_1E6C9E620;
  v51[1] = &unk_1E6C9E638;
  v52[0] = &unk_1E6CA4658;
  v52[1] = &unk_1E6CA4668;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 15.5);
  v9 = v8;

  v49[0] = &unk_1E6C9E620;
  v49[1] = &unk_1E6C9E638;
  v50[0] = &unk_1E6CA4678;
  v50[1] = &unk_1E6CA4688;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v10, 16.5);
  v12 = v11;

  if (IsTallScript)
    v13 = v9;
  else
    v13 = v12;
  *((_QWORD *)&xmmword_1EF173418 + 1) = v13;
  v47[0] = &unk_1E6C9E620;
  v47[1] = &unk_1E6C9E638;
  v48[0] = &unk_1E6CA4638;
  v48[1] = &unk_1E6CA4648;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 19.5);
  qword_1EF173408 = v15;

  v45[0] = &unk_1E6C9E620;
  v45[1] = &unk_1E6C9E638;
  v46[0] = &unk_1E6CA4638;
  v46[1] = &unk_1E6CA4648;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v16, 19.5);
  qword_1EF173410 = v17;

  v43[0] = &unk_1E6C9E620;
  v43[1] = &unk_1E6C9E638;
  v44[0] = &unk_1E6CA4698;
  v44[1] = &unk_1E6CA46A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v18, 4.0);
  *(_QWORD *)&xmmword_1EF173418 = v19;

  qword_1EF173428 = 0;
  v41[0] = &unk_1E6C9E620;
  v41[1] = &unk_1E6C9E638;
  v42[0] = &unk_1E6CA46B8;
  v42[1] = &unk_1E6CA46C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v20, 8.0);
  qword_1EF173430 = v21;

  v39[0] = &unk_1E6C9E620;
  v39[1] = &unk_1E6C9E650;
  v40[0] = &unk_1E6CA46D8;
  v40[1] = &unk_1E6CA46D8;
  v39[2] = &unk_1E6C9E668;
  v39[3] = &unk_1E6C9E680;
  v40[2] = &unk_1E6CA46D8;
  v40[3] = &unk_1E6CA46E8;
  v39[4] = &unk_1E6C9E698;
  v39[5] = &unk_1E6C9E6B0;
  v40[4] = &unk_1E6CA46E8;
  v40[5] = &unk_1E6CA46E8;
  v39[6] = &unk_1E6C9E6C8;
  v39[7] = &unk_1E6C9E6E0;
  v40[6] = &unk_1E6CA46D8;
  v40[7] = &unk_1E6CA46E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v22, 7.0);
  *((_QWORD *)&xmmword_1EF173438 + 1) = v23;

  qword_1EF173448 = 0x3FE0000000000000;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 1.0, 1.5);
  *((_QWORD *)&xmmword_1EF173458 + 1) = v24;
  objc_msgSend(v2, "constantValue:withOverride:forSizeClass:", 3, 0.0, 0.5);
  qword_1EF173468 = v25;
  v37[0] = &unk_1E6C9E620;
  v37[1] = &unk_1E6C9E650;
  v38[0] = &unk_1E6CA46F8;
  v38[1] = &unk_1E6CA46F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v26, 8.5);
  v28 = v27;

  qword_1EF173470 = 0;
  xmmword_1EF173478 = (unint64_t)v28;
  qword_1EF173488 = v28;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 32.0, 28.0);
  qword_1EF173450 = v29;
  *(_QWORD *)&xmmword_1EF173458 = v29;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 35.0, 38.0);
  v31 = v30;
  v35[0] = &unk_1E6C9E620;
  v35[1] = &unk_1E6C9E638;
  v36[0] = &unk_1E6CA4708;
  v36[1] = &unk_1E6CA4718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v32, 18.0);
  v34 = v33;

  qword_1EF173490 = v31;
  qword_1EF173498 = v34;

}

double ___LayoutConstants_block_invoke_19(uint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v2 = objc_msgSend(a2, "deviceCategory") - 1;
  if (v2 <= 4)
  {
    v3 = qword_1B755E2A0[v2];
    v4 = qword_1B755E2C8[v2];
    v5 = qword_1B755E2F0[v2];
    *(_QWORD *)&_LayoutConstants_layoutConstants = 0x4061000000000000;
    *((_QWORD *)&_LayoutConstants_layoutConstants + 1) = v3;
    qword_1EF1734C8 = 0x405C800000000000;
    qword_1EF1734D0 = v4;
    *(_QWORD *)&xmmword_1EF1734D8 = v5;
    *((_QWORD *)&xmmword_1EF1734D8 + 1) = 0x4065400000000000;
  }
  result = 14.0;
  xmmword_1EF1734E8 = xmmword_1B755E330;
  xmmword_1EF1734F8 = xmmword_1B755E340;
  qword_1EF173508 = 0x4028000000000000;
  return result;
}

void ___LayoutConstants_block_invoke_20(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = &unk_1E6C9E830;
  v13[1] = &unk_1E6C9E848;
  v14[0] = &unk_1E6CA47C8;
  v14[1] = &unk_1E6CA47D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 16.0);
  _LayoutConstants_constants_2_3 = v4;

  v11[0] = &unk_1E6C9E830;
  v11[1] = &unk_1E6C9E860;
  v12[0] = &unk_1E6CA47E8;
  v12[1] = &unk_1E6CA47F8;
  v11[2] = &unk_1E6C9E848;
  v12[2] = &unk_1E6CA47F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 6.5);
  _LayoutConstants_constants_1_3 = v6;

  _LayoutConstants_constants_0_3 = 0x3FF0000000000000;
  v9[0] = &unk_1E6C9E830;
  v9[1] = &unk_1E6C9E860;
  v10[0] = &unk_1E6CA4808;
  v10[1] = &unk_1E6CA4808;
  v9[2] = &unk_1E6C9E848;
  v10[2] = &unk_1E6CA4818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 12.0);
  _LayoutConstants_constants_3_2 = v8;

}

void ___LayoutConstants_block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaledValue:", 18.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_0 = v4;
  objc_msgSend(v12, "scaledValue:", 15.0);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_0 + 1) = v5;
  objc_msgSend(v12, "scaledValue:", 29.0);
  qword_1EF1736E0 = v6;
  objc_msgSend(v12, "scaledValue:withOverride:forSizeClass:", 3, 26.0, 29.0);
  qword_1EF1736E8 = v7;
  objc_msgSend(v12, "scaledValue:", 11.0);
  *(_QWORD *)&xmmword_1EF1736F0 = v8;
  *((_QWORD *)&xmmword_1EF1736F0 + 1) = 0x3FF8000000000000;
  CLKValueForDeviceMetrics();
  qword_1EF173700 = v9;
  qword_1EF173708 = 0x3FE921FB54442D18;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v11 = v10;

  *(_OWORD *)&qword_1EF173740 = *(_OWORD *)&qword_1EF173700;
  _LayoutConstants___constantsGraphicExtraLarge_0 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_0, v11);
  unk_1EF173720 = vmulq_n_f64(*(float64x2_t *)&qword_1EF1736E0, v11);
  xmmword_1EF173730 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF1736F0, v11);
  *(double *)&qword_1EF173740 = v11 * *(double *)&qword_1EF173700;

}

void ___LayoutConstants_block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  int IsTallScript;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IsTallScript = CLKLanguageIsTallScript();
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", v2, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v48[0] = &unk_1E6C9E878;
  v48[1] = &unk_1E6C9E890;
  v49[0] = &unk_1E6CA4828;
  v49[1] = &unk_1E6CA4838;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 19.5);
  _LayoutConstants_constants_0_4 = v6;

  v46[0] = &unk_1E6C9E878;
  v46[1] = &unk_1E6C9E890;
  v47[0] = &unk_1E6CA4848;
  v47[1] = &unk_1E6CA4858;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 4.0);
  _LayoutConstants_constants_2_4 = v8;

  _LayoutConstants_constants_3_3 = 0x3FF0000000000000;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 15.5, 17.5);
  _LayoutConstants_constants_8 = v9;
  if (IsTallScript)
  {
    v44[0] = &unk_1E6C9E878;
    v44[1] = &unk_1E6C9E890;
    v45[0] = &unk_1E6CA4868;
    v45[1] = &unk_1E6CA4878;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v10, 36.0);
    _LayoutConstants_constants_1_4 = v11;

    v42[0] = &unk_1E6C9E878;
    v42[1] = &unk_1E6C9E890;
    v43[0] = &unk_1E6CA4888;
    v43[1] = &unk_1E6CA4898;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v12, 15.5);
    _LayoutConstants_constants_5_0 = v13;

    objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 14.5, 16.5);
    _LayoutConstants_constants_4_2 = v14;
    v40[0] = &unk_1E6C9E878;
    v40[1] = &unk_1E6C9E890;
    v41[0] = &unk_1E6CA48A8;
    v41[1] = &unk_1E6CA48B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v15, 37.0);
    _LayoutConstants_constants_6_1 = v16;

    objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 11.0, 7.0);
    _LayoutConstants_constants_7_1 = v17;
  }
  else
  {
    v38[0] = &unk_1E6C9E878;
    v38[1] = &unk_1E6C9E890;
    v39[0] = &unk_1E6CA48C8;
    v39[1] = &unk_1E6CA48D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v18, 39.0);
    _LayoutConstants_constants_1_4 = v19;

    v36[0] = &unk_1E6C9E878;
    v36[1] = &unk_1E6C9E890;
    v37[0] = &unk_1E6CA48E8;
    v37[1] = &unk_1E6CA48F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v20, 16.5);
    _LayoutConstants_constants_5_0 = v21;

    objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 15.5, 17.5);
    _LayoutConstants_constants_4_2 = v22;
    v34[0] = &unk_1E6C9E878;
    v34[1] = &unk_1E6C9E890;
    v35[0] = &unk_1E6CA48C8;
    v35[1] = &unk_1E6CA4908;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v23, 39.0);
    _LayoutConstants_constants_6_1 = v24;

    v32[0] = &unk_1E6C9E878;
    v32[1] = &unk_1E6C9E890;
    v33[0] = &unk_1E6CA4918;
    v33[1] = &unk_1E6CA4928;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v25, 8.0);
    _LayoutConstants_constants_7_1 = v26;

  }
  v30[0] = &unk_1E6C9E878;
  v30[1] = &unk_1E6C9E8A8;
  v31[0] = &unk_1E6CA4938;
  v31[1] = &unk_1E6CA4938;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v27, 8.5);
  v29 = v28;

  _LayoutConstants_constants_10 = v29;
  _LayoutConstants_constants_12 = v29;

}

double ___LayoutConstants_block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double result;

  v2 = a2;
  *(_QWORD *)&_LayoutConstants___constants_5 = NTKWhistlerSubdialComplicationDistanceFromCenter(v2);
  *((_QWORD *)&_LayoutConstants___constants_5 + 1) = NTKWhistlerBezelCircularViewFontSize(v2);
  qword_1EF1738D8 = NTKWhistlerBezelCircularViewDefaultCenterAngle();
  qword_1EF1738E0 = NTKWhistlerBezelCircularViewDefaultTracking();
  *(_QWORD *)&xmmword_1EF1738E8 = NTKWhistlerBezelCircularViewDefaultTrackingArabic();
  *((_QWORD *)&xmmword_1EF1738E8 + 1) = NTKWhistlerBezelCircularViewDefaultMaxAngularWidth();
  v3 = NTKWhistlerBezelCircularViewDefaultAngularWidthPadding();

  qword_1EF1738F8 = *(_QWORD *)&v3;
  result = 30.0;
  unk_1EF173900 = xmmword_1B755E5B0;
  return result;
}

void ___LayoutConstants_block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_0_5 = v3;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_1_3 = v4;
  CLKValueForLuxoDeviceMetrics();
  v6 = v5;

  _LayoutConstants___constants_2_3 = v6;
}

void ___LayoutConstants_block_invoke_25(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 19.5, 22.5);
  _LayoutConstants_constants_0_5 = v3;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 4.5, 4.5);
  _LayoutConstants_constants_2_5 = v4;
  v37[0] = &unk_1E6C9EC08;
  v37[1] = &unk_1E6C9EC20;
  v38[0] = &unk_1E6CA4948;
  v38[1] = &unk_1E6CA4948;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 8.5);
  v7 = v6;

  _LayoutConstants_constants_8_0 = v7;
  _LayoutConstants_constants_10_0 = v7;
  if (CLKLanguageIsTallScript())
  {
    v35[0] = &unk_1E6C9EC08;
    v35[1] = &unk_1E6C9EC38;
    v36[0] = &unk_1E6CA4958;
    v36[1] = &unk_1E6CA4968;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scaledValue:withOverrides:", v8, 36.0);
    _LayoutConstants_constants_1_5 = v9;

    v33[0] = &unk_1E6C9EC08;
    v33[1] = &unk_1E6C9EC20;
    v34[0] = &unk_1E6CA4978;
    v34[1] = &unk_1E6CA4988;
    v33[2] = &unk_1E6C9EC38;
    v34[2] = &unk_1E6CA4998;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scaledValue:withOverrides:", v10, 16.5);
    _LayoutConstants_constants_3_4 = v11;

    v31[0] = &unk_1E6C9EC08;
    v31[1] = &unk_1E6C9EC38;
    v32[0] = &unk_1E6CA49A8;
    v32[1] = &unk_1E6CA49B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scaledValue:withOverrides:", v12, 37.0);
    _LayoutConstants_constants_4_3 = v13;

    objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 11.0, 12.5);
    _LayoutConstants_constants_5_1 = v14;
  }
  else
  {
    v29[0] = &unk_1E6C9EC08;
    v29[1] = &unk_1E6C9EC38;
    v30[0] = &unk_1E6CA49C8;
    v30[1] = &unk_1E6CA49D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scaledValue:withOverrides:", v15, 39.0);
    _LayoutConstants_constants_1_5 = v16;

    v27[0] = &unk_1E6C9EC08;
    v27[1] = &unk_1E6C9EC20;
    v28[0] = &unk_1E6CA49E8;
    v28[1] = &unk_1E6CA4998;
    v27[2] = &unk_1E6C9EC38;
    v28[2] = &unk_1E6CA49F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scaledValue:withOverrides:", v17, 17.5);
    _LayoutConstants_constants_3_4 = v18;

    v25[0] = &unk_1E6C9EC08;
    v25[1] = &unk_1E6C9EC38;
    v26[0] = &unk_1E6CA49C8;
    v26[1] = &unk_1E6CA4A08;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scaledValue:withOverrides:", v19, 39.0);
    _LayoutConstants_constants_4_3 = v20;

    v23[0] = &unk_1E6C9EC08;
    v23[1] = &unk_1E6C9EC38;
    v24[0] = &unk_1E6CA4A18;
    v24[1] = &unk_1E6CA4A28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scaledValue:withOverrides:", v21, 8.0);
    _LayoutConstants_constants_5_1 = v22;

  }
}

void ___LayoutConstants_block_invoke_26(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_1E6C9EC50;
  v5[1] = &unk_1E6C9EC68;
  v6[0] = &unk_1E6CA4A38;
  v6[1] = &unk_1E6CA4A48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 16.5);
  _LayoutConstants_constants_0_6 = v4;

  _LayoutConstants_constants_2_6 = 0x400C000000000000;
  _LayoutConstants_constants_1_6 = 0x4000000000000000;

}

void ___LayoutConstants_block_invoke_27(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValue:", 19.5);
  *(_QWORD *)&_LayoutConstants___constants_6 = v2;
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 3, 16.0, 18.0);
  *((_QWORD *)&_LayoutConstants___constants_6 + 1) = v3;
  objc_msgSend(v7, "scaledValue:", 11.0);
  qword_1EF173A48 = v4;
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 3, 9.5, 11.0);
  qword_1EF173A50 = v5;
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 3, 14.0, 16.0);
  qword_1EF173A58 = v6;

}

void ___LayoutConstants_block_invoke_28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _LayoutConstants___constants_7 = xmmword_1B755E660;
  objc_msgSend(v4, "scaledValue:", 9.0);
  qword_1EF173AA0 = v2;
  qword_1EF173AA8 = 0x3FF8000000000000;
  objc_msgSend(v4, "scaledValue:", 4.0);
  *(_QWORD *)&xmmword_1EF173AB0 = v3;
  *(__int128 *)((char *)&xmmword_1EF173AB0 + 8) = xmmword_1B755E670;

}

void ___LayoutConstants_block_invoke_29(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
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
  _QWORD v15[2];
  _QWORD v16[2];
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = &unk_1E6C9EC98;
  v25[1] = &unk_1E6C9ECB0;
  v26[0] = &unk_1E6CA4A88;
  v26[1] = &unk_1E6CA4A98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 16.5);
  *(_QWORD *)&_LayoutConstants___constants_8 = v4;

  v23 = &unk_1E6C9EC98;
  v24 = &unk_1E6CA4AA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 40.0);
  *((_QWORD *)&_LayoutConstants___constants_8 + 1) = v6;

  v21[0] = &unk_1E6C9EC98;
  v21[1] = &unk_1E6C9ECC8;
  v22[0] = &unk_1E6CA4AB8;
  v22[1] = &unk_1E6CA4AC8;
  v21[2] = &unk_1E6C9ECB0;
  v22[2] = &unk_1E6CA4AD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 8.5);
  qword_1EF173AF0 = v8;

  v19[0] = &unk_1E6C9EC98;
  v19[1] = &unk_1E6C9ECC8;
  v20[0] = &unk_1E6CA4AE8;
  v20[1] = &unk_1E6CA4AE8;
  v19[2] = &unk_1E6C9ECB0;
  v20[2] = &unk_1E6CA4AD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 8.5);
  qword_1EF173AF8 = v10;

  v17 = &unk_1E6C9EC98;
  v18 = &unk_1E6CA4AF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v11, 38.0);
  *(_QWORD *)&xmmword_1EF173B00 = v12;

  v15[0] = &unk_1E6C9EC98;
  v15[1] = &unk_1E6C9ECB0;
  v16[0] = &unk_1E6CA4B08;
  v16[1] = &unk_1E6CA4AB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v13, 4.0);
  *((_QWORD *)&xmmword_1EF173B00 + 1) = v14;

  qword_1EF173B10 = *((_QWORD *)&xmmword_1EF173B00 + 1);
}

void ___LayoutConstants_block_invoke_30(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKAnalogUtilities largeDialSizeForDevice:](NTKAnalogUtilities, "largeDialSizeForDevice:", v3);

  v11[0] = &unk_1E6C9EE78;
  v11[1] = &unk_1E6C9EE90;
  v12[0] = &unk_1E6CA4B18;
  v12[1] = &unk_1E6CA4B18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 4.0);
  _LayoutConstants___constants_1_4 = v6;

  v9[0] = &unk_1E6C9EE78;
  v9[1] = &unk_1E6C9EE90;
  v10[0] = &unk_1E6CA4B18;
  v10[1] = &unk_1E6CA4B18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 4.0);
  _LayoutConstants___constants_2_4 = v8;

}

double ___LayoutConstants_block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double result;
  id v8;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = NTKWhistlerSubdialComplicationDiameter(v3);

  objc_msgSend(v8, "scaledPoint:withOverride:forSizeClass:", 2, 10.5, 23.0, 7.5, 20.0);
  *(double *)&_LayoutConstants__constants_0_1 = v4 * 0.5 + v5;
  *(double *)&_LayoutConstants__constants_1 = v4 * 0.5 + v6;

  return result;
}

void ___LayoutConstants_block_invoke_32(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledSize:", 1.5, 6.0);
  *(double *)&_LayoutConstants___constants_9 = v2;
  *((double *)&_LayoutConstants___constants_9 + 1) = v3;
  *(double *)&qword_1EF173C30 = v2 + -0.5;
  unk_1EF173C38 = v3 + -0.5;
  objc_msgSend(v6, "scaledValue:", 3.0);
  *(_QWORD *)&xmmword_1EF173C40 = v4;
  objc_msgSend(v6, "scaledValue:", 5.5);
  *((_QWORD *)&xmmword_1EF173C40 + 1) = v5;

}

double ___LayoutConstants_block_invoke_33(uint64_t a1, void *a2)
{
  unint64_t v2;
  double result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  xmmword_1EF173CB8 = xmmword_1B755E880;
  xmmword_1EF173CC8 = xmmword_1B755E890;
  v2 = objc_msgSend(a2, "deviceCategory");
  if (v2 <= 5)
  {
    result = dbl_1B755E700[v2];
    v4 = qword_1B755E730[v2];
    v5 = qword_1B755E760[v2];
    v6 = qword_1B755E790[v2];
    v7 = qword_1B755E7C0[v2];
    v8 = qword_1B755E7F0[v2];
    v9 = qword_1B755E820[v2];
    v10 = qword_1B755E850[v2];
    qword_1EF173CD8 = *(_QWORD *)&result;
    unk_1EF173CE0 = v4;
    *(_QWORD *)&xmmword_1EF173CE8 = v5;
    *((_QWORD *)&xmmword_1EF173CE8 + 1) = v6;
    qword_1EF173CF8 = v7;
    unk_1EF173D00 = v8;
    *(_QWORD *)&_LayoutConstants_layoutConstants_0 = v9;
    *((_QWORD *)&_LayoutConstants_layoutConstants_0 + 1) = v10;
  }
  return result;
}

void ___LayoutConstants_block_invoke_34(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRoundingBehavior:", 1);
  objc_msgSend(v15, "scaledValue:", 24.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_1 = v4;
  objc_msgSend(v15, "scaledValue:", 12.0);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_1 + 1) = v5;
  objc_msgSend(v15, "scaledValue:withOverride:forSizeClass:", 3, 41.5, 46.5);
  qword_1EF173EC0 = v6;
  objc_msgSend(v15, "scaledValue:withOverride:forSizeClass:", 3, 24.5, 27.5);
  qword_1EF173EC8 = v7;
  objc_msgSend(v15, "scaledValue:withOverride:forSizeClass:", 3, 40.0, 45.0);
  *(_QWORD *)&xmmword_1EF173ED0 = v8;
  objc_msgSend(v15, "setRoundingBehavior:", 0);
  objc_msgSend(v15, "scaledSize:withOverride:forSizeClass:", 3, 0.75, 3.5, 0.75, 4.0);
  *((_QWORD *)&xmmword_1EF173ED0 + 1) = v9;
  unk_1EF173EE0 = v10;
  objc_msgSend(v15, "scaledSize:withOverride:forSizeClass:", 3, 0.75, 1.75, 0.75, 2.0);
  qword_1EF173EE8 = v11;
  qword_1EF173EF0 = v12;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v14 = v13;

  _LayoutConstants___constantsGraphicExtraLarge_1 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_1, v14);
  *(float64x2_t *)algn_1EF173F10 = vmulq_n_f64(*(float64x2_t *)&qword_1EF173EC0, v14);
  xmmword_1EF173F20 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF173ED0, v14);
  unk_1EF173F30 = vmulq_n_f64(unk_1EF173EE0, v14);
  *(double *)&qword_1EF173F40 = v14 * *(double *)&qword_1EF173EF0;

}

void ___LayoutConstants_block_invoke_35(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  _QWORD v61[4];
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[3];
  _QWORD v67[3];
  void *v68;
  void *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[4];
  _QWORD v73[4];
  void *v74;
  void *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[4];
  _QWORD v91[4];
  void *v92;
  void *v93;
  _QWORD v94[4];
  _QWORD v95[4];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[3];
  _QWORD v101[5];

  v101[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:", 12.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_2 = v3;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 41.5, 46.5);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_2 + 1) = v4;
  v100[0] = &unk_1E6C9EF20;
  v100[1] = &unk_1E6C9EF38;
  v101[0] = &unk_1E6CA4B28;
  v101[1] = &unk_1E6CA4B28;
  v100[2] = &unk_1E6C9EF50;
  v101[2] = &unk_1E6CA4B28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 20.5);
  qword_1EF173F70 = v6;

  v98[0] = &unk_1E6C9EF20;
  v98[1] = &unk_1E6C9EF68;
  v99[0] = &unk_1E6CA4B38;
  v99[1] = &unk_1E6CA4B48;
  v98[2] = &unk_1E6C9EF38;
  v98[3] = &unk_1E6C9EF50;
  v99[2] = &unk_1E6CA4B58;
  v99[3] = &unk_1E6CA4B58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 29.5);
  qword_1EF173F78 = v8;

  v96[0] = &unk_1E6C9EF20;
  v96[1] = &unk_1E6C9EF68;
  v97[0] = &unk_1E6CA4B68;
  v97[1] = &unk_1E6CA4B78;
  v96[2] = &unk_1E6C9EF38;
  v96[3] = &unk_1E6C9EF50;
  v97[2] = &unk_1E6CA4B88;
  v97[3] = &unk_1E6CA4B88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 12.5);
  *(_QWORD *)&xmmword_1EF173F80 = v10;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 41.5, 46.5);
  *((_QWORD *)&xmmword_1EF173F80 + 1) = v11;
  v94[0] = &unk_1E6C9EF20;
  v94[1] = &unk_1E6C9EF68;
  v95[0] = &unk_1E6CA4B98;
  v95[1] = &unk_1E6CA4B98;
  v94[2] = &unk_1E6C9EF38;
  v94[3] = &unk_1E6C9EF50;
  v95[2] = &unk_1E6CA4BA8;
  v95[3] = &unk_1E6CA4BA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v12, 23.5);
  qword_1EF173F90 = v13;

  v92 = &unk_1E6C9EF68;
  v93 = &unk_1E6CA4BB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 11.0);
  qword_1EF173F98 = v15;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 41.5, 46.5);
  *(_QWORD *)&xmmword_1EF173FA0 = v16;
  v90[0] = &unk_1E6C9EF20;
  v90[1] = &unk_1E6C9EF68;
  v91[0] = &unk_1E6CA4BC8;
  v91[1] = &unk_1E6CA4BD8;
  v90[2] = &unk_1E6C9EF38;
  v90[3] = &unk_1E6C9EF50;
  v91[2] = &unk_1E6CA4BE8;
  v91[3] = &unk_1E6CA4BE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v17, 29.5);
  *((_QWORD *)&xmmword_1EF173FA0 + 1) = v18;

  objc_msgSend(v2, "scaledValue:", 10.5);
  qword_1EF173FB0 = v19;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 41.5, 46.5);
  qword_1EF173FB8 = v20;
  v88[0] = &unk_1E6C9EF20;
  v88[1] = &unk_1E6C9EF38;
  v89[0] = &unk_1E6CA4BF8;
  v89[1] = &unk_1E6CA4C08;
  v88[2] = &unk_1E6C9EF50;
  v89[2] = &unk_1E6CA4C08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v21, 31.5);
  *(_QWORD *)&xmmword_1EF173FC0 = v22;

  v86[0] = &unk_1E6C9EF20;
  v86[1] = &unk_1E6C9EF68;
  v87[0] = &unk_1E6CA4C18;
  v87[1] = &unk_1E6CA4C28;
  v86[2] = &unk_1E6C9EF38;
  v86[3] = &unk_1E6C9EF50;
  v87[2] = &unk_1E6CA4C18;
  v87[3] = &unk_1E6CA4C18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v23, 17.5);
  *((_QWORD *)&xmmword_1EF173FC0 + 1) = v24;

  v84[0] = &unk_1E6C9EF20;
  v84[1] = &unk_1E6C9EF68;
  v85[0] = &unk_1E6CA4C38;
  v85[1] = &unk_1E6CA4BB8;
  v84[2] = &unk_1E6C9EF38;
  v84[3] = &unk_1E6C9EF50;
  v85[2] = &unk_1E6CA4C38;
  v85[3] = &unk_1E6CA4C38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v25, 8.0);
  qword_1EF173FD0 = v26;

  objc_msgSend(v2, "scaledValue:", 4.0);
  qword_1EF173FD8 = v27;
  objc_msgSend(v2, "scaledValue:", 25.0);
  *(_QWORD *)&xmmword_1EF173FE0 = v28;
  objc_msgSend(v2, "scaledValue:", 12.0);
  *((_QWORD *)&xmmword_1EF173FE0 + 1) = v29;
  v82[0] = &unk_1E6C9EF20;
  v82[1] = &unk_1E6C9EF68;
  v83[0] = &unk_1E6CA4C48;
  v83[1] = &unk_1E6CA4BE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v30, 34.3);
  *(_QWORD *)&_LayoutConstants___constantsGraphicExtraLarge_2 = v31;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 118.5, 130.5);
  *((_QWORD *)&_LayoutConstants___constantsGraphicExtraLarge_2 + 1) = v32;
  v80[0] = &unk_1E6C9EF20;
  v80[1] = &unk_1E6C9EF38;
  v81[0] = &unk_1E6CA4C58;
  v81[1] = &unk_1E6CA4C68;
  v80[2] = &unk_1E6C9EF50;
  v81[2] = &unk_1E6CA4C68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v33, 58.6);
  qword_1EF174000 = v34;

  v78[0] = &unk_1E6C9EF20;
  v78[1] = &unk_1E6C9EF68;
  v79[0] = &unk_1E6CA4C78;
  v79[1] = &unk_1E6CA4C88;
  v78[2] = &unk_1E6C9EF38;
  v78[3] = &unk_1E6C9EF50;
  v79[2] = &unk_1E6CA4C98;
  v79[3] = &unk_1E6CA4C98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v35, 84.3);
  qword_1EF174008 = v36;

  v76[0] = &unk_1E6C9EF20;
  v76[1] = &unk_1E6C9EF68;
  v77[0] = &unk_1E6CA4C48;
  v77[1] = &unk_1E6CA4BE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v37, 34.3);
  *(_QWORD *)&xmmword_1EF174010 = v38;

  v74 = &unk_1E6C9EF20;
  v75 = &unk_1E6CA4CA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v39, 118.7);
  *((_QWORD *)&xmmword_1EF174010 + 1) = v40;

  v72[0] = &unk_1E6C9EF20;
  v72[1] = &unk_1E6C9EF68;
  v73[0] = &unk_1E6CA4CB8;
  v73[1] = &unk_1E6CA4CC8;
  v72[2] = &unk_1E6C9EF38;
  v72[3] = &unk_1E6C9EF50;
  v73[2] = &unk_1E6CA4CD8;
  v73[3] = &unk_1E6CA4CD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v41, 67.0);
  qword_1EF174020 = v42;

  v70[0] = &unk_1E6C9EF20;
  v70[1] = &unk_1E6C9EF68;
  v71[0] = &unk_1E6CA4BD8;
  v71[1] = &unk_1E6CA4CE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v43, 31.4);
  qword_1EF174028 = v44;

  v68 = &unk_1E6C9EF20;
  v69 = &unk_1E6CA4CA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v45, 118.7);
  *(_QWORD *)&xmmword_1EF174030 = v46;

  v66[0] = &unk_1E6C9EF20;
  v66[1] = &unk_1E6C9EF38;
  v67[0] = &unk_1E6CA4CF8;
  v67[1] = &unk_1E6CA4D08;
  v66[2] = &unk_1E6C9EF50;
  v67[2] = &unk_1E6CA4D08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v47, 84.4);
  *((_QWORD *)&xmmword_1EF174030 + 1) = v48;

  objc_msgSend(v2, "scaledValue:", 30.0);
  qword_1EF174040 = v49;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 118.6, 130.6);
  qword_1EF174048 = v50;
  v64[0] = &unk_1E6C9EF20;
  v64[1] = &unk_1E6C9EF68;
  v65[0] = &unk_1E6CA4D18;
  v65[1] = &unk_1E6CA4D28;
  v64[2] = &unk_1E6C9EF38;
  v64[3] = &unk_1E6C9EF50;
  v65[2] = &unk_1E6CA4D38;
  v65[3] = &unk_1E6CA4D38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v51, 90.0);
  *(_QWORD *)&xmmword_1EF174050 = v52;

  v62[0] = &unk_1E6C9EF20;
  v62[1] = &unk_1E6C9EF68;
  v63[0] = &unk_1E6CA4D48;
  v63[1] = &unk_1E6CA4D58;
  v62[2] = &unk_1E6C9EF38;
  v62[3] = &unk_1E6C9EF50;
  v63[2] = &unk_1E6CA4C58;
  v63[3] = &unk_1E6CA4C58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v53, 50.0);
  *((_QWORD *)&xmmword_1EF174050 + 1) = v54;

  v60[0] = &unk_1E6C9EF20;
  v60[1] = &unk_1E6C9EF68;
  v61[0] = &unk_1E6CA4D68;
  v61[1] = &unk_1E6CA4D78;
  v60[2] = &unk_1E6C9EF38;
  v60[3] = &unk_1E6C9EF50;
  v61[2] = &unk_1E6CA4D88;
  v61[3] = &unk_1E6CA4D88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v55, 22.0);
  qword_1EF174060 = v56;

  objc_msgSend(v2, "scaledValue:", 11.0);
  qword_1EF174068 = v57;
  objc_msgSend(v2, "scaledValue:", 72.0);
  *(_QWORD *)&xmmword_1EF174070 = v58;
  objc_msgSend(v2, "scaledValue:", 35.0);
  *((_QWORD *)&xmmword_1EF174070 + 1) = v59;

}

void ___LayoutConstants_block_invoke_36(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
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
  uint64_t v18;
  double v19;
  double v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = &unk_1E6C9F058;
  v33[1] = &unk_1E6C9F070;
  v34[0] = &unk_1E6CA4E08;
  v34[1] = &unk_1E6CA4E08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 9.0);
  *(_QWORD *)&_LayoutConstants__constants_0 = v6;

  v31[0] = &unk_1E6C9F058;
  v31[1] = &unk_1E6C9F070;
  v32[0] = &unk_1E6CA4E08;
  v32[1] = &unk_1E6CA4E08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 8.0);
  *((_QWORD *)&_LayoutConstants__constants_0 + 1) = v8;

  v29[0] = &unk_1E6C9F058;
  v29[1] = &unk_1E6C9F070;
  v30[0] = &unk_1E6CA4E08;
  v30[1] = &unk_1E6CA4E08;
  v29[2] = &unk_1E6C9F088;
  v30[2] = &unk_1E6CA4E18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v9, 37.5);
  qword_1EF1741F0 = v10;

  v27[0] = &unk_1E6C9F058;
  v27[1] = &unk_1E6C9F070;
  v28[0] = &unk_1E6CA4E08;
  v28[1] = &unk_1E6CA4E08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v11, 22.5);
  qword_1EF1741F8 = v12;

  v25[0] = &unk_1E6C9F058;
  v25[1] = &unk_1E6C9F070;
  v26[0] = &unk_1E6CA4E08;
  v26[1] = &unk_1E6CA4E08;
  v25[2] = &unk_1E6C9F088;
  v26[2] = &unk_1E6CA4E28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v13, 12.5);
  qword_1EF174210 = v14;

  v23[0] = &unk_1E6C9F058;
  v23[1] = &unk_1E6C9F070;
  v24[0] = &unk_1E6CA4E08;
  v24[1] = &unk_1E6CA4E08;
  v23[2] = &unk_1E6C9F088;
  v24[2] = &unk_1E6CA4E38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v15, 14.0);
  qword_1EF174218 = v16;

  v21[0] = &unk_1E6C9F058;
  v21[1] = &unk_1E6C9F070;
  v22[0] = &unk_1E6CA4E08;
  v22[1] = &unk_1E6CA4E08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v17, 7.0);
  *(_QWORD *)&xmmword_1EF174200 = v18;

  *((_QWORD *)&xmmword_1EF174200 + 1) = 0x3FECB91F3BBBA140;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v20 = v19;

  xmmword_1EF174240 = xmmword_1EF174200;
  _LayoutConstants__constantsGraphicExtraLarge = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants__constants_0, v20);
  *(float64x2_t *)algn_1EF174230 = vmulq_n_f64(*(float64x2_t *)&qword_1EF1741F0, v20);
  xmmword_1EF174250 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_1EF174210, v20);
  *(double *)&xmmword_1EF174240 = v20 * *(double *)&xmmword_1EF174200;

}

void ___LayoutConstants_block_invoke_37(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
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
  double v14;
  double v15;
  id v16;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scaledValue:", 18.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_3 = v4;
  objc_msgSend(v16, "scaledValue:", 15.0);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_3 + 1) = v5;
  objc_msgSend(v16, "scaledValue:", 29.0);
  qword_1EF174290 = v6;
  objc_msgSend(v16, "scaledValue:withOverride:forSizeClass:", 3, 26.0, 29.0);
  *(_QWORD *)&xmmword_1EF1742A0 = v7;
  objc_msgSend(v16, "scaledValue:withOverride:forSizeClass:", 3, 25.0, 28.0);
  qword_1EF174298 = v8;
  objc_msgSend(v16, "scaledValue:", 9.0);
  *((_QWORD *)&xmmword_1EF1742A0 + 1) = v9;
  objc_msgSend(v16, "scaledValue:", 8.0);
  qword_1EF1742B0 = v10;
  objc_msgSend(v16, "scaledValue:withOverride:forSizeClass:", 3, 37.5, 42.0);
  qword_1EF1742B8 = v11;
  objc_msgSend(v16, "scaledValue:withOverride:forSizeClass:", 3, 17.5, 20.0);
  *(_QWORD *)&xmmword_1EF1742C0 = v12;
  objc_msgSend(v16, "scaledValue:", 4.0);
  *((_QWORD *)&xmmword_1EF1742C0 + 1) = v13;
  qword_1EF1742D0 = 0x3FE921FB54442D18;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v15 = v14;

  qword_1EF174330 = qword_1EF1742D0;
  _LayoutConstants___constantsGraphicExtraLarge_3 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_3, v15);
  *(float64x2_t *)algn_1EF1742F0 = vmulq_n_f64(*(float64x2_t *)&qword_1EF174290, v15);
  xmmword_1EF174300 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF1742A0, v15);
  xmmword_1EF174310 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_1EF1742B0, v15);
  xmmword_1EF174320 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF1742C0, v15);

}

void ___LayoutConstants_block_invoke_38(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledValue:", 4.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_4 = v4;
  objc_msgSend(v8, "scaledValue:withOverride:forSizeClass:", 3, 27.0, 31.0);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_4 + 1) = v5;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v7 = v6;

  _LayoutConstants___constantsGraphicExtraLarge_4 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_4, v7);
}

uint64_t ___LayoutConstants_block_invoke_39()
{
  uint64_t result;
  double v1;

  _LayoutConstants__constants_0_2 = 0x4045000000000000;
  _LayoutConstants__constants_1_0 = 0x403F000000000000;
  result = NTKCScreenStyle();
  v1 = 16.0;
  if (result == 1)
    v1 = 20.0;
  _LayoutConstants__constants_2 = *(_QWORD *)&v1;
  _LayoutConstants__constants_3 = 0x402E000000000000;
  _LayoutConstants__constants_4 = 0x4028000000000000;
  _LayoutConstants__constants_5 = 0x4039000000000000;
  _LayoutConstants__constants_6 = 0x4028000000000000;
  return result;
}

void ___LayoutConstants_block_invoke_40(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = &unk_1E6C9F220;
  v29[1] = &unk_1E6C9F238;
  v30[0] = &unk_1E6CA4F68;
  v30[1] = &unk_1E6CA4F78;
  v29[2] = &unk_1E6C9F250;
  v30[2] = &unk_1E6CA4F88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 19.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_5 = v6;

  v27[0] = &unk_1E6C9F238;
  v27[1] = &unk_1E6C9F250;
  v28[0] = &unk_1E6CA4F98;
  v28[1] = &unk_1E6CA4FA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 30.5);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_5 + 1) = v8;

  v25[0] = &unk_1E6C9F238;
  v25[1] = &unk_1E6C9F250;
  v26[0] = &unk_1E6CA4FB8;
  v26[1] = &unk_1E6CA4FC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v9, 38.0);
  qword_1EF1745C0 = v10;

  objc_msgSend(v4, "scaledValue:", 12.0);
  v12 = v11;
  v13 = *MEMORY[0x1E0DC1438];
  v14 = (_QWORD *)MEMORY[0x1E0C940A8];
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8]);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)qword_1EF1745C8;
  qword_1EF1745C8 = v15;

  v23[0] = &unk_1E6C9F220;
  v23[1] = &unk_1E6C9F238;
  v24[0] = &unk_1E6CA4FD8;
  v24[1] = &unk_1E6CA4FD8;
  v23[2] = &unk_1E6C9F250;
  v24[2] = &unk_1E6CA4FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v17, 10.0);
  qword_1EF1745D0 = v18;

  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v22 = v19;

  _LayoutConstants___constantsGraphicExtraLarge_5 = _LayoutConstants___constantsGraphicCircular_5;
  qword_1EF1745F0 = qword_1EF1745C0;
  objc_storeStrong((id *)&qword_1EF1745F8, (id)qword_1EF1745C8);
  qword_1EF174600 = qword_1EF1745D0;
  _LayoutConstants___constantsGraphicExtraLarge_5 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicExtraLarge_5, v22);
  *(double *)&qword_1EF1745F0 = v22 * *(double *)&qword_1EF1745F0;
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v14, v12 * v22, v13);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)qword_1EF1745F8;
  qword_1EF1745F8 = v20;

  *(double *)&qword_1EF174600 = v22 * *(double *)&qword_1EF174600;
}

void ___LayoutConstants_block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledValue:", 19.5);
  _LayoutConstants___constants_0_6 = v2;
  objc_msgSend(v6, "scaledValue:withOverride:forSizeClass:", 3, 16.0, 18.0);
  _LayoutConstants___constants_1_5 = v3;
  objc_msgSend(v6, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 13.5);
  _LayoutConstants___constants_2_5 = v4;
  objc_msgSend(v6, "scaledValue:", 4.5);
  _LayoutConstants___constants_3_2 = v5;

}

void ___LayoutConstants_block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverride:forSizeClass:", 2, 6.0, 7.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_6 = v5;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 31.5, 34.0);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_6 + 1) = v6;
  objc_msgSend(v4, "scaledValue:", 38.0);
  qword_1EF174720 = v7;
  v21[0] = &unk_1E6C9F268;
  v21[1] = &unk_1E6C9F280;
  v22[0] = &unk_1E6CA4FF8;
  v22[1] = &unk_1E6CA4FF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v8, 12.0);
  v10 = v9;

  v11 = *MEMORY[0x1E0DC1438];
  v12 = (_QWORD *)MEMORY[0x1E0C940A8];
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v10, *MEMORY[0x1E0DC1438]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1EF174728;
  qword_1EF174728 = v13;

  objc_msgSend(v4, "scaledSize:withOverride:forSizeClass:", 3, 28.0, 14.0, 31.0, 16.0);
  *(_QWORD *)&xmmword_1EF174730 = v15;
  *((_QWORD *)&xmmword_1EF174730 + 1) = v16;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v20 = v17;

  _LayoutConstants___constantsGraphicExtraLarge_6 = _LayoutConstants___constantsGraphicCircular_6;
  qword_1EF174750 = qword_1EF174720;
  objc_storeStrong((id *)&qword_1EF174758, (id)qword_1EF174728);
  xmmword_1EF174760 = xmmword_1EF174730;
  _LayoutConstants___constantsGraphicExtraLarge_6 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicExtraLarge_6, v20);
  *(double *)&qword_1EF174750 = v20 * *(double *)&qword_1EF174750;
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *v12, v10 * v20, v11);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1EF174758;
  qword_1EF174758 = v18;

  xmmword_1EF174760 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF174760, v20);
}

void ___LayoutConstants_block_invoke_43(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 15.5);
  _LayoutConstants___constants_0_7 = v2;
  objc_msgSend(v5, "scaledValue:withOverride:forSizeClass:", 3, 44.5, 50.5);
  _LayoutConstants___constants_1_6 = v3;
  _LayoutConstants___constants_2_6 = 0x4024000000000000;
  objc_msgSend(v5, "scaledValue:", 62.0);
  _LayoutConstants___constants_3_3 = v4;

}

void ___LayoutConstants_block_invoke_44(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenBounds");
  v6 = v5;
  objc_msgSend(v3, "screenBounds");
  v8 = v6 / v7;
  objc_msgSend(v3, "screenBounds");
  v10 = v9;

  v11 = v10 - NTKFaceEditingTabsTextSize();
  *(double *)&_LayoutConstants___constants_10 = v8 * (v11 - NTKFaceEditingFullscreenTabMargin());
  *((_QWORD *)&_LayoutConstants___constants_10 + 1) = 0x4034000000000000;
  v25[0] = &unk_1E6C9F298;
  v25[1] = &unk_1E6C9F2B0;
  v26[0] = &unk_1E6CA5008;
  v26[1] = &unk_1E6CA5018;
  v25[2] = &unk_1E6C9F2C8;
  v26[2] = &unk_1E6CA5028;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v12, 100.0);
  *(_QWORD *)&xmmword_1EF174820 = v13;

  *(__int128 *)((char *)&xmmword_1EF174820 + 8) = xmmword_1B755EB10;
  v14 = *(double *)&_LayoutConstants___constants_10;
  v15 = NTKFaceEditingFullscreenKeylineMargin();
  *(double *)&qword_1EF174810 = v14 + (v15 + NTKKeylineWidth()) * -2.0;
  qword_1EF174818 = 0;
  v23[0] = &unk_1E6C9F298;
  v23[1] = &unk_1E6C9F2B0;
  v24[0] = &unk_1E6CA5038;
  v24[1] = &unk_1E6CA5048;
  v23[2] = &unk_1E6C9F2C8;
  v24[2] = &unk_1E6CA5058;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v16, 57.0);
  qword_1EF174838 = v17;

  *(_QWORD *)&xmmword_1EF174840 = 0x4034000000000000;
  v21[0] = &unk_1E6C9F298;
  v21[1] = &unk_1E6C9F2C8;
  v22[0] = &unk_1E6CA5068;
  v22[1] = &unk_1E6CA5078;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v18, -35.5);
  *((_QWORD *)&xmmword_1EF174840 + 1) = v19;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 42.0, 43.0);
  qword_1EF174850 = v20;

}

void ___LayoutConstants_block_invoke_45(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[8];
  _QWORD v20[8];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = &unk_1E6C9F820;
  v21[1] = &unk_1E6C9F838;
  v22[0] = &unk_1E6CA5088;
  v22[1] = &unk_1E6CA5088;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 6.5);
  *(_QWORD *)&_LayoutConstants___constants_11 = v4;

  *((_QWORD *)&_LayoutConstants___constants_11 + 1) = 0x3FF8000000000000;
  v19[0] = &unk_1E6C9F850;
  v19[1] = &unk_1E6C9F820;
  v20[0] = &unk_1E6CA5098;
  v20[1] = &unk_1E6CA5098;
  v19[2] = &unk_1E6C9F838;
  v19[3] = &unk_1E6C9F868;
  v20[2] = &unk_1E6CA50A8;
  v20[3] = &unk_1E6CA50B8;
  v19[4] = &unk_1E6C9F880;
  v19[5] = &unk_1E6C9F898;
  v20[4] = &unk_1E6CA50C8;
  v20[5] = &unk_1E6CA50D8;
  v19[6] = &unk_1E6C9F8B0;
  v19[7] = &unk_1E6C9F8C8;
  v20[6] = &unk_1E6CA50B8;
  v20[7] = &unk_1E6CA50D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 6.0);
  qword_1EF174908 = v6;

  v18[0] = &unk_1E6CA50E8;
  v18[1] = &unk_1E6CA50E8;
  v17[0] = &unk_1E6C9F850;
  v17[1] = &unk_1E6C9F820;
  v17[2] = &unk_1E6C9F838;
  v17[3] = &unk_1E6C9F898;
  v18[2] = &unk_1E6CA50F8;
  v18[3] = &unk_1E6CA5108;
  v17[4] = &unk_1E6C9F8B0;
  v17[5] = &unk_1E6C9F8C8;
  v18[4] = &unk_1E6CA50F8;
  v18[5] = &unk_1E6CA5108;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 6.5);
  qword_1EF174910 = v8;

  v15[0] = &unk_1E6C9F850;
  v15[1] = &unk_1E6C9F820;
  v16[0] = &unk_1E6CA5118;
  v16[1] = &unk_1E6CA5118;
  v15[2] = &unk_1E6C9F898;
  v15[3] = &unk_1E6C9F8B0;
  v16[2] = &unk_1E6CA50B8;
  v16[3] = &unk_1E6CA5118;
  v15[4] = &unk_1E6C9F8C8;
  v16[4] = &unk_1E6CA50B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constantValue:withOverrides:", v9, 4.0);
  *(_QWORD *)&xmmword_1EF174918 = v10;

  v13[0] = &unk_1E6C9F850;
  v13[1] = &unk_1E6C9F820;
  v14[0] = &unk_1E6CA5118;
  v14[1] = &unk_1E6CA5118;
  v13[2] = &unk_1E6C9F8B0;
  v13[3] = &unk_1E6C9F8C8;
  v14[2] = &unk_1E6CA5118;
  v14[3] = &unk_1E6CA5118;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constantValue:withOverrides:", v11, 3.0);
  *((_QWORD *)&xmmword_1EF174918 + 1) = v12;

  qword_1EF174928 = 0;
}

void ___LayoutConstants_block_invoke_46(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = &unk_1E6C9F940;
  v37[1] = &unk_1E6C9F958;
  v38[0] = &unk_1E6CA5148;
  v38[1] = &unk_1E6CA5158;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 19.5);
  *((_QWORD *)&_LayoutConstants_constants_2 + 1) = v4;

  v35[0] = &unk_1E6C9F940;
  v35[1] = &unk_1E6C9F958;
  v36[0] = &unk_1E6CA5168;
  v36[1] = &unk_1E6CA5178;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 19.5);
  qword_1EF1749C8 = v6;

  v33[0] = &unk_1E6C9F940;
  v33[1] = &unk_1E6C9F958;
  v34[0] = &unk_1E6CA5168;
  v34[1] = &unk_1E6CA5178;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 19.5);
  qword_1EF1749D0 = v8;

  v31[0] = &unk_1E6C9F940;
  v31[1] = &unk_1E6C9F958;
  v32[0] = &unk_1E6CA5188;
  v32[1] = &unk_1E6CA5198;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 6.0);
  *(_QWORD *)&xmmword_1EF1749D8 = v10;

  v29[0] = &unk_1E6C9F940;
  v29[1] = &unk_1E6C9F958;
  v30[0] = &unk_1E6CA51A8;
  v30[1] = &unk_1E6CA51B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v11, 16.5);
  *((_QWORD *)&xmmword_1EF1749D8 + 1) = v12;

  qword_1EF1749E8 = 0;
  v27[0] = &unk_1E6C9F940;
  v27[1] = &unk_1E6C9F958;
  v28[0] = &unk_1E6CA51C8;
  v28[1] = &unk_1E6CA51D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v13, 7.5);
  qword_1EF1749F0 = v14;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 2.0, 3.0);
  *(_QWORD *)&_LayoutConstants_constants_2 = v15;
  v25[0] = &unk_1E6C9F940;
  v25[1] = &unk_1E6C9F970;
  v26[0] = &unk_1E6CA51E8;
  v26[1] = &unk_1E6CA51F8;
  v25[2] = &unk_1E6C9F958;
  v26[2] = &unk_1E6CA5208;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v16, 66.0);
  *(_QWORD *)&xmmword_1EF1749F8 = v17;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 13.5, 12.0);
  qword_1EF174A30 = v18;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 32.0, 28.0);
  *((_QWORD *)&xmmword_1EF174A18 + 1) = v19;
  unk_1EF174A28 = v19;
  v23[0] = &unk_1E6C9F940;
  v23[1] = &unk_1E6C9F970;
  v24[0] = &unk_1E6CA5188;
  v24[1] = &unk_1E6CA5188;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v20, 8.5);
  v22 = v21;

  *((_QWORD *)&xmmword_1EF1749F8 + 1) = 0;
  qword_1EF174A08 = v22;
  qword_1EF174A10 = 0;
  *(_QWORD *)&xmmword_1EF174A18 = v22;

}

void ___LayoutConstants_block_invoke_47(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:", 15.5);
  _LayoutConstants___constants_0_8 = v2;

}

void ___LayoutConstants_block_invoke_48(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKShowGossamerUI(v3);
  v27[0] = &unk_1E6C9FA78;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = &unk_1E6C9FA90;
  v28[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 1.5);
  v9 = v8;

  _LayoutConstants___constantsGraphicCircular_7 = v9;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 6.0, 7.0);
  _LayoutConstants___constantsGraphicExtraLarge_7 = v10;
  objc_msgSend(v4, "setRoundingBehavior:", 3);
  objc_msgSend(off_1E6BCA6C0, "defaultSecondConfigurationForDevice:", v3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_1EF174B58;
  qword_1EF174B58 = v11;

  objc_msgSend((id)qword_1EF174B58, "setHandWidth:", 2.5);
  objc_msgSend(v4, "scaledValue:", 11.0);
  objc_msgSend((id)qword_1EF174B58, "setHandLength:");
  objc_msgSend((id)qword_1EF174B58, "setPegRadius:", 1.0);
  objc_msgSend((id)qword_1EF174B58, "setPegStrokeWidth:", 1.0);
  objc_msgSend((id)qword_1EF174B58, "setRoundedSecondHand:", 1);
  objc_msgSend((id)qword_1EF174B58, "setExcludeSecondTail:", 1);
  v13 = (void *)qword_1EF174B58;
  objc_msgSend((id)qword_1EF174B58, "radialShadowOpacity");
  objc_msgSend(v13, "setRadialShadowOpacity:", v14 * 0.75);
  v15 = (void *)qword_1EF174B58;
  objc_msgSend((id)qword_1EF174B58, "dropShadowOpacity");
  objc_msgSend(v15, "setDropShadowOpacity:", v16 * 1.5);
  objc_msgSend(off_1E6BCA6C0, "defaultSecondConfigurationForDevice:", v3);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)qword_1EF174B60;
  qword_1EF174B60 = v17;

  objc_msgSend((id)qword_1EF174B60, "setHandWidth:", 2.5);
  objc_msgSend(v4, "scaledValue:", 19.5);
  objc_msgSend((id)qword_1EF174B60, "setHandLength:");
  objc_msgSend((id)qword_1EF174B60, "setPegRadius:", 1.0);
  objc_msgSend((id)qword_1EF174B60, "setPegStrokeWidth:", 1.0);
  objc_msgSend((id)qword_1EF174B60, "setRoundedSecondHand:", 1);
  objc_msgSend((id)qword_1EF174B60, "setExcludeSecondTail:", 1);
  v19 = (void *)qword_1EF174B60;
  objc_msgSend((id)qword_1EF174B60, "radialShadowOpacity");
  objc_msgSend(v19, "setRadialShadowOpacity:", v20 * 0.75);
  v21 = (void *)qword_1EF174B60;
  objc_msgSend((id)qword_1EF174B60, "dropShadowOpacity");
  objc_msgSend(v21, "setDropShadowOpacity:", v22 * 1.5);
  objc_msgSend(off_1E6BCA6C0, "defaultSecondConfigurationForDevice:", v3);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)qword_1EF174B70;
  qword_1EF174B70 = v23;

  objc_msgSend((id)qword_1EF174B70, "setHandWidth:", 6.0);
  objc_msgSend(v4, "scaledValue:", 31.0);
  objc_msgSend((id)qword_1EF174B70, "setHandLength:");
  objc_msgSend((id)qword_1EF174B70, "setPegRadius:", 3.0);
  objc_msgSend((id)qword_1EF174B70, "setPegStrokeWidth:", 3.0);
  objc_msgSend((id)qword_1EF174B70, "setRoundedSecondHand:", 1);
  objc_msgSend((id)qword_1EF174B70, "setExcludeSecondTail:", 1);
  objc_msgSend((id)qword_1EF174B70, "setRadialShadowOpacity:", 0.3);
  objc_msgSend((id)qword_1EF174B70, "setRadialShadowRadius:", 10.0);
  objc_msgSend((id)qword_1EF174B70, "setSmoothingRadius:", 5.0);
  objc_msgSend(off_1E6BCA6C0, "defaultSecondConfigurationForDevice:", v3);
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)qword_1EF174B78;
  qword_1EF174B78 = v25;

  objc_msgSend((id)qword_1EF174B78, "setHandWidth:", 6.0);
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 56.0, 60.0);
  objc_msgSend((id)qword_1EF174B78, "setHandLength:");
  objc_msgSend((id)qword_1EF174B78, "setPegRadius:", 3.0);
  objc_msgSend((id)qword_1EF174B78, "setPegStrokeWidth:", 3.0);
  objc_msgSend((id)qword_1EF174B78, "setRoundedSecondHand:", 1);
  objc_msgSend((id)qword_1EF174B78, "setExcludeSecondTail:", 1);
  objc_msgSend((id)qword_1EF174B78, "setRadialShadowOpacity:", 0.3);
  objc_msgSend((id)qword_1EF174B78, "setRadialShadowRadius:", 10.0);
  objc_msgSend((id)qword_1EF174B78, "setSmoothingRadius:", 5.0);

}

void ___LayoutConstants_block_invoke_49(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = NTKWhistlerSubdialComplicationEditingInset(v3);

  _LayoutConstants___constants_0_9 = *(_QWORD *)&v4;
  _LayoutConstants___constants_1_7 = 0x4046800000000000;
  objc_msgSend(v6, "scaledValue:", 38.0);
  _LayoutConstants___constants_2_7 = v5;

}

void ___LayoutConstants_block_invoke_50(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float64_t v26;
  float64x2_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
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
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  _QWORD v157[2];
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[2];
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[2];
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[3];
  _QWORD v183[3];
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[3];
  _QWORD v189[3];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[3];
  _QWORD v195[3];
  _QWORD v196[2];
  _QWORD v197[4];

  v197[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScale:forSizeClass:", 3, 1.13580247);
  v196[0] = &unk_1E6C9FBB0;
  v196[1] = &unk_1E6C9FBC8;
  v197[0] = &unk_1E6CA5218;
  v197[1] = &unk_1E6CA5228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v197, v196, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 6.0);
  _LayoutConstants__constants_1 = v4;

  v194[0] = &unk_1E6C9FBB0;
  v194[1] = &unk_1E6C9FBE0;
  v195[0] = &unk_1E6CA5238;
  v195[1] = &unk_1E6CA5248;
  v194[2] = &unk_1E6C9FBC8;
  v195[2] = &unk_1E6C9FBF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v194, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 77.5);
  qword_1EF174C00 = v6;

  v192[0] = &unk_1E6C9FBB0;
  v192[1] = &unk_1E6C9FBC8;
  v193[0] = &unk_1E6CA5258;
  v193[1] = &unk_1E6CA5268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, -31.5);
  qword_1EF174C88 = 0x3FE0000000000000;
  qword_1EF174C90 = v8;

  objc_msgSend(v2, "constantValue:withOverride:forSizeClass:", 0, 0.0, 0.5);
  v10 = v9;
  v190[0] = &unk_1E6C9FBB0;
  v190[1] = &unk_1E6C9FBC8;
  v191[0] = &unk_1E6CA5278;
  v191[1] = &unk_1E6CA5288;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v191, v190, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v11, -39.0);
  qword_1EF174C98 = v10;
  unk_1EF174CA0 = v12;

  v188[0] = &unk_1E6C9FBB0;
  v153 = xmmword_1B755EEF0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v153, "{CGPoint=dd}");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v13;
  v188[1] = &unk_1E6C9FBE0;
  v152 = xmmword_1B755EF00;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v152, "{CGPoint=dd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v189[1] = v14;
  v188[2] = &unk_1E6C9FBC8;
  v151 = xmmword_1B755EF10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v151, "{CGPoint=dd}");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v189[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, v188, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v16, 37.5, 59.5);
  qword_1EF174D98 = v17;
  unk_1EF174DA0 = v18;

  objc_msgSend(v2, "scaledSize:", 24.0, 8.5);
  *(_QWORD *)&xmmword_1EF174DD8 = v19;
  *((_QWORD *)&xmmword_1EF174DD8 + 1) = v20;
  objc_msgSend(v2, "scaledPoint:", 9.5, 28.5);
  __asm { FMOV            V3.2D, #0.5 }
  v27.f64[1] = v26;
  xmmword_1EF174DA8 = (__int128)vaddq_f64(v27, vmulq_f64((float64x2_t)xmmword_1EF174DD8, _Q3));
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, 34.5, 51.0, 37.0, 55.5);
  qword_1EF174DB8 = v28;
  unk_1EF174DC0 = v29;
  v186[0] = &unk_1E6C9FBB0;
  v150 = xmmword_1B755EF20;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v150, "{CGSize=dd}");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = v30;
  v186[1] = &unk_1E6C9FBC8;
  v149 = xmmword_1B755EF30;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v149, "{CGSize=dd}");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v187[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v187, v186, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledSize:withOverrides:", v32, 48.0, 25.0);
  qword_1EF174CA8 = v33;
  unk_1EF174CB0 = v34;

  v184[0] = &unk_1E6C9FBB0;
  v184[1] = &unk_1E6C9FBC8;
  v185[0] = &unk_1E6CA5298;
  v185[1] = &unk_1E6CA52A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v185, v184, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v35, 78.0);
  qword_1EF174CB8 = v36;

  objc_msgSend(v2, "scaledValue:", 42.0);
  qword_1EF174CC0 = v37;
  v182[0] = &unk_1E6C9FBB0;
  v182[1] = &unk_1E6C9FBE0;
  v183[0] = &unk_1E6CA52B8;
  v183[1] = &unk_1E6CA52C8;
  v182[2] = &unk_1E6C9FBC8;
  v183[2] = &unk_1E6CA52D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v183, v182, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v38, 69.0);
  qword_1EF174CC8 = v39;

  v180[0] = &unk_1E6C9FBB0;
  v180[1] = &unk_1E6C9FBC8;
  v181[0] = &unk_1E6CA52E8;
  v181[1] = &unk_1E6CA52F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v181, v180, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v40, 36.5);
  qword_1EF174CD0 = v41;

  v178[0] = &unk_1E6C9FBB0;
  v148 = xmmword_1B755EF40;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v148, "{CGPoint=dd}");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v42;
  v178[1] = &unk_1E6C9FBC8;
  v147 = xmmword_1B755EF50;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v147, "{CGPoint=dd}");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v179[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, v178, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v44, 2.0, -64.5);
  qword_1EF174C08 = v45;
  unk_1EF174C10 = v46;

  v176[0] = &unk_1E6C9FBB0;
  v146 = xmmword_1B755EF60;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v146, "{CGPoint=dd}");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = v47;
  v176[1] = &unk_1E6C9FBC8;
  v145 = xmmword_1B755EF70;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v145, "{CGPoint=dd}");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v177[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v49, 60.0, -33.5);
  qword_1EF174C18 = v50;
  unk_1EF174C20 = v51;

  v174[0] = &unk_1E6C9FBB0;
  v144 = xmmword_1B755EF80;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v144, "{CGPoint=dd}");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v175[0] = v52;
  v174[1] = &unk_1E6C9FBC8;
  v143 = xmmword_1B755EF90;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v143, "{CGPoint=dd}");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v175[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v54, 68.5, 0.5);
  qword_1EF174C28 = v55;
  unk_1EF174C30 = v56;

  v172[0] = &unk_1E6C9FBB0;
  v142 = xmmword_1B755EFA0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v142, "{CGPoint=dd}");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v173[0] = v57;
  v172[1] = &unk_1E6C9FBC8;
  v141 = xmmword_1B755EFB0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v141, "{CGPoint=dd}");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v173[1] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, v172, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v59, 60.0, 36.0);
  qword_1EF174C38 = v60;
  unk_1EF174C40 = v61;

  v170[0] = &unk_1E6C9FBB0;
  v140 = xmmword_1B755EFC0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v140, "{CGPoint=dd}");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v171[0] = v62;
  v170[1] = &unk_1E6C9FBC8;
  v139 = xmmword_1B755EFD0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v139, "{CGPoint=dd}");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v171[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, v170, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v64, 2.0, 64.5);
  qword_1EF174C48 = v65;
  unk_1EF174C50 = v66;

  v168[0] = &unk_1E6C9FBB0;
  v138 = xmmword_1B755EFE0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v138, "{CGPoint=dd}");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v67;
  v168[1] = &unk_1E6C9FBC8;
  v137 = xmmword_1B755EFF0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v137, "{CGPoint=dd}");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v169[1] = v68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v168, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v69, -55.0, 36.0);
  qword_1EF174C58 = v70;
  unk_1EF174C60 = v71;

  v166[0] = &unk_1E6C9FBB0;
  v136 = xmmword_1B755F000;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v136, "{CGPoint=dd}");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = v72;
  v166[1] = &unk_1E6C9FBC8;
  v135 = xmmword_1B755F010;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v135, "{CGPoint=dd}");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v167[1] = v73;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v167, v166, 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v74, -66.5, 0.5);
  qword_1EF174C68 = v75;
  unk_1EF174C70 = v76;

  v164[0] = &unk_1E6C9FBB0;
  v134 = xmmword_1B755F020;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v134, "{CGPoint=dd}");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = v77;
  v164[1] = &unk_1E6C9FBC8;
  v133 = xmmword_1B755F030;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v133, "{CGPoint=dd}");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v165[1] = v78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, v164, 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v79, -54.0, -33.5);
  qword_1EF174C78 = v80;
  unk_1EF174C80 = v81;

  v162[0] = &unk_1E6C9FBB0;
  v132 = xmmword_1B755F040;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v132, "{CGPoint=dd}");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v82;
  v162[1] = &unk_1E6C9FBC8;
  v131 = xmmword_1B755F050;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v131, "{CGPoint=dd}");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v163[1] = v83;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v84, 4.5, -45.0);
  qword_1EF174CD8 = v85;
  unk_1EF174CE0 = v86;

  v160[0] = &unk_1E6C9FBB0;
  v130 = xmmword_1B755F060;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v130, "{CGPoint=dd}");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = v87;
  v160[1] = &unk_1E6C9FBC8;
  v129 = xmmword_1B755F070;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v129, "{CGPoint=dd}");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v161[1] = v88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v89, 40.0, 20.0);
  qword_1EF174CE8 = v90;
  unk_1EF174CF0 = v91;

  v158[0] = &unk_1E6C9FBB0;
  v128 = xmmword_1B755F080;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v128, "{CGPoint=dd}");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v92;
  v158[1] = &unk_1E6C9FBC8;
  v127 = xmmword_1B755F090;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v127, "{CGPoint=dd}");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v159[1] = v93;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v94, -5.5, 51.5);
  qword_1EF174CF8 = v95;
  unk_1EF174D00 = v96;

  v156[0] = &unk_1E6C9FBB0;
  v126 = xmmword_1B755F0A0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v126, "{CGPoint=dd}");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v97;
  v156[1] = &unk_1E6C9FBC8;
  v125 = xmmword_1B755F0B0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v125, "{CGPoint=dd}");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v157[1] = v98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledPoint:withOverrides:", v99, -37.0, 20.0);
  qword_1EF174D08 = v100;
  unk_1EF174D10 = v101;

  objc_msgSend(v2, "scaledPoint:", 56.5, 43.5);
  qword_1EF174D18 = v102;
  unk_1EF174D20 = v103;
  objc_msgSend(v2, "scaledPoint:", 73.5, 78.0);
  qword_1EF174D28 = v104;
  unk_1EF174D30 = v105;
  objc_msgSend(v2, "scaledPoint:", 50.0, 95.0);
  qword_1EF174D38 = v106;
  unk_1EF174D40 = v107;
  objc_msgSend(v2, "scaledPoint:", 34.5, 78.0);
  qword_1EF174D48 = v108;
  unk_1EF174D50 = v109;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, 3.0, -38.0, -3.5, -39.5);
  qword_1EF174D58 = v110;
  unk_1EF174D60 = v111;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, 34.0, 17.5, 35.5, 18.5);
  qword_1EF174D68 = v112;
  unk_1EF174D70 = v113;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, -5.0, 45.0, -5.5, 47.0);
  qword_1EF174D78 = v114;
  unk_1EF174D80 = v115;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, -31.5, 17.5, -33.0, 18.0);
  qword_1EF174D88 = v116;
  unk_1EF174D90 = v117;
  v154[0] = &unk_1E6C9FBB0;
  v124 = xmmword_1B755F0C0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v124, "{CGSize=dd}");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = &unk_1E6C9FBC8;
  v155[0] = v118;
  v123 = xmmword_1B755F0D0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v123, "{CGSize=dd}");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v155[1] = v119;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 2);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledSize:withOverrides:", v120, 40.0, 14.5);
  qword_1EF174DC8 = v121;
  unk_1EF174DD0 = v122;

}

void ___LayoutConstants_block_invoke_51(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 3, 67.0, 73.0);
  _LayoutConstants___constants_0_10 = v2;

}

void ___LayoutConstants_block_invoke_52(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = &unk_1E6CA1320;
  v22[1] = &unk_1E6CA1338;
  v23[0] = &unk_1E6CA5498;
  v23[1] = &unk_1E6CA54A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 16.5);
  *(_QWORD *)&_LayoutConstants___constants_12 = v4;

  v20[0] = &unk_1E6CA1320;
  v20[1] = &unk_1E6CA1350;
  v21[0] = &unk_1E6CA54B8;
  v21[1] = &unk_1E6CA54C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 8.5);
  *((_QWORD *)&_LayoutConstants___constants_12 + 1) = v6;

  v18[0] = &unk_1E6CA1320;
  v18[1] = &unk_1E6CA1350;
  v19[0] = &unk_1E6CA54D8;
  v19[1] = &unk_1E6CA54D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 8.5);
  qword_1EF1759D0 = v8;

  objc_msgSend(v2, "scaledValue:", 9.0);
  qword_1EF1759D8 = v9;
  v16[0] = &unk_1E6CA1320;
  v16[1] = &unk_1E6CA1338;
  v17[0] = &unk_1E6CA54E8;
  v17[1] = &unk_1E6CA54B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v10, 4.0);
  *(_QWORD *)&xmmword_1EF1759E0 = v11;

  v14[0] = &unk_1E6CA1320;
  v14[1] = &unk_1E6CA1338;
  v15[0] = &unk_1E6CA54F8;
  v15[1] = &unk_1E6CA5508;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v12, 111.0);
  *((_QWORD *)&xmmword_1EF1759E0 + 1) = v13;

}

void ___LayoutConstants_block_invoke_53(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = &unk_1E6CA15D8;
  v7[1] = &unk_1E6CA15F0;
  v8[0] = &unk_1E6CA56D8;
  v8[1] = &unk_1E6CA56E8;
  v7[2] = &unk_1E6CA1608;
  v8[2] = &unk_1E6CA56E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 13.0);
  _LayoutConstants___constants_0_11 = v4;

  if (CLKLanguageIsTallScript())
    *(double *)&_LayoutConstants___constants_0_11 = *(double *)&_LayoutConstants___constants_0_11 + -1.0;
  objc_msgSend(v2, "scaledValue:", 11.0);
  _LayoutConstants___constants_1_8 = v5;
  objc_msgSend(v2, "scaledValue:", 5.0);
  _LayoutConstants___constants_2_8 = v6;

}

void ___LayoutConstants_block_invoke_54(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  v3 = objc_msgSend(v2, "sizeClass");
  +[NTKAnalogUtilities dialSizeForDevice:](NTKAnalogUtilities, "dialSizeForDevice:", v2);
  *(double *)&_LayoutConstants___constants_13 = v4 + -1.0;
  *((_QWORD *)&_LayoutConstants___constants_13 + 1) = 0;
  unk_1EF175DB0 = 0;
  *(double *)&qword_1EF175DB8 = v4 + -1.0;
  *(double *)&xmmword_1EF175DC0 = v4 + -1.0;
  v5 = -3.0;
  if (!v3)
    v5 = -2.0;
  *((_QWORD *)&xmmword_1EF175DC0 + 1) = 0;
  qword_1EF175DD0 = *(_QWORD *)&v5;
  *(_OWORD *)algn_1EF175DD8 = *MEMORY[0x1E0C9D538];
  *((_QWORD *)&xmmword_1EF175DE0 + 1) = 0x3FF0000000000000;
  objc_msgSend(v2, "screenBounds");
  v7 = v6;
  +[NTKAnalogUtilities dialSizeForDevice:](NTKAnalogUtilities, "dialSizeForDevice:", v2);
  *(float *)&v8 = v7 / v8;
  dword_1EF175DF0 = LODWORD(v8);
  v9 = objc_msgSend(v2, "deviceCategory");
  v10 = 10;
  if (v9 != 1)
    v10 = 24;
  qword_1EF175DF8 = v10;
  v11 = objc_msgSend(v2, "deviceCategory");

  v12 = 30;
  if (v11 == 1)
    v12 = 24;
  qword_1EF175E00 = v12;
}

double ___LayoutConstants_block_invoke_55(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double result;
  double v11;
  id v12;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_8 = NTKWhistlerSubdialComplicationContentDiameter(v3);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_8 + 1) = 0x3FF8000000000000;
  *(double *)&xmmword_1EF175E88 = NTKWhistlerSubdialComplicationContentDiameter(v3) * 0.5;
  *((_QWORD *)&xmmword_1EF175E88 + 1) = 0x3FF0000000000000;
  v4 = NTKWhistlerSubdialComplicationContentDiameter(v3);
  objc_msgSend(v12, "scaledValue:withOverride:forSizeClass:", 3, 26.0, 29.0);
  qword_1EF175E78 = *(_QWORD *)&v4;
  unk_1EF175E80 = v5;
  objc_msgSend(v12, "scaledValue:", 4.5);
  qword_1EF175E98 = v6;
  qword_1EF175EA0 = 0x3FF0000000000000;
  objc_msgSend(v12, "scaledValue:", 4.0);
  *(_QWORD *)&xmmword_1EF175EA8 = v7;
  *(__int128 *)((char *)&xmmword_1EF175EA8 + 8) = (__int128)vdupq_n_s64(0x3FE3333333333333uLL);
  qword_1EF175EC0 = 0x3FD6666666666666;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v11 = v8;
  xmmword_1EF175EE8 = xmmword_1EF175E88;
  unk_1EF175EF8 = *(_OWORD *)&qword_1EF175E98;
  xmmword_1EF175F08 = xmmword_1EF175EA8;
  unk_1EF175F18 = unk_1EF175EB8;
  _LayoutConstants___constantsGraphicExtraLarge_8 = _LayoutConstants___constantsGraphicCircular_8;
  xmmword_1EF175ED8 = *(_OWORD *)&qword_1EF175E78;
  *(_QWORD *)&_LayoutConstants___constantsGraphicExtraLarge_8 = NTKGraphicExtraLargeComplicationContentDiameter(v3);
  *((double *)&_LayoutConstants___constantsGraphicExtraLarge_8 + 1) = v11
                                                                    * *((double *)&_LayoutConstants___constantsGraphicExtraLarge_8
                                                                      + 1);
  v9 = NTKGraphicExtraLargeComplicationContentDiameter(v3);

  *(double *)&xmmword_1EF175EE8 = v9 * 0.5;
  xmmword_1EF175ED8 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF175ED8, v11);
  *(__int128 *)((char *)&xmmword_1EF175EE8 + 8) = (__int128)vmulq_n_f64(*(float64x2_t *)((char *)&xmmword_1EF175EE8 + 8), v11);
  unk_1EF175F00 = vmulq_n_f64(unk_1EF175F00, v11);
  *(__int128 *)((char *)&xmmword_1EF175F08 + 8) = (__int128)vmulq_n_f64(*(float64x2_t *)((char *)&xmmword_1EF175F08 + 8), v11);

  return result;
}

void ___LayoutConstants_block_invoke_56(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaledValue:", 15.5);
  *(_QWORD *)&_LayoutConstants___constants_14 = v2;
  objc_msgSend(v10, "scaledValue:withOverride:forSizeClass:", 3, 6.0, 8.0);
  qword_1EF175F58 = v3;
  __asm { FMOV            V0.2D, #10.0 }
  *(__int128 *)((char *)&_LayoutConstants___constants_14 + 8) = _Q0;
  objc_msgSend(v10, "scaledValue:withOverride:forSizeClass:", 3, 67.0, 73.0);
  qword_1EF175F60 = v9;

}

void ___LayoutConstants_block_invoke_57(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:", 15.5);
  _LayoutConstants___constants_0_12 = v2;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 6.0, 8.0);
  _LayoutConstants___constants_1_9 = v3;

}

void ___LayoutConstants_block_invoke_58(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scaledValue:", 9.0);
  *(_QWORD *)&_LayoutConstants__constants_2 = v4;
  objc_msgSend(v13, "scaledValue:", 9.0);
  *((_QWORD *)&_LayoutConstants__constants_2 + 1) = v5;
  objc_msgSend(v13, "scaledValue:", 36.0);
  qword_1EF175FC0 = v6;
  objc_msgSend(v13, "scaledValue:", 22.5);
  qword_1EF175FC8 = v7;
  objc_msgSend(v13, "scaledValue:", 10.0);
  qword_1EF175FE0 = v8;
  objc_msgSend(v13, "scaledValue:", 17.0);
  qword_1EF175FE8 = v9;
  objc_msgSend(v13, "scaledValue:", 4.0);
  *(_QWORD *)&xmmword_1EF175FD0 = v10;
  *((_QWORD *)&xmmword_1EF175FD0 + 1) = 0x3FEE76C4090CD1D0;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v12 = v11;

  xmmword_1EF176010 = xmmword_1EF175FD0;
  _LayoutConstants__constantsGraphicExtraLarge_0 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants__constants_2, v12);
  unk_1EF176000 = vmulq_n_f64(*(float64x2_t *)&qword_1EF175FC0, v12);
  xmmword_1EF176020 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_1EF175FE0, v12);
  *(double *)&xmmword_1EF176010 = v12 * *(double *)&xmmword_1EF175FD0;

}

void ___LayoutConstants_block_invoke_59(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = &unk_1E6CA16B0;
  v11[1] = &unk_1E6CA16C8;
  v12[0] = &unk_1E6CA56F8;
  v12[1] = &unk_1E6CA56F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 8.5);
  v5 = v4;

  _LayoutConstants_constants_1_7 = v5;
  _LayoutConstants_constants_3_5 = v5;
  v9[0] = &unk_1E6CA16B0;
  v9[1] = &unk_1E6CA16E0;
  v10[0] = &unk_1E6CA5708;
  v10[1] = &unk_1E6CA5718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 15.5);
  v8 = v7;

  _LayoutConstants_constants_5_2 = v8;
  _LayoutConstants_constants_7_2 = v8;

}

void ___LayoutConstants_block_invoke_60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 8, 9.0, 10.0);
  _LayoutConstants_constants_0_7 = v2;
  objc_msgSend(v7, "scaledValue:", 7.5);
  _LayoutConstants_constants_1_8 = v3;
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 3, 14.0, 15.0);
  _LayoutConstants_constants_2_7 = v4;
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 8, 9.0, 10.0);
  _LayoutConstants_constants_3_6 = v5;
  objc_msgSend(v7, "scaledValue:", 1.0);
  _LayoutConstants_constants_4_4 = v6;

}

void ___LayoutConstants_block_invoke_61(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledValue:withOverride:forSizeClass:", 3, 18.0, 19.5);
  _LayoutConstants___constants_0_13 = v2;
  objc_msgSend(v6, "scaledValue:", 17.0);
  _LayoutConstants___constants_1_10 = v3;
  objc_msgSend(v6, "scaledValue:", 15.5);
  _LayoutConstants___constants_2_9 = v4;
  objc_msgSend(v6, "scaledValue:", 62.0);
  _LayoutConstants___constants_3_4 = v5;

}

void ___LayoutConstants_block_invoke_62(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[NTKAnalogUtilities largeDialDiameterForDevice:](NTKAnalogUtilities, "largeDialDiameterForDevice:", v3);
  v5 = v4;

  _LayoutConstants_constants_0_8 = v5;
  objc_msgSend(v9, "scaledValue:withOverride:forSizeClass:", 3, 17.0, 19.0);
  _LayoutConstants_constants_1_9 = v6;
  CLKDegreesToRadians();
  _LayoutConstants_constants_2_8 = v7;
  CLKDegreesToRadians();
  _LayoutConstants_constants_3_7 = v8;

}

void ___LayoutConstants_block_invoke_63(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  double v7;
  id v8;

  v2 = a2;
  *((_QWORD *)&_LayoutConstants_layoutConstants_1 + 1) = 0x4010000000000000;
  qword_1EF176230 = 0x4008000000000000;
  *((_QWORD *)&xmmword_1EF176238 + 1) = 0x4008000000000000;
  v8 = v2;
  v3 = objc_msgSend(v2, "deviceCategory");
  if ((unint64_t)(v3 - 3) < 3)
  {
    *(_QWORD *)&_LayoutConstants_layoutConstants_1 = 0x401C000000000000;
    qword_1EF176228 = 0x401C000000000000;
    *(_QWORD *)&xmmword_1EF176238 = 0x4014000000000000;
    v4 = v8;
LABEL_8:
    objc_msgSend(v4, "screenCornerRadius");
    v6 = v8;
    goto LABEL_9;
  }
  if (v3 == 2)
  {
    *(_QWORD *)&_LayoutConstants_layoutConstants_1 = 0x4026000000000000;
    qword_1EF176228 = 0x4026000000000000;
    *(_QWORD *)&xmmword_1EF176238 = 0x401C000000000000;
    v4 = v8;
    goto LABEL_8;
  }
  v5 = v3 == 1;
  v6 = v8;
  if (!v5)
    goto LABEL_10;
  *(_QWORD *)&_LayoutConstants_layoutConstants_1 = 0x4026000000000000;
  qword_1EF176228 = 0x4028000000000000;
  *(_QWORD *)&xmmword_1EF176238 = 0x4020000000000000;
  v7 = 12.0;
LABEL_9:
  qword_1EF176248 = *(_QWORD *)&v7;
LABEL_10:

}

void ___LayoutConstants_block_invoke_64(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[6];
  _QWORD v41[6];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKAnalogUtilities whistlerMediumDialDiameterForDevice:](NTKAnalogUtilities, "whistlerMediumDialDiameterForDevice:", v3);
  *(_QWORD *)&_LayoutConstants___constants_15 = v5;
  v42[0] = &unk_1E6CA1818;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 15.5, 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = &unk_1E6CA1830;
  v43[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 15.5, 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledSize:withOverrides:", v8, 13.0, 14.0);
  *((_QWORD *)&_LayoutConstants___constants_15 + 1) = v9;
  unk_1EF1762C8 = v10;

  v40[0] = &unk_1E6CA1818;
  v40[1] = &unk_1E6CA1848;
  v41[0] = &unk_1E6CA5728;
  v41[1] = &unk_1E6CA5738;
  v40[2] = &unk_1E6CA1860;
  v40[3] = &unk_1E6CA1830;
  v41[2] = &unk_1E6CA5748;
  v41[3] = &unk_1E6CA5758;
  v40[4] = &unk_1E6CA1878;
  v40[5] = &unk_1E6CA1890;
  v41[4] = &unk_1E6CA5768;
  v41[5] = &unk_1E6CA5758;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v11, 5.0);
  qword_1EF1762D0 = v12;

  v38[0] = &unk_1E6CA1818;
  v38[1] = &unk_1E6CA1830;
  v39[0] = &unk_1E6CA5778;
  v39[1] = &unk_1E6CA5788;
  v38[2] = &unk_1E6CA1878;
  v38[3] = &unk_1E6CA1890;
  v39[2] = &unk_1E6CA5798;
  v39[3] = &unk_1E6CA5788;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v13, 15.0);
  *(_QWORD *)&xmmword_1EF1762D8 = v14;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 42.0, 47.0);
  *((_QWORD *)&xmmword_1EF1762D8 + 1) = v15;
  qword_1EF1762E8 = NTKWhistlerSubdialComplicationContentDiameter(v3);
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 69.0, 78.0);
  qword_1EF1762F0 = v16;
  v36[0] = &unk_1E6CA1818;
  v36[1] = &unk_1E6CA1848;
  v37[0] = &unk_1E6CA5728;
  v37[1] = &unk_1E6CA57A8;
  v36[2] = &unk_1E6CA1860;
  v36[3] = &unk_1E6CA1830;
  v37[2] = &unk_1E6CA57B8;
  v37[3] = &unk_1E6CA5758;
  v36[4] = &unk_1E6CA1878;
  v36[5] = &unk_1E6CA1890;
  v37[4] = &unk_1E6CA57A8;
  v37[5] = &unk_1E6CA5758;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v17, 6.0);
  *(_QWORD *)&xmmword_1EF1762F8 = v18;

  __asm { FMOV            V0.2D, #4.0 }
  *(__int128 *)((char *)&xmmword_1EF1762F8 + 8) = _Q0;
  unk_1EF176310 = _Q0;
  v34[0] = &unk_1E6CA1818;
  v34[1] = &unk_1E6CA1830;
  v35[0] = &unk_1E6CA57C8;
  v35[1] = &unk_1E6CA57D8;
  v34[2] = &unk_1E6CA1878;
  v34[3] = &unk_1E6CA1890;
  v35[2] = &unk_1E6CA57C8;
  v35[3] = &unk_1E6CA57E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v24, 0.5);
  *((_QWORD *)&xmmword_1EF176318 + 1) = v25;

  v32[0] = &unk_1E6CA1818;
  v32[1] = &unk_1E6CA1830;
  v33[0] = &unk_1E6CA57F8;
  v33[1] = &unk_1E6CA57D8;
  v32[2] = &unk_1E6CA1878;
  v32[3] = &unk_1E6CA1890;
  v33[2] = &unk_1E6CA57F8;
  v33[3] = &unk_1E6CA57B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v26, 2.0);
  qword_1EF176328 = v27;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 188.0, 213.0);
  qword_1EF176330 = v28;
  xmmword_1EF176338 = xmmword_1B755E880;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, -23.0, -26.0);
  qword_1EF176348 = v29;
  qword_1EF176350 = 0x4020000000000000;
  objc_msgSend(v3, "screenBounds");
  +[NTKGossamerColorPalette contentScaleForTintedBackground](NTKGossamerColorPalette, "contentScaleForTintedBackground");
  CLKFloorForDevice();
  v31 = v30;

  qword_1EF176358 = v31;
}

void ___LayoutConstants_block_invoke_65(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRoundingBehavior:", 3);
  _LayoutConstants___constants_16 = 0x401A000000000000;
  objc_msgSend(v11, "scaledValue:withOverride:forSizeClass:", 3, 22.5, 25.75);
  qword_1EF176380 = v2;
  xmmword_1EF176388 = xmmword_1B755FED0;
  unk_1EF176398 = xmmword_1B755D600;
  xmmword_1EF1763A8 = xmmword_1B755FEE0;
  unk_1EF1763B8 = xmmword_1B755FEF0;
  __asm { FMOV            V0.2D, #1.0 }
  v10 = _Q0;
  xmmword_1EF1763C8 = _Q0;
  qword_1EF1763D8 = 0x401A000000000000;
  objc_msgSend(v11, "scaledValue:withOverride:forSizeClass:", 3, 41.5, 47.0);
  qword_1EF1763E0 = v8;
  xmmword_1EF1763E8 = xmmword_1B755FF00;
  unk_1EF1763F8 = xmmword_1B755D600;
  xmmword_1EF176408 = xmmword_1B755FEE0;
  unk_1EF176418 = xmmword_1B755FEF0;
  xmmword_1EF176428 = v10;
  qword_1EF176438 = 0x3FF4000000000000;
  objc_msgSend(v11, "scaledValue:withOverride:forSizeClass:", 3, 50.5, 58.5);
  qword_1EF176440 = v9;
  xmmword_1EF176448 = xmmword_1B755FF10;
  unk_1EF176458 = xmmword_1B755FF20;
  xmmword_1EF176468 = xmmword_1B755FF30;
  unk_1EF176478 = xmmword_1B755FF40;
  qword_1EF176488 = 0x4000000000000000;

}

void ___LayoutConstants_block_invoke_66(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[2];
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  void *v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = &unk_1E6CA18A8;
  v89[0] = &unk_1E6CA5808;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 13.5);
  _LayoutConstants___constants_17 = v6;

  v86[0] = &unk_1E6CA18C0;
  v86[1] = &unk_1E6CA18A8;
  v87[0] = &unk_1E6CA5818;
  v87[1] = &unk_1E6CA5828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v7, 9.5);
  qword_1EF176588 = v8;

  v84[0] = &unk_1E6CA18C0;
  v84[1] = &unk_1E6CA18A8;
  v85[0] = &unk_1E6CA5838;
  v85[1] = &unk_1E6CA5848;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v9, 17.0);
  qword_1EF176590 = v10;

  v82[0] = &unk_1E6CA18C0;
  v82[1] = &unk_1E6CA18A8;
  v83[0] = &unk_1E6CA5858;
  v83[1] = &unk_1E6CA5868;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v11, 45.0);
  qword_1EF176598 = v12;

  v80[0] = &unk_1E6CA18C0;
  v80[1] = &unk_1E6CA18A8;
  v81[0] = &unk_1E6CA5878;
  v81[1] = &unk_1E6CA5888;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v13, 128.0);
  qword_1EF1765A0 = v14;

  v78 = &unk_1E6CA18A8;
  v79 = &unk_1E6CA5898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v15, 22.0);
  qword_1EF1765B0 = v16;

  v76 = &unk_1E6CA18C0;
  v77 = &unk_1E6CA58A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v17, 2.0);
  qword_1EF1765B8 = v18;

  xmmword_1EF1765C0 = xmmword_1B755FF80;
  qword_1EF1765D0 = 0x402F000000000000;
  v74[0] = &unk_1E6CA18C0;
  v74[1] = &unk_1E6CA18A8;
  v75[0] = &unk_1E6CA5838;
  v75[1] = &unk_1E6CA5848;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v19, 17.0);
  qword_1EF1765D8 = v20;

  v72[0] = &unk_1E6CA18C0;
  v72[1] = &unk_1E6CA18A8;
  v73[0] = &unk_1E6CA58B8;
  v73[1] = &unk_1E6CA58C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v21, 2.5);
  qword_1EF1765E0 = v22;

  qword_1EF1765E8 = qword_1EF1765E0;
  v70[0] = &unk_1E6CA18C0;
  v70[1] = &unk_1E6CA18A8;
  v71[0] = &unk_1E6CA58D8;
  v71[1] = &unk_1E6CA58E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v23, 5.0);
  qword_1EF1765F0 = v24;

  v68[0] = &unk_1E6CA18C0;
  v68[1] = &unk_1E6CA18D8;
  v69[0] = &unk_1E6CA58A8;
  v69[1] = &unk_1E6CA58A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constantValue:withOverrides:", v25, 0.0);
  qword_1EF1765F8 = v26;

  xmmword_1EF176600 = xmmword_1B755FF90;
  unk_1EF176610 = xmmword_1B755FFA0;
  xmmword_1EF176620 = xmmword_1B755FFB0;
  v66[0] = &unk_1E6CA18C0;
  v66[1] = &unk_1E6CA18A8;
  v67[0] = &unk_1E6CA58F8;
  v67[1] = &unk_1E6CA5908;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v27, 12.5);
  *(double *)&qword_1EF1765A8 = v28 - *(double *)&xmmword_1EF176600;

  xmmword_1EF176630 = xmmword_1B755FFC0;
  qword_1EF176640 = 0x4020000000000000;
  v64 = &unk_1E6CA18A8;
  v65 = &unk_1E6CA5918;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v29, 84.0);
  qword_1EF176648 = v30;

  v62 = &unk_1E6CA18A8;
  v63 = &unk_1E6CA5928;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v31, 94.0);
  qword_1EF176650 = v32;

  CLKDegreesToRadians();
  qword_1EF176658 = v33;
  qword_1EF176660 = 0;
  CLKDegreesToRadians();
  qword_1EF176668 = v34;
  CLKDegreesToRadians();
  qword_1EF176670 = v35;
  v60 = &unk_1E6CA18A8;
  v61 = &unk_1E6CA5938;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v36, -17.5);
  qword_1EF176678 = v37;

  v58 = &unk_1E6CA18A8;
  v59 = &unk_1E6CA5948;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v38, 50.0);
  qword_1EF176680 = v39;

  objc_msgSend(v3, "screenBounds");
  v41 = v40 * 0.5;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 82.5, 95.0);
  *(double *)&qword_1EF176688 = v41 - v42;
  objc_msgSend(v3, "screenBounds");
  v44 = v43;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 93.5, 104.5);
  *(double *)&qword_1EF176690 = v44 * 0.5 - v45;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 2.0, 2.0);
  qword_1EF176698 = v46;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 16.5, 16.5);
  qword_1EF1766A0 = v47;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 4.5, 4.5);
  qword_1EF1766A8 = v48;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 15.0, 15.0);
  v50 = v49;
  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 10.0, 10.0);
  qword_1EF1766B0 = v50;
  qword_1EF1766B8 = 0x3FAEB851EB851EB8;
  qword_1EF1766C0 = v51;
  qword_1EF1766C8 = 0x3FAEB851EB851EB8;
  objc_msgSend(v4, "setRoundingBehavior:", 0);
  CLKDegreesToRadians();
  v53 = v52;
  v56[0] = &unk_1E6CA18C0;
  v56[1] = &unk_1E6CA18D8;
  v57[0] = &unk_1E6CA5958;
  v57[1] = &unk_1E6CA5958;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v54, v53);
  qword_1EF1766D0 = v55;

}

void ___LayoutConstants_block_invoke_67(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:", 10.0);
  *(_QWORD *)&_LayoutConstants___constants_18 = v3;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 9.0, 7.0);
  *((_QWORD *)&_LayoutConstants___constants_18 + 1) = v4;
  v35[0] = &unk_1E6CA1BC0;
  v35[1] = &unk_1E6CA1BD8;
  v36[0] = &unk_1E6CA5968;
  v36[1] = &unk_1E6CA5978;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 6.0);
  qword_1EF1767E0 = v6;

  v33[0] = &unk_1E6CA1BC0;
  v33[1] = &unk_1E6CA1BD8;
  v34[0] = &unk_1E6CA5988;
  v34[1] = &unk_1E6CA5988;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 14.0);
  *(_QWORD *)&xmmword_1EF1767F0 = v8;

  v31[0] = &unk_1E6CA1BC0;
  v31[1] = &unk_1E6CA1BD8;
  v32[0] = &unk_1E6CA5998;
  v32[1] = &unk_1E6CA59A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 2.5);
  *((_QWORD *)&xmmword_1EF1767F0 + 1) = v10;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 10.0, 10.0);
  qword_1EF176800 = v11;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 12.0);
  qword_1EF176808 = v12;
  v29[0] = &unk_1E6CA1BF0;
  v29[1] = &unk_1E6CA1C08;
  v30[0] = &unk_1E6CA59B8;
  v30[1] = &unk_1E6CA59B8;
  v29[2] = &unk_1E6CA1C20;
  v29[3] = &unk_1E6CA1C38;
  v30[2] = &unk_1E6CA59B8;
  v30[3] = &unk_1E6CA59B8;
  v29[4] = &unk_1E6CA1C50;
  v30[4] = &unk_1E6CA59B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v13, 1.0);
  *(_OWORD *)algn_1EF176828 = xmmword_1B75600E0;
  *((_QWORD *)&xmmword_1EF176830 + 1) = v14;
  qword_1EF176840 = 0;

  objc_msgSend(v2, "scaledValue:", 11.0);
  qword_1EF1767E8 = v15;
  v27[0] = &unk_1E6CA1BC0;
  v27[1] = &unk_1E6CA1C68;
  v28[0] = &unk_1E6CA59B8;
  v28[1] = &unk_1E6CA59B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v16, 5.0);
  *(_QWORD *)&xmmword_1EF176810 = v17;

  v25[0] = &unk_1E6CA1BC0;
  v25[1] = &unk_1E6CA1C68;
  v26[0] = &unk_1E6CA59C8;
  v26[1] = &unk_1E6CA59C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v18, 6.0);
  *((_QWORD *)&xmmword_1EF176810 + 1) = v19;

  v23[0] = &unk_1E6CA1BF0;
  v23[1] = &unk_1E6CA1C08;
  v24[0] = &unk_1E6CA59B8;
  v24[1] = &unk_1E6CA59D8;
  v23[2] = &unk_1E6CA1C20;
  v23[3] = &unk_1E6CA1C38;
  v24[2] = &unk_1E6CA59E8;
  v24[3] = &unk_1E6CA59D8;
  v23[4] = &unk_1E6CA1C50;
  v24[4] = &unk_1E6CA59E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constantValue:withOverrides:", v20, 0.0);
  qword_1EF176820 = v21;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 13.0, 14.0);
  qword_1EF176848 = v22;

}

void ___LayoutConstants_block_invoke_68(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
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
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  id v18;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scaledValue:", 18.0);
  *(_QWORD *)&_LayoutConstants___constantsGraphicCircular_9 = v4;
  objc_msgSend(v18, "scaledValue:", 15.0);
  *((_QWORD *)&_LayoutConstants___constantsGraphicCircular_9 + 1) = v5;
  objc_msgSend(v18, "scaledValue:", 29.0);
  qword_1EF176B80 = v6;
  objc_msgSend(v18, "scaledValue:withOverride:forSizeClass:", 3, 26.0, 29.0);
  qword_1EF176B88 = v7;
  objc_msgSend(v18, "scaledValue:", 9.0);
  *(_QWORD *)&xmmword_1EF176B90 = v8;
  objc_msgSend(v18, "scaledValue:", 8.0);
  *((_QWORD *)&xmmword_1EF176B90 + 1) = v9;
  objc_msgSend(v18, "scaledValue:withOverride:forSizeClass:", 3, 37.5, 42.0);
  qword_1EF176BA0 = v10;
  objc_msgSend(v18, "scaledValue:withOverride:forSizeClass:", 3, 37.0, 41.5);
  qword_1EF176BA8 = v11;
  objc_msgSend(v18, "scaledValue:withOverride:forSizeClass:", 3, 14.0, 17.0);
  *(_QWORD *)&xmmword_1EF176BB0 = v12;
  objc_msgSend(v18, "scaledValue:", 8.0);
  *((_QWORD *)&xmmword_1EF176BB0 + 1) = v13;
  objc_msgSend(v18, "scaledValue:withOverride:forSizeClass:", 3, 13.5, 14.5);
  *(double *)&qword_1EF176BC0 = v14 * 0.5;
  objc_msgSend(v18, "scaledValue:", 4.0);
  qword_1EF176BC8 = v15;
  qword_1EF176BD0 = 0x3FF0C152382D7365;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v17 = v16;

  _LayoutConstants___constantsGraphicExtraLarge_9 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_9, v17);
  *(float64x2_t *)algn_1EF176BF0 = vmulq_n_f64(*(float64x2_t *)&qword_1EF176B80, v17);
  xmmword_1EF176C00 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF176B90, v17);
  unk_1EF176C10 = vmulq_n_f64(*(float64x2_t *)&qword_1EF176BA0, v17);
  qword_1EF176C40 = qword_1EF176BD0;
  xmmword_1EF176C20 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1EF176BB0, v17);
  unk_1EF176C30 = vmulq_n_f64(*(float64x2_t *)&qword_1EF176BC0, v17);

}

void ___LayoutConstants_block_invoke_69(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:", 19.5);
  *(_QWORD *)&_LayoutConstants___constants_19 = v3;
  objc_msgSend(v2, "scaledValue:", 38.0);
  *((_QWORD *)&_LayoutConstants___constants_19 + 1) = v4;
  v11[0] = &unk_1E6CA2688;
  v11[1] = &unk_1E6CA26A0;
  v12[0] = &unk_1E6CA5A08;
  v12[1] = &unk_1E6CA5A18;
  v11[2] = &unk_1E6CA26B8;
  v11[3] = &unk_1E6CA26D0;
  v12[2] = &unk_1E6CA5A18;
  v12[3] = &unk_1E6CA5A28;
  v11[4] = &unk_1E6CA26E8;
  v12[4] = &unk_1E6CA5A38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 40.0);
  qword_1EF176C88 = v6;

  qword_1EF176C90 = *MEMORY[0x1E0DC1440];
  v9[0] = &unk_1E6CA2700;
  v9[1] = &unk_1E6CA2688;
  v10[0] = &unk_1E6CA5A48;
  v10[1] = &unk_1E6CA5A58;
  v9[2] = &unk_1E6CA26A0;
  v9[3] = &unk_1E6CA26B8;
  v10[2] = &unk_1E6CA5A68;
  v10[3] = &unk_1E6CA5A68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, -0.5);
  qword_1EF176C98 = v8;

}

@end
