@implementation NSUnit

void __43__NSUnit_HKUnit__hk_conversionCoefficient___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
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
  void *v70;
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
  _QWORD v97[26];
  _QWORD v98[28];

  v98[26] = *MEMORY[0x1E0C80C00];
  v97[0] = CFSTR("min");
  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "converter");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "coefficient");
  objc_msgSend(v0, "numberWithDouble:");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v94;
  v97[1] = CFSTR("hr");
  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3A88], "hours");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "converter");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "coefficient");
  objc_msgSend(v1, "numberWithDouble:");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v91;
  v97[2] = CFSTR("d");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 86400.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v90;
  v97[3] = CFSTR("kcal");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "converter");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "coefficient");
  objc_msgSend(v2, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v87;
  v97[4] = CFSTR("Cal");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "converter");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "coefficient");
  objc_msgSend(v3, "numberWithDouble:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v98[4] = v84;
  v97[5] = CFSTR("cal");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AB0], "calories");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "converter");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "coefficient");
  objc_msgSend(v4, "numberWithDouble:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v98[5] = v81;
  v97[6] = CFSTR("in");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "converter");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "coefficient");
  objc_msgSend(v5, "numberWithDouble:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v98[6] = v78;
  v97[7] = CFSTR("ft");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "converter");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "coefficient");
  objc_msgSend(v6, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v98[7] = v75;
  v97[8] = CFSTR("yd");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "converter");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "coefficient");
  objc_msgSend(v7, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v98[8] = v72;
  v97[9] = CFSTR("mi");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "converter");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "coefficient");
  objc_msgSend(v8, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v98[9] = v69;
  v97[10] = CFSTR("oz");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AE0], "ounces");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "converter");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "coefficient");
  objc_msgSend(v9, "numberWithDouble:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v98[10] = v66;
  v97[11] = CFSTR("lb");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "converter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "coefficient");
  objc_msgSend(v10, "numberWithDouble:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v98[11] = v63;
  v97[12] = CFSTR("st");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AE0], "stones");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "converter");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "coefficient");
  objc_msgSend(v11, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v98[12] = v60;
  v97[13] = CFSTR("mmHg");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3AF0], "millimetersOfMercury");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "converter");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "coefficient");
  objc_msgSend(v12, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v98[13] = v57;
  v97[14] = CFSTR("cmAq");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 98.0664961);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v98[14] = v56;
  v97[15] = CFSTR("atm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 101325.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v98[15] = v55;
  v97[16] = CFSTR("degC");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "converter");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "coefficient");
  objc_msgSend(v13, "numberWithDouble:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v98[16] = v52;
  v97[17] = CFSTR("degF");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "converter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "coefficient");
  objc_msgSend(v14, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v98[17] = v49;
  v97[18] = CFSTR("fl_oz_us");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B08], "fluidOunces");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "converter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "coefficient");
  objc_msgSend(v15, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v98[18] = v46;
  v97[19] = CFSTR("fl_oz_imp");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B08], "imperialFluidOunces");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "converter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "coefficient");
  objc_msgSend(v16, "numberWithDouble:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v98[19] = v43;
  v97[20] = CFSTR("pt_us");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B08], "pints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "converter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "coefficient");
  objc_msgSend(v17, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v98[20] = v40;
  v97[21] = CFSTR("pt_imp");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B08], "imperialPints");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "converter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "coefficient");
  objc_msgSend(v18, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v98[21] = v37;
  v97[22] = CFSTR("cup_us");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "converter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "coefficient");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v98[22] = v20;
  v97[23] = CFSTR("cup_imp");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B08], "metricCups");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "converter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "coefficient");
  objc_msgSend(v21, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v98[23] = v24;
  v97[24] = CFSTR("rad");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3A60], "radians");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "converter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "coefficient");
  objc_msgSend(v25, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v98[24] = v28;
  v97[25] = CFSTR("deg");
  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3A60], "degrees");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "converter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "coefficient");
  objc_msgSend(v29, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v98[25] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 26);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)hk_conversionCoefficient__coefficients;
  hk_conversionCoefficient__coefficients = v33;

}

void __40__NSUnit_HKUnit__hk_conversionConstant___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("degC");
  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "converter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constant");
  objc_msgSend(v0, "numberWithDouble:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v1;
  v18[1] = CFSTR("degF");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "converter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constant");
  objc_msgSend(v2, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("rad");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3A60], "radians");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "converter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constant");
  objc_msgSend(v6, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v9;
  v18[3] = CFSTR("deg");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3A60], "degrees");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "converter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constant");
  objc_msgSend(v10, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)hk_conversionConstant__constants;
  hk_conversionConstant__constants = v14;

}

void __42__NSUnit_HKUnit__hk_prefixForCoefficient___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E389D738;
  v2[1] = &unk_1E389D748;
  v3[0] = CFSTR("da");
  v3[1] = CFSTR("h");
  v2[2] = &unk_1E389D758;
  v2[3] = &unk_1E389D768;
  v3[2] = CFSTR("k");
  v3[3] = CFSTR("M");
  v2[4] = &unk_1E389D778;
  v2[5] = &unk_1E389D788;
  v3[4] = CFSTR("G");
  v3[5] = CFSTR("T");
  v2[6] = &unk_1E389D798;
  v2[7] = &unk_1E389D7A8;
  v3[6] = CFSTR("d");
  v3[7] = CFSTR("c");
  v2[8] = &unk_1E389D7B8;
  v2[9] = &unk_1E389D7C8;
  v3[8] = CFSTR("m");
  v3[9] = CFSTR("µ");
  v2[10] = &unk_1E389D7D8;
  v2[11] = &unk_1E389D7E8;
  v3[10] = CFSTR("n");
  v3[11] = CFSTR("p");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hk_prefixForCoefficient__prefixes;
  hk_prefixForCoefficient__prefixes = v0;

}

@end
